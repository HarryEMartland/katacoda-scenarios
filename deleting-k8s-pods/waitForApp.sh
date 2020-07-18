#!/bin/bash

echo "Waiting for K8s"
until kubectl get pods > /dev/null
do
  sleep 1
done

echo "Waiting for Application"

kubectl wait --for=condition=available deployment/load-app

kubectl get pods

echo "Finished"