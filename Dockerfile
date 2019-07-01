FROM ubuntu:bionic

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        gnupg \
        ncbi-blast+ \
        nodejs \
        npm \
        ruby \
        ruby-dev \
        wget \
        zlib1g-dev

WORKDIR /

RUN git clone https://github.com/wurmlab/sequenceserver

WORKDIR /sequenceserver

RUN gem install rake

RUN gem install bundler && bundle && npm install

COPY startup.sh /
COPY sequenceserver.conf /

ENTRYPOINT /startup.sh
