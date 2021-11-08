#!/bin/bash
set -euo pipefail

#variables
namespace=helloworld
IMAGE_NAME=hello-world:1.0

build_app(){
    echo "........................................."
    echo "building docker image in minikube local registry......."
    eval $(minikube docker-env)
    if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "$IMAGE_NAME" ]]; then
        docker image rm $IMAGE_NAME
    fi   
    docker build -t $IMAGE_NAME .
}

deploy_appp(){
    echo "creating hello-world namespace"
    kubectl create namespace $namespace
    echo " deploying application to minikube"
    kubectl apply -f ./k8/helloworld.yml -n $namespace
    echo "deployment completed"

}

build_app
deploy_appp