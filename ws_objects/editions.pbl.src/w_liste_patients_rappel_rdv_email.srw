$PBExportHeader$w_liste_patients_rappel_rdv_email.srw
forward
global type w_liste_patients_rappel_rdv_email from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_rappel_rdv_email
end type
type st_2 from statictext within w_liste_patients_rappel_rdv_email
end type
type st_3 from statictext within w_liste_patients_rappel_rdv_email
end type
type uo_edition from uo_edition_rtf within w_liste_patients_rappel_rdv_email
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_rappel_rdv_email
end type
type em_date_min from uo_date_calendrier within w_liste_patients_rappel_rdv_email
end type
type em_date_max from uo_date_calendrier within w_liste_patients_rappel_rdv_email
end type
type pb_envoyer from uo_picturebutton_390x120 within w_liste_patients_rappel_rdv_email
end type
type pb_supprimer_fichier_pj from picturebutton within w_liste_patients_rappel_rdv_email
end type
type pb_choisir_fichier_pj from picturebutton within w_liste_patients_rappel_rdv_email
end type
type sle_fichier_pj from singlelineedit within w_liste_patients_rappel_rdv_email
end type
type cbx_masquer_email from checkbox within w_liste_patients_rappel_rdv_email
end type
type cbx_exclus from checkbox within w_liste_patients_rappel_rdv_email
end type
type dw_prati2 from datawindow within w_liste_patients_rappel_rdv_email
end type
type cbx_joindre_ics from checkbox within w_liste_patients_rappel_rdv_email
end type
type gb_exclus from groupbox within w_liste_patients_rappel_rdv_email
end type
type gb_fichier_pj from groupbox within w_liste_patients_rappel_rdv_email
end type
end forward

global type w_liste_patients_rappel_rdv_email from w_liste_patients
string title = "Rappel des  Rendez-vous par email"
st_1 st_1
st_2 st_2
st_3 st_3
uo_edition uo_edition
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
pb_envoyer pb_envoyer
pb_supprimer_fichier_pj pb_supprimer_fichier_pj
pb_choisir_fichier_pj pb_choisir_fichier_pj
sle_fichier_pj sle_fichier_pj
cbx_masquer_email cbx_masquer_email
cbx_exclus cbx_exclus
dw_prati2 dw_prati2
cbx_joindre_ics cbx_joindre_ics
gb_exclus gb_exclus
gb_fichier_pj gb_fichier_pj
end type
global w_liste_patients_rappel_rdv_email w_liste_patients_rappel_rdv_email

type variables


string v_fichier_pj
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,dos,tit,p, etat, nom_rdv, pra_exclus
double code_min,code_max
date date_min,date_max
string filtre

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)



	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Object.titre.Text = tit
	

	if cbx_exclus.checked then
		pra_exclus = dw_prati2.getitemstring(dw_prati2.getrow(),"code")
		dw_liste.setfilter("rdv_code_praticien <> '" + pra_exclus + "'")
	else
		dw_liste.setfilter("")
	end if
	dw_liste.filter()
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true
	pb_envoyer.enabled ( true )
end if

end subroutine

event open;call super::open;//em_date_min.text = string(date(year(today()),1,1))
//em_date_max.text = string(today())

em_date_min.setDate ( relativedate(today(),1))
em_date_max.setDate ( relativedate(today(),3))

// on prend les négatifs éventuels
em_min.text = string(min)

// On prend aussi les archivés car ils peuvent avoir un rdv 
em_max.text = "999999999"

dw_prati2.settransobject(sqlca)
dw_prati2.retrieve()

gb_exclus.backcolor = couleur_fond_fenetre
cbx_exclus.backcolor = couleur_fond_fenetre

v_fichier_pj = profileString(dir_ini+inifile_orthokis,"rendez-vous","fichier_pj_rappel_rdv","")

sle_fichier_pj.text = v_fichier_pj

