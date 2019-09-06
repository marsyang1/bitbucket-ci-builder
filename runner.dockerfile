FROM marsyang1/bitbucket-ci-builder:node
MAINTAINER MarsYang

RUN  apk --no-cache add \
     wget \
     curl \
     git \
     openssh-client \
     ansible \
     # for base64
     coreutils

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT /bin/sh
