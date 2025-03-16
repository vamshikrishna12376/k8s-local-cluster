#!/bin/bash

set -e  # Exit on error

DOCKER_IMAGE="your-dockerhub-username/your-app"

echo "🚀 Building Docker image..."
docker build -t $DOCKER_IMAGE:latest .

echo "🔐 Logging into Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

echo "📤 Pushing Docker image..."
docker push $DOCKER_IMAGE:latest

echo "📦 Deploying to Kubernetes..."
kubectl apply -f manifests/

echo "⏳ Waiting for rollout..."
kubectl rollout status deployment/your-deployment

echo "✅ Deployment successful!"
