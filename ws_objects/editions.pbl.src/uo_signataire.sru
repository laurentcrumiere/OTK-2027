$PBExportHeader$uo_signataire.sru
$PBExportComments$Gallery of graph types
forward
global type uo_signataire from userobject
end type
type sle_pays_notification12 from singlelineedit within uo_signataire
end type
type sle_pays_notification11 from singlelineedit within uo_signataire
end type
type sle_pays_portable1 from singlelineedit within uo_signataire
end type
type dw_textes_email1 from datawindow within uo_signataire
end type
type cbx_email1 from checkbox within uo_signataire
end type
type st_nom_notification12 from statictext within uo_signataire
end type
type sle_nom_notification12 from singlelineedit within uo_signataire
end type
type sle_notification12 from singlelineedit within uo_signataire
end type
type cbx_notif12 from checkbox within uo_signataire
end type
type st_nom_notification11 from statictext within uo_signataire
end type
type sle_nom_notification11 from singlelineedit within uo_signataire
end type
type sle_notification11 from singlelineedit within uo_signataire
end type
type cbx_notif11 from checkbox within uo_signataire
end type
type sle_portable1 from singlelineedit within uo_signataire
end type
type st_portable1 from statictext within uo_signataire
end type
type rb_payeur from radiobutton within uo_signataire
end type
type rb_parent2 from radiobutton within uo_signataire
end type
type rb_patient from radiobutton within uo_signataire
end type
type rb_parent1 from radiobutton within uo_signataire
end type
type sle_email1 from singlelineedit within uo_signataire
end type
type st_email1 from statictext within uo_signataire
end type
type st_nom1 from statictext within uo_signataire
end type
type sle_nom1 from singlelineedit within uo_signataire
end type
type gb_signataire from groupbox within uo_signataire
end type
end forward

global type uo_signataire from userobject
integer width = 2761
integer height = 1048
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_pays_notification12 sle_pays_notification12
sle_pays_notification11 sle_pays_notification11
sle_pays_portable1 sle_pays_portable1
dw_textes_email1 dw_textes_email1
cbx_email1 cbx_email1
st_nom_notification12 st_nom_notification12
sle_nom_notification12 sle_nom_notification12
sle_notification12 sle_notification12
cbx_notif12 cbx_notif12
st_nom_notification11 st_nom_notification11
sle_nom_notification11 sle_nom_notification11
sle_notification11 sle_notification11
cbx_notif11 cbx_notif11
sle_portable1 sle_portable1
st_portable1 st_portable1
rb_payeur rb_payeur
rb_parent2 rb_parent2
rb_patient rb_patient
rb_parent1 rb_parent1
sle_email1 sle_email1
st_email1 st_email1
st_nom1 st_nom1
sle_nom1 sle_nom1
gb_signataire gb_signataire
end type
global uo_signataire uo_signataire

type variables

string v_nom_patient, v_email_patient, v_portable_patient
string v_nom_parent1, v_email_parent1, v_portable1_parent1,  v_portable2_parent1 , v_pays_parent1
string v_nom_parent2, v_email_parent2, v_portable1_parent2,  v_portable2_parent2 , v_pays_parent2
string v_nom_payeur, v_email_payeur, v_portable1_payeur,  v_portable2_payeur , v_pays_payeur

string v_nom_patient_mon_orthodontiste, v_nom_parent1_mon_orthodontiste, v_nom_parent2_mon_orthodontiste, v_nom_payeur_mon_orthodontiste

double var_code_local

integer var_numero_signataire
end variables

forward prototypes
public subroutine init (double v_code, integer v_numero)
public subroutine ecrire_fichier_ini (string var_nom_fichier_ini)
end prototypes

public subroutine init (double v_code, integer v_numero);var_code_local = v_code

var_numero_signataire = v_numero

gb_signataire.text = "Signataire " + string(var_numero_signataire)


dw_textes_email1.settransobject(sqlca)
dw_textes_email1.retrieve()

