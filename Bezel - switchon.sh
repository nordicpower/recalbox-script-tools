#!/bin/bash
################################################################################
#                              - GAMELISTPOWER -                               #
#------------------------------------------------------------------------------#
# ACTIVATION DES BEZELS PAR DEPLACEMENT DES FICHIERS                           #
#------------------------------------------------------------------------------#
# NORDIC POWER amiga15@outlook.fr                 0.9.02 07/06/2018-19/08/2018 #
################################################################################
# LES OVERLAYS PRIS EN COMPTE SONT DANS /recalbox/share/overlays               #
################################################################################
OVERLAYS_PATH=/recalbox/share/overlays
ROM_PATH=/recalbox/share/roms
BEZEL_PATH=/recalbox/share/system/configs/retroarch
BEZEL_EXT=cfg
BEZEL_ARCH=$BEZEL_PATH/overlays_arch
LOG_FILE=/recalbox/share/system/logs/bezel_switch.log

#Suppression des 3 derniers arguments
set -- "${@:1:$#-1}"

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
#INSTALLATION POUR LES CONFIGURATIONS PLATEFORMES
createdir $BEZEL_ARCH

################################################################################
#INSTALLATION POUR LES CONFIGURATIONS ROMS
createdir "${BEZEL_ARCH}/amiga1200"
createdir "${BEZEL_ARCH}/amiga600"
createdir "${BEZEL_ARCH}/amstradcpc"
createdir "${BEZEL_ARCH}/apple2"
createdir "${BEZEL_ARCH}/atari2600"
createdir "${BEZEL_ARCH}/atari7800"
createdir "${BEZEL_ARCH}/atarist"
createdir "${BEZEL_ARCH}/c64"
createdir "${BEZEL_ARCH}/cavestory"
createdir "${BEZEL_ARCH}/colecovision"
createdir "${BEZEL_ARCH}/daphne"
createdir "${BEZEL_ARCH}/dos"
createdir "${BEZEL_ARCH}/dreamcast"
createdir "${BEZEL_ARCH}/fds"
createdir "${BEZEL_ARCH}/gamegear"
createdir "${BEZEL_ARCH}/gb"
createdir "${BEZEL_ARCH}/gba"
createdir "${BEZEL_ARCH}/gbc"
createdir "${BEZEL_ARCH}/gw"
createdir "${BEZEL_ARCH}/lutro"
createdir "${BEZEL_ARCH}/lynx"
createdir "${BEZEL_ARCH}/mame"
createdir "${BEZEL_ARCH}/mastersystem"
createdir "${BEZEL_ARCH}/megadrive"
createdir "${BEZEL_ARCH}/moonlight"
createdir "${BEZEL_ARCH}/msx"
createdir "${BEZEL_ARCH}/msx1"
createdir "${BEZEL_ARCH}/msx2"
createdir "${BEZEL_ARCH}/n64"
createdir "${BEZEL_ARCH}/neogeo"
createdir "${BEZEL_ARCH}/nes"
createdir "${BEZEL_ARCH}/ngp"
createdir "${BEZEL_ARCH}/ngpc"
createdir "${BEZEL_ARCH}/o2em"
createdir "${BEZEL_ARCH}/pcengine"
createdir "${BEZEL_ARCH}/pcenginecd"
createdir "${BEZEL_ARCH}/prboom"
createdir "${BEZEL_ARCH}/psp"
createdir "${BEZEL_ARCH}/psx"
createdir "${BEZEL_ARCH}/scummvm"
createdir "${BEZEL_ARCH}/sega32x"
createdir "${BEZEL_ARCH}/segacd"
createdir "${BEZEL_ARCH}/sg1000"
createdir "${BEZEL_ARCH}/snes"
createdir "${BEZEL_ARCH}/supergrafx"
createdir "${BEZEL_ARCH}/thomson"
createdir "${BEZEL_ARCH}/vectrex"
createdir "${BEZEL_ARCH}/virtualboy"
createdir "${BEZEL_ARCH}/wswan"
createdir "${BEZEL_ARCH}/wswanc"
createdir "${BEZEL_ARCH}/x68000"
createdir "${BEZEL_ARCH}/zx81"
createdir "${BEZEL_ARCH}/zxspectrum"

