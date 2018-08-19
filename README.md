RECALBOX-SCRIPT-TOOLS
==============================
# Readme / lisez-moi
***Par Nordicpower***
*amiga15@outlook.fr / https://twitter.com/nordicpower*
***Juillet 2018***

Ce projet contient pour l'instant deux scripts sh pour la plateforme Recalbox. D'autres viendrons très certainement completer ce projet.

Les scripts ***"Bezel - switchon.sh"*** et ***"Bezel - switchoff.sh"*** permettent d'activer ou de désactiver les Bezels (image vennant entourer l'écran central où s'affichage la rom) sans avoir à rentrer manuellement dans les menus de retroarch. Pour confirmer cette prise en compte, une image s'affiche. Il suffit de faire SELECT+START pour quitter l'image.

##  Comment installer ?

 1. Ouvrir une session ssh<br />
`mount -o remount,rw /`<br />

2. Ajouter la plateforme suivante dans le fichier /recalbox/share_init/system/.emulationstation/es_systems.cfg<br />
`nano /recalbox/share_init/system/.emulationstation/es_systems.cfg`<br />
Ajouter la plateforme suivante:<br />
`<!--NORDIC POWER-->`<br />
`  <system>`<br />
`    <fullname>linuxtools</fullname>`<br />
`    <name>linuxtools</name>`<br />
`    <path>/recalbox/share/roms/linuxtools</path>`<br />
`    <extension>.sh .SH</extension>`<br />
`    <command>%ROM% %CONTROLLERSCONFIG% %RATIO% %NETPLAY%</command>`<br />
`    <platform>linux</platform>`<br />
`    <theme>linuxtools</theme>`<br />
`  </system>`<br />
<br />

3. Créer le dossier suivant linuxtools<br />
`mkdir /recalbox/share/roms/linuxtools`<br />
`chmod 777 /recalbox/share/roms/linuxtools`<br />
`mkdir /recalbox/share/roms/linuxtools/images`<br />

4. Copier les fichiers du projet par le partage Windows<br />
`Bezel-switchoff.jpg dans \\recalbox\share\roms\linuxtools\images`<br />
`Bezel-switchon.jpg dans \\recalbox\share\roms\linuxtools\images`<br />

5. Rendre exécutable les sh<br />
`chmod 777 "/recalbox/share/roms/linuxtools/Bezel - switchon.sh"`<br />
`chmod 777 "/recalbox/share/roms/linuxtools/Bezel - switchoff.sh"`<br />

6. Relancer Recalbox

Une nouvelle plateforme va apparaitre (sans thème) avec les 2 scripts "Bezel - switchon.sh" et "Bezel - switchoff.sh"
