FROM marsyang1/bitbucket-ci-builder:ubi10-base-java
LABEL org.opencontainers.image.authors="marsyang1"

ENV JDK_VERSION=liberica-8u462+11

# 透過 asdf 安裝 OpenJDK 8
RUN asdf install java ${JDK_VERSION} \
    && asdf set java ${JDK_VERSION} --home \
    && asdf reshim java

# 設定 JAVA_HOME
ENV JAVA_HOME="/opt/asdf/installs/java/${JDK_VERSION}"
        
# Create dirs and users (改用 useradd)
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build

# 驗證 Java 安裝
RUN java -version && echo "JAVA_HOME=$JAVA_HOME"

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build

ENTRYPOINT ["/bin/bash"]