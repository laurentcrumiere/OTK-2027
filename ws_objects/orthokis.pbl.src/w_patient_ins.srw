$PBExportHeader$w_patient_ins.srw
forward
global type w_patient_ins from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_patient_ins
end type
type p_ins from picture within w_patient_ins
end type
type st_1 from statictext within w_patient_ins
end type
type sle_ins_numero from singlelineedit within w_patient_ins
end type
type st_2 from statictext within w_patient_ins
end type
type sle_ins_nom from singlelineedit within w_patient_ins
end type
type st_3 from statictext within w_patient_ins
end type
type sle_ins_prenom from singlelineedit within w_patient_ins
end type
type st_4 from statictext within w_patient_ins
end type
type sle_ins_date_naissance from singlelineedit within w_patient_ins
end type
type st_5 from statictext within w_patient_ins
end type
type sle_ins_lieu_naissance from singlelineedit within w_patient_ins
end type
type st_periode from statictext within w_patient_ins
end type
type sle_ins_validite from singlelineedit within w_patient_ins
end type
type st_7 from statictext within w_patient_ins
end type
type sle_ins_sexe from singlelineedit within w_patient_ins
end type
type cb_maj from uo_picturebutton_390x120 within w_patient_ins
end type
type st_6 from statictext within w_patient_ins
end type
type sle_ins_statut from singlelineedit within w_patient_ins
end type
end forward

global type w_patient_ins from w_fenetre_arakis
integer width = 3141
integer height = 1720
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
p_ins p_ins
st_1 st_1
sle_ins_numero sle_ins_numero
st_2 st_2
sle_ins_nom sle_ins_nom
st_3 st_3
sle_ins_prenom sle_ins_prenom
st_4 st_4
sle_ins_date_naissance sle_ins_date_naissance
st_5 st_5
sle_ins_lieu_naissance sle_ins_lieu_naissance
st_periode st_periode
sle_ins_validite sle_ins_validite
st_7 st_7
sle_ins_sexe sle_ins_sexe
cb_maj cb_maj
st_6 st_6
sle_ins_statut sle_ins_statut
end type
global w_patient_ins w_patient_ins

type variables
string v_nom, v_prenom
double var_code_local, v_numero_dossier

string v_ins_present, v_ins_nom , v_ins_prenom, v_ins_sexe, v_ins_lieu_naissance , v_ins_numero , v_ins_cle , v_ins_statut
date v_ins_date_naissance , v_ins_debut_validite , v_ins_fin_validite 


end variables

forward prototypes
public subroutine affichage_infos_ins ()
public subroutine recherche_infos_ins ()
end prototypes

public subroutine affichage_infos_ins ();if v_ins_present = "O" and string(v_ins_date_naissance) <> "01/01/1900" then
	sle_ins_nom.text = v_ins_nom
	sle_ins_prenom.text = v_ins_prenom
	sle_ins_lieu_naissance.text = v_ins_lieu_naissance
	sle_ins_sexe.text = v_ins_sexe
	sle_ins_numero.text = trim(v_ins_numero) + " / " + v_ins_cle
	sle_ins_date_naissance.text = string(v_ins_date_naissance)  
	
	if string(v_ins_debut_validite) <> "01/01/1900" then 
		sle_ins_validite.text = "Du " + string(v_ins_debut_validite)  + " au " + string(v_ins_fin_validite) 
		sle_ins_validite.visible = true
		st_periode.visible = true
	else
		sle_ins_validite.visible = false
		st_periode.visible = false
	end if
	
	choose case v_ins_statut
		case "P"
			sle_ins_statut.text = "Provisoire"
		case "R"
			sle_ins_statut.text = "Récupéré"
		case "V"
			sle_ins_statut.text = "Validé"
		case "Q"
			sle_ins_statut.text = "Qualifié"
		case else
			sle_ins_statut.text = "??"
	end choose
end if
end subroutine

