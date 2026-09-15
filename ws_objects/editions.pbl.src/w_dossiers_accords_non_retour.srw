$PBExportHeader$w_dossiers_accords_non_retour.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_dossiers_accords_non_retour from w_liste_patients
end type
type em_date_min from editmask within w_dossiers_accords_non_retour
end type
type em_date_max from editmask within w_dossiers_accords_non_retour
end type
type st_1 from statictext within w_dossiers_accords_non_retour
end type
type st_5 from statictext within w_dossiers_accords_non_retour
end type
type st_4 from statictext within w_dossiers_accords_non_retour
end type
end forward

global type w_dossiers_accords_non_retour from w_liste_patients
string title = "Liste des Dossiers sans dates d~'accord"
em_date_min em_date_min
em_date_max em_date_max
st_1 st_1
st_5 st_5
st_4 st_4
end type
global w_dossiers_accords_non_retour w_dossiers_accords_non_retour

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
date date_min, date_max

//if not prepa_faite then
//	prepa_faite = true
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
//end if

end subroutine

on w_dossiers_accords_non_retour.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_1=create st_1
this.st_5=create st_5
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.em_date_max
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.st_4
end on

on w_dossiers_accords_non_retour.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.st_4)
end on

event open;call super::open;em_date_min.text = "01/01/"+string(year(today()))
em_date_max.text = string(today())

end event

type p_fond from w_liste_patients`p_fond within w_dossiers_accords_non_retour
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_dossiers_accords_non_retour
integer taborder = 140
end type

type cb_autre from w_liste_patients`cb_autre within w_dossiers_accords_non_retour
integer taborder = 150
end type

type cb_fermer from w_liste_patients`cb_fermer within w_dossiers_accords_non_retour
end type

type cb_ecran from w_liste_patients`cb_ecran within w_dossiers_accords_non_retour
integer taborder = 80
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_dossiers_accords_non_retour
integer taborder = 40
end type

type uo_size from w_liste_patients`uo_size within w_dossiers_accords_non_retour
integer taborder = 50
end type

type rb_un from w_liste_patients`rb_un within w_dossiers_accords_non_retour
end type

type rb_tous from w_liste_patients`rb_tous within w_dossiers_accords_non_retour
end type

type em_nb from w_liste_patients`em_nb within w_dossiers_accords_non_retour
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_dossiers_accords_non_retour
end type

type em_min from w_liste_patients`em_min within w_dossiers_accords_non_retour
end type

type dw_1 from w_liste_patients`dw_1 within w_dossiers_accords_non_retour
integer taborder = 90
end type

type gb_1 from w_liste_patients`gb_1 within w_dossiers_accords_non_retour
integer taborder = 100
end type

type dw_prati from w_liste_patients`dw_prati within w_dossiers_accords_non_retour
integer taborder = 120
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_dossiers_accords_non_retour
end type

type st_min from w_liste_patients`st_min within w_dossiers_accords_non_retour
end type

type st_max from w_liste_patients`st_max within w_dossiers_accords_non_retour
end type

type dw_liste from w_liste_patients`dw_liste within w_dossiers_accords_non_retour
integer taborder = 70
string dataobject = "dw_dossiers_accords_non_retour"
end type

type em_date_min from editmask within w_dossiers_accords_non_retour
string tag = "a masquer"
integer x = 805
integer y = 944
integer width = 421
integer height = 96
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type em_date_max from editmask within w_dossiers_accords_non_retour
string tag = "a masquer"
integer x = 1682
integer y = 944
integer width = 421
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_1 from statictext within w_dossiers_accords_non_retour
integer x = 347
integer y = 852
integer width = 713
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période de demande :"
end type

type st_5 from statictext within w_dossiers_accords_non_retour
integer x = 512
integer y = 964
integer width = 265
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_4 from statictext within w_dossiers_accords_non_retour
integer x = 1458
integer y = 964
integer width = 192
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

