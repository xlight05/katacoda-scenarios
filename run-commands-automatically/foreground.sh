#!/bin/bash

launch.sh
set -x
echo "Installing ballerina"
wget https://product-dist.ballerina.io/downloads/0.990.3/ballerina-linux-installer-x64-0.990.3.deb
chmod +x ballerina-linux-installer-x64-0.990.3.deb
sudo dpkg -i ballerina-linux-installer-x64-0.990.3.deb

echo "Installing Cellery CLI"
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/cellery-ubuntu-x64-0.1.0_3.deb
sudo chmod +x cellery-ubuntu-x64-0.1.0_3.deb
sudo dpkg -i cellery-ubuntu-x64-0.1.0_3.deb
sudo chmod -R 777 ~/.ballerina

echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution/installer/scripts/cellery-runtime-deployer  
git checkout katakoda
#sudo apt-get purge --allow-change-held-packages kubelet kubeadm kubectl docker.io docker-ce
# cat katakoda-full.sh | bash -s -- kubeadm