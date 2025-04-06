#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

# // Afiş Durum Bilgilerini Dışa Aktar
export EROR="[${RED} HATA ${NC}]"
export INFO="[${YELLOW} BİLGİ ${NC}]"
export OKEY="[${GREEN} TAMAM ${NC}]"
export PENDING="[${YELLOW} BEKLEMEDE ${NC}]"
export SEND="[${YELLOW} GÖNDER ${NC}]"
export RECEIVE="[${YELLOW} AL ${NC}]"

# // Hizalamayı Dışa Aktar
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
#fi
#sleep 3
#echo -e "
#"
date
echo ""
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] Kontrol ediliyor... "
sleep 2
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] rclone indiriliyor & kuruluyor... "
curl -fsSL https://rclone.org/install.sh | bash > /dev/null 2>&1
printf "q\n" | rclone config > /dev/null 2>&1
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] rclone yapılandırması indiriliyor ... "
wget -q -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/backup/rclone.conf"
git clone https://github.com/magnific0/wondershaper.git &> /dev/null
cd wondershaper
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] wondershaper kuruluyor... "
make install > /dev/null 2>&1
cd
rm -rf wondershaper > /dev/null 2>&1
echo > /home/limit

pkgs='msmtp-mta ca-certificates bsd-mailx'
if ! dpkg -s $pkgs > /dev/null 2>&1; then
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] Kuruluyor... "
apt install -y $pkgs > /dev/null 2>&1
else
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] Zaten Kurulu... "
fi
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] Servis oluşturuluyor... "
sleep 1
echo -e "[ ${green}BİLGİ${NC} ] Dosyalar indiriliyor... "
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/backup/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/muzaffer72/newsc/refs/heads/main/backup/restore.sh" && chmod +x /usr/bin/restore

service cron restart > /dev/null 2>&1

rm -f /root/set-br.sh
