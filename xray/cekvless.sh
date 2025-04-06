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
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^####' | cut -d ' ' -f 2`);
echo "----------------------------------------";
echo "---------=[ Vless Kullanıcı Girişi ]=---------";
echo "----------------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="mevcutdeğil"
fi
echo -n > /tmp/ipvless.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "kullanıcı : $akun";
echo "$jum2";
echo "----------------------------------------"
fi
rm -rf /tmp/ipvless.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "diğer";
echo "$oth";
echo "----------------------------------------"
echo "Muzaffer Şanlı Tarafın geliştirildi"
rm -rf /tmp/other.txt
