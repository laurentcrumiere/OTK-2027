$PBExportHeader$w_liste_patients_devant_argent_tp.srw
forward
global type w_liste_patients_devant_argent_tp from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_devant_argent_tp
end type
type dw_edition from datawindow within w_liste_patients_devant_argent_tp
end type
type rte_1 from richtextedit within w_liste_patients_devant_argent_tp
end type
type st_du from st_min within w_liste_patients_devant_argent_tp
end type
type st_au from st_min within w_liste_patients_devant_argent_tp
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_devant_argent_tp
end type
type em_date_ref from uo_date_calendrier within w_liste_patients_devant_argent_tp
end type
type em_date_ref2 from uo_date_calendrier within w_liste_patients_devant_argent_tp
end type
type cbx_que_fs from checkbox within w_liste_patients_devant_argent_tp
end type
type rb_tous_tp from radiobutton within w_liste_patients_devant_argent_tp
end type
type rb_une_caisse from radiobutton within w_liste_patients_devant_argent_tp
end type
type rb_une_mutuelle from radiobutton within w_liste_patients_devant_argent_tp
end type
type dw_caisse from datawindow within w_liste_patients_devant_argent_tp
end type
type dw_mutuelle from datawindow within w_liste_patients_devant_argent_tp
end type
type gb_2 from groupbox within w_liste_patients_devant_argent_tp
end type
type gb_3 from groupbox within w_liste_patients_devant_argent_tp
end type
end forward

global type w_liste_patients_devant_argent_tp from w_liste_patients
string title = "Liste des Tiers Payants devant de l~'argent"
st_1 st_1
dw_edition dw_edition
rte_1 rte_1
st_du st_du
st_au st_au
cb_lettres cb_lettres
em_date_ref em_date_ref
em_date_ref2 em_date_ref2
cbx_que_fs cbx_que_fs
rb_tous_tp rb_tous_tp
rb_une_caisse rb_une_caisse
rb_une_mutuelle rb_une_mutuelle
dw_caisse dw_caisse
dw_mutuelle dw_mutuelle
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patients_devant_argent_tp w_liste_patients_devant_argent_tp

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_pra_min, var_pra_max,tit, var_pra_min_mdp
double code_min,code_max
date date_ref,date_ref2
string caisse_min, caisse_max, mutuelle_min, mutuelle_max

if not prepa_faite then




	ok_mdp = false
	
	if rb_tous.checked then
		var_pra_min = ""
		var_pra_max = "ZZZZZZ"
	else
		var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")	
		var_pra_max = var_pra_min
	end if
	
	// pour la recherche du mot de passe ... si "Tous" est possible, c'est qu'ils ont le meme mot de passe .. on prend donc le praticien courant de la liste
	var_pra_min_mdp = dw_prati.getitemstring(dw_prati.getrow(),"code")	
  SELECT "prati"."pasfin"  
    INTO :pasfin  
    FROM "prati"  
   WHERE ( "prati"."code" = :var_pra_min_mdp ) ;

	if PLANIFICATION_EN_COURS then
		ok_mdp = true
	else
		
		// Dispense de mot de passe ?
		string v_autor
		select isnull(autor_relances_sans_mdp,'N') into :v_autor from utilisateurs where code = :utilisateur_code ;

		if v_autor = "O" then 
			ok_mdp = true
		else
			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
		end if
	end if

	if ok_mdp then
		//prepa_faite = true
		
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_ref = date(em_date_ref.text)
		date_ref2 = date(em_date_ref2.text)
	
		string que_fs
		if cbx_que_fs.checked then
			que_fs = 'O'
		else
			que_fs= 'N'
		end if
		
		caisse_min = "" 
		caisse_max = "ZZZZZZ"
		mutuelle_min = ""
		mutuelle_max = "ZZZZZZ"
		
		if rb_une_caisse.checked then
			caisse_min = dw_caisse.getitemstring(dw_caisse.getrow(),"code")	
			caisse_max = caisse_min
		else
			if rb_une_mutuelle.checked then
				mutuelle_min = dw_mutuelle.getitemstring(dw_mutuelle.getrow(),"code")	
				mutuelle_max = mutuelle_min
			end if
		end if
		
		
		open(w_patience)

		tit = "Dates de référence :  du "+em_date_ref.text+" au "+em_date_ref2.text
		dw_liste.Modify("titre.text = '"+tit+"'")	
		dw_liste.retrieve(code_min,code_max,var_pra_min, var_pra_max,date_ref,date_ref2, que_fs, caisse_min, caisse_max, mutuelle_min, mutuelle_max)
		//dw_liste.groupcalc()
		close(w_patience)
		//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
		//em_nb.visible = true
	
	end if
end if
end subroutine

event open;call super::open;em_date_ref.setDate(date(1900,1,1))
em_date_ref2.setDate((today()))
dw_edition.settransobject(SQLCA) 

SELECT min(numero_dossier)  INTO :min 
FROM patient WHERE numero_dossier < 100000000 ;

