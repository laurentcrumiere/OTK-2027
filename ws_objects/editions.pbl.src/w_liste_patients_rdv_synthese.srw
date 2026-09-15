$PBExportHeader$w_liste_patients_rdv_synthese.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_rdv_synthese from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_rdv_synthese
end type
type st_2 from statictext within w_liste_patients_rdv_synthese
end type
type st_3 from statictext within w_liste_patients_rdv_synthese
end type
type em_date_min from uo_date_calendrier within w_liste_patients_rdv_synthese
end type
type em_date_max from uo_date_calendrier within w_liste_patients_rdv_synthese
end type
type em_time_min from editmask within w_liste_patients_rdv_synthese
end type
type em_time_max from editmask within w_liste_patients_rdv_synthese
end type
type em_faut_min from editmask within w_liste_patients_rdv_synthese
end type
type em_faut_max from editmask within w_liste_patients_rdv_synthese
end type
type st_4 from statictext within w_liste_patients_rdv_synthese
end type
type st_5 from statictext within w_liste_patients_rdv_synthese
end type
type st_6 from statictext within w_liste_patients_rdv_synthese
end type
end forward

global type w_liste_patients_rdv_synthese from w_liste_patients
string title = "Synthèse des Rendez-vous entre 2 dates"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
em_time_min em_time_min
em_time_max em_time_max
em_faut_min em_faut_min
em_faut_max em_faut_max
st_4 st_4
st_5 st_5
st_6 st_6
end type
global w_liste_patients_rdv_synthese w_liste_patients_rdv_synthese

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
string pra_min,pra_max,typ,tit,p
double code_min,code_max
datetime date_min,date_max
integer faut_min, faut_max

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

	faut_min = integer(em_faut_min.text)
	faut_max = integer(em_faut_max.text)

	date_min = datetime(date(em_date_min.text), time(em_time_min.text))
	date_max = datetime(date(em_date_max.text), time(em_time_max.text))

	open(w_patience)
	dw_liste.retrieve(date_min, date_max,pra_min,pra_max, faut_min, faut_max)
	close(w_patience)


end if

end subroutine

event open;call super::open;em_date_max.setDate(today())
em_date_min.setDate(date(year(today()),1,1))

end event

on w_liste_patients_rdv_synthese.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.em_time_min=create em_time_min
this.em_time_max=create em_time_max
this.em_faut_min=create em_faut_min
this.em_faut_max=create em_faut_max
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.em_time_min
this.Control[iCurrent+7]=this.em_time_max
this.Control[iCurrent+8]=this.em_faut_min
this.Control[iCurrent+9]=this.em_faut_max
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_5
this.Control[iCurrent+12]=this.st_6
end on

on w_liste_patients_rdv_synthese.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.em_time_min)
destroy(this.em_time_max)
destroy(this.em_faut_min)
destroy(this.em_faut_max)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_synthese
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_synthese
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_synthese
end type

event cb_autre::clicked;call super::clicked;st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_synthese
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_synthese
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_synthese
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_synthese
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_synthese
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_synthese
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_synthese
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_synthese
boolean visible = false
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_synthese
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_synthese
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_synthese
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_synthese
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_synthese
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_synthese
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_synthese
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_synthese
integer y = 0
integer taborder = 80
string dataobject = "dw_agenda_analyse_type_rdv"
end type

event dw_liste::rbuttondown;

//
end event

event dw_liste::doubleclicked;
//
end event

type st_1 from statictext within w_liste_patients_rdv_synthese
integer x = 347
integer y = 800
integer width = 457
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_rdv_synthese
integer x = 1554
integer y = 900
integer width = 206
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

type st_3 from statictext within w_liste_patients_rdv_synthese
integer x = 475
integer y = 908
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

type em_date_min from uo_date_calendrier within w_liste_patients_rdv_synthese
integer x = 818
integer y = 892
integer taborder = 240
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_rdv_synthese
integer x = 1774
integer y = 892
integer taborder = 250
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_time_min from editmask within w_liste_patients_rdv_synthese
integer x = 1271
integer y = 892
integer width = 261
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_time_max from editmask within w_liste_patients_rdv_synthese
integer x = 2226
integer y = 892
integer width = 261
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_faut_min from editmask within w_liste_patients_rdv_synthese
integer x = 640
integer y = 1276
integer width = 247
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type em_faut_max from editmask within w_liste_patients_rdv_synthese
integer x = 1070
integer y = 1280
integer width = 247
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "99"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type st_4 from statictext within w_liste_patients_rdv_synthese
integer x = 914
integer y = 1288
integer width = 119
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au"
alignment alignment = center!
end type

type st_5 from statictext within w_liste_patients_rdv_synthese
integer x = 347
integer y = 1180
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Fauteuils :"
end type

type st_6 from statictext within w_liste_patients_rdv_synthese
integer x = 475
integer y = 1288
integer width = 119
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du "
alignment alignment = center!
end type

