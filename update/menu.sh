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
color3='\e[031;1m'
color1='\e[34;1m'
color2='\e[0m'
# COLOR VALIDATION
BLUE='\033[0;31m'
RED='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;35m'
GREEN='\033[0;36m'
CYAN='\033[0;37m'
# =========================================
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ BZ TUNNELLING ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " Script By    : BZ TUNNELLING "
echo -e " Exp          : Unlimited "
echo -e " Version      : 0.01 "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " 1)  SSH & OpenVPN MENU                                          "
echo -e " 2)  VMESS MENU                                                   "
echo -e " 3)  VLESS MENU                                                "
echo -e " 4)  TROJAN TCP MENU                                                "
echo -e " 5)  TROJAN GO MENU                                            "
echo -e " 6)  CEK SERVICE MENU                                          "
echo -e " 7)  PENGATURAN MENU                                          "
echo -e " 8)  EDIT PATCH V2RAY                                                  "
echo -e " 9)  CEK V2RAY                                               "
echo -e " 10)  EXIT                                         "                                                         "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Script By BZ TUNNELLING ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Script By BZ TUNNELLING "
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
read -p "Select From Options [ 1 - 13 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
vmessmenu
;;
3)
clear
vlessmenu
;;
4)
clear
trmenu
;;
5)
clear
trgomenu
;;
6)
clear
running
;;
7)
clear
setmenu
;;
8)
clear
nano /etc/xray/config.json
;;
9)
clear
cekxray
;;
10)
clear
exit
;;
*)
clear
menu
;;
esac
