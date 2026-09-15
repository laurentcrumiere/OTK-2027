$PBExportHeader$w_patient_mdp_web.srw
forward
global type w_patient_mdp_web from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_mdp_web
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_patient_mdp_web
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_mdp_web
end type
type uo_1 from resize_fenetre within w_patient_mdp_web
end type
type st_1 from statictext within w_patient_mdp_web
end type
type st_2 from statictext within w_patient_mdp_web
end type
type sle_email_patient from singlelineedit within w_patient_mdp_web
end type
type sle_mdp_patient from singlelineedit within w_patient_mdp_web
end type
type st_3 from statictext within w_patient_mdp_web
end type
type st_4 from statictext within w_patient_mdp_web
end type
type sle_email_parent1 from singlelineedit within w_patient_mdp_web
end type
type sle_mdp_parent1 from singlelineedit within w_patient_mdp_web
end type
type st_5 from statictext within w_patient_mdp_web
end type
type st_6 from statictext within w_patient_mdp_web
end type
type sle_email_parent2 from singlelineedit within w_patient_mdp_web
end type
type sle_mdp_parent2 from singlelineedit within w_patient_mdp_web
end type
type st_7 from statictext within w_patient_mdp_web
end type
type st_8 from statictext within w_patient_mdp_web
end type
type sle_email_payeur from singlelineedit within w_patient_mdp_web
end type
type sle_mdp_payeur from singlelineedit within w_patient_mdp_web
end type
type st_9 from statictext within w_patient_mdp_web
end type
type st_derniere_connexion from statictext within w_patient_mdp_web
end type
type pb_email_patient from picturebutton within w_patient_mdp_web
end type
type pb_1 from picturebutton within w_patient_mdp_web
end type
type pb_2 from picturebutton within w_patient_mdp_web
end type
type pb_3 from picturebutton within w_patient_mdp_web
end type
type rte_1 from richtextedit within w_patient_mdp_web
end type
type gb_patient from groupbox within w_patient_mdp_web
end type
type gb_parent1 from groupbox within w_patient_mdp_web
end type
type gb_parent2 from groupbox within w_patient_mdp_web
end type
type gb_payeur from groupbox within w_patient_mdp_web
end type
end forward

global type w_patient_mdp_web from w_fenetre_arakis
integer width = 3374
integer height = 2128
string title = "Identifiants de Connexion Portail Patient"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
uo_1 uo_1
st_1 st_1
st_2 st_2
sle_email_patient sle_email_patient
sle_mdp_patient sle_mdp_patient
st_3 st_3
st_4 st_4
sle_email_parent1 sle_email_parent1
sle_mdp_parent1 sle_mdp_parent1
st_5 st_5
st_6 st_6
sle_email_parent2 sle_email_parent2
sle_mdp_parent2 sle_mdp_parent2
st_7 st_7
st_8 st_8
sle_email_payeur sle_email_payeur
sle_mdp_payeur sle_mdp_payeur
st_9 st_9
st_derniere_connexion st_derniere_connexion
pb_email_patient pb_email_patient
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
rte_1 rte_1
gb_patient gb_patient
gb_parent1 gb_parent1
gb_parent2 gb_parent2
gb_payeur gb_payeur
end type
global w_patient_mdp_web w_patient_mdp_web

type variables


// stockage des valeurs
uo_mots_passe_patient_web uo_mdp
end variables

forward prototypes
public subroutine init ()
public subroutine sauve ()
end prototypes

public subroutine init ();

// initialisation
sle_email_patient.text  = uo_mdp.valeur[1]
sle_mdp_patient.text  = uo_mdp.valeur[2]
sle_email_parent1.text  = uo_mdp.valeur[3]
sle_mdp_parent1.text  = uo_mdp.valeur[4]
sle_email_parent2.text  = uo_mdp.valeur[5]
sle_mdp_parent2.text  = uo_mdp.valeur[6]
sle_email_payeur.text  = uo_mdp.valeur[7]
sle_mdp_payeur.text  = uo_mdp.valeur[8]

end subroutine

public subroutine sauve ();

