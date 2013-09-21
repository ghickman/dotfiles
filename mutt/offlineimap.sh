#!/bin/sh

LOGFILE="/Users/george/.offlineimap/sync.log"
PID=`cat ~/.offlineimap/pid`
ps aux | grep "[ ]$PID" && kill $PID

function sync_normal {
    echo "NORMAL Sync"
    /usr/local/bin/offlineimap -o >> $LOGFILE
}
function sync_quick {
    echo "QUICK Sync"
    /usr/local/bin/offlineimap -o -q >> $LOGFILE
}

# This is silly.
python -c'import sys, random; sys.exit(random.randint(0, 5))' && sync_normal || sync_quick

exit 0
