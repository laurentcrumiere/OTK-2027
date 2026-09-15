$PBExportHeader$w_message.srw
forward
global type w_message from window
end type
type st_bienvenue_opaque from statictext within w_message
end type
type cb_1 from commandbutton within w_message
end type
type st_bienvenue from statictext within w_message
end type
type p_bienvenue from picture within w_message
end type
end forward

global type w_message from window
integer width = 3886
integer height = 2756
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
st_bienvenue_opaque st_bienvenue_opaque
cb_1 cb_1
st_bienvenue st_bienvenue
p_bienvenue p_bienvenue
end type
global w_message w_message

type variables


integer temps_attente
end variables

on w_message.create
this.st_bienvenue_opaque=create st_bienvenue_opaque
this.cb_1=create cb_1
this.st_bienvenue=create st_bienvenue
this.p_bienvenue=create p_bienvenue
this.Control[]={this.st_bienvenue_opaque,&
this.cb_1,&
this.st_bienvenue,&
this.p_bienvenue}
end on

on w_message.destroy
destroy(this.st_bienvenue_opaque)
destroy(this.cb_1)
destroy(this.st_bienvenue)
destroy(this.p_bienvenue)
end on

event open;
// Cette fenetre sert à afficher plusieurs type de message selon la variable globale param_win[1]

//centrer(this)
string prenom, nom
patient v_patient
string nom_du_statictext  = "st_message"

integer retard_tolere, avance_acceptee

v_patient = Message.PowerObjectParm

if isnull(prenom) then
	prenom = ""
end if

string v_message


choose case param_win[1]
	case "M"
		// Message général diffusé depuis Orthokis
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_bienvenue","")
		nom_du_statictext  = "st_bienvenue"
		// Message qui est en base
		select top 1 isnull(message_borne,'') into :v_message from param ;
		SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_texte", v_message)
	case "A"
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_anniversaire","")
		// Anniversaire
		if v_patient.adulte = "O" then
			nom_du_statictext  = "st_anniversaire_adulte"
		else
			nom_du_statictext  = "st_anniversaire"
		end if
		SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_texte",ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_texte","") )
		if version_ce_logiciel_borne >= "36.90" then 
			son(5)
		end if
	case "R"
		// Retard de règlement
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_reglement","")
		if v_patient.adulte = "O" then
			nom_du_statictext  = "st_reglement_adulte"
		else
			nom_du_statictext  = "st_reglement"
		end if
		SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_texte",ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_texte","") )
	case "P"
		// Message spécifique au patient diffusé depuis Orthokis
		p_bienvenue.Picturename = ProfileString (dir_ini+"orthokis.ini","Borne","image_fond_bienvenue","")
		nom_du_statictext  = "st_bienvenue"
		// Message qui est en base
		string v_message_conserver
		select top 1 isnull(message_borne,''), isnull(message_borne_conserver, 'N') into :v_message, :v_message_conserver 
		from patient where code = :v_patient.code ;
		// On efface de suite le message
		if v_message_conserver = 'N' then
			update patient set message_borne = '' where code = :v_patient.code ;
			commit ;
		end if
		SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_texte", v_message)
		if version_ce_logiciel_borne >= "36.90" then 
			son(6)
		end if
end choose


// Image de fond
if avec_transparence then
	p_bienvenue.x = 0
	p_bienvenue.y = 0
	p_bienvenue.width = this.width -1
	p_bienvenue.height = this.height - 1
else
	p_bienvenue.visible = false
end if

		
// On récupère la police du message
SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_taille", ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_taille","14"))
SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_gras",  ProfileString (dir_ini+"orthokis.ini","Borne",  nom_du_statictext + "_gras","N"))
SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_italique", ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_italique","N"))
SetProfileString (dir_ini+"orthokis.ini","Borne","nom_du_statictext_position", ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_position","Cent"))
SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_police", ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_police","Tahoma"))
SetProfileString (dir_ini+"orthokis.ini","Borne","st_message_couleur", ProfileString (dir_ini+"orthokis.ini","Borne", nom_du_statictext + "_couleur","0"))



// Pas de retard, textes normaux
if avec_transparence then
	st_bienvenue.visible = true
	charger_statictext(st_bienvenue,v_patient)
else
	st_bienvenue_opaque.visible = true
	charger_statictext(st_bienvenue_opaque,v_patient)
end if

// pour le compte à rebours de fermeture
temps_attente = Integer(ProfileString (dir_ini+"orthokis.ini","Borne","attente_bienvenue","5"))
Timer(1)

end event

event timer;

temps_attente = temps_attente - 1

if temps_attente <= 0 then
	close(this)
end if
end event

type st_bienvenue_opaque from statictext within w_message
string tag = "st_message"
boolean visible = false
integer x = 59
integer y = 444
integer width = 2784
integer height = 1380
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_message
integer x = 1225
integer y = 2472
integer width = 946
integer height = 240
integer taborder = 20
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type st_bienvenue from statictext within w_message
string tag = "st_message"
boolean visible = false
integer x = 27
integer y = 40
integer width = 3826
integer height = 2344
boolean bringtotop = true
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
boolean focusrectangle = false
end type

type p_bienvenue from picture within w_message
integer x = 96
integer y = 276
integer width = 1632
integer height = 528
boolean focusrectangle = false
end type

