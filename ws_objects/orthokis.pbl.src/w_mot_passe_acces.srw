$PBExportHeader$w_mot_passe_acces.srw
forward
global type w_mot_passe_acces from window
end type
type st_sql_server from statictext within w_mot_passe_acces
end type
type cb_reset from commandbutton within w_mot_passe_acces
end type
type st_version from statictext within w_mot_passe_acces
end type
type p_1 from picture within w_mot_passe_acces
end type
type dw_1 from datawindow within w_mot_passe_acces
end type
type cbx_distant from checkbox within w_mot_passe_acces
end type
type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_acces
end type
type cb_ok from uo_picturebutton_390x120 within w_mot_passe_acces
end type
type sle_nom from singlelineedit within w_mot_passe_acces
end type
type em_passe from singlelineedit within w_mot_passe_acces
end type
type st_utilisateur from statictext within w_mot_passe_acces
end type
type st_mdp from statictext within w_mot_passe_acces
end type
end forward

global type w_mot_passe_acces from window
integer width = 2249
integer height = 1536
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
windowanimationstyle openanimation = bottomslide!
windowanimationstyle closeanimation = topslide!
integer animationtime = 1200
st_sql_server st_sql_server
cb_reset cb_reset
st_version st_version
p_1 p_1
dw_1 dw_1
cbx_distant cbx_distant
cb_annuler cb_annuler
cb_ok cb_ok
sle_nom sle_nom
em_passe em_passe
st_utilisateur st_utilisateur
st_mdp st_mdp
end type
global w_mot_passe_acces w_mot_passe_acces

type prototypes

FUNCTION ulong GetClassName(ulong hwnd,ref string lpClassName,ulong       nMaxCount) LIBRARY "user32.dll" ALIAS FOR "GetClassNameA;Ansi"
FUNCTION	uLong			GetModuleBaseName (ulong process_handle, ulong module_handle,REF STRING base_name, ulong buffer_size) LIBRARY "PSAPI.dll" alias for "GetModuleBaseNameW"

end prototypes

type variables
boolean	blocal

end variables

on w_mot_passe_acces.create
this.st_sql_server=create st_sql_server
this.cb_reset=create cb_reset
this.st_version=create st_version
this.p_1=create p_1
this.dw_1=create dw_1
this.cbx_distant=create cbx_distant
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.sle_nom=create sle_nom
this.em_passe=create em_passe
this.st_utilisateur=create st_utilisateur
this.st_mdp=create st_mdp
this.Control[]={this.st_sql_server,&
this.cb_reset,&
this.st_version,&
this.p_1,&
this.dw_1,&
this.cbx_distant,&
this.cb_annuler,&
this.cb_ok,&
this.sle_nom,&
this.em_passe,&
this.st_utilisateur,&
this.st_mdp}
end on

on w_mot_passe_acces.destroy
destroy(this.st_sql_server)
destroy(this.cb_reset)
destroy(this.st_version)
destroy(this.p_1)
destroy(this.dw_1)
destroy(this.cbx_distant)
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.sle_nom)
destroy(this.em_passe)
destroy(this.st_utilisateur)
destroy(this.st_mdp)
end on

event open;Trace(" === Open w_mot_passe_acces ===")

if profileString(dir_ini+inifile_orthokis,"Ouverture","ouverture_animee","O") = "N" then
	this.OpenAnimation = NoAnimation!
	this.CloseAnimation = NoAnimation!
end if


// centrer de la fenêtre 
//centrer(this)


//// Bidouille spéciale pour les JO

//// on regarde dans le .ini un build de test supérieur
//string v_build
//v_build = profilestring(dir_ini+inifile_orthokis,"arakis","build","") 

//if v_build <> "" then 
//	if version_ce_logiciel < v_build then
//		version = "2026 (" + v_build + ") du 01.11.2025"
//	end if
//end if 
	
st_version.text = version


// SQL_Server 
if SQL_Server then
	
	cbx_distant.visible = false
	cbx_distant.checked = false
	st_sql_server.visible = true

else

	// On regarde comment on s'est connecté la dernière fois !
	if profilestring(dir_ini+inifile_orthokis,"replication","connexion_distante","N")  = "O" then
		cbx_distant.checked = true
	else
		cbx_distant.checked = false
	end if
	
end if
//

sle_nom.text = profilestring(dir_ini+inifile_orthokis,"connexion","utilisateur","")


em_passe.setfocus()


if OUVERTURE_AUTOMATIQUE then
	// on verifiera que le user est OK plus tard ... dans le CLICK du bouton ENTREE
	cb_ok.triggerevent(clicked!)
end if
end event

event close;//******************** HASP ********************//
// Déscative en version 2011
//do	// init du w33 -> c un autre leurre
//	 on rentre ds un do ... loop pour éviter les mauvaises surprise
//	 de dépassement de capacité d'un mot de 16bits
//	h.ww(33,long(h.cd(today(),h.gbcd())))
//loop while h.rw(33) > 55535
//

//// mise à jour d'orthokis.ini pour l'animation flash
//if cbx_animation.checked then
//	Setprofilestring(dir_ini+inifile_orthokis,"connexion","flash","O")
//else
//	Setprofilestring(dir_ini+inifile_orthokis,"connexion","flash","N")
//end if

Trace(". Close")

if not blocal then
	son(5)
	HALT CLOSE
end if

end event

type st_sql_server from statictext within w_mot_passe_acces
boolean visible = false
integer x = 800
integer y = 996
integer width = 955
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "Connexion à SQL Server"
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_mot_passe_acces
boolean visible = false
integer x = 398
integer y = 1568
integer width = 402
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Reset Opt. Dyn."
end type

event clicked;if messagebox("ATTENTION", "Confirmez-vous la remise à zéro des options dynamiques ?", QUestion!, YesNo!, 2) = 1 then
	//Prépa transaction pour la base ORTHOKIS
	SQLCA.DBMS 			= "ODBC"
	SQLCA.database 	= "Orthokis"
	SQLCA.userid 		= "dba"
	SQLCA.dbpass 		= "SQL"
	//SQLCA.logId 		= "dba"
	//SQLCA.LogPass 	= "SQL"
	SQLCA.autocommit 	= false
	
	if cbx_distant.checked then
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_local'"
	else
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"
	end if
	
	
	CONNECT;	//connection
	
	
	update param set options_dynamiques = '' ;
	commit ; 
	
end if


DISCONNECT ;

cb_reset.visible = true
end event

type st_version from statictext within w_mot_passe_acces
integer x = 18
integer y = 1412
integer width = 1093
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean focusrectangle = false
end type

event rbuttondown;dw_1.visible = true

//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
//SQLCA.logId 		= "dba"
//SQLCA.LogPass 	= "SQL"
SQLCA.autocommit 	= false

if cbx_distant.checked then
	SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_local'"
else
	if SQL_Server then
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_SQLServeur_32'"
	else
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"
	end if
end if


CONNECT;	//connection

dw_1.reset()
dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_1.setfocus()

DISCONNECT ;

cb_reset.visible = true
parent.height = 1712
end event

type p_1 from picture within w_mot_passe_acces
integer x = 133
integer y = 108
integer width = 1934
integer height = 408
string picturename = "logo_orthokis.png"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_mot_passe_acces
boolean visible = false
integer x = 837
integer y = 1580
integer width = 1198
integer height = 80
integer taborder = 50
string title = "none"
string dataobject = "dw_cherche_utilisateur"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;

string v_code, v_nom
v_code = data
//getitemString(row, "code")

CONNECT;	//connection

select nom into :v_nom from utilisateurs where code  = :v_code ;

sle_nom.text = v_nom

DISCONNECT ;


end event

event getfocus;string v_code, v_nom

if rowcount() > 0 then

	v_code = getitemString(1, "code")
	
	CONNECT;	//connection
	
	select nom into :v_nom from utilisateurs where code  = :v_code ;
	
	sle_nom.text = v_nom
	
	DISCONNECT ;
end if
end event

type cbx_distant from checkbox within w_mot_passe_acces
integer x = 800
integer y = 1000
integer width = 754
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Utillisation Autonome"
end type

type cb_annuler from uo_picturebutton_390x120 within w_mot_passe_acces
integer x = 1193
integer y = 1180
integer width = 530
integer height = 148
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;//blocal = false
//close(parent)


if not isnull(h) then 
	h.logout( )
end if


Disconnect ; 

// Pas de halt close sinon ça plante l'IDE
halt  
end event

type cb_ok from uo_picturebutton_390x120 within w_mot_passe_acces
integer x = 645
integer y = 1180
integer width = 530
integer height = 148
integer taborder = 30
string text = "&Entrer"
boolean default = true
string iconname = "ACTIONS_entrer.png"
end type

event clicked;Trace(". Début bouton ENTREE")


string	vnom, vpasse
integer nb_connectes
boolean v_message
//string	lnom	// pour le hasp : le nom de cette var n'est pas trés parleur, c fait pour !


blocal = false	//init var

open(w_patience)

//************************ Connection à la base ************************//

//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
//SQLCA.dbpass 		= "Dent@lsoft26"
SQLCA.dbpass 		= "SQL"
//SQLCA.logId 		= "dba"
//SQLCA.LogPass 	= "SQL"
SQLCA.autocommit 	= false

// Source de données sélectionnée
if cbx_distant.checked then
	// Locale
	SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_local'"
else
	// Cabinet
	if TESTS_ARAKIS then
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_2009'"
	else
		if SQL_Server then
			// Driver ODBC
			//SQLCA.DBParm = "ConnectString='DSN=Orthokis_SQL_Server;UID=DBA;PWD=<******>',TrimSpaces='Yes',Date=' \''dd/mm/yyyy\'' ',DateTime=' \''dd/mm/yyyy hh:mm\'' ',Time=' \''hh:mm\'' ',DelimitIdentifier='Yes'"

			// Driver intégré
			// Profile Orthokis_SQL_Direct
//			SQLCA.DBMS = "MSOLEDBSQL SQL Server"
//			SQLCA.LogPass = "Orthokis+1985"
//			SQLCA.ServerName = "LPVAL06\SQLEXPRESS"
//			SQLCA.LogId = "dba"
//			SQLCA.AutoCommit = False
//			SQLCA.DBParm = "Database='Orthokis',TrustedConnection=1,DelimitIdentifier=1"
//
			
			SQLCA.DBMS = "MSOLEDBSQL SQL Server"
			SQLCA.ServerName = "LPVAL06\SQLEXPRESS"
			SQLCA.AutoCommit = False
			SQLCA.DBParm = "Database='Orthokis',TrustedConnection=1,DelimitIdentifier=1"

		else
			SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"
		end if
	end if
end if

CONNECT;	//connection

//************************ Connection à la base ************************//

If SQLCA.sqlcode <> 0 Then
	//erreur de connection
	Choose Case SQLCA.sqlcode 	//laquelle ?
		case 999
			if parent.cbx_distant.checked then	
				messageBox("Connexion Impossible !","Votre poste n'est pas configuré pour une utilisation distante")
				close(w_patience)
				blocal = false
				Halt 
			else
				messagebox("Connexion Impossible !","Veuillez vérifier votre configuration ODBC")
				close(w_patience)
				blocal = false
				halt 
			end if
		case -80
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier que votre serveur de base de données Orthokis fonctionne")
		case -83
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre cablage réseau")
		case else
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre configuration ODBC ou votre paramétrage réseau")
	end choose

	close(w_patience)

else
	// La connexion s'est bien passée ...
	Trace(". Connexion Base OK")
	
	double version_bd
	// Recherche de paramètres généraux
	SELECT "dernier", "passe", "version_base" INTO :var_dernier, :passe, :version_bd FROM "param" ;
	
	if OUVERTURE_AUTOMATIQUE then
		
		string v_nom
		integer v_nb
		
	
		// Autres liens ...
		
		string v_chu_matricule, v_code_utilisateur
	
		v_chu_matricule = profileString(dir_ini + inifile_orthokis , "Communication" , "chu_matricule" , "*******")
	
		if v_chu_matricule =  "*******" then
			// pas spécifié .... on force l'entrée
			// on n'a pas l'utilisateur .. c'est qu'il n'est pas spéciifié .. on prend le 1er actif ... c'est que c'est un lien Visio ou autre qui chargera ensuite un autre user
			SELECT count(*) INTO :v_nb FROM "utilisateurs" WHERE nom = :v_nom and actif = 1;
		
			if v_nb = 0 then
				SELECT min(nom) INTO :v_nom FROM "utilisateurs" WHERE actif = 1;
				sle_nom.text = v_nom
				em_passe.text = "SWAP"

			end if		
			
		else
			select code_utilisateur into :v_code_utilisateur from chu_utilisateur where trim(identifiant_chu) = trim(:v_chu_matricule) ;
		
			if not isnull(v_code_utilisateur) and trim(v_code_utilisateur) <> '' then
				// on a trouvé l'utilisateur
				select code, nom into :utilisateur_code, :utilisateur_nom from utilisateurs where code = :v_code_utilisateur ;
				sle_nom.text = utilisateur_nom
				v_nom = trim(sle_nom.text)
			end if
		
			v_nom = trim(sle_nom.text)

			SELECT count(*) INTO :v_nb FROM "utilisateurs" WHERE nom = :v_nom and actif = 1;

			if v_nb = 0 then
				SELECT min(nom) INTO :v_nom FROM "utilisateurs" WHERE actif = 1;
				sle_nom.text = v_nom
				em_passe.text = "SWAP"
			end if
		
		end if
	end if
	
			
	// Vérification de l'utilisateur et du mot de passe ....
	vnom = sle_nom.text
	
	if trim(vnom) = 'ARAKIS' and em_passe.text = 'ARAKIS' then
		// Cas particulier :
		// si l'utilisateur est ARAKIS avec le mot de passe ARAKIS :
		// C'est qu'on essaie de rentrer en dépannage,
		// On validera l'entrée avec AffPasse ....
		
		openwithparm(w_affpasse,"ARAKISARAKIS")
		
		// En retour renvoie 1 si OK , 0 sinon
		If Message.DoubleParm = 1 then
			// Ok .. on peut rentrer
			blocal = true
			//close(parent)
		else
			// entrée interdite
			close(w_patience)
			Disconnect ;
			blocal = false
			//return
		end if
		
	else
		// Cas normal : utilisateur classic
		Trace(". Utilisateur Classique")

	
		//**************************** HASP ****************************//
		// vérif si clef fait pour ce cabinet uniquement si base en v9.6, sinon on laisse
		// tombé et sera pris en cpt uniquement après première init
		if version_bd >= 9.6 then
			// si base bien en version 9.6 ou supérieur
			if h.rak(0) <> 'INITIALISATION' then
				// si base déjà initialisée
				if h.cp(h.rak()) = 1 then
					// si le num authenticité est valide (calcule sur bit de parité)
					if not h.chak(h.rak()) then
						// si num authenticité pas fait pour le num client init ds HASP
						signalerror(2010,"Clef pas fait pour ce HASP")
					else
						// num authenticité valide (cf bit de parité)
//						if h.tm1o(2,2) AND (h.rw(19) = h.rw(28)) then
//							// si on est encore en période d'essais
//							// Et que la clef n'est pas encore initialisé
//							
//							// maj du w38 du HASP avec date du jour
//							// contrairement au w37 : le w38 est util ds le script d'init du HASP,
//							// c la date de ref pour le calcule du w28
//							h.ww(38,long(h.cd(today(),false)))
//						end if
					end if
				end if
			else
				// base pas encore init
				// maj du w38 du HASP avec date du jour
				// contrairement au w37 : le w38 est util ds le script d'init du HASP,
				// c la date de ref pour le calcule du w28
				h.ww(38,long(h.cd(today(),false)))
			end if
		end if
		//**************************** HASP ****************************//
		
		SELECT "code", "passe" INTO :utilisateur_code, :vpasse
		FROM "utilisateurs"
		WHERE nom = :vnom and actif = 1;
		
		if isnull(vpasse) then vpasse = ''
		
		if SQLCA.sqlcode = 0 then
			// l'utilisateur existe
		
			passe =  fxg_get_mot_passe_administrateur()
			
			if "SWAP" = em_passe.text or trim(em_passe.text) = vpasse or (trim(em_passe.text) = passe and passe <> "") then
				// C'est bon
				// Enregistrement du mode de connexion dans ORTHOKIS.INI, pour la prochaine fois
				if cbx_distant.checked then
					Utilisation_distante = true
					Setprofilestring(dir_ini+inifile_orthokis,"replication","connexion_distante","O") 
				else
					Utilisation_distante = false
					Setprofilestring(dir_ini+inifile_orthokis,"replication","connexion_distante","N") 
				end if
				Setprofilestring(dir_ini+inifile_orthokis,"connexion","utilisateur",vnom) 
				
				utilisateur_nom = vnom
				
				blocal = true
				//close(parent)
			
			else
				son(5)
				MessageBox("ATTENTION !","Mot de passe incorrect !")
				em_passe.setfocus()
				em_passe.text = ""
				close(w_patience)
				Disconnect ;
				blocal = false
				//return
			end if
		else
			son(5)
			MessageBox("ATTENTION !","Utilisateur incorrect !")
			sle_nom.setfocus()
			em_passe.text = ""
			close(w_patience)
			Disconnect ;
			blocal = false
			//return
		end if
	end if
	
//	string im_2013
//
//	if version_bd = 2013 and blocal then
//		// On patch automatiquement en version 2013.01 SI ON EST EN NOUVELLE IMAGERIE 2013 ... coucougnette dans nouvelle imagerie
//		
//		SELECT min("imagerie_2013") INTO  :im_2013 FROM "param" ;
//
//		if im_2013 = 'O' then 
//			insert into type_image values (46, 'Moulages haut et bas', 460, 'MHB', 1, 0);
//			insert into type_image values (49, 'Tableau de mesures (graphique)', 505, 'OTMG', 1, 0);
//		end if
//		update param set version_base = 2013.01 ;
//		commit ;
//		version_bd = 2013.01
//	end if

//	if version_bd = 2014 and blocal  then
//		
//		// A t on déjà appliqué le patch
//		double v_patch = 0
//		
//		select isnull(min(patch_version_base),0) into :v_patch from param ;
//		
//		
//		if v_patch < 2014.01 then
//			// On patch automatiquement en version 2014.01 .. mais sans inscrire 2014.01 car ça pine en mise à jour centralise => on gruge en ajoutant une zone 
//			
//			SELECT min("imagerie_2013") INTO  :im_2013 FROM "param" ;
//	
//			if im_2013 = 'O' then 
//				INSERT INTO type_image(libelle, ordre_trie, code_courrier, actif, colonne) VALUES ('Composite 1', 610, 'COMPO1', 1, 0);
//				INSERT INTO type_image(libelle, ordre_trie, code_courrier, actif, colonne) VALUES ('Composite 2', 620, 'COMPO2', 1, 0);
//				INSERT INTO type_image(libelle, ordre_trie, code_courrier, actif, colonne) VALUES ('Composite 3', 630, 'COMPO3', 1, 0);	
//				INSERT INTO type_image(libelle, ordre_trie, code_courrier, actif, colonne) VALUES ('Composite 4', 640, 'COMPO4', 1, 0);
//				
//				// on ne teste pas le résultat ... s'ils y sont déjà ne seront pas ajoutés car index
//			end if
//	
//			string commande
//			
//			commande = 'Alter table email_comptes modify texte_envoi_piece_jointe varchar(30000) ;'
//			execute immediate :commande ;
//			
//	
//			
//			if sqlca.sqlcode <> 0 then
//				
//				messagebox("ERREUR EN MISE A JOUR DE LA BASE DE DONNEES",sqlca.sqlerrtext)
//			
//			else
//			
//				commande = 'Alter table param add patch_version_base numeric (7,2) ;'
//				execute immediate :commande ;
//	
//				update param set patch_version_base =  2014.01 ;
//				commit ;
//			
//			end if		
//					
//		end if
//	end if
	
	
//	if version_bd = 2018 and blocal  then
//		string v_url
//		string v_nom_publication
//		// est ce que le patch est nécessaire ?
//		select top 1 url_my_orthokis into :v_url from param ;
//		if sqlca.sqlcode <> 0 then
//			
//			nb_connectes = nombre_user_connectes()
//
//			v_message = false
//			if nb_connectes > 1 then
//				MessageBox("ATTENTION","Une (très) légère modification de la base de données va s'effectuée. Elle sera très rapide (1 seconde).~n~nMerci de demander aux autres utilisateurs d'Orthokis de quitter le logiciel quelques secondes.~n~nUne fois que ce poste sera connecté, tous les autres postes pourront se connecter à nouveau.~n~nSi ce poste se fige après que vous ayez cliqué sur OK, c'est qu'un autre utilisateur est connecté et bloque la mise à jour : demandez à cet utilisateur de quitter Orthokis quelques secondes.")
//				v_message = true
//			end if
//			
//			if replication then
//				select publication_name into :v_nom_publication from "sys"."syspublication" ;
//				commande = "PASSTHROUGH FOR SUBSCRIPTION TO "+v_nom_publication+" ;"
//				execute immediate :commande ;
//			end if
//			
//			commande = "alter table param add url_my_orthokis char(500) ;"
//			execute immediate :commande ;
//			
//			if replication then
//				commande = 'PASSTHROUGH STOP ;'
//				execute immediate :commande ;
//			end if
//			
//			commit;
//			
//			if v_message then
//				MessageBox("ATTENTION","La mise à jour a été réalisée avec succès !")
//			end if
//		end if
//	end if


	
end if

if blocal then 
	
	
	// C'est tout bon, on peut continuer normalement
	// Initialisation du tableau des droits d'accès
	initialisation_droits(utilisateur_code)
	close(parent)
end if




end event

type sle_nom from singlelineedit within w_mot_passe_acces
integer x = 800
integer y = 676
integer width = 1179
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type em_passe from singlelineedit within w_mot_passe_acces
integer x = 800
integer y = 812
integer width = 1179
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean password = true
textcase textcase = upper!
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_utilisateur from statictext within w_mot_passe_acces
integer x = 334
integer y = 684
integer width = 439
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Utilisateur : "
alignment alignment = right!
end type

type st_mdp from statictext within w_mot_passe_acces
integer x = 334
integer y = 828
integer width = 439
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Mot de Passe : "
alignment alignment = right!
end type

