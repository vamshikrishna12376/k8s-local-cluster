#!/bin/bash

set -e

echo "🔥 Deleting Kubernetes resources..."
kubectl delete -f manifests/

echo "🛑 Stopping Minikube..."
minikube delete

echo "✅ Cleanup complete!"
