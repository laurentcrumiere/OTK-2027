$PBExportHeader$w_liste_patients_livre_recettes_detaille.srw
forward
global type w_liste_patients_livre_recettes_detaille from w_liste_patients
end type
type gb_monnaie from groupbox within w_liste_patients_livre_recettes_detaille
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_livre_recettes_detaille
end type
type cb_param from uo_picturebutton_390x120 within w_liste_patients_livre_recettes_detaille
end type
end forward

global type w_liste_patients_livre_recettes_detaille from w_liste_patients
integer width = 5495
integer height = 2740
string title = "Livre de Recettes Détaillé"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
gb_monnaie gb_monnaie
cb_exporter cb_exporter
cb_param cb_param
end type
global w_liste_patients_livre_recettes_detaille w_liste_patients_livre_recettes_detaille

type variables


string var_pra_min,var_pra_max	// Praticiens
date date_min,date_max			// Période
string typ_min, typ_max

end variables

event open;call super::open;open(w_patience)

long tot, lig

string tab_mode[], v_code, v_nom_mode
integer cpt_mode, nb_mode
string v_titre_mode, v_col_mode, s_modif, s_titre
string s_code_praticien, s_nom_praticien

// Constitution du tableau des modes de reglement pour l'attribution des colonnes

declare cur cursor for select code, nom from mode_reglement where actif = 1 order by ordre_trie, nom ;

open cur ; 
fetch cur into :v_code, :v_nom_mode ; 
nb_mode = 0

do while sqlca.sqlcode = 0 
	nb_mode = nb_mode + 1 	
	tab_mode[nb_mode] = v_code
	
	
	// Mise à jour du titre
	v_titre_mode = "mode_"+string(nb_mode)+"_t"
	s_modif = v_titre_mode + ".text = '"+ v_nom_mode +"'"
	
	if nb_mode <= 12 then
		dw_liste.modify( s_modif )
	end if
	fetch cur into :v_code, :v_nom_mode ; 
loop

close cur ;

// Effacement des autres colonnes
for cpt_mode = nb_mode + 1 to 12 
	v_titre_mode = "mode_"+string(cpt_mode)+"_t"
	s_modif = v_titre_mode + ".text = ''"
	dw_liste.modify( s_modif )
	v_col_mode = "sum_" + string(cpt_mode)+"_1"
	s_modif = v_col_mode + ".visible = 0"
	dw_liste.modify( s_modif )
	v_col_mode = "sum_" + string(cpt_mode)+"_2"
	s_modif = v_col_mode + ".visible = 0"
	dw_liste.modify( s_modif )
next

// remplissage DW à partir du Livre de recettes déjà construite

tot = w_liste_patients_livre_recettes.dw_liste.rowcount()

for lig = 1 to tot
	
	dw_liste.insertrow(0)
	dw_liste.setitem(lig, "nom_patient", w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "nom") + " "+ w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "patient_prenom"))
	dw_liste.setitem(lig, "nom_payeur", w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "paye_payeur"))
	dw_liste.setitem(lig, "date_reglement", w_liste_patients_livre_recettes.dw_liste.getitemdate( lig, "paye_date"))
	dw_liste.setitem(lig, "date_remise", w_liste_patients_livre_recettes.dw_liste.getitemdate( lig, "paye_dateremise"))
	dw_liste.setitem(lig, "commentaire", w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "paye_commentaire"))
	dw_liste.setitem(lig, "mode", w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "paye_mode"))
	dw_liste.setitem(lig, "code", w_liste_patients_livre_recettes.dw_liste.getitemnumber( lig, "code"))
	
	// recherche de la colonne du montant, selon le mode
	cpt_mode = 1 
	do while cpt_mode < nb_mode and tab_mode[cpt_mode] <> w_liste_patients_livre_recettes.dw_liste.getitemstring( lig, "paye_mode")
		cpt_mode = cpt_mode + 1 
	loop
	
	v_col_mode = "mode_" + string(cpt_mode)
	
	dw_liste.setitem(lig, v_col_mode, w_liste_patients_livre_recettes.dw_liste.getitemnumber( lig, "paye_montant"))
	
	// pour les totaux, c'est pplus simple d'avoir toujours la colonne
	dw_liste.setitem(lig, "montant", w_liste_patients_livre_recettes.dw_liste.getitemnumber( lig, "paye_montant"))

	
next

dw_liste.groupcalc()

this.backcolor = couleur_fond_fenetre

if w_liste_patients_livre_recettes.rb_tous.checked then
	s_titre = "Pour tous les praticiens - "
