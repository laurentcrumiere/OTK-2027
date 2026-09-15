$PBExportHeader$w_liste_patients_appelh.srw
forward
global type w_liste_patients_appelh from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_appelh
end type
type st_2 from statictext within w_liste_patients_appelh
end type
type st_3 from statictext within w_liste_patients_appelh
end type
type dw_edition from datawindow within w_liste_patients_appelh
end type
type rte_1 from richtextedit within w_liste_patients_appelh
end type
type rte_3 from richtextedit within w_liste_patients_appelh
end type
type rte_2 from richtextedit within w_liste_patients_appelh
end type
type uo_edition from uo_edition_rtf within w_liste_patients_appelh
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_appelh
end type
type em_date_min from uo_date_calendrier within w_liste_patients_appelh
end type
type em_date_max from uo_date_calendrier within w_liste_patients_appelh
end type
type st_4 from statictext within w_liste_patients_appelh
end type
type st_5 from statictext within w_liste_patients_appelh
end type
type st_6 from statictext within w_liste_patients_appelh
end type
type em_montant_min from editmask within w_liste_patients_appelh
end type
type em_montant_max from editmask within w_liste_patients_appelh
end type
type cbx_pas_retard from checkbox within w_liste_patients_appelh
end type
type cbx_prelevements from checkbox within w_liste_patients_appelh
end type
type gb_options from groupbox within w_liste_patients_appelh
end type
end forward

global type w_liste_patients_appelh from w_liste_patients
string title = "Appels d~'Honoraires"
st_1 st_1
st_2 st_2
st_3 st_3
dw_edition dw_edition
rte_1 rte_1
rte_3 rte_3
rte_2 rte_2
uo_edition uo_edition
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
st_4 st_4
st_5 st_5
st_6 st_6
em_montant_min em_montant_min
em_montant_max em_montant_max
cbx_pas_retard cbx_pas_retard
cbx_prelevements cbx_prelevements
gb_options gb_options
end type
global w_liste_patients_appelh w_liste_patients_appelh

type variables
 string var_groupe
 

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_pra_min , var_pra_max
double code_min,code_max, montant_min, montant_max
date date_min,date_max
date v_date_limite_paye

string v_filtre

if rb_un.checked then
	var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
	var_pra_max = var_pra_min
else
	var_pra_min = ""
	var_pra_max = "ZZZZZZ"
end if


if not prepa_faite then
		
		//prepa_faite = true

		SELECT appelh_groupe INTO :var_groupe FROM param ;
		
	
		if var_groupe = "N" then
			dw_liste.object.b_selectionne.visible = false
		end if
		
		
		code_min = double(em_min.text)
		code_max = double(em_max.text)

		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)

		montant_min = double(em_montant_min.text)
		montant_max = double(em_montant_max.text)
		
		dw_liste.setfilter("")
		
		open(w_patience)
		
		if cbx_pas_retard.checked then
			v_date_limite_paye = date(2999, 12, 31)
		else
			v_date_limite_paye = date(1900, 1, 1)
		end if


		dw_liste.retrieve(code_min,code_max,var_pra_min, var_pra_max,date_min,date_max,v_date_limite_paye )
		
		v_filtre = string(montant_min) + " <= csomme_patient  and csomme_patient <=  " + string(montant_max)
		
		if cbx_prelevements.checked then 
			v_filtre = v_filtre + " and ( patient_mode_reglement_habituel <> 'R' or isnull(patient_mode_reglement_habituel) )  "
		end if
		
		if var_groupe = 'O' then
			dw_liste.Modify("Datawindow.detail.height = 0")
			dw_liste.Modify("Datawindow.header.1.height = 81")
			//dw_liste.setfilter(string(montant_min) + " <= csomme_patient  and csomme_patient <=  " + string(montant_max))
			
			// on affiche les titres des colonnes qui vont bien
			dw_liste.object.nom_complet_t.visible = true
			dw_liste.object.numero_dossier_t.visible = true
			dw_liste.object.nom_parent1_t.visible = true
			dw_liste.object.csomme_patient_t.visible = true
			dw_liste.object.cdate_patient_t.visible = true
			dw_liste.object.prochain_rdv_t.visible = true
			dw_liste.object.prelevement_t.visible = true
			dw_liste.object.prelevement_1.visible = false
			dw_liste.object.prelevement.visible = true
		else
			dw_liste.Modify("Datawindow.detail.height = 81")
			dw_liste.Modify("Datawindow.header.1.height = 0")
			//dw_liste.setfilter(string(montant_min) + " <= csomme_soin  and csomme_soin <=  " + string(montant_max))
			// on affiche les titres des colonnes qui vont bien
			dw_liste.object.nom_complet_1_t.visible = true
			dw_liste.object.numero_dossier_1_t.visible = true
			dw_liste.object.nom_parent1_1_t.visible = true
			dw_liste.object.csomme_soin_t.visible = true
			dw_liste.object.cdate_soin_t.visible = true
			dw_liste.object.prochain_rdv_1_t.visible = true
			dw_liste.object.param_appelh_non_t.visible = true
			dw_liste.object.prelevement_1_t.visible = true
			dw_liste.object.prelevement_1.visible = true
			dw_liste.object.prelevement.visible = false
			

