FROM ruby:2.2

ARG FASTLANE_VERSION=2.23.0

RUN apt-get -qq update && \
    apt-get -qq install -y less && \
    gem install fastlane:$FASTLANE_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
