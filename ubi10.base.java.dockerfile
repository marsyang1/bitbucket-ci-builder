FROM marsyang1/bitbucket-ci-builder:ubi10-base
LABEL org.opencontainers.image.authors="marsyang1"

## install java build tools (改用 microdnf)
RUN microdnf install -y \
        wget \
        unzip

# 透過 asdf 安裝 plugin 要很久, 另外拉一個Java Base
RUN git clone --depth 1 https://github.com/halcyon/asdf-java.git /opt/asdf/plugins/java \
    && cd /opt/asdf/plugins/java \
    # 刪除不需要的平台支援 , 只保留 x86_64 Linux 相關的檔案
    && cd data/ \
    && mkdir ../temp_data \
    && find . -name "*linux-x86_64*" -name "*.tsv" -exec cp {} ../temp_data/ \; \
    && rm -rf *.tsv \
    && mv ../temp_data/* . \
    && cd .. \
    && rmdir temp_data

ENTRYPOINT ["/bin/bash"]