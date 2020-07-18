#!/bin/bash

echo "Waiting for K8s"
until kubectl get pods&> /dev/null
do
  sleep 1
done

sleep 3

echo "Waiting for Application to be healthy"

kubectl wait --for=condition=available deployment/load-app

kubectl get pods

echo "Finished"