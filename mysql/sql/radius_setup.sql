# -*- text -*-
##
## admin.sql -- MySQL commands for creating the RADIUS user.
##
##      WARNING: You should change 'localhost' and 'radpass'
##               to something else.  Also update raddb/sql.conf
##               with the new RADIUS password.
##
##      $Id: aff0505a473c67b65cfc19fae079454a36d4e119 $

#
#  Create default administrator for RADIUS
#
CREATE USER 'radius'@'%';
#SET PASSWORD FOR 'radius'@'RADIUS_VLAN1' = PASSWORD('RADIUS_USR_PASSWORD');
SET PASSWORD FOR 'radius'@'%' = 'RADIUS_USR_PASSWORD';

ALTER USER 'radius'@'%' IDENTIFIED WITH mysql_native_password BY 'RADIUS_USR_PASSWORD';

# The server can read any table in SQL
GRANT SELECT ON radius.* TO 'radius'@'%';

# The server can write to the accounting and post-auth logging table.
#
#  i.e.
GRANT ALL on radius.radacct TO 'radius'@'%';
GRANT ALL on radius.radpostauth TO 'radius'@'%';
INSERT into radius.radcheck (username,attribute,op,value) values("test@acme.com", "Cleartext-Password", ":=", "test");

FLUSH PRIVILEGES;