// Recherche les éléments de la fiche patient
select trim(isnull(nom, '') +' ' + isnull(prenom, '')), trim(isnull(email_patient, '')),  trim(isnull(portable_patient, '')) ,
  trim(isnull(nom_parent1, '') ),  trim(isnull(email, '')),  trim(isnull(portable, '')) ,  trim(isnull(portable2_parent1, '')) ,
  trim(isnull(nom_parent2, '')) ,  trim(isnull(email_parent2, '')),  trim(isnull(portable1_parent2, '')) ,  trim(isnull(portable2_parent2, '')) ,
  trim(isnull(nom_payeur, '')) ,  trim(isnull(email_payeur, '')),  trim(isnull(portable1_payeur, '')) ,  trim(isnull(portable2_payeur, '')) , 
  trim(isnull(pays_parent1, '')), trim(isnull(pays_parent2, '')), trim(isnull(pays_payeur, ''))

into :v_nom_patient, :v_email_patient, :v_portable_patient ,
:v_nom_parent1, :v_email_parent1, :v_portable1_parent1,  :v_portable2_parent1 ,
:v_nom_parent2, :v_email_parent2, :v_portable1_parent2,  :v_portable2_parent2 ,
:v_nom_payeur, :v_email_payeur, :v_portable1_payeur,  :v_portable2_payeur ,
:v_pays_parent1, :v_pays_parent2, :v_pays_payeur

from patient 
where code = :var_code_local ;


// Recherche des connexions à mon Orthodontistes

// Patient
select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
into :v_nom_patient_mon_orthodontiste 
from patient_mon_orthodontiste
where code = :var_code_local and telephone = right(:v_portable_patient, len(trim(telephone)))  ;

// Parent1
select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
into :v_nom_parent1_mon_orthodontiste
from patient_mon_orthodontiste
where code = :var_code_local and (telephone = right(:v_portable1_parent1, len(trim(telephone)))  or telephone = right(:v_portable2_parent1, len(trim(telephone))) ) ;
//where code = :var_code_local and (telephone = :v_portable1_parent1 or telephone = :v_portable2_parent1) ;

// Parent2
select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
into :v_nom_parent2_mon_orthodontiste
from patient_mon_orthodontiste
where code = :var_code_local and (telephone = right(:v_portable1_parent2, len(trim(telephone)))  or telephone = right(:v_portable2_parent2, len(trim(telephone))) ) ;
//where code = :var_code_local and (telephone = :v_portable1_parent2 or telephone = :v_portable2_parent2) ;

// payeur
select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
into :v_nom_payeur_mon_orthodontiste
from patient_mon_orthodontiste
where code = :var_code_local and (telephone = right(:v_portable1_payeur, len(trim(telephone)))  or telephone = right(:v_portable2_payeur, len(trim(telephone))) ) ;
//where code = :var_code_local and (telephone = :v_portable1_payeur or telephone = :v_portable2_payeur) ;

// pour les noms ... s'ils sont vides dans la table c'est des anomalies => on prend ceux de la fiches .. .

if v_nom_patient_mon_orthodontiste = "" then
	// On prend le nom de la fiche
	v_nom_patient_mon_orthodontiste = v_nom_patient
end if
if v_nom_parent1_mon_orthodontiste = "" then
	// On prend le nom de la fiche
	v_nom_parent1_mon_orthodontiste = v_nom_parent1
end if
if v_nom_parent2_mon_orthodontiste = "" then
	// On prend le nom de la fiche
	v_nom_parent2_mon_orthodontiste = v_nom_parent2
end if

if v_nom_payeur_mon_orthodontiste = "" then
	// On prend le nom de la fiche
	v_nom_payeur_mon_orthodontiste = v_nom_payeur
end if



// On vérifie ce qui est possible ou pas
if v_email_parent1 <> "" or v_nom_parent1_mon_orthodontiste <> ""   then
	rb_parent1.enabled = true
else
	rb_parent1.enabled = false
