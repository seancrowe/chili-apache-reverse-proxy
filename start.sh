#!/bin/bash

# Remove the old configuration file
rm -rf /etc/apache2/sites-available/example.conf

# Create a symbolic link to the new configuration file
ln -s /var/www/html/example.conf /etc/apache2/sites-available/

# Enable the new site
a2ensite example.conf

# Stop Apache
apachectl stop

# Start Apache in the foreground
apachectl -DFOREGROUND