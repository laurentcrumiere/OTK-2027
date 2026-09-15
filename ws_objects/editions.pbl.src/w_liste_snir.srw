$PBExportHeader$w_liste_snir.srw
forward
global type w_liste_snir from w_liste_patients
end type
type st_1 from statictext within w_liste_snir
end type
type st_2 from statictext within w_liste_snir
end type
type st_3 from statictext within w_liste_snir
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_snir
end type
type em_date_max from uo_date_calendrier within w_liste_snir
end type
type em_date_min from uo_date_calendrier within w_liste_snir
end type
type cbx_detail from checkbox within w_liste_snir
end type
end forward

global type w_liste_snir from w_liste_patients
string title = "Edition du SNIR"
st_1 st_1
st_2 st_2
st_3 st_3
cb_exporter cb_exporter
em_date_max em_date_max
em_date_min em_date_min
cbx_detail cbx_detail
end type
global w_liste_snir w_liste_snir

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,np,tit
date date_min,date_max
double nblig,cpt


if not prepa_faite then

	ok_mdp = false

	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

  SELECT pasfin, nom
    INTO :pasfin , :np
    FROM prati  
   WHERE code = :pra_min ;

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
		//prepa_faite = true

		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)

		Tit = "Pour le Dr "+np 
		tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text

		open(w_patience)
		dw_liste.retrieve(pra_min,pra_max,date_min,date_max)
		nblig = dw_liste.rowcount()
		FOR cpt=1 TO nblig
			dw_liste.setitem(cpt,"titre",tit)
		NEXT

		close(w_patience)

//		em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//		em_nb.visible = true
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()), 1 , 1))
em_date_max.setDate(today()) 

if not france then
	dw_liste.dataobject = "dw_snir_belgique"
end if

dw_liste.settransobject(sqlca)
end event

on w_liste_snir.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.cb_exporter=create cb_exporter
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.cbx_detail=create cbx_detail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.cb_exporter
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.cbx_detail
end on

on w_liste_snir.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cb_exporter)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.cbx_detail)
end on

type p_fond from w_liste_patients`p_fond within w_liste_snir
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_snir
integer x = 2286
integer y = 1872
integer taborder = 90
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_snir
integer x = 1819
integer y = 1872
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_snir
integer x = 3218
integer y = 1872
integer taborder = 100
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_snir
integer x = 1353
integer y = 1872
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)


end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_snir
integer x = 2734
end type

type uo_size from w_liste_patients`uo_size within w_liste_snir
end type

type rb_un from w_liste_patients`rb_un within w_liste_snir
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_snir
boolean enabled = false
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_snir
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_snir
boolean visible = false
end type

type em_min from w_liste_patients`em_min within w_liste_snir
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_snir
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_snir
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_snir
boolean visible = true
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_snir
end type

type st_min from w_liste_patients`st_min within w_liste_snir
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_snir
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_snir
integer x = 5
integer y = 20
integer width = 3607
integer taborder = 70
string dataobject = "dw_snir"
end type

type st_1 from statictext within w_liste_snir
integer x = 347
integer y = 832
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Période à analyser :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_snir
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
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_snir
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
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_snir
integer x = 2752
integer y = 1872
integer width = 457
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;
dw_liste.saveas()
end event

type em_date_max from uo_date_calendrier within w_liste_snir
string tag = "a masquer no resizeall"
integer x = 1664
integer y = 932
integer taborder = 240
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_date_min from uo_date_calendrier within w_liste_snir
string tag = "a masquer no resizeall"
integer x = 850
integer y = 932
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type cbx_detail from checkbox within w_liste_snir
integer x = 690
integer y = 1888
integer width = 654
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Avec le détail patient"
end type

event clicked;if checked then
	//dw_liste.SetDetailHeight ( 1 , dw_liste.rowcount() , 70 )
	dw_liste.object.datawindow.detail.height = 70
else
	//dw_liste.SetDetailHeight ( 1 , dw_liste.rowcount() , 0 )
	dw_liste.object.datawindow.detail.height = 0
end if
end event

