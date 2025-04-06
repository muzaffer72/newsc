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
data=(`find /var/log/ -name *.log`);
for log in "${data[@]}"
do
echo "$log temizlendi"
echo > $log
done
data=(`find /var/log/ -name *.err`);
for log in "${data[@]}"
do
echo "$log temizlendi"
echo > $log
done
data=(`find /var/log/ -name mail.*`);
for log in "${data[@]}"
do
echo "$log temizlendi"
echo > $log
done
echo > /var/log/syslog
echo > /var/log/btmp
echo > /var/log/messages
echo > /var/log/debug
echo -e "${PURPLE}Nyari Tarafından - Ücretsiz"
