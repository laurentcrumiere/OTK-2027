$PBExportHeader$w_vigie_du_cayla_stats.srw
forward
global type w_vigie_du_cayla_stats from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_vigie_du_cayla_stats
end type
type uo_1 from resize_fenetre within w_vigie_du_cayla_stats
end type
type dw_stat1 from datawindow within w_vigie_du_cayla_stats
end type
type pb_lancer from uo_picturebutton_390x120 within w_vigie_du_cayla_stats
end type
type st_3 from statictext within w_vigie_du_cayla_stats
end type
type st_1 from statictext within w_vigie_du_cayla_stats
end type
type em_date_min from uo_date_calendrier within w_vigie_du_cayla_stats
end type
type st_2 from statictext within w_vigie_du_cayla_stats
end type
type em_date_max from uo_date_calendrier within w_vigie_du_cayla_stats
end type
type dw_synthese_rdv from datawindow within w_vigie_du_cayla_stats
end type
type dw_snir from datawindow within w_vigie_du_cayla_stats
end type
type dw_stat2 from datawindow within w_vigie_du_cayla_stats
end type
type dw_stat3 from datawindow within w_vigie_du_cayla_stats
end type
type dw_stat4 from datawindow within w_vigie_du_cayla_stats
end type
end forward

global type w_vigie_du_cayla_stats from w_fenetre_arakis
string title = "Statistiques Spécifiques Dr Vigie du Cayla"
pb_fermer pb_fermer
uo_1 uo_1
dw_stat1 dw_stat1
pb_lancer pb_lancer
st_3 st_3
st_1 st_1
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
dw_synthese_rdv dw_synthese_rdv
dw_snir dw_snir
dw_stat2 dw_stat2
dw_stat3 dw_stat3
dw_stat4 dw_stat4
end type
global w_vigie_du_cayla_stats w_vigie_du_cayla_stats

event open;call super::open;
uo_1.taille(this)

// datawindows de stats
dw_stat1.settransobject(sqlca)
dw_stat2.settransobject(sqlca)
dw_stat3.settransobject(sqlca)
dw_stat4.settransobject(sqlca)
dw_synthese_rdv.settransobject(sqlca)
dw_snir.settransobject(sqlca)

if month(today()) >= 7 then
	em_date_min.SetDate (date( year(today()), 7, 1))
	em_date_max.SetDate (today())
else
	em_date_min.SetDate (date( year(today()) - 1, 7, 1))
	em_date_max.SetDate ( today())
end if


end event

event resize;call super::resize;uo_1.retaille(this)
end event

on w_vigie_du_cayla_stats.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.uo_1=create uo_1
this.dw_stat1=create dw_stat1
this.pb_lancer=create pb_lancer
this.st_3=create st_3
this.st_1=create st_1
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.dw_synthese_rdv=create dw_synthese_rdv
this.dw_snir=create dw_snir
this.dw_stat2=create dw_stat2
this.dw_stat3=create dw_stat3
this.dw_stat4=create dw_stat4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_stat1
this.Control[iCurrent+4]=this.pb_lancer
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.em_date_min
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.em_date_max
this.Control[iCurrent+10]=this.dw_synthese_rdv
this.Control[iCurrent+11]=this.dw_snir
this.Control[iCurrent+12]=this.dw_stat2
this.Control[iCurrent+13]=this.dw_stat3
this.Control[iCurrent+14]=this.dw_stat4
end on

on w_vigie_du_cayla_stats.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.uo_1)
destroy(this.dw_stat1)
destroy(this.pb_lancer)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.dw_synthese_rdv)
destroy(this.dw_snir)
destroy(this.dw_stat2)
destroy(this.dw_stat3)
destroy(this.dw_stat4)
end on

