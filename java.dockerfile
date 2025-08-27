FROM marsyang1/bitbucket-ci-builder:base
LABEL org.opencontainers.image.authors="marsyang1"

# ---- 基本工具 ----
RUN apk --no-cache add \
    bash curl git unzip zip coreutils ca-certificates openssl tar

# ---- 宣告可調參數 ----
ARG ASDF_VERSION=v0.14.0
# 這裡直接把 JDK 發行版+版本號一起帶入
ARG JDK_NAME=liberica-8u462+11

# ---- 安裝 asdf ----
ENV ASDF_DIR=/opt/asdf \
    ASDF_DATA_DIR=/opt/asdf
RUN git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch ${ASDF_VERSION}
ENV PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"

# ---- 安裝 Java via asdf ----
RUN asdf plugin add java https://github.com/halcyon/asdf-java.git \
 && asdf install java "${JDK_NAME}" \
 && asdf global java "${JDK_NAME}"

# 設定 JAVA_HOME
ENV JAVA_HOME="/opt/asdf/installs/java/${JDK_NAME}"

# 驗證 (可選)
RUN java -version && echo "JAVA_HOME=$JAVA_HOME"

# ---- 你原本的設定 ----
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build \
 && adduser -s /bin/sh -u 1000 -D pipelines

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT ["/bin/sh"]