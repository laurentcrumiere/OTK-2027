$PBExportHeader$w_ememoires_luxembourg_liste.srw
forward
global type w_ememoires_luxembourg_liste from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
end type
type cb_autre from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_ememoires_luxembourg_liste
end type
type cb_ecran from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
end type
type uo_size from resize_fenetre within w_ememoires_luxembourg_liste
end type
type em_nb from editmask within w_ememoires_luxembourg_liste
end type
type cbx_filtre from u_cst_togglebutton within w_ememoires_luxembourg_liste
end type
type st_1 from statictext within w_ememoires_luxembourg_liste
end type
type st_3 from statictext within w_ememoires_luxembourg_liste
end type
type em_date_min from uo_date_calendrier within w_ememoires_luxembourg_liste
end type
type st_2 from statictext within w_ememoires_luxembourg_liste
end type
type em_date_max from uo_date_calendrier within w_ememoires_luxembourg_liste
end type
type dw_oa from datawindow within w_ememoires_luxembourg_liste
end type
type ddlb_statuts from dropdownlistbox within w_ememoires_luxembourg_liste
end type
type rb_1 from radiobutton within w_ememoires_luxembourg_liste
end type
type rb_tous from radiobutton within w_ememoires_luxembourg_liste
end type
type dw_prati from datawindow within w_ememoires_luxembourg_liste
end type
type gb_3 from groupbox within w_ememoires_luxembourg_liste
end type
type em_max from editmask within w_ememoires_luxembourg_liste
end type
type em_min from editmask within w_ememoires_luxembourg_liste
end type
type st_min from statictext within w_ememoires_luxembourg_liste
end type
type st_max from statictext within w_ememoires_luxembourg_liste
end type
type dw_liste from u_basedw within w_ememoires_luxembourg_liste
end type
type cb_1 from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
end type
end forward

global type w_ememoires_luxembourg_liste from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "eMémoires"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
em_nb em_nb
cbx_filtre cbx_filtre
st_1 st_1
st_3 st_3
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
dw_oa dw_oa
ddlb_statuts ddlb_statuts
rb_1 rb_1
rb_tous rb_tous
dw_prati dw_prati
gb_3 gb_3
em_max em_max
em_min em_min
st_min st_min
st_max st_max
dw_liste dw_liste
cb_1 cb_1
end type
global w_ememoires_luxembourg_liste w_ememoires_luxembourg_liste

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true



string  v_nom_praticien, pra_min, pra_max

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
date date_min, date_max
double dos_min, dos_max
string tit

if not prepa_faite then
	
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom + isnull(prenom, '', ' ' + prenom) INTO :v_nom_praticien FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+v_nom_praticien
	end if

	

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	dos_min = double(em_min.text)
	dos_max = double(em_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	
	dw_liste.object.sous_titre.text = tit
	dw_liste.retrieve(pra_min, pra_max,date_min, date_max,dos_min,dos_max  )
	

	close(w_patience)


end if

end subroutine

on w_ememoires_luxembourg_liste.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.em_nb=create em_nb
this.cbx_filtre=create cbx_filtre
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.dw_oa=create dw_oa
this.ddlb_statuts=create ddlb_statuts
this.rb_1=create rb_1
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.gb_3=create gb_3
this.em_max=create em_max
this.em_min=create em_min
this.st_min=create st_min
this.st_max=create st_max
this.dw_liste=create dw_liste
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.em_nb
this.Control[iCurrent+7]=this.cbx_filtre
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.em_date_max
this.Control[iCurrent+13]=this.dw_oa
this.Control[iCurrent+14]=this.ddlb_statuts
this.Control[iCurrent+15]=this.rb_1
this.Control[iCurrent+16]=this.rb_tous
this.Control[iCurrent+17]=this.dw_prati
this.Control[iCurrent+18]=this.gb_3
this.Control[iCurrent+19]=this.em_max
this.Control[iCurrent+20]=this.em_min
this.Control[iCurrent+21]=this.st_min
this.Control[iCurrent+22]=this.st_max
this.Control[iCurrent+23]=this.dw_liste
this.Control[iCurrent+24]=this.cb_1
end on

on w_ememoires_luxembourg_liste.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.em_nb)
destroy(this.cbx_filtre)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.dw_oa)
destroy(this.ddlb_statuts)
destroy(this.rb_1)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.gb_3)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.st_min)
destroy(this.st_max)
destroy(this.dw_liste)
destroy(this.cb_1)
end on

event open;call super::open;
open(w_patience)

uo_size.taille(this)

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_liste.settransobject(sqlca)


prepa_faite = false

cbx_filtre.backcolor = this.backcolor

SELECT min(numero_dossier), max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE -100000000 < numero_dossier and  numero_dossier < 100000000   ;

em_max.text = string(max)


close(w_patience)




end event

event resize;

uo_size.retaille(this)

// repositionnement 
//cbx_filtre.x = gb_filtre.x + 19
//cbx_filtre.y = gb_filtre.y + 55
//

// pour qu'il se resize mais ... pas trop 
cbx_filtre.y = cb_ecran.y
cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)
cbx_filtre.width  =  min(800, cb_ecran.x - cbx_filtre.x - 30)
end event

