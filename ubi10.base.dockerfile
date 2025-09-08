FROM registry.access.redhat.com/ubi10/ubi-minimal:latest
LABEL org.opencontainers.image.authors="marsyang1"

# https://github.com/asdf-vm/asdf/releases
ARG ASDF_VERSION=0.18.0
ENV ASDF_VERSION=${ASDF_VERSION}

RUN alias ll='ls -l'

# 拿掉了 glibc (minimal 版已經包含必要的 libc , java會用到)
# 拿到Google Cloud SDK , 在gitea部署後Base Image已經用不到gcloud相關套件
RUN microdnf update -y \
    && microdnf install -y \
        curl \
        tar \
        gzip \
        openssh-clients \
        gnupg2 \
        bash \
        git

# for CI/CD step can using base64 , ubi 10 本身有包含coreutils精簡版 , 調整為完整版
RUN microdnf swap -y coreutils-single coreutils

RUN microdnf clean all \
    && rm -rf /var/cache/dnf \
    && rm -rf /tmp/*

# 下載官方預編譯的 asdf binary
RUN cd ~
RUN curl -fSL "https://github.com/asdf-vm/asdf/releases/download/v${ASDF_VERSION}/asdf-v${ASDF_VERSION}-linux-amd64.tar.gz" -o asdf.tar.gz \
    && tar -xzf asdf.tar.gz \
    && mkdir -p /usr/local/bin \
    && cp asdf /usr/local/bin/ \
    && rm -f asdf.tar.gz asdf \
    && mkdir -p /opt/asdf

RUN echo 'export ASDF_DATA_DIR="/opt/asdf"' >> /root/.bashrc \
    && echo 'export PATH="/usr/local/bin:$PATH"' >> /root/.bashrc

# 設定 asdf 環境變數 (改用 /opt/asdf 而不是 /root/.asdf)
ENV ASDF_DATA_DIR="/opt/asdf"
ENV PATH="/usr/local/bin:/opt/asdf/shims:$PATH"

# 改成 JSON/exec 形式 , 調整預設shell 為bash
ENTRYPOINT ["/bin/bash"]