em_min.text = string(min)

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

dw_mutuelle.settransobject(sqlca)
dw_caisse.settransobject(sqlca)
dw_caisse.retrieve()
dw_mutuelle.retrieve()



end event

on w_liste_patients_devant_argent_tp.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_edition=create dw_edition
this.rte_1=create rte_1
this.st_du=create st_du
this.st_au=create st_au
this.cb_lettres=create cb_lettres
this.em_date_ref=create em_date_ref
this.em_date_ref2=create em_date_ref2
this.cbx_que_fs=create cbx_que_fs
this.rb_tous_tp=create rb_tous_tp
this.rb_une_caisse=create rb_une_caisse
this.rb_une_mutuelle=create rb_une_mutuelle
this.dw_caisse=create dw_caisse
this.dw_mutuelle=create dw_mutuelle
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_edition
this.Control[iCurrent+3]=this.rte_1
this.Control[iCurrent+4]=this.st_du
this.Control[iCurrent+5]=this.st_au
this.Control[iCurrent+6]=this.cb_lettres
this.Control[iCurrent+7]=this.em_date_ref
this.Control[iCurrent+8]=this.em_date_ref2
this.Control[iCurrent+9]=this.cbx_que_fs
this.Control[iCurrent+10]=this.rb_tous_tp
this.Control[iCurrent+11]=this.rb_une_caisse
this.Control[iCurrent+12]=this.rb_une_mutuelle
this.Control[iCurrent+13]=this.dw_caisse
this.Control[iCurrent+14]=this.dw_mutuelle
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_3
end on

on w_liste_patients_devant_argent_tp.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_edition)
destroy(this.rte_1)
destroy(this.st_du)
destroy(this.st_au)
destroy(this.cb_lettres)
destroy(this.em_date_ref)
destroy(this.em_date_ref2)
destroy(this.cbx_que_fs)
destroy(this.rb_tous_tp)
destroy(this.rb_une_caisse)
destroy(this.rb_une_mutuelle)
destroy(this.dw_caisse)
destroy(this.dw_mutuelle)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_devant_argent_tp
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_devant_argent_tp
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_devant_argent_tp
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_devant_argent_tp
integer x = 2665
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_devant_argent_tp
integer taborder = 130
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_devant_argent_tp
integer x = 3131
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_devant_argent_tp
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_devant_argent_tp
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_devant_argent_tp
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_devant_argent_tp
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_devant_argent_tp
end type

type em_min from w_liste_patients`em_min within w_liste_patients_devant_argent_tp
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_devant_argent_tp
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_devant_argent_tp
integer taborder = 40
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_devant_argent_tp
boolean visible = true
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_devant_argent_tp
end type

type st_min from w_liste_patients`st_min within w_liste_patients_devant_argent_tp
end type

