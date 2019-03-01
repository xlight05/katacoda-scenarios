#!/bin/bash
echo "Installing ballerina"
wget https://product-dist.ballerina.io/downloads/0.990.3/ballerina-linux-installer-x64-0.990.3.deb
chmod +x ballerina-linux-installer-x64-0.990.3.deb
sudo dpkg -i ballerina-linux-installer-x64-0.990.3.deb

#Installing CLI
echo "Installing Cellery CLI"
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/cellery-ubuntu-x64-0.1.0_3.deb
sudo chmod +x cellery-ubuntu-x64-0.1.0_3.deb
sudo dpkg -i cellery-ubuntu-x64-0.1.0_3.deb
sudo chmod -R 777 ~/.ballerina
sudo apt-get update
sudo apt-get install git
sudo apt-get purge --allow-change-held-packages kubelet kubeadm kubectl docker.io docker-ce
#Installing YAMLS use this only if katacoda supports 
echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution/installer/scripts/cellery-runtime-deployer
git checkout katakoda
cat katacoda-test.sh | bash -s -- kubeadm


Cleanup
cd ~/
sudo rm -r distribution
sudo rm cellery-ubuntu-x64-0.1.0_3.deb
sudo rm ballerina-linux-installer-x64-0.990.3.deb
mkdir workspace
cd workspace

wget https://gist.githubusercontent.com/xlight05/3fa261aaef8d32dac4bc4b9d90f0dfd4/raw/d465bf3559392a7061747afa551b591e605c823c/service-nodeport.yaml
sed -i 's/172.17.17.100/[[HOST_IP]]/g' service-nodeport.yaml
kubectl apply -f service-nodeport.yaml
sudo rm service-nodeport.yaml

source <(kubectl completion bash)