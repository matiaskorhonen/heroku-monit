#!/usr/bin/env bash

sed -i -e "s/HEROKU_PORT/$PORT/g" ./conf/monitrc

# Set the HTTP Basic auth user credentials
sed -i -e "s/HTTP_USER/$HTTP_USER/g" ./conf/monitrc
sed -i -e "s/HTTP_PASSWD/$HTTP_PASSWD/g" ./conf/monitrc

# Set the SendGrid credentials
sed -i -e "s/SENDGRID_USERNAME/$SENDGRID_USERNAME/g" ./conf/monitrc
sed -i -e "s/SENDGRID_PASSWORD/$SENDGRID_PASSWORD/g" ./conf/monitrc

./bin/monit -c ./conf/monitrc -p ./tmp/.monit.pid -s ./tmp/.monit.state -I