RECALBOX-SCRIPT-TOOLS
==============================
# Readme / lisez-moi
***Par Nordicpower***
*amiga15@outlook.fr / https://twitter.com/nordicpower*
***Mars 2019***

Ce projet est destiné à ajouter des nouvelles fonctionnalités à RECALBOX par l'intermédiaire de nouveaux scripts en ligne de commande.


##  Quelles fonctionnalités ?

### Les Bezels

Le format 4:3 entraine sur les téléviseurs 16:9 des barres noires verticales sur les côtés à cause des diffèrences de rapport dans l'affichage.
Les Bezels sont des images qui permettent de completer ce vide par des images statiques.

Le script permet d'activer ou de désactiver cette fonctionnalité. Lisez README_Bezels.md pour l'installation


### Les themes téléchargeables

Les themes permettent de personaliser l'interface de lancement de Recalbox, ceux-ci sont stockés dans /recalbox/share_init/system/.emulationstation/themes
Les themes comportent de nombreuses images ce qui coûte de la place sur la SD et du temps de téléchargement

Le script permet à travers une plateforme dédiée, de télécharger des thèmes à la demande et de rafraichir la liste disponible
Cela permet de proposer de nombreux themes sans les fournir dans une image et de les mettre à jour régulièrement


Lisez README_WebTheme.md pour l'installation




##  Comment installer ce type de script?

Ces scripts sont lancés à travers une nouvelle plateforme dédiée dans EmulationStation, la procédure d'installation comporte toujours ces étapes:

1. Ouvrir une session ssh (j'utilise Putty sous W10) avec le compte root

2. Passer la SD en mode écriture
`mount -o remount,rw /`<br />

3. Editer le fichier des plateformes pour ajouter une plateforme (fichier /recalbox/share_init/system/.emulationstation/es_systems.cfg)
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

4. Créer le dossier destination inscrit dans la ligne path
`mkdir /recalbox/share/roms/linuxtools`<br />
`chmod 777 /recalbox/share/roms/linuxtools`<br />
`mkdir /recalbox/share/roms/linuxtools/images`<br />

5. Relancer recalbox la prise en compte
`reboot

nordicpower