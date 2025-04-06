#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
	echo "Bu betiği root olarak çalıştırmanız gerekiyor"
	exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
	echo "OpenVZ desteklenmiyor"
	exit 1
fi
# ==========================================
# Renk
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Alınıyor
MYIP=$(wget -qO- ipinfo.io/ip);

if [ -f "/etc/xray/domain" ]; then
echo "Betik Zaten Kurulu"
exit 0
fi
mkdir /var/lib/bztunnelling;
echo "IP="$MYIP >> /var/lib/bztunnelling/ipvps.conf
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/ssh/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/xray/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/edu.sh && chmod +x edu.sh && ./edu.sh
wget https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/ohp/ohp.sh && chmod +x ohp.sh && ./ohp.sh
rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/onvaovpn

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/ssh/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2"
# // Zaman Dilimini Ayarla
timedatectl set-timezone Europe/Istanbul
clear
echo "For Setting Timeout"

echo "==========================================="
echo "Hepsibiraradavpn by Onvoa.net" 
echo "-------------------------------------------"
echo ""  |
/etc/issue.net
echo "IP Adresi : $MYIP"
echo "Alan Adı     : $(cat /etc/xray/domain)"
echo "OpenSSH   : 22"
echo "Dropbear  : 109, 143"
echo "SSL       : 443, 2096, 777"
echo "Squid     : 3128, 8080"
echo "OpenVPN   : TCP 1194, UDP 2200, SSL 992"
echo "Badvpn    : 7100, 7200, 7300"
echo "Nginx     : 89"
echo "XRAY VLESS TLS    : 8443"
echo "XRAY VLESS None TLS : 80"
echo "XRAY VMESS TLS    : 8443"
echo "XRAY VMESS None TLS : 80"
echo "XRAY TROJAN TLS   : 2083"
echo "TrojanGO              : 2087"
echo "Websocket TLS         : 443"
echo "Websocket None TLS    : 8880"
echo "Websocket Ovpn        : 2086"
echo "OHP SSH               : 8181"
echo "OHP Dropbear          : 8282"
echo "OHP OpenVPN           : 8383"
echo ""  |
/etc/issue.net
echo "Webmin : http://$MYIP:10000/"
echo "Otomatik-Yeniden Başlatma Saati : [ Her Gün 05:00 GMT +7 ]"
echo "IPv6 : [KAPALI]"
echo "Oto Yedekleme           : Açık"
echo "Oto Silme Süresi Dolmuş    : Açık"
echo "Oto Öldürme Çoklu Giriş   : Açık"
echo "Whitelist IP Otomatik Betik : $MYIP"
echo "WHATSAPP ONVO VPN : 085714509818"
echo "Telegram : https://t.me/onvaovpn"
echo "===========================================" | tee -a log-install.txt
echo " Hepsibiraradavpn by Onvoa.net" |
 /etc/motd
rm -f setup.sh
echo "Kurulum tamamlandı!!"
