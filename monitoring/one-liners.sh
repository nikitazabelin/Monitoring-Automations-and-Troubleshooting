#
netstat -tulpn | grep LISTEN

rm -f -r

netstat -tulpn | grep ':443'

sudo ss -tulw
sudo ss -tulwn
sudo ss -tulwn | grep LISTEN

sudo lsof -i -P -n
sudo lsof -i -P -n | grep LISTEN
doas lsof -i -P -n | grep LISTEN

