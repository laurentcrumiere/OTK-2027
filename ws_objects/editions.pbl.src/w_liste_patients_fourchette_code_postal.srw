$PBExportHeader$w_liste_patients_fourchette_code_postal.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_fourchette_code_postal from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_fourchette_code_postal
end type
type st_2 from statictext within w_liste_patients_fourchette_code_postal
end type
type st_3 from statictext within w_liste_patients_fourchette_code_postal
end type
type rb_un_dos from radiobutton within w_liste_patients_fourchette_code_postal
end type
type rb_tous_dos from radiobutton within w_liste_patients_fourchette_code_postal
end type
type gb_dos from groupbox within w_liste_patients_fourchette_code_postal
end type
type dw_dossier from datawindow within w_liste_patients_fourchette_code_postal
end type
type cp_min from singlelineedit within w_liste_patients_fourchette_code_postal
end type
type cp_max from singlelineedit within w_liste_patients_fourchette_code_postal
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_fourchette_code_postal
end type
type st_4 from statictext within w_liste_patients_fourchette_code_postal
end type
type st_5 from statictext within w_liste_patients_fourchette_code_postal
end type
type em_date_min from uo_date_calendrier within w_liste_patients_fourchette_code_postal
end type
type st_6 from statictext within w_liste_patients_fourchette_code_postal
end type
type em_date_max from uo_date_calendrier within w_liste_patients_fourchette_code_postal
end type
type rb_liste from radiobutton within w_liste_patients_fourchette_code_postal
end type
type rb_synthese from radiobutton within w_liste_patients_fourchette_code_postal
end type
type dw_2 from datawindow within w_liste_patients_fourchette_code_postal
end type
type gb_2 from groupbox within w_liste_patients_fourchette_code_postal
end type
end forward

global type w_liste_patients_fourchette_code_postal from w_liste_patients
string title = "Liste des Patients selon une fourchette de Codes Postaux"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
gb_dos gb_dos
dw_dossier dw_dossier
cp_min cp_min
cp_max cp_max
uo_filtre_email uo_filtre_email
st_4 st_4
st_5 st_5
em_date_min em_date_min
st_6 st_6
em_date_max em_date_max
rb_liste rb_liste
rb_synthese rb_synthese
dw_2 dw_2
gb_2 gb_2
end type
global w_liste_patients_fourchette_code_postal w_liste_patients_fourchette_code_postal

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p,dos_min,dos_max
double code_min,code_max
string cop_min,cop_max
date date_min, date_max

if not prepa_faite then
	//prepa_faite = true
	
	if rb_liste.checked then
		dw_liste.dataobject = "dw_liste_patients_fourchette_cp_edition"
	else
		dw_liste.dataobject = "dw_liste_patients_fourchette_cp_synthese"
	end if
	dw_liste.settransobject(sqlca)
	dw_liste.triggerevent(constructor!)	// pour les filtres

	
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	if rb_tous_dos.checked then
		dos_min="      "
		dos_max="ZZZZZZ"
		tit = tit + " - Tous les Types de dossier"
	else
		dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max=dos_min
		SELECT nom INTO :p FROM dossier WHERE code = :dos_min ;
		tit = tit + " - Dossiers : "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	cop_min = string(cp_min.text)
	cop_max = string(cp_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Selon les codes postaux entre "+cp_min.text+" et "+cp_max.text
	open(w_patience)
	dw_liste.Modify("sous_titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,cop_min,cop_max,dos_min,dos_max,  date_min, date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;cp_min.text = '01000'
cp_max.text = '99000'
dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

end event

on w_liste_patients_fourchette_code_postal.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.gb_dos=create gb_dos
this.dw_dossier=create dw_dossier
this.cp_min=create cp_min
this.cp_max=create cp_max
this.uo_filtre_email=create uo_filtre_email
this.st_4=create st_4
this.st_5=create st_5
this.em_date_min=create em_date_min
this.st_6=create st_6
this.em_date_max=create em_date_max
this.rb_liste=create rb_liste
this.rb_synthese=create rb_synthese
this.dw_2=create dw_2
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_dos
this.Control[iCurrent+6]=this.gb_dos
this.Control[iCurrent+7]=this.dw_dossier
this.Control[iCurrent+8]=this.cp_min
this.Control[iCurrent+9]=this.cp_max
this.Control[iCurrent+10]=this.uo_filtre_email
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.em_date_max
this.Control[iCurrent+16]=this.rb_liste
this.Control[iCurrent+17]=this.rb_synthese
this.Control[iCurrent+18]=this.dw_2
this.Control[iCurrent+19]=this.gb_2
end on

on w_liste_patients_fourchette_code_postal.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.gb_dos)
destroy(this.dw_dossier)
destroy(this.cp_min)
destroy(this.cp_max)
destroy(this.uo_filtre_email)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_date_min)
destroy(this.st_6)
destroy(this.em_date_max)
destroy(this.rb_liste)
destroy(this.rb_synthese)
destroy(this.dw_2)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_fourchette_code_postal
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_fourchette_code_postal
integer x = 2208
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_fourchette_code_postal
integer x = 1733
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_fourchette_code_postal
integer x = 2683
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_fourchette_code_postal
integer x = 512
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_fourchette_code_postal
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_fourchette_code_postal
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_fourchette_code_postal
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_fourchette_code_postal
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_fourchette_code_postal
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_fourchette_code_postal
integer y = 368
end type

