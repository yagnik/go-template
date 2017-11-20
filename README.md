# Go Template
[![Go Report Card](https://goreportcard.com/badge/github.com/yagnik/go-template)](https://goreportcard.com/report/github.com/yagnik/go-template)
[![Go Doc](https://img.shields.io/badge/godoc-reference-blue.svg?style=flat-square)](http://godoc.org/github.com/golang-standards/project-layout)
[![Release](https://img.shields.io/github/release/golang-standards/project-layout.svg?style=flat-square)](https://github.com/golang-standards/project-layout/releases/latest)
[![Build Status](https://travis-ci.org/yagnik/go-template.svg?branch=master)](https://travis-ci.org/yagnik/go-template)


Basic template for go projects to get started

## Directory structure
- cmd: main applications, directories inside should match executable
- internal: private package code
- pkg: public package code
- vendor: managed by dep tool
- third_party: code forked from third party and modified
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
