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

#sleep 1; wait.sh

launch.sh
wget https://raw.githubusercontent.com/wso2-cellery/distribution/master/installer/packer/minimum-runtime-images/script/cellery.sh
sed -i 's/sleep 60/sleep 1/g' cellery.sh
sed -i 's/sleep 120/sleep 1/g' cellery.sh
chmod +x cellery.sh
./cellery.sh
rm cellery.sh

wget https://gist.githubusercontent.com/xlight05/3fa261aaef8d32dac4bc4b9d90f0dfd4/raw/89daca1a56721b29efaddece2b954b7c7b5de8be/service-nodeport.yaml
sed -i 's/172.17.17.100/[[HOST_IP]]/g' service-nodeport.yaml
kubectl apply -f service-nodeport.yaml
sudo rm service-nodeport.yaml
source <(kubectl completion bash)

wget https://raw.githubusercontent.com/wso2-cellery/mesh-controller/master/samples/pet-store-yamls/pet-backend.yaml
wget https://raw.githubusercontent.com/wso2-cellery/mesh-controller/master/samples/pet-store-yamls/pet-frontend.yaml
sed -i 's/pet-store.com/[[HOST_SUBDOMAIN]]-2000-[[KATACODA_HOST]].environments.katacoda.com/g' pet-frontend.yaml;