type p_fond from w_fenetre_arakis`p_fond within w_vigie_du_cayla_stats
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_vigie_du_cayla_stats
integer x = 1719
integer y = 1580
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type uo_1 from resize_fenetre within w_vigie_du_cayla_stats
boolean visible = false
integer x = 329
integer y = 952
integer taborder = 10
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_stat1 from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 18
integer y = 12
integer width = 3077
integer height = 1564
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigie_stats1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_lancer from uo_picturebutton_390x120 within w_vigie_du_cayla_stats
integer x = 731
integer y = 1584
integer width = 411
integer height = 152
integer taborder = 20
boolean bringtotop = true
integer weight = 700
string text = "&Lancer"
end type

event clicked;call super::clicked;
date date_min , date_max
datetime datetime_min , datetime_max

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)

datetime_min = datetime(date_min, time('00:00'))
datetime_max = datetime(date_max, time('23:59'))


if messagebox("ATTENTION","Vous allez imprimer toutes les statistiques spécifiques du "+em_date_min.text+" au "+em_date_max.text+".~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	open(w_patience)
	
	dw_stat1.retrieve(date_min, date_max)
	dw_stat1.print()
	
	//messagebox("trace","apres print stat1")
	
	// synthèse des rdv
	dw_synthese_rdv.retrieve(datetime_min, datetime_max,'','ZZZZZZ', 0, 99)
	dw_synthese_rdv.print()
	
	//messagebox("trace","apres print synthse rdv")
	
	// Soins Suivis sur une période
	w_graph_soins_suivis w_gss
	open(w_gss)
	
	// valeur de l'interface
	w_gss.visible = false
	w_gss.em_min.text = "-99999999" 
	w_gss.em_max.text = "999999999" 

	w_gss.em_date_min.text = string(date_min, "mm/yyyy")
	w_gss.em_date_max.text = string(date_max, "mm/yyyy")
	
	w_gss.cb_ecran.triggerevent(clicked!)
	
	//w_gss.dw_liste.object.graphtype = colgraph!
	
	w_gss.dw_liste.print()

	//messagebox("trace","apres print w_gss")
	
	w_gss.dw_tableau.print()
	
	// Tableau spécial pour Vigie qui calcule les moyennes sur l'année !!
	////messagebox("trace","Avant print")
	w_gss.dw_tableau_moyennes.print()

	
	//messagebox("trace","apres print tableau moyenne")
	
	// date premiere visite % début de traitement
	w_tableau_bord_premiere_visite w_tppv
	open(w_tppv)
	
	// valeur de l'interface
	w_tppv.visible = false
	w_tppv.em_min.text = "-99999999" 
	w_tppv.em_max.text = "999999999" 
	w_tppv.em_date_min.text = string(date_min)
	w_tppv.em_date_max.text = string(date_max)
	w_tppv.cb_ecran.triggerevent(clicked!)
	w_tppv.dw_liste.print()

	//messagebox("trace","apres print wtppv")

	
	// SNIR
	dw_snir.retrieve(date_min, date_max)
	dw_snir.print()

	//messagebox("trace","apres print snir")
	
	
	// Analyse financière .. on calcule les trimestres d'avance pour être plus sur !!!
	date trim1_min, trim1_max, trim2_min, trim2_max, trim3_min, trim3_max, trim4_min, trim4_max
	date n1_trim1_min, n1_trim1_max, n1_trim2_min, n1_trim2_max, n1_trim3_min, n1_trim3_max, n1_trim4_min, n1_trim4_max
	date n2_trim1_min, n2_trim1_max, n2_trim2_min, n2_trim2_max, n2_trim3_min, n2_trim3_max, n2_trim4_min, n2_trim4_max
	date n3_trim1_min, n3_trim1_max, n3_trim2_min, n3_trim2_max, n3_trim3_min, n3_trim3_max, n3_trim4_min, n3_trim4_max
	date n4_trim1_min, n4_trim1_max, n4_trim2_min, n4_trim2_max, n4_trim3_min, n4_trim3_max, n4_trim4_min, n4_trim4_max
	date np_trim1_min, np_trim1_max, np_trim2_min, np_trim2_max, np_trim3_min, np_trim3_max, np_trim4_min, np_trim4_max
	
	trim1_min = date( year(date_min) , 7, 1)
	trim1_max = date( year(date_min) , 9, 30)
	trim2_min = date( year(date_min) , 10, 1)
	trim2_max = date( year(date_min) , 12, 31)
	trim3_min = date( year(date_min) + 1 , 1, 1)
	trim3_max = date( year(date_min) + 1, 3, 30)
	trim4_min = date( year(date_min) + 1 , 4, 1)
	trim4_max = date( year(date_min) + 1, 6, 30)
	
	n1_trim1_min = date( year(date_min) -1 , 7, 1)
	n1_trim1_max = date( year(date_min) -1 , 9, 30)
	n1_trim2_min = date( year(date_min) - 1, 10, 1)
	n1_trim2_max = date( year(date_min) - 1, 12, 31)
	n1_trim3_min = date( year(date_min)  , 1, 1)
	n1_trim3_max = date( year(date_min) , 3, 30)
	n1_trim4_min = date( year(date_min)  , 4, 1)
	n1_trim4_max = date( year(date_min) , 6, 30)

	n2_trim1_min = date( year(date_min) - 2 , 7, 1)
	n2_trim1_max = date( year(date_min) - 2 , 9, 30)
	n2_trim2_min = date( year(date_min) - 2, 10, 1)
	n2_trim2_max = date( year(date_min) - 2, 12, 31)
	n2_trim3_min = date( year(date_min)  -1 , 1, 1)
	n2_trim3_max = date( year(date_min) - 1, 3, 30)
	n2_trim4_min = date( year(date_min)  - 1, 4, 1)
	n2_trim4_max = date( year(date_min) - 1, 6, 30)

	n3_trim1_min = date( year(date_min) - 3 , 7, 1)
	n3_trim1_max = date( year(date_min) - 3 , 9, 30)
	n3_trim2_min = date( year(date_min) - 3, 10, 1)
	n3_trim2_max = date( year(date_min) - 3, 12, 31)
	n3_trim3_min = date( year(date_min)  - 2, 1, 1)
	n3_trim3_max = date( year(date_min) - 2, 3, 30)
	n3_trim4_min = date( year(date_min)  - 2, 4, 1)
	n3_trim4_max = date( year(date_min) - 2, 6, 30)
	
	n4_trim1_min = date( year(date_min) - 4 , 7, 1)
	n4_trim1_max = date( year(date_min) - 4 , 9, 30)
	n4_trim2_min = date( year(date_min) - 4, 10, 1)
	n4_trim2_max = date( year(date_min) - 4, 12, 31)
	n4_trim3_min = date( year(date_min)  - 3, 1, 1)
	n4_trim3_max = date( year(date_min) - 3, 3, 30)
	n4_trim4_min = date( year(date_min)  - 3, 4, 1)
	n4_trim4_max = date( year(date_min) - 3, 6, 30)
	
	// pour le prévisionnel !!!

	np_trim1_min = date( year(date_min) + 1 , 7, 1)
	np_trim1_max = date( year(date_min) + 1 , 9, 30)
	np_trim2_min = date( year(date_min) + 1, 10, 1)
	np_trim2_max = date( year(date_min) + 1, 12, 31)
	np_trim3_min = date( year(date_min)  + 2, 1, 1)
	np_trim3_max = date( year(date_min) + 2, 3, 30)
	np_trim4_min = date( year(date_min)  + 2, 4, 1)
	np_trim4_max = date( year(date_min) + 2, 6, 30)
	
	dw_stat2.retrieve ( trim1_min, trim1_max, trim2_min, trim2_max, trim3_min, trim3_max, trim4_min, trim4_max, n1_trim1_min, n1_trim1_max, n1_trim2_min, n1_trim2_max, n1_trim3_min, n1_trim3_max, n1_trim4_min, n1_trim4_max,  n2_trim1_min, n2_trim1_max, n2_trim2_min, n2_trim2_max, n2_trim3_min, n2_trim3_max, n2_trim4_min, n2_trim4_max, n3_trim1_min, n3_trim1_max, n3_trim2_min, n3_trim2_max, n3_trim3_min, n3_trim3_max, n3_trim4_min, n3_trim4_max,  n4_trim1_min, n4_trim1_max, n4_trim2_min, n4_trim2_max, n4_trim3_min, n4_trim3_max, n4_trim4_min, n4_trim4_max, np_trim1_min, np_trim1_max, np_trim2_min, np_trim2_max, np_trim3_min, np_trim3_max, np_trim4_min, np_trim4_max)

	
	////messagebox("trace","avant stat2")
	dw_stat2.print()
	
	//messagebox("trace","apres stat2")

	
	// Analyse des temps passés par tranche
	w_graph_analyse_temps_passes_tranche w_atppt
	open(w_atppt)
	
	// valeur de l'interface
	w_atppt.visible = false
	w_atppt.em_min.text = "-99999999" 
	w_atppt.em_max.text = "999999999" 
	w_atppt.em_date_min.text = string(date_min)
	w_atppt.em_date_max.text = string(date_max)
	//w_atppt.dw_etat1.setFilter("code = 'S'")
	//w_atppt.dw_etat1.Filter()
	w_atppt.rb_rdv1.checked = true
	w_atppt.rb_etat1.checked = false
	w_atppt.dw_etat2.setFilter("code = 'DS'")
	w_atppt.dw_etat2.Filter()
	w_atppt.cb_ecran.triggerevent(clicked!)
	w_atppt.dw_tableau.print()
	w_atppt.dw_liste.print()
	
	//messagebox("trace","apres print atppt")
	
	// Analyse du respect des délais de traietement
	w_graph_analyse_respect_delai_traitement w_ardt
	open(w_ardt)
	
	// valeur de l'interface
	w_ardt.visible = false
	w_ardt.em_min.text = "-99999999" 
	w_ardt.em_max.text = "999999999" 
	w_ardt.em_date_min.text = string(date_min)
	w_ardt.em_date_max.text = string(date_max)
	w_ardt.cb_ecran.triggerevent(clicked!)
	w_ardt.dw_tableau.print()
	w_ardt.dw_liste.print()

	//messagebox("trace","apres print ardt")

	// Analyse dde la qualité du traitement
	w_graph_analyse_qualite_traitement w_aqt
	open(w_aqt)
	
	// valeur de l'interface
	w_aqt.visible = false
	w_aqt.em_min.text = "-99999999" 
	w_aqt.em_max.text = "999999999" 
	w_aqt.em_date_min.text = string(date_min)
	w_aqt.em_date_max.text = string(date_max)
	w_aqt.cb_ecran.triggerevent(clicked!)
	w_aqt.dw_tableau.print()
	w_aqt.dw_liste.print()

	
		//messagebox("trace","apres print aqt")

	
	
	//messagebox("trace","avant stat3 print")
	dw_stat3.retrieve(date_min, date_max)
	dw_stat3.print()
	
	//messagebox("trace","apres stat3")

	////messagebox("trace","avant stat4 print")
	dw_stat4.retrieve(date_min, date_max)
	dw_stat4.print()
	
	//messagebox("trace","apres stat4")

	close(w_patience)
	
end if
end event

type st_3 from statictext within w_vigie_du_cayla_stats
string tag = "a masquer"
integer x = 585
integer y = 356
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

type st_1 from statictext within w_vigie_du_cayla_stats
string tag = "a masquer"
integer x = 421
integer y = 252
integer width = 567
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période à étudier :"
end type

type em_date_min from uo_date_calendrier within w_vigie_du_cayla_stats
integer x = 965
integer y = 348
integer taborder = 130
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_vigie_du_cayla_stats
string tag = "a masquer"
integer x = 1385
integer y = 356
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

type em_date_max from uo_date_calendrier within w_vigie_du_cayla_stats
integer x = 1769
integer y = 348
integer taborder = 140
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_synthese_rdv from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 901
integer y = 144
integer width = 686
integer height = 400
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "dw_agenda_analyse_type_rdv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_snir from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 901
integer y = 560
integer width = 686
integer height = 400
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigie_snir"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_stat2 from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 901
integer y = 976
integer width = 686
integer height = 400
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigie_stats2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_stat3 from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 1911
integer y = 924
integer width = 686
integer height = 400
integer taborder = 170
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigie_stats3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_stat4 from datawindow within w_vigie_du_cayla_stats
boolean visible = false
integer x = 1893
integer y = 472
integer width = 686
integer height = 400
integer taborder = 180
boolean bringtotop = true
string title = "none"
string dataobject = "dw_vigie_stats4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

