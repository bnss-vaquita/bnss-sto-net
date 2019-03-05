#!/bin/sh

cd /etc/raddb/mods-enabled 
ln -s ../mods-available/sql sql
ln -s ../mods-available/eap eap
ln -s ../mods-available/linelog linelog


rsyslogd

radiusd -X