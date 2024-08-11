.PHONY: minikube,helm,run,stop,rerun

minikube:
	minikube start

helm: minikube
	kubectl create namespace m && helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/ && helm repo update && helm install nginx ingress-nginx/ingress-nginx --namespace m -f nginx-ingress.yaml

run: helm
	kubectl apply -f ./manifests

stop:
	kubectl delete all --all && minikube stop && minikube delete

rerun: stop && run
