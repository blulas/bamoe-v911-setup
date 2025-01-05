#!/bin/bash

echo Installing BAMOE PGAdmin...

# Log into the OpenShift sandbox
source login.sh

_ENV_PROPS=./env.properties
if [[ ! -f ${_ENV_PROPS} ]]; then
  echo "===>> Error, file ${_ENV_PROPS} not in folder $(pwd)"
  exit 1
fi

source ${_ENV_PROPS}

#-----------------------
# pgadmin
echo "===>> Create PGAdmin resources"
kubectl create configmap -n ${_NS} pgadmin-config --from-file=servers.json=./pgadmin/servers.json
kubectl create configmap -n ${_NS} pgadmin-passwd --from-file=my-passwords.pgpass=./pgadmin/my-passwords.pgpass
kubectl apply -f ./pgadmin/${_CR_NAME_DEP_PGADMIN}.yaml 
