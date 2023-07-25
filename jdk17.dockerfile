# Support Doc: https://adoptium.net/index.html?variant=openjdk17&jvmVariant=hotspot
#
#
#
FROM eclipse-temurin:17.0.7_7-jdk-alpine
LABEL org.opencontainers.image.authors="marsyang1"

# install google cloud sdk
# https://cloud.google.com/sdk/docs/release-notes
ARG CLOUD_SDK_VERSION=439.0.0
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


# Install font var cURL , doc: https://www.jianshu.com/p/e39ee0cad05b
RUN apk add --update openssh curl bash ttf-dejavu tzdata
## install java build tools
RUN apk --no-cache add \
        wget \
        unzip \
        gradle \
        maven \
        # for BitBucket pipeline step can using base64
        coreutils     
        
# Create dirs and users
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build
RUN adduser -s /bin/sh -u 1000 -D pipelines

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT /bin/sh
