#!/bin/sh

# Configuration for deployment

MONITOR_SENDER_IMAGE=10.157.1.216:5000/monitor-sender:v1-5-g3d1b170
RECEIVER_LOGGER_IMAGE=10.157.1.216:5000/receiver-logger:v1-2-g0d265ac
RECEIVER_LOGGER_FILE_PATH=/tmp/log_path.txt
OVERLAY_PATH=`pwd`/ms-kustomize/overlay
PATCH_FILE=${OVERLAY_PATH}/DaemonSet.yaml
TEMP_DEPLOYMENT_FILE="deployment.yaml"

cp ${PATCH_FILE} ${PATCH_FILE}.bkp

patch_replace () {
	sed -Ei "s|$1|$2|g" "$PATCH_FILE"
}

patch_replace MONITOR_SENDER_IMAGE $MONITOR_SENDER_IMAGE

patch_replace RECEIVER_LOGGER_IMAGE $RECEIVER_LOGGER_IMAGE

patch_replace RECEIVER_LOGGER_FILE_PATH $RECEIVER_LOGGER_FILE_PATH

kustomize build $OVERLAY_PATH > $TEMP_DEPLOYMENT_FILE

ansible-playbook playbook.yml

rm $TEMP_DEPLOYMENT_FILE

mv ${PATCH_FILE}.bkp ${PATCH_FILE}
