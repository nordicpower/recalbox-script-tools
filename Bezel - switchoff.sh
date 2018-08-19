#!/bin/bash
################################################################################
#                              - GAMELISTPOWER -                               #
#------------------------------------------------------------------------------#
# DESACTIVATION DES BEZELS PAR DEPLACEMENT DES FICHIERS                        #
#------------------------------------------------------------------------------#
# NORDIC POWER amiga15@outlook.fr                 0.9.02 07/06/2018-19/08/2018 #
################################################################################
# LES OVERLAYS PRIS EN COMPTE SONT DANS /recalbox/share/overlays               #
################################################################################
OVERLAYS_PATH=/recalbox/share/overlays
ROM_PATH=/recalbox/share/roms
BEZZEL_PATH=/recalbox/share/system/configs/retroarch
BEZZEL_EXT=cfg
BEZZEL_ARCH=$BEZZEL_PATH/overlays_arch
LOG_FILE=/recalbox/share/system/logs/bezzel_switch.log

#Suppression des 3 derniers arguments
set -- "${@:1:$#-1}"

################################################################################
#FONCTIONS
function createdir
{
	echo $1
	if [ ! -d $1 ];then
		mkdir $1
		chmod 777 $1
	fi
}

################################################################################
#INSTALLATION POUR LES CONFIGURATIONS PLATEFORMES
createdir $BEZZEL_ARCH

################################################################################
#INSTALLATION POUR LES CONFIGURATIONS ROMS
createdir "${BEZZEL_ARCH}/amiga1200"
createdir "${BEZZEL_ARCH}/amiga600"
createdir "${BEZZEL_ARCH}/amstradcpc"
createdir "${BEZZEL_ARCH}/apple2"
createdir "${BEZZEL_ARCH}/atari2600"
createdir "${BEZZEL_ARCH}/atari7800"
createdir "${BEZZEL_ARCH}/atarist"
createdir "${BEZZEL_ARCH}/c64"
createdir "${BEZZEL_ARCH}/cavestory"
createdir "${BEZZEL_ARCH}/colecovision"
createdir "${BEZZEL_ARCH}/daphne"
createdir "${BEZZEL_ARCH}/dos"
createdir "${BEZZEL_ARCH}/dreamcast"
createdir "${BEZZEL_ARCH}/fds"
createdir "${BEZZEL_ARCH}/gamegear"
createdir "${BEZZEL_ARCH}/gb"
createdir "${BEZZEL_ARCH}/gba"
createdir "${BEZZEL_ARCH}/gbc"
createdir "${BEZZEL_ARCH}/gw"
createdir "${BEZZEL_ARCH}/lutro"
createdir "${BEZZEL_ARCH}/lynx"
createdir "${BEZZEL_ARCH}/mame"
createdir "${BEZZEL_ARCH}/mastersystem"
createdir "${BEZZEL_ARCH}/megadrive"
createdir "${BEZZEL_ARCH}/moonlight"
createdir "${BEZZEL_ARCH}/msx"
createdir "${BEZZEL_ARCH}/msx1"
createdir "${BEZZEL_ARCH}/msx2"
createdir "${BEZZEL_ARCH}/n64"
createdir "${BEZZEL_ARCH}/neogeo"
createdir "${BEZZEL_ARCH}/nes"
createdir "${BEZZEL_ARCH}/ngp"
createdir "${BEZZEL_ARCH}/ngpc"
createdir "${BEZZEL_ARCH}/o2em"
createdir "${BEZZEL_ARCH}/pcengine"
createdir "${BEZZEL_ARCH}/pcenginecd"
createdir "${BEZZEL_ARCH}/prboom"
createdir "${BEZZEL_ARCH}/psp"
createdir "${BEZZEL_ARCH}/psx"
createdir "${BEZZEL_ARCH}/scummvm"
createdir "${BEZZEL_ARCH}/sega32x"
createdir "${BEZZEL_ARCH}/segacd"
createdir "${BEZZEL_ARCH}/sg1000"
createdir "${BEZZEL_ARCH}/snes"
createdir "${BEZZEL_ARCH}/supergrafx"
createdir "${BEZZEL_ARCH}/thomson"
createdir "${BEZZEL_ARCH}/vectrex"
createdir "${BEZZEL_ARCH}/virtualboy"
createdir "${BEZZEL_ARCH}/wswan"
createdir "${BEZZEL_ARCH}/wswanc"
createdir "${BEZZEL_ARCH}/x68000"
createdir "${BEZZEL_ARCH}/zx81"
createdir "${BEZZEL_ARCH}/zxspectrum"

