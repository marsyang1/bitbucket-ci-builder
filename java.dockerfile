FROM marsyang1/bitbucket-ci-builder:base
LABEL org.opencontainers.image.authors="marsyang1"

# ---- 基本工具 ----
RUN apk --no-cache add \
    bash curl git unzip zip coreutils ca-certificates openssl tar

# ---- 安裝 ASDF（從 edge/testing，一次性來源，不永久變更系統倉庫）----
# asdf 會安裝 /usr/bin/asdf
RUN apk --no-cache add \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    asdf

# ---- 參數化：JDK 名稱（發行版+版本號），預設 Liberica 8u462+11 ----
ARG JDK_NAME=liberica-8u462+11

# ---- 設定 asdf 的資料目錄為系統共用路徑，讓所有使用者可用 ----
ENV ASDF_DATA_DIR=/opt/asdf
ENV PATH="/usr/bin:${ASDF_DATA_DIR}/shims:${PATH}"

# ---- 用 asdf 安裝指定 JDK ----
RUN asdf plugin add java \
 && asdf install java "${JDK_NAME}" \
 && asdf set --home java "${JDK_NAME}"

# 設定 JAVA_HOME（指到 asdf 的實體安裝位置）
ENV JAVA_HOME="/opt/asdf/installs/java/${JDK_NAME}"

# 驗證（可選）
RUN java -version && echo "JAVA_HOME=$JAVA_HOME"

# ---- 你原本的設定 ----
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build \
 && adduser -s /bin/sh -u 1000 -D pipelines

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT ["/bin/sh"]