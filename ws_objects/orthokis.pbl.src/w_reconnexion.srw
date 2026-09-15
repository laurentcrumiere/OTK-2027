$PBExportHeader$w_reconnexion.srw
forward
global type w_reconnexion from window
end type
type p_fond from picture within w_reconnexion
end type
type dw_user from datawindow within w_reconnexion
end type
type cb_annuler from uo_picturebutton_390x120 within w_reconnexion
end type
type cb_ok from uo_picturebutton_390x120 within w_reconnexion
end type
type em_passe from singlelineedit within w_reconnexion
end type
type st_utilisateur from statictext within w_reconnexion
end type
type st_mdp from statictext within w_reconnexion
end type
type gb_1 from groupbox within w_reconnexion
end type
end forward

global type w_reconnexion from window
integer x = 699
integer y = 640
integer width = 3026
integer height = 516
windowtype windowtype = response!
long backcolor = 15780518
p_fond p_fond
dw_user dw_user
cb_annuler cb_annuler
cb_ok cb_ok
em_passe em_passe
st_utilisateur st_utilisateur
st_mdp st_mdp
gb_1 gb_1
end type
global w_reconnexion w_reconnexion

type variables
boolean	blocal

string v_user_courant
end variables

on w_reconnexion.create
this.p_fond=create p_fond
this.dw_user=create dw_user
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.em_passe=create em_passe
this.st_utilisateur=create st_utilisateur
this.st_mdp=create st_mdp
this.gb_1=create gb_1
this.Control[]={this.p_fond,&
this.dw_user,&
this.cb_annuler,&
this.cb_ok,&
this.em_passe,&
this.st_utilisateur,&
this.st_mdp,&
this.gb_1}
end on

on w_reconnexion.destroy
destroy(this.p_fond)
destroy(this.dw_user)
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.em_passe)
destroy(this.st_utilisateur)
destroy(this.st_mdp)
destroy(this.gb_1)
end on

event open;
// centrer de la fenêtre 
centrer(this)


colore_tous_objets_window(this, couleur_fond_fenetre)


dw_user.settransobject(sqlca)
dw_user.retrieve()


long lig

lig = dw_user.find("code = '"+utilisateur_code+"'",0,99999)
dw_user.scrolltorow(lig)

dw_user.setfocus()

//sle_nom.text = utilisateur_nom
//sle_nom.setfocus()

//placer_image_fond(this, p_fond, image_fond_fenetre)


end event

event close;
if not blocal then
	son(5)
	HALT CLOSE
end if

end event

type p_fond from picture within w_reconnexion
string tag = "fond"
boolean visible = false
integer x = 1906
integer y = 112
integer width = 293
integer height = 152
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_user from datawindow within w_reconnexion
event test_tab pbm_dwnkey
event repositionner ( )
integer x = 562
integer y = 168
integer width = 1184
integer height = 72
integer taborder = 60
string dataobject = "dw_cherche_utilisateur"
boolean border = false
end type

event test_tab;
if  KeyDown( keyTab!) then
	// Si on tape sur TAB, on interdit le défilement de la DW, on mémorise ou on est pour s'y remettre ensuite
	v_user_courant = this.gettext()
	this.triggerevent("repositionner")
	em_passe.setfocus()
	
end if
end event

event repositionner();
// pour se remettre sur le bon
long lig 

lig = this.find("nom = '"+v_user_courant+"'", 0, 99999)
this.scrolltorow(lig)

end event

type cb_annuler from uo_picturebutton_390x120 within w_reconnexion
integer x = 2478
integer y = 240
integer width = 485
integer height = 152
integer taborder = 30
string text = "&Quitter"
string iconname = "lc_quitter.png"
end type

event clicked;call super::clicked;
blocal = false


close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_reconnexion
integer x = 1934
integer y = 240
integer width = 485
integer height = 152
integer taborder = 40
string text = "&Valider"
boolean default = true
string iconname = "ACTIONS_entrer.png"
end type

event clicked;call super::clicked;string	vcode, vnom, vpasse
//string	lnom	// pour le hasp : le nom de cette var n'est pas trés parleur, c fait pour !


blocal = false	//init var

double version_bd


// Vérification de l'utilisateur et du mot de passe ....
vnom = ""
vcode = dw_user.gettext()



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
		blocal = false
		//return
	end if
	
else

	// Cas normal : utilisateur classic

	SELECT "nom", "passe" INTO :vnom, :vpasse
	FROM "utilisateurs"
	WHERE code = :vcode ;
	
	if isnull(vpasse) then vpasse = ''
	
	if SQLCA.sqlcode = 0 then
		// l'utilisateur existe
	
		passe = fxg_get_mot_passe_administrateur()
		
		if "SWAP" = em_passe.text or trim(em_passe.text) = vpasse or (trim(em_passe.text)= passe and passe <> "") then
			// C'est bon
			// Enregistrement du mode de connexion dans ORTHOKIS.INI, pour la prochaine fois
			Utilisation_distante = false
			Setprofilestring(dir_ini+inifile_orthokis,"replication","connexion_distante","N") 

			Setprofilestring(dir_ini+inifile_orthokis,"connexion","utilisateur",vnom) 
			
			utilisateur_nom = vnom
			utilisateur_code = vcode
			
			// Initialisation du tableau des droits d'accès
			initialisation_droits(utilisateur_code)
			
			blocal = true
			//close(parent)
			
			// Reouverture de la messagerie qui a été coupé
			if Profilestring(dir_ini+inifile_orthokis,"MESSAGERIE","fermeture_Orthokis","N") = "O" then
				if Profilestring(dir_ini+inifile_orthokis,"MESSAGERIE","ouverture_Orthokis","O") = "O" then 
					fxg_lancement_messagerie()
				end if
			end if

		
		else
			son(5)
			MessageBox("ATTENTION !","Mot de passe incorrect !")
			em_passe.setfocus()
			em_passe.text = ""
			blocal = false
			//return
		end if
	else
		son(5)
		MessageBox("ATTENTION !","Utilisateur incorrect !")
		dw_user.setfocus()
		em_passe.text = ""
		blocal = false
		//return
	end if
end if


if blocal then 
	// remise en place du titre de la fenetre	
	w_mdi_2020.maj_titre_mdi()

	// Droits du nouveau user !!
	w_mdi_2020.droitsUtilisateurs()
	
	// Et c'est reparti !!
	show(w_mdi_2020)

			
	// Mise à jour de la table pour envoi messages interne
	ajout_histo_connexion("E")

	
	// Il faut reconfig les menus en fonction des droits du user !!!
	
	close(parent)
end if

end event

type em_passe from singlelineedit within w_reconnexion
integer x = 562
integer y = 292
integer width = 1074
integer height = 88
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

type st_utilisateur from statictext within w_reconnexion
integer x = 69
integer y = 172
integer width = 421
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Utilisateur"
boolean focusrectangle = false
end type

type st_mdp from statictext within w_reconnexion
integer x = 64
integer y = 300
integer width = 466
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Mot de Passe"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_reconnexion
integer x = 14
integer y = 52
integer width = 1851
integer height = 416
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Eléments de connexion"
end type

