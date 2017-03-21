FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        awscli \
        build-essential \
        ca-certificates \
        curl \
        protobuf-compiler \
        software-properties-common \
    && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    add-apt-repository ppa:masterminds/glide && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y docker-ce glide && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz -o go1.8.linux-amd64.tar.gz && \
    tar -zxvf go1.8.linux-amd64.tar.gz -C /usr/local/ && \
    rm go1.8.linux-amd64.tar.gz

RUN mkdir -p /go/bin

ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
