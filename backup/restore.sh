#!/bin/bash
# ==========================================
# Renk
RED='\033[0;31m'
NC='\033[0;37m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Alınıyor
clear
echo "Bu Özellik Yalnızca Bu Otomatik Betik ile VPS Verileriyle Kullanılabilir"
echo "Lütfen VPS veri yedekleme dosyanızın bağlantısını girin"
echo "Daha önce VPS veri yedeklemesi yaptıysanız e-postanızı kontrol edebilirsiniz"
echo " "
read -rp "Dosya Bağlantısı: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Geri Yüklemeyi Başlat
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • Parola verileri geri yükleniyor..."
sleep 1
cp /root/backup/passwd /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • Grup verileri geri yükleniyor..."
sleep 1
cp /root/backup/group /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • Gölge verileri geri yükleniyor..."
sleep 1
cp /root/backup/shadow /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • gshadow verileri geri yükleniyor..."
sleep 1
cp /root/backup/gshadow /etc/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • chap-secrets verileri geri yükleniyor..."
sleep 1
cp /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • passwd1 verileri geri yükleniyor..."
sleep 1
cp /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • ss.conf verileri geri yükleniyor..."
sleep 1
cp /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
echo -e "$COLOR1│${NC}  [ ${green}BİLGİ${NC} ] • Yönetici verileri geri yükleniyor..."
sleep 1
cp -r /root/backup/bztunnelling /var/lib/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/bztunnelling /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
rm -rf /root/backup &> /dev/null
rm -rf /root/backup
echo -e "$COLOR1│${NC}  [ ${GREEN}BİLGİ${NC} ] • Tamamlandı... Başarıyla"
rm -f backup.zip
echo Tamamlandı
echo ""
read -n 1 -s -r -p "   Menüye geri dönmek için herhangi bir tuşa basın"
menu
