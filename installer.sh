#!/bin/sh

##setup command=wget https://github.com/tarekzoka/oscamemu/main/installer.sh -O - | /bin/sh
#
echo " download and install oscamemu emu "
version=11.704
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/oscam/main"
MY_IPK="enigma2-plugin-softcams-oscam_11.704-emu-r798_all.ipk"
MY_DEB="enigma2-plugin-softcams-oscam_11.704-emu-r798_all.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-oscam-all-images

#################################################################################

# Download and install plugin #
opkg install wget
cd /tmp 

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
	dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		opkg install --force-reinstall $MY_IPK
	fi
echo "================================="
set +e
chmod 755 /usr/bin/oscam-emu
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
	echo ">>>>   SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   TAREK_TT "   
sleep 4;
	echo '========================================================================================================================='
###################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0















































