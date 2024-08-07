# use node 10 , 
# using mhart image v14 , https://github.com/mhart/alpine-node 
FROM node:14-alpine
LABEL org.opencontainers.image.authors="marsyang1"
ARG CLOUD_SDK_VERSION=482.0.0
## INSTALL GCLOUD SDK
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk --no-cache add \
        curl \
        python3 \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version
    
## install other tools
RUN apk --no-cache add \
        unzip \
        # for base64
        coreutils   

# Create dirs and users
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build
# Create user pipeline , shell:/bin/sh , uid:1001
RUN adduser -s /bin/sh -u 1001 -D pipelines

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT /bin/sh
