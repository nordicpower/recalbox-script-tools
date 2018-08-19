#!/bin/bash
################################################################################
#                              - GAMELISTPOWER -                               #
#------------------------------------------------------------------------------#
# ACTIVATION DES BEZZELS PAR DEPLACEMENT DES FICHIERS                          #
#------------------------------------------------------------------------------#
# NORDIC POWER amiga15@outlook.fr                 0.9.01 07/06/2018-19/08/2018 #
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
#ACTIVATION BEZZELS PLATEFORMES
echo Activation des Bezzels
mv $BEZZEL_ARCH/*.$BEZZEL_EXT $BEZZEL_PATH
BEZZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezzel-switchon.jpg"
echo "$(date) Activation des Bezzels">>$LOG_FILE

################################################################################
#ACTIVATION BEZZELS ROMS
#STD RECALBOX
mv $BEZZEL_ARCH/amiga1200/*.* $OVERLAYS_PATH/amiga1200
mv $BEZZEL_ARCH/amiga600/*.* $OVERLAYS_PATH/amiga600
mv $BEZZEL_ARCH/amstradcpc/*.* $OVERLAYS_PATH/amstradcpc
mv $BEZZEL_ARCH/apple2/*.* $OVERLAYS_PATH/apple2
mv $BEZZEL_ARCH/atari2600/*.* $OVERLAYS_PATH/atari2600
mv $BEZZEL_ARCH/atari7800/*.* $OVERLAYS_PATH/atari7800
mv $BEZZEL_ARCH/atarist/*.* $OVERLAYS_PATH/atarist
mv $BEZZEL_ARCH/c64/*.* $OVERLAYS_PATH/c64
mv $BEZZEL_ARCH/cavestory/*.* $OVERLAYS_PATH/cavestory
mv $BEZZEL_ARCH/colecovision/*.* $OVERLAYS_PATH/colecovision
mv $BEZZEL_ARCH/daphne/*.* $OVERLAYS_PATH/daphne
mv $BEZZEL_ARCH/dos/*.* $OVERLAYS_PATH/dos
mv $BEZZEL_ARCH/dreamcast/*.* $OVERLAYS_PATH/dreamcast
mv $BEZZEL_ARCH/fds/*.* $OVERLAYS_PATH/fds
mv $BEZZEL_ARCH/gamegear/*.* $OVERLAYS_PATH/gamegear
mv $BEZZEL_ARCH/gb/*.* $OVERLAYS_PATH/gb
mv $BEZZEL_ARCH/gba/*.* $OVERLAYS_PATH/gba
mv $BEZZEL_ARCH/gbc/*.* $OVERLAYS_PATH/gbc
mv $BEZZEL_ARCH/gw/*.* $OVERLAYS_PATH/gw
mv $BEZZEL_ARCH/lutro/*.* $OVERLAYS_PATH/lutro
mv $BEZZEL_ARCH/lynx/*.* $OVERLAYS_PATH/lynx
mv $BEZZEL_ARCH/mame/*.* $OVERLAYS_PATH/mame
mv $BEZZEL_ARCH/mastersystem/*.* $OVERLAYS_PATH/mastersystem
mv $BEZZEL_ARCH/megadrive/*.* $OVERLAYS_PATH/megadrive
mv $BEZZEL_ARCH/moonlight/*.* $OVERLAYS_PATH/moonlight
mv $BEZZEL_ARCH/msx/*.* $OVERLAYS_PATH/msx
mv $BEZZEL_ARCH/msx1/*.* $OVERLAYS_PATH/msx1
mv $BEZZEL_ARCH/msx2/*.* $OVERLAYS_PATH/msx2
mv $BEZZEL_ARCH/n64/*.* $OVERLAYS_PATH/n64
mv $BEZZEL_ARCH/neogeo/*.* $OVERLAYS_PATH/neogeo
mv $BEZZEL_ARCH/nes/*.* $OVERLAYS_PATH/nes
mv $BEZZEL_ARCH/ngp/*.* $OVERLAYS_PATH/ngp
mv $BEZZEL_ARCH/ngpc/*.* $OVERLAYS_PATH/ngpc
mv $BEZZEL_ARCH/o2em/*.* $OVERLAYS_PATH/o2em
mv $BEZZEL_ARCH/pcengine/*.* $OVERLAYS_PATH/pcengine
mv $BEZZEL_ARCH/pcenginecd/*.* $OVERLAYS_PATH/pcenginecd
mv $BEZZEL_ARCH/prboom/*.* $OVERLAYS_PATH/prboom
mv $BEZZEL_ARCH/psp/*.* $OVERLAYS_PATH/psp
mv $BEZZEL_ARCH/psx/*.* $OVERLAYS_PATH/psx
mv $BEZZEL_ARCH/scummvm/*.* $OVERLAYS_PATH/scummvm
mv $BEZZEL_ARCH/sega32x/*.* $OVERLAYS_PATH/sega32x
mv $BEZZEL_ARCH/segacd/*.* $OVERLAYS_PATH/segacd
mv $BEZZEL_ARCH/sg1000/*.* $OVERLAYS_PATH/sg1000
mv $BEZZEL_ARCH/snes/*.* $OVERLAYS_PATH/snes
mv $BEZZEL_ARCH/supergrafx/*.* $OVERLAYS_PATH/supergrafx
mv $BEZZEL_ARCH/thomson/*.* $OVERLAYS_PATH/thomson
mv $BEZZEL_ARCH/vectrex/*.* $OVERLAYS_PATH/vectrex
mv $BEZZEL_ARCH/virtualboy/*.* $OVERLAYS_PATH/virtualboy
mv $BEZZEL_ARCH/wswan/*.* $OVERLAYS_PATH/wswan
mv $BEZZEL_ARCH/wswanc/*.* $OVERLAYS_PATH/wswanc
mv $BEZZEL_ARCH/x68000/*.* $OVERLAYS_PATH/x68000
mv $BEZZEL_ARCH/zx81/*.* $OVERLAYS_PATH/zx81
mv $BEZZEL_ARCH/zxspectrum/*.* $OVERLAYS_PATH/zxspectrum

#MIKOZZZ
mv $BEZZEL_ARCH/arcade/*.* $OVERLAYS_PATH/arcade
mv $BEZZEL_ARCH/collections/*.* $OVERLAYS_PATH/collections
mv $BEZZEL_ARCH/cps1/*.* $OVERLAYS_PATH/cps1
mv $BEZZEL_ARCH/cps2/*.* $OVERLAYS_PATH/cps2
mv $BEZZEL_ARCH/cps3/*.* $OVERLAYS_PATH/cps3
mv $BEZZEL_ARCH/shmups/*.* $OVERLAYS_PATH/shmups
mv $BEZZEL_ARCH/snes MSU-1/*.* $OVERLAYS_PATH/snes MSU-1

#NORDICPOWER
mv $BEZZEL_ARCH/amigaHDD/*.* $OVERLAYS_PATH/amigaHDD
mv $BEZZEL_ARCH/fba/*.* $OVERLAYS_PATH/fba
mv $BEZZEL_ARCH/fba_libretro/*.* $OVERLAYS_PATH/fba_libretro
mv $BEZZEL_ARCH/fba2/*.* $OVERLAYS_PATH/fba2
mv $BEZZEL_ARCH/linux/*.* $OVERLAYS_PATH/linux
mv $BEZZEL_ARCH/mario/*.* $OVERLAYS_PATH/mario
mv $BEZZEL_ARCH/metal/*.* $OVERLAYS_PATH/metal

################################################################################
#AFFICHAGE IMAGE FIN
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$BEZZEL_IMG" -emulator default -core default -ratio auto
echo fin
