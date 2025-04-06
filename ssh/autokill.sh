#!/bin/bash
# My Telegram : https://t.me/onvaovpn
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
if [ $MYIP = $IZIN ]; then
clear
echo -e "${CYAN}Erişim İzin Verildi...${off}"
sleep 1
else
clear
echo -e "${PURPLE}Erişim Engellendi!${off}"
echo "Sadece Ücretli Kullanıcılar İçin!"
echo "Lütfen Yönetici ile İletişime Geçin"
exit 0
fi
clear
echo "VPS Kontrol Ediliyor"
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[AÇIK]${Font_color_suffix}"
Error="${Red_font_prefix}[KAPALI]${Font_color_suffix}"
cek=$(grep -c -E "^# Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e ""
echo -e "=================================="
echo -e "       Autokill Durumu $sts       "
echo -e "=================================="
echo -e "1. 5 Dakika Sonra Otomatik Kapat"
echo -e "2. 10 Dakika Sonra Otomatik Kapat"
echo -e "3. 15 Dakika Sonra Otomatik Kapat"
echo -e "4. Otomatik Kapat/Çoklu Girişi Kapat"
echo -e "5. Çıkış"
echo -e "=================================="                                                                                                          
echo -e ""
read -p "Seçeneklerden Birini Seçin [1-4 veya x] :  " AutoKill
read -p "İzin Verilen Maksimum Çoklu Oturum Sayısı: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      İzin Verilen Çoklu Oturum : $max"
                echo -e "      Otomatik Kapatma Sıklığı : 5 Dakika"      
                echo -e ""
                echo -e "======================================"                                                                                                                                 
                exit                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      İzin Verilen Çoklu Oturum : $max"
                echo -e "      Otomatik Kapatma Sıklığı : 10 Dakika"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "# Autokill" >>/etc/cron.d/tendang
                echo "*/15 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      İzin Verilen Çoklu Oturum : $max"
                echo -e "      Otomatik Kapatma Sıklığı : 15 Dakika"
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                4)
                clear
                echo > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Otomatik Çoklu Oturum Kapatma Kapatıldı  "
                echo -e ""
                echo -e "======================================"
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