#MIKOZZZ
createdir "${BEZEL_ARCH}/arcade"
createdir "${BEZEL_ARCH}/collections"
createdir "${BEZEL_ARCH}/cps1"
createdir "${BEZEL_ARCH}/cps2"
createdir "${BEZEL_ARCH}/cps3"
createdir "${BEZEL_ARCH}/shmups"
createdir "${BEZEL_ARCH}/snes MSU-1"

#NORDICPOWER
createdir "${BEZEL_ARCH}/amigaHDD"
createdir "${BEZEL_ARCH}/fba"
createdir "${BEZEL_ARCH}/fba_libretro"
createdir "${BEZEL_ARCH}/fba2"
createdir "${BEZEL_ARCH}/linux"
createdir "${BEZEL_ARCH}/mario"
createdir "${BEZEL_ARCH}/metal"

################################################################################
mount -o remount,rw /

################################################################################
#ACTIVATION BEZZELS PLATEFORMES
echo Activation des Bezzels
mv $BEZEL_ARCH/*.$BEZEL_EXT $BEZEL_PATH
BEZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezel-switchon.jpg"
echo "$(date) Activation des Bezzels">>$LOG_FILE

################################################################################
#ACTIVATION BEZZELS ROMS
#STD RECALBOX
mv $BEZEL_ARCH/amiga1200/*.* $OVERLAYS_PATH/amiga1200
mv $BEZEL_ARCH/amiga600/*.* $OVERLAYS_PATH/amiga600
mv $BEZEL_ARCH/amstradcpc/*.* $OVERLAYS_PATH/amstradcpc
mv $BEZEL_ARCH/apple2/*.* $OVERLAYS_PATH/apple2
mv $BEZEL_ARCH/atari2600/*.* $OVERLAYS_PATH/atari2600
mv $BEZEL_ARCH/atari7800/*.* $OVERLAYS_PATH/atari7800
mv $BEZEL_ARCH/atarist/*.* $OVERLAYS_PATH/atarist
mv $BEZEL_ARCH/c64/*.* $OVERLAYS_PATH/c64
mv $BEZEL_ARCH/cavestory/*.* $OVERLAYS_PATH/cavestory
mv $BEZEL_ARCH/colecovision/*.* $OVERLAYS_PATH/colecovision
mv $BEZEL_ARCH/daphne/*.* $OVERLAYS_PATH/daphne
mv $BEZEL_ARCH/dos/*.* $OVERLAYS_PATH/dos
mv $BEZEL_ARCH/dreamcast/*.* $OVERLAYS_PATH/dreamcast
mv $BEZEL_ARCH/fds/*.* $OVERLAYS_PATH/fds
mv $BEZEL_ARCH/gamegear/*.* $OVERLAYS_PATH/gamegear
mv $BEZEL_ARCH/gb/*.* $OVERLAYS_PATH/gb
mv $BEZEL_ARCH/gba/*.* $OVERLAYS_PATH/gba
mv $BEZEL_ARCH/gbc/*.* $OVERLAYS_PATH/gbc
mv $BEZEL_ARCH/gw/*.* $OVERLAYS_PATH/gw
mv $BEZEL_ARCH/lutro/*.* $OVERLAYS_PATH/lutro
mv $BEZEL_ARCH/lynx/*.* $OVERLAYS_PATH/lynx
mv $BEZEL_ARCH/mame/*.* $OVERLAYS_PATH/mame
mv $BEZEL_ARCH/mastersystem/*.* $OVERLAYS_PATH/mastersystem
mv $BEZEL_ARCH/megadrive/*.* $OVERLAYS_PATH/megadrive
mv $BEZEL_ARCH/moonlight/*.* $OVERLAYS_PATH/moonlight
mv $BEZEL_ARCH/msx/*.* $OVERLAYS_PATH/msx
mv $BEZEL_ARCH/msx1/*.* $OVERLAYS_PATH/msx1
mv $BEZEL_ARCH/msx2/*.* $OVERLAYS_PATH/msx2
mv $BEZEL_ARCH/n64/*.* $OVERLAYS_PATH/n64
mv $BEZEL_ARCH/neogeo/*.* $OVERLAYS_PATH/neogeo
mv $BEZEL_ARCH/nes/*.* $OVERLAYS_PATH/nes
mv $BEZEL_ARCH/ngp/*.* $OVERLAYS_PATH/ngp
mv $BEZEL_ARCH/ngpc/*.* $OVERLAYS_PATH/ngpc
mv $BEZEL_ARCH/o2em/*.* $OVERLAYS_PATH/o2em
mv $BEZEL_ARCH/pcengine/*.* $OVERLAYS_PATH/pcengine
mv $BEZEL_ARCH/pcenginecd/*.* $OVERLAYS_PATH/pcenginecd
mv $BEZEL_ARCH/prboom/*.* $OVERLAYS_PATH/prboom
mv $BEZEL_ARCH/psp/*.* $OVERLAYS_PATH/psp
mv $BEZEL_ARCH/psx/*.* $OVERLAYS_PATH/psx
mv $BEZEL_ARCH/scummvm/*.* $OVERLAYS_PATH/scummvm
mv $BEZEL_ARCH/sega32x/*.* $OVERLAYS_PATH/sega32x
mv $BEZEL_ARCH/segacd/*.* $OVERLAYS_PATH/segacd
mv $BEZEL_ARCH/sg1000/*.* $OVERLAYS_PATH/sg1000
mv $BEZEL_ARCH/snes/*.* $OVERLAYS_PATH/snes
mv $BEZEL_ARCH/supergrafx/*.* $OVERLAYS_PATH/supergrafx
mv $BEZEL_ARCH/thomson/*.* $OVERLAYS_PATH/thomson
mv $BEZEL_ARCH/vectrex/*.* $OVERLAYS_PATH/vectrex
mv $BEZEL_ARCH/virtualboy/*.* $OVERLAYS_PATH/virtualboy
mv $BEZEL_ARCH/wswan/*.* $OVERLAYS_PATH/wswan
mv $BEZEL_ARCH/wswanc/*.* $OVERLAYS_PATH/wswanc
mv $BEZEL_ARCH/x68000/*.* $OVERLAYS_PATH/x68000
mv $BEZEL_ARCH/zx81/*.* $OVERLAYS_PATH/zx81
mv $BEZEL_ARCH/zxspectrum/*.* $OVERLAYS_PATH/zxspectrum

#MIKOZZZ
mv $BEZEL_ARCH/arcade/*.* $OVERLAYS_PATH/arcade
mv $BEZEL_ARCH/collections/*.* $OVERLAYS_PATH/collections
mv $BEZEL_ARCH/cps1/*.* $OVERLAYS_PATH/cps1
mv $BEZEL_ARCH/cps2/*.* $OVERLAYS_PATH/cps2
mv $BEZEL_ARCH/cps3/*.* $OVERLAYS_PATH/cps3
mv $BEZEL_ARCH/shmups/*.* $OVERLAYS_PATH/shmups
mv $BEZEL_ARCH/snes MSU-1/*.* $OVERLAYS_PATH/snes MSU-1

#NORDICPOWER
mv $BEZEL_ARCH/amigaHDD/*.* $OVERLAYS_PATH/amigaHDD
mv $BEZEL_ARCH/fba/*.* $OVERLAYS_PATH/fba
mv $BEZEL_ARCH/fba_libretro/*.* $OVERLAYS_PATH/fba_libretro
mv $BEZEL_ARCH/fba2/*.* $OVERLAYS_PATH/fba2
mv $BEZEL_ARCH/linux/*.* $OVERLAYS_PATH/linux
mv $BEZEL_ARCH/mario/*.* $OVERLAYS_PATH/mario
mv $BEZEL_ARCH/metal/*.* $OVERLAYS_PATH/metal

################################################################################
#AFFICHAGE IMAGE FIN
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$BEZEL_IMG" -emulator default -core default -ratio auto
echo fin
