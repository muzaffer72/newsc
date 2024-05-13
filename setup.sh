#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# Getting
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m          ⇱ SCRIPT BY BZ TUNNELLING ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://anuy639.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook	: https://m.facebook.com/Anuybazoelk639"
echo -e "${NC}${LIGHT}WhatsApp	: https://wa.me/6285349326511"
echo -e "${NC}${LIGHT}WhatsApp	: https://wa.me/6287728411949"
echo -e "${NC}${LIGHT}Youtube	: youtube.com/@anuy63"
echo -e "${NC}${LIGHT}Telegram	: https://t.me/anuybazoelk"
echo -e "${NC}${LIGHT}Telegram	: https;//t.me/anuybazoelk639"
exit 0
fi
clear
echo "Checking VPS"
clear
sleep 1
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ BZ TUNNELLING ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
mkdir /var/lib/bztunnelling;
echo "IP=" >> /var/lib/bztunnelling/ipvps.conf
wget https://raw.githubusercontent.com/BzTunnelling/sc/main/ssh/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ INSTALL V2RAY ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://raw.githubusercontent.com/BzTunnelling/sc/main/xray/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ INSTALL SSH-CDN ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://raw.githubusercontent.com/BzTunnelling/sc/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#install BACKUP
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ INSTALL BACKUP ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://raw.githubusercontent.com/BzTunnelling/sc/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ INSTALL WEBSOCKET ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
wget https://raw.githubusercontent.com/BzTunnelling/sc/main/websocket/edu.sh && chmod +x edu.sh && ./edu.sh

rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/anuybazoelk

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/BzTunnelling/sc/main/ssh/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH			: 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN			: TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel5			: 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear			: 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy			: 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn			: 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx			: 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS		: 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS		: 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS		: 8443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS		: 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan			: 2083"  | tee -a log-install.txt
echo "   - Websocket TLS		: 443"  | tee -a log-install.txt
echo "   - Websocket None TLS		: 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn		: 2086"  | tee -a log-install.txt
echo "   - Tr Go			: 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone			: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban			: [ON]"  | tee -a log-install.txt
echo "   - Dflate			: [ON]"  | tee -a log-install.txt
echo "   - IPtables			: [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot			: [ON]"  | tee -a log-install.txt
echo "   - IPv6				: [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m		⇱ INSTALL PROJECT SELESAI ⇲          \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
sleep 2
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
