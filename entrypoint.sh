#!/bin/bash
set -e

# allow arguments to be passed to haproxy
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == squid || ${1} == $(/usr/bin/squid) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch squid
if [[ -z ${1} ]]; then
  echo "Starting haproxy..."
  exec /usr/bin/haproxy -Ws -f /etc/haproxy/haproxy.cfg
else
  exec "$@"
fi

