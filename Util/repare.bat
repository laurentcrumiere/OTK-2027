@echo off
CLS
echo LA COMMANDE DOIT SE LANCER DE MSDOS (dans le bon rep)
PAUSE

if not exist unload\*.* goto suite1
cls
echo Le repertoire UNLOAD existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin

:suite1

if not exist orthosos.db goto suite2
cls
echo Le fichier Orthosos.db existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin

:suite2
if not exist orthosos.log goto suite3
cls
echo Le fichier Orthosos.log existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin
:suite3


if not exist reload.sql goto suite4
cls
echo Le fichier reload.sql existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin
:suite4


if not exist repare.db goto suite5
cls
echo Le fichier repare.db existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin
:suite5

if not exist repare.log goto suite6
cls
echo Le fichier repare.log existe deja.
echo Vous devez l'effacer avant de poursuivre.
goto fin
:suite6





rem On utilise REBUILD.BAT livr‚ par SYBASE
rem On obtient la base REPARE.DB
Call rebuild Orthokis Repare SQL

CLS
echo --------------------------------------------------------------------
echo            ATTENDEZ LA FIN DE LA RECONSTRUCTION EN COURS 
echo --------------------------------------------------------------------
pause

rem On renomme l'ancienne Base
ren orthokis.db orthosos.db
ren orthokis.log orthosos.log

rem On met en place la base Repare.sql
ren repare.db orthokis.db

rem On met le Log en activite
c:\sqlany50\win32\dblog -t orthokis.log orthokis.db

del repare.log /a:r

:fin
