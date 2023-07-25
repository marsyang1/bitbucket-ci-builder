FROM marsyang1/bitbucket-ci-builder:base
LABEL org.opencontainers.image.authors="marsyang1"

## install java build tools
RUN apk --no-cache add \
        wget \
        unzip \
        openjdk17 \
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