// Valeur précédente mémorisée
if profileString(dir_ini+inifile_orthokis,"rendez-vous","masquer_adresses_rappel_rdv","N") = "O" then 
	cbx_masquer_email.checked = true
else
	cbx_masquer_email.checked = false
end if


if version_ce_logiciel >= "36.90" then 
	gb_fichier_pj.text = "Fichier(s) joint(s)"
	cbx_joindre_ics.visible = true
end if
end event

on w_liste_patients_rappel_rdv_email.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.pb_envoyer=create pb_envoyer
this.pb_supprimer_fichier_pj=create pb_supprimer_fichier_pj
this.pb_choisir_fichier_pj=create pb_choisir_fichier_pj
this.sle_fichier_pj=create sle_fichier_pj
this.cbx_masquer_email=create cbx_masquer_email
this.cbx_exclus=create cbx_exclus
this.dw_prati2=create dw_prati2
this.cbx_joindre_ics=create cbx_joindre_ics
this.gb_exclus=create gb_exclus
this.gb_fichier_pj=create gb_fichier_pj
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.cb_lettres
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.em_date_max
this.Control[iCurrent+8]=this.pb_envoyer
this.Control[iCurrent+9]=this.pb_supprimer_fichier_pj
this.Control[iCurrent+10]=this.pb_choisir_fichier_pj
this.Control[iCurrent+11]=this.sle_fichier_pj
this.Control[iCurrent+12]=this.cbx_masquer_email
this.Control[iCurrent+13]=this.cbx_exclus
this.Control[iCurrent+14]=this.dw_prati2
this.Control[iCurrent+15]=this.cbx_joindre_ics
this.Control[iCurrent+16]=this.gb_exclus
this.Control[iCurrent+17]=this.gb_fichier_pj
end on

on w_liste_patients_rappel_rdv_email.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.pb_envoyer)
destroy(this.pb_supprimer_fichier_pj)
destroy(this.pb_choisir_fichier_pj)
destroy(this.sle_fichier_pj)
destroy(this.cbx_masquer_email)
destroy(this.cbx_exclus)
destroy(this.dw_prati2)
destroy(this.cbx_joindre_ics)
destroy(this.gb_exclus)
destroy(this.gb_fichier_pj)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rappel_rdv_email
integer y = 936
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rappel_rdv_email
integer x = 1490
integer taborder = 220
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rappel_rdv_email
integer x = 1010
integer taborder = 200
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
pb_envoyer.enabled (false )
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rappel_rdv_email
integer x = 2450
integer taborder = 230
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rappel_rdv_email
integer x = 530
integer y = 1872
integer taborder = 240
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true )
cb_lien_word.enabled ( true )
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rappel_rdv_email
integer x = 3301
end type

event cb_lien_word::clicked;call super::clicked;//
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_rappel_rdv_email
integer y = 532
integer taborder = 50
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rappel_rdv_email
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rappel_rdv_email
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rappel_rdv_email
integer taborder = 180
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rappel_rdv_email
integer y = 656
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rappel_rdv_email
integer y = 656
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rappel_rdv_email
integer taborder = 80
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rappel_rdv_email
integer taborder = 100
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rappel_rdv_email
integer taborder = 210
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rappel_rdv_email
integer taborder = 60
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rappel_rdv_email
integer y = 668
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rappel_rdv_email
integer y = 668
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rappel_rdv_email
integer y = 4
integer width = 3680
integer height = 1836
integer taborder = 10
string dataobject = "dw_liste_patients_rappel_rdv_email"
end type

type st_1 from statictext within w_liste_patients_rappel_rdv_email
integer x = 347
integer y = 820
integer width = 658
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_rappel_rdv_email
integer x = 1317
integer y = 928
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_rappel_rdv_email
integer x = 475
integer y = 928
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type uo_edition from uo_edition_rtf within w_liste_patients_rappel_rdv_email
event destroy ( )
boolean visible = false
integer x = 439
integer y = 436
integer taborder = 120
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_rappel_rdv_email
boolean visible = false
integer x = 2875
integer y = 1868
integer taborder = 190
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;//
end event

