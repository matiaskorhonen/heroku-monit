#!/usr/bin/env bash

sed -i -e "s/HEROKU_PORT/$PORT/g" ./conf/monitrc

./bin/monit -c ./conf/monitrc -p ./tmp/.monit.pid -s ./tmp/.monit.state -I