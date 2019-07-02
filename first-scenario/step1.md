# Install awesome Kyma CLI

`curl -Lo kyma.tar.gz "https://github.com/kyma-project/cli/releases/download/1.2.2/kyma_Linux_x86_64.tar.gz" \
&& mkdir kyma-release && tar -C kyma-release -zxvf kyma.tar.gz && chmod +x kyma-release/kyma && sudo mv kyma-release/kyma /usr/local/bin \
&& rm -rf kyma-release kyma.tar.gz`{{execute}}


# Provision minikube that fulfills technical requirements for kyma

`kyma provision minikube`{{execute}}

# Start installation

`kyma install`{{execute}}

# Now some fun

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