end if		

		dw_liste.setfilter(v_filtre)
		dw_liste.filter()
		dw_liste.Groupcalc()
		
		close(w_patience)


end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(fin_mois_suivant(today()))

open(w_patience)
SELECT count(*) INTO :max_row FROM ligne_soins ; 
increment = integer(max_row / 10)
close(w_patience)
 

gb_options.backcolor = couleur_fond_fenetre
cbx_pas_retard.backcolor = couleur_fond_fenetre
cbx_prelevements.backcolor = couleur_fond_fenetre



end event

on w_liste_patients_appelh.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_edition=create dw_edition
this.rte_1=create rte_1
this.rte_3=create rte_3
this.rte_2=create rte_2
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.em_montant_min=create em_montant_min
this.em_montant_max=create em_montant_max
this.cbx_pas_retard=create cbx_pas_retard
this.cbx_prelevements=create cbx_prelevements
this.gb_options=create gb_options
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_edition
this.Control[iCurrent+5]=this.rte_1
this.Control[iCurrent+6]=this.rte_3
this.Control[iCurrent+7]=this.rte_2
this.Control[iCurrent+8]=this.uo_edition
this.Control[iCurrent+9]=this.cb_lettres
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.st_6
this.Control[iCurrent+15]=this.em_montant_min
this.Control[iCurrent+16]=this.em_montant_max
this.Control[iCurrent+17]=this.cbx_pas_retard
this.Control[iCurrent+18]=this.cbx_prelevements
this.Control[iCurrent+19]=this.gb_options
end on

on w_liste_patients_appelh.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_edition)
destroy(this.rte_1)
destroy(this.rte_3)
destroy(this.rte_2)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.em_montant_min)
destroy(this.em_montant_max)
destroy(this.cbx_pas_retard)
destroy(this.cbx_prelevements)
destroy(this.gb_options)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_appelh
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_appelh
integer x = 1701
integer taborder = 210
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_appelh
integer x = 1230
integer taborder = 170
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
prepa_faite = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_appelh
integer x = 2642
integer taborder = 220
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_appelh
integer x = 759
integer taborder = 150
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled (true )

long nbligne
Integer i

nbligne = dw_liste.RowCount()
IF var_groupe = 'O' THEN
	FOR i = 1 TO nbligne
		dw_liste.SetItem(i,"param_appelh_non" ,'O')
		dw_liste.SetTabOrder("param_appelh_non",10)
	NEXT
ELSE
	FOR i = 1 TO nbligne
		dw_liste.SetItem(i,"param_appelh_non" ,'O')
		dw_liste.SetTabOrder("param_appelh_non",10)
	NEXT	
END IF

end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_appelh
boolean visible = true
integer x = 3113
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_appel_honoraires}

boolean v_suite
long lig, tot, ligcourante
double v_code,v_code_prec
string v_nom_patient_erreur

tot = dw_liste.rowcount()
ligcourante = dw_liste.getrow()

