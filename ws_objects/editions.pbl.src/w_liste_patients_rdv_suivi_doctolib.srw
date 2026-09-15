$PBExportHeader$w_liste_patients_rdv_suivi_doctolib.srw
forward
global type w_liste_patients_rdv_suivi_doctolib from w_liste_patients
end type
type st_23 from statictext within w_liste_patients_rdv_suivi_doctolib
end type
type st_33 from statictext within w_liste_patients_rdv_suivi_doctolib
end type
type st_22 from statictext within w_liste_patients_rdv_suivi_doctolib
end type
type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_suivi_doctolib
end type
type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_suivi_doctolib
end type
type em_heure_modif_min from editmask within w_liste_patients_rdv_suivi_doctolib
end type
type em_heure_modif_max from editmask within w_liste_patients_rdv_suivi_doctolib
end type
type cb_exporter from uo_picturebutton_780x120 within w_liste_patients_rdv_suivi_doctolib
end type
type rb_tous_codes from radiobutton within w_liste_patients_rdv_suivi_doctolib
end type
type rb_un_code from radiobutton within w_liste_patients_rdv_suivi_doctolib
end type
type gb_2 from groupbox within w_liste_patients_rdv_suivi_doctolib
end type
end forward

global type w_liste_patients_rdv_suivi_doctolib from w_liste_patients
string title = "Liste des Rendez-Vous mis à jour entre 2 dates"
st_23 st_23
st_33 st_33
st_22 st_22
em_modif_min em_modif_min
em_modif_max em_modif_max
em_heure_modif_min em_heure_modif_min
em_heure_modif_max em_heure_modif_max
cb_exporter cb_exporter
rb_tous_codes rb_tous_codes
rb_un_code rb_un_code
gb_2 gb_2
end type
global w_liste_patients_rdv_suivi_doctolib w_liste_patients_rdv_suivi_doctolib

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string id_min,id_max,typ,tit,p
double code_min,code_max
date date_min,date_max
datetime modif_min, modif_max
string v_filtre

if not prepa_faite then
//	prepa_faite = true
//	if rb_tous.checked then
//		pra_min="      "
//		pra_max="ZZZZZZ"
//		tit = "Pour tous les praticiens"
//	else
//		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
//		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
//		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
//		tit = "Pour le Dr "+p
//	end if
//
	code_min = double(em_min.text)
	code_max = double(em_max.text)

	modif_min = DateTime (em_modif_min.getTheDate(), time(em_heure_modif_min.text))
	modif_max = DateTime (em_modif_max.getTheDate(), time(em_heure_modif_max.text))
	
	if rb_tous_codes.checked then
		v_filtre = ""
	else
		v_filtre = "orthokis_id = " + em_min.text
	end if
	
	dw_liste.setfilter(v_filtre)
	
//	tit = tit + " RDV entre le "+em_date_min.text+" et le "+em_date_max.text+" - Mis à jour entre le "+em_modif_min.text+" " +em_heure_modif_min.text+ " et le "+em_modif_max.text+" " + em_heure_modif_max.text

	open(w_patience)
	//dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(modif_min,modif_max)
	

		
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Evénements"
	//em_nb.visible = true
	
	cb_exporter.enabled(true)


end if

end subroutine

event open;call super::open;
em_modif_min.SetDate( today())
em_modif_max.SetDate( today())


em_heure_modif_min.text = "00:00"
em_heure_modif_max.text = "23.59"


dw_prati.visible = false



end event

on w_liste_patients_rdv_suivi_doctolib.create
int iCurrent
call super::create
this.st_23=create st_23
this.st_33=create st_33
this.st_22=create st_22
this.em_modif_min=create em_modif_min
this.em_modif_max=create em_modif_max
this.em_heure_modif_min=create em_heure_modif_min
this.em_heure_modif_max=create em_heure_modif_max
this.cb_exporter=create cb_exporter
this.rb_tous_codes=create rb_tous_codes
this.rb_un_code=create rb_un_code
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_23
this.Control[iCurrent+2]=this.st_33
this.Control[iCurrent+3]=this.st_22
this.Control[iCurrent+4]=this.em_modif_min
this.Control[iCurrent+5]=this.em_modif_max
this.Control[iCurrent+6]=this.em_heure_modif_min
this.Control[iCurrent+7]=this.em_heure_modif_max
this.Control[iCurrent+8]=this.cb_exporter
this.Control[iCurrent+9]=this.rb_tous_codes
this.Control[iCurrent+10]=this.rb_un_code
this.Control[iCurrent+11]=this.gb_2
end on

