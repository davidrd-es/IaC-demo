git clone https://github.com/nutanix/nutanix.ansible.git
ansible-galaxy collection build
ansible-galaxy collection install nutanix-ncp-1.9.0.tar.gz

ansible-playbook iaas.yml        