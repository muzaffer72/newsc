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
MYIP=$(wget -qO- ipinfo.io/ip);
echo "VPS Kontrol Ediliyor"

if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}İzin Kabul Edildi...${NC}"
else
echo -e "${NC}${RED}İzin Reddedildi!${NC}";
echo -e "${NC}${LIGHT}Lütfen Yönetici ile İletişime Geçin!!${NC}"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp : 085349326511"
echo -e "${NC}${LIGHT}WhatsApp : 081774970898"
echo -e "${NC}${LIGHT}Youtube : youtube.com/@nyarigratisan"
echo -e "${NC}${LIGHT}Telegram : https://t.me/onvaovpn"
echo -e "${NC}${LIGHT}Telegram : https;//t.me/r1f4n_112"
exit 0
fi
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[AÇIK]${Font_color_suffix}"
Error="${Red_font_prefix}[KAPALI]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
echo -e "Tüm Servisler İçin Hızı Sınırla"
read -p "Maksimum indirme hızını ayarlayın (Kbps cinsinden): " down
read -p "Maksimum yükleme hızını ayarlayın (Kbps cinsinden): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Yapılandırmayı Başlat"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "başlat" > /home/limit
echo "Tamamlandı"
fi
}
function stop () {
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Yapılandırmayı Durdur"
sleep 0.5
echo > /home/limit
echo "Tamamlandı"
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "=================================="
echo -e "    Bant Genişliği Hızını Sınırla $sts    "
echo -e "=================================="
echo -e "[1]. Sınırı Başlat"
echo -e "[2]. Sınırı Durdur"
echo -e "==============================="
echo -e "Hepsibiraradavpn by Onvoa.net "
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
read -rp "Lütfen Doğru Numarayı Girin : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo " Yanlış Numara Girdiniz"
menu
fi

