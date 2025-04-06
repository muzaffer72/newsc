#!/bin/bash
clear
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
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# RENK DOĞRULAMA
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# =========================================
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ Ana Menü Muzaffer Şanlı ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Betik Yazarı : Muzaffer Şanlı"
echo -e "❇️ Betik Süresi : Sınırsız"
echo -e "❇️ Versiyon     : En Son Sürüm"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ 1) SSH & OpenVPN MENÜSÜ                                          "
echo -e "❇️ 2) L2TP MENÜSÜ                                                   "
echo -e "❇️ 3) PPTP MENÜSÜ                                                "
echo -e "❇️ 4) SSTP MENÜSÜ                                                "
echo -e "❇️ 5) WIREGUARD MENÜSÜ                                            "
echo -e "❇️ 6) SHADOWSOCKS MENÜSÜ                                          "
echo -e "❇️ 7) SHADOWSOCKSR MENÜSÜ                                          "
echo -e "❇️ 8) VMESS MENÜSÜ                                                 "
echo -e "❇️ 9) VLESS MENÜSÜ                                               "
echo -e "❇️ 10) TROJAN GFW MENÜSÜ                                         "
echo -e "❇️ 11) TROJAN GO MENÜSÜ                                            "
echo -e "❇️ 12) VPS SERVİS KONTROLÜ                                            "
echo -e "❇️ 13) AYARLAR                                                "
echo -e "❇️ 14) V2RAY KONTROLÜ "
echo -e "❇️ 15) V2RAY YAPILANDIRMA DÜZENLEME "
echo -e "❇️ 16) ÇIKIŞ                                                        "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Muzaffer Şanlı Tarafından Geliştirildi ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -p "Seçeneklerden Birini Seçin [ 1 - 13 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
running
;;
13)
clear
setmenu
;;
14)
clear
cekxray
;;
15)
clear
nano /etc/xray/config.json
;;
16)
clear
exit
;;
*)
clear
menu
;;
esac