type p_fond from w_fenetre_arakis`p_fond within w_ememoires_luxembourg_liste
end type

type cb_imprimer from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
integer x = 1778
integer y = 1868
integer width = 457
integer taborder = 130
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
integer x = 1289
integer y = 1868
integer width = 457
integer taborder = 140
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false

this.enabled (false)
cb_imprimer.enabled( false )
cb_ecran.enabled ( true)
cb_ecran.default ( true)


dw_liste.visible = false

cbx_filtre.visible = false

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_ememoires_luxembourg_liste
integer x = 2761
integer y = 1868
integer width = 457
integer taborder = 10
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
integer x = 800
integer y = 1868
integer width = 457
integer taborder = 60
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)
prepa()
// pour les excités des clics
cb_fermer.enabled(true)


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if

cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_imprimer.default ( true )

dw_liste.visible = true


if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


end event

type uo_size from resize_fenetre within w_ememoires_luxembourg_liste
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_ememoires_luxembourg_liste
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type cbx_filtre from u_cst_togglebutton within w_ememoires_luxembourg_liste
event destroy ( )
boolean visible = false
integer x = 18
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 90
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

event constructor;call super::constructor;cbx_filtre.backcolor = couleur_fond_fenetre

end event

type st_1 from statictext within w_ememoires_luxembourg_liste
integer x = 357
integer y = 1172
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date des eMémoires :"
end type

type st_3 from statictext within w_ememoires_luxembourg_liste
integer x = 485
integer y = 1296
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

type em_date_min from uo_date_calendrier within w_ememoires_luxembourg_liste
integer x = 891
integer y = 1276
integer width = 457
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_ememoires_luxembourg_liste
integer x = 1417
integer y = 1296
integer width = 247
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

type em_date_max from uo_date_calendrier within w_ememoires_luxembourg_liste
integer x = 1701
integer y = 1276
integer width = 457
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_oa from datawindow within w_ememoires_luxembourg_liste
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 604
integer width = 1975
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type ddlb_statuts from dropdownlistbox within w_ememoires_luxembourg_liste
boolean visible = false
integer x = 763
integer y = 928
integer width = 1198
integer height = 588
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Non envoyées","Envoyées","A renvoyer","Réçues par l~'OA","Validées ","Rejetées ","Rejetées à titre informatif","Non envoyées + A renvoyer"}
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_ememoires_luxembourg_liste
integer x = 448
integer y = 244
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_ememoires_luxembourg_liste
integer x = 448
integer y = 148
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_1.checked = false
dw_prati.visible = false
end event

type dw_prati from datawindow within w_ememoires_luxembourg_liste
string tag = "position brush"
boolean visible = false
integer x = 1079
integer y = 252
integer width = 859
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type gb_3 from groupbox within w_ememoires_luxembourg_liste
integer x = 283
integer y = 68
integer width = 2542
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type em_max from editmask within w_ememoires_luxembourg_liste
string tag = "a masquer"
integer x = 1774
integer y = 612
integer width = 498
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type em_min from editmask within w_ememoires_luxembourg_liste
string tag = "a masquer"
integer x = 786
integer y = 612
integer width = 498
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type st_min from statictext within w_ememoires_luxembourg_liste
integer x = 343
integer y = 628
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Du Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_max from statictext within w_ememoires_luxembourg_liste
integer x = 1353
integer y = 628
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Au Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_liste from u_basedw within w_ememoires_luxembourg_liste
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 23
integer y = 20
integer width = 3707
integer height = 1824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_ememoires_luxembourg_liste"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;

// Ouverture du ememoire

long l_numero_memoire

l_numero_memoire = this.getitemnumber(row,"numero_memoire")

param_win[1] = "C"
openwithparm(w_ememoire_luxembourg_maj, l_numero_memoire)




end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

type cb_1 from uo_picturebutton_390x120 within w_ememoires_luxembourg_liste
integer x = 2272
integer y = 1868
integer width = 457
integer taborder = 140
boolean bringtotop = true
string text = "MàJ Annul."
string tiptext = "Mise à jour des états Annulation Automatique (Simulation > 15 minutes)"
string iconname = "ACTIONS_mise_a_jour_jour_interdits.png"
end type

event clicked;call super::clicked;if Messagebox("ATTENTION", "Vous allez mettre à jour les états des eMémoire à 'Annulation Auto' pour tous les éMémoire simulés depuis plus de 15 minutes !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
	
	open(w_patience)
	
	//on les met d'abord dans un état 'P' = Provisoire (non public) pour pouvoir mettre à jour les soins ensute
	update ememoire_luxembourg set etat = 'A' where ememoire_luxembourg.etat in ('S', 'K') and minutes( (select max(date_heure) from ememoire_luxembourg_operations 
	where ememoire_luxembourg_operations.numero_memoire = ememoire_luxembourg.numero_memoire )   , getdate()) > 15 ;
	
	if sqlca.sqlcode = 0 then 
		// Mise à jour des soins
		update soins, ememoire_luxembourg  set derniere_efacture = null where derniere_efacture = ememoire_luxembourg.numero_memoire and etat = 'P' ;

		if sqlca.sqlcode = 0 then 

			// Annulation finale
			update ememoire_luxembourg set etat = 'A' where ememoire_luxembourg.etat = 'P' ;

			if sqlca.sqlcode = 0 then 
				commit ;
				if dw_liste.visible then 
					// actualisation
					cb_ecran.triggerevent(clicked!)
				end if
			else
				messagebox("ATTENTION", "Erreur N°3 dans la mise à jour des eMémoires !~n~n" + sqlca.sqlerrtext )
			end if
		else
			messagebox("ATTENTION", "Erreur N°2 dans la mise à jour des eMémoires !~n~n" + sqlca.sqlerrtext )
		end if
	else
		messagebox("ATTENTION", "Erreur N°1 dans la mise à jour des eMémoires !~n~n" + sqlca.sqlerrtext )
		rollback ;
	end if
	
	close(w_patience)
	
end if
end event

