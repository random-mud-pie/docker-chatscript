FROM debian:jessie-slim
MAINTAINER Talmai Oliveira <to@talm.ai>
ENV REFRESHED_AT 2019-4-13 (CS 9.2 Release)

RUN apt-get update && \
    apt-get install -y --no-install-recommends git build-essential libghc-curl-dev ca-certificates curl && \
    rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/random-mud-pie/ChatScript /app/ChatScript && \
    cd /app/ChatScript && \
    make -j 4 -C ./SRC server && \
    ./BINARIES/ChatScript local build0=files0.txt && \
    rm -rf  .git \
        BINARIES/*.exe \
        BINARIES/*.dll \
        PDFDOCUMENTATION \
        WIKI \
        PAPERS \
        HTMLDOCUMENTATION \
        /var/lib/apt/lists/*

WORKDIR /app/ChatScript

EXPOSE 7314

CMD ["./BINARIES/ChatScript", "port=7314"]
