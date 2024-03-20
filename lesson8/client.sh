
#добавление записи в hosts 

echo -e "$Cyan \n Updated hosts $Color_Off"
echo "192.168.10.196    server.local" >> /etc/hosts

# добавление доверенного сертификата

sudo cp /vagrant/data/cert.crt /usr/share/ca-certificates/
sudo cp /vagrant/data/cert.crt /etc/ssl/certs/cert.crt
sudo cp /vagrant/data/cert.key /etc/ssl/private/cert.key
sudo chmod 644 /usr/local/share/ca-certificates/cert.crt
sudo update-ca-certificates


