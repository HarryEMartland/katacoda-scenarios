

If requests are taking longer than `terminationGracePeriodSeconds` the application won't gracefully shutdown and K8s will send `SIGKILL`.
This will cut off requests mid-flight.




To reset the application back to normal run `kubectl apply -f https://gist.githubusercontent.com/HarryEMartland/98b3c2bcd89b07ef5e555085179ed7c8/raw/load-app-deployment.yaml`{{execute}}.