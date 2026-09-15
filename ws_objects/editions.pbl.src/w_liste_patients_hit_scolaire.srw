$PBExportHeader$w_liste_patients_hit_scolaire.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_hit_scolaire from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_hit_scolaire
end type
type st_2 from statictext within w_liste_patients_hit_scolaire
end type
type st_3 from statictext within w_liste_patients_hit_scolaire
end type
type em_date_min from uo_date_calendrier within w_liste_patients_hit_scolaire
end type
type em_date_max from uo_date_calendrier within w_liste_patients_hit_scolaire
end type
type rb_contact from radiobutton within w_liste_patients_hit_scolaire
end type
type rb_premiere from radiobutton within w_liste_patients_hit_scolaire
end type
type dw_liste_rdv from datawindow within w_liste_patients_hit_scolaire
end type
type dw_liste_premiere_visite from datawindow within w_liste_patients_hit_scolaire
end type
type cbx_detail_patient from checkbox within w_liste_patients_hit_scolaire
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_hit_scolaire
end type
type rb_tous_dos from radiobutton within w_liste_patients_hit_scolaire
end type
type rb_un_dos from radiobutton within w_liste_patients_hit_scolaire
end type
type dw_dossier from datawindow within w_liste_patients_hit_scolaire
end type
type gb_2 from groupbox within w_liste_patients_hit_scolaire
end type
type gb_3 from groupbox within w_liste_patients_hit_scolaire
end type
type gb_dos from groupbox within w_liste_patients_hit_scolaire
end type
end forward

global type w_liste_patients_hit_scolaire from w_liste_patients
string title = "Hit-Parade des Etablissements Scolaires"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
rb_contact rb_contact
rb_premiere rb_premiere
dw_liste_rdv dw_liste_rdv
dw_liste_premiere_visite dw_liste_premiere_visite
cbx_detail_patient cbx_detail_patient
uo_filtre_email uo_filtre_email
rb_tous_dos rb_tous_dos
rb_un_dos rb_un_dos
dw_dossier dw_dossier
gb_2 gb_2
gb_3 gb_3
gb_dos gb_dos
end type
global w_liste_patients_hit_scolaire w_liste_patients_hit_scolaire

type variables


end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,np
double code_min,code_max,nblig,cpt
date date_min,date_max
string dos_min, dos_max, p

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		tit = "Pour tous les Praticiens"
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
		Tit = "Pour le Dr "+np
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	open(w_patience)
	
	// pour actualiser les VRAIES date de premire visite
	maj_date_premiere_visite()
	
	if rb_premiere.checked then
		// Hit Parade première visite
		dw_liste.dataobject = dw_liste_premiere_visite.dataobject
		dw_liste.settransobject(sqlca)
	else
		// Hit Parade selon rdv
		dw_liste.dataobject = dw_liste_rdv.dataobject
		dw_liste.settransobject(sqlca)
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

	
	
	tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Modify("t_titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max, dos_min, dos_max)

	if cbx_detail_patient.checked then
		dw_liste.object.datawindow.detail.height = 96
		dw_liste.modify("datawindow.header.height = 492")
	else
		dw_liste.object.datawindow.detail.height = 0
	end if

	close(w_patience)


end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today()) 

// Faut prendre aussi les dossiers négatifs
em_min.text = string(min)

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 

end event

on w_liste_patients_hit_scolaire.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_contact=create rb_contact
this.rb_premiere=create rb_premiere
this.dw_liste_rdv=create dw_liste_rdv
this.dw_liste_premiere_visite=create dw_liste_premiere_visite
this.cbx_detail_patient=create cbx_detail_patient
this.uo_filtre_email=create uo_filtre_email
this.rb_tous_dos=create rb_tous_dos
this.rb_un_dos=create rb_un_dos
this.dw_dossier=create dw_dossier
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.rb_contact
this.Control[iCurrent+7]=this.rb_premiere
this.Control[iCurrent+8]=this.dw_liste_rdv
this.Control[iCurrent+9]=this.dw_liste_premiere_visite
this.Control[iCurrent+10]=this.cbx_detail_patient
this.Control[iCurrent+11]=this.uo_filtre_email
this.Control[iCurrent+12]=this.rb_tous_dos
this.Control[iCurrent+13]=this.rb_un_dos
this.Control[iCurrent+14]=this.dw_dossier
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_3
this.Control[iCurrent+17]=this.gb_dos
end on

