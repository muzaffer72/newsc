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

echo "VPS Kontrol Ediliyor"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#&# " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "Mevcut istemciniz yok!"
		exit 1
	fi

	clear
	echo ""
	echo "Yenilemek istediğiniz mevcut istemciyi seçin"
	echo " Geri dönmek için CTRL+C tuşlarına basın"
	echo -e "==============================="
	grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Bir istemci seçin [1]: " CLIENT_NUMBER
		else
			read -rp "Bir istemci seçin [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Süre (Gün) : " masaaktif
user=$(grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#&# $user $exp/#&# $user $exp4/g" /etc/xray/config.json
clear
echo ""
echo "================================"
echo "  XRAYS/Trojan Hesabı Yenilendi  "
echo "================================"
echo "Kullanıcı Adı  : $user"
echo "Süresi Doldu  : $exp4"
echo "================================"
echo "Muzaffer Şanlı Tarafın geliştirildi"
