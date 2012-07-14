#!/usr/bin/env bash

export SYSTEM_NAME=${1:-Heroku}

(cat ./conf/monitrc | vendor/gettext/bin/envsubst) > tempfile && mv tempfile ./conf/monitrc

vendor/monit/bin/monit -c ./conf/monitrc -p ./tmp/.monit.pid -s ./tmp/.monit.state -I
