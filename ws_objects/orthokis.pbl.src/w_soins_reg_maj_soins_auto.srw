$PBExportHeader$w_soins_reg_maj_soins_auto.srw
forward
global type w_soins_reg_maj_soins_auto from w_fenetre_arakis
end type
type cb_ajouter_auto from uo_picturebutton_390x120 within w_soins_reg_maj_soins_auto
end type
type cb_annuler_auto from uo_picturebutton_390x120 within w_soins_reg_maj_soins_auto
end type
type dw_auto from datawindow within w_soins_reg_maj_soins_auto
end type
type st_auto2 from statictext within w_soins_reg_maj_soins_auto
end type
type st_auto1 from statictext within w_soins_reg_maj_soins_auto
end type
type em_deb from editmask within w_soins_reg_maj_soins_auto
end type
type st_auto3 from statictext within w_soins_reg_maj_soins_auto
end type
type em_deb_num from editmask within w_soins_reg_maj_soins_auto
end type
type rb_echeances_flottantes from radiobutton within w_soins_reg_maj_soins_auto
end type
type rb_echeances_fixes from radiobutton within w_soins_reg_maj_soins_auto
end type
type em_jour_fixe from editmask within w_soins_reg_maj_soins_auto
end type
type cbx_forcer_echeance from checkbox within w_soins_reg_maj_soins_auto
end type
type gb_1 from groupbox within w_soins_reg_maj_soins_auto
end type
end forward

global type w_soins_reg_maj_soins_auto from w_fenetre_arakis
integer width = 2784
integer height = 1292
string title = "Ajout d~'un Soin Automatique"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_ajouter_auto cb_ajouter_auto
cb_annuler_auto cb_annuler_auto
dw_auto dw_auto
st_auto2 st_auto2
st_auto1 st_auto1
em_deb em_deb
st_auto3 st_auto3
em_deb_num em_deb_num
rb_echeances_flottantes rb_echeances_flottantes
rb_echeances_fixes rb_echeances_fixes
em_jour_fixe em_jour_fixe
cbx_forcer_echeance cbx_forcer_echeance
gb_1 gb_1
end type
global w_soins_reg_maj_soins_auto w_soins_reg_maj_soins_auto

type variables
// Fenetre appelante !!
w_soins_reg_maj w_soins_reg_maj_parent

char action, type_gestion

double var_code_local

// Dw de la fenetre appelante
datawindow dw_soins, dw_soins_prevus

integer var_code_devis_local 	// devis courant - sélectionné

string is_mode_reglement_habituel = ""

end variables

forward prototypes
public subroutine visibilite_cbx_forcer_echeance ()
end prototypes

public subroutine visibilite_cbx_forcer_echeance ();
if rb_echeances_fixes.checked and is_mode_reglement_habituel = "R" then 
	cbx_forcer_echeance.visible = true
else
	cbx_forcer_echeance.visible = false
	cbx_forcer_echeance.checked = false
end if

end subroutine

on w_soins_reg_maj_soins_auto.create
int iCurrent
call super::create
this.cb_ajouter_auto=create cb_ajouter_auto
this.cb_annuler_auto=create cb_annuler_auto
this.dw_auto=create dw_auto
this.st_auto2=create st_auto2
this.st_auto1=create st_auto1
this.em_deb=create em_deb
this.st_auto3=create st_auto3
this.em_deb_num=create em_deb_num
this.rb_echeances_flottantes=create rb_echeances_flottantes
this.rb_echeances_fixes=create rb_echeances_fixes
this.em_jour_fixe=create em_jour_fixe
this.cbx_forcer_echeance=create cbx_forcer_echeance
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ajouter_auto
this.Control[iCurrent+2]=this.cb_annuler_auto
this.Control[iCurrent+3]=this.dw_auto
this.Control[iCurrent+4]=this.st_auto2
this.Control[iCurrent+5]=this.st_auto1
this.Control[iCurrent+6]=this.em_deb
this.Control[iCurrent+7]=this.st_auto3
this.Control[iCurrent+8]=this.em_deb_num
this.Control[iCurrent+9]=this.rb_echeances_flottantes
this.Control[iCurrent+10]=this.rb_echeances_fixes
this.Control[iCurrent+11]=this.em_jour_fixe
this.Control[iCurrent+12]=this.cbx_forcer_echeance
this.Control[iCurrent+13]=this.gb_1
end on

