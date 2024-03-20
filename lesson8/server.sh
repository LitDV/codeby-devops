
echo -e "$Cyan \n Add hostname to hosts $Color_Off"
echo "192.168.10.196    server.local" >> /etc/hosts

# Установка Apache2

echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt install apache2 -y
echo 'Apache Web Server is installed'

# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

# echo "ServerName 192.168.10.196" >> /etc/apache2/apache2.conf

# Enable mod_rewrite
# sudo a2enmod rewrite

# установка SSL


# Enable SSL mod
sudo a2enmod ssl

# Create SSL

cd /etc/apache2
sudo mkdir ssl ; cd ssl
sudo openssl req -new -x509 -days 365 -nodes -out cert.crt -keyout cert.key -subj "/C=RU/ST=MSK/L=MSK/O=Test Zone/OU=Lesson8/CN=server.local"

sudo cp cert.crt /vagrant/data
sudo cp cert.key /vagrant/data

sudo cp cert.crt /etc/ssl/certs/cert.crt
sudo cp cert.key /etc/ssl/private/cert.key
sudo cp cert.crt /usr/local/share/ca-certificates/cert.crt
sudo chmod 644 /usr/local/share/ca-certificates/cert.crt
sudo update-ca-certificates

# Add new conf

sudo rm /etc/apache2/sites-enabled/*
sudo cp /vagrant/data/server.local.conf /etc/apache2/sites-available/
sudo a2ensite server.local.conf


# Restart Apache
 echo -e "$Cyan \n Restarting Apache $Color_Off"
 sudo systemctl restart apache2
