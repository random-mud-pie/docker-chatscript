FROM debian:jessie-slim as build-chatscript

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    libghc-curl-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ChatScript/ChatScript /app/ChatScript

WORKDIR /app/ChatScript

RUN make -C ./SRC server -j 4

RUN ./BINARIES/ChatScript local build0=files0.txt

#remove unused parts (gitrepo, windows binaries, unused dicts)
RUN rm -rf  .git \
            BINARIES/*.exe \
            BINARIES/*.dll \
            DICT/PORTUGUESE \
            DICT/GERMAN \ 
            DICT/FRENCH \
            DICT/ITALIAN \
            DICT/DUTCH \
            DICT/SPANISH \
            SRC \
            PDFDOCUMENTATION \
            WIKI \
            PAPERS \
            HTMLDOCUMENTATION

FROM debian:jessie-slim

LABEL maintainer="ilya@apalkoff.ru"

COPY --from=build-chatscript /app /app
WORKDIR /app/ChatScript

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

EXPOSE 1024
CMD ["./BINARIES/ChatScript", "port=1024"]