if tot > 0 then
	IF var_groupe = 'N' THEN
		
		// En mode NON GROUPE, on ne doit avoir qu'une seule ligne sélectionnée par patient
		// => On véfifie
		
		
		dw_liste.setFilter("param_appelh_non = 'O'")
		dw_liste.filter()
		dw_liste.groupcalc()
		
		tot = dw_liste.rowcount()

		if tot > 0 then
			v_code_prec = dw_liste.GetItemNumber(1, "code")
			v_suite = true
			
			for lig = 2 to tot
				if v_code_prec = dw_liste.GetItemNumber(lig, "code") then
					v_nom_patient_erreur = dw_liste.GetItemString(lig,"nom_complet_1")
					v_suite = false
				end if
				v_code_prec = dw_liste.GetItemNumber(lig, "code")
			next
			
			if not v_suite then 
				MessageBox("ATTENTION","En mode 'Soins Groupés', vous pouvez réaliser un courrier Word à condition de ne sélectionner qu'une échéance par patient.~n~nOr, au moins 1 patient a plusieurs échéances de soins de sélectionées : "+v_nom_patient_erreur+"~n~nVeuillez corriger avant de poursuivre.")
			end if
		else
			Messagebox("ATTENTION","Vous n'avez sélectionné aucun soin.")
		end if
		
	else
			// si c groupé, alors on continue
			v_suite = true
	end if
	
	if v_suite then
		traitement_word(tab_type, dw_liste)
	end if
	//else
	//// pas groupé
	//	messagebox("ATTENTION", "Cette fonctionnalité est accesible ~nseulement lorsque les lignes sont groupées.", Exclamation!)
	//end if
end if


// On réapplique les filtres "normaux"
double montant_min, montant_max
montant_min = double(em_montant_min.text)
montant_max = double(em_montant_max.text)


if var_groupe = 'O' then
	dw_liste.Modify("Datawindow.detail.height = 0")
	dw_liste.Modify("Datawindow.header.1.height = 81")
	dw_liste.setfilter(string(montant_min) + " <= csomme_patient  and csomme_patient <=  " + string(montant_max))
else
	dw_liste.Modify("Datawindow.detail.height = 81")
	dw_liste.Modify("Datawindow.header.1.height = 0")
	dw_liste.setfilter(string(montant_min) + " <= csomme_soin  and csomme_soin <=  " + string(montant_max))
end if		

dw_liste.filter()
dw_liste.groupcalc()
dw_liste.ScrollToRow(ligcourante)

end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_appelh
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_appelh
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_appelh
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_appelh
integer taborder = 140
end type

type em_max from w_liste_patients`em_max within w_liste_patients_appelh
integer y = 616
integer taborder = 50
end type

type em_min from w_liste_patients`em_min within w_liste_patients_appelh
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_appelh
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_appelh
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_appelh
boolean visible = true
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_appelh
end type

type st_min from w_liste_patients`st_min within w_liste_patients_appelh
end type

type st_max from w_liste_patients`st_max within w_liste_patients_appelh
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_appelh
integer taborder = 200
string dataobject = "dw_liste_patients_appelh_edition"
end type

event dw_liste::rbuttondown;


if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes_Selection(this, parent, "param_appelh_non" )
end if



end event

event dw_liste::buttonclicked;call super::buttonclicked;

// Selection de la ligne pour ouvrir le menu

string ls_object

ls_Object = String(dwo.name)


choose case ls_Object
		
	// pour toutes les lignes du groupe
	case "b_selectionne" 
		setrow(row)
		OpenMenuPatient_Listes_Selection(this, parent, "param_appelh_non" )
end choose



end event

type st_1 from statictext within w_liste_patients_appelh
integer x = 347
integer y = 840
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements à recevoir :"
end type

type st_2 from statictext within w_liste_patients_appelh
integer x = 480
integer y = 964
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_3 from statictext within w_liste_patients_appelh
integer x = 1335
integer y = 960
integer width = 183
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type dw_edition from datawindow within w_liste_patients_appelh
boolean visible = false
integer x = 238
integer y = 340
integer width = 494
integer height = 360
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_appelh_edition"
end type

event printend;print_ok = true
end event

type rte_1 from richtextedit within w_liste_patients_appelh
boolean visible = false
integer x = 2139
integer y = 920
integer width = 494
integer height = 360
integer taborder = 90
long init_backcolor = 12632256
long init_inputfieldbackcolor = 12632256
boolean init_headerfooter = true
end type