type st_max from w_liste_patients`st_max within w_liste_patients_devant_argent_tp
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_devant_argent_tp
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_patients_devant_edition_tp"
end type

type st_1 from statictext within w_liste_patients_devant_argent_tp
integer x = 347
integer y = 832
integer width = 622
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Dates de référence :"
end type

type dw_edition from datawindow within w_liste_patients_devant_argent_tp
boolean visible = false
integer x = 1289
integer y = 576
integer width = 1298
integer height = 512
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_appelh_edition_tp"
end type

type rte_1 from richtextedit within w_liste_patients_devant_argent_tp
boolean visible = false
integer x = 2217
integer y = 864
integer width = 494
integer height = 360
integer taborder = 41
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_rulerbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
end type

on rte_1.create
HeaderFooter=true
InputFieldsVisible=true
PopMenu=true
RulerBar=true
WordWrap=true
BackColor=16777215
InputFieldBackColor=16777215
end on

type st_du from st_min within w_liste_patients_devant_argent_tp
integer x = 1033
integer y = 824
integer width = 146
string text = "Du "
end type

type st_au from st_min within w_liste_patients_devant_argent_tp
integer x = 1646
integer y = 824
integer width = 146
string text = "Au "
end type

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_devant_argent_tp
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;string var_pra,tit, entete, baspage
double code_min,code_max, cpt
date date_ref, date_ref2

var_pra = dw_prati.getitemstring(dw_prati.getrow(),"code")

code_min = double(em_min.text)
code_max = double(em_max.text)
	
date_ref = date(em_date_ref.text)
date_ref2 = date(em_date_ref2.text)
	
open(w_patience)

dw_edition.retrieve(code_min,code_max,var_pra,date_ref,date_ref2)

if dw_edition.rowcount() > 0 then
	entete = dw_edition.GetItemString(dw_edition.GetRow(),"prati_entete")
	baspage = dw_edition.GetItemString(dw_edition.GetRow(),"prati_bas_page")
	rte_1.insertdocument(entete, False, FileTypeRichText!)
	rte_1.SelectTextAll ()
	entete = rte_1.SelectedText( )
	rte_1.insertdocument(baspage, False, FileTypeRichText!)
	rte_1.SelectTextAll ()
	baspage = rte_1.SelectedText( )
	
	for cpt = 1 to dw_edition.rowcount()
		dw_edition.SetItem(cpt,"prati_entete",entete)
		dw_edition.SetItem(cpt,"prati_bas_page",baspage)
	next
end if
	

close(w_patience)
dw_edition.print()

















//double nbliste,cpt,dossier
//string caisse,praticien
//boolean fin
//
//cpt = 1
//
//nbliste = dw_liste.rowcount()
//
//do while cpt <= nbliste 
//
//	caisse = dw_liste.getitemstring(cpt,"code_caisse")
//	dossier = dw_liste.getitemnumber(cpt,"code")
//	praticien = dw_liste.getitemstring(cpt,"code_praticien")
//
//	// Cas du premier patient de la liste
//	dw_edition.retrieve(dossier)
//
//	dw_edition.setitem(dw_edition.getrow(),"Somme_due",dw_liste.getitemnumber(cpt,"due"))
//	dw_edition.setitem(dw_edition.getrow(),"assure",string(dw_liste.getitemnumber(cpt,"assure"),"@ @@ @@ @@ @@@ @@@ / @@"))
//
//MessageBox("assure",string(dw_liste.getitemnumber(cpt,"assure")))
//
//cpt = cpt + 1
//
//	fin = false
//
//	DO WHILE cpt <= nbliste and not fin
//		if caisse = dw_liste.getitemstring(cpt,"code_caisse") then
//			dw_edition.insertrow(0)
//			dw_edition.scrolltorow(99999)
//			dw_edition.setitem(dw_edition.getrow(),"Somme_due",dw_liste.getitemnumber(cpt,"due"))
//			dw_edition.setitem(dw_edition.getrow(),"code",dw_liste.getitemnumber(cpt,"code"))
//			dw_edition.setitem(dw_edition.getrow(),"nom",dw_liste.getitemstring(cpt,"nom"))
//			dw_edition.setitem(dw_edition.getrow(),"assure",string(dw_liste.getitemnumber(cpt,"assure"),"@ @@ @@ @@ @@@ @@@ / @@"))
//			dw_edition.setitem(dw_edition.getrow(),"patient_code_caisse",caisse)
//			dw_edition.setitem(dw_edition.getrow(),"patient_code_praticien",praticien)
//			cpt = cpt + 1
//		else
//			fin = true
//		end if
//	LOOP
//
//	dw_edition.print()
//
//
//
//LOOP
end event

type em_date_ref from uo_date_calendrier within w_liste_patients_devant_argent_tp
integer x = 1225
integer y = 816
integer taborder = 140
boolean bringtotop = true
end type

on em_date_ref.destroy
call uo_date_calendrier::destroy
end on

type em_date_ref2 from uo_date_calendrier within w_liste_patients_devant_argent_tp
integer x = 1947
integer y = 816
integer taborder = 150
boolean bringtotop = true
end type

on em_date_ref2.destroy
call uo_date_calendrier::destroy
end on

type cbx_que_fs from checkbox within w_liste_patients_devant_argent_tp
string tag = "a masquer"
integer x = 347
integer y = 1048
integer width = 2277
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ne prendre en compte que les soins ayant fait l~'objet d~'une feuille de soins"
boolean checked = true
boolean lefttext = true
end type

type rb_tous_tp from radiobutton within w_liste_patients_devant_argent_tp
integer x = 489
integer y = 1308
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;
dw_caisse.visible = false
dw_mutuelle.visible = false

end event

type rb_une_caisse from radiobutton within w_liste_patients_devant_argent_tp
integer x = 489
integer y = 1408
integer width = 389
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Une Caisse"
end type

event clicked;
dw_caisse.visible = true
dw_mutuelle.visible = false

end event

type rb_une_mutuelle from radiobutton within w_liste_patients_devant_argent_tp
integer x = 489
integer y = 1508
integer width = 430
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Une Mutuelle"
end type

event clicked;
dw_caisse.visible = false
dw_mutuelle.visible = true

end event

type dw_caisse from datawindow within w_liste_patients_devant_argent_tp
string tag = "position brush"
boolean visible = false
integer x = 1129
integer y = 1420
integer width = 1102
integer height = 76
integer taborder = 71
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_caisse"
boolean border = false
boolean livescroll = true
end type

type dw_mutuelle from datawindow within w_liste_patients_devant_argent_tp
string tag = "position brush"
boolean visible = false
integer x = 1129
integer y = 1500
integer width = 1088
integer height = 76
integer taborder = 81
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mutuelle"
boolean border = false
boolean livescroll = true
end type

type gb_2 from groupbox within w_liste_patients_devant_argent_tp
integer x = 311
integer y = 988
integer width = 2423
integer height = 164
integer taborder = 51
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_3 from groupbox within w_liste_patients_devant_argent_tp
integer x = 311
integer y = 1196
integer width = 2423
integer height = 468
integer taborder = 61
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection Tiers Payants"
end type

