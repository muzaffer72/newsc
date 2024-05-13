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
# COLOR VALIDATION
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
echo -e "\E[44;1;39m            ⇱ VMESS ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " 1) Create VMESS "
echo -e " 2) Delete VMESS"
echo -e " 3) Renew User"
echo -e " 4) Check User "
echo -e " 5) Back to Menu "
echo -e " 6) exit "
echo -e " 7) RENEW CERT V2RAY "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Script By BZ TUNNELLING ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
read -p "Select From Options [ 1 - 7 ] : " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
clear
menu
;;
6)
clear
exit
;;
7)
clear
certv2ray
;;
*)
clear
menu
;;
esac
