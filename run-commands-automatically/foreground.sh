launch.sh
echo "Installing ballerina"
wget https://product-dist.ballerina.io/downloads/0.990.3/ballerina-linux-installer-x64-0.990.3.deb
chmod +x ballerina-linux-installer-x64-0.990.3.deb
dpkg -i ballerina-linux-installer-x64-0.990.3.deb
echo "Installing Cellery"

wget https://github.com/cellery-io/sdk/releases/download/v0.1.0/cellery-ubuntu-x64-0.1.0.deb
sudo dpkg -i cellery-ubuntu-x64-0.1.0.deb
chmod +x cellery-ubuntu-x64-0.1.0.deb

wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.1/cellery-0.1.0.jar
sudo cp cellery-0.1.0.jar /usr/lib/ballerina/ballerina-0.990.3/bre/lib
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.1/celleryio.zip
unzip celleryio.zip
sudo cp -r celleryio /usr/lib/ballerina/ballerina-0.990.3/lib/repo/
mkdir -p ~/.ballerina/repo/
sudo cp  -r celleryio ~/.ballerina/repo/


echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution/installer/scripts/cellery-runtime-deployer
git checkout katakoda
cat katakoda.sh | bash -s -- kubeadm

kubectl apply -f https://gist.githubusercontent.com/xlight05/43fd34f12e161b0998ef349f1de0a947/raw/24d5d8905a550be4be7e058bf340308552ff5328/istio-pilot.yaml