Script environment is available here: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

# Setup K8s cluster

`launch.sh`{{execute}}

and make sure it has tiller on it
`kubectl apply -f https://raw.githubusercontent.com/kyma-project/kyma/1.3.0/installation/resources/tiller.yaml`{{execute}}

validate if tiller is ready `kubectl get pods --all-namespaces`{{execute}}

# Trigger installation

`kubectl apply -f https://github.com/kyma-project/kyma/releases/download/1.3.0/kyma-installer-cluster.yaml`{{execute}}


# Installation progress

Check if Kyma installer and tiller are running:
`kubectl get pods --all-namespaces`{{execute}}

Check installation status
`kubectl -n default get installation/kyma-installation -o jsonpath="{'Status: '}{.status.state}{', description: '}{.status.description}"`{{execute}}

Check logs of the installer if you think something is wrong
`kubectl -n kyma-installer logs -l 'name=kyma-installer'`{{execute}}

# Access cluster

Get Console UI host name
`kubectl get virtualservice core-console -n kyma-system -o jsonpath='{ .spec.hosts[0] }'`{{execute}}

Get login/password
`kubectl get secret admin-user -n kyma-system -o jsonpath="{.data.password}" | base64 --decode`{{execute}}



