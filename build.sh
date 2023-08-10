#!/bin/bash
cd terraform/
terraform init
terraform apply -auto-approve
# Extract the EC2 IP addresses for DB and App servers using the correct output names
DB_IP=$(terraform output db_instance_ip | tr -d '"')
APP_IP=$(terraform output app_instance_ip | tr -d '"')
POSTGRES_DB_HOST=$(terraform output db_instance_ip | tr -d '"')


cd ../ansible/
FILE_PATH="group_vars/all.yml"
sed -i '' "s/^postgres_db_host: .*/postgres_db_host: ${POSTGRES_DB_HOST}/" group_vars/all.yml
# Create the Ansible inventory file dynamically
cat <<EOL > inventory.txt
[db]
db_server1 ansible_ssh_host=${DB_IP} ansible_user=ubuntu ansible_ssh_port=22
[app]
app_server1 ansible_ssh_host=${APP_IP} ansible_user=ubuntu ansible_ssh_port=22
EOL

# Navigate to the Ansible directory
echo "DB IP: ${DB_IP}"

echo "APP IP: ${APP_IP}"

ssh-keyscan ${DB_IP} >> ~/.ssh/known_hosts
ssh-keyscan ${APP_IP} >> ~/.ssh/known_hosts

# Run the Ansible playbook
ansible-playbook main.yml -i inventory.txt 
