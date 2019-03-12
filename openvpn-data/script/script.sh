#!/bin/sh

#
# RADIUS authentication script
#

username=`head -1 $1` 
password=`tail -1 $1`

# substitute with user-specific select only privileged user
query="select value from radius.radcheck where username=\"$username\""
db_psw=$(mysql -u openvpn_radius -p7jVKJG4ITrhQzaJq98JZsp6 -h 192.168.5.8 --ssl -N -B -e "$query")

python /tmp/script/auth_radius.py $password $db_psw

if [[ "$?" == "0" ]]; then
  echo "Password correct. User authenticated succesfully"
  exit 0
fi
echo "Password incorrect. User NOT authenticated"
exit 1