end if

// puis patient
if v_email_patient <> "" or v_nom_patient_mon_orthodontiste <> "" then
	rb_patient.enabled = true
else
	rb_patient.enabled = false
end if

// Puis parent2
if v_email_parent2 <> "" or v_nom_parent2_mon_orthodontiste <> ""  then
	rb_parent2.enabled = true
else
	rb_parent2.enabled = false
end if
	
// puis payeur
if v_email_payeur <> "" or v_nom_payeur_mon_orthodontiste <> ""  then
	rb_payeur.enabled = true
else
	rb_payeur.enabled = false
end if



	




// Priorité au Parent 1
if rb_parent1.enabled then
//	cbx_email1.checked = true
	rb_parent1.checked = true
	rb_parent1.triggerevent(clicked!)
else
	if rb_patient.enabled  then
//		cbx_email1.checked = true
		rb_patient.checked = true
		rb_patient.triggerevent(clicked!)
	else
		if rb_parent2.enabled then
//			cbx_email1.checked = true
			rb_parent2.checked = true
			rb_parent2.triggerevent(clicked!)
		else
			if rb_payeur.enabled then
//				cbx_email1.checked = true
				rb_payeur.checked = true
				rb_payeur.triggerevent(clicked!)
			else
				cbx_email1.enabled = false
			end if
		end if
	end if
end if

// pour le signataire 2 ... patient par défaut ...
if var_numero_signataire = 2 and rb_patient.enabled  then
	cbx_email1.checked = true
	rb_patient.checked = true
	rb_patient.triggerevent(clicked!)	
end if

// Si signature_dentalsign, on ne doit signer qu'en local
if SIGNATURE_DENTALSIGN and not MON_ORTHODONTISTE then
	cbx_email1.visible = false
	dw_textes_email1.visible = false
	st_portable1.text = "Téléphone Portable :"
	cbx_notif11.visible = false
	sle_notification11.visible = false
	sle_nom_notification11.visible = false
	st_nom_notification11.visible = false
	
	cbx_notif12.visible = false
	sle_notification12.visible = false
	sle_nom_notification12.visible = false
	st_nom_notification12.visible = false
end if
end subroutine

public subroutine ecrire_fichier_ini (string var_nom_fichier_ini);
if cbx_email1.checked then
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"texte_email", dw_textes_email1.gettext() )
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"nom_destinataire_email", sle_nom1.text )
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"email_destinataire_email", sle_email1.text )
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"portable_destinataire_email", sle_portable1.text )
end if

if cbx_notif11.checked then
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"portable_notif1", sle_notification11.text )
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"nom_notif1", sle_nom_notification11.text )
end if

if cbx_notif12.checked then
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"portable_notif2", sle_notification12.text )
	setprofilestring(var_nom_fichier_ini,"signataire_" + string(var_numero_signataire) ,"nom_notif2", sle_nom_notification12.text )
end if

end subroutine

on uo_signataire.create
this.sle_pays_notification12=create sle_pays_notification12
this.sle_pays_notification11=create sle_pays_notification11
this.sle_pays_portable1=create sle_pays_portable1
this.dw_textes_email1=create dw_textes_email1
this.cbx_email1=create cbx_email1
this.st_nom_notification12=create st_nom_notification12
this.sle_nom_notification12=create sle_nom_notification12
this.sle_notification12=create sle_notification12
this.cbx_notif12=create cbx_notif12
this.st_nom_notification11=create st_nom_notification11
this.sle_nom_notification11=create sle_nom_notification11
this.sle_notification11=create sle_notification11
this.cbx_notif11=create cbx_notif11
this.sle_portable1=create sle_portable1
this.st_portable1=create st_portable1
this.rb_payeur=create rb_payeur
this.rb_parent2=create rb_parent2
this.rb_patient=create rb_patient
this.rb_parent1=create rb_parent1
this.sle_email1=create sle_email1
this.st_email1=create st_email1
this.st_nom1=create st_nom1
this.sle_nom1=create sle_nom1
this.gb_signataire=create gb_signataire
this.Control[]={this.sle_pays_notification12,&
this.sle_pays_notification11,&
this.sle_pays_portable1,&
this.dw_textes_email1,&
this.cbx_email1,&
this.st_nom_notification12,&
this.sle_nom_notification12,&
this.sle_notification12,&
this.cbx_notif12,&
this.st_nom_notification11,&
this.sle_nom_notification11,&
this.sle_notification11,&
this.cbx_notif11,&
this.sle_portable1,&
this.st_portable1,&
this.rb_payeur,&
this.rb_parent2,&
this.rb_patient,&
this.rb_parent1,&
this.sle_email1,&
this.st_email1,&
this.st_nom1,&
this.sle_nom1,&
this.gb_signataire}
end on

