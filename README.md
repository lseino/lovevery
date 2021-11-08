# Hello World Application
 This application  builds and deploys a custom hello world rails application on a local minikube cluster

 ## Folder Structure

 ## Requirements
- minikube
- kubectl

## How to Run Application
Run the following commands in sequence;
- `git clone repo` 
- `cd repo` 
- `minikube start` 
- `chmod +x deploy.sh && ./deploy.sh`

## To view results
- `minikube service python-app -n helloworld`

## Clean up
- `kubectl delete namespace helloworld`
- clean minikube - `minikube stop && minikube delete`
