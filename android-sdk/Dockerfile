FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
        wget \
        unzip \
        git \
        openjdk-8-jdk-headless \
        python-pip \
        ruby-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli git+https://github.com/bittorrent/simon.git@master#egg=simon

RUN gem install fastlane

WORKDIR /opt

ARG SDK_VERSION=r25.2.3
ARG SDK_API_LEVEL=25
ARG BUILD_TOOLS_VERSION=25.0.2

ENV ANDROID_HOME=/opt/android-sdk

RUN wget -q https://dl.google.com/android/repository/tools_$SDK_VERSION-linux.zip && \
    unzip -q tools_$SDK_VERSION-linux.zip -d $ANDROID_HOME && \
    rm tools_$SDK_VERSION-linux.zip && \
    mkdir -p $ANDROID_HOME/licenses && \
    echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license" && \
    $ANDROID_HOME/tools/bin/sdkmanager \
        "platforms;android-25" \
        "build-tools;$BUILD_TOOLS_VERSION" \
        "platform-tools" \
        "extras;android;m2repository"