public subroutine recherche_infos_ins ();// recherche des infos du patient 
select nom, isnull(prenom, ''), numero_dossier , isnull(ins_present, 'N'), ins_nom , ins_prenom, ins_sexe, ins_lieu_naissance , ins_numero , ins_cle , 
ins_date_naissance , ins_debut_validite , ins_fin_validite , ins_statut
into  :v_nom, :v_prenom, :v_numero_dossier, :v_ins_present, :v_ins_nom , :v_ins_prenom, :v_ins_sexe, :v_ins_lieu_naissance , :v_ins_numero , :v_ins_cle , 
:v_ins_date_naissance , :v_ins_debut_validite , :v_ins_fin_validite , :v_ins_statut 
from patient
where code = :var_code_local ;

end subroutine

on w_patient_ins.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.p_ins=create p_ins
this.st_1=create st_1
this.sle_ins_numero=create sle_ins_numero
this.st_2=create st_2
this.sle_ins_nom=create sle_ins_nom
this.st_3=create st_3
this.sle_ins_prenom=create sle_ins_prenom
this.st_4=create st_4
this.sle_ins_date_naissance=create sle_ins_date_naissance
this.st_5=create st_5
this.sle_ins_lieu_naissance=create sle_ins_lieu_naissance
this.st_periode=create st_periode
this.sle_ins_validite=create sle_ins_validite
this.st_7=create st_7
this.sle_ins_sexe=create sle_ins_sexe
this.cb_maj=create cb_maj
this.st_6=create st_6
this.sle_ins_statut=create sle_ins_statut
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.p_ins
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_ins_numero
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.sle_ins_nom
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.sle_ins_prenom
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_ins_date_naissance
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.sle_ins_lieu_naissance
this.Control[iCurrent+13]=this.st_periode
this.Control[iCurrent+14]=this.sle_ins_validite
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.sle_ins_sexe
this.Control[iCurrent+17]=this.cb_maj
this.Control[iCurrent+18]=this.st_6
this.Control[iCurrent+19]=this.sle_ins_statut
end on

on w_patient_ins.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.p_ins)
destroy(this.st_1)
destroy(this.sle_ins_numero)
destroy(this.st_2)
destroy(this.sle_ins_nom)
destroy(this.st_3)
destroy(this.sle_ins_prenom)
destroy(this.st_4)
destroy(this.sle_ins_date_naissance)
destroy(this.st_5)
destroy(this.sle_ins_lieu_naissance)
destroy(this.st_periode)
destroy(this.sle_ins_validite)
destroy(this.st_7)
destroy(this.sle_ins_sexe)
destroy(this.cb_maj)
destroy(this.st_6)
destroy(this.sle_ins_statut)
end on

event open;


// Code du patient passé en paramètres
var_code_local = message.doubleParm



// recherche des infos du patient 
select nom, isnull(prenom, ''), numero_dossier , isnull(ins_present, 'N'), ins_nom , ins_prenom, ins_sexe, ins_lieu_naissance , ins_numero , ins_cle , 
ins_date_naissance , ins_debut_validite , ins_fin_validite 
into  :v_nom, :v_prenom, :v_numero_dossier, :v_ins_present, :v_ins_nom , :v_ins_prenom, :v_ins_sexe, :v_ins_lieu_naissance , :v_ins_numero , :v_ins_cle , 
:v_ins_date_naissance , :v_ins_debut_validite , :v_ins_fin_validite 
from patient
where code = :var_code_local ;

this.title = "INS du patient : " + v_nom + " "+ v_prenom + " ("+ string(v_numero_dossier)  + ")"



if v_ins_present = "O" then 
	// Affichage des infos de l'INS
	
	affichage_infos_ins()

	if fxg_get_version_ccvitale() >= "4.10" then
		cb_maj.visible = true
	end if
		


