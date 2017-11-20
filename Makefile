define with_docker
	docker-compose run --rm gotemplate $(1)
endef

docker-compose:
	which docker-compose

docker-build: docker-compose
	docker-compose build --force-rm

docker-clean: docker-compose
	docker-compose down

dep: docker-build
	$(call with_docker,dep ensure)

setup: docker-build dep

clean: docker-clean
	rm -rf bin

fmt: setup
	$(call with_docker,gofmt -s .)

lint: setup
	$(call with_docker,golint -set_exit_status .)

test: setup
	$(call with_docker,go test -short ./..)
	$(call with_docker,go test -race -short .)
	$(call with_docker,go test -msan -short .)
	$(call with_docker,go test -cover -short .)

build: setup
	$(call with_docker,go build -i -v -o bin/main cmd/main.go)