on rte_1.create
HeaderFooter=true
BackColor=12632256
InputFieldBackColor=12632256
end on

type rte_3 from richtextedit within w_liste_patients_appelh
boolean visible = false
integer x = 1975
integer y = 1376
integer width = 494
integer height = 360
integer taborder = 190
long init_backcolor = 12632256
long init_inputfieldbackcolor = 12632256
boolean init_headerfooter = true
end type

on rte_3.create
HeaderFooter=true
BackColor=12632256
InputFieldBackColor=12632256
end on

type rte_2 from richtextedit within w_liste_patients_appelh
boolean visible = false
integer x = 1509
integer y = 1380
integer width = 494
integer height = 360
integer taborder = 180
long init_backcolor = 12632256
long init_inputfieldbackcolor = 12632256
boolean init_headerfooter = true
end type

on rte_2.create
HeaderFooter=true
BackColor=12632256
InputFieldBackColor=12632256
end on

type uo_edition from uo_edition_rtf within w_liste_patients_appelh
boolean visible = false
integer x = 1815
integer y = 624
integer taborder = 70
boolean bringtotop = true
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_appelh
integer x = 2171
integer y = 1868
integer width = 457
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;double tot,cpt,qui,somme, nocode,prec
integer laquelle
date da,echeance
integer num_soin
String symbole	// Symbole de la monnaie de base


if monnaie_base = 'F' then
	symbole = symbole_franc
else
	symbole = symbole_euro
end if

string entete,baspage	// Uniquement pour Baillet

// Ne sert que pour la version standard / Baillet est spécifique
	Datastore dw_donnees

	dw_donnees = CREATE DataStore
	dw_donnees.DataObject = "dw_lettre_honoraire"
	dw_donnees.SetTransObject(SQLCA)

IF var_groupe = 'N' THEN
	dw_liste.SetFilter('param_appelh_non = "O"')
END IF

dw_liste.Filter ()
	
	
dw_edition.settransobject(SQLCA)
//dw_edition_baillet.settransobject(SQLCA)

if dw_liste.rowcount() = 0 then
	Messagebox("ATTENTION","Aucun appel d'honoraires n'est à~n réaliser pour ces critères !")
else
	
	tot = dw_liste.rowcount()	
	if var_groupe = "N" then
		// Cas des envois non groupés
		FOR cpt = 1 TO tot
			nocode = dw_liste.getitemnumber(cpt,"code")
			somme = dw_liste.getitemnumber(cpt,"csomme_soin")
			da =  dw_liste.getitemdate(cpt,"cdate_soin")

			IF serial = "87016" THEN
