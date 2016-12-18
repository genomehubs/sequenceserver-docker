#!/bin/bash -i

# start SequenceServer
/usr/local/bin/bundle exec /sequenceserver/bin/sequenceserver -b /usr/bin -D -c /sequenceserver.conf &
tail -f /dev/null

