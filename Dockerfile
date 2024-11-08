FROM alpine:latest

LABEL maintainer="Stephane Raffalli <stephane.raffalli@gmail.com>"

ENV CEREBRO_VERSION=0.9.4

RUN apk update && \
    apk add --no-cache bash openjdk8 ca-certificates openssl

WORKDIR /usr/share

RUN wget https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz && \
    tar zxvf cerebro-${CEREBRO_VERSION}.tgz && \
    rm -rf cerebro-${CEREBRO_VERSION}.tgz && \
    mv cerebro-${CEREBRO_VERSION} cerebro

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/share/cerebro/bin

RUN addgroup -S cerebro && \
    adduser -G cerebro -S -D -h /usr/share/cerebro cerebro && \
    chown -R cerebro:cerebro /usr/share/cerebro

USER cerebro

WORKDIR /usr/share/cerebro

EXPOSE 9000

ENTRYPOINT ["cerebro"]

CMD ["-Dhttp.port=9000","-Dhttp.address=0.0.0.0"]
