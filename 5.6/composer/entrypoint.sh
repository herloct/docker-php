#!/bin/sh
set -e

if [ "$1" = 'composer' ]; then
    exec "$@"
else
	exec composer "$@"
fi
