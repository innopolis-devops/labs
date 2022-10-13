FROM grafana/promtail:2.6.1

RUN apt update && \
    apt install -y wget

HEALTHCHECK --interval=1m30s --timeout=30s --start-period=10s --retries=3\
  CMD wget --no-verbose --tries=1 --spider http://localhost:9080/ready || exit 1