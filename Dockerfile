FROM alpine:latest

WORKDIR /wisecow-main

COPY . /wisecow-main

RUN apk add --no-cache wget build-base perl

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update

# Install cowsay from the testing repository
RUN apk add --no-cache cowsay

RUN apk add --no-cache fortune

RUN apk add --no-cache bash

RUN apk add --no-cache netcat-openbsd

RUN chmod +x /wisecow-main/wisecow.sh

CMD ["./wisecow.sh"]

