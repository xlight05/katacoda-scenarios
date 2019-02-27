launch.sh
echo "Installing ballerina"
wget https://product-dist.ballerina.io/downloads/0.990.3/ballerina-linux-installer-x64-0.990.3.deb
chmod +x ballerina-linux-installer-x64-0.990.3.deb
sudo dpkg -i ballerina-linux-installer-x64-0.990.3.deb

echo "Installing Cellery CLI"
wget https://github.com/cellery-io/sdk/releases/download/v0.1.0/cellery-ubuntu-x64-0.1.0.deb
sudo dpkg -i cellery-ubuntu-x64-0.1.0.deb
chmod +x cellery-ubuntu-x64-0.1.0.deb

wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/cellery-0.1.0.jar
sudo cp cellery-0.1.0.jar /usr/lib/ballerina/ballerina-0.990.3/bre/lib
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/celleryio.zip
unzip celleryio.zip
sudo cp -r celleryio /usr/lib/ballerina/ballerina-0.990.3/lib/repo/
mkdir -p ~/.ballerina/repo/
sudo cp  -r celleryio ~/.ballerina/repo/


echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution/installer/scripts/cellery-runtime-deployer  
git checkout katakoda
sudo apt-get purge --allow-change-held-packages kubelet kubeadm kubectl docker.io docker-ce
cat katakoda-full.sh | bash -s -- kubeadm