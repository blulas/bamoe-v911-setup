#!/bin/bash

echo Installing BAMOE Postgres...

# Log into the OpenShift sandbox
source login.sh

_ENV_PROPS=./env.properties
if [[ ! -f ${_ENV_PROPS} ]]; then
  echo "===>> Error, file ${_ENV_PROPS} not in folder $(pwd)"
  exit 1
fi

source ${_ENV_PROPS}

#-----------------------
# postgres
echo "===>> Create Postgres resources"
#kubectl create configmap -n ${_NS} pg-init-db --from-file=init.sql=./postgres/${_INIT_DB_FILE}
kubectl apply -f ./postgres/${_CR_NAME_PV}.yaml 
kubectl apply -f ./postgres/${_CR_NAME_PVC}.yaml 
kubectl apply -f ./postgres/${_CR_NAME_SECR_PWD_POSTGRES}.yaml 
kubectl apply -f ./postgres/${_CR_NAME_DEP_POSTGRES}.yaml 
