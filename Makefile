# define with_docker
# 	@docker run -it
# endef

.PHONY: all dep build clean test coverage coverhtml lint

all: build

lint: ## Lint the files
	@golint -set_exit_status .
# vet
# lint
# fmt


test: ## Run unittests
	@go test -short .

race: dep ## Run data race detector
	@go test -race -short  .

msan: dep ## Run memory sanitizer
	@go test -msan -short  .

coverage: ## Generate global code coverage report

dep: ## Get the dependencies
	@dep ensure

build: dep ## Build the binary file
	@go build -i -v
