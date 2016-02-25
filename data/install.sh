#!/bin/sh

echo "Running install.sh for $1"

echo "Installing xtcommerce4"
# install shop here
unzip /data/versions/$1.zip -d /www/
echo "Installing XtCommerce license"
mv -f /data/license.txt /www/lic/license.txt

echo "Installing composer packages"
cd  /www \
    && composer.phar self-update \
    && composer.phar install --ignore-platform-reqs

echo "Setting filesystem permissions"
chown -R www-data /www
chgrp -R www-data /www


echo "Installation completed"