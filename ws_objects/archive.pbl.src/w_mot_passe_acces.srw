$PBExportHeader$w_mot_passe_acces.srw
forward
global type w_mot_passe_acces from window
end type
type p_1 from picture within w_mot_passe_acces
end type
type st_mdp from statictext within w_mot_passe_acces
end type
type st_utilisateur from statictext within w_mot_passe_acces
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
integer height = 1312
boolean titlebar = true
string title = "Accès à Module Archivage Externe"
windowtype windowtype = response!
long backcolor = 16777215
boolean clientedge = true
p_1 p_1
st_mdp st_mdp
st_utilisateur st_utilisateur
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
this.p_1=create p_1
this.st_mdp=create st_mdp
this.st_utilisateur=create st_utilisateur
this.sle_nom=create sle_nom
this.em_passe=create em_passe
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.Control[]={this.p_1,&
this.st_mdp,&
this.st_utilisateur,&
this.sle_nom,&
this.em_passe,&
this.cb_annuler,&
this.cb_ok}
end on

on w_mot_passe_acces.destroy
destroy(this.p_1)
destroy(this.st_mdp)
destroy(this.st_utilisateur)
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

type p_1 from picture within w_mot_passe_acces
integer x = 375
integer y = 72
integer width = 1166
integer height = 436
string picturename = "logo_arakis.png"
boolean focusrectangle = false
end type

type st_mdp from statictext within w_mot_passe_acces
integer x = 87
integer y = 812
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
integer y = 684
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

type sle_nom from singlelineedit within w_mot_passe_acces
integer x = 613
integer y = 672
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
integer y = 800
integer width = 311
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
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from commandbutton within w_mot_passe_acces
integer x = 928
integer y = 1008
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
integer y = 1008
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
SQLCA.dbpass 		= "sql"
SQLCA.autocommit 	= false

	// Cabinet
	SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"

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
			halt close
		case -83
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre cablage réseau")
			halt close
		case else
			messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre configuration ODBC ou votre cablage réseau")
			halt close
	end choose

	close(w_patience)

else
	// La connexion s'est bien passée ...
	
	
	// Vérification de l'utilisateur et du mot de passe ....
	vnom = sle_nom.text
		
		SELECT "code", "passe" INTO :utilisateur_code, :vpasse
		FROM "dba"."utilisateurs"
		WHERE nom = :vnom ;
		
		if isnull(vpasse) then vpasse = ''
		
		if SQLCA.sqlcode = 0 then
			// l'utilisateur existe
		
			if "SWAP" = em_passe.text or trim(em_passe.text) = vpasse then
				// C'est bon
				// Enregistrement du mode de connexion dans ORTHOKIS.INI, pour la prochaine fois
				
				utilisateur_nom = vnom
				
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

if blocal then close(parent)


// Vérification de la base de données ...
double vb
select min(version_base) into :vb from param ;

if long(vb) = long(version_base_autorisee) then
	open(w_main)
	
else
	
	MessageBox("ATTENTION","Cette version du logiciel fonctionne avec une base de données "+string(version_base_autorisee)+"~n~nVous êtes actuellement en Base de Données "+string(vb)+"~n~nVous ne pouvez donc pas utiliser ce module !")
end if
end event

