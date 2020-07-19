
apt-get update
apt-get install -y build-essential libssl-dev git zlib1g-dev
git clone https://github.com/giltene/wrk2.git
cd wrk2
make
# move the executable to somewhere in your PATH
cp wrk /usr/local/bin

until kubectl get pods
do
  echo "Waiting for k8s"
  sleep 1
done

kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/98b3c2bcd89b07ef5e555085179ed7c8/raw/7594a6d4153c5d0489f18f0811b7a7d967cf2287/load-app-deployment.yaml