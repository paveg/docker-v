IMAGE_NAME=docker-v

.PHONY: build v

build:
	docker build -f ./Dockerfile -t $(IMAGE_NAME):latest .

v:
	docker run -it $(IMAGE_NAME):latest v

