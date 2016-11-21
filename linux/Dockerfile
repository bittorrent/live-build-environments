FROM ubuntu:14.04

RUN apt-get update && \
    # Ubuntu 14.04 doesn't have a recent version of git available, so add the
    # official ppa and update it. Be sure to remove the tools when done. This
    # method doesn't add much to the overall image, <5mb
    apt-get install -y \
        software-properties-common \
        python-software-properties \
        && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y \
    # updated git
        git \
    # build tools, clang 3.8, and libc++
        linux-tools-common \
        clang-3.8 \
        libc++-dev \
    # related build tools, but not necessarily
        pkg-config \
        python-pip \
        cmake \
        curl \
    # Live specifics
        libz-dev \
        libgl1-mesa-dev \
        && \
    apt-get remove -y --auto-remove \
        software-properties-common \
        python-software-properties \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install jinja2 pyyaml colorama

# environment settings; not likely to change, but very fast with small layers
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.8 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.8 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100

ENV CC clang-3.8
ENV CXX clang++-3.8
ENV CXXFLAGS -stdlib=libc++
ENV LDFLAGS -lc++
