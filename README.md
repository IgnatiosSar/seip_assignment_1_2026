# SEIP Assignment 1
This repository contains the code of a simple Node.js application and the required manifests to orchestrate and deploy the application locally using Minikube.
## Prerequisites
* Docker Engine
* Minikube
* kubectl
## Cloning the Repository
Clone using HTTPS:
```bash 
git clone https://github.com/IgnatiosSar/seip_assignment_1_2026.git
```
Or clone using SSH:
```bash
git clone git@github.com:IgnatiosSar/seip_assignment_1_2026.git
```
Then enter the root directory of the repository:
```bash
cd seip_assignment_1_2026
```
## Spinning up Minikube
Ensure your Docker Engine is running (you can easily do this by opening Docker Desktop) before starting Minikube.

Assuming you have Minikube installed, run:
```bash
minikube start
```
## Applying k8s Manifests
After spinning up Minikube, you can apply all manifests using:
```bash
kubectl apply -f k8s/
```
Alternatively, you can apply them manually in the following sequence:
```bash
cd k8s
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
Note: The order between configmap and secret doesn't matter.
## Interacting with the Endpoints
Because the service type is set to ClusterIP, in order to access the endpoints you must first map the ClusterIP service to your localhost:
```bash
kubectl port-forward service/echo-api-service 8080:80
```
Now you can interact with the following endpoints using your browser or using curl:
* Main endpoint: http://localhost:8080/
* Secure endpoint: http://localhost:8080/secure-config
* Health check endpoint: http://localhost:8080/health