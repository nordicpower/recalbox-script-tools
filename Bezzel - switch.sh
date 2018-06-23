#!/bin/sh
################################################################################
#                              - GAMELISTPOWER -                               #
#------------------------------------------------------------------------------#
# Activation / Desactivation des Bezzels par deplacement des fichiers          #
#------------------------------------------------------------------------------#
# NORDIC POWER amiga15@outlook.fr                 0.9.00 07/06/2018-17/06/2018 #
################################################################################
BEZZEL_PATH=/recalbox/share/system/configs/retroarch
BEZZEL_EXT=cfg
BEZZEL_ARCH=$BEZZEL_PATH/overlays_arch
LOG_FILE=/recalbox/share/system/logs/bezzel_switch.log

#Suppression des 3 derniers arguments
set -- "${@:1:$#-1}"

################################################################################
#Installation
if [ ! -d $BEZZEL_ARCH ];then
	mkdir $BEZZEL_ARCH
	chmod 777
fi

mount -o remount,rw /

################################################################################
#Sauvegarde config defaut
if [ -f $BEZZEL_PATH/retroarchcustom.cfg ];then
	mv $BEZZEL_PATH/retroarchcustom.cfg $BEZZEL_PATH/retroarchcustom.save
fi

#Gestion on/off
shopt -s nullglob
files=($BEZZEL_PATH/*.$BEZZEL_EXT)

if [ ${#files[@]} -gt 0 ];then
	echo Desactivation des Bezzels
	mv $BEZZEL_PATH/*.$BEZZEL_EXT $BEZZEL_ARCH
	BEZZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezzel-switchoff.jpg"
	echo "$(date) Desactivation des Bezzels">>$LOG_FILE
else
	echo Activation des Bezzels
	mv $BEZZEL_ARCH/*.$BEZZEL_EXT $BEZZEL_PATH
	BEZZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezzel-switchon.jpg"
	echo "$(date) Activation des Bezzels">>$LOG_FILE
fi

#Restauration config defaut
if [ -f $BEZZEL_PATH/retroarchcustom.save ];then
	mv $BEZZEL_PATH/retroarchcustom.save $BEZZEL_PATH/retroarchcustom.cfg
fi

#Affichage image fin
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$BEZZEL_IMG" -emulator default -core default -ratio auto
echo fin