else
	// Pas d'ins .. vérification de CC Vitale pour savoir si on peut mettre à jour ou pas
	
	if fxg_get_version_ccvitale() >= "4.10" then
		// on peut
		//if MessageBox("ATTENTION", "Ce patient n'a pas encore d'informations INS ; voulez-vous le mettre à jour ?" , Question!, YesNo!, 2) = 1 then 
		if fxg_power_message_question("ATTENTION", "Ce patient n'a pas encore d'informations INS ; voulez-vous le mettre à jour ?" , "Oui", "Non", 2) = 1 then 
			cb_maj.triggerevent(clicked!)
			cb_maj.visible = true
			
			// On raffraichit l'affichage
			affichage_infos_ins()

		else
			close(this)
		end if

	else
		// On peut pas
		fxg_power_message_ok	("ATTENTION", "Ce patient n'a pas encore d'informations INS ; vous devez aller sur un poste équipé de CC-VITALE pour le mettre à jour !")	
		//MessageBox("ATTENTION", "Ce patient n'a pas encore d'informations INS ; vous devez aller sur un poste équipé de CC-VITALE pour le mettre à jour !")
		close(this)
	end if
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_ins
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_patient_ins
integer x = 1541
integer y = 1436
integer width = 599
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

type p_ins from picture within w_patient_ins
integer x = 1033
integer y = 28
integer width = 686
integer height = 380
boolean bringtotop = true
boolean originalsize = true
string picturename = "lc_ins.png"
boolean focusrectangle = false
end type

type st_1 from statictext within w_patient_ins
integer x = 69
integer y = 464
integer width = 498
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Matricule INS : "
boolean focusrectangle = false
end type

type sle_ins_numero from singlelineedit within w_patient_ins
integer x = 558
integer y = 464
integer width = 1906
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_2 from statictext within w_patient_ins
integer x = 69
integer y = 584
integer width = 677
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Nom de Naissance : "
boolean focusrectangle = false
end type

type sle_ins_nom from singlelineedit within w_patient_ins
integer x = 745
integer y = 584
integer width = 1906
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_3 from statictext within w_patient_ins
integer x = 69
integer y = 704
integer width = 859
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Prénom(s) de Naissance : "
boolean focusrectangle = false
end type

type sle_ins_prenom from singlelineedit within w_patient_ins
integer x = 919
integer y = 704
integer width = 1906
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_4 from statictext within w_patient_ins
integer x = 69
integer y = 824
integer width = 709
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Date de Naissance :"
boolean focusrectangle = false
end type

type sle_ins_date_naissance from singlelineedit within w_patient_ins
integer x = 750
integer y = 824
integer width = 567
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_5 from statictext within w_patient_ins
integer x = 69
integer y = 1064
integer width = 800
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Code lieu de naissance :"
boolean focusrectangle = false
end type

type sle_ins_lieu_naissance from singlelineedit within w_patient_ins
integer x = 873
integer y = 1064
integer width = 462
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_periode from statictext within w_patient_ins
integer x = 69
integer y = 1184
integer width = 731
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Période de valiadité : "
boolean focusrectangle = false
end type

type sle_ins_validite from singlelineedit within w_patient_ins
integer x = 832
integer y = 1184
integer width = 1518
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_7 from statictext within w_patient_ins
integer x = 69
integer y = 944
integer width = 251
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Sexe : "
boolean focusrectangle = false
end type

type sle_ins_sexe from singlelineedit within w_patient_ins
integer x = 311
integer y = 944
integer width = 137
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type cb_maj from uo_picturebutton_390x120 within w_patient_ins
integer x = 786
integer y = 1436
integer width = 599
integer taborder = 20
boolean bringtotop = true
string text = "&Mettre à Jour"
string iconname = "Update5_2!"
end type

event clicked;call super::clicked;// Mise à jour de l'INS
param_win[1] = "9"
param_win[2] = string(var_code_local)
open(w_cc_vitale_patience)
centrer(w_cc_vitale_patience)
open(w_cc_vitale)
close(w_cc_vitale_patience)


// raffraichissement des infos
recherche_infos_ins()
affichage_infos_ins()

end event

type st_6 from statictext within w_patient_ins
integer x = 69
integer y = 1296
integer width = 306
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Statut :"
boolean focusrectangle = false
end type

type sle_ins_statut from singlelineedit within w_patient_ins
integer x = 402
integer y = 1296
integer width = 1518
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

