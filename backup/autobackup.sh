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


clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[AÇIK]${Font_color_suffix}"
Error="${Red_font_prefix}[KAPALI]${Font_color_suffix}"
cek=$(grep -c -E "^# BEGIN_Backup" /etc/crontab)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
function start() {
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Lütfen e-postanızı girin"
read -rp "E-posta : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
cat << EOF >> /etc/crontab
# BEGIN_Yedekleme
5 0 * * * root backup
# END_Yedekleme
EOF
service cron restart
sleep 1
echo " Lütfen Bekleyin"
clear
echo " Otomatik Yedekleme Başlatıldı"
echo " Veriler 00:05 GMT +7'de otomatik olarak yedeklenecek"
exit 0
}
function stop() {
email=$(cat /home/email)
sed -i "/^$email/d" /home/email
sed -i "/^# BEGIN_Yedekleme/,/^# END_Yedekleme/d" /etc/crontab
service cron restart
sleep 1
echo " Lütfen Bekleyin"
clear
echo " Otomatik Yedekleme Durduruldu"
exit 0
}
clear
echo -e "=============================="
echo -e "     Otomatik Veri Yedekleme $sts     "
echo -e "=============================="
echo -e "1. Otomatik Yedeklemeyi Başlat"
echo -e "2. Otomatik Yedeklemeyi Durdur"
echo -e "=============================="
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
