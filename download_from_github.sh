#!/bin/sh
curl https://raw.githubusercontent.com/zacpier/GnomeYosemiteIcons/master/download_from_github.sh | sh
rm -r --interactive=never -f ~/.icons/Lollicons-master >/dev/null 2>&1
hasgit="yes"
cd ~/
mkdir .icons >/dev/null 2>&1
cd .icons
command -v git >/dev/null 2>&1 || { hasgit="no"; }
if [ "$hasgit" = "no" ]; then
echo Can\'t find git.  Downloading from zip file.
wget https://github.com/zacpier/lollicons/archive/master.zip
unzip -o master.zip
else
echo Cloning from GitHub repository.
git clone https://github.com/zacpier/lollicons.git Lollicons-master
fi
cd Lollicons-master
rm download_from_github.sh
gsettings set org.gnome.desktop.interface icon-theme 'Lollicons-master'
