#!/bin/bash
#renk
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

#portu kontrol et ve göster

ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"

#değiştirilecek portu gir
echo -e "======================================"
echo -e ""
echo -e "Portu Değiştir $ws"
echo -e ""
echo -e "======================================"
read -p "Yeni SSH WS Portu : " ws2
if [ -z $ws2 ]; then
echo "Lütfen Portu Girin"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ws2)
if [[ -z $cek ]]; then


#servis portunu değiştir
sed -i "s/$ws/$ws2/g" /etc/default/sslh
sed -i "s/$ws/$ws2/g" /etc/stunnel5/stunnel5.conf
sed -i "s/   - Websocket TLS           : $ws/   - Websocket TLS           : $ws2/g" /root/log-install.txt

iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $ws -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $ws -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $ws2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $ws2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null


sed -i "s/$ws/$ws2/g" /etc/systemd/system/ws-tls.service
systemctl daemon-reload
systemctl restart sslh
systemctl restart ws-tls > /dev/null

#bilgi portunu değiştir

echo -e "\e[032;1mPort $ws2 başarıyla değiştirildi\e[0m"
else
echo "Port $ws2 kullanılıyor"
fi



#tamamlandı 
