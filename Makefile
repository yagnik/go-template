define with_docker
	docker-compose -p client_devcontainer -f .devcontainer/docker-compose.yaml $(1)
endef

help: ## display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## set up go mod dependancies
	go mod download

test: ## run go tests
	go test -race -short -cover ./...
	golint -set_exit_status ./...
	go vet ./...
	go mod tidy
	go mod verify

build: ## build binaries for the project
	gofmt -w -s -d .
	go build -race -v ./pkg/...
	go build -race -v -o bin/client ./cmd/...

shell: docker-start ## get in shell where app
	$(call with_docker, exec client /bin/bash)

docker-compose:
	@docker-compose version

docker-start: docker-compose
	$(call with_docker, up -d)

docker-clean: docker-compose ## clean docker containers
	$(call with_docker, down)
	$(call with_docker, rm)

docker-rebuild: docker-compose ## rebuild docker containers of the project
	$(call with_docker, build)

docker-setup: docker-start ## setup salt with docker containers for testing
	$(call with_docker, exec client make setup)

docker-test: docker-setup ## run salt tests inside container
	$(call with_docker, exec client make test)

.PHONY: test build