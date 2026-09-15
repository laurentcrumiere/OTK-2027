$PBExportHeader$w_tableau_bord_debut_selon_rdv.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_tableau_bord_debut_selon_rdv from w_liste_patients
end type
type st_1 from statictext within w_tableau_bord_debut_selon_rdv
end type
type st_2 from statictext within w_tableau_bord_debut_selon_rdv
end type
type st_3 from statictext within w_tableau_bord_debut_selon_rdv
end type
type em_date_max from uo_date_calendrier within w_tableau_bord_debut_selon_rdv
end type
type em_date_min from uo_date_calendrier within w_tableau_bord_debut_selon_rdv
end type
type st_4 from statictext within w_tableau_bord_debut_selon_rdv
end type
type dw_type from datawindow within w_tableau_bord_debut_selon_rdv
end type
end forward

global type w_tableau_bord_debut_selon_rdv from w_liste_patients
string title = "Tableau de Bord : Type de rdv / Début de Traitement"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_max em_date_max
em_date_min em_date_min
st_4 st_4
dw_type dw_type
end type
global w_tableau_bord_debut_selon_rdv w_tableau_bord_debut_selon_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p,dos_min,dos_max, type_rdv
double code_min,code_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
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

	type_rdv = dw_type.getitemstring(dw_type.getrow(),"code")
	SELECT nom INTO :p FROM type_rdv WHERE code = :type_rdv ;
	tit = tit + " - Type de rendez-vous : "+p

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	
	
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,type_rdv)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true


end if

end subroutine

event open;call super::open;em_min.text = "-99999999"
em_max.text = "999999999"

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_type.settransobject(SQLCA)
dw_type.retrieve() 
end event

on w_tableau_bord_debut_selon_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.st_4=create st_4
this.dw_type=create dw_type
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_max
this.Control[iCurrent+5]=this.em_date_min
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.dw_type
end on

on w_tableau_bord_debut_selon_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.st_4)
destroy(this.dw_type)
end on

type p_fond from w_liste_patients`p_fond within w_tableau_bord_debut_selon_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_debut_selon_rdv
integer x = 1833
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_debut_selon_rdv
integer x = 1317
integer taborder = 90
end type

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_debut_selon_rdv
integer x = 2350
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_debut_selon_rdv
integer taborder = 80
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_debut_selon_rdv
integer taborder = 60
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_debut_selon_rdv
integer taborder = 70
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_debut_selon_rdv
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_debut_selon_rdv
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_debut_selon_rdv
integer taborder = 130
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_debut_selon_rdv
integer y = 408
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_debut_selon_rdv
integer y = 408
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_debut_selon_rdv
integer taborder = 120
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_debut_selon_rdv
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_debut_selon_rdv
integer x = 1243
integer y = 200
integer taborder = 150
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_debut_selon_rdv
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_debut_selon_rdv
integer y = 420
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_debut_selon_rdv
integer y = 420
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_debut_selon_rdv
integer y = 4
integer taborder = 140
string dataobject = "dw_tableau_bord_debut_selon_rdv"
end type

event dw_liste::rbuttondown;//
end event

event dw_liste::clicked;//
end event

event dw_liste::doubleclicked;//

end event

type st_1 from statictext within w_tableau_bord_debut_selon_rdv
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
boolean enabled = false
string text = "Date de rendez-vous :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_tableau_bord_debut_selon_rdv
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
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_tableau_bord_debut_selon_rdv
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
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type em_date_max from uo_date_calendrier within w_tableau_bord_debut_selon_rdv
string tag = "a masquer no resizeall"
integer x = 1678
integer y = 700
integer taborder = 40
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_date_min from uo_date_calendrier within w_tableau_bord_debut_selon_rdv
string tag = "a masquer no resizeall"
integer x = 864
integer y = 700
integer taborder = 30
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_4 from statictext within w_tableau_bord_debut_selon_rdv
integer x = 347
integer y = 972
integer width = 654
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Type de rendez-vous :"
boolean focusrectangle = false
end type

type dw_type from datawindow within w_tableau_bord_debut_selon_rdv
string tag = "no resizeall brush"
integer x = 1070
integer y = 964
integer width = 1006
integer height = 84
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_type_rdv"
boolean border = false
boolean livescroll = true
end type

