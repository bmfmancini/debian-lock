
#!/bin/bash


echo " This script will put some basic security messures in place such as fail2ban antivirus  ufw and some iptables rules"
sleep 1



echo " Downloading UFW"
sleep  1
sudo apt-get install ufw -y



echo "Allowing HTTP and SSH"

sleep 1

sudo ufw allow ssh

sudo ufw allow http



echo " Enabling UFW"

sudo ufw enable

echo " Instaling Fail2ban"

sleep 1
sudo apt-get install fail2ban -y



echo " Installing Antivirus"
sleep 1

sudo apt-get install clamav -y



echo " Updating Antivirus"

sleep 1

sudo freshclam



echo "locking down syn"

sleep 1
sudo iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

echo "Enabling Fragments check"
sleep 1

iptables -A INPUT -f -j DROP

echo "Drop Null packets"
sleep 1

iptables -A INPIT -p tcp --tcp-flags ALL NONE -j DROP


echo " Installing RKhunter"
 sleep 1
  sudo apt-get install rkhunter -y


echo " Installing Mod Evasive"
 sleep 1
  sudo apt-get install libapache2-mod-evasive -y
    sudo mkdir /var/log/mod_evasive
     sudo chown www-data:www-data /var/log/mod_evasive/
        #sudo touch /etc/apache2/mods-available/mod-evasive.conf
         sudo nano /etc/apache2/mods-available/mod-evasive.conf
             



