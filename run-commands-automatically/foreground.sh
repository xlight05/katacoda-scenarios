launch.sh
echo "Installing ballerina"
wget https://product-dist.ballerina.io/downloads/0.990.2/ballerina-linux-installer-x64-0.990.2.deb
chmod +x ballerina-linux-installer-x64-0.990.2.deb
dpkg -i ballerina-linux-installer-x64-0.990.2.deb
echo "Installing Cellery"

wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.1/cellery-ubuntu-x64-1.0.0.deb
sudo dpkg -i cellery-ubuntu-x64-1.0.0.deb
chmod +x cellery-ubuntu-x64-1.0.0.deb

wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.1/cellery-1.0.0-SNAPSHOT.jar
sudo cp cellery-1.0.0-SNAPSHOT.jar /usr/lib/ballerina/ballerina-0.990.2/bre/lib
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.1/celleryio.zip
unzip celleryio.zip
sudo cp -r celleryio /usr/lib/ballerina/ballerina-0.990.2/lib/repo/

echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution/installer/scripts/cellery-runtime-deployer
git checkout katakoda
cat katakoda.sh | bash -s -- kubeadm