if uo_mdp.match_email("Patient",sle_email_patient.text)  and &
uo_mdp.match_email("Parent1",sle_email_parent1.text)  and &
uo_mdp.match_email("Parent2",sle_email_parent2.text)  and &
uo_mdp.match_email("Payeur",sle_email_payeur.text)  then 

	
	uo_mdp.valeur[1] = sle_email_patient.text
	uo_mdp.valeur[2] = sle_mdp_patient.text
	uo_mdp.valeur[3] = sle_email_parent1.text  
	uo_mdp.valeur[4] = sle_mdp_parent1.text 
	
	uo_mdp.valeur[5] = sle_email_parent2.text
	uo_mdp.valeur[6] = sle_mdp_parent2.text
	uo_mdp.valeur[7] = sle_email_payeur.text
	uo_mdp.valeur[8] = sle_mdp_payeur.text 

end if
end subroutine

on w_patient_mdp_web.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.uo_1=create uo_1
this.st_1=create st_1
this.st_2=create st_2
this.sle_email_patient=create sle_email_patient
this.sle_mdp_patient=create sle_mdp_patient
this.st_3=create st_3
this.st_4=create st_4
this.sle_email_parent1=create sle_email_parent1
this.sle_mdp_parent1=create sle_mdp_parent1
this.st_5=create st_5
this.st_6=create st_6
this.sle_email_parent2=create sle_email_parent2
this.sle_mdp_parent2=create sle_mdp_parent2
this.st_7=create st_7
this.st_8=create st_8
this.sle_email_payeur=create sle_email_payeur
this.sle_mdp_payeur=create sle_mdp_payeur
this.st_9=create st_9
this.st_derniere_connexion=create st_derniere_connexion
this.pb_email_patient=create pb_email_patient
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.rte_1=create rte_1
this.gb_patient=create gb_patient
this.gb_parent1=create gb_parent1
this.gb_parent2=create gb_parent2
this.gb_payeur=create gb_payeur
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_enregistrer
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_email_patient
this.Control[iCurrent+8]=this.sle_mdp_patient
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.sle_email_parent1
this.Control[iCurrent+12]=this.sle_mdp_parent1
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.sle_email_parent2
this.Control[iCurrent+16]=this.sle_mdp_parent2
this.Control[iCurrent+17]=this.st_7
this.Control[iCurrent+18]=this.st_8
this.Control[iCurrent+19]=this.sle_email_payeur
this.Control[iCurrent+20]=this.sle_mdp_payeur
this.Control[iCurrent+21]=this.st_9
this.Control[iCurrent+22]=this.st_derniere_connexion
this.Control[iCurrent+23]=this.pb_email_patient
this.Control[iCurrent+24]=this.pb_1
this.Control[iCurrent+25]=this.pb_2
this.Control[iCurrent+26]=this.pb_3
this.Control[iCurrent+27]=this.rte_1
this.Control[iCurrent+28]=this.gb_patient
this.Control[iCurrent+29]=this.gb_parent1
this.Control[iCurrent+30]=this.gb_parent2
this.Control[iCurrent+31]=this.gb_payeur
end on

on w_patient_mdp_web.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_email_patient)
destroy(this.sle_mdp_patient)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_email_parent1)
destroy(this.sle_mdp_parent1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_email_parent2)
destroy(this.sle_mdp_parent2)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.sle_email_payeur)
destroy(this.sle_mdp_payeur)
destroy(this.st_9)
destroy(this.st_derniere_connexion)
destroy(this.pb_email_patient)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.rte_1)
destroy(this.gb_patient)
destroy(this.gb_parent1)
destroy(this.gb_parent2)
destroy(this.gb_payeur)
end on

event open;call super::open;centrer(this)

// passage de l'objet qui contient tous les éléments
uo_mdp = message.PowerObjectParm

uo_1.taille(this)

init()


if enregistrement_automatique then
	pb_annuler.visible = false
	pb_enregistrer.visible = false
end if

// Mise à jour de la dernière connexion
datetime derniere_connexion_web
select max(date_heure) into :derniere_connexion_web from myo_histo_connect 
where code  = :uo_mdp.var_code_local ;

st_derniere_connexion.text  = string(derniere_connexion_web, "dd/mm/yy à hh:mm")

end event

event resize;call super::resize;

uo_1.retaille(this) // uniquement pour le brush de la datawindow

end event

event close;call super::close;

if enregistrement_automatique then
	pb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_mdp_web
