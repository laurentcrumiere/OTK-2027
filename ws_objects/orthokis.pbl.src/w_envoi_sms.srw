$PBExportHeader$w_envoi_sms.srw
forward
global type w_envoi_sms from w_fenetre_arakis
end type
type st_1 from statictext within w_envoi_sms
end type
type pb_envoyer from uo_picturebutton_390x120 within w_envoi_sms
end type
type pb_annuler from uo_picturebutton_390x120 within w_envoi_sms
end type
type sle_numero_telephone from singlelineedit within w_envoi_sms
end type
type st_2 from statictext within w_envoi_sms
end type
type mle_message from multilineedit within w_envoi_sms
end type
type uo_poc from uo_pocket within w_envoi_sms
end type
type st_nb_car from statictext within w_envoi_sms
end type
type st_attention from statictext within w_envoi_sms
end type
type dw_code_sms from datawindow within w_envoi_sms
end type
type st_3 from statictext within w_envoi_sms
end type
type lb_numeros_telephone from listbox within w_envoi_sms
end type
type st_numeros_multiples from statictext within w_envoi_sms
end type
type cbx_choix_multiples from checkbox within w_envoi_sms
end type
end forward

global type w_envoi_sms from w_fenetre_arakis
integer width = 3287
integer height = 1860
string title = "Envoi d~'un SMS"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_1 st_1
pb_envoyer pb_envoyer
pb_annuler pb_annuler
sle_numero_telephone sle_numero_telephone
st_2 st_2
mle_message mle_message
uo_poc uo_poc
st_nb_car st_nb_car
st_attention st_attention
dw_code_sms dw_code_sms
st_3 st_3
lb_numeros_telephone lb_numeros_telephone
st_numeros_multiples st_numeros_multiples
cbx_choix_multiples cbx_choix_multiples
end type
global w_envoi_sms w_envoi_sms

type variables


double var_code_local
long v_nb_car = 0
integer nb_numero
end variables

forward prototypes
public subroutine maj_affichage ()
end prototypes

public subroutine maj_affichage ();if v_nb_car > 1 then 
	st_nb_car.text = string(v_nb_car)+" cars"
else
	st_nb_car.text = string(v_nb_car)+" car"
end if


if v_nb_car > 160 then 
	st_nb_car.TextColor = couleur_rouge
	st_attention.TextColor = couleur_rouge
	st_nb_car.BackColor = couleur_jaune
	st_attention.BackColor = couleur_jaune
else
	st_nb_car.TextColor = couleur_noire
	st_attention.TextColor = couleur_noire
	st_nb_car.BackColor = couleur_transparente
	st_attention.BackColor = couleur_transparente
end if
end subroutine

on w_envoi_sms.create
int iCurrent
call super::create
this.st_1=create st_1
this.pb_envoyer=create pb_envoyer
this.pb_annuler=create pb_annuler
this.sle_numero_telephone=create sle_numero_telephone
this.st_2=create st_2
this.mle_message=create mle_message
this.uo_poc=create uo_poc
this.st_nb_car=create st_nb_car
this.st_attention=create st_attention
this.dw_code_sms=create dw_code_sms
this.st_3=create st_3
this.lb_numeros_telephone=create lb_numeros_telephone
this.st_numeros_multiples=create st_numeros_multiples
this.cbx_choix_multiples=create cbx_choix_multiples
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.pb_envoyer
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.sle_numero_telephone
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.mle_message
this.Control[iCurrent+7]=this.uo_poc
this.Control[iCurrent+8]=this.st_nb_car
this.Control[iCurrent+9]=this.st_attention
this.Control[iCurrent+10]=this.dw_code_sms
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.lb_numeros_telephone
this.Control[iCurrent+13]=this.st_numeros_multiples
this.Control[iCurrent+14]=this.cbx_choix_multiples
end on

on w_envoi_sms.destroy
call super::destroy
destroy(this.st_1)
destroy(this.pb_envoyer)
destroy(this.pb_annuler)
destroy(this.sle_numero_telephone)
destroy(this.st_2)
destroy(this.mle_message)
destroy(this.uo_poc)
destroy(this.st_nb_car)
destroy(this.st_attention)
destroy(this.dw_code_sms)
destroy(this.st_3)
destroy(this.lb_numeros_telephone)
destroy(this.st_numeros_multiples)
destroy(this.cbx_choix_multiples)
end on

event open;call super::open;

// Récup du N° de phone passé en paramètre et du code client
// chaine passée sous la format      nnnnnnn/ccccccccccc

