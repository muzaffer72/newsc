#!/bin/bash
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

echo "VPS Kontrol Ediliyor"
clear
# ==================================================
# Host Linkiniz
akbarvpn="raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/ssh"

# Xray İçin Host Linkiniz
akbarvpnn="raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/xray"

# Trojan Go İçin Host Linkiniz
akbarvpnnn="raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/trojango"

# Stunnel5 İçin Host Linkiniz
akbarvpnnnn="raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/stunnel5"

# değişkenleri başlatma
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#şirket adı ayrıntıları
country=TR
state=Adana
locality=Türkiye
organization=onvao.net
organizationalunit=onvao.net
commonname=onvao.net
email=guzelim.batmanli@gmail.com

# basit şifre minimum
wget -O /etc/pam.d/common-password "https://${akbarvpn}/password"
chmod +x /etc/pam.d/common-password

# kök dizine git
cd

# /etc/systemd/system/rc-local.service dosyasını düzenle
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# Varsayılan olarak bu betik hiçbir şey yapmaz.
exit 0
END

# Erişim izinlerini değiştir
chmod +x /etc/rc.local

# rc local'ı etkinleştir
systemctl enable rc-local
systemctl start rc-local.service

# ipv6'yı devre dışı bırak
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#güncelle
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# wget ve curl yükle
apt -y install wget curl

# Gerekli Araçları Yükle
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y

# zamanı GMT +7 olarak ayarla
ln -fs /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

# yerel ayarları ayarla
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# yükle
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# web sunucusunu yükle
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://${akbarvpn}/nginx.conf > /etc/nginx/nginx.conf
curl https://${akbarvpn}/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://${akbarvpn}/index.html1"
/etc/init.d/nginx restart
cd

# badvpn yükle
cd
wget -O /usr/bin/badvpn-udpgw "https://${akbarvpn}/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# ssh portunu ayarla
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# dropbear yükle
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# squid yükle
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://${akbarvpn}/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# SSLH Yükle
apt -y install sslh
rm -f /etc/default/sslh

# SSLH Ayarları
cat > /etc/default/sslh <<-END
# sslh initscript için varsayılan seçenekler
# /etc/init.d/sslh tarafından kaynak alınmıştır

# Yapılandırmayı okumaya zorlamak için varsayılan olarak devre dışı bırakılmıştır:
# - /usr/share/doc/sslh/README.Debian (hızlı başlangıç)
# - /usr/share/doc/sslh/README, "Yapılandırma" bölümünde
# - Daha fazla yapılandırma ayrıntısı için "man sslh" aracılığıyla sslh(8).
# Yapılandırma hazır olduğunda, burada RUN'ı evet olarak ayarlamanız
# ve sslh'yi başlatmayı denemeniz gerekir (yalnızca bağımsız mod)

RUN=yes

# kullanılacak ikili dosya: çatallanmış (sslh) veya tek iş parçacıklı (sslh-select) sürüm
# systemd kullanıcıları: /lib/systemd/system/sslh.service dosyasını değiştirmeyi unutmayın
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssl 127.0.0.1:777 --ssh 127.0.0.1:109 --openvpn 127.0.0.1:1194 --http 127.0.0.1:8880 --pidfile /var/run/sslh/sslh.pid -n"

END

# SSLH Servisini Yeniden Başlat
service sslh restart
systemctl restart sslh
/etc/init.d/sslh restart
/etc/init.d/sslh status
/etc/init.d/sslh restart

# vnstat ayarları
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel 5 
cd /root/
wget -q -O stunnel5.zip "https://${akbarvpnnnn}/stunnel5.zip"
unzip -o stunnel5.zip
cd /root/stunnel
chmod +x configure
./configure
make
make install
cd /root
rm -r -f stunnel
rm -f stunnel5.zip
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/xray/xray.crt
key = /etc/xray/xray.key
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 445
connect = 127.0.0.1:109

[openssh]
accept = 777
connect = 127.0.0.1:443

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
#openssl genrsa -out key.pem 2048
#openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
#-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
#cat key.pem cert.pem >> /etc/stunnel5/stunnel5.pem

# Service Stunnel5 systemctl restart stunnel5
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://t.me/onvaovpn
Documentation=https://github.com/muhammadnoor674
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/bin/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
wget -q -O /etc/init.d/stunnel5 "https://${akbarvpnnnn}/stunnel5.init"

# Ubah Izin Akses
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/bin/stunnel5

# Remove File
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
#rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

