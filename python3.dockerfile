FROM marsyang1/bitbucket-ci-builder:base
MAINTAINER MarsYang

## install python build tools
RUN apk --no-cache add \
        wget \
        unzip \
        py3-pip \
        # for ci running with base64 function
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