string v_param , v_numero, v_numero_unite 
integer v_pos, v_pos_debut

v_param = trim(message.StringParm)

v_pos = pos(v_param, "/") 

v_numero = left(v_param, v_pos - 1)
var_code_local = double(right(v_param, len(v_param) - v_pos))


if profilestring(dir_ini+inifile_orthokis,"SMS","choix_multiple", "false") = "true" then
	cbx_choix_multiples.checked = true
else
	cbx_choix_multiples.checked = false
end if



// Depuis 2025 evo , il peut y avoir plusieurs N° de téléphone séparéa par des "%"

if pos(v_numero, "%") > 0 then
	// plusieurs numéros
	sle_numero_telephone.visible = false
	// Alimentattion de la liste
	v_pos = pos(v_param, "%") 
	nb_numero = 0
	v_pos_debut = 1 
	do while v_pos > 0 
		v_numero_unite = mid(v_numero, v_pos_debut, v_pos - v_pos_debut)
		lb_numeros_telephone.additem(v_numero_unite)
		nb_numero = 	nb_numero + 1
		v_pos_debut = v_pos + 1
		v_pos = pos(v_param, "%", v_pos + 1) 
	loop
	
	// cas du dernier
	v_numero_unite = mid(v_numero, v_pos_debut, len(v_numero) - v_pos_debut +  1 )
	lb_numeros_telephone.additem(v_numero_unite)
	nb_numero = 	nb_numero + 1
	st_numeros_multiples.text = "(" + string(nb_numero) +  " numéros)"
	lb_numeros_telephone.visible = true
else
	nb_numero = 1
	sle_numero_telephone.text = v_numero
	
end if

backcolor = couleur_fond_fenetre
//
//
//// Analyse du pays pour voir si ....
//
//// Recherche du pays du parent1
//string v_pays
//select isnull(pays_parent1,'') into :v_pays from patient where code = :var_code_local ;
//
//if v_pays = '' then
//	if Belgique then
//		v_pays = 'B'
//	else
//		if Suisse then 
//			v_pays = 'S'
//		else
//			if luxembourg then
//				v_pays = 'L'
//			else
//				v_pays = 'F'
//			end if
//		end if
//	end if
//end if
//
//select isnull(indicatif_international, 33) into :v_indicatif from pays where code = :v_pays ;
//
//
//// Mise au format internationnal ... 
//// on vire les premiers 0
//
//
//integer  len
//
//// recherche du 1er chiffre non 0
//len = len(v_numero)
//v_pos = 1
//
//do while mid(v_numero, v_pos, 1) = '0'  and v_pos < len
//	v_pos = v_pos + 1
//loop
//
//sle_numero_telephone.text = "+"+string(v_indicatif) + right(v_numero, len - v_pos + 1)

uo_poc.var_code_local = var_code_local			// pour la mémo de l'envoi du message



if OPERATEUR_SMS = 2 then 
	// Dental SMS
	// listes des codes SMS
	uo_poc.get_liste_codes(dw_code_sms)
end if


mle_message.setfocus()




end event

event close;call super::close;if cbx_choix_multiples.checked  then
	Setprofilestring(dir_ini+inifile_orthokis,"SMS","choix_multiple", "true")
else
	Setprofilestring(dir_ini+inifile_orthokis,"SMS","choix_multiple", "false")
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_envoi_sms
integer y = 796
end type

type st_1 from statictext within w_envoi_sms
integer x = 59
integer y = 80
integer width = 558
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de Téléphone :"
end type

type pb_envoyer from uo_picturebutton_390x120 within w_envoi_sms
integer x = 2432
integer y = 36
integer width = 526
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Envoyer"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;
if sle_numero_telephone.visible  then 
	// Envoi unique
	if uo_poc.send_message(trim(sle_numero_telephone.text), mle_message.text) = 1 then
		close(parent)
	end if
else
	// envoi multiples 
	integer i
	for i = 1 to nb_numero
		uo_poc.send_message(trim(lb_numeros_telephone.text(i)), mle_message.text)
	next
	close(parent)
	
end if


end event

type pb_annuler from uo_picturebutton_390x120 within w_envoi_sms
integer x = 1147
integer y = 1536
integer width = 571
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type sle_numero_telephone from singlelineedit within w_envoi_sms
integer x = 617
integer y = 60
integer width = 1367
integer height = 108
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_envoi_sms
integer x = 55
integer y = 500
integer width = 347
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Message :"
end type

