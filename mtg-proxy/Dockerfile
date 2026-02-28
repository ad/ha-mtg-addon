ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

ARG MTG_VERSION="2.1.11"

RUN apk add --no-cache jq ca-certificates curl tar && \
    ARCH=$(uname -m) && \
    case "${ARCH}" in \
        x86_64)  MTG_ARCH="linux-amd64" ;; \
        aarch64) MTG_ARCH="linux-arm64" ;; \
        armv7l)  MTG_ARCH="linux-armv7" ;; \
        armv6l)  MTG_ARCH="linux-armv6" ;; \
        *) echo "Unsupported arch: ${ARCH}" && exit 1 ;; \
    esac && \
    curl -fsSL "https://github.com/9seconds/mtg/releases/download/v${MTG_VERSION}/mtg-${MTG_VERSION}-${MTG_ARCH}.tar.gz" \
        -o /tmp/mtg.tar.gz && \
    tar -xzf /tmp/mtg.tar.gz -C /tmp && \
    mv /tmp/mtg /usr/local/bin/mtg && \
    chmod +x /usr/local/bin/mtg && \
    rm -rf /tmp/mtg*

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
