#!/usr/bin/env bash

sed -i -e "s/HEROKU_PORT/$PORT/g" ./conf/monitrc

# Set the HTTP Basic auth user credentials
sed -i -e "s/HTTP_USER/$HTTP_USER/g" ./conf/monitrc
sed -i -e "s/HTTP_PASSWD/$HTTP_PASSWD/g" ./conf/monitrc

# Set the HTTP Basic auth read-only user credentials
sed -i -e "s/READ_USER/$READ_USER/g" ./conf/monitrc
sed -i -e "s/READ_PASSWD/$READ_PASSWD/g" ./conf/monitrc

# Set which email to notify on alert
sed -i -e "s/NOTIFY_EMAIL/$NOTIFY_EMAIL/g" ./conf/monitrc

# Set the system name
SYSTEM_NAME=${1:-Heroku}
sed -i -e "s/SYSTEM_NAME/$SYSTEM_NAME/g" ./conf/monitrc

# Set the SendGrid credentials
sed -i -e "s/SENDGRID_USERNAME/$SENDGRID_USERNAME/g" ./conf/monitrc
sed -i -e "s/SENDGRID_PASSWORD/$SENDGRID_PASSWORD/g" ./conf/monitrc

vendor/monit/bin/monit -c ./conf/monitrc -p ./tmp/.monit.pid -s ./tmp/.monit.state -I