type em_min from w_liste_patients`em_min within w_liste_patients_fourchette_code_postal
integer y = 368
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_fourchette_code_postal
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_fourchette_code_postal
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_fourchette_code_postal
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_fourchette_code_postal
end type

type st_min from w_liste_patients`st_min within w_liste_patients_fourchette_code_postal
integer y = 380
end type

type st_max from w_liste_patients`st_max within w_liste_patients_fourchette_code_postal
integer y = 380
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_fourchette_code_postal
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_patients_fourchette_cp_edition"
end type

event dw_liste::rbuttondown;if rb_liste.checked then 
	if row > 0 then
		This.SelectRow(0,False)
		This.SelectRow(row,True)
		This.setrow(row)
		OpenMenuPatient_Listes(this)
	end if
end if
end event

event dw_liste::doubleclicked;if rb_liste.checked then 

	// double clic, comme dans la salle d'attente !!
	
	if row > 0 then
	
		var_code 				= 	this.getitemnumber(row,"code")
		var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
		var_nom 				= this.getitemstring(row,"nom")
		var_nomp 				= ""
		var_pay 					= ""
		var_moul 				= ""
	
		ouverture_salle_attente()
	end if

end if
end event

type st_1 from statictext within w_liste_patients_fourchette_code_postal
integer x = 347
integer y = 588
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Codes Postaux :"
end type

type st_2 from statictext within w_liste_patients_fourchette_code_postal
integer x = 1317
integer y = 712
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_fourchette_code_postal
integer x = 475
integer y = 712
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre "
end type

type rb_un_dos from radiobutton within w_liste_patients_fourchette_code_postal
integer x = 485
integer y = 1052
integer width = 667
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de dossier "
end type

event clicked;dw_dossier.visible = true
end event

type rb_tous_dos from radiobutton within w_liste_patients_fourchette_code_postal
integer x = 485
integer y = 956
integer width = 850
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type gb_dos from groupbox within w_liste_patients_fourchette_code_postal
integer x = 320
integer y = 876
integer width = 2121
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type de dossier "
end type

type dw_dossier from datawindow within w_liste_patients_fourchette_code_postal
string tag = "position brush"
boolean visible = false
integer x = 1243
integer y = 1052
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type cp_min from singlelineedit within w_liste_patients_fourchette_code_postal
integer x = 823
integer y = 692
integer width = 297
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "01"
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type cp_max from singlelineedit within w_liste_patients_fourchette_code_postal
integer x = 1541
integer y = 692
integer width = 297
integer height = 112
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "99"
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_fourchette_code_postal
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_4 from statictext within w_liste_patients_fourchette_code_postal
integer x = 347
integer y = 1264
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Entre 2 dates de 1er contact :"
end type

type st_5 from statictext within w_liste_patients_fourchette_code_postal
integer x = 567
integer y = 1404
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

type em_date_min from uo_date_calendrier within w_liste_patients_fourchette_code_postal
integer x = 974
integer y = 1384
integer taborder = 50
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_6 from statictext within w_liste_patients_fourchette_code_postal
integer x = 1408
integer y = 1404
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

type em_date_max from uo_date_calendrier within w_liste_patients_fourchette_code_postal
integer x = 1783
integer y = 1384
integer taborder = 60
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_liste from radiobutton within w_liste_patients_fourchette_code_postal
integer x = 503
integer y = 1620
integer width = 645
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
string text = "Liste de patients"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

event clicked;prepa_faite = false
end event

type rb_synthese from radiobutton within w_liste_patients_fourchette_code_postal
integer x = 1367
integer y = 1620
integer width = 521
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
string text = "Synthèse"
borderstyle borderstyle = styleraised!
end type

event clicked;prepa_faite = false
end event

type dw_2 from datawindow within w_liste_patients_fourchette_code_postal
string tag = "pour la compilation"
boolean visible = false
integer x = 2674
integer y = 1240
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_patients_fourchette_cp_synthese"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_liste_patients_fourchette_code_postal
integer x = 320
integer y = 1520
integer width = 2121
integer height = 236
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Résultat"
borderstyle borderstyle = styleraised!
end type

