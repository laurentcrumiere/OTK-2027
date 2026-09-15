$PBExportHeader$w_liste_analyse_soins_en_cours.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_analyse_soins_en_cours from w_liste_patients
end type
type em_date from editmask within w_liste_analyse_soins_en_cours
end type
type st_3 from statictext within w_liste_analyse_soins_en_cours
end type
type em_date_max from editmask within w_liste_analyse_soins_en_cours
end type
type rb_detaillee from radiobutton within w_liste_analyse_soins_en_cours
end type
type rb_soins_suivis from radiobutton within w_liste_analyse_soins_en_cours
end type
type gb_type from groupbox within w_liste_analyse_soins_en_cours
end type
end forward

global type w_liste_analyse_soins_en_cours from w_liste_patients
string title = "Analyse des soins en cours"
em_date em_date
st_3 st_3
em_date_max em_date_max
rb_detaillee rb_detaillee
rb_soins_suivis rb_soins_suivis
gb_type gb_type
end type
global w_liste_analyse_soins_en_cours w_liste_analyse_soins_en_cours

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra,np,tit
date da
double nblig,cpt


if not prepa_faite then

	ok_mdp = false

	pra = dw_prati.getitemstring(dw_prati.getrow(),"code")

  SELECT pasfin, nom
    INTO :pasfin , :np
    FROM prati  
   WHERE code = :pra ;

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
	dw_liste.modify("titre.text = ''")

	if ok_mdp then
		//prepa_faite = true
		
		// Analyse détaillée ou pas ...
		
		if rb_detaillee.checked then
			dw_liste.dataobject = "dw_analyse_soins_en_cours_detaillee"
		else
			dw_liste.dataobject = "dw_analyse_soins_en_cours"
		end if
		dw_liste.settransobject(sqlca)
		
		// reconfiguration des filtres car bug sinon
		iu_PowerFilter.of_setdw(dw_liste)

	
		da = date(em_date.text)

		Tit = "Pour le Dr "+np 
		tit = tit +" Date de référence "+em_date.text

		open(w_patience)
		dw_liste.modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(pra,da)

		close(w_patience)

	end if
end if

end subroutine

event open;call super::open;em_date.text = string(today())


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if not verif_meme_mot_de_passe_praticien() then 
		// Pas le même mot de passe => pas pour tous
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
end if

end event

on w_liste_analyse_soins_en_cours.create
int iCurrent
call super::create
this.em_date=create em_date
this.st_3=create st_3
this.em_date_max=create em_date_max
this.rb_detaillee=create rb_detaillee
this.rb_soins_suivis=create rb_soins_suivis
this.gb_type=create gb_type
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.em_date_max
this.Control[iCurrent+4]=this.rb_detaillee
this.Control[iCurrent+5]=this.rb_soins_suivis
this.Control[iCurrent+6]=this.gb_type
end on

on w_liste_analyse_soins_en_cours.destroy
call super::destroy
destroy(this.em_date)
destroy(this.st_3)
destroy(this.em_date_max)
destroy(this.rb_detaillee)
destroy(this.rb_soins_suivis)
destroy(this.gb_type)
end on

type p_fond from w_liste_patients`p_fond within w_liste_analyse_soins_en_cours
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_analyse_soins_en_cours
integer taborder = 90
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_analyse_soins_en_cours
end type

event cb_autre::clicked;call super::clicked;

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_analyse_soins_en_cours
integer taborder = 100
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_analyse_soins_en_cours
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_analyse_soins_en_cours
end type

type uo_size from w_liste_patients`uo_size within w_liste_analyse_soins_en_cours
end type

type rb_un from w_liste_patients`rb_un within w_liste_analyse_soins_en_cours
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_analyse_soins_en_cours
boolean enabled = false
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_analyse_soins_en_cours
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_analyse_soins_en_cours
boolean visible = false
end type

type em_min from w_liste_patients`em_min within w_liste_analyse_soins_en_cours
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_analyse_soins_en_cours
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_analyse_soins_en_cours
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_analyse_soins_en_cours
boolean visible = true
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_analyse_soins_en_cours
end type

type st_min from w_liste_patients`st_min within w_liste_analyse_soins_en_cours
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_analyse_soins_en_cours
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_analyse_soins_en_cours
integer y = 20
integer taborder = 70
string dataobject = "dw_analyse_soins_en_cours"
end type

event dw_liste::rbuttondown;

//

end event

event dw_liste::doubleclicked;

// 
end event

type em_date from editmask within w_liste_analyse_soins_en_cours
integer x = 1120
integer y = 944
integer width = 421
integer height = 96
integer taborder = 30
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

type st_3 from statictext within w_liste_analyse_soins_en_cours
integer x = 475
integer y = 956
integer width = 631
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de Référence :"
end type

type em_date_max from editmask within w_liste_analyse_soins_en_cours
boolean visible = false
integer x = 1682
integer y = 944
integer width = 421
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type rb_detaillee from radiobutton within w_liste_analyse_soins_en_cours
integer x = 489
integer y = 1356
integer width = 402
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
string text = "Détaillée"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

type rb_soins_suivis from radiobutton within w_liste_analyse_soins_en_cours
integer x = 489
integer y = 1452
integer width = 722
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
string text = "Selon les Soins Suivis"
borderstyle borderstyle = styleraised!
end type

type gb_type from groupbox within w_liste_analyse_soins_en_cours
integer x = 389
integer y = 1260
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Type d~'analyse"
borderstyle borderstyle = styleraised!
end type

