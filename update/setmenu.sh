#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color3='\e[031;1m'
color1='\e[34;1m'
color2='\e[0m'
# RENK DOĞRULAMA
BLUE='\033[0;31m'
RED='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;35m'
GREEN='\033[0;36m'
CYAN='\033[0;37m'
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ HEPSİBİRARADAVPN ONVAO.NET ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e "Betik Yazarı    : HEPSİBİRARADAVPN ONVAO.NET "
echo -e "Süre          : Sınırsız "
echo -e "Versiyon      : 0.01 "
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ HEPSİBİRARADAVPN ONVAO.NET ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " 1) Alan Adı Değiştir "
echo -e " 2) Port Düzenle "
echo -e " 3) Otomatik Yedekleme "
echo -e " 4) Veri Yedekleme "
echo -e " 5) Veri Geri Yükleme "
echo -e " 6) Webmin Menüsü "
echo -e " 7) Sunucu Bant Genişliği Hızını Sınırla "
echo -e " 8) VPS RAM Kullanımını Kontrol Et "
echo -e " 9) Yeniden Başlat "
echo -e " 10) Hız Testi "
echo -e " 11) Sistem Bilgilerini Göster  "
echo -e " 12) Betik Bilgisi "
echo -e " 13) Menü "
echo -e " 14) ÇIKIŞ "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ HEPSİBİRARADAVPN ONVAO.NET ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
read -p "Seçeneklerden Birini Seçin [ 1 - 60 ] : " menu
echo -e ""
case $menu in
1)
addhost
;;
2)
changeport
;;
3)
autobackup
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limitspeed
;;
8)
ram
;;
9)
reboot
;;
10)
speedtest
;;
11)
info
;;
12)
about
;;
13)
clear
menu
;;
14)
clear
exit
;;
*)
clear
menu
;;
esac
