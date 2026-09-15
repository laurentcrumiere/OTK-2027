$PBExportHeader$w_sms_histo.srw
forward
global type w_sms_histo from w_liste_patients
end type
type uo_poc from uo_pocket within w_sms_histo
end type
type st_1 from statictext within w_sms_histo
end type
type st_2 from statictext within w_sms_histo
end type
type em_date_min from uo_date_calendrier within w_sms_histo
end type
type st_3 from statictext within w_sms_histo
end type
type em_date_max from uo_date_calendrier within w_sms_histo
end type
type st_7 from statictext within w_sms_histo
end type
type st_5 from statictext within w_sms_histo
end type
type em_date_envoi_min from uo_date_calendrier within w_sms_histo
end type
type em_date_envoi_max from uo_date_calendrier within w_sms_histo
end type
type st_6 from statictext within w_sms_histo
end type
end forward

global type w_sms_histo from w_liste_patients
string title = "Suivi des envois Directs de SMS"
uo_poc uo_poc
st_1 st_1
st_2 st_2
em_date_min em_date_min
st_3 st_3
em_date_max em_date_max
st_7 st_7
st_5 st_5
em_date_envoi_min em_date_envoi_min
em_date_envoi_max em_date_envoi_max
st_6 st_6
end type
global w_sms_histo w_sms_histo

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
date v_date_min, v_date_max, v_date_envoi_min, v_date_envoi_max

if not prepa_faite then
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	v_date_min = date(em_date_min.text)
	v_date_max = date(em_date_max.text)

	v_date_envoi_min = date(em_date_envoi_min.text)
	v_date_envoi_max = date(em_date_envoi_max.text)
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max, code_min,code_max, v_date_min, v_date_max, v_date_envoi_min, v_date_envoi_max)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" SMS"
	em_nb.visible = true
	
	
end if

end subroutine

on w_sms_histo.create
int iCurrent
call super::create
this.uo_poc=create uo_poc
this.st_1=create st_1
this.st_2=create st_2
this.em_date_min=create em_date_min
this.st_3=create st_3
this.em_date_max=create em_date_max
this.st_7=create st_7
this.st_5=create st_5
this.em_date_envoi_min=create em_date_envoi_min
this.em_date_envoi_max=create em_date_envoi_max
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_poc
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date_max
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.em_date_envoi_min
this.Control[iCurrent+10]=this.em_date_envoi_max
this.Control[iCurrent+11]=this.st_6
end on

on w_sms_histo.destroy
call super::destroy
destroy(this.uo_poc)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_date_min)
destroy(this.st_3)
destroy(this.em_date_max)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.em_date_envoi_min)
destroy(this.em_date_envoi_max)
destroy(this.st_6)
end on

event open;call super::open;

em_min.text = string(min)


em_date_min.SetDate( date(  year(today()), month(today()) , 1))
em_date_max.setdate(relativedate(today(), 31))



em_date_envoi_min.SetDate( date(  year(today()), month(today()) , 1))
em_date_envoi_max.setdate(today())


end event

type p_fond from w_liste_patients`p_fond within w_sms_histo
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_sms_histo
end type

type cb_autre from w_liste_patients`cb_autre within w_sms_histo
end type

type cb_fermer from w_liste_patients`cb_fermer within w_sms_histo
end type

type cb_ecran from w_liste_patients`cb_ecran within w_sms_histo
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_sms_histo
end type

type uo_size from w_liste_patients`uo_size within w_sms_histo
end type

type rb_un from w_liste_patients`rb_un within w_sms_histo
end type

type rb_tous from w_liste_patients`rb_tous within w_sms_histo
end type

type em_nb from w_liste_patients`em_nb within w_sms_histo
end type

type em_max from w_liste_patients`em_max within w_sms_histo
end type

type em_min from w_liste_patients`em_min within w_sms_histo
end type

type dw_1 from w_liste_patients`dw_1 within w_sms_histo
end type

type gb_1 from w_liste_patients`gb_1 within w_sms_histo
end type

type dw_prati from w_liste_patients`dw_prati within w_sms_histo
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_sms_histo
end type

type st_min from w_liste_patients`st_min within w_sms_histo
end type

type st_max from w_liste_patients`st_max within w_sms_histo
end type

type dw_liste from w_liste_patients`dw_liste within w_sms_histo
string dataobject = "dw_sms_liste_histo"
end type

event dw_liste::buttonclicked;call super::buttonclicked;

m_suivi_sms m


//création du menu en mémoire
m = create m_suivi_sms

m.w_clic = parent
m.dw_clic = this
m.PopMenu(this.pointerX(),this.pointerY())

//supression du menu de la mémoire
destroy m

end event

type uo_poc from uo_pocket within w_sms_histo
boolean visible = false
integer x = 457
integer y = 1516
integer taborder = 30
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

type st_1 from statictext within w_sms_histo
integer x = 347
integer y = 852
integer width = 850
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date du SMS / Rendez-vous :"
end type

type st_2 from statictext within w_sms_histo
integer x = 480
integer y = 972
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

type em_date_min from uo_date_calendrier within w_sms_histo
integer x = 818
integer y = 952
integer taborder = 270
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_3 from statictext within w_sms_histo
integer x = 1326
integer y = 972
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

type em_date_max from uo_date_calendrier within w_sms_histo
integer x = 1623
integer y = 952
integer taborder = 280
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_7 from statictext within w_sms_histo
integer x = 352
integer y = 1176
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date d~'envoi :"
end type

type st_5 from statictext within w_sms_histo
integer x = 485
integer y = 1280
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

type em_date_envoi_min from uo_date_calendrier within w_sms_histo
integer x = 818
integer y = 1276
integer taborder = 280
boolean bringtotop = true
end type

on em_date_envoi_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_envoi_max from uo_date_calendrier within w_sms_histo
integer x = 1623
integer y = 1276
integer taborder = 290
boolean bringtotop = true
end type

on em_date_envoi_max.destroy
call uo_date_calendrier::destroy
end on

type st_6 from statictext within w_sms_histo
integer x = 1330
integer y = 1280
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

