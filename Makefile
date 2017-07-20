.PHONY: build test build-image push-image

all: build test build-image

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo

test: build
	go test

build-image: build
	sudo docker build -t quay.io/postmates/drone-slack:latest .

push-image: build-image
	sudo docker push "quay.io/postmates/drone-slack:latest" 
