# ms-deployment
Deployment scripts and tools for automation of ms (monitor-sender, receiver-logger) services.

## ms-kustomize
Kustomize overlay tool for generating kubernetes template suitable for deployment in EKS.

## ansible
playbook.yml is used to build kustomize

## deploy
Deploy script is used to deploy the kubernetes template

## cicd-update
CICD update script is for jenkins to automatically update the tags for builds that are deployed.

## Jenkins CICD pipeline
![Design](MS-sample-Designs.png?raw=true "Title")
