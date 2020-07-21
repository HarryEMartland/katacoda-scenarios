
You should have three consoles available to you.
The first is where we are going to run commands and see how Kubernetes (K8s) behaves.
The second is the `Load` tab where we are going to send some requests to our services.
Lastly the `Pods` tab where we can view how many and what status the services pods are in.

The app that is running is called `load-app`.
The main endpoint we are going to use is `/delay/{time}` where we can pass in a `time` for the service to wait before it responds.
There is also a `/health` endpoint which can also be used.
Both endpoints return the node which the request was run on.
Send a request to the app with ``curl http://`minikube ip`:30000/delay/2000``{{execute T1}}.

The app is running behind a service exposed on the NodePort `30000` and ingress on port `80`