#MIKOZZZ
createdir "${BEZZEL_ARCH}/arcade"
createdir "${BEZZEL_ARCH}/collections"
createdir "${BEZZEL_ARCH}/cps1"
createdir "${BEZZEL_ARCH}/cps2"
createdir "${BEZZEL_ARCH}/cps3"
createdir "${BEZZEL_ARCH}/shmups"
createdir "${BEZZEL_ARCH}/snes MSU-1"

#NORDICPOWER
createdir "${BEZZEL_ARCH}/amigaHDD"
createdir "${BEZZEL_ARCH}/fba"
createdir "${BEZZEL_ARCH}/fba_libretro"
createdir "${BEZZEL_ARCH}/fba2"
createdir "${BEZZEL_ARCH}/linux"
createdir "${BEZZEL_ARCH}/mario"
createdir "${BEZZEL_ARCH}/metal"

################################################################################
mount -o remount,rw /

################################################################################
#DEACTIVATION BEZZELS PLATEFORMES
#Sauvegarde config defaut
if [ -f $BEZZEL_PATH/retroarchcustom.cfg ];then
	mv $BEZZEL_PATH/retroarchcustom.cfg $BEZZEL_PATH/retroarchcustom.save
fi

echo Desactivation des Bezzels
mv $BEZZEL_PATH/*.$BEZZEL_EXT $BEZZEL_ARCH
BEZZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezzel-switchoff.jpg"
echo "$(date) Desactivation des Bezzels">>$LOG_FILE

#Restauration config defaut
if [ -f $BEZZEL_PATH/retroarchcustom.save ];then
	mv $BEZZEL_PATH/retroarchcustom.save $BEZZEL_PATH/retroarchcustom.cfg
fi

################################################################################
#DEACTIVATION BEZZELS ROMS
mv $OVERLAYS_PATH/amiga1200/*.* $BEZZEL_ARCH/amiga1200
mv $OVERLAYS_PATH/amiga600/*.* $BEZZEL_ARCH/amiga600
mv $OVERLAYS_PATH/amstradcpc/*.* $BEZZEL_ARCH/amstradcpc
mv $OVERLAYS_PATH/apple2/*.* $BEZZEL_ARCH/apple2
mv $OVERLAYS_PATH/atari2600/*.* $BEZZEL_ARCH/atari2600
mv $OVERLAYS_PATH/atari7800/*.* $BEZZEL_ARCH/atari7800
mv $OVERLAYS_PATH/atarist/*.* $BEZZEL_ARCH/atarist
mv $OVERLAYS_PATH/c64/*.* $BEZZEL_ARCH/c64
mv $OVERLAYS_PATH/cavestory/*.* $BEZZEL_ARCH/cavestory
mv $OVERLAYS_PATH/colecovision/*.* $BEZZEL_ARCH/colecovision
mv $OVERLAYS_PATH/daphne/*.* $BEZZEL_ARCH/daphne
mv $OVERLAYS_PATH/dos/*.* $BEZZEL_ARCH/dos
mv $OVERLAYS_PATH/dreamcast/*.* $BEZZEL_ARCH/dreamcast
mv $OVERLAYS_PATH/fds/*.* $BEZZEL_ARCH/fds
mv $OVERLAYS_PATH/gamegear/*.* $BEZZEL_ARCH/gamegear
mv $OVERLAYS_PATH/gb/*.* $BEZZEL_ARCH/gb
mv $OVERLAYS_PATH/gba/*.* $BEZZEL_ARCH/gba
mv $OVERLAYS_PATH/gbc/*.* $BEZZEL_ARCH/gbc
mv $OVERLAYS_PATH/gw/*.* $BEZZEL_ARCH/gw
mv $OVERLAYS_PATH/lutro/*.* $BEZZEL_ARCH/lutro
mv $OVERLAYS_PATH/lynx/*.* $BEZZEL_ARCH/lynx
mv $OVERLAYS_PATH/mame/*.* $BEZZEL_ARCH/mame
mv $OVERLAYS_PATH/mastersystem/*.* $BEZZEL_ARCH/mastersystem
mv $OVERLAYS_PATH/megadrive/*.* $BEZZEL_ARCH/megadrive
mv $OVERLAYS_PATH/moonlight/*.* $BEZZEL_ARCH/moonlight
mv $OVERLAYS_PATH/msx/*.* $BEZZEL_ARCH/msx
mv $OVERLAYS_PATH/msx1/*.* $BEZZEL_ARCH/msx1
mv $OVERLAYS_PATH/msx2/*.* $BEZZEL_ARCH/msx2
mv $OVERLAYS_PATH/n64/*.* $BEZZEL_ARCH/n64
mv $OVERLAYS_PATH/neogeo/*.* $BEZZEL_ARCH/neogeo
mv $OVERLAYS_PATH/nes/*.* $BEZZEL_ARCH/nes
mv $OVERLAYS_PATH/ngp/*.* $BEZZEL_ARCH/ngp
mv $OVERLAYS_PATH/ngpc/*.* $BEZZEL_ARCH/ngpc
mv $OVERLAYS_PATH/o2em/*.* $BEZZEL_ARCH/o2em
mv $OVERLAYS_PATH/pcengine/*.* $BEZZEL_ARCH/pcengine
mv $OVERLAYS_PATH/pcenginecd/*.* $BEZZEL_ARCH/pcenginecd
mv $OVERLAYS_PATH/prboom/*.* $BEZZEL_ARCH/prboom
mv $OVERLAYS_PATH/psp/*.* $BEZZEL_ARCH/psp
mv $OVERLAYS_PATH/psx/*.* $BEZZEL_ARCH/psx
mv $OVERLAYS_PATH/scummvm/*.* $BEZZEL_ARCH/scummvm
mv $OVERLAYS_PATH/sega32x/*.* $BEZZEL_ARCH/sega32x
mv $OVERLAYS_PATH/segacd/*.* $BEZZEL_ARCH/segacd
mv $OVERLAYS_PATH/sg1000/*.* $BEZZEL_ARCH/sg1000
mv $OVERLAYS_PATH/snes/*.* $BEZZEL_ARCH/snes
mv $OVERLAYS_PATH/supergrafx/*.* $BEZZEL_ARCH/supergrafx
mv $OVERLAYS_PATH/thomson/*.* $BEZZEL_ARCH/thomson
mv $OVERLAYS_PATH/vectrex/*.* $BEZZEL_ARCH/vectrex
mv $OVERLAYS_PATH/virtualboy/*.* $BEZZEL_ARCH/virtualboy
mv $OVERLAYS_PATH/wswan/*.* $BEZZEL_ARCH/wswan
mv $OVERLAYS_PATH/wswanc/*.* $BEZZEL_ARCH/wswanc
mv $OVERLAYS_PATH/x68000/*.* $BEZZEL_ARCH/x68000
mv $OVERLAYS_PATH/zx81/*.* $BEZZEL_ARCH/zx81
mv $OVERLAYS_PATH/zxspectrum/*.* $BEZZEL_ARCH/zxspectrum

#MIKOZZZ
mv $OVERLAYS_PATH/arcade/*.* $BEZZEL_ARCH/arcade
mv $OVERLAYS_PATH/collections/*.* $BEZZEL_ARCH/collections
mv $OVERLAYS_PATH/cps1/*.* $BEZZEL_ARCH/cps1
mv $OVERLAYS_PATH/cps2/*.* $BEZZEL_ARCH/cps2
mv $OVERLAYS_PATH/cps3/*.* $BEZZEL_ARCH/cps3
mv $OVERLAYS_PATH/shmups/*.* $BEZZEL_ARCH/shmups
mv $OVERLAYS_PATH/snes MSU-1/*.* $BEZZEL_ARCH/snes MSU-1

#NORDICPOWER
mv $OVERLAYS_PATH/amigaHDD/*.* $BEZZEL_ARCH/amigaHDD
mv $OVERLAYS_PATH/fba/*.* $BEZZEL_ARCH/fba
mv $OVERLAYS_PATH/fba_libretro/*.* $BEZZEL_ARCH/fba_libretro
mv $OVERLAYS_PATH/fba2/*.* $BEZZEL_ARCH/fba2
mv $OVERLAYS_PATH/linux/*.* $BEZZEL_ARCH/linux
mv $OVERLAYS_PATH/mario/*.* $BEZZEL_ARCH/mario
mv $OVERLAYS_PATH/metal/*.* $BEZZEL_ARCH/metal


################################################################################
#AFFICHAGE IMAGE FIN
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$BEZZEL_IMG" -emulator default -core default -ratio auto
echo fin
