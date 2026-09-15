$PBExportHeader$w_liste_patients_non_donnees.srw
forward
global type w_liste_patients_non_donnees from w_liste_patients
end type
type st_2 from statictext within w_liste_patients_non_donnees
end type
type st_4 from statictext within w_liste_patients_non_donnees
end type
type st_3 from statictext within w_liste_patients_non_donnees
end type
type em_date_min from uo_date_calendrier within w_liste_patients_non_donnees
end type
type em_date_max from uo_date_calendrier within w_liste_patients_non_donnees
end type
end forward

global type w_liste_patients_non_donnees from w_liste_patients
string title = "Liste des DEP non Données"
st_2 st_2
st_4 st_4
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
end type
global w_liste_patients_non_donnees w_liste_patients_non_donnees

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
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
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,code_min,code_max,date_min,date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_non_donnees.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_4=create st_4
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
end on

on w_liste_patients_non_donnees.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
end on

event open;call super::open;em_date_min.setDate(date(year(today()), 1, 1))
em_date_max.setDate(today()) 

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_non_donnees
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_non_donnees
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_non_donnees
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_non_donnees
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_non_donnees
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_non_donnees
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_non_donnees
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_non_donnees
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_non_donnees
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_non_donnees
end type

type em_max from w_liste_patients`em_max within w_liste_patients_non_donnees
end type

type em_min from w_liste_patients`em_min within w_liste_patients_non_donnees
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_non_donnees
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_non_donnees
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_non_donnees
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_non_donnees
end type

type st_min from w_liste_patients`st_min within w_liste_patients_non_donnees
end type

type st_max from w_liste_patients`st_max within w_liste_patients_non_donnees
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_non_donnees
string dataobject = "dw_liste_patients_non_donnees_edition"
end type

type st_2 from statictext within w_liste_patients_non_donnees
integer x = 347
integer y = 832
integer width = 951
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période des feuilles imprimées :"
end type

type st_4 from statictext within w_liste_patients_non_donnees
integer x = 475
integer y = 956
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

type st_3 from statictext within w_liste_patients_non_donnees
integer x = 1317
integer y = 956
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

type em_date_min from uo_date_calendrier within w_liste_patients_non_donnees
integer x = 850
integer y = 944
integer taborder = 200
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_non_donnees
integer x = 1655
integer y = 944
integer taborder = 210
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

