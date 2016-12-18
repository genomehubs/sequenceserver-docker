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

RUN chmod -R a+w ./

EXPOSE 4567
COPY startup.sh /
RUN mkdir /conf
COPY sequenceserver.conf /conf/sequenceserver.conf
COPY Masthead.html /conf/Masthead.html
RUN sed -i '/<body>/ r /conf/Masthead.html' /sequenceserver/views/layout.erb
RUN mkdir /sequenceserver/public/img
COPY img/* /sequenceserver/public/img/
COPY custom.css /conf/custom.css
RUN cat /conf/custom.css >> /sequenceserver/public/css/sequenceserver.css
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm run-script build
RUN gem build sequenceserver.gemspec

CMD /startup.sh
