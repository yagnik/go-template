define with_docker
	docker-compose run --rm gotemplate $(1)
endef

login: setup ## get a shell into the container
	docker-compose run --rm --entrypoint /bin/bash gotemplate

docker-compose:
	which docker-compose

docker-build: docker-compose
	docker-compose build --force-rm

docker-clean: docker-compose
	docker-compose down

dep: docker-build #
	$(call with_docker,dep ensure)

setup: clean docker-build dep ## setup environment for development

clean: docker-clean ## clean environment and binaries
	rm -rf bin

fmt: setup ## run go fmt
	$(call with_docker,! gofmt -l .  2>&1 | read)

vet: setup ## run go vet
	$(call with_docker,go vet ./...)

lint: setup ## run go lint
	$(call with_docker,golint -set_exit_status ./...)

test: setup ## run go tests
	$(call with_docker,go test -race -short -cover ./...)

build: setup ## build binaries for the project
	$(call with_docker,gox -output="bin/{{.Dir}}_{{.OS}}_{{.Arch}}" -osarch="linux/amd64 windows/amd64 darwin/amd64" ./cmd/)

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
