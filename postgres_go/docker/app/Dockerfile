FROM golang:1.20-alpine3.16

COPY app /go/app/

RUN mkdir -p /usr/local/go/src/web/app

WORKDIR /usr/local/go/src/web/app/

RUN apk update \
&& apk add --no-cache git \
&& go get github.com/gin-gonic/gin \
&& go get github.com/jinzhu/gorm \
&& go get github.com/lib/pq \
&& go get firebase.google.com/go \
&& go mod init app \
&& go get firebase.google.com/go \
&& apk add git

EXPOSE 8080