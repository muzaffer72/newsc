#!/bin/bash
# My Telegram : https://t.me/onvaovpn
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
export CHATID="989061293"
export KEY="7721006940:AAHD_7QqIdBOGyOB2JVBS0bEsAOTmoYiqLs"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
MYIP=$(wget -qO- icanhazip.com);

echo "VPS Erişim Haklarını Kontrol ediliyor..."
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6285349326511"
echo -e "${NC}${LIGHT}WhatsApp : https://wa.me/6287728411949"
echo -e "${NC}${LIGHT}Youtube : youtube.com/@anuy63"
echo -e "${NC}${LIGHT}Telegram : https://t.me/onvaovpn"
echo -e "${NC}${LIGHT}Telegram : https;//t.me/anuybazoelk639"
exit 0
fi
clear
echo "Checking VPS"
clear
source /var/lib/bztunnelling/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${CLIENT_NAME}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vmess-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
sed -i '/#xray-vmess-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'"' /etc/xray/config.json
cat>/etc/xray/vmess-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/vmess-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/vmess-$user-nontls.json)"
rm -rf /etc/xray/vmess-$user-tls.json
rm -rf /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
service cron restart

cat >/var/www/html/vmess-$user.txt <<-END

====================
HEPSİBİRARADAVPN ONVAO.NET
====================
wa.me/6287728411949
t.me/anuybazoelk
====================
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 8443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /
    headers:
      Host: ${domain}

====================
 Link Akun Vmess                   
====================
Link TLS         : 
${xrayv2ray1}
====================
Link none TLS    : 
${xrayv2ray2}
====================

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g');
d=$(( ${c} * 1024*1024*1024 ));

if [[ ${c} != "0" ]]; then
echo "${d}" > /etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid}" >>/etc/vmess/.vmess.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>====================</code>
<code>      XRAY/VMESS</code>
<code>====================</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Port TLS  : 8443
Port NTLS : 80
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws
Path      : /
Name      : vmess</code>
<code>====================</code>
<code> VMESS WS TLS</code>
<code>====================</code>
<code>${xrayv2ray1}</code>
<code>====================</code>
<code>VMESS WS NO TLS</code>
<code>====================</code>
<code>${xrayv2ray2}</code>
<code>====================</code>
<code>====================</code>
Format OpenClash : https://${domain}:81/vmess-$user.txt
<code>====================</code>
Dibuat Pada    : $hariini
Berakhir Pada  : $exp
<code>====================</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ XRAYS/VMESS ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "❇️ Remarks		: ${user}"
echo -e "❇️ IP/Host		: ${MYIP}"
echo -e "❇️ Address		: ${domain}"
echo -e "❇️ Port TLS		: ${tls}"
echo -e "❇️ Port No TLS		: ${nontls}"
echo -e "❇️ User ID		: ${uuid}"
echo -e "❇️ Alter ID		: 0 "
echo -e "❇️ Security		: auto "
echo -e "❇️ Network		: ws "
echo -e "❇️ Path		: / "
echo -e "❇️ Created		: $hariini "
echo -e "❇️ Expired		: $exp "
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m	Link TLS	: ${xrayv2ray1}          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m	Link No TLS	: ${xrayv2ray2}          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "	whatsapp		: wa.me/6287728411949 "
echo -e "	Telegram		: t.me/anuybazoelk "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
