$PBExportHeader$w_liste_patients_devant_argent_prorata.srw
forward
global type w_liste_patients_devant_argent_prorata from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_devant_argent_prorata
end type
type st_2 from statictext within w_liste_patients_devant_argent_prorata
end type
type em_montant from editmask within w_liste_patients_devant_argent_prorata
end type
type uo_edition from uo_edition_rtf within w_liste_patients_devant_argent_prorata
end type
type st_au from st_min within w_liste_patients_devant_argent_prorata
end type
type st_du from st_min within w_liste_patients_devant_argent_prorata
end type
type st_3 from st_min within w_liste_patients_devant_argent_prorata
end type
type st_4 from st_min within w_liste_patients_devant_argent_prorata
end type
type rb_doivent from radiobutton within w_liste_patients_devant_argent_prorata
end type
type rb_avance from radiobutton within w_liste_patients_devant_argent_prorata
end type
type rb_deux from radiobutton within w_liste_patients_devant_argent_prorata
end type
type rb_tous_soins from radiobutton within w_liste_patients_devant_argent_prorata
end type
type rb_debutant_terminant from radiobutton within w_liste_patients_devant_argent_prorata
end type
type rb_debutant_non from radiobutton within w_liste_patients_devant_argent_prorata
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_devant_argent_prorata
end type
type em_date_ref2 from uo_date_calendrier within w_liste_patients_devant_argent_prorata
end type
type em_date_ref from uo_date_calendrier within w_liste_patients_devant_argent_prorata
end type
type cbx_soins_regles from checkbox within w_liste_patients_devant_argent_prorata
end type
type gb_somme from groupbox within w_liste_patients_devant_argent_prorata
end type
type gb_2 from groupbox within w_liste_patients_devant_argent_prorata
end type
type gb_3 from groupbox within w_liste_patients_devant_argent_prorata
end type
end forward

global type w_liste_patients_devant_argent_prorata from w_liste_patients
string title = "Liste des Patients devant de l~'argent - Prorata"
st_1 st_1
st_2 st_2
em_montant em_montant
uo_edition uo_edition
st_au st_au
st_du st_du
st_3 st_3
st_4 st_4
rb_doivent rb_doivent
rb_avance rb_avance
rb_deux rb_deux
rb_tous_soins rb_tous_soins
rb_debutant_terminant rb_debutant_terminant
rb_debutant_non rb_debutant_non
cb_exporter cb_exporter
em_date_ref2 em_date_ref2
em_date_ref em_date_ref
cbx_soins_regles cbx_soins_regles
gb_somme gb_somme
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patients_devant_argent_prorata w_liste_patients_devant_argent_prorata

type variables
string var_groupe
double max_row1,max_row2
end variables

forward prototypes
public subroutine prepa ()
public subroutine detail_soins ()
end prototypes

public subroutine prepa ();string 	var_pra_min, var_pra_max
double 	code_min,code_max
date 		date_ref,date_ref2
real 		montant
long		llg_nbr_row, llg_cur
long		llg_newrow
double	ldbl_patient1, ldbl_patient2

if not prepa_faite then

	ok_mdp = false
	
	if rb_tous.checked then
		var_pra_min = ""
		var_pra_max = "ZZZZZZ"
	else
		var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
		var_pra_max = var_pra_min
	end if


  SELECT "prati"."pasfin"  
    INTO :pasfin  
    FROM "prati"  
   WHERE ( "prati"."code" = :var_pra_min ) ;

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
		//prepa_faite = true
	
		SELECT relance_groupe INTO :var_groupe FROM param ;
		
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_ref = date(em_date_ref.text)
		date_ref2 = date(em_date_ref2.text)
	
		
		open(w_patience)


 		increment = integer(max_row1 / 10)

		dw_liste.Modify("sous_titre.text = 'Période : "+em_date_ref.text+" à "+  em_date_ref2.text +"'" )

		// Pas de filtre
		dw_liste.setfilter("")
		dw_liste.filter()
		
		date fin1, fin2
		// Filtre sur les dates de fin
		if rb_tous_soins.checked then
			// on se fout de la date de soin
			fin1 = date('1900-01-01')
			fin2 = date('2900-01-01')
		else
			if rb_debutant_terminant.checked then
				// la date de fin est dans l'exercice
				fin1 = date_ref
				fin2 = date_ref2
			else
				if rb_debutant_non.checked then
					// La date de fin est postérieure à l'exercice
					fin1 = relativedate(date_ref2,1)
					fin2 = date('2900-01-01')
				end if
			end if
		end if
		
		dw_liste.retrieve(code_min,code_max,var_pra_min, var_pra_max,date_ref, date_ref2, fin1, fin2)

		// Filtre sur la somme due
		if rb_doivent.checked then
			// On applique le filtre sur le montant en référence
			dw_liste.setfilter("du_patient > 0  ")
		else
			if rb_avance.checked then
				dw_liste.setfilter("du_patient < 0  ")
			else
				// Pas de filtre !!!
				// dw_liste.setfilter("du_patient <> 0  ")
			end if
		end if
		
		dw_liste.filter()
		
		// Mise à jour des zones exportables  
		
		long lig, tot
		tot = dw_liste.rowcount()
		
		for lig = 1 to tot
			dw_liste.setitem(lig, "du_prorata", string(dw_liste.getItemNumber(lig, "du_proratise"), '0.00'))
			dw_liste.setitem(lig, "soins_total_proratise", string(dw_liste.getItemNumber(lig, "soin_proratise"), '0.00'))
			
			dw_liste.setitem(lig, "somme_due_patient", string(dw_liste.getItemNumber(lig, "du_patient"), '0.00'))
			dw_liste.setitem(lig, "total_soins_patient", string(dw_liste.getItemNumber(lig, "total_soins"), '0.00'))
			dw_liste.setitem(lig, "soins_periode_patient", string(dw_liste.getItemNumber(lig, "soins_periode"), '0.00'))
			dw_liste.setitem(lig, "reglements_patient", string(dw_liste.getItemNumber(lig, "total_regl"), '0.00'))
		next
		
		detail_soins()

		close(w_patience)
		
	end if
