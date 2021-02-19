#!/bin/bash

source '.env'

## CLEAR OLD VERSIONS
rm -Rf /opt/firefox-developer*
rm -Rf /usr/bin/firefox-developer
rm -Rf /usr/share/applications/firefox-developer.desktop

## DOWNLOAD ZIP
wget https://download-installer.cdn.mozilla.net/pub/devedition/releases/${VERSION_FIREFOX}/linux-x86_64/pt-BR/firefox-${VERSION_FIREFOX}.tar.bz2 -O firefox-developer.tar.bz2

## UNZIP NEW PACKAGE
tar -jxvf firefox-developer.tar.bz2 -C /opt/
mv /opt/firefox*/ /opt/firefox-developer

## CREATE SHORTCUT FOR EXECUTE PROGRAM ON DESKTOP AND MAIN MENU
ln -sf /opt/firefox-developer/firefox /usr/bin/firefox-developer
echo -e '[Desktop Entry]\n Version='$VERSION_FIREFOX'\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox-developer/firefox\n Icon=/opt/firefox-developer/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox-developer.desktop
chmod +x /usr/share/applications/firefox-developer.desktop
cp /usr/share/applications/firefox-developer.desktop ~/Desktop