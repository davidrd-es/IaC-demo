packer init windows/packer
packer validate windows/packer
packer build -only nutanix.windows windows/packer

terraform -chdir=windows/terraform init
terraform -chdir=windows/terraform plan
terraform -chdir=windows/terraform apply -input=false -auto-approve