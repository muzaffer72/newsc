#!/bin/bash
# youtube.com/@anuy63
# My Telegram : https://t.me/onvaovpn
# ==========================================
# Renk
BLUE='\033[0;31m'
RED='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;33m'
BLUE='\033[0;34m'
RED='\033[0;35m'
GREEN='\033[0;36m'
CYAN='\033[0;37m'
# ==========================================
# Alınıyor
MYIP=$(wget -qO- icanhazip.com);

echo "VPS Erişim Haklarını Kontrol ediliyor..."

clear
echo "VPS Kontrol Ediliyor"
clear

# Proxy Şablonu Alınıyor
wget -q -O /usr/local/bin/ws-nontls https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/websocket.py
chmod +x /usr/local/bin/ws-nontls

# Servis Kurulumu
cat > /etc/systemd/system/ws-nontls.service << END
[Unit]
Description=Python Proxy Mod By anuybazoelk
Documentation=https://t.me/onvaovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-nontls 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-nontls
systemctl restart ws-nontls

# Proxy Şablonu Alınıyor
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Servis Kurulumu
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By anuybazoelk
Documentation=https://t.me/onvaovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-ovpn
systemctl restart ws-ovpn

# Proxy Şablonu Alınıyor
wget -q -O /usr/local/bin/ws-tls https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/ws-tls
chmod +x /usr/local/bin/ws-tls

# Servis Kurulumu
cat > /etc/systemd/system/ws-tls.service << END
[Unit]
Description=Python Proxy Mod By anuybazoelk
Documentation=https://t.me/onvaovpn
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls 443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-tls
systemctl restart ws-tls
