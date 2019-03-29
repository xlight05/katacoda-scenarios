# ------------------------------------------------------------------------
#
# Copyright 2019 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
#
# ------------------------------------------------------------------------
export ORG_NAME="wso2-cellery"
export CELLERY_HOME="/usr/bin/cellery"
#sleep 2; wait.sh
start=$(date +%s)
launch.sh
git clone https://github.com/wso2-cellery/distribution.git
# sudo apt-get remove -y cellery
wget https://github.com/xlight05/katacoda-scenarios/releases/download/0.0.2/cellery-ubuntu-x64-0.1.1.deb
sudo dpkg -i cellery-ubuntu-x64-0.1.1.deb
sed -i 's/idp.cellery-system/[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/g' distribution/installer/k8s-artefacts/global-idp/conf/carbon.xml
sed -i 's/idp.cellery-system/[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/g' distribution/installer/k8s-artefacts/global-idp/global-idp.yaml

wget https://gist.githubusercontent.com/xlight05/47f325fd883f97c9d92cb972930deafc/raw/ee4a7fa7f3c29887decebfb64ad4d4006a76c025/katacoda-minobs.sh
chmod +x katacoda-minobs.sh
./katacoda-minobs.sh
rm katacoda-minobs.sh

wget https://gist.githubusercontent.com/xlight05/3fa261aaef8d32dac4bc4b9d90f0dfd4/raw/89daca1a56721b29efaddece2b954b7c7b5de8be/service-nodeport.yaml
sed -i 's/172.17.17.100/[[HOST_IP]]/g' service-nodeport.yaml
kubectl apply -f service-nodeport.yaml
sudo rm service-nodeport.yaml
source <(kubectl completion bash)

wget https://raw.githubusercontent.com/wso2-cellery/mesh-controller/master/samples/pet-store-yamls/pet-backend.yaml
wget https://raw.githubusercontent.com/wso2-cellery/mesh-controller/af77d802c3bb4be87094db0ba98a7c8ea66de160/samples/pet-store-yamls/pet-frontend.yaml
sed -i 's/pet-store.com/[[HOST_SUBDOMAIN]]-2000-[[KATACODA_HOST]].environments.katacoda.com/g' pet-frontend.yaml;
sed -i 's/idp.cellery-system/[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/g' pet-frontend.yaml;

kube-wait.sh
echo "done" >> /root/katacoda-finished
end=$(date +%s)
echo "Took $(($end-$start)) seconds "
