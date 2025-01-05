#!/bin/bash

#!/bin/bash

echo Installing Keycloak...

# Log into the OpenShift sandbox
source login.sh

_ENV_PROPS=./env.properties
if [[ ! -f ${_ENV_PROPS} ]]; then
  echo "===>> Error, file ${_ENV_PROPS} not in folder $(pwd)"
  exit 1
fi

source ${_ENV_PROPS}

#-----------------------
# keycloak
echo "===>> Create Keycloak resources"
kubectl create configmap -n ${_NS} ${_REALM_NAME} --from-file=${_REALM_NAME}.json=./keycloak/custom-realm.json 
kubectl apply -f ./keycloak/${_CR_NAME_DEP_KC}.yaml 
