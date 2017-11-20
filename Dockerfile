FROM golang:1.9
MAINTAINER Yagnik

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/golang/lint/golint
RUN mkdir -p /go/src/github.com/yagnik/go-template

WORKDIR /go/src/github.com/yagnik/go-template


