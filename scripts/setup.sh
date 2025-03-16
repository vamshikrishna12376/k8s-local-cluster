#!/bin/bash

set -e  # Exit script on error

# Check if Minikube is installed
if ! command -v minikube &> /dev/null; then
    echo "Minikube not found! Installing..."
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
    sudo install minikube-darwin-amd64 /usr/local/bin/minikube
fi

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=docker

# Enable Ingress (optional)
minikube addons enable ingress

# Install kubectl if not found
if ! command -v kubectl &> /dev/null; then
    echo "kubectl not found! Installing..."
    brew install kubectl
fi

# Install Helm (optional)
if ! command -v helm &> /dev/null; then
    echo "Helm not found! Installing..."
    brew install helm
fi

# Verify cluster status
kubectl cluster-info
kubectl get nodes

echo "✅ Kubernetes cluster is ready!"
