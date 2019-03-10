#!/bin/bash
# echo "Installing ballerina"
# wget https://product-dist.ballerina.io/downloads/0.990.3/ballerina-linux-installer-x64-0.990.3.deb
# chmod +x ballerina-linux-installer-x64-0.990.3.deb
# sudo dpkg -i ballerina-linux-installer-x64-0.990.3.deb

# #Installing CLI
# echo "Installing Cellery CLI"
# wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/cellery-ubuntu-x64-0.1.0_3.deb
# sudo chmod +x cellery-ubuntu-x64-0.1.0_3.deb
# sudo dpkg -i cellery-ubuntu-x64-0.1.0_3.deb
# sudo chmod -R 777 ~/.ballerina
# sudo apt-get update
# sudo apt-get install git
# sudo apt-get purge --allow-change-held-packages kubelet kubeadm kubectl docker.io docker-ce
#Installing YAMLS use this only if katacoda supports 
launch.sh
echo "Installing Cellery runtime"
git clone https://github.com/xlight05/distribution
cd distribution
git checkout katakoda
#sed -i 's/wso2-apim/[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/g' installer/k8s-artefacts/global-apim/conf/carbon.xml; 
cd installer/scripts/cellery-runtime-deployer

cat katakoda-full.sh | bash -s -- kubeadm


#Cleanup
cd ~/
cat distribution/installer/k8s-artefacts/global-apim/conf/carbon.xml
sudo rm -r distribution
# sudo rm cellery-ubuntu-x64-0.1.0_3.deb
# sudo rm ballerina-linux-installer-x64-0.990.3.deb
mkdir workspace
cd workspace

wget https://gist.githubusercontent.com/xlight05/3fa261aaef8d32dac4bc4b9d90f0dfd4/raw/43cd47d6e5c3e9b61cf2c8e3a1821c3669157b08/service-nodeport.yaml
sed -i 's/172.17.17.100/[[HOST_IP]]/g' service-nodeport.yaml
wget https://gist.githubusercontent.com/xlight05/73f50180840c40d25f9c9c7865054090/raw/8bed684901773642e938fde75e6ef222c6c6a716/ingress.yaml
sed -i 's/HOST_SUBDOMAIN/[[HOST_SUBDOMAIN]]/g' ingress.yaml; sed -i 's/KATACODA_HOST/[[KATACODA_HOST]]/g' ingress.yaml; 
kubectl apply -f service-nodeport.yaml
kubectl apply -f ingress.yaml -n cellery-system
sudo rm service-nodeport.yaml

source <(kubectl completion bash)

