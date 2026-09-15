$PBExportHeader$w_liste_patients_hitcor.srw
forward
global type w_liste_patients_hitcor from w_liste_patients
end type
type gb_choix from gb_1 within w_liste_patients_hitcor
end type
type st_1 from statictext within w_liste_patients_hitcor
end type
type st_2 from statictext within w_liste_patients_hitcor
end type
type st_3 from statictext within w_liste_patients_hitcor
end type
type em_date_min from uo_date_calendrier within w_liste_patients_hitcor
end type
type em_date_max from uo_date_calendrier within w_liste_patients_hitcor
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_hitcor
end type
type rb_contact from radiobutton within w_liste_patients_hitcor
end type
type rb_premiere from radiobutton within w_liste_patients_hitcor
end type
type rb_patient from radiobutton within w_liste_patients_hitcor
end type
type rb_enfant from radiobutton within w_liste_patients_hitcor
end type
type rb_adulte from radiobutton within w_liste_patients_hitcor
end type
type dw_liste_2013 from datawindow within w_liste_patients_hitcor
end type
type dw_liste_2012 from datawindow within w_liste_patients_hitcor
end type
type gb_2 from groupbox within w_liste_patients_hitcor
end type
end forward

global type w_liste_patients_hitcor from w_liste_patients
string title = "Hit-Parade des Correspondants"
gb_choix gb_choix
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
pb_exporter pb_exporter
rb_contact rb_contact
rb_premiere rb_premiere
rb_patient rb_patient
rb_enfant rb_enfant
rb_adulte rb_adulte
dw_liste_2013 dw_liste_2013
dw_liste_2012 dw_liste_2012
gb_2 gb_2
end type
global w_liste_patients_hitcor w_liste_patients_hitcor

type variables

// Pour avoir accès aux colonnes de CA il faut avoir les autorisation des Graphiques / Tableaux de Bord
string s_droit_ca
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,np
double code_min,code_max,nblig,cpt
date date_min,date_max
string adulte_min, adulte_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		tit = "Pour tous les Praticiens"
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
		Tit = "Pour le Dr "+np
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	
	open(w_patience)
	
	// pour actualiser les VRAIES date de premire visite
	maj_date_premiere_visite()
	
	// A GARDER SOUS CETTE FORME POUR HERITAGE ENSUITE ... AUT LAISSER LES 2 DATAWINDOWS
	if rb_premiere.checked then
		// Hit Parade premiere visite
		dw_liste.dataobject = dw_liste_2012.dataobject
		dw_liste.settransobject(sqlca)
		tit = tit + " - Date de première visite -"
		// pour actualiser les VRAIES date de premire visite
		maj_date_premiere_visite()

	else
		// Hit Parade comme en V 2013
		dw_liste.dataobject = dw_liste_2013.dataobject
		dw_liste.settransobject(sqlca)
		tit = tit + " - Date de premier contact -"
	end if
	
	if s_droit_ca = "T" then
		
		// On rend visible les colonnes de CA
		
		dw_liste.modify("chiffre_affaires_t.visible = 1")
		dw_liste.modify("chiffre_affaires.visible = 1")
		dw_liste.modify("total_chiffre_affaires.visible = 1")
		
	end if	
	
	if rb_enfant.checked then 
		tit = tit + " Que enfants -"
		adulte_min = "N"
		adulte_max = adulte_min
	else
		if rb_adulte.checked then
			tit = tit + " Que adultes -"
			adulte_min = "O"
			adulte_max = adulte_min
			
		else
			// tous ... on met rien dans le titre
			adulte_min = "N"
			adulte_max = "O"

		end if
	end if

	
	
	tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Modify("t_titre.text = '"+tit+"'")
	
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max, adulte_min, adulte_max)


	close(w_patience)


end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today()) 

// Faut prendre aussi les dossiers négatifs
em_min.text = string(min)


// Pour avoir accès aux colonnes de CA il faut avoir les autorisation des Graphiques / Tableaux de Bord

select min(table_graphique) into :s_droit_ca from utilisateurs where code = :utilisateur_code ;


gb_choix.backcolor = couleur_fond_fenetre

end event

on w_liste_patients_hitcor.create
int iCurrent
call super::create
this.gb_choix=create gb_choix
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.pb_exporter=create pb_exporter
this.rb_contact=create rb_contact
this.rb_premiere=create rb_premiere
this.rb_patient=create rb_patient
this.rb_enfant=create rb_enfant
this.rb_adulte=create rb_adulte
this.dw_liste_2013=create dw_liste_2013
this.dw_liste_2012=create dw_liste_2012
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_choix
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_date_min
this.Control[iCurrent+6]=this.em_date_max
this.Control[iCurrent+7]=this.pb_exporter
this.Control[iCurrent+8]=this.rb_contact
this.Control[iCurrent+9]=this.rb_premiere
this.Control[iCurrent+10]=this.rb_patient
this.Control[iCurrent+11]=this.rb_enfant
this.Control[iCurrent+12]=this.rb_adulte
this.Control[iCurrent+13]=this.dw_liste_2013
this.Control[iCurrent+14]=this.dw_liste_2012
this.Control[iCurrent+15]=this.gb_2
end on

