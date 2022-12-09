#!/bin/bash

#updating apt-get and installing apache2
apt update -y
apt install apache2 -y

#creating file with some html code
#using variables from terraform
cat <<EOF >/var/www/html/index.html
<html> 
<title>CAPCI group 1</title>
    <h1>WEB server for migration<h1>
    </body>
</html>
EOF

#restarting apache2
service apache2 restart


#reference: https://bloomlessons.com/posts/26/How%20To%20Install%20PgAdmin%20on%20Ubuntu

sudo curl  https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/pgadmin.gpg
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4 -y

# Reference: https://linuxhint.com/install-pgadmin4-ubuntu/ 
# this one didn't work...
# curl  -fsSL https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/pgadmin.gpg
# echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list

# apt install -y pgadmin4

if [[ $${PGADMIN_SETUP_EMAIL:-"unset"} == "unset" ]]; then
export PGADMIN_SETUP_EMAIL="admin@example.com"
fi

if [[ $${PGADMIN_SETUP_PASSWORD:-"unset"} == "unset" ]]; then
export PGADMIN_SETUP_PASSWORD="password"
fi

echo 'export PGADMIN_SETUP_EMAIL="${PGADMIN_SETUP_EMAIL}"' >> /home/ubuntu/.bashrc
echo 'export PGADMIN_SETUP_PASSWORD="${PGADMIN_SETUP_PASSWORD}"' >> /home/ubuntu/.bashrc

/usr/pgadmin4/bin/setup-web.sh --yes