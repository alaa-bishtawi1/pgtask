#!/bin/bash
cd terraform/
terraform init
terraform apply -auto-approve

# Extract the EC2 IP addresses for DB and App servers using the  output

DB_PUBLIC_IP=$(terraform output db_instance_public_ip | tr -d '"')
APP_PUBLIC_IP=$(terraform output app_instance_public_ip | tr -d '"')
DB_LOCAL_IP=$(terraform output db_instance_local_ip | tr -d '"')
APP_LOCAL_IP=$(terraform output app_instance_local_ip | tr -d '"')

cd ../

if [ -s .env ]; then
  source .env
else
  source .env.sample
fi

postgres_password=${POSTGRES_PASSWORD}
postgres_user=${POSTGRES_USER}
postgres_db=${POSTGRES_DB}
postgres_port=${POSTGRES_PORT}
postgres_host=${POSTGRES_HOST}
postgres_db_host=${DB_LOCAL_IP}

cd ansible/



# Create the YAML content
cat <<EOLL > group_vars/all.yml
postgres_password: "$postgres_password"
postgres_user: "$postgres_user"
postgres_db: "$postgres_db"
postgres_port: "$postgres_port"
postgres_host: "$postgres_host"
postgres_db_host: $postgres_db_host
app_private_ip: $APP_LOCAL_IP
db_private_ip: $DB_LOCAL_IP
EOLL



# Create the Ansible inventory file dynamically
cat <<EOL > inventory.ini
[db]
db_server1 ansible_ssh_host=${DB_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_port=22
[app]
app_server1 ansible_ssh_host=${APP_PUBLIC_IP} ansible_user=ubuntu ansible_ssh_port=22
EOL

sleep 15

# Run the Ansible playbook
ansible-playbook main.yml 
