define with_docker
	docker-compose run gotemplate dep ensure && dep status && $(1)
endef

docker-compose:
	which docker-compose

docker-build: docker-compose
	docker-compose build --force-rm

docker-clean: docker-compose
	docker-compose down

setup: docker-build

clean: docker-clean

fmt: setup
	$(call with_docker,gofmt -s .)

lint: setup
	$(call with_docker,golint -set_exit_status .)

test: setup
	$(call with_docker,go test -short .)
	$(call with_docker,go test -race -short .)
	$(call with_docker,go test -msan -short .)

build: setup
	$(call with_docker,go build -i -v -o bin/main cmd/main.go)