else
	s_code_praticien = w_liste_patients_livre_recettes.var_pra_min
	select isnull(prenom, '') + ' ' + isnull(nom, '') into :s_nom_praticien from prati where code = :s_code_praticien ;
	s_titre = "Pour " + s_nom_praticien + " -"
end if
s_titre = s_titre + " Du " + w_liste_patients_livre_recettes.em_date_min.text + " au " + w_liste_patients_livre_recettes.em_date_max.text 
s_modif = 'titre_t.text = "' + s_titre + '"'
dw_liste.modify( s_modif )

close(w_patience)
end event

on w_liste_patients_livre_recettes_detaille.create
int iCurrent
call super::create
this.gb_monnaie=create gb_monnaie
this.cb_exporter=create cb_exporter
this.cb_param=create cb_param
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_monnaie
this.Control[iCurrent+2]=this.cb_exporter
this.Control[iCurrent+3]=this.cb_param
end on

on w_liste_patients_livre_recettes_detaille.destroy
call super::destroy
destroy(this.gb_monnaie)
destroy(this.cb_exporter)
destroy(this.cb_param)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_livre_recettes_detaille
integer x = 590
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_livre_recettes_detaille
integer x = 1614
integer y = 2424
integer width = 585
integer taborder = 80
boolean enabled = true
end type

event cb_imprimer::clicked;
// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")


end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 3337
integer y = 2348
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)

st_min.visible = false
st_max.visible = false

em_min.visible = false
em_max.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_livre_recettes_detaille
integer x = 3817
integer y = 2424
integer width = 585
integer taborder = 90
fontcharset fontcharset = ansi!
end type

event cb_fermer::clicked;



fermer_fenetre(parent)

end event

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 1417
integer y = 2348
integer taborder = 70
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_livre_recettes_detaille
integer x = 3616
integer y = 2348
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_livre_recettes_detaille
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 165
integer y = 216
end type

event rb_un::clicked;

//
end event

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 165
integer y = 120
end type

event rb_tous::clicked;

//
end event

type em_nb from w_liste_patients`em_nb within w_liste_patients_livre_recettes_detaille
integer x = 594
integer y = 2148
integer taborder = 0
end type

type em_max from w_liste_patients`em_max within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer y = 616
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_livre_recettes_detaille
integer x = 4343
integer y = 1788
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 50
integer y = 40
integer width = 2016
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_livre_recettes_detaille
integer x = 933
integer y = 220
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_livre_recettes_detaille
end type

type st_min from w_liste_patients`st_min within w_liste_patients_livre_recettes_detaille
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_livre_recettes_detaille
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_livre_recettes_detaille
boolean visible = true
integer x = 37
integer y = 4
integer width = 5413
integer height = 2392
integer taborder = 0
string dataobject = "dw_liste_patients_livre_recettes_detaille"
end type

event dw_liste::buttonclicked;call super::buttonclicked;// Détail du règlement

if row > 0 then
	string ls_Object
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_detail" 
	
	
			str_reglement reglement_groupe
			
			reglement_groupe.date 		= this.GetitemDate(row,"date_reglement")
			reglement_groupe.payeur 	= this.GetitemString(row,"nom_payeur")
			reglement_groupe.mode 	= this.GetitemString(row,"mode")
			reglement_groupe.dateremise 	=	this.GetitemDate(row,"date_remise")
			reglement_groupe.commentaire = 	this.GetitemString(row,"commentaire")
					
			OpenWithParm(w_reglements_regroupes, reglement_groupe)
	end choose

end if
end event

type gb_monnaie from groupbox within w_liste_patients_livre_recettes_detaille
boolean visible = false
integer x = 2798
integer y = 496
integer width = 818
integer height = 464
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Réglements perçus"
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_livre_recettes_detaille
integer x = 2309
integer y = 2424
integer width = 585
integer taborder = 90
boolean bringtotop = true
string text = "&Exporter"
string tiptext = "Export tous types / Export PDF"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

	dw_liste.saveAs()

end event

event lbuttondown;call super::lbuttondown;
//dw_liste.saveAs()
param_win[1] = "P"
openWithParm(w_exporter_datawindow_excel, dw_liste)

end event

event rbuttondown;call super::rbuttondown;
	// Variable passée en paramètre....
	param_win[1] = "P"
	openWithParm(w_exporter_datawindow_excel, dw_liste)
	
	
end event

type cb_param from uo_picturebutton_390x120 within w_liste_patients_livre_recettes_detaille
integer x = 919
integer y = 2424
integer width = 585
integer taborder = 50
boolean bringtotop = true
string text = "&Param Impr."
string tiptext = "Acces au paramatrége des imprimantes"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;printsetup()
end event

