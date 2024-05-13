#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
export CHATID="923915481"
export KEY="6100820648:AAH6m5Zo9P3X9CEAzUYjazrCac4g1tFa45A"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://anuy639.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6285349326511"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6287728411949"
echo -e "${NC}${LIGHT}Youtube  : youtube.com/@anuy63"
echo -e "${NC}${LIGHT}Telegram : https://t.me/anuybazoelk"
echo -e "${NC}${LIGHT}Telegram : https;//t.me/anuybazoelk639"
exit 0
fi
clear
echo "Checking VPS"
clear
domain=$(cat /etc/xray/domain)
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear
if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g');
d=$(( ${c} * 1024*1024*1024 ));

if [[ ${c} != "0" ]]; then
echo "${d}" > /etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${user} ${exp} ${uuid}" >>/etc/ssh/.ssh.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>====================</code>
<code>SSH PREMIUM BZ OFFICIAL</code>
<code>====================</code>
<code>Remarks   : ${user}
Domain         : ${domain}
Username       : $Login 
Password       : $Pass
Dropbear       : 109, 143
SSL/TLS        : $ssl
Port Squid     : $sqd
Ssh Ws SSL     : $ws
Ssh Ws No SSL  : $ws2
Ovpn Ws        : 2086
Ovpn TCP       : $ovpn
Ovpn UDP       : $ovpn2
Ovpn SSL       : 990 
BadVpn         : 7100-7200-7300
Name      : SSH</code>
<code>====================</code>
<code>PAYLOAD WS TLS</code>
<code>====================</code>
<code>GET ws://${domain}/chat HTTP/1.1[crlf]Keep-Alive-Connection-Close[crlf]Upgrade: Websocket[crlf]Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==[crlf]Sec-WebSocket-Version: 13[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Expect: 100-Continue[crlf]Content-Lenght: @anuybazoelk[crlf]Host: ${domain}[crlf]Connection: keep-alive[crlf]Proxy-Connection: keep-alive[crlf]X-Forwarded-For: ${domain}[crlf]X-Online-Host: ${domain}[crlf]X-Forward-Host: ${domain}[crlf][crlf]</code>
<code>====================</code>
<code>PAYLOAD WS NO TLS</code>
<code>====================</code>
<code>GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Content-Lenght: @anuybazoelk639[crlf]Upgrade: Websocket[crlf][crlf]</code>
<code>====================</code>
<code>OVPN</code>
<code>====================</code>
OVPN TCP       : http://${domain}:89/tcp.ovpn
OVPN UDP       : http://${domain}:89/udp.ovpn
OVPN SSL       : http://${domain}:89/ssl.ovpn
<code>====================</code>
Dibuat Pada    : $hariini
Berakhir Pada  : $expi
Whatsapp       : https://wa.me/6287728411949
Telegram       : https://t.me/anuybazoelk
<code>====================</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m      ⇱ SSH PREMIUM BZ OFFICIAL STORE ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e
ecjo -e "IP/Host        : $IP "
echo -e "Domain         : ${domain} "
echo -e "Username       : $Login "
echo -e "Password       : $Pass "
echo -e "Dropbear       : 109, 143 "
echo -e "SSL/TLS        : $ssl "
echo -e "Port Squid     : $sqd "
echo -e "Ssh Ws SSL     : $ws "
echo -e "Ssh Ws No SSL  : $ws2 "
echo -e "Ovpn Ws        : 2086 "
echo -e "Port TCP       : $ovpn "
echo -e "Port UDP       : $ovpn2 "
echo -e "Port SSL       : 990 "
echo -e "OVPN TCP       : http://${domain}:89/tcp.ovpn "
echo -e "OVPN UDP       : http://${domain}:89/udp.ovpn "
echo -e "OVPN SSL       : http://${domain}:89/ssl.ovpn "
echo -e "BadVpn         : 7100-7200-7300"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m      ⇱ Payload Websocket Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "GET ws://${domain}/chat HTTP/1.1[crlf]Keep-Alive-Connection-Close[crlf]Upgrade: Websocket[crlf]Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==[crlf]Sec-WebSocket-Version: 13[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Expect: 100-Continue[crlf]Content-Lenght: @anuybazoelk[crlf]Host: ${domain}[crlf]Connection: keep-alive[crlf]Proxy-Connection: keep-alive[crlf]X-Forwarded-For: ${domain}[crlf]X-Online-Host: ${domain}[crlf]X-Forward-Host: ${domain}[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m      ⇱ Payload Websocket No Tls ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Content-Lenght: @anuybazoelk639[crlf]Upgrade: Websocket[crlf][crlf]"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m      ⇱ Created        : $hariini ⇲          \E[0m"
echo -e "\E[44;1;39m      ⇱ Expired        : $expi ⇲          \E[0m"
echo -e "\E[44;1;39m      ⇱ Whatsapp       : https://wa.me/6287728411949 ⇲          \E[0m"
echo -e "\E[44;1;39m      ⇱ Telegram       : https://t.me/anuybazoelk ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
