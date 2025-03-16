# Variables
CLUSTER_NAME = dev-cluster
KUBECTL = kubectl
KIND = kind

# Create Kind cluster
create-cluster:
	$(KIND) create cluster --name $(CLUSTER_NAME) --config kind-config.yaml

# Delete Kind cluster
delete-cluster:
	$(KIND) delete cluster --name $(CLUSTER_NAME)

# Deploy application
deploy:
	$(KUBECTL) apply -f manifests/

# Delete application
delete-app:
	$(KUBECTL) delete -f manifests/

# Show running pods
get-pods:
	$(KUBECTL) get pods -o wide

# Show services
get-services:
	$(KUBECTL) get services

# Port-forward Nginx deployment
port-forward:
	$(KUBECTL) port-forward deployment/nginx-deployment 8080:80

# Apply Ingress Controller (for Kind)
install-ingress:
	$(KUBECTL) apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# Cleanup everything
cleanup:
	$(KUBECTL) delete all --all
