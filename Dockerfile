FROM ubuntu:xenial
MAINTAINER Richard Challis/LepBase contact@lepbase.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    ruby \
    ruby-dev \
    ncbi-blast+

RUN apt-get update && apt-get install -y npm libqt4-dev libqtwebkit-dev
RUN gem install bundler

#RUN git clone https://github.com/wurmlab/sequenceserver
COPY sequenceserver /sequenceserver
WORKDIR sequenceserver

RUN npm install
RUN bundle install

EXPOSE 4567

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir /conf

RUN adduser --disabled-password --gecos '' dockeruser

RUN chown -R dockeruser /conf
RUN chown -R dockeruser /sequenceserver

COPY startup.sh /
COPY sequenceserver.conf /

RUN mkdir /.sequenceserver && chmod a+w /.sequenceserver

RUN chown -R dockeruser /startup.sh

USER dockeruser

CMD /startup.sh
