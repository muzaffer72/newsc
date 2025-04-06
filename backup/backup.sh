#!/bin/bash
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
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Yedekleme Almak İçin E-posta Adresinizi Girin"
read -rp "E-posta : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo "Lütfen Bekleyin, Yedekleme İşlemi Devam Ediyor!!"
rm -rf /root/backup
mkdir /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp /etc/shadow /root/backup/ &> /dev/null
cp /etc/gshadow /root/backup/ &> /dev/null
cp /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
cp -r /var/lib/bztunnelling/ /root/backup/bztunnelling &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
BZ Official Store Yedekleme Detayları
==================================
VPS IP        : $IP
Yedek Bağlantısı   : $link
Tarih       : $date
==================================
" | mail -s "Veri Yedekleme" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
BZ Official Store Yedekleme Detayları
==================================
VPS IP        : $IP
Yedek Bağlantısı   : $link
Tarih       : $date
==================================
"
echo -e "Hepsibiraradavpn by Onvoa.net "
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
read -n 1 -s -r -p "   Menüye dönmek için herhangi bir tuşa basın"
menu
