

This time lets only kill one pod with ``kubectl delete `k get pods -oname | head -n1` ``{{execute}}.
Keep an eye on the `Load` tab and watch how the status codes remain `200`.

K8s is clever enough to take the pod out of traffic before stopping it.
It also waits till the app gracefully shuts down by sending a `SIGTERM` before a `SIGKILL` to the app.
K8s will wait for the app to exit itself after the `SIGTERM` signal before sending `SIGKILL` by default this is 3 seconds.
The load app is running a NodeJS express app which interprets these signals correctly and wait to finish all requests before exiting.
You can override how long K8s waits before sending `SIGKILL` by setting `terminationGracePeriodSeconds`, this is set to 10 seconds in this scenario.
For more information check out this [Google blog post](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-terminating-with-grace).

