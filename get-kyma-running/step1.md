Script environment is available here: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

# Install Kyma CLI

Best installation experience is with our Kyma CLI so first you need to install it. Here you can find all installation instructions https://github.com/kyma-project/cli#installation as below one is Linux oriented:
`curl -Lo kyma.tar.gz "https://github.com/kyma-project/cli/releases/download/1.2.2/kyma_Linux_x86_64.tar.gz" \
&& mkdir kyma-release && tar -C kyma-release -zxvf kyma.tar.gz && chmod +x kyma-release/kyma && sudo mv kyma-release/kyma /usr/local/bin \
&& rm -rf kyma-release kyma.tar.gz`{{execute}}


# Minikube start

Start minikube using the CLI because you need a custom configuration applied to it to make sure Kyma can be installed on top
`kyma provision minikube`{{execute}}

# Kyma installation

Start Kyma installation and go grab a coffee, it may take up to 10 minutes:
`kyma install`{{execute}}

You can also trigger installation with full logs dump to see how it is going:
`kyma install  --verbose`{{execute}}

# Is it there yet

Check out all Pods status if you think the installation got stuck:
`kubectl get pods --all-namespaces`{{execute}}

All good? enjoy!



