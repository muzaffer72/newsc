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
read -p "Silinecek SSH Kullanıcı Adı : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "Kullanıcı $Pengguna Silindi"
else
        echo -e "Başarısız: Kullanıcı $Pengguna Mevcut Değil"
fi
