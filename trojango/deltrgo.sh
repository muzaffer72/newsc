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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Mevcut istemciniz yok!"
		exit 1
	fi

	echo ""
	echo " Kaldırmak istediğiniz mevcut istemciyi seçin"
	echo " Geri dönmek için CTRL+C tuşlarına basın"
	echo " ==============================="
	echo "     No  Süresi Doldu   Kullanıcı"
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Bir istemci seçin [1]: " CLIENT_NUMBER
		else
			read -rp "Bir istemci seçin [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan-go/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
systemctl restart trojan-go.service
service cron restart
clear
echo ""
echo "============================"
echo "  TrojanGo Hesabı Silindi  "
echo "============================"
echo "Kullanıcı Adı : $user"
echo "Süresi Doldu  : $exp"
echo "============================"
echo "Hepsibiraradavpn by Onvoa.net"