integer x = 32
integer y = 1836
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_mdp_web
integer x = 2747
integer y = 1816
integer width = 480
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

//CloseWithReturn(parent,uo_mdp) 

close(parent)

end event

type pb_enregistrer from uo_picturebutton_390x120 within w_patient_mdp_web
integer x = 2254
integer y = 1816
integer width = 480
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;


sauve()


end event

type pb_annuler from uo_picturebutton_390x120 within w_patient_mdp_web
integer x = 1760
integer y = 1816
integer width = 480
integer taborder = 40
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

init()
end event

type uo_1 from resize_fenetre within w_patient_mdp_web
boolean visible = false
integer x = 151
integer y = 1164
integer taborder = 70
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_1 from statictext within w_patient_mdp_web
integer x = 215
integer y = 176
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Email :"
end type

type st_2 from statictext within w_patient_mdp_web
integer x = 210
integer y = 312
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe :"
end type

type sle_email_patient from singlelineedit within w_patient_mdp_web
integer x = 480
integer y = 164
integer width = 2491
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type sle_mdp_patient from singlelineedit within w_patient_mdp_web
integer x = 649
integer y = 300
integer width = 421
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_patient_mdp_web
integer x = 210
integer y = 580
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Email :"
end type

type st_4 from statictext within w_patient_mdp_web
integer x = 210
integer y = 716
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe :"
end type

type sle_email_parent1 from singlelineedit within w_patient_mdp_web
integer x = 485
integer y = 564
integer width = 2491
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type sle_mdp_parent1 from singlelineedit within w_patient_mdp_web
integer x = 640
integer y = 704
integer width = 421
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_patient_mdp_web
integer x = 210
integer y = 980
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Email :"
end type

type st_6 from statictext within w_patient_mdp_web
integer x = 210
integer y = 1116
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe :"
end type

type sle_email_parent2 from singlelineedit within w_patient_mdp_web
integer x = 480
integer y = 968
integer width = 2491
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type sle_mdp_parent2 from singlelineedit within w_patient_mdp_web
integer x = 640
integer y = 1104
integer width = 421
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_patient_mdp_web
integer x = 206
integer y = 1364
integer width = 229
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Email :"
end type

type st_8 from statictext within w_patient_mdp_web
integer x = 206
integer y = 1500
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mot de Passe :"
end type

type sle_email_payeur from singlelineedit within w_patient_mdp_web
integer x = 475
integer y = 1352
integer width = 2491
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type sle_mdp_payeur from singlelineedit within w_patient_mdp_web
integer x = 635
integer y = 1488
integer width = 421
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 6
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within w_patient_mdp_web
integer x = 165
integer y = 1700
integer width = 599
integer height = 92
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Dernière Connexion :"
end type

type st_derniere_connexion from statictext within w_patient_mdp_web
integer x = 745
integer y = 1700
integer width = 1051
integer height = 96
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
end type

type pb_email_patient from picturebutton within w_patient_mdp_web
integer x = 3017
integer y = 152
integer width = 169
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "lc_mail.gif"
alignment htextalign = left!
string powertiptext = "Envoi d~'un email au patient avec son login / mot de passe"
end type

event clicked;

fxg_envoi_email_mdp_portail (uo_mdp.var_code_local , sle_email_patient, sle_mdp_patient, pb_enregistrer, rte_1)



