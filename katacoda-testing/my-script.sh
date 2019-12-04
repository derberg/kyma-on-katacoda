#echo "Upgrade to Helm 1.16.0"
curl -LO https://get.helm.sh/helm-"v2.16.0"-linux-amd64.tar.gz
tar -xzvf helm-"v2.16.0"-linux-amd64.tar.gz
mv ./linux-amd64/{helm,tiller} /usr/local/bin

function waitForMinikubeToBeUp() {
    set +o errexit

    log "Waiting for minikube to be up..." green

	LIMIT=30
    COUNTER=0

    while [ ${COUNTER} -lt ${LIMIT} ] && [ -z "$STATUS" ]; do
      (( COUNTER++ ))
      log "Keep calm, there are $LIMIT possibilities and so far it is attempt number $COUNTER" green
      STATUS="$(kubectl get namespaces || :)"
      sleep 1
    done

    # In case apiserver is not available get minikube logs
    if [[ -z "$STATUS" ]]; then
      cat /var/lib/minikube/minikube.err
    fi

    set -o errexit

    log "Minikube is up" green
}

waitForMinikubeToBeUp

kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account=tiller

kubectl get deploy -n kube-system | grep tiller-deploy