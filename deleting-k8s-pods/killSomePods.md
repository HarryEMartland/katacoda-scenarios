
Throuout this scenario we are going to be killing pods so let's get used to the commands we are going to be running.

Running the command `kubectl delete pod -lapp=load-app`{{execute}} will delete all the load-app pods. 
Once you have run this check out the `Pods` tab and watch the new pods come up with different names and ages.

If you just want to delete one pod and don't mind which one you can run ``kubectl delete `k get pods -oname | head -n1` ``{{execute}}