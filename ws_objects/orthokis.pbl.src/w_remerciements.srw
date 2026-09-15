$PBExportHeader$w_remerciements.srw
forward
global type w_remerciements from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_remerciements
end type
type cb_imprimer from uo_picturebutton_390x120 within w_remerciements
end type
type cb_autre from uo_picturebutton_390x120 within w_remerciements
end type
type uo_edition from uo_edition_rtf within w_remerciements
end type
type uo_1 from resize_fenetre within w_remerciements
end type
type rb_3 from radiobutton within w_remerciements
end type
type rb_2 from radiobutton within w_remerciements
end type
type rb_1 from radiobutton within w_remerciements
end type
type sle_corresp from singlelineedit within w_remerciements
end type
type st_4 from statictext within w_remerciements
end type
type st_1 from statictext within w_remerciements
end type
type sle_enfant from singlelineedit within w_remerciements
end type
type gb_3 from groupbox within w_remerciements
end type
end forward

global type w_remerciements from w_fenetre_arakis
integer x = 64
integer y = 100
integer width = 2885
integer height = 1464
string title = "Edition de lettres de remerciements"
long backcolor = 15780518
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
uo_edition uo_edition
uo_1 uo_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
sle_corresp sle_corresp
st_4 st_4
st_1 st_1
sle_enfant sle_enfant
gb_3 gb_3
end type
global w_remerciements w_remerciements

type variables
double var_code_local
string var_nom_local
double var_num_dossier_local
end variables

event open;call super::open;string v_cor

var_code_local = var_code
var_nom_local = var_nom
var_num_dossier_local = var_numero_dossier


sle_enfant.text = var_nom_local + " ("+string(var_num_dossier_local)+")"

  SELECT "correspondants"."nom"  
    INTO :v_cor  
    FROM "correspondants",   
         "patient"  
   WHERE ( "correspondants"."code" = "patient"."code_correspondant" ) and  
         ( ( "patient"."code" = :var_code_local ) )   ;

sle_corresp.text = v_cor
uo_1.taille(this)


end event

on w_remerciements.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.uo_edition=create uo_edition
this.uo_1=create uo_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.sle_corresp=create sle_corresp
this.st_4=create st_4
this.st_1=create st_1
this.sle_enfant=create sle_enfant
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.rb_1
this.Control[iCurrent+9]=this.sle_corresp
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.sle_enfant
this.Control[iCurrent+13]=this.gb_3
end on

on w_remerciements.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.uo_edition)
destroy(this.uo_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.sle_corresp)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.sle_enfant)
destroy(this.gb_3)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_remerciements
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_remerciements
integer x = 1577
integer y = 1068
integer taborder = 30
end type

type cb_imprimer from uo_picturebutton_390x120 within w_remerciements
integer x = 1143
integer y = 1068
integer taborder = 40
string text = "&Imprimer"
boolean default = true
end type

event clicked;call super::clicked;datastore dw_donnees

// Récupération des données
dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_remerciement"
dw_donnees.SetTransObject(SQLCA)
dw_donnees.Retrieve(var_code)

// Edition proprement dite

if rb_1.checked then
	uo_edition.edition(dw_donnees,"lettre_remerciement1", false, "")
	ajout_histo_editions(var_code_local,"REMER1",today(),"Dest : "+sle_corresp.text)
END IF	 

if rb_2.checked then
	uo_edition.edition(dw_donnees,"lettre_remerciement2", false, "")
	ajout_histo_editions(var_code_local,"REMER2",today(),"Dest : "+sle_corresp.text)
END IF	 

if rb_3.checked then
	uo_edition.edition(dw_donnees,"lettre_remerciement3", false, "")
	ajout_histo_editions(var_code_local,"REMER3",today(),"Dest : "+sle_corresp.text)
END IF	 

//suprime le datastore de la mémoire
destroy dw_donnees
end event

type cb_autre from uo_picturebutton_390x120 within w_remerciements
integer x = 709
integer y = 1068
integer width = 411
integer height = 152
integer taborder = 30
string text = "&Autre"
end type

event clicked;call super::clicked;var_suite = false

//open(w_cherche)
guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then
	string v_cor

	var_code_local = var_code
	var_nom_local = var_nom

	sle_enfant.text = var_nom_local + " ("+string(var_code_local)+")"

	  SELECT "correspondants"."nom"  
	    INTO :v_cor  
   	 FROM "correspondants",   
   	      "patient"  
   	WHERE ( "correspondants"."code" = "patient"."code_correspondant" ) and  
   	      ( ( "patient"."code" = :var_code_local ) )   ;

	sle_corresp.text = v_cor
end if
end event

type uo_edition from uo_edition_rtf within w_remerciements
event destroy ( )
boolean visible = false
integer x = 1426
integer taborder = 10
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type uo_1 from resize_fenetre within w_remerciements
boolean visible = false
integer y = 240
integer taborder = 30
boolean border = false
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type rb_3 from radiobutton within w_remerciements
integer x = 1024
integer y = 672
integer width = 603
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lettre N°3   "
end type

type rb_2 from radiobutton within w_remerciements
integer x = 1024
integer y = 584
integer width = 603
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lettre N°2   "
end type

type rb_1 from radiobutton within w_remerciements
integer x = 1024
integer y = 496
integer width = 603
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lettre N°1   "
boolean checked = true
end type

type sle_corresp from singlelineedit within w_remerciements
integer x = 626
integer y = 32
integer width = 1554
integer height = 96
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_remerciements
integer x = 155
integer y = 152
integer width = 407
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "A propos de :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_remerciements
integer x = 155
integer y = 48
integer width = 384
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Lettre pour :"
boolean focusrectangle = false
end type

type sle_enfant from singlelineedit within w_remerciements
integer x = 626
integer y = 148
integer width = 1554
integer height = 96
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_remerciements
integer x = 832
integer y = 400
integer width = 951
integer height = 416
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Modèle de lettre "
end type

