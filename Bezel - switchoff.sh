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
createdir "${BEZEL_ARCH}/pack-arcade-artwork"

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
#DEACTIVATION BEZZELS PLATEFORMES
#Sauvegarde config defaut
if [ -f $BEZEL_PATH/retroarchcustom.cfg ];then
	mv $BEZEL_PATH/retroarchcustom.cfg $BEZEL_PATH/retroarchcustom.save
fi

echo Desactivation des Bezzels
mv $BEZEL_PATH/*.$BEZEL_EXT $BEZEL_ARCH
BEZEL_IMG="/recalbox/share/roms/linuxtools/images/Bezel-switchoff.jpg"
echo "$(date) Desactivation des Bezzels">>$LOG_FILE

#Restauration config defaut
if [ -f $BEZEL_PATH/retroarchcustom.save ];then
	mv $BEZEL_PATH/retroarchcustom.save $BEZEL_PATH/retroarchcustom.cfg
fi

################################################################################
#DEACTIVATION BEZZELS ROMS
mv $OVERLAYS_PATH/amiga1200/*.* $BEZEL_ARCH/amiga1200
mv $OVERLAYS_PATH/amiga600/*.* $BEZEL_ARCH/amiga600
mv $OVERLAYS_PATH/amstradcpc/*.* $BEZEL_ARCH/amstradcpc
mv $OVERLAYS_PATH/apple2/*.* $BEZEL_ARCH/apple2
mv $OVERLAYS_PATH/atari2600/*.* $BEZEL_ARCH/atari2600
mv $OVERLAYS_PATH/atari7800/*.* $BEZEL_ARCH/atari7800
mv $OVERLAYS_PATH/atarist/*.* $BEZEL_ARCH/atarist
mv $OVERLAYS_PATH/c64/*.* $BEZEL_ARCH/c64
mv $OVERLAYS_PATH/cavestory/*.* $BEZEL_ARCH/cavestory
mv $OVERLAYS_PATH/colecovision/*.* $BEZEL_ARCH/colecovision
mv $OVERLAYS_PATH/daphne/*.* $BEZEL_ARCH/daphne
mv $OVERLAYS_PATH/dos/*.* $BEZEL_ARCH/dos
mv $OVERLAYS_PATH/dreamcast/*.* $BEZEL_ARCH/dreamcast
mv $OVERLAYS_PATH/fds/*.* $BEZEL_ARCH/fds
mv $OVERLAYS_PATH/gamegear/*.* $BEZEL_ARCH/gamegear
mv $OVERLAYS_PATH/gb/*.* $BEZEL_ARCH/gb
mv $OVERLAYS_PATH/gba/*.* $BEZEL_ARCH/gba
mv $OVERLAYS_PATH/gbc/*.* $BEZEL_ARCH/gbc
mv $OVERLAYS_PATH/gw/*.* $BEZEL_ARCH/gw
mv $OVERLAYS_PATH/lutro/*.* $BEZEL_ARCH/lutro
mv $OVERLAYS_PATH/lynx/*.* $BEZEL_ARCH/lynx
mv $OVERLAYS_PATH/mame/*.* $BEZEL_ARCH/mame
mv $OVERLAYS_PATH/mastersystem/*.* $BEZEL_ARCH/mastersystem
mv $OVERLAYS_PATH/megadrive/*.* $BEZEL_ARCH/megadrive
mv $OVERLAYS_PATH/moonlight/*.* $BEZEL_ARCH/moonlight
mv $OVERLAYS_PATH/msx/*.* $BEZEL_ARCH/msx
mv $OVERLAYS_PATH/msx1/*.* $BEZEL_ARCH/msx1
mv $OVERLAYS_PATH/msx2/*.* $BEZEL_ARCH/msx2
mv $OVERLAYS_PATH/n64/*.* $BEZEL_ARCH/n64
mv $OVERLAYS_PATH/neogeo/*.* $BEZEL_ARCH/neogeo
mv $OVERLAYS_PATH/nes/*.* $BEZEL_ARCH/nes
mv $OVERLAYS_PATH/ngp/*.* $BEZEL_ARCH/ngp
mv $OVERLAYS_PATH/ngpc/*.* $BEZEL_ARCH/ngpc
mv $OVERLAYS_PATH/o2em/*.* $BEZEL_ARCH/o2em
mv $OVERLAYS_PATH/pcengine/*.* $BEZEL_ARCH/pcengine
mv $OVERLAYS_PATH/pcenginecd/*.* $BEZEL_ARCH/pcenginecd
mv $OVERLAYS_PATH/prboom/*.* $BEZEL_ARCH/prboom
mv $OVERLAYS_PATH/psp/*.* $BEZEL_ARCH/psp
mv $OVERLAYS_PATH/psx/*.* $BEZEL_ARCH/psx
mv $OVERLAYS_PATH/scummvm/*.* $BEZEL_ARCH/scummvm
mv $OVERLAYS_PATH/sega32x/*.* $BEZEL_ARCH/sega32x
mv $OVERLAYS_PATH/segacd/*.* $BEZEL_ARCH/segacd
mv $OVERLAYS_PATH/sg1000/*.* $BEZEL_ARCH/sg1000
mv $OVERLAYS_PATH/snes/*.* $BEZEL_ARCH/snes
mv $OVERLAYS_PATH/supergrafx/*.* $BEZEL_ARCH/supergrafx
mv $OVERLAYS_PATH/thomson/*.* $BEZEL_ARCH/thomson
mv $OVERLAYS_PATH/vectrex/*.* $BEZEL_ARCH/vectrex
mv $OVERLAYS_PATH/virtualboy/*.* $BEZEL_ARCH/virtualboy
mv $OVERLAYS_PATH/wswan/*.* $BEZEL_ARCH/wswan
mv $OVERLAYS_PATH/wswanc/*.* $BEZEL_ARCH/wswanc
mv $OVERLAYS_PATH/x68000/*.* $BEZEL_ARCH/x68000
mv $OVERLAYS_PATH/zx81/*.* $BEZEL_ARCH/zx81
mv $OVERLAYS_PATH/zxspectrum/*.* $BEZEL_ARCH/zxspectrum

#MIKOZZZ
mv $OVERLAYS_PATH/arcade/*.* $BEZEL_ARCH/arcade
mv $OVERLAYS_PATH/collections/*.* $BEZEL_ARCH/collections
mv $OVERLAYS_PATH/cps1/*.* $BEZEL_ARCH/cps1
mv $OVERLAYS_PATH/cps2/*.* $BEZEL_ARCH/cps2
mv $OVERLAYS_PATH/cps3/*.* $BEZEL_ARCH/cps3
mv $OVERLAYS_PATH/shmups/*.* $BEZEL_ARCH/shmups
mv "$OVERLAYS_PATH/snes MSU-1/*.*" "$BEZEL_ARCH/snes MSU-1"
mv $OVERLAYS_PATH/pack-arcade-artwork/*.* $BEZEL_ARCH/pack-arcade-artwork

#NORDICPOWER
mv $OVERLAYS_PATH/amigaHDD/*.* $BEZEL_ARCH/amigaHDD
mv $OVERLAYS_PATH/fba/*.* $BEZEL_ARCH/fba
mv $OVERLAYS_PATH/fba_libretro/*.* $BEZEL_ARCH/fba_libretro
mv $OVERLAYS_PATH/fba2/*.* $BEZEL_ARCH/fba2
mv $OVERLAYS_PATH/linux/*.* $BEZEL_ARCH/linux
mv $OVERLAYS_PATH/mario/*.* $BEZEL_ARCH/mario
mv $OVERLAYS_PATH/metal/*.* $BEZEL_ARCH/metal


################################################################################
#AFFICHAGE IMAGE FIN
python /usr/lib/python2.7/site-packages/configgen/emulatorlauncher.pyc "$@" -system imageviewer -rom "$BEZEL_IMG" -emulator default -core default -ratio auto
echo fin
