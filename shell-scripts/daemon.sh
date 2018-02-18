#!/bin/bash

PROGRAM_NAME="$(basename $0)"

LOG_FILE=/var/log/$PROGRAM_NAME.log
PID_FILE=/var/run/$PROGRAM_NAME.pid

error() {
    local ecode="$1"
    shift
    echo "$PROGRAM_NAME: $*" 1>&2
    shift
    [ "$ecode" -ne 0 ] && exit "$ecode"
}

while getopts "hvP:L:" opt; do
    case "$opt" in
        h)
            ;;
        v)
            ;;
        L)
            LOG_FILE=$OPTARG
            ;;
        P)
            PID_FILE=$OPTARG
            ;;
    esac
done
shift $((OPTIND - 1))


exec 6>&2
nohup bash <(cat <<EOF
error() {
    local ecode="$1"
    shift
    echo "$PROGRAM_NAME: $*" 1>&6
    shift
    [ "$ecode" -ne 0 ] && exit "$ecode"
}

log() {
    echo "$(date -Iseconds) [$$] $*"
}

cd /
trap "log daemon stopped; rm -f $PID_FILE" EXIT
echo -n "\$\$" >"$PID_FILE"

log daemon started
sleep 1000

EOF
 ) >>"$LOG_FILE" 2>&1 &
DAEMON_PID="$1"
