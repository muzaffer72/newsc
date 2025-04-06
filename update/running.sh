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
# Alınıyor
# IP Doğrulama
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipinfo.io/ip)

red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
İZİN
clear

# İŞLETİM SİSTEMİ BİLGİLERİNİ ALMA
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP BİLGİLERİ
#ITAM='\033[0;30m'
echo -e "$ITAM"
CITY=$( curl -s ipinfo.io/city )
#clear

# DURUM KONTROLÜ 
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel5 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trgo="$(systemctl show trojan-go.service --no-page)"                                      
strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)  
wstls=$(systemctl status ws-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# RENK DOĞRULAMA
BLUE='\033[0;31m'
RED='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;35m'
GREEN='\033[0;36m'
CYAN='\033[0;37m'
clear

# OPENVPN SERVİS DURUMU
if [[ $oovpn == "active" ]]; then
  status_openvpn=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
  status_openvpn="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# SSH SERVİS DURUMU
if [[ $ssh_service == "running" ]]; then 
   status_ssh=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_ssh="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# SQUID SERVİS DURUMU
if [[ $squid_service == "running" ]]; then 
   status_squid=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_squid="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# VNSTAT SERVİS DURUMU
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_vnstat="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# CRON SERVİS DURUMU
if [[ $cron_service == "running" ]]; then 
   status_cron=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_cron="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# FAIL2BAN SERVİS DURUMU
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_fail2ban="${RED}  Çalışmıyor ${NC}  ( Hata )"
fi

# TLS SERVİS DURUMU
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray=" ${GREEN}Çalışıyor${NC} ( Hata Yok )"
else
   status_tls_v2ray="${RED}  Çalışmıyor${NC}   ( Hata )"
fi

# NON TLS V2RAY SERVİS DURUMU
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   status_nontls_v2ray="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# VLESS HTTPS SERVİS DURUMU
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Çalışıyor${NC} ( Hata Yok )"
else
  status_tls_vless="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# VLESS HTTP SERVİS DURUMU
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Çalışıyor${NC} ( Hata Yok )"
else
  status_nontls_vless="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# TROJAN SERVİS DURUMU
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   status_virus_trojan="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# TROJAN GO SERVİS DURUMU
if [[ $strgo == "active" ]]; then
  status_trgo=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
  status_trgo="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# DROPBEAR SERVİS DURUMU
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh=" ${GREEN}Çalışıyor${NC} ( Hata Yok )${NC}"
else
   status_beruangjatuh="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# STUNNEL SERVİS DURUMU
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel=" ${GREEN}Çalışıyor ${NC}( Hata Yok )"
else
   status_stunnel="${RED}  Çalışmıyor ${NC}  ( Hata )}"
fi

# WEBSOCKET TLS SERVİS DURUMU
if [[ $wstls == "running" ]]; then 
   swstls=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   swstls="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# WEBSOCKET DROPBEAR SERVİS DURUMU
if [[ $wsdrop == "running" ]]; then 
   swsdrop=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   swsdrop="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# WEBSOCKET OPEN OVPN SERVİS DURUMU
if [[ $wsovpn == "running" ]]; then 
   swsovpn=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   swsovpn="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# SSLH / SSH SERVİS DURUMU
if [[ $osslh == "running" ]]; then 
   sosslh=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}"
else
   sosslh="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# WEBSOCKET OPENSSH SERVİS DURUMU
if [[ $wsopen == "running" ]]; then 
   swsopen=" ${GREEN}Çalışıyor ${NC}( Hata Yok )${NC}" 
else
   swsopen="${RED}  Çalışmıyor ${NC}  ( Hata )${NC}"
fi

# TOPLAM RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# EN SON ÇEKİRDEK
kernelku=$(uname -r)

# ALAN ADI ALMA
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m             ⇱ Sistem Bilgileri ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Sunucu Adı    : $HOSTNAME"
echo -e "❇️ İşletim Sistemi          : $Tipe"
echo -e "❇️ RAM         : ${totalram}MB"
echo -e "❇️ IP          : $MYIP"
echo -e "❇️ Alan Adı      : $Domen"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Abonelik Bilgileri ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ İstemci Adı  : $Name "
echo -e "❇️ Bitiş          : $Exp "
echo -e "❇️ Versiyon      : 0.01 "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m             ⇱ Servis Bilgileri ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ SSH / TUN               :$status_ssh"
echo -e "❇️ OpenVPN                 :$status_openvpn"
echo -e "❇️ Dropbear                :$status_beruangjatuh"
echo -e "❇️ Stunnel5                :$status_stunnel"
echo -e "❇️ Fail2Ban                :$status_fail2ban"
echo -e "❇️ Crons                   :$status_cron"
echo -e "❇️ Vnstat                  :$status_vnstat"
echo -e "❇️ XRAYS Vmess TLS         :$status_tls_v2ray"
echo -e "❇️ XRAYS Vmess None TLS    :$status_nontls_v2ray"
echo -e "❇️ XRAYS Vless TLS         :$status_tls_vless"
echo -e "❇️ XRAYS Vless None TLS    :$status_nontls_vless"
echo -e "❇️ Shadowsocks-OBFS HTTP   :$status_ssh"
echo -e "❇️ XRAYS Trojan            :$status_virus_trojan"
echo -e "❇️ Trojan GO               :$status_trgo"
echo -e "❇️ Websocket TLS           :$swstls"
echo -e "❇️ Websocket None TLS      :$swsdrop"
echo -e "❇️ Websocket Ovpn          :$swsovpn"
echo -e "❇️ SSL / SSH Multiplexer   :$sosslh"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Hepsibiraradavpn by Onvoa.net "
echo -e "Whatsapp      : wa.me/6287728411949 "
echo -e "Telegram      : t.me/anuybazoelk "
echo ""
