start-deps:
	cd packages && docker-compose down && docker-compose up --build --force-recreate --no-deps

stop-deps:
	cd packages && docker-compose down

infra-output:
	cd terraform && terraform plan -out plan.out && terraform show -json plan.out > plan.json && rm plan.out

infra-apply:
	cd terraform && terraform apply

infra-plan:
	cd terraform && terraform plan

infra-update-state:
	cd terraform && terraform refresh

infra-destroy:
	cd terraform && terraform destroy