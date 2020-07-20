#!/bin/bash

setup()
{
echo "Installing Tools"
npm install -g artillery --allow-root --unsafe-perm=true &> /dev/null

echo "Starting Minikube"
minikube start &> /dev/null
echo "Enabling ingress"
minikube addons enable ingress &> /dev/null

echo "Deploying App"
kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/98b3c2bcd89b07ef5e555085179ed7c8/raw/load-app-deployment.yaml &> /dev/null

echo "Waiting for app"

kubectl wait --for=condition=available deployment/load-app --timeout=60s

echo "Finished"

kubectl get pods
}

setup
