# to make laptop not sleep when the lid is closed edit 
v /etc/systemd/logind.conf
systemctl restart systemd-logind # to reload the changes
