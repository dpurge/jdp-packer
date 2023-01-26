#!/bin/bash -e

apt-get install -y xrdp
apt-get install -y xfce4 xfce4-goodies

sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sed -i 's/max_bpp=32/max_bpp=128/g' /etc/xrdp/xrdp.ini
sed -i 's/xserverbpp=24/xserverbpp=128/g' /etc/xrdp/xrdp.ini

echo xfce4-session > ~/.xsession
