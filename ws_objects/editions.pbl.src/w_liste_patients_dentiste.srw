$PBExportHeader$w_liste_patients_dentiste.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_dentiste from w_liste_patients
end type
type dw_corresp from datawindow within w_liste_patients_dentiste
end type
type st_1 from statictext within w_liste_patients_dentiste
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_dentiste
end type
type rb_contact from radiobutton within w_liste_patients_dentiste
end type
type rb_premiere from radiobutton within w_liste_patients_dentiste
end type
type em_date_min from uo_date_calendrier within w_liste_patients_dentiste
end type
type st_2 from statictext within w_liste_patients_dentiste
end type
type st_3 from statictext within w_liste_patients_dentiste
end type
type st_4 from statictext within w_liste_patients_dentiste
end type
type em_date_max from uo_date_calendrier within w_liste_patients_dentiste
end type
type gb_2 from groupbox within w_liste_patients_dentiste
end type
end forward

global type w_liste_patients_dentiste from w_liste_patients
string title = "Liste des Patients d~'un Dentiste Traitant"
dw_corresp dw_corresp
st_1 st_1
uo_filtre_email uo_filtre_email
rb_contact rb_contact
rb_premiere rb_premiere
em_date_min em_date_min
st_2 st_2
st_3 st_3
st_4 st_4
em_date_max em_date_max
gb_2 gb_2
end type
global w_liste_patients_dentiste w_liste_patients_dentiste

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,cor
double code_min,code_max
date date_min, date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	cor = dw_corresp.getitemstring(dw_corresp.getrow(),"code")
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,cor)
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	// Filtre sur les dates ! Sera fait par l'uo_filtre email
	if rb_contact.checked then 
		uo_filtre_email.filtre_initial =  "(date(" + string(year(date_min)) + "," +string(month(date_min)) + "," + string(day(date_min))+") <= date_contact and " 
		uo_filtre_email.filtre_initial =   uo_filtre_email.filtre_initial +  "date_contact <= date(" + string(year(date_max)) + "," +string(month(date_max)) + "," + string(day(date_max))+"))"
		dw_liste.Modify("titre_t.text = 'Entre 2 dates de Premier Contact - Du " + em_date_min.text + " au " + em_date_max.text + "'")
	else
		uo_filtre_email.filtre_initial =  "(date(" + string(year(date_min)) + "," +string(month(date_min)) + "," + string(day(date_min))+") <= premiere_visite and " 
		uo_filtre_email.filtre_initial =   uo_filtre_email.filtre_initial +  "premiere_visite <= date(" + string(year(date_max)) + "," +string(month(date_max)) + "," + string(day(date_max))+"))"
		dw_liste.Modify("titre_t.text = 'Entre 2 dates de Première Visite - Du " + em_date_min.text + " au " + em_date_max.text + "'")
	end if
		
		
	uo_filtre_email.filtre_emails()
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_corresp.settransobject(SQLCA)
dw_corresp.retrieve() 
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today()) 

end event

on w_liste_patients_dentiste.create
int iCurrent
call super::create
this.dw_corresp=create dw_corresp
this.st_1=create st_1
this.uo_filtre_email=create uo_filtre_email
this.rb_contact=create rb_contact
this.rb_premiere=create rb_premiere
this.em_date_min=create em_date_min
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.em_date_max=create em_date_max
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_corresp
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.uo_filtre_email
this.Control[iCurrent+4]=this.rb_contact
this.Control[iCurrent+5]=this.rb_premiere
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.em_date_max
this.Control[iCurrent+11]=this.gb_2
end on

on w_liste_patients_dentiste.destroy
call super::destroy
destroy(this.dw_corresp)
destroy(this.st_1)
destroy(this.uo_filtre_email)
destroy(this.rb_contact)
destroy(this.rb_premiere)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_date_max)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_dentiste
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_dentiste
integer x = 2254
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_dentiste
integer x = 1778
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_dentiste
integer x = 2729
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_dentiste
integer x = 558
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_dentiste
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_dentiste
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_dentiste
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_dentiste
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_dentiste
end type

type em_max from w_liste_patients`em_max within w_liste_patients_dentiste
end type

type em_min from w_liste_patients`em_min within w_liste_patients_dentiste
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_dentiste
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_dentiste
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_dentiste
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_dentiste
end type

type st_min from w_liste_patients`st_min within w_liste_patients_dentiste
end type

type st_max from w_liste_patients`st_max within w_liste_patients_dentiste
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_dentiste
string dataobject = "dw_liste_patients_dentiste_edition"
end type

type dw_corresp from datawindow within w_liste_patients_dentiste
string tag = "position brush"
integer x = 914
integer y = 864
integer width = 1088
integer height = 80
integer taborder = 60
string dataobject = "dw_cherche_corresp"
boolean border = false
end type

type st_1 from statictext within w_liste_patients_dentiste
string tag = "a masquer"
integer x = 343
integer y = 864
integer width = 530
integer height = 64
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = "Dentiste Traitant :"
alignment alignment = center!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_dentiste
string tag = "no resize all"
integer x = 1033
integer y = 1856
integer taborder = 160
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_contact from radiobutton within w_liste_patients_dentiste
integer x = 485
integer y = 1164
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
string text = "Date de premier contact"
boolean checked = true
end type

event clicked;st_1.text = "Date de contact"


end event

type rb_premiere from radiobutton within w_liste_patients_dentiste
integer x = 1353
integer y = 1164
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

type em_date_min from uo_date_calendrier within w_liste_patients_dentiste
integer x = 910
integer y = 1480
integer taborder = 180
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_liste_patients_dentiste
integer x = 375
integer y = 1372
integer width = 809
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de premier contact :"
end type

type st_3 from statictext within w_liste_patients_dentiste
integer x = 585
integer y = 1496
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

type st_4 from statictext within w_liste_patients_dentiste
integer x = 1413
integer y = 1496
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

type em_date_max from uo_date_calendrier within w_liste_patients_dentiste
integer x = 1714
integer y = 1480
integer taborder = 190
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type gb_2 from groupbox within w_liste_patients_dentiste
integer x = 370
integer y = 1036
integer width = 2021
integer height = 292
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Recherche selon"
borderstyle borderstyle = styleraised!
end type

