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


RUN mkdir /sequenceserver

RUN useradd -m sequenceserver && chown -R sequenceserver:sequenceserver /sequenceserver

USER sequenceserver

RUN mkdir -p /home/sequenceserver/.ruby

ENV GEM_HOME /home/sequenceserver/.ruby

ENV PATH $PATH:/home/sequenceserver/.ruby/bin

WORKDIR /sequenceserver

RUN git clone https://github.com/wurmlab/sequenceserver

WORKDIR /sequenceserver/sequenceserver

RUN gem install bundler rake && bundle && npm install

COPY startup.sh /sequenceserver
COPY sequenceserver.conf /sequenceserver

ENTRYPOINT /sequenceserver/startup.sh
