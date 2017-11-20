FROM golang:1.9
MAINTAINER Yagnik

ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
RUN go get -u github.com/golang/lint/golint
