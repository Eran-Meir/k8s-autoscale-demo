setup:
	cd terraform && terraform init && terraform apply -auto-approve

deploy:
	eval $$(minikube docker-env) && docker build -t stress-app:v1 ./app
	kubectl apply -f kubernetes/

attack:
	@echo "Starting Attack... Press Ctrl+C to stop."
	while true; do curl -s "http://$$(minikube ip):$$(kubectl get svc -n autoscale-demo stress-app-service -o jsonpath='{.spec.ports[0].nodePort}')/stress" > /dev/null; sleep 0.2; done

clean:
	kubectl delete -f kubernetes/
	cd terraform && terraform destroy -auto-approve