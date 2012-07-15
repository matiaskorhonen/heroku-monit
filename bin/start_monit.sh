#!/usr/bin/env bash

export SYSTEM_NAME=${1:-Heroku}

CONFIG_FILES=conf.d/*

for f in $CONFIG_FILES
do
  echo "Processing $f file..."
  (cat  $f | vendor/gettext/bin/envsubst) >  $f.tmp && mv  $f.tmp  $f
done

(cat monitrc | vendor/gettext/bin/envsubst) > monitrc.tmp && mv monitrc.tmp monitrc

vendor/monit/bin/monit -c monitrc -p tmp/.monit.pid -s tmp/.monit.state -I