on w_liste_patients_hit_scolaire.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_contact)
destroy(this.rb_premiere)
destroy(this.dw_liste_rdv)
destroy(this.dw_liste_premiere_visite)
destroy(this.cbx_detail_patient)
destroy(this.uo_filtre_email)
destroy(this.rb_tous_dos)
destroy(this.rb_un_dos)
destroy(this.dw_dossier)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_dos)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_hit_scolaire
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_hit_scolaire
integer x = 2208
integer taborder = 90
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_hit_scolaire
integer x = 1737
end type

event cb_autre::clicked;call super::clicked;

//pb_exporter.enabled = false



end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_hit_scolaire
integer x = 2679
integer taborder = 100
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_hit_scolaire
integer x = 526
end type

event cb_ecran::clicked;call super::clicked;

//pb_exporter.enabled = true



end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_hit_scolaire
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_hit_scolaire
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_hit_scolaire
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_hit_scolaire
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_hit_scolaire
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_hit_scolaire
end type

type em_min from w_liste_patients`em_min within w_liste_patients_hit_scolaire
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_hit_scolaire
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_hit_scolaire
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_hit_scolaire
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_hit_scolaire
end type

type st_min from w_liste_patients`st_min within w_liste_patients_hit_scolaire
end type

type st_max from w_liste_patients`st_max within w_liste_patients_hit_scolaire
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_hit_scolaire
integer y = 0
integer taborder = 70
string dataobject = "dw_hit_parade_scolaire_prem_visite"
end type

type st_1 from statictext within w_liste_patients_hit_scolaire
integer x = 347
integer y = 1112
integer width = 809
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

type st_2 from statictext within w_liste_patients_hit_scolaire
integer x = 1408
integer y = 1236
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

type st_3 from statictext within w_liste_patients_hit_scolaire
integer x = 475
integer y = 1236
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

type em_date_min from uo_date_calendrier within w_liste_patients_hit_scolaire
integer x = 882
integer y = 1220
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_hit_scolaire
integer x = 1687
integer y = 1220
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_contact from radiobutton within w_liste_patients_hit_scolaire
integer x = 457
integer y = 896
integer width = 809
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
string text = "Date de rendez-vous"
boolean checked = true
end type

event clicked;st_1.text = "Date de rendez-vous"
end event

type rb_premiere from radiobutton within w_liste_patients_hit_scolaire
integer x = 1326
integer y = 896
integer width = 763
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
string text = "Date de première visite"
end type

event clicked;st_1.text = "Date de première visite"
end event

type dw_liste_rdv from datawindow within w_liste_patients_hit_scolaire
string tag = "uniquement pour compilation"
boolean visible = false
integer x = 2464
integer y = 1044
integer width = 832
integer height = 520
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_hit_parade_scolaire_rdv"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_liste_premiere_visite from datawindow within w_liste_patients_hit_scolaire
string tag = "uniquement pour compilation"
boolean visible = false
integer x = 2487
integer y = 468
integer width = 832
integer height = 520
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_hit_parade_scolaire_prem_visite"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type cbx_detail_patient from checkbox within w_liste_patients_hit_scolaire
string tag = "no resize"
integer x = 3191
integer y = 1904
integer width = 471
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Détail Patients"
borderstyle borderstyle = styleraised!
end type

event clicked;if checked then
	dw_liste.object.datawindow.detail.height = 96
	dw_liste.modify("datawindow.header.height = 492")
else
	dw_liste.object.datawindow.detail.height = 0
end if

end event

type uo_filtre_email from uo_filtre_emails within w_liste_patients_hit_scolaire
event destroy ( )
string tag = "no resize all"
integer x = 997
integer y = 1848
integer taborder = 130
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_tous_dos from radiobutton within w_liste_patients_hit_scolaire
integer x = 507
integer y = 1492
integer width = 850
integer height = 80
boolean bringtotop = true
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

type rb_un_dos from radiobutton within w_liste_patients_hit_scolaire
integer x = 507
integer y = 1588
integer width = 667
integer height = 80
boolean bringtotop = true
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

type dw_dossier from datawindow within w_liste_patients_hit_scolaire
string tag = "no resizeall"
boolean visible = false
integer x = 1317
integer y = 1588
integer width = 951
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_2 from groupbox within w_liste_patients_hit_scolaire
integer x = 343
integer y = 776
integer width = 2021
integer height = 292
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Calculs selon"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_liste_patients_hit_scolaire
integer x = 3131
integer y = 1836
integer width = 594
integer height = 168
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = styleraised!
end type

type gb_dos from groupbox within w_liste_patients_hit_scolaire
integer x = 343
integer y = 1412
integer width = 2121
integer height = 304
integer taborder = 40
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

