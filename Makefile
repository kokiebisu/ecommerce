# start the docker dependency containers
.PHONY: start-deps
start-deps:
	cd packages && docker-compose down && docker-compose up --build --force-recreate --no-deps

# stops the docker dependency containers
.PHONY: start-deps
stop-deps:
	cd packages && docker-compose down

# output terraform infra in .txt file
.PHONY: infra-output
infra-output:
	cd terraform && terraform plan -out plan.out && terraform show -json plan.out > plan.json && rm plan.out

# setup terraform infrastructure
.PHONY: infra-apply
infra-apply:
	cd terraform && terraform apply

# plan out the terraform infrastructure
.PHONY: infra-plan
infra-plan:
	cd terraform && terraform plan

# updates local state
.PHONY: infra-update-state
infra-update-state:
	cd terraform && terraform refresh

# destroy terraform infrastructure
.PHONY: infra-destroy
infra-destroy:
	cd terraform && terraform destroy