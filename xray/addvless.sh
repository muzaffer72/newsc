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
source /var/lib/bztunnelling/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Kullanıcı Adı : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Kullanıcı Adı ${RED}${user}${NC} Zaten VPS'de Mevcut, Lütfen Başka Bir Tane Seçin"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Süre (Gün) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/vless/&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/vless/&encryption=none&type=ws#${user}"
systemctl restart xray.service
service cron restart
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ XRAYS/VLESS ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Not         : ${user}"
echo -e "❇️ IP/Sunucu   : ${MYIP}"
echo -e "❇️ Adres       : ${domain}"
echo -e "❇️ Port TLS    : ${tls}"
echo -e "❇️ Port No TLS : ${nontls}"
echo -e "❇️ Kullanıcı ID     : ${uuid}"
echo -e "❇️ Alter ID    : 0"
echo -e "❇️ Güvenlik    : auto"
echo -e "❇️ Ağ        : ws"
echo -e "❇️ Yol         : /vless/"
echo -e "❇️ Oluşturulma : $hariini"
echo -e "❇️ Bitiş       : $exp"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m         TLS Bağlantısı    : ${xrayvless1}          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m         TLS Olmayan Bağlantı : ${xrayvless2}          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