on uo_signataire.destroy
destroy(this.sle_pays_notification12)
destroy(this.sle_pays_notification11)
destroy(this.sle_pays_portable1)
destroy(this.dw_textes_email1)
destroy(this.cbx_email1)
destroy(this.st_nom_notification12)
destroy(this.sle_nom_notification12)
destroy(this.sle_notification12)
destroy(this.cbx_notif12)
destroy(this.st_nom_notification11)
destroy(this.sle_nom_notification11)
destroy(this.sle_notification11)
destroy(this.cbx_notif11)
destroy(this.sle_portable1)
destroy(this.st_portable1)
destroy(this.rb_payeur)
destroy(this.rb_parent2)
destroy(this.rb_patient)
destroy(this.rb_parent1)
destroy(this.sle_email1)
destroy(this.st_email1)
destroy(this.st_nom1)
destroy(this.sle_nom1)
destroy(this.gb_signataire)
end on

event constructor;
cbx_notif11.text = "Notification 1 " + LIBELLE_APPLICATION + " :"
cbx_notif12.text = "Notification 2 " + LIBELLE_APPLICATION + " :"


if TEA then 
	dw_textes_email1.visible = false
end if
end event

type sle_pays_notification12 from singlelineedit within uo_signataire
boolean visible = false
integer x = 2263
integer y = 896
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type sle_pays_notification11 from singlelineedit within uo_signataire
boolean visible = false
integer x = 2263
integer y = 764
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type sle_pays_portable1 from singlelineedit within uo_signataire
boolean visible = false
integer x = 2263
integer y = 632
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type dw_textes_email1 from datawindow within uo_signataire
string tag = "no resize all"
integer x = 677
integer y = 116
integer width = 1216
integer height = 76
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_texte_email"
boolean border = false
boolean livescroll = true
end type

type cbx_email1 from checkbox within uo_signataire
integer x = 137
integer y = 116
integer width = 512
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envoi d~'un email"
end type

type st_nom_notification12 from statictext within uo_signataire
integer x = 311
integer y = 936
integer width = 201
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom :"
boolean focusrectangle = false
end type

type sle_nom_notification12 from singlelineedit within uo_signataire
integer x = 539
integer y = 924
integer width = 1623
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type sle_notification12 from singlelineedit within uo_signataire
integer x = 1093
integer y = 816
integer width = 1070
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type cbx_notif12 from checkbox within uo_signataire
integer x = 137
integer y = 816
integer width = 951
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification 2 application :"
end type

type st_nom_notification11 from statictext within uo_signataire
integer x = 311
integer y = 720
integer width = 201
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom :"
boolean focusrectangle = false
end type

type sle_nom_notification11 from singlelineedit within uo_signataire
integer x = 539
integer y = 708
integer width = 1623
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type sle_notification11 from singlelineedit within uo_signataire
integer x = 1093
integer y = 600
integer width = 1070
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type cbx_notif11 from checkbox within uo_signataire
integer x = 137
integer y = 612
integer width = 951
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification 1 application :"
end type

