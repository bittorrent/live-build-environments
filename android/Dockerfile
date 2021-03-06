FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
        git \
        libwww-perl \
        openjdk-8-jdk-headless \
        pkg-config \
        python-pip \
        unzip \
        vim \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

ARG SDK_VERSION=r24.4.1
ARG SDK_API_LEVEL=25
ARG BUILD_TOOLS_VERSION=25.0.2

ENV ANDROID_HOME=/opt/android-sdk-linux

RUN wget https://dl-ssl.google.com/android/android-sdk_$SDK_VERSION-linux.tgz -q && \
    tar -xzf ./android-sdk_$SDK_VERSION-linux.tgz && \
    rm ./android-sdk_$SDK_VERSION-linux.tgz && \
    mv ./android-sdk-linux/tools ./android-sdk-linux/temp-tools && \
    ln -s /opt/android-sdk-linux/temp-tools /opt/android-sdk-linux/tools && \
    echo y | $ANDROID_HOME/tools/android update sdk --no-ui --filter tool,platform-tool,build-tools-$BUILD_TOOLS_VERSION,android-$SDK_API_LEVEL,extra-android-m2repository && \
    rm -rf ./android-sdk-linux/temp ./android-sdk-linux/temp-tools

ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/templates/gradle/wrapper

RUN pip install jinja2 pyyaml colorama

ARG NDK_API_LEVEL=21
ARG NDK_ARCHITECTURE=arm
ARG NDK_VERSION=r13b

# XXX Compilation fails when unused toolchains are removed
RUN wget https://dl.google.com/android/repository/android-ndk-$NDK_VERSION-linux-x86_64.zip -q && \
    unzip ./android-ndk-$NDK_VERSION-linux-x86_64.zip >/dev/null && \
    rm ./android-ndk-$NDK_VERSION-linux-x86_64.zip && \
    cd ./android-ndk-$NDK_VERSION && \
    find ./platforms/* -maxdepth 0 -not -name android-$NDK_API_LEVEL -print0 | xargs -0 rm -r

ENV ANDROID_NDK_HOME=/opt/android-ndk-$NDK_VERSION
ENV PATH=$PATH:$ANDROID_NDK_HOME

RUN $ANDROID_NDK_HOME/build/tools/make_standalone_toolchain.py \
    --arch $NDK_ARCHITECTURE --api $NDK_API_LEVEL --stl libc++ --install-dir ./android-$NDK_API_LEVEL-$NDK_ARCHITECTURE-toolchain
ENV ANDROID_TOOLCHAIN=/opt/android-$NDK_API_LEVEL-$NDK_ARCHITECTURE-toolchain
