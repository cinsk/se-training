#!/bin/bash

# PIDFILE=/var/run/hello-server.pid
PIDFILE=/tmp/hello-server.pid
#LOGFILE=/var/log/hello-server.log
LOGFILE=/tmp/hello-server.log

PROGRAM_NAME="$(basename "$0")"
VERSION_STRING="0.1"

help_and_exit() {
    cat <<EOF
Hello server
Usage: $PROGRAM_NAME [OPTION...]

   -l LOGFILE   write logs into LOGFILE
   -p PIDFILE   write PID into PIDFILE

   -k           kill existing server
   -s           print the server status
       
   -h           show help and exit
   -v           display version string and exit

EOF
    exit 0
}

version_and_exit() {
    echo "$PROGRAM_NAME version $VERSION_STRING"
    exit 0
}

log() {
    echo "$(date -Iseconds): $*"
}
export -f log

error() {
    local estatus="$1"
    shift
    echo "$PROGRAM_NAME: $*" 1>&2

    [ "$estatus" -ne 0 ] && exit "$estatus"
}


operation="start"

while getopts "l:p:shvk" opt; do
    case "$opt" in
        h)
            help_and_exit
            ;;
        v)
            version_and_exit
            ;;
        k)
            operation="kill"
            ;;
        s)
            operation="status"
            ;;
        p)
            PIDFILE=$OPTARG
            ;;
        l)
            LOGFILE=$OPTARG
            ;;
    esac
done
shift $((OPTIND - 1))


case "$operation" in
    start)
    ;;
    status)
        if [ -f "$PIDFILE" ] && kill -0 $(cat $PIDFILE) &>/dev/null; then
            echo "started"
        else
            echo "stopped"
        fi
        exit 0
    ;;
    kill)
        [ -f "$PIDFILE" ] && kill -TERM $(cat $PIDFILE)
        exit $?
        ;;
    *)
        error 1 "invalid operation: $operation"
        ;;
esac

[ -f "$PIDFILE" ] && error 1 "server already started.  delete it with '-k' first"

# Redirect the standard output and the standard error of this process to $LOGFILE.
exec &> $LOGFILE

# Redirect the standard input of this process from /dev/null.
# This ensures that no input from the standard input.
exec </dev/null

trap "log 'server stopped'; rm -f $PIDFILE; exit" EXIT
echo "$$" > "$PIDFILE"


log "server started"

cd /

while : ; do
    # java -xx
    echo "Hello $(date)" | nc -l -p 8888 127.0.0.1
done

    
    
