#!/bin/sh
set -e

if [ "$1" = 'php' ]; then
    exec "$@"
else
	exec php "$@"
fi
