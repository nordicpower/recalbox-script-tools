#!/bin/bash
################################################################################
#                            - THEMEWEBINSTALL -                               #
#------------------------------------------------------------------------------#
# INSTALLATION D'UN THEME A PARTIR D'UN LIEN DE TELECHARGEMENT                 #
#------------------------------------------------------------------------------#
# NORDIC POWER amiga15@outlook.fr                    1.0 07/03/2019-23/03/2019 #
################################################################################
# LES THEMES SONT DANS /recalbox/share_init/system/.emulationstation/themes    #
################################################################################
# W10: sudo apt-get install unrar-free                                         #
# W10: sudo apt-get install zip                                                #
################################################################################
THEME_PATH=/recalbox/share_init/system/.emulationstation/themes
TEMP_PATH=/tmp/theme-webinstall
LOG_FILE=/recalbox/share/system/logs/theme-webinstall.log
ROM_PATH=/recalbox/share/roms/theme
IMG_END_REFRESHLIST=EndRefreshList.jpg
IMG_END_SELECTTHEME=EndSelectTheme.jpg

################################################################################
#FONCTIONS
function createdir
{
	if [ ! -d $1 ];then
		mkdir $1
		chmod 777 $1
	fi
}

################################################################################
#TEST ARGS
#Suppression des 3 derniers arguments fournis par RECALBOX
#set -- "${@:1:$#-1}"
FILE_URL=$1
echo $FILE_URL
if [ -z ${FILE_URL} ];then
	echo "usage $0 file.url"
	exit 1
fi

if [ ! -f $FILE_URL ]; then
	echo "Fichier $FILE_URL non trouve !"
  exit 1
fi

THEME_URL=`cat $FILE_URL`

################################################################################
mount -o remount,rw /

################################################################################
#DOSSIER DE TRAVAIL
createdir $TEMP_PATH 
rm -r -f $TEMP_PATH/*

################################################################################
#TELECHARGEMENT
echo telechargement... >>$LOG_FILE
cd $TEMP_PATH
wget --content-disposition $THEME_URL >$LOG_FILE

################################################################################
#DECOMPRESS
THEME_FILENAME=$(ls | sort -n | head -1)
NOT_SUPPORTED=true
if [ ${THEME_FILENAME##*.} = "rar" ]
then
	#unrar non disponible sur Recalbox car apt-get non disponible
	NOT_SUPPORTED=true
	
	#W10
	#echo unrar $THEME_FILENAME ...
	#unrar-free -x $THEME_FILENAME >$LOG_FILE
	#NOT_SUPPORTED=false
fi

if [ ${THEME_FILENAME##*.} = "zip" ]
then
	echo unzip $THEME_FILENAME ... >>$LOG_FILE
	unzip $THEME_FILENAME >>$LOG_FILE
	NOT_SUPPORTED=false
fi

if [ $NOT_SUPPORTED = true ]
then
	echo extension ${THEME_FILENAME##*.} non supportee ! >>$LOG_FILE
	exit 1
fi

################################################################################
#INSTALL
THEME_DIRNAME=$(ls -d */ | sort -n | head -1)
THEME_DIRNAME=${THEME_DIRNAME%?}
	
if [ $THEME_FILENAME = UpdateThemes.zip ]
then
	echo "saving...." >>$LOG_FILE
	zip -r -x \*.zip @ $ROM_PATH/theme_save_$(date '+%Y%m%d%H%M%S').zip $ROM_PATH/*.* >>$LOG_FILE
	
	echo "refresh gamelist et url...." >>$LOG_FILE
	chmod 777 $THEME_DIRNAME/ThemeWebInstall.sh >>$LOG_FILE
	cp -r -f $THEME_DIRNAME/* $ROM_PATH >>$LOG_FILE
	rm $THEME_FILENAME >>$LOG_FILE
	IMG_END=$IMG_END_REFRESHLIST
else
	echo "installation du $THEME_DIRNAME..." >>$LOG_FILE
	
	if [ -d /recalbox/share_init/system/.emulationstation/themes/$THEME_DIRNAME ];then
		rm -r -f /recalbox/share_init/system/.emulationstation/themes/$THEME_DIRNAME >>$LOG_FILE
	fi
	mv -f $THEME_DIRNAME /recalbox/share_init/system/.emulationstation/themes >>$LOG_FILE
	rm $THEME_FILENAME >>$LOG_FILE
	IMG_END=$IMG_END_SELECTTHEME
fi

################################################################################
#AFFICHAGE IMAGE FIN
echo "Affichage de l'image $ROM_PATH/images/$IMG_END" >>$LOG_FILE
shift
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$ROM_PATH/images/$IMG_END" -emulator default -core default -ratio auto
echo fin
