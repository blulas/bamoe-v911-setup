echo Installing BAMOE Maven repository into OpenShift...

# Log into the OpenShift sandbox
source login.sh

echo Setting environment variables...
export APP_IMAGE_VERSION=9.1.2-ibm-0006
export PROJECT_NAME=barry-lulas-dev

echo Getting container image registry route...
oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge
export REGISTRY=`oc get route default-route -n openshift-image-registry --template='{{ .spec.host }}'`
docker login -u `oc whoami` -p `oc whoami --show-token` ${REGISTRY}

echo Installing Maven repository image...
docker image load --input ../../images/bamoe-9.1.2-maven-repository-image.tar.gz
docker tag quay.io/bamoe/maven-repository:${APP_IMAGE_VERSION} ${REGISTRY}/${PROJECT_NAME}/maven-repository:${APP_IMAGE_VERSION}
docker push ${REGISTRY}/${PROJECT_NAME}/maven-repository:${APP_IMAGE_VERSION}

echo Displaying Pods and Routes...
oc get pods
oc get routes
