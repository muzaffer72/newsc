#!/bin/bash
# My Telegram : https://t.me/anuybazoelk
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
export CHATID="1328284490"
export KEY="8068817658:AAFg9G7lJq7UMoF94EN8ihraoT5DQaJgbfw"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://mrtunneldo2024.github.io/ip | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook	: https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp	: https://wa.me/6285349326511"
echo -e "${NC}${LIGHT}WhatsApp	: https://wa.me/6287728411949"
echo -e "${NC}${LIGHT}Youtube	: youtube.com/@anuy63"
echo -e "${NC}${LIGHT}Telegram	: https://t.me/anuybazoelk"
echo -e "${NC}${LIGHT}Telegram	: https;//t.me/anuybazoelk639"
exit 0
fi
clear
echo "Checking VPS"
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/bztunnelling/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "Tr Go" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
systemctl restart trojan-go.service
link="trojan://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/trojango&encryption=none#$user"
clear
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan-go/${user}
fi
DATADB=$(cat /etc/trojan-go/.trojan-go.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan-go/.trojan-go.db
fi
echo "### ${user} ${exp} ${uuid}" >>/etc/trojan-go/.trojan-go.db
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>====================</code>
<code>		TROGO</code>
<code>====================</code>
<code>Remarks	: ${user}
Address    : ${domain}
Port       : ${trgo}
Key        : ${user}
alterId   : 0
Security  : auto
network   : ws
Path      : /trojango
Name      : TROJAN-GO</code>
<code>====================</code>
<code> TROJAN-GO</code>
<code>====================</code>
<code>${link}</code>
<code>====================</code>
Dibuat Pada    : $hariini
Berakhir Pada  : $exp
whatsapp	: wa.me/6287728411949
Telegram	: t.me/anuybazoelk
<code>====================</code>

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "=======-TROJAN-GO-======="
echo -e "Remarks	: ${user} "
echo -e "Address	: ${domain} "
echo -e "Port		: ${trgo} "
echo -e "Key		: ${user} "
echo -e "Encryption	: none "
echo -e "Path		: /trojango "
echo -e "Created	: $hariini "
echo -e "Expired	: $exp "
echo -e "========================="
echo -e "Link TrGo	: ${link} "
echo -e "========================="
echo -e "whatsapp	: wa.me/6287728411949 "
echo -e "Telegram	: t.me/anuybazoelk "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "Script By BZ TUNNELLING"
