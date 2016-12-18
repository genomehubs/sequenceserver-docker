#!/bin/bash -i

# start SequenceServer
/usr/local/bin/bundle exec /sequenceserver/bin/sequenceserver -b /usr/bin -c /conf/sequenceserver.conf &
tail -f /dev/null