//uo_email_compte		cpt_email
//uo_email_email 		email
//long id_cpt
//
//string v_texte_message
//string v_site_portail
//
//// recup du nom du site portail
//select isnull(url_portail_patient,'') into :v_site_portail from param ;
//if len(trim(v_site_portail)) = 0 then
//	Messagebox("ERREUR","Vous devez aller indiquer l'adresse (URL) de votre site Internet Portail Patient")
//else
//
//	
//	
//	// recherche de l'ID du cpt mail par def du prati du patient
//	SELECT cpt_mail INTO :id_cpt FROM prati, patient
//	WHERE patient.code_praticien = prati.code AND patient.code = :uo_mdp.var_code_local ;
//	if isnull(id_cpt) then
//		// pas de compte mail par defaut sur ce prati
//		// --> on choisi le premier de la liste des cpt order by ordre_tri, nom
//		select id into :id_cpt from email_comptes order by ordre_tri, nom ;
//	end if
//	
//	
//	// init cpt mail et affection au mail manager
//	cpt_email = create uo_email_compte
//	cpt_email.charger(id_cpt)
//	email_manager.set_compte(cpt_email)
//	
//	string v_email , v_mot_de_passe
//	
//	v_email = sle_email_patient.text 
//	v_mot_de_passe = sle_mdp_patient.text
//	
//	if len(trim(v_mot_de_passe)) = 0 then 
//		v_mot_de_passe = left(string(uo_mdp.var_code_local),6)
//		sle_mdp_patient.text = string(v_mot_de_passe)
//		pb_enregistrer.triggerevent(clicked!)
//	end if
//	
//	// creation et envoie email
//	email = create uo_email_email
//	email.add_destinataire_a(sle_email_patient.text, false)
//	email.set_from(cpt_email.my_alias,cpt_email.my_adr)
//	email_manager.propos_objet = "objet du mail"
//	email.set_sujet(email_manager.propos_objet)
//		
//	v_texte_message = "Bonjour,~n~nVos identifiants de connection pour accéder à votre espace patient sur le site "+v_site_portail+ " sont :~n~nEmail : " + v_email+"~nMot de passe : "+v_mot_de_passe+"~n~nSi vous n'arrivez pas à accéder à votre espace patient, veuillez nous envoyer un mail sur planete@arakis.fr.~n~nCordialement, ~n~nL'équipe de "+v_site_portail
//	
//	cpt_email.texte_brut_defaut = v_texte_message
//	email.set_body(cpt_email.texte_brut_defaut)
//	
//	// Envoi de l'email
//	if email_manager.envoyer_email(email.get_email()) then
//		Messagebox("INFORMATION","Un email vient d'être envoyé à cette adresse.")
//	else
//		Messagebox("ERREUR","Echec dans l'envoi de l'email")
//	end if
//end if
//
end event

type pb_1 from picturebutton within w_patient_mdp_web
integer x = 3017
integer y = 548
integer width = 169
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "lc_mail.gif"
alignment htextalign = left!
string powertiptext = "Envoi d~'un email au parent 1 avec son login / mot de passe"
end type

event clicked;fxg_envoi_email_mdp_portail (uo_mdp.var_code_local , sle_email_parent1, sle_mdp_parent1, pb_enregistrer, rte_1)

end event

type pb_2 from picturebutton within w_patient_mdp_web
integer x = 3017
integer y = 956
integer width = 169
integer height = 120
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "lc_mail.gif"
alignment htextalign = left!
string powertiptext = "Envoi d~'un email au parent 2 avec son login / mot de passe"
end type

event clicked;fxg_envoi_email_mdp_portail (uo_mdp.var_code_local , sle_email_parent2, sle_mdp_parent2, pb_enregistrer, rte_1)

end event

type pb_3 from picturebutton within w_patient_mdp_web
integer x = 3017
integer y = 1344
integer width = 169
integer height = 120
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string picturename = "lc_mail.gif"
alignment htextalign = left!
string powertiptext = "Envoi d~'un email au payeur avec son login / mot de passe"
end type

event clicked;fxg_envoi_email_mdp_portail (uo_mdp.var_code_local , sle_email_payeur, sle_mdp_payeur, pb_enregistrer, rte_1)

end event

type rte_1 from richtextedit within w_patient_mdp_web
boolean visible = false
integer x = 439
integer y = 1544
integer width = 974
integer height = 492
integer taborder = 30
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

type gb_patient from groupbox within w_patient_mdp_web
integer x = 146
integer y = 76
integer width = 3113
integer height = 360
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Patient"
borderstyle borderstyle = styleraised!
end type

type gb_parent1 from groupbox within w_patient_mdp_web
integer x = 146
integer y = 476
integer width = 3113
integer height = 360
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Parent1"
borderstyle borderstyle = styleraised!
end type

type gb_parent2 from groupbox within w_patient_mdp_web
integer x = 146
integer y = 872
integer width = 3113
integer height = 360
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Parent2"
borderstyle borderstyle = styleraised!
end type

type gb_payeur from groupbox within w_patient_mdp_web
integer x = 142
integer y = 1268
integer width = 3113
integer height = 360
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Payeur"
borderstyle borderstyle = styleraised!
end type

