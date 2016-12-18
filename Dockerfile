FROM ubuntu:xenial
MAINTAINER Richard Challis/LepBase contact@lepbase.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    ruby \
    ruby-dev \
    ncbi-blast+

RUN git clone https://github.com/wurmlab/sequenceserver
WORKDIR sequenceserver

RUN apt-get install -y npm libqt4-dev libqtwebkit-dev
RUN gem install bundler
WORKDIR /sequenceserver
RUN bundle install
RUN npm install

EXPOSE 4567
ADD sequenceserver.conf /
ADD startup.sh /
CMD /startup.sh
