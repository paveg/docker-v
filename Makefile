IMAGE_NAME=docker-v
.DEFAULT_GOAL := help

.PHONY: build v run.v

build: ## Build docker image
	docker build -f ./Dockerfile -t $(IMAGE_NAME):latest .

v: ## Run v installed shell
	docker run -it $(IMAGE_NAME):latest

run.v: ## Run V REPL
	docker run -it $(IMAGE_NAME):latest v

help: ## Show options
	@grep -E '^[a-zA-Z_-{\.}]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
