
alias k=kubectl

echo "Installing Tools"
apt-get update
apt-get install -y libssl-dev
git clone https://github.com/giltene/wrk2.git
cd wrk2
make
# move the executable to somewhere in your PATH
cp wrk /usr/local/bin

echo "Starting Minikube"
minikube start
echo "Enabling ingress"
minikube addons enable ingress

echo "Deploying App"
kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/98b3c2bcd89b07ef5e555085179ed7c8/raw/7594a6d4153c5d0489f18f0811b7a7d967cf2287/load-app-deployment.yaml

echo "Waiting for app"

kubectl wait --for=condition=available deployment/load-app

echo "Finished"

kubectl get pods