//				// spécial BAILLET
//
//				num_soin = dw_liste.getitemnumber(cpt,"soins_numero")
//				dw_edition_baillet.retrieve(nocode)
//				dw_edition_baillet.setitem(1,"param_c3",string(somme,"#,##0.00")+" Francs à l'échéance du "+string(da,"dd/mm/yyyy"))
//				dw_edition_baillet.setitem(1,"param_c1","("+string(num_soin + 1)+"ème semestre)")
//				if num_soin = 1 then
//					dw_edition_baillet.setitem(1,"param_c2","1er")
//				else
//					dw_edition_baillet.setitem(1,"param_c2",string(num_soin)+"ème")
//				end if
//				print_ok = false
//				entete = dw_edition_baillet.GetItemString(1,"prati_entete")
//				baspage = dw_edition_baillet.GetItemString(1,"prati_bas_page")
//				rte_2.insertdocument(entete, False, FileTypeRichText!)
//				rte_3.insertdocument(baspage, False, FileTypeRichText!)
//				
//				rte_2.SelectTextAll ()
//				entete = rte_2.CopyRTF()
//				dw_edition_baillet.SelectTextAll (Header!)
//				dw_edition_baillet.PasteRTF(entete,Header!)
//							
//							
//				rte_3.SelectTextAll ()
//				baspage = rte_3.CopyRTF()
//				dw_edition_baillet.SelectTextAll (Footer!)
//				dw_edition_baillet.PasteRTF(baspage,Footer!)				
//				
//				dw_edition_baillet.print()
//					
			else			
				// Version Standard
				
				num_soin = dw_liste.getitemnumber(cpt,"soins_numero")
	
				dw_donnees.retrieve(nocode)
				
				if monnaie_base = 'F' then
					dw_donnees.setitem(1,"somme_franc",string(somme,"#,##0.00")+" "+symbole_franc)
					dw_donnees.setitem(1,"somme_euro",string(somme / taux_euro,"#,##0.00")+" "+symbole_euro)
				else
					dw_donnees.setitem(1,"somme_franc",string(somme * taux_euro,"#,##0.00")+" "+symbole_franc)
					dw_donnees.setitem(1,"somme_euro",string(somme,"#,##0.00")+" "+symbole_euro)
				end if

				dw_donnees.setitem(1,"date_soin",string(da,"dd/mm/yyyy"))

				if num_soin = 1 then
					dw_donnees.setitem(1,"no","1er")
				else
					dw_donnees.setitem(1,"no",string(num_soin)+"ème")
				end if				
			end if	
			uo_edition.edition(dw_donnees,"lettre_honoraire", false, "")
			ajout_histo_editions(nocode,"APPHON",today(),"Somme : "+string(somme,"#,##0.00")+" "+symbole+" au "+string(da,"dd/mm/yyyy"))
		NEXT
	else
		// Cas des envois groupés
		prec = 0
		FOR cpt = 1 TO tot
			nocode = dw_liste.getitemnumber(cpt,"code")
			if nocode <> prec then
				prec = nocode
				somme = dw_liste.getitemnumber(cpt,"csomme_patient")
				da =  date(dw_liste.getitemdatetime(cpt,"cdate_patient"))

				dw_donnees.retrieve(nocode)

				if monnaie_base = 'F' then
					dw_donnees.setitem(1,"somme_franc",string(somme,"#,##0.00")+" "+symbole_franc)
					dw_donnees.setitem(1,"somme_euro",string(somme / taux_euro,"#,##0.00")+" "+symbole_euro)
				else
					dw_donnees.setitem(1,"somme_franc",string(somme * taux_euro,"#,##0.00")+" "+symbole_franc)
					dw_donnees.setitem(1,"somme_euro",string(somme,"#,##0.00")+" "+symbole_euro)
				end if

				dw_donnees.setitem(1,"date_soin",string(da,"dd/mm/yyyy"))
				dw_donnees.setitem(1,"no","")
				
				uo_edition.edition(dw_donnees,"lettre_honoraire", false, "")
				ajout_histo_editions(nocode,"APPHON",today(),"Somme : "+string(somme,"#,##0.00")+" "+symbole+" au "+string(da,"dd/mm/yyyy"))


			end if			
		NEXT
	end if
	DESTROY dw_donnees

	IF var_groupe = 'N' THEN
		dw_liste.SetFilter('')
	END IF
	dw_liste.Filter ()

end if



end event

type em_date_min from uo_date_calendrier within w_liste_patients_appelh
integer x = 754
integer y = 944
integer taborder = 100
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_appelh
integer x = 1563
integer y = 944
integer taborder = 110
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_4 from statictext within w_liste_patients_appelh
integer x = 347
integer y = 1148
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Montants ;"
end type

type st_5 from statictext within w_liste_patients_appelh
integer x = 480
integer y = 1272
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre "
end type

type st_6 from statictext within w_liste_patients_appelh
integer x = 1330
integer y = 1272
integer width = 183
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et "
end type

type em_montant_min from editmask within w_liste_patients_appelh
integer x = 763
integer y = 1260
integer width = 421
integer height = 96
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "0.01"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type em_montant_max from editmask within w_liste_patients_appelh
integer x = 1550
integer y = 1260
integer width = 421
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "9999999.99"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type cbx_pas_retard from checkbox within w_liste_patients_appelh
string tag = "no resizeall"
integer x = 366
integer y = 1568
integer width = 1330
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ne pas tenir compte des règlements et retards"
end type

type cbx_prelevements from checkbox within w_liste_patients_appelh
string tag = "no resizeall"
integer x = 366
integer y = 1668
integer width = 1330
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ne pas lister les patients en prélèvement"
boolean checked = true
end type

type gb_options from groupbox within w_liste_patients_appelh
integer x = 283
integer y = 1484
integer width = 1659
integer height = 304
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Options"
end type