type mle_message from multilineedit within w_envoi_sms
event frappe pbm_keydown
integer x = 448
integer y = 488
integer width = 2080
integer height = 992
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event frappe;
v_nb_car = len(this.text)

if key = KeyBack!  or key = KeyDelete! then
	v_nb_car = v_nb_car - 1
else
	v_nb_car = v_nb_car + 1
end if

maj_affichage()


end event

event modified;v_nb_car = len(this.text)


maj_affichage()
end event

event rbuttondown;
if OPERATEUR_SMS = 2 then 
	// Dental SMS
	// listes des codes SMS


	dw_code_sms.visible = true

end if
return 1


end event

type uo_poc from uo_pocket within w_envoi_sms
boolean visible = false
integer x = 123
integer y = 1008
integer taborder = 30
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

type st_nb_car from statictext within w_envoi_sms
integer x = 2638
integer y = 616
integer width = 361
integer height = 96
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
alignment alignment = center!
end type

event clicked;call super::clicked;st_nb_car.text = string(len(mle_message.text))+" cars"
end event

type st_attention from statictext within w_envoi_sms
integer x = 2560
integer y = 776
integer width = 549
integer height = 236
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Attention, au delà de 160 caractères des frais supplémentaires peuvent être facturés."
alignment alignment = center!
end type

type dw_code_sms from datawindow within w_envoi_sms
string tag = "no resize all brush"
boolean visible = false
integer x = 567
integer y = 408
integer width = 2482
integer height = 1144
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des Messages Dental SMS"
string dataobject = "dw_code_sms_ddlb"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event doubleclicked;string v_texte 

v_texte = dw_code_sms.getitemString(dw_code_sms.getrow(), "texte")

//Messagebox("trace" , v_texte)

// Mise à jour des champs si besoin
string v_nom_patient, v_prenom_patient, v_nom_praticien, v_titre_patient, v_nom_parent1, v_titre_patient_code
date v_naissance 

// Récupération des valeurs 
select top 1 patient.nom, patient.prenom , prati.nom, patient.date_naissance, nom_parent1, patient.titre_patient
into :v_nom_patient, :v_prenom_patient , :v_nom_praticien, :v_naissance, :v_nom_parent1, :v_titre_patient_code
from patient, prati  
where patient.code_praticien = prati.code and patient.code = :var_code_local  ;


select top 1 nom into :v_titre_patient from   titre_personnes where  titre_personnes.code =  :v_titre_patient_code ;

v_texte = gfx_tout_remplacer(v_texte, "{NOM_DOCTEUR}", v_nom_praticien )
v_texte = gfx_tout_remplacer(v_texte, "{NOM_PATIENT}", v_nom_patient )
v_texte = gfx_tout_remplacer(v_texte, "{PRENOM_PATIENT}", v_prenom_patient )
v_texte = gfx_tout_remplacer(v_texte, "{DATE_NAISSANCE}", string(v_naissance) )
v_texte = gfx_tout_remplacer(v_texte, "{CIVILITE_PATIENT}", v_titre_patient )
v_texte = gfx_tout_remplacer(v_texte, "{NOM_PARENT}", v_nom_parent1 )
	

// pour le champ rdv , on remplace (arbitrairement) par le prochain rdv du patient
datetime v_prochain_rendez_vous
v_prochain_rendez_vous = proc_rdv(var_code_local)

v_texte = gfx_tout_remplacer(v_texte, "{DATE_ET_HEURE_RDV}", fxg_format_rdv_email(v_prochain_rendez_vous))




mle_message.text = v_texte

dw_code_sms.visible = false

v_nb_car = len(mle_message.text)


maj_affichage()

end event

event rbuttondown;if dw_code_sms.visible then
	dw_code_sms.visible = false
else
	dw_code_sms.visible = true
end if

end event

type st_3 from statictext within w_envoi_sms
integer x = 32
integer y = 620
integer width = 361
integer height = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 134217856
long backcolor = 553648127
string text = "Clic droit pour afficher la liste"
alignment alignment = center!
boolean focusrectangle = false
end type

type lb_numeros_telephone from listbox within w_envoi_sms
boolean visible = false
integer x = 622
integer y = 64
integer width = 1367
integer height = 340
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type st_numeros_multiples from statictext within w_envoi_sms
integer x = 59
integer y = 184
integer width = 512
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
alignment alignment = center!
end type

type cbx_choix_multiples from checkbox within w_envoi_sms
integer x = 2327
integer y = 1568
integer width = 905
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Permettre les choix multiples"
end type

