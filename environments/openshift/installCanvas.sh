#!/bin/bash

echo Installing BAMOE Canvas into OpenShift...

# Log into the OpenShift sandbox
source login.sh

echo Setting environment variables...
export APP_PART_OF=bamoe-canvas
export APP_NAME_EXTENDED_SERVICES=bamoe-canvas-extended-services
export APP_NAME_CORS_PROXY=bamoe-canvas-cors-proxy
export APP_NAME_BAMOE_CANVAS=bamoe-canvas-ui
export APP_IMAGE_VERSION=9.1.1-ibm-0003

echo Installing Extended Services...
oc new-app quay.io/bamoe/extended-services:$APP_IMAGE_VERSION --name=$APP_NAME_EXTENDED_SERVICES
oc create route edge --service=$APP_NAME_EXTENDED_SERVICES
oc label services/$APP_NAME_EXTENDED_SERVICES app.kubernetes.io/part-of=$APP_PART_OF
oc label routes/$APP_NAME_EXTENDED_SERVICES app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_EXTENDED_SERVICES app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_EXTENDED_SERVICES app.openshift.io/runtime=golang

echo Installing CORS Proxy...
oc new-app quay.io/bamoe/cors-proxy:$APP_IMAGE_VERSION --name=$APP_NAME_CORS_PROXY
oc create route edge --service=$APP_NAME_CORS_PROXY
oc label services/$APP_NAME_CORS_PROXY app.kubernetes.io/part-of=$APP_PART_OF
oc label routes/$APP_NAME_CORS_PROXY app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_CORS_PROXY app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_CORS_PROXY app.openshift.io/runtime=nodejs

echo Installing Canvas UI...
oc new-app quay.io/bamoe/canvas:$APP_IMAGE_VERSION --name=$APP_NAME_BAMOE_CANVAS -e KIE_SANDBOX_EXTENDED_SERVICES_URL=https://$(oc get route $APP_NAME_EXTENDED_SERVICES --output jsonpath={.spec.host}) -e KIE_SANDBOX_CORS_PROXY_URL=https://$(oc get route $APP_NAME_CORS_PROXY --output jsonpath={.spec.host})
oc create route edge --service=$APP_NAME_BAMOE_CANVAS
oc label services/$APP_NAME_BAMOE_CANVAS app.kubernetes.io/part-of=$APP_PART_OF
oc label routes/$APP_NAME_BAMOE_CANVAS app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_BAMOE_CANVAS app.kubernetes.io/part-of=$APP_PART_OF
oc label deployments/$APP_NAME_BAMOE_CANVAS app.openshift.io/runtime=js

echo Displaying Pods and Routes...
oc get pods
oc get route $APP_NAME_BAMOE_CANVAS --output jsonpath={.spec.host}; 