#OpenVPN
wget https://${akbarvpn}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Install BBR
wget https://${akbarvpn}/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# Ganti Banner
wget -O /etc/issue.net "https://${akbarvpn}/issue.net"

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O addhost "https://${akbarvpn}/addhost.sh"
wget -O about "https://${akbarvpn}/about.sh"
wget -O menu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/menu.sh"
wget -O addssh "https://${akbarvpn}/addssh.sh"
wget -O trialssh "https://${akbarvpn}/trialssh.sh"
wget -O delssh "https://${akbarvpn}/delssh.sh"
wget -O member "https://${akbarvpn}/member.sh"
wget -O delexp "https://${akbarvpn}/delexp.sh"
wget -O cekssh "https://${akbarvpn}/cekssh.sh"
wget -O restart "https://${akbarvpn}/restart.sh"
wget -O speedtest "https://${akbarvpn}/speedtest_cli.py"
wget -O info "https://${akbarvpn}/info.sh"
wget -O ram "https://${akbarvpn}/ram.sh"
wget -O renewssh "https://${akbarvpn}/renewssh.sh"
wget -O autokill "https://${akbarvpn}/autokill.sh"
wget -O ceklim "https://${akbarvpn}/ceklim.sh"
wget -O tendang "https://${akbarvpn}/tendang.sh"
wget -O clearlog "https://${akbarvpn}/clearlog.sh"
wget -O changeport "https://${akbarvpn}/changeport.sh"
wget -O portovpn "https://${akbarvpn}/portovpn.sh"
wget -O portwg "https://${akbarvpn}/portwg.sh"
wget -O porttrojan "https://${akbarvpn}/porttrojan.sh"
wget -O portsstp "https://${akbarvpn}/portsstp.sh"
wget -O portsquid "https://${akbarvpn}/portsquid.sh"
wget -O portvlm "https://${akbarvpn}/portvlm.sh"
wget -O wbmn "https://${akbarvpn}/webmin.sh"
wget -O xp "https://${akbarvpn}/xp.sh"
wget -O swapkvm "https://${akbarvpn}/swapkvm.sh"
wget -O addvmess "https://${akbarvpnn}/addv2ray.sh"
wget -O addvless "https://${akbarvpnn}/addvless.sh"
wget -O addtrojan "https://${akbarvpnn}/addtrojan.sh"
wget -O delvmess "https://${akbarvpnn}/delv2ray.sh"
wget -O delvless "https://${akbarvpnn}/delvless.sh"
wget -O deltrojan "https://${akbarvpnn}/deltrojan.sh"
wget -O cekvmess "https://${akbarvpnn}/cekv2ray.sh"
wget -O cekvless "https://${akbarvpnn}/cekvless.sh"
wget -O cektrojan "https://${akbarvpnn}/cektrojan.sh"
wget -O renewvmess "https://${akbarvpnn}/renewv2ray.sh"
wget -O renewvless "https://${akbarvpnn}/renewvless.sh"
wget -O renewtrojan "https://${akbarvpnn}/renewtrojan.sh"
wget -O certv2ray "https://${akbarvpnn}/certv2ray.sh"
wget -O addtrgo "https://${akbarvpnnn}/addtrgo.sh"
wget -O deltrgo "https://${akbarvpnnn}/deltrgo.sh"
wget -O renewtrgo "https://${akbarvpnnn}/renewtrgo.sh"
wget -O cektrgo "https://${akbarvpnnn}/cektrgo.sh"
wget -O portsshnontls "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/portsshnontls.sh"
wget -O portsshws "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/websocket/portsshws.sh"

wget -O sshovpnmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/sshovpn.sh"
wget -O l2tpmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/l2tpmenu.sh"
wget -O pptpmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/pptpmenu.sh"
wget -O sstpmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/sstpmenu.sh"
wget -O wgmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/wgmenu.sh"
wget -O ssmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/ssmenu.sh"
wget -O ssrmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/ssrmenu.sh"
wget -O vmessmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/vmessmenu.sh"
wget -O vlessmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/vlessmenu.sh"
wget -O trmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/trmenu.sh"
wget -O trgomenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/trgomenu.sh"
wget -O setmenu "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/setmenu.sh"
wget -O running "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/update/running.sh"
wget -O cekxray "https://raw.githubusercontent.com/myridwan/src/ipuk/cekxray.sh"

chmod +x portsshnontls
chmod +x portsshws

chmod +x sshovpnmenu
chmod +x l2tpmenu
chmod +x pptpmenu
chmod +x sstpmenu
chmod +x wgmenu
chmod +x ssmenu
chmod +x ssrmenu
chmod +x vmessmenu
chmod +x vlessmenu
chmod +x trmenu
chmod +x trgomenu
chmod +x setmenu
chmod +x running
chmod +x addhost
chmod +x menu
chmod +x addssh
chmod +x trialssh
chmod +x delssh
chmod +x member
chmod +x delexp
chmod +x cekssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renewssh
chmod +x clearlog
chmod +x changeport
chmod +x portovpn
chmod +x portwg
chmod +x porttrojan
chmod +x portsstp
chmod +x portsquid
chmod +x portvlm
chmod +x wbmn
chmod +x xp
chmod +x swapkvm
chmod +x addvmess
chmod +x addvless
chmod +x addtrojan
chmod +x delvmess
chmod +x delvless
chmod +x deltrojan
chmod +x cekvmess
chmod +x cekvless
chmod +x cektrojan
chmod +x renewvmess
chmod +x renewvless
chmod +x renewtrojan
chmod +x certv2ray
chmod +x addtrgo
chmod +x deltrgo
chmod +x renewtrgo
chmod +x cektrgo
chmod +x cekxray 
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/sslh restart
/etc/init.d/stunnel5 restart
/etc/init.d/vnstat restart
/etc/init.d/fail2ban restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