type sle_portable1 from singlelineedit within uo_signataire
integer x = 1093
integer y = 452
integer width = 1070
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type st_portable1 from statictext within uo_signataire
integer x = 315
integer y = 464
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Portable d~'authentification :"
boolean focusrectangle = false
end type

type rb_payeur from radiobutton within uo_signataire
integer x = 2286
integer y = 484
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payeur"
end type

event clicked;string v_nom

// Mise en place du payeur

sle_nom1.text = v_nom_payeur
sle_email1.text = v_email_payeur

if v_email_payeur <> "" and  (v_portable1_payeur <> "" or v_portable2_payeur <> "" ) then 
	cbx_email1.enabled = true
	cbx_email1.checked = true
else
	cbx_email1.checked = false
	cbx_email1.enabled = false
end if

if v_portable1_payeur <> "" then
	sle_portable1.text = v_portable1_payeur
else
	sle_portable1.text = v_portable2_payeur
end if
sle_pays_portable1.text = v_pays_payeur


if v_portable1_payeur <> "" or trim(v_email_payeur) <> ""  then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and ( telephone = right(:v_portable1_payeur, len(trim(telephone))) or left(trim(:v_email_payeur),25) = trim(telephone))  ; 
//	where code = :var_code_local and telephone = :v_portable1_payeur ;
	
	if v_nom <> '' then
		cbx_notif11.enabled = true
		cbx_notif11.checked = true
		sle_nom_notification11.text = v_nom_payeur_mon_orthodontiste
		if v_portable1_payeur <> "" then 
			sle_notification11.text = v_portable1_payeur
			sle_pays_notification11.text = v_pays_payeur
		else
			sle_notification11.text = v_email_payeur
		end if
	else
		cbx_notif11.checked = false
		cbx_notif11.enabled = false
		sle_notification11.text = ""
		sle_nom_notification11.text = ""
		sle_pays_notification11.text = ""
	end if
else
	cbx_notif11.checked = false
	cbx_notif11.enabled = false
	sle_notification11.text = ""
	sle_nom_notification11.text = ""
	sle_pays_notification11.text = ""
end if

if v_portable2_payeur <> "" then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and telephone = right(:v_portable1_payeur, len(trim(telephone)))  ; 
//	where code = :var_code_local and telephone = :v_portable2_payeur ;
	
	if v_nom <> '' then
		cbx_notif12.enabled = true
		cbx_notif12.checked = true
		sle_notification12.text = v_portable2_payeur
		sle_nom_notification12.text = v_nom_payeur_mon_orthodontiste
		sle_pays_notification12.text = v_pays_payeur
	else
		cbx_notif12.checked = false
		cbx_notif12.enabled = false
		sle_notification12.text = ""
		sle_nom_notification12.text = ""
		sle_pays_notification12.text = ""
	end if
else
	cbx_notif12.checked = false
	cbx_notif12.enabled = false
	sle_notification12.text = ""
	sle_nom_notification12.text = ""
	sle_pays_notification12.text = ""
end if

end event

type rb_parent2 from radiobutton within uo_signataire
integer x = 2286
integer y = 384
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 2"
end type

event clicked;string v_nom

// Mise en place du parent 2

sle_nom1.text = v_nom_parent2
sle_email1.text = v_email_parent2

if v_email_parent2 <> "" and (v_portable1_parent2 <> "" or v_portable2_parent2 <> "") then 
	cbx_email1.enabled = true
	cbx_email1.checked = true
else
	cbx_email1.enabled = false
	cbx_email1.checked = false
end if

if v_portable1_parent2 <> "" then
	sle_portable1.text = v_portable1_parent2
else
	sle_portable1.text = v_portable2_parent2
end if
sle_pays_portable1.text = v_pays_parent2


