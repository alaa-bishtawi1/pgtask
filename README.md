# Progineer Task 1

This repository contains the necessary Terraform and Ansible files to provision and configure specific AWS resources as described in task 1.

## Repository Structure

- `ansible/`: Ansible playbook and related files for configuring the instances.
- `terraform/`: Terraform files for provisioning AWS resources.
- `.env.sample`: Sample environment file.
- `build.sh`: Shell script to build the resources.
- `destroy.sh`: Shell script to destroy the resources.


## Usage

### Prerequisites

- AWS account
- Terraform installed
- Ansible installed

### Instructions

1. **Clone the Repository**
   \`\`\`
   git clone https://github.com/alaa-bishtawi1/pgtask.git
   \`\`\`

2. **Navigate to the Repository**
   \`\`\`
   cd pgtask
   \`\`\`

3. **Build the Resources**
   \`\`\`
   ./build.sh
   \`\`\`

4. **Destroy the Resources (Optional)**
   \`\`\`
   ./destroy.sh
   \`\`\`