on w_soins_reg_maj_soins_auto.destroy
call super::destroy
destroy(this.cb_ajouter_auto)
destroy(this.cb_annuler_auto)
destroy(this.dw_auto)
destroy(this.st_auto2)
destroy(this.st_auto1)
destroy(this.em_deb)
destroy(this.st_auto3)
destroy(this.em_deb_num)
destroy(this.rb_echeances_flottantes)
destroy(this.rb_echeances_fixes)
destroy(this.em_jour_fixe)
destroy(this.cbx_forcer_echeance)
destroy(this.gb_1)
end on

event open;call super::open;

Try 
	
	trace("============ DEBUT OPEN SOINS / REGLEMENTS - AJOUT SOINS AUTO ============ ")
	
	

	w_soins_reg_maj_parent = message.PowerObjectParm
	
	// datawindows parentes
	dw_soins = w_soins_reg_maj_parent.dw_soins
	dw_soins_prevus = w_soins_reg_maj_parent.dw_soins_prevus

	// Variables parentes
	var_code_local = w_soins_reg_maj_parent.var_code_local
	type_gestion = w_soins_reg_maj_parent.type_gestion
	action  = w_soins_reg_maj_parent.action
	
	if type_gestion = "P" then 
		if w_soins_reg_maj_parent.tab_1.tabpage_soins_prevus.dw_devis.rowcount() = 0 then
			// pas de devis => on en crée un
			w_soins_reg_maj_parent.tab_1.tabpage_soins_prevus.pb_ajouter_devis.triggerevent(clicked!)
		end if
	end if
	
	var_code_devis_local = w_soins_reg_maj_parent.var_code_devis_local
	
	dw_auto.settransobject(sqlca)
	dw_auto.retrieve()
	
	em_deb.text = string(today())
	
	// Positionnement un peu bas pour ne pas géner l'affichage des lignes de soins
	
	// Il faut placer la fenetre pour pas qu'elle "morde" sur la liste des soins
	centrer_selon_w_mdi_2020(this)
	long y_min, y_max, y1, y2
	y_max = w_mdi_2020.height - this.height
	y_min = + w_soins_reg_maj_parent.dw_soins.y + w_soins_reg_maj_parent.dw_soins.height + (w_mdi_2020.height - w_mdi_2020.WorkSpaceHeight())

	y1 = w_mdi_2020.height 
	y2 = w_mdi_2020.WorkSpaceHeight()
	
	this.y = y_min + (y_max - y_min) / 2
	
	// Est ce que le patient est en prélèvement ... si OUI .. si échéances fixe, on pourra lui proposer de commence les prélèvement le mois en cours
	select isnull(mode_reglement_habituel, '') into :is_mode_reglement_habituel from patient where code = :var_code_local ; 
	
	trace("============ FIN OPEN SOINS / REGLEMENTS -  AJOUT SOINS AUTO  ============ ")


Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour DentalSoft :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try


end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_reg_maj_soins_auto
integer x = 50
integer y = 1008
end type

type cb_ajouter_auto from uo_picturebutton_390x120 within w_soins_reg_maj_soins_auto
integer x = 1326
integer y = 1004
integer width = 526
integer taborder = 10
boolean bringtotop = true
string text = "A&jouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// A jout de soins automatiques


// Depuis v2012, on ne pose plus la question



double v_soins_auto 
integer v_jour_echeance


v_soins_auto = dw_auto.getitemnumber(dw_auto.getrow(),"code")

// N° du premier soin
double v_num_deb 
v_num_deb = double(em_deb_num.text)

// Recherche de l'écart de jours pour les dates ...
date prem_date
prem_date = date(em_deb.text)

// Gestion des écheances
if rb_echeances_flottantes.checked = true then 
	v_jour_echeance = 0
else
	v_jour_echeance = integer(em_jour_fixe.text)
