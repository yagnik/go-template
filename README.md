# Go Template
[![Go Report Card](https://goreportcard.com/badge/github.com/yagnik/go-template)](https://goreportcard.com/report/github.com/yagnik/go-template)
[![Go Doc](https://img.shields.io/badge/godoc-reference-blue.svg?style=flat-square)](http://godoc.org/github.com/yagnik/go-template)
[![Release](https://img.shields.io/github/release/yagnik/go-template.svg?style=flat-square)](https://github.com/yagnik/go-template/releases/latest)
[![Build Status](https://travis-ci.org/yagnik/go-template.svg?branch=master)](https://travis-ci.org/yagnik/go-template)


Basic template for go projects to get started

## Setup
- (PREREQUISITE) Please have docker and docker-compose installed
- Clone this repo: `git clone git@github.com:yagnik/go-template.git`
- Inside the directory where you cloned the repo run: `make test`.
- The above will bring up docker containers using docker-compose and run tests to ensure everything is setup properly.
- Remove the folders as needed according to your project
- Replace path in makefile to your go code

## Directory structure
- cmd: main applications, directories inside should match executable
- internal: private package code
- pkg: public package code
- vendor: managed by dep tool
- api: openapi specs, schema and proto files
- web: web app components, templates etc
- config: configuration files
- build: package -> build configs i.e. docker, rpm, ci -> for travis circle etc
- test: external tests and data
- examples: examples for applicaton and public packages

## Inspired by:
- [golang-standards/project-layout](https://github.com/golang-standards/project-layout)
- [thokin/go-build-template](https://github.com/thockin/go-build-template)
- [pantomath-io/demo-tools](https://gitlab.com/pantomath-io/demo-tools/blob)
- [MartinHeinz/go-project-blueprint](https://github.com/MartinHeinz/go-project-blueprint)
