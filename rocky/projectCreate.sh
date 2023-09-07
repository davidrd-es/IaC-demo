packer init rocky/packer
packer validate rocky/packer
packer build -only nutanix.rocky rocky/packer

ansible-playbook /home/drd/repo/IaC/rocky/ansible/main.yaml   
