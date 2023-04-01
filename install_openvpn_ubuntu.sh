apt update
wget -O openvpn.sh https://get.vpnsetup.net/ovpn
sudo bash openvpn.sh
apt install net-tools
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 10.8.0.2:80
apt install iptables-persistent
iptables-save > /etc/iptables/rules.v4