if v_portable1_parent2 <> "" or trim(v_email_parent2) <> ""  then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and (telephone = right(:v_portable1_parent2, len(trim(telephone))) or left(trim(:v_email_parent2),25) = trim(telephone)) ; 
//	where code = :var_code_local and telephone = :v_portable1_parent2 ;
	
	if v_nom <> '' then
		cbx_notif11.enabled = true
		cbx_notif11.checked = true
		sle_nom_notification11.text = v_nom_parent2_mon_orthodontiste
		if v_portable1_parent2 <> "" then
			sle_notification11.text = v_portable1_parent2
			sle_pays_notification11.text = v_pays_parent2
		else
			sle_notification11.text = v_email_parent2
		end if
	else
		cbx_notif11.checked = false
		cbx_notif11.enabled = false
		sle_notification11.text = ""
		sle_nom_notification11.text = ""
		sle_pays_notification11.text = ""
	end if
else
	cbx_notif11.checked = false
	cbx_notif11.enabled = false
	sle_notification11.text = ""
	sle_nom_notification11.text = ""
	sle_pays_notification11.text = ""
end if

if v_portable2_parent2 <> "" then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) 
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and telephone = right(:v_portable2_parent2, len(trim(telephone)))   ;
//	where code = :var_code_local and telephone = :v_portable2_parent2 ;
	
	if v_nom <> '' then
		cbx_notif12.enabled = true
		cbx_notif12.checked = true
		sle_notification12.text = v_portable2_parent2
		sle_nom_notification12.text = v_nom_parent2_mon_orthodontiste
		sle_pays_notification12.text = v_pays_parent2
	else
		cbx_notif12.checked = false
		cbx_notif12.enabled = false
		sle_notification12.text = ""
		sle_nom_notification12.text = ""
		sle_pays_notification12.text = ""
	end if
else
	cbx_notif12.checked = false
	cbx_notif12.enabled = false
	sle_notification12.text = ""
	sle_nom_notification12.text = ""
	sle_pays_notification12.text = ""
end if


end event

type rb_patient from radiobutton within uo_signataire
integer x = 2286
integer y = 284
integer width = 338
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient"
end type

event clicked;string v_nom
integer v_nb

// Mise en place du patient

sle_nom1.text = v_nom_patient
sle_email1.text = v_email_patient
sle_portable1.text = v_portable_patient

if v_email_patient <> "" and v_portable_patient <> "" then 
	cbx_email1.enabled = true
	cbx_email1.checked = true
else
	cbx_email1.checked = false
	cbx_email1.enabled = false
end if

if trim(v_portable_patient) <> "" or trim(v_email_patient) <> "" then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select trim(isnull(nom, '')+' '+ isnull(prenom,'') ) , count(*)
	into :v_nom , :v_nb
	from patient_mon_orthodontiste
	where code = :var_code_local and ( telephone = right(:v_portable_patient, len(trim(telephone)))   or left(trim(:v_email_patient),25) = trim(telephone))
//	where code = :var_code_local and telephone = :v_portable_patient 
	group by nom, prenom ;

	
	
	if v_nb > 0 then
		if  v_nom <> '' then
			// on prend par défaut le nom de Mon Ortho
			sle_nom_notification11.text = v_nom
		else
			// On prend le nom d'Orthokis
			sle_nom_notification11.text = v_nom_patient
		end if
		cbx_notif11.enabled = true
		cbx_notif11.checked = true
		if v_portable_patient <> "" then 
			sle_notification11.text = v_portable_patient
			sle_pays_notification11.text = v_pays_parent1
		else
			sle_notification11.text = v_email_patient
		end if
	else
		cbx_notif11.checked = false
		cbx_notif11.enabled = false
		sle_notification11.text = ""
		sle_nom_notification11.text = ""
		sle_pays_notification11.text = ""
	end if
else
	cbx_notif11.checked = false
	cbx_notif11.enabled = false
	sle_notification11.text = ""
	sle_nom_notification11.text = ""
	sle_pays_notification11.text = ""
end if

cbx_notif12.checked = false
cbx_notif12.enabled = false
sle_notification12.text = ""
sle_nom_notification12.text = ""
sle_pays_notification12.text = ""