on w_liste_patients_hitcor.destroy
call super::destroy
destroy(this.gb_choix)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.pb_exporter)
destroy(this.rb_contact)
destroy(this.rb_premiere)
destroy(this.rb_patient)
destroy(this.rb_enfant)
destroy(this.rb_adulte)
destroy(this.dw_liste_2013)
destroy(this.dw_liste_2012)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_hitcor
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_hitcor
integer x = 1655
integer taborder = 90
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_hitcor
integer x = 1189
end type

event cb_autre::clicked;call super::clicked;

pb_exporter.enabled ( false)



end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_hitcor
integer x = 2587
integer taborder = 100
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_hitcor
integer x = 722
end type

event cb_ecran::clicked;call super::clicked;

pb_exporter.enabled ( true)

end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_hitcor
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_hitcor
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_hitcor
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_hitcor
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_hitcor
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_hitcor
end type

type em_min from w_liste_patients`em_min within w_liste_patients_hitcor
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_hitcor
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_hitcor
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_hitcor
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_hitcor
end type

type st_min from w_liste_patients`st_min within w_liste_patients_hitcor
end type

type st_max from w_liste_patients`st_max within w_liste_patients_hitcor
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_hitcor
integer y = 0
integer taborder = 70
string dataobject = "dw_hit_parade_corresp"
end type

event dw_liste::rbuttondown;//
end event

event dw_liste::doubleclicked;
if row > 0 then
	
	string v_code
	v_code = GetItemString(row, "code")
	w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_correspondant, "Patients d'un Correspondant", image_menu_listes_admini  )
	
	w_liste_patients_correspondant.em_min.text = em_min.text
	w_liste_patients_correspondant.em_max.text = em_max.text
	w_liste_patients_correspondant.rb_contact.checked = rb_contact.checked
	w_liste_patients_correspondant.rb_premiere.checked = rb_premiere.checked
	w_liste_patients_correspondant.em_date_min.setDate(date(em_date_min.text))
	w_liste_patients_correspondant.em_date_max.setDate(date(em_date_max.text)) 
	
	w_liste_patients_correspondant.dw_corresp.Setitem(1,"code", v_code)
	w_liste_patients_correspondant.cb_ecran.triggerevent(clicked!)
end if


end event

type gb_choix from gb_1 within w_liste_patients_hitcor
integer x = 361
integer y = 1348
integer width = 850
integer height = 472
integer taborder = 70
string text = "Choix des patients"
end type

type st_1 from statictext within w_liste_patients_hitcor
integer x = 347
integer y = 1112
integer width = 809
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de premier contact :"
end type

type st_2 from statictext within w_liste_patients_hitcor
integer x = 1385
integer y = 1236
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

type st_3 from statictext within w_liste_patients_hitcor
integer x = 558
integer y = 1236
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

type em_date_min from uo_date_calendrier within w_liste_patients_hitcor
integer x = 882
integer y = 1220
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_hitcor
integer x = 1687
integer y = 1220
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_hitcor
integer x = 2121
integer y = 1868
integer width = 457
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;
Param_win[1] = "E"
openWithParm(w_exporter_datawindow_excel, dw_liste)



end event

type rb_contact from radiobutton within w_liste_patients_hitcor
integer x = 457
integer y = 904
integer width = 809
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
string text = "Date de premier contact"
boolean checked = true
end type

event clicked;st_1.text = "Date de contact"
end event

type rb_premiere from radiobutton within w_liste_patients_hitcor
integer x = 1326
integer y = 904
integer width = 763
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
string text = "Date de première visite"
end type

event clicked;st_1.text = "Date de première visite"
end event

type rb_patient from radiobutton within w_liste_patients_hitcor
integer x = 494
integer y = 1448
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
string text = "Tous"
boolean checked = true
end type

type rb_enfant from radiobutton within w_liste_patients_hitcor
integer x = 494
integer y = 1572
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
string text = "Enfants"
end type

type rb_adulte from radiobutton within w_liste_patients_hitcor
integer x = 494
integer y = 1696
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
string text = "Adultes"
end type

type dw_liste_2013 from datawindow within w_liste_patients_hitcor
string tag = "A GARDER SOUS CETTE FORME POUR HERITAGE ENSUITE"
boolean visible = false
integer x = 2487
integer y = 468
integer width = 832
integer height = 520
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_hit_parade_corresp"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_liste_2012 from datawindow within w_liste_patients_hitcor
string tag = "A GARDER SOUS CETTE FORME POUR HERITAGE ENSUITE"
boolean visible = false
integer x = 2464
integer y = 1044
integer width = 832
integer height = 520
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_hit_parade_corresp_visite"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_liste_patients_hitcor
integer x = 343
integer y = 776
integer width = 2021
integer height = 292
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Calculs selon"
borderstyle borderstyle = styleraised!
end type

