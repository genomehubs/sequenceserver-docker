#!/bin/bash -i

CONFIGFILE="-c /sequenceserver.conf"

if [ -s /conf/sequenceserver.conf ]; then
  CONFIGFILE="-c /conf/sequenceserver.conf"
fi

if [ -s /conf/Masthead.html ]; then
  sed -i '/<body>/ r /conf/Masthead.html' /sequenceserver/views/layout.erb
fi

if [ -d /conf/img ]; then
  mkdir /sequenceserver/public/img
  cp /conf/img/* /sequenceserver/public/img/
fi

if [ -s /conf/custom.css ]; then
  cat /conf/custom.css >> /sequenceserver/public/css/sequenceserver.css
fi

if [ -s /conf/links.rb ]; then
  cp /conf/links.rb /sequenceserver/lib/sequenceserver/links.rb
fi

npm run-script build
gem build sequenceserver.gemspec

# start SequenceServer
/usr/local/bin/bundle exec /sequenceserver/bin/sequenceserver -b /usr/bin -m $CONFIGFILE && \
/usr/local/bin/bundle exec /sequenceserver/bin/sequenceserver -b /usr/bin $CONFIGFILE &
tail -f /dev/null

