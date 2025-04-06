#!/bin/bash
clear#!/bin/bash
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
echo -e "\E[44;1;39m            ⇱ SSH Menüsü HEPSİBİRARADAVPN ONVAO.NET ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " 1) SSH & OpenVPN Hesabı Oluştur "
echo -e " 2) SSH & OpenVPN Deneme Hesabı Oluştur "
echo -e " 3) SSH & OpenVPN Hesap Süresini Uzat "
echo -e " 4) SSH Kullanıcı Girişlerini Kontrol Et "
echo -e " 5) SSH Üye Listesi "
echo -e " 6) SSH Hesabını Sil "
echo -e " 7) Süresi Dolmuş SSH Kullanıcılarını Sil "
echo -e " 8) SSH Otomatik Kapatma Ayarları "
echo -e " 9) Çoklu Giriş Yapan Kullanıcıları Göster "
echo -e " 10) Tüm Servisleri Yeniden Başlat "
echo -e " 11) Ana Menü "
echo -e " 12) ÇIKIŞ "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Hepsibiraradavpn by Onvoa.net ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
read -p "Seçeneklerden Birini Seçin [ 1 - 12 ] : " menu
echo -e ""
case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
11)
menu
;;
12)
clear
exit
;;
*)
clear
menu
;;
esac
