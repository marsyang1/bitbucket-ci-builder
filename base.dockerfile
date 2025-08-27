FROM alpine:3.22
LABEL org.opencontainers.image.authors="marsyang1"

# https://cloud.google.com/sdk/docs/release-notes
ARG CLOUD_SDK_VERSION=536.0.0
ENV CLOUD_SDK_VERSION=${CLOUD_SDK_VERSION}

# ✅ 改成新格式：ENV key=value
ENV PATH="/google-cloud-sdk/bin:${PATH}"

RUN apk --no-cache add \
        curl \
        python3 \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg \
    && curl -fSLo "google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
         "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && tar xzf "google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && rm "google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
    && gcloud config set core/disable_usage_reporting true \
    && gcloud config set component_manager/disable_update_check true \
    && gcloud config set metrics/environment github_docker_image \
    && gcloud --version

# ✅ 改成 JSON/exec 形式
ENTRYPOINT ["/bin/sh"]