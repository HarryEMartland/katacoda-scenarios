

If requests are taking longer than `terminationGracePeriodSeconds` the application won't gracefully shutdown and K8s will send `SIGKILL`.
This will cut off requests mid-flight.

To test this, change the load script delay to be 15000ms (15s) by running ``artillery quick -d 600 -r 1 http://`minikube ip`:30000/delay/15000``{{execute interrupt T2}}.
Now when we kill a pod with ``kubectl delete `kubectl get pods -oname | head -n1` ``{{execute T1}} you will notice there are some errors.

To change the load test back to 9s run ``artillery quick -d 600 -r 1 http://`minikube ip`:30000/delay/9000``{{execute interrupt T2}}.

We are also relying on k8s to check the health of the application before putting it into traffic.
If we remove the health checks and delete a pod, the new pod is put into traffic too soon you will see errors in the `Load` tab.  
To remove the health checks run this command `kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/3c5d64cc47cc7eb4d0bdc739736ee6ad/raw/load-app-deployment-no-health.yaml`{{execute T1}}.
Check the `Pods` tab that the old pods have terminated.

To reset the application back to normal run `kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/98b3c2bcd89b07ef5e555085179ed7c8/raw/load-app-deployment.yaml`{{execute T1}}.