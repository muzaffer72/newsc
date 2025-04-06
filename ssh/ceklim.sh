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

clear
echo "VPS Kontrol Ediliyor"
clear
echo " "
echo "===========================================";
echo " ";
if [ -e "/root/log-limit.txt" ]; then
echo "Maksimum Limiti İhlal Eden Kullanıcı";
echo "Zaman - Kullanıcı Adı - Çoklu Oturum Açma Sayısı"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " Hiçbir kullanıcı ihlalde bulunmadı"
echo " "
echo " veya"
echo " "
echo " Kullanıcı sınırı betiği yürütülmedi."
fi
echo " ";
echo "===========================================";
echo " ";
