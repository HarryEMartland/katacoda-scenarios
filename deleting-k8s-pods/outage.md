
What happens if we kill all the pods for a service.

Check the `Load` tab to see that the response codes are coming back as 200s. 
It should look something like this;

```
  Scenarios launched:  10
  Scenarios completed: 10
  Requests completed:  10
  Mean response/sec: 1.08
  Response time (msec):
    min: 32.6
    max: 37.3
    median: 33.9
    p95: 37.3
    p99: 37.3
  Codes:
    200: 10
```

Next check that we have two pods running. 
The `Pods` tab should look like this but with different names;

```
load-app-6fb984d9cb-nmmtk   1/1     Running   0          5m47s
load-app-6fb984d9cb-rmzlm   1/1     Running   0          5m47s
```

Now if we run `kubectl delete pod -lapp=load-app`{{execute T1}} and delete all our pods we should start seeing some ECONNREFUSED errors.
This would be returned to your customers and give them a poor experience.

Once the pods are back up the status codes will go back to being `200`.
You can confirm the status of the pods in the `Load` tab.