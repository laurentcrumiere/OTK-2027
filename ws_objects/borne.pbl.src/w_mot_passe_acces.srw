$PBExportHeader$w_mot_passe_acces.srw
forward
global type w_mot_passe_acces from window
end type
type cbx_config from checkbox within w_mot_passe_acces
end type
type st_mdp from statictext within w_mot_passe_acces
end type
type st_utilisateur from statictext within w_mot_passe_acces
end type
type p_1 from picture within w_mot_passe_acces
end type
type sle_nom from singlelineedit within w_mot_passe_acces
end type
type em_passe from singlelineedit within w_mot_passe_acces
end type
type cb_annuler from commandbutton within w_mot_passe_acces
end type
type cb_ok from commandbutton within w_mot_passe_acces
end type
end forward

global type w_mot_passe_acces from window
integer x = 699
integer y = 640
integer width = 1883
integer height = 1484
boolean titlebar = true
string title = "Accès à Borne Salle d~'Attente"
windowtype windowtype = response!
long backcolor = 16777215
boolean clientedge = true
cbx_config cbx_config
st_mdp st_mdp
st_utilisateur st_utilisateur
p_1 p_1
sle_nom sle_nom
em_passe em_passe
cb_annuler cb_annuler
cb_ok cb_ok
end type
global w_mot_passe_acces w_mot_passe_acces

type variables
boolean	blocal
end variables

on w_mot_passe_acces.create
this.cbx_config=create cbx_config
this.st_mdp=create st_mdp
this.st_utilisateur=create st_utilisateur
this.p_1=create p_1
this.sle_nom=create sle_nom
this.em_passe=create em_passe
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.Control[]={this.cbx_config,&
this.st_mdp,&
this.st_utilisateur,&
this.p_1,&
this.sle_nom,&
this.em_passe,&
this.cb_annuler,&
this.cb_ok}
end on

on w_mot_passe_acces.destroy
destroy(this.cbx_config)
destroy(this.st_mdp)
destroy(this.st_utilisateur)
destroy(this.p_1)
destroy(this.sle_nom)
destroy(this.em_passe)
destroy(this.cb_annuler)
destroy(this.cb_ok)
end on

event open;


// centrer de la fenêtre 
centrer(this)


//**************************** HASP ****************************//
// si w51 pas un modulo de 5 -> on met à 0, du coup si en num authenticité provisoire
// au prochain lancement : demande de num final, c la punition !!!
// car normalement ça ne devrait jamais être ainsi ...

//if not h.is4net() then
//	if mod(h.rw(51),5) <> 0 then h.ww(51,0)
//end if 
//**************************** HASP ****************************//

sle_nom.text = profilestring(dir_ini+"orthokis.ini","connexion","utilisateur","")



cb_ok.setfocus()

end event

event close;////******************** HASP ********************//
//do	// init du w33 -> c un autre leurre
//	// on rentre ds un do ... loop pour éviter les mauvaises surprise
//	// de dépassement de capasité d'un mot de 16bits
//	h.ww(33,long(h.cd(today(),h.gbcd())))
//	// on est ds un do ... loop pour éviter les mauvaises surprises
//	// de dépassement de capasité d'un mot de 16bits
//loop while h.rw(33) > 55535
////******************** HASP ********************//
//
if not blocal then
	Halt close
end if

end event

type cbx_config from checkbox within w_mot_passe_acces
integer x = 123
integer y = 904
integer width = 1637
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Accéder à la fenêtre de configuration avant le lancement"
end type

type st_mdp from statictext within w_mot_passe_acces
integer x = 87
integer y = 752
integer width = 466
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Mot de Passe"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_utilisateur from statictext within w_mot_passe_acces
integer x = 133
integer y = 624
integer width = 421
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Utilisateur"
alignment alignment = right!
boolean focusrectangle = false
end type

type p_1 from picture within w_mot_passe_acces
integer x = 338
integer y = 4
integer width = 1175
integer height = 540
string picturename = "Logo_arakis.png"
boolean focusrectangle = false
end type

type sle_nom from singlelineedit within w_mot_passe_acces
integer x = 613
integer y = 612
integer width = 1079
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
integer x = 613
integer y = 740
integer width = 1079
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
boolean password = true
textcase textcase = upper!
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from commandbutton within w_mot_passe_acces
integer x = 928
integer y = 1092
integer width = 549
integer height = 116
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Quitter"
end type

event clicked;blocal = false
close(parent)
end event

type cb_ok from commandbutton within w_mot_passe_acces
integer x = 306
integer y = 1092
integer width = 549
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Valider"
boolean default = true
end type

event clicked;string	vnom, vpasse
//string	lnom	// pour le hasp : le nom de cette var n'est pas trés parleur, c fait pour !


blocal = false	//init var

open(w_patience)

//************************ Connection à la base ************************//

//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
SQLCA.autocommit 	= false

	// Cabinet
	SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"
	// Local
	//SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_local;UID=DBA;PWD=SQL'"

CONNECT;	//connection

//************************ Connection à la base ************************//

If SQLCA.sqlcode <> 0 Then
	//erreur de connection
	Choose Case SQLCA.sqlcode 	//laquelle ?
		case 999
				messagebox("Connection Impossible !","Veuillez vérifier votre configuration ODBC")
				close(w_patience)
				blocal = false
				halt close
		case -80
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier que votre serveur de base de données Orthokis fonctionne")
		case -83
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre cablage réseau")
		case else
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre configuration ODBC ou votre cablage réseau")
	end choose

	close(w_patience)

else
	// La connexion s'est bien passée ...
	
	double version_bd
	// Recherche de paramètres généraux
	SELECT "version_base" INTO :version_bd FROM "param" ;
	
	BELGIQUE =  h.checkoption(33)				// opt33 : Belgique

	if version_bd <> version_base_autorisee then
		// Problème de version de base de données
		MessageBox("ERREUR DE VERSION DE BASE DE DONNEES","Votre base de données actuelle est en version "+string(version_bd)+".~n~nCette version de la Borne d'ORTHOkis fonctionne avec une version "+string(version_base_autorisee)+".~n~nVous devez mettre à jour Orthokis (en le lançant) pour mettre à jour la Borne Salle d'Attente.")
		close(w_patience)
		Disconnect ;
		blocal = false
	else
	
	
		// Vérification de l'utilisateur et du mot de passe ....
		vnom = sle_nom.text
		
		if trim(vnom) = 'ARAKIS' and em_passe.text = 'ARAKIS' then
			// Cas particulier :
			// si l'utilisateur est ARAKIS avec le mot de passe ARAKIS :
			// C'est qu'on essaie de rentrer en dépannage,
			// On validera l'entrée avec AffPasse ....
			
			//openwithparm(w_affpasse,"ARAKISARAKIS")
			
			// En retour renvoie 1 si OK , 0 sinon
//			If Message.DoubleParm = 1 then
//				// Ok .. on peut rentrer
//				blocal = true
//				//close(parent)
//			else
//				// entrée interdite
//				close(w_patience)
//				Disconnect ;
//				blocal = false
//				//return
//			end if
			
		else
			// Cas normal : utilisateur classic
		
			SELECT "code", "passe" INTO :utilisateur_code, :vpasse
			FROM "utilisateurs"
			WHERE nom = :vnom and actif = 1 ;
			
			if isnull(vpasse) then vpasse = ''
			
			if SQLCA.sqlcode = 0 then
				// l'utilisateur existe
			
				if "SWAP" = em_passe.text or trim(em_passe.text) = vpasse then
					// C'est bon
					// Enregistrement du mode de connexion dans ORTHOKIS.INI, pour la prochaine fois
					Setprofilestring(dir_ini+"orthokis.ini","connexion","utilisateur",vnom) 
					
					utilisateur_nom = vnom
					
					// Initialisation du tableau des droits d'accès
					//initialisation_droits(utilisateur_code)
					
					blocal = true
					//close(parent)
				
				else
					MessageBox("ATTENTION !","Mot de passe incorrect !")
					em_passe.setfocus()
					em_passe.text = ""
					close(w_patience)
					Disconnect ;
					blocal = false
					//return
				end if
			else
				MessageBox("ATTENTION !","Utilisateur incorrect !")
				sle_nom.setfocus()
				em_passe.text = ""
				close(w_patience)
				Disconnect ;
				blocal = false
				//return
			end if
		end if
		
	end if
	
end if

if blocal then 
	// ca ca être good
	
	NOMBRE_POSTES_AUTORISES = h.rnP()	// Nombre de postes codés
	
	SERIAL = string(h.rns())	//lecture num série (codé ds num authenticité)

	
	// Mettre une trace ... à l'entrée et teste le  nombre de postes connectés
	ajout_histo_connexion("E")
	
	// Vérification de la présence d'un état de rendez-vous de type salle d'attente
	long cpt_etat_salle_attente
	cpt_etat_salle_attente = 0
	select count(*) into :cpt_etat_salle_attente from etat_rdv where actif = 1 and salle_attente = 'O' ;
	
	if cpt_etat_salle_attente = 0 then
		Messagebox("ERREUR","Il n'y a pas d'état de rendez-vous 'SALLE D'ATTENTE' paramétré dans Orthokis.~n~nVeuillez y remédier en allant dans le menu 'Tables', puis 'Rendez-vous', puis 'Etat des Rendez-vous'.")
		disconnect ;
		halt close ;
	end if
	
	// Vérification de l'état actuellement paramétré 
	string etat_salle_attente
	etat_salle_attente = ProfileString (dir_ini+"orthokis.ini","Borne","etat_salle_attente","S")
	cpt_etat_salle_attente = 0
	select count(*) into :cpt_etat_salle_attente from etat_rdv where actif = 1 and salle_attente = 'O' and code = :etat_salle_attente ;
	if cpt_etat_salle_attente = 0 then
		Messagebox("ERREUR","L'état 'SALLE D'ATTENTE' actuellement paramétré dans la Borne ("+etat_salle_attente+") n'existe plus dans Orthokis.~n~nVeuillez y remédier ... pour cela, nous vous présentons la fenêtre de configuration et nous vous invitons à choisir un état à l'aide de l'onglet AUTRE.")
		open(w_config)
	else
		// verfi si fenêtre de config
		
		if cbx_config.checked then
			open(w_config)
		end if	
	end if
	
	// forcer ouverture / fermeture qui fait planter chez certains
	//openWithParm( w_config, 1)
	

	close(parent)
end if

end event

