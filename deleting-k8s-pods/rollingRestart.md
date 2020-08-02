
For this example it is best to have a few more pods running.
Let's increase the service to have 5 pods by running `kubectl scale load-app --replicas=5`{{execute T1}}.

Now what happens if we need to restart all the pods?
This is a lot of pods to restart by hand, luckily we can use the deployment to our advantage.
By making a change to the deployment which will cause the pods to be redeployed we can cause them all to be deleted and new ones created in their place.
The below command updates our deployment to add a label called `restarted-at` to the pods.
The label's value is the timestamp that the command was run.
This allows us to see when the pods were restarted retroactively.
 
`kubectl patch deployment load-app --type='json' -p="[{\"op\":\"replace\",\"path\":\"/spec/template/metadata/labels/restarted-at\",\"value\":\"`date +"%s"`\"}]"`{{execute T1}}

One of the benefits of using this technique for restarting pods is that the rolling update stratergy is used.
If we set this to zero unavailable new pods will be brought up before old ones are removed.