FROM golang:1.13
MAINTAINER Yagnik

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
RUN go get -u golang.org/x/lint/golint
RUN go get -u github.com/mitchellh/gox
