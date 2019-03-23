RECALBOX-SCRIPT-TOOLS
==============================
# Readme / lisez-moi
***Par Nordicpower***
*amiga15@outlook.fr / https://twitter.com/nordicpower*
***MARS 2019***

Ce projet est destiné à ajouter la capacité à télécharger des themes à partir d'une plateforme.

##  Principe

la plateforme utilise des fichiers textes avec une extension url. Celui-ci contient une url de direct download.

Cas de Dropbox
https://www.dropbox.com/s/xxx/yyyy.zip?dl=1  => dl=1 signifie chargement direct, par défaut, dropbox fourni les url dl=0 qui ouvre une interface web

Cas de Google Drive
Il est impératif de récupérer le lien du bouton après avoir appuyer sur télécharger, il ressemble à :
https://drive.google.com/uc?authuser=0&id=xxxxxx&export=download

Le script télécharge le fichier zip (pas d'autre format supporté par recalbox); le décompresse et copie les fichiers dans /recalbox/share_init/system/.emulationstation/themes

Ceux-ci sont alors disponibles dans le menu recabox système "Options de l'interface/Thème"...


Un fichier est particulier : UpdateThemes.url => il permet de mettre à jour le système en téléchargeant un zip contenant tous les fichiers url et un gamelist pour l'affichage,
ainsi que le script de téléchargement...


##  Comment installer ?

1. Ouvrir une session ssh (j'utilise Putty sous W10) avec le compte root

2. Passer la SD en mode écriture
`mount -o remount,rw /`<br />

3. Editer le fichier des plateformes pour ajouter une plateforme (fichier /recalbox/share_init/system/.emulationstation/es_systems.cfg)
`nano /recalbox/share_init/system/.emulationstation/es_systems.cfg`<br />
Ajouter la plateforme suivante:<br />
`<!--NORDIC POWER-->`<br />
`  <system>`<br />
`    <fullname>theme</fullname>`<br />
`    <name>theme</name>`<br />
`    <path>/recalbox/share/roms/theme</path>`<br />
`    <extension>.url .URL</extension>`<br />
`    <command>/recalbox/share/roms/theme/ThemeWebInstall.sh %ROM% %CONTROLLERSCONFIG%</command>`<br />
`    <platform>linux</platform>`<br />
`    <theme>theme</theme>`<br />
`    <emulators/>`<br />
`  </system>`<br />

4. Créer le dossier destination inscrit dans la ligne path
`mkdir /recalbox/share/roms/theme`<br />
`chmod 777 /recalbox/share/roms/theme`<br />
`mkdir /recalbox/share/roms/theme/images`<br />

5. Sous Windows, télécharger l'archive UpdateThemes.zip et copier le contenu dézippé sous \\recalbox\share\roms\theme

6. Rendre executable le sh
`chmod 777 /recalbox/share/roms/theme/*.sh`<br />

7. Relancer recalbox
 
8. La nouvelle plateforme Theme est disponible