end if

end subroutine

public subroutine detail_soins ();

if cbx_soins_regles.checked then 
	//dw_liste.object.datawindow.detail.height = 84
	dw_liste.object.datawindow.detail.Height.AutoSize = 'yes'

	dw_liste.modify("datawindow.header.height = 492")
else
	dw_liste.object.datawindow.detail.Height.AutoSize = 'No'
	dw_liste.object.datawindow.detail.height = 0
	dw_liste.modify("datawindow.header.height = 372")
end if
end subroutine

on w_liste_patients_devant_argent_prorata.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.em_montant=create em_montant
this.uo_edition=create uo_edition
this.st_au=create st_au
this.st_du=create st_du
this.st_3=create st_3
this.st_4=create st_4
this.rb_doivent=create rb_doivent
this.rb_avance=create rb_avance
this.rb_deux=create rb_deux
this.rb_tous_soins=create rb_tous_soins
this.rb_debutant_terminant=create rb_debutant_terminant
this.rb_debutant_non=create rb_debutant_non
this.cb_exporter=create cb_exporter
this.em_date_ref2=create em_date_ref2
this.em_date_ref=create em_date_ref
this.cbx_soins_regles=create cbx_soins_regles
this.gb_somme=create gb_somme
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_montant
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.st_au
this.Control[iCurrent+6]=this.st_du
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.rb_doivent
this.Control[iCurrent+10]=this.rb_avance
this.Control[iCurrent+11]=this.rb_deux
this.Control[iCurrent+12]=this.rb_tous_soins
this.Control[iCurrent+13]=this.rb_debutant_terminant
this.Control[iCurrent+14]=this.rb_debutant_non
this.Control[iCurrent+15]=this.cb_exporter
this.Control[iCurrent+16]=this.em_date_ref2
this.Control[iCurrent+17]=this.em_date_ref
this.Control[iCurrent+18]=this.cbx_soins_regles
this.Control[iCurrent+19]=this.gb_somme
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.gb_3
end on

on w_liste_patients_devant_argent_prorata.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_montant)
destroy(this.uo_edition)
destroy(this.st_au)
destroy(this.st_du)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.rb_doivent)
destroy(this.rb_avance)
destroy(this.rb_deux)
destroy(this.rb_tous_soins)
destroy(this.rb_debutant_terminant)
destroy(this.rb_debutant_non)
destroy(this.cb_exporter)
destroy(this.em_date_ref2)
destroy(this.em_date_ref)
destroy(this.cbx_soins_regles)
destroy(this.gb_somme)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;em_date_ref.setDate(date(year(today()) - 1, 1, 1))
em_date_ref2.setDate(date (year(today()) - 1, 12, 31))

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


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_devant_argent_prorata
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_devant_argent_prorata
integer x = 1513
integer taborder = 140
string text = "&Imp. Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_devant_argent_prorata
integer x = 1033
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_devant_argent_prorata
integer x = 2473
integer taborder = 150
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_devant_argent_prorata
integer x = 553
integer taborder = 160
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)

end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_devant_argent_prorata
integer x = 2889
end type

