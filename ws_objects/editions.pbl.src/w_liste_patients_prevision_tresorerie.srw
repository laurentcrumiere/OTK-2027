$PBExportHeader$w_liste_patients_prevision_tresorerie.srw
forward
global type w_liste_patients_prevision_tresorerie from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_prevision_tresorerie
end type
type st_2 from statictext within w_liste_patients_prevision_tresorerie
end type
type st_3 from statictext within w_liste_patients_prevision_tresorerie
end type
type em_date_min from uo_date_calendrier within w_liste_patients_prevision_tresorerie
end type
type em_date_max from uo_date_calendrier within w_liste_patients_prevision_tresorerie
end type
end forward

global type w_liste_patients_prevision_tresorerie from w_liste_patients
string title = "Prévision de Trésorerie"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
end type
global w_liste_patients_prevision_tresorerie w_liste_patients_prevision_tresorerie

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_pra,tit,np
double code_min,code_max
date date_min,date_max

var_pra = dw_prati.getitemstring(dw_prati.getrow(),"code")


if not prepa_faite then
	ok_mdp = false

  SELECT "prati"."pasfin",  "prati"."nom"  
    INTO :pasfin,:np  
    FROM "prati"  
   WHERE ( "prati"."code" = :var_pra ) ;

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
	if ok_mdp then
	
		//prepa_faite = true

		code_min = double(em_min.text)
		code_max = double(em_max.text)

		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)

		tit = "Entre le "+em_date_min.text+" et le "+em_date_max.text+" Pour le Dr "+NP
		open(w_patience)
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,var_pra,date_min,date_max)
		close(w_patience)
		//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
		//em_nb.visible = true
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(fin_mois_suivant(today()))
 
end event

on w_liste_patients_prevision_tresorerie.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
end on

on w_liste_patients_prevision_tresorerie.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_prevision_tresorerie
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_prevision_tresorerie
integer taborder = 90
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_prevision_tresorerie
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_prevision_tresorerie
integer taborder = 100
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_prevision_tresorerie
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_prevision_tresorerie
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_prevision_tresorerie
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_prevision_tresorerie
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_prevision_tresorerie
boolean enabled = false
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_prevision_tresorerie
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_prevision_tresorerie
integer y = 616
end type

type em_min from w_liste_patients`em_min within w_liste_patients_prevision_tresorerie
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_prevision_tresorerie
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_prevision_tresorerie
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_prevision_tresorerie
boolean visible = true
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_prevision_tresorerie
end type

type st_min from w_liste_patients`st_min within w_liste_patients_prevision_tresorerie
end type

type st_max from w_liste_patients`st_max within w_liste_patients_prevision_tresorerie
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_prevision_tresorerie
integer y = 0
integer taborder = 70
string dataobject = "dw_liste_patients_prevision_edition"
end type

type st_1 from statictext within w_liste_patients_prevision_tresorerie
integer x = 347
integer y = 840
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements à recevoir :"
end type

type st_2 from statictext within w_liste_patients_prevision_tresorerie
integer x = 480
integer y = 960
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_3 from statictext within w_liste_patients_prevision_tresorerie
integer x = 1335
integer y = 960
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type em_date_min from uo_date_calendrier within w_liste_patients_prevision_tresorerie
integer x = 814
integer y = 952
integer taborder = 240
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_prevision_tresorerie
integer x = 1618
integer y = 952
integer taborder = 250
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