end if

// insert effectif 
if type_gestion = "P" then
	// on passe le N° de devis
	ajout_soins_automatiques(var_code_local, type_gestion, v_soins_auto, v_num_deb, prem_date, false, true, var_code_devis_local, v_jour_echeance, cbx_forcer_echeance.checked)

	// Si on change le titre du Devis faut qu'on le voit
	w_soins_reg_maj_parent.tab_1.tabpage_soins_prevus.dw_devis.retrieve(var_code_local, v_jour_echeance)

else
	// Pas de devis
	ajout_soins_automatiques(var_code_local, type_gestion, v_soins_auto, v_num_deb, prem_date, false, true, 0,v_jour_echeance, cbx_forcer_echeance.checked)

end if
	

// Raffraichissement dans la fenêtre appelante
if type_gestion = 'P' then
	dw_soins_prevus.retrieve(var_code_local, var_code_devis_local)
else
	dw_soins.retrieve(var_code_local)
end if


close(parent)


end event

type cb_annuler_auto from uo_picturebutton_390x120 within w_soins_reg_maj_soins_auto
integer x = 722
integer y = 1004
integer width = 526
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_auto from datawindow within w_soins_reg_maj_soins_auto
string tag = "no resize all  brush"
integer x = 1111
integer y = 48
integer width = 1573
integer height = 76
integer taborder = 300
boolean bringtotop = true
string dataobject = "dw_cherche_titre_soin_auto"
boolean border = false
boolean livescroll = true
end type

type st_auto2 from statictext within w_soins_reg_maj_soins_auto
integer x = 101
integer y = 64
integer width = 997
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Soins automatiques à incorporer :"
boolean focusrectangle = false
end type

type st_auto1 from statictext within w_soins_reg_maj_soins_auto
integer x = 503
integer y = 224
integer width = 590
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date de Référence :"
end type

type em_deb from editmask within w_soins_reg_maj_soins_auto
integer x = 1115
integer y = 204
integer width = 434
integer height = 100
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_auto3 from statictext within w_soins_reg_maj_soins_auto
integer x = 503
integer y = 404
integer width = 590
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "N° du premier soin :"
boolean focusrectangle = false
end type

type em_deb_num from editmask within w_soins_reg_maj_soins_auto
integer x = 1115
integer y = 384
integer width = 224
integer height = 100
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##.#"
boolean spin = true
double increment = 1
string minmax = "0~~99.9"
end type

type rb_echeances_flottantes from radiobutton within w_soins_reg_maj_soins_auto
integer x = 645
integer y = 660
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Flottantes"
boolean checked = true
end type

event clicked;// pour afficher ou pas le bouton
visibilite_cbx_forcer_echeance()
end event

type rb_echeances_fixes from radiobutton within w_soins_reg_maj_soins_auto
integer x = 645
integer y = 776
integer width = 311
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fixe le"
end type

event clicked;// pour afficher ou pas le bouton
visibilite_cbx_forcer_echeance()
end event

type em_jour_fixe from editmask within w_soins_reg_maj_soins_auto
event modif pbm_enmodified
integer x = 969
integer y = 760
integer width = 219
integer height = 112
integer taborder = 280
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "15"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean autoskip = true
boolean spin = true
string minmax = "1~~30"
end type

event modif;//// pour afficher ou pas le bouton
//visibilite_cbx_forcer_echeance()

//messagebox ("trace", "lbut")
end event

event modified;// pour afficher ou pas le bouton
visibilite_cbx_forcer_echeance()
end event

event losefocus;// pour afficher ou pas le bouton
visibilite_cbx_forcer_echeance()
end event

type cbx_forcer_echeance from checkbox within w_soins_reg_maj_soins_auto
boolean visible = false
integer x = 1243
integer y = 764
integer width = 1202
integer height = 108
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Forcer la 1ère échéance dans le 1er mois "
end type

type gb_1 from groupbox within w_soins_reg_maj_soins_auto
integer x = 517
integer y = 556
integer width = 1975
integer height = 400
integer taborder = 270
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Echéances Patients"
end type