event cb_lien_word::clicked;//int	tab_type[3] = {lettre_relance_1, lettre_relance_2, lettre_relance_3}
//
//
//IF var_groupe <> 'N' THEN
//// si c groupé, alors on continue
//	traitement_word(tab_type, dw_liste_groupe)
//	
//else
//// pas groupé
//	messagebox("ATTENTION", "Cette fonctionnalité est accesible ~nseulement lorsque les lignes sont groupées.", Exclamation!)
//end if
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_devant_argent_prorata
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_devant_argent_prorata
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_devant_argent_prorata
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_devant_argent_prorata
integer taborder = 90
end type

type em_max from w_liste_patients`em_max within w_liste_patients_devant_argent_prorata
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_liste_patients_devant_argent_prorata
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_devant_argent_prorata
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_devant_argent_prorata
integer taborder = 70
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_devant_argent_prorata
boolean visible = true
integer taborder = 130
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_devant_argent_prorata
end type

type st_min from w_liste_patients`st_min within w_liste_patients_devant_argent_prorata
end type

type st_max from w_liste_patients`st_max within w_liste_patients_devant_argent_prorata
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_devant_argent_prorata
integer y = 12
integer width = 3698
integer height = 1832
integer taborder = 120
string dataobject = "dw_liste_patients_devant_argent_prorata"
end type

event dw_liste::retrieverow;call super::retrieverow;maj_patience(row,increment)
end event

type st_1 from statictext within w_liste_patients_devant_argent_prorata
string tag = "a masquer"
integer x = 347
integer y = 828
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

type st_2 from statictext within w_liste_patients_devant_argent_prorata
boolean visible = false
integer x = 347
integer y = 1044
integer width = 539
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Montant minimal :"
alignment alignment = right!
end type

type em_montant from editmask within w_liste_patients_devant_argent_prorata
boolean visible = false
integer x = 987
integer y = 1024
integer width = 421
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type uo_edition from uo_edition_rtf within w_liste_patients_devant_argent_prorata
event destroy ( )
boolean visible = false
integer x = 1403
integer y = 56
integer taborder = 60
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type st_au from st_min within w_liste_patients_devant_argent_prorata
boolean visible = false
integer x = 1646
integer y = 824
integer width = 146
string text = "Au "
end type

type st_du from st_min within w_liste_patients_devant_argent_prorata
boolean visible = false
integer x = 1033
integer y = 824
integer width = 146
string text = "Du "
end type

type st_3 from st_min within w_liste_patients_devant_argent_prorata
integer x = 1033
integer y = 824
integer width = 146
string text = "Du "
end type

type st_4 from st_min within w_liste_patients_devant_argent_prorata
integer x = 1746
integer y = 824
integer width = 146
string text = "Au "
end type

type rb_doivent from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 238
integer y = 1116
integer width = 1033
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
string text = "Patients qui doivent de l~'argent"
boolean checked = true
end type

type rb_avance from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 238
integer y = 1220
integer width = 1033
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
string text = "Patients qui ont payé par avance"
end type

type rb_deux from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 238
integer y = 1324
integer width = 1033
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
string text = "Les deux"
end type

type rb_tous_soins from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 1746
integer y = 1116
integer width = 1275
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
string text = "Tous les soins débutant dans la période"
boolean checked = true
end type

type rb_debutant_terminant from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 1746
integer y = 1220
integer width = 1550
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
string text = "Tous les soins débutant et se terminant dans la période"
end type

type rb_debutant_non from radiobutton within w_liste_patients_devant_argent_prorata
integer x = 1746
integer y = 1324
integer width = 1783
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
string text = "Tous les soins débutant et ne se terminant pas dans la période"
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_devant_argent_prorata
integer x = 1993
integer y = 1868
integer width = 457
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type em_date_ref2 from uo_date_calendrier within w_liste_patients_devant_argent_prorata
integer x = 1947
integer y = 816
integer taborder = 120
boolean bringtotop = true
end type

on em_date_ref2.destroy
call uo_date_calendrier::destroy
end on

type em_date_ref from uo_date_calendrier within w_liste_patients_devant_argent_prorata
integer x = 1225
integer y = 816
integer taborder = 130
boolean bringtotop = true
end type

on em_date_ref.destroy
call uo_date_calendrier::destroy
end on

type cbx_soins_regles from checkbox within w_liste_patients_devant_argent_prorata
integer x = 3035
integer y = 1888
integer width = 567
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
string text = "Détail des soins"
end type

event clicked;
detail_soins()
end event

type gb_somme from groupbox within w_liste_patients_devant_argent_prorata
integer x = 160
integer y = 1024
integer width = 1445
integer height = 420
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Filtre Somme due"
end type

type gb_2 from groupbox within w_liste_patients_devant_argent_prorata
integer x = 1659
integer y = 1024
integer width = 2007
integer height = 420
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Filtres Soins"
end type

type gb_3 from groupbox within w_liste_patients_devant_argent_prorata
integer x = 2967
integer y = 1828
integer width = 745
integer height = 172
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