type em_date_min from uo_date_calendrier within w_liste_patients_rappel_rdv_email
integer x = 754
integer y = 920
integer taborder = 130
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_rappel_rdv_email
integer x = 1563
integer y = 920
integer taborder = 140
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type pb_envoyer from uo_picturebutton_390x120 within w_liste_patients_rappel_rdv_email
integer x = 1970
integer y = 1868
integer width = 457
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string text = "&Envoyer"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;
// Mémorisation du fichier en pièce jointe
SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","fichier_pj_rappel_rdv",v_fichier_pj)

// Mémorisation du masquage des adresses - sera utilisé par fxg_envoi_email_libre

if cbx_masquer_email.checked then
	SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","masquer_adresses_rappel_rdv","O")
else
	SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","masquer_adresses_rappel_rdv","N")
end if


if cbx_joindre_ics.checked then
	SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","joindre_ics_rappel_rdv","O")
else
	SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","joindre_ics_rappel_rdv","N")
end if

fxg_envoi_email_libre(0, dw_liste, 3)

end event

event rbuttondown;call super::rbuttondown;

fxg_envoi_email_libre(0, dw_liste, 5)


end event

type pb_supprimer_fichier_pj from picturebutton within w_liste_patients_rappel_rdv_email
integer x = 2697
integer y = 1384
integer width = 146
integer height = 120
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_poubelle.png"
alignment htextalign = left!
string powertiptext = "Permet de supprimer la pièce jointe"
end type

event clicked;
v_fichier_pj = ""
sle_fichier_pj.text = ""
SetprofileString(dir_ini+inifile_orthokis,"rendez-vous","fichier_pj_rappel_rdv","")

end event

type pb_choisir_fichier_pj from picturebutton within w_liste_patients_rappel_rdv_email
integer x = 2537
integer y = 1384
integer width = 146
integer height = 120
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
string powertiptext = "Permet de sélectionner un fichier"
end type

event clicked;string ficname,ficpath

if GetFileOpenName("Fichier à joindre",ficname,ficpath) = 1 then
	
	v_fichier_pj = ficname
	
	sle_fichier_pj.text =  v_fichier_pj 
end if
end event

type sle_fichier_pj from singlelineedit within w_liste_patients_rappel_rdv_email
integer x = 357
integer y = 1400
integer width = 2139
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type cbx_masquer_email from checkbox within w_liste_patients_rappel_rdv_email
integer x = 411
integer y = 1712
integer width = 1947
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Masquer les adresses emails des destinataires (envoi en cci)"
end type

type cbx_exclus from checkbox within w_liste_patients_rappel_rdv_email
integer x = 448
integer y = 1124
integer width = 750
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Exclure le praticien"
end type

event clicked;
if checked then
	dw_prati2.visible = true
else
	dw_prati2.visible = false
end if
end event

type dw_prati2 from datawindow within w_liste_patients_rappel_rdv_email
string tag = "no resize all"
boolean visible = false
integer x = 1271
integer y = 1136
integer width = 859
integer height = 68
integer taborder = 150
string title = "none"
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type cbx_joindre_ics from checkbox within w_liste_patients_rappel_rdv_email
boolean visible = false
integer x = 434
integer y = 1520
integer width = 1134
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Fichier .ICS de chaque rendez-vous "
end type

type gb_exclus from groupbox within w_liste_patients_rappel_rdv_email
integer x = 311
integer y = 1060
integer width = 2578
integer height = 212
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_fichier_pj from groupbox within w_liste_patients_rappel_rdv_email
integer x = 320
integer y = 1312
integer width = 2578
integer height = 336
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Joindre un fichier"
end type