end event

type rb_parent1 from radiobutton within uo_signataire
integer x = 2286
integer y = 184
integer width = 352
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 1"
end type

event clicked;string v_nom

// Mise en place du parent 1

sle_nom1.text = v_nom_parent1
sle_email1.text = v_email_parent1

if v_email_parent1 <> "" and (v_portable1_parent1 <> "" or v_portable2_parent1 <> "") then 
	cbx_email1.enabled = true
	cbx_email1.checked = true
else
	cbx_email1.checked = false
	cbx_email1.enabled = false
end if

if v_portable1_parent1 <> "" then
	sle_portable1.text = v_portable1_parent1
	sle_pays_portable1.text = v_pays_parent1
else
	sle_portable1.text = v_portable2_parent1
	sle_pays_portable1.text = v_pays_parent1
end if

if v_portable1_parent1 <> "" or trim(v_email_parent1) <> ""  then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select isnull(trim(isnull(nom, '')+' '+ isnull(prenom,'') ) , '')
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and ( telephone = right(:v_portable1_parent1, len(trim(telephone)))  or left(trim(:v_email_parent1),25) = trim(telephone))  ;
	//where code = :var_code_local and telephone = :v_portable1_parent1 ;
	
	if v_nom <> '' then
		cbx_notif11.enabled = true
		cbx_notif11.checked = true
		if v_portable1_parent1 <> "" then 
			sle_notification11.text = v_portable1_parent1
			sle_pays_notification11.text = v_pays_parent1
		else
			sle_notification11.text = v_email_parent1
		end if
		sle_nom_notification11.text = v_nom_parent1_mon_orthodontiste
		
	else
		cbx_notif11.checked = false
		cbx_notif11.enabled = false
		sle_notification11.text = ""
		sle_nom_notification11.text = ""
		sle_pays_notification11.text = ""
	end if
else
	cbx_notif11.checked = false
	cbx_notif11.enabled = false
	sle_notification11.text = ""
	sle_nom_notification11.text = ""
	sle_pays_notification11.text = ""
end if

if v_portable2_parent1 <> "" then
	// est il connecté à mon orthodontiste ? Si oui, on propose la notif
	select isnull(trim(isnull(nom, '')+' '+ isnull(prenom,'') ) , '')
	into :v_nom 
	from patient_mon_orthodontiste
	where code = :var_code_local and telephone = right(:v_portable2_parent1, len(trim(telephone)))   ;
//	where code = :var_code_local and telephone = :v_portable2_parent1 ;

	if v_nom_parent1_mon_orthodontiste <> '' then
		cbx_notif12.enabled = true
		cbx_notif12.checked = true
		sle_notification12.text = v_portable2_parent1
		sle_nom_notification12.text = v_nom_parent1_mon_orthodontiste
		sle_pays_notification12.text = v_pays_parent1
	else
		cbx_notif12.checked = false
		cbx_notif12.enabled = false
		sle_notification12.text = ""
		sle_nom_notification12.text = ""
		sle_pays_notification12.text = ""
	end if
else
	cbx_notif12.checked = false
	cbx_notif12.enabled = false
	sle_notification12.text = ""
	sle_nom_notification12.text = ""
	sle_pays_notification12.text = ""
end if





end event

type sle_email1 from singlelineedit within uo_signataire
integer x = 539
integer y = 340
integer width = 1623
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type st_email1 from statictext within uo_signataire
integer x = 315
integer y = 352
integer width = 215
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email :"
boolean focusrectangle = false
end type

type st_nom1 from statictext within uo_signataire
integer x = 306
integer y = 240
integer width = 201
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom :"
boolean focusrectangle = false
end type

type sle_nom1 from singlelineedit within uo_signataire
integer x = 539
integer y = 228
integer width = 1623
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
borderstyle borderstyle = stylelowered!
end type

type gb_signataire from groupbox within uo_signataire
integer width = 2738
integer height = 1028
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signataire 1"
end type

