#!/bin/bash
# My Telegram : https://t.me/onvaovpn
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
MYIP=$(wget -qO- icanhazip.com);

echo "VPS Erişim Haklarını Kontrol ediliyor..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${CYAN}Erişim İzin Verildi...${off}"
sleep 1
else
clear
echo -e "${PURPLE}Erişim Engellendi!${off}"
echo "Sadece Ücretli Kullanıcılar İçin!"
echo "Lütfen Yönetici ile İletişime Geçin"
exit 0
fi
clear
echo "VPS Kontrol Ediliyor"
clear
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=Deneme`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Hesap süresi dolar" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ SSH & OpenVPN Bilgileri ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ IP/Sunucu       : $IP"
echo -e "❇️ Alan Adı        : ${domain}"
echo -e "❇️ Kullanıcı Adı      : $Login"
echo -e "❇️ Şifre      : $Pass"
echo -e "❇️ Dropbear      : 109, 143"
echo -e "❇️ SSL/TLS       : $ssl"
echo -e "❇️ Port Squid    : $sqd"
echo -e "❇️ OHP SSH       : 8181"
echo -e "❇️ OHP Dropbear  : 8282"
echo -e "❇️ OHP OpenVPN   : 8383"
echo -e "❇️ Ssh Ws SSL    : $ws"
echo -e "❇️ Ssh Ws No SSL : $ws2"
echo -e "❇️ Ovpn Ws       : 2086"
echo -e "❇️ Port TCP      : $ovpn"
echo -e "❇️ Port UDP      : $ovpn2"
echo -e "❇️ Port SSL      : 990"
echo -e "❇️ OVPN TCP      : http://$IP:89/tcp.ovpn"
echo -e "❇️ OVPN UDP      : http://$IP:89/udp.ovpn"
echo -e "❇️ OVPN SSL      : http://$IP:89/ssl.ovpn"
echo -e "❇️ BadVpn        : 7100-7200-7300"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Payload Websocket Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "HEAD Webserver://${domain}/ HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: keep-alive[crlf]Proxy-Connection: keep-alive[crlf]X-Forwarded-For: ${domain}[crlf]X-Online-Host: ${domain}[crlf]X-Forward-Host: ${domain}[crlf]Content-Lenght: @anuybazoelk639[crlf]Upgrade: NyariGratisan[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Payload Websocket No Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Content-Lenght: @anuybazoelk639[crlf]Upgrade: NyariGratisan[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Oluşturulma    : $hariini ⇲          \E[0m"
echo -e "\E[44;1;39m          ⇱ Bitiş          : $expi ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
