# /bin/sh

cd ..
ANSIBLE_PATH=$(pwd)/ansible
TERRAFORM_PATH=$(pwd)/terraform

echo "Getting information from terraform"
cd $TERRAFORM_PATH
PUBLIC_IP=$(terraform output vip)
PASSWORD=$(terraform output admin-password)

cd $ANSIBLE_PATH
sed -i "8s/.*/REGISTRY_PASSWORD: $PASSWORD/" vars/webserver_vars.yaml
sed -i "3s/.*/  hosts: $PUBLIC_IP/" playbook.yaml
echo $PUBLIC_IP >> hosts
az aks get-credentials --resource-group rg-dalvarezh --name k8s
ansible-playbook -i hosts playbook.yaml --key-file ~/.ssh/id_rsa
ansible-playbook -i hosts k8s_playbook.yaml --key-file ~/.ssh/id_rsa