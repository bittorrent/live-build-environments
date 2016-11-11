FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
        git \
        pkg-config \
        python-pip \
        cmake \
        linux-tools-common \
        clang-3.8 \
        libc++-dev \
        libz-dev \
        libgl1-mesa-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install jinja2 pyyaml colorama

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.8 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.8 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100

ENV CC clang-3.8
ENV CXX clang++-3.8
ENV CXXFLAGS -stdlib=libc++
ENV LDFLAGS -lc++
