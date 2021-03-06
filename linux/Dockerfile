FROM ubuntu:14.04

COPY llvm-snapshot.gpg.key /
RUN cat /llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update && \
    # Ubuntu 14.04 doesn't have a recent version of git available, so add the
    # official ppa and update it. Be sure to remove the tools when done. This
    # method doesn't add much to the overall image, <5mb
    apt-get install -y \
        software-properties-common \
        python-software-properties \
        && \
    add-apt-repository ppa:git-core/ppa \
        && \
    # external repo for clang 3.9
    apt-add-repository "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main" \
        && \
    apt-get update \
        && \
    apt-get install -y \
    # updated git
        git \
    # build tools, clang 3.9, and libc++
        linux-tools-common \
        clang-3.9 \
        libc++-dev \
    # related build tools, but not necessarily
        curl \
        pkg-config \
        python-pip \
        python3-pip \
        cmake \
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

RUN pip2 install jinja2 pyyaml colorama
RUN pip3 install jinja2 pyyaml colorama

# great program for modifying things like runpaths for executables and removing
# unnecessary dynamic libraries. <2mb
RUN curl -o patchelf-0.9.tar.bz2 https://nixos.org/releases/patchelf/patchelf-0.9/patchelf-0.9.tar.bz2 && \
    tar -xf patchelf-0.9.tar.bz2 && \
    ( cd patchelf-0.9 && ./configure && make && make install ) && \
    rm -rf patchelf-0.9 patchelf-0.9.tar.bz2

# environment settings; not likely to change, but very fast with small layers
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.9 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.9 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.9 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.9 100

ENV CC clang-3.9
ENV CXX clang++-3.9
ENV CXXFLAGS -stdlib=libc++
ENV LDFLAGS -lc++