on w_liste_patients_rdv_suivi_doctolib.destroy
call super::destroy
destroy(this.st_23)
destroy(this.st_33)
destroy(this.st_22)
destroy(this.em_modif_min)
destroy(this.em_modif_max)
destroy(this.em_heure_modif_min)
destroy(this.em_heure_modif_max)
destroy(this.cb_exporter)
destroy(this.rb_tous_codes)
destroy(this.rb_un_code)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_suivi_doctolib
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_suivi_doctolib
integer x = 1783
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_suivi_doctolib
integer x = 1307
integer taborder = 120
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled(false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_suivi_doctolib
integer x = 2734
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_suivi_doctolib
integer x = 553
integer taborder = 140
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_suivi_doctolib
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_suivi_doctolib
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_suivi_doctolib
boolean visible = false
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_suivi_doctolib
boolean visible = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_suivi_doctolib
integer x = 18
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_suivi_doctolib
string tag = ""
boolean visible = false
integer x = 2322
integer y = 752
integer width = 695
integer taborder = 50
string text = "99999999999999"
string mask = "############0"
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_suivi_doctolib
string tag = ""
boolean visible = false
integer x = 741
integer y = 948
integer width = 576
integer taborder = 20
string text = "0"
string mask = "############0"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_suivi_doctolib
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_suivi_doctolib
boolean visible = false
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_suivi_doctolib
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_suivi_doctolib
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_suivi_doctolib
boolean visible = false
integer x = 494
integer y = 1224
integer width = 567
string text = "Du Code Interne N°"
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_suivi_doctolib
boolean visible = false
integer x = 1733
integer y = 764
integer width = 567
string text = "Au Code Interne N°"
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_suivi_doctolib
integer y = 0
integer taborder = 90
string dataobject = "dw_liste_patients_rdv_suivi_doctolib"
end type

event dw_liste::doubleclicked;

//
end event

event dw_liste::rbuttondown;


//
end event

event dw_liste::ue_leftbuttonup;

//
end event

type st_23 from statictext within w_liste_patients_rdv_suivi_doctolib
integer x = 347
integer y = 204
integer width = 901
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Période à étudier :"
end type

type st_33 from statictext within w_liste_patients_rdv_suivi_doctolib
integer x = 475
integer y = 388
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

type st_22 from statictext within w_liste_patients_rdv_suivi_doctolib
integer x = 1559
integer y = 388
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_suivi_doctolib
event destroy ( )
integer x = 759
integer y = 380
integer taborder = 180
boolean bringtotop = true
end type

on em_modif_min.destroy
call uo_date_calendrier::destroy
end on

type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_suivi_doctolib
event destroy ( )
integer x = 1742
integer y = 380
integer taborder = 190
boolean bringtotop = true
end type

on em_modif_max.destroy
call uo_date_calendrier::destroy
end on

type em_heure_modif_min from editmask within w_liste_patients_rdv_suivi_doctolib
integer x = 1216
integer y = 380
integer width = 279
integer height = 92
integer taborder = 181
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_heure_modif_max from editmask within w_liste_patients_rdv_suivi_doctolib
integer x = 2199
integer y = 380
integer width = 279
integer height = 92
integer taborder = 191
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type cb_exporter from uo_picturebutton_780x120 within w_liste_patients_rdv_suivi_doctolib
integer x = 2258
integer y = 1868
integer width = 457
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string text = "Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type rb_tous_codes from radiobutton within w_liste_patients_rdv_suivi_doctolib
integer x = 489
integer y = 804
integer width = 270
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
string text = "Tous"
boolean checked = true
end type

event clicked;em_min.visible = false

end event

type rb_un_code from radiobutton within w_liste_patients_rdv_suivi_doctolib
integer x = 489
integer y = 956
integer width = 215
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
string text = "Un"
end type

event clicked;em_min.visible = true
end event

type gb_2 from groupbox within w_liste_patients_rdv_suivi_doctolib
integer x = 347
integer y = 700
integer width = 1733
integer height = 384
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection par Code Interne Orthokis"
end type

