#!/usr/bin/env sh

echo '{"health": "check"}' | nc localhost 8877 || exit 1