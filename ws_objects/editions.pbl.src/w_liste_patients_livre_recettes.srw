$PBExportHeader$w_liste_patients_livre_recettes.srw
forward
global type w_liste_patients_livre_recettes from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_livre_recettes
end type
type st_2 from statictext within w_liste_patients_livre_recettes
end type
type st_3 from statictext within w_liste_patients_livre_recettes
end type
type gb_monnaie from groupbox within w_liste_patients_livre_recettes
end type
type cbx_dos from checkbox within w_liste_patients_livre_recettes
end type
type cbx_nomen from checkbox within w_liste_patients_livre_recettes
end type
type cbx_recap from checkbox within w_liste_patients_livre_recettes
end type
type cbx_nom from checkbox within w_liste_patients_livre_recettes
end type
type cbx_nom_payeur from checkbox within w_liste_patients_livre_recettes
end type
type cbx_moulage from checkbox within w_liste_patients_livre_recettes
end type
type cbx_commentaire from checkbox within w_liste_patients_livre_recettes
end type
type dw_soins from datawindow within w_liste_patients_livre_recettes
end type
type st_num from statictext within w_liste_patients_livre_recettes
end type
type st_a from statictext within w_liste_patients_livre_recettes
end type
type em_num1 from editmask within w_liste_patients_livre_recettes
end type
type em_num2 from editmask within w_liste_patients_livre_recettes
end type
type rb_toussoins from radiobutton within w_liste_patients_livre_recettes
end type
type rb_unsoin from radiobutton within w_liste_patients_livre_recettes
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_livre_recettes
end type
type em_date_min from uo_date_calendrier within w_liste_patients_livre_recettes
end type
type em_date_max from uo_date_calendrier within w_liste_patients_livre_recettes
end type
type rb_tri_payeur from radiobutton within w_liste_patients_livre_recettes
end type
type rb_tri_saisie from radiobutton within w_liste_patients_livre_recettes
end type
type rb_toutes_banques from radiobutton within w_liste_patients_livre_recettes
end type
type rb_une_banque from radiobutton within w_liste_patients_livre_recettes
end type
type dw_banque from datawindow within w_liste_patients_livre_recettes
end type
type rb_tous_modes from radiobutton within w_liste_patients_livre_recettes
end type
type rb_un_mode from radiobutton within w_liste_patients_livre_recettes
end type
type dw_type_regl from datawindow within w_liste_patients_livre_recettes
end type
type dw_export_recap from datawindow within w_liste_patients_livre_recettes
end type
type cb_detail from uo_picturebutton_390x120 within w_liste_patients_livre_recettes
end type
type cbx_facture from checkbox within w_liste_patients_livre_recettes
end type
type gb_options from groupbox within w_liste_patients_livre_recettes
end type
type gb_soins from groupbox within w_liste_patients_livre_recettes
end type
type gb_2 from groupbox within w_liste_patients_livre_recettes
end type
type gb_3 from groupbox within w_liste_patients_livre_recettes
end type
type gb_5 from groupbox within w_liste_patients_livre_recettes
end type
end forward

global type w_liste_patients_livre_recettes from w_liste_patients
integer width = 4247
integer height = 2296
string title = "Livre de Recettes"
boolean maxbox = false
st_1 st_1
st_2 st_2
st_3 st_3
gb_monnaie gb_monnaie
cbx_dos cbx_dos
cbx_nomen cbx_nomen
cbx_recap cbx_recap
cbx_nom cbx_nom
cbx_nom_payeur cbx_nom_payeur
cbx_moulage cbx_moulage
cbx_commentaire cbx_commentaire
dw_soins dw_soins
st_num st_num
st_a st_a
em_num1 em_num1
em_num2 em_num2
rb_toussoins rb_toussoins
rb_unsoin rb_unsoin
cb_exporter cb_exporter
em_date_min em_date_min
em_date_max em_date_max
rb_tri_payeur rb_tri_payeur
rb_tri_saisie rb_tri_saisie
rb_toutes_banques rb_toutes_banques
rb_une_banque rb_une_banque
dw_banque dw_banque
rb_tous_modes rb_tous_modes
rb_un_mode rb_un_mode
dw_type_regl dw_type_regl
dw_export_recap dw_export_recap
cb_detail cb_detail
cbx_facture cbx_facture
gb_options gb_options
gb_soins gb_soins
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
end type
global w_liste_patients_livre_recettes w_liste_patients_livre_recettes

type variables


string var_pra_min,var_pra_max	// Praticiens
date date_min,date_max			// Période
string typ_min, typ_max

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();double code_min,code_max			// Fourchette de dossier
string	tit 									// Titre de la Datawindows
char monnaie_min,monnaie_max	// Monnaie de perception
string rc

integer num_min, num_max

var_pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")

if not prepa_faite then
	

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)



		ok_mdp = true

	// pas de mot de passe si livre de recettes dans planification de taches (spécifique FAZAIEE)
	if date_min <= relativedate(today(), - fxg_get_delai_mdp_financier(var_pra_min) ) and not planification_en_cours then

		// Si délai dépassé => demande de mot de passe ...
		ok_mdp = false
		
		  SELECT "prati"."pasfin"  
			 INTO :pasfin  
			 FROM "prati"  
			WHERE ( "prati"."code" = :var_pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	end if

	if ok_mdp then
	
		//prepa_faite = true


		code_min = -99999999
		code_max = 999999999

		if rb_toussoins.checked then
			typ_min = '                  '
			typ_max = 'ZZZZZZZZZZ'
			num_min = 0
			num_max = 99
			
		else
			typ_min = dw_soins.gettext()
			typ_max = typ_min
			num_min = long(em_num1.text)
			num_max = long(em_num2.text)
		end if

		// Gestion de l'affichage
		rc = dw_liste.Modify("Datawindow.header.2.height.autosize = 'Yes'")

		if rb_un.checked then
			dw_liste.Modify("praticien.visible = 1")
			dw_liste.Modify("paye_code_praticien.visible = 1")
			dw_liste.Modify("tous.visible = 0")
			var_pra_max = var_pra_min
		else
			dw_liste.Modify("praticien.visible = 0")
			dw_liste.Modify("paye_code_praticien.visible = 0")
			dw_liste.Modify("tous.visible = 1")
			var_pra_min = "      "
			var_pra_max = "ZZZZZZ"		
		end if
		if cbx_recap.checked then
			// Livre de recettes récapitulatif
			//dw_liste.Modify("Datawindow.header.2.height = 0")
			rc = dw_liste.Modify("Datawindow.header.2.height.autosize = 'No'")
			rc = dw_liste.Modify("Datawindow.header.2.height = 0")
			dw_liste.Modify("nom_t.visible = 0")
			dw_liste.Modify("nom_payeur_t.visible = 0")
		else
			// On regarde ce qu'on doit afficher
			//dw_liste.Modify("Datawindow.header.2.height = 67")
			dw_liste.Modify("nom_t.visible = 1")
			dw_liste.Modify("nom_payeur_t.visible = 1")
		
			if cbx_nom_payeur.checked then
				// Nom du payeur
				dw_liste.Modify("payeur_t.visible = 1")
				dw_liste.Modify("paye_payeur.visible = 1")
			else
				dw_liste.Modify("payeur_t.visible = 0")
				dw_liste.Modify("paye_payeur.visible = 0")
			end if
			if cbx_nom.checked then
				// Nom du patient
				dw_liste.Modify("nom.visible = 1")
			else
				dw_liste.Modify("nom.visible = 0")
			end if

			if cbx_nomen.checked then
			// Nomenclature
				//dw_liste.Modify("Datawindow.header.2.height = 137")
				dw_liste.Modify("st_nomen.visible = 1")
				dw_liste.Modify("nomen.visible = 1")
				// Si pas le nom du payeur et pas le code, on remonte 1ère ligne
				if not(cbx_nom_payeur.checked)  then
					// Si 1 chose au plus sur 1ère colone, on reduit ...
					integer cptprems
					cptprems = 0
					if cbx_nom.checked then
						cptprems = cptprems + 1
					end if
					if cbx_nom_payeur.checked then
						cptprems = cptprems + 1
					end if
					if cbx_dos.checked then
						cptprems = cptprems + 1
					end if
					if cptprems <= 1 then
					//	dw_liste.Modify("Datawindow.header.2.height = 67")
					end if
					dw_liste.Modify("st_nomen.y = 12")
					dw_liste.Modify("nomen.y = 12")
				else
					dw_liste.Modify("st_nomen.y = 80")
					dw_liste.Modify("nomen.y = 80")
				end if
			else
				dw_liste.Modify("st_nomen.visible = 0")
				dw_liste.Modify("nomen.visible = 0")
			end if

			if cbx_commentaire.checked then
			// Commentaires
				//dw_liste.Modify("Datawindow.header.2.height = 137")
				dw_liste.Modify("st_commentaire.visible = 1")
				dw_liste.Modify("paye_commentaire.visible = 1")
				// Si pas de nomclature, on remonte d'une ligne
				if not(cbx_nomen.checked)  then
					dw_liste.Modify("st_commentaire.y = 80")
					dw_liste.Modify("paye_commentaire.y = 80")
				else
					dw_liste.Modify("st_commentaire.y = 148")
					dw_liste.Modify("paye_commentaire.y = 148")
				end if
			else
				dw_liste.Modify("st_commentaire.visible = 0")
				dw_liste.Modify("paye_commentaire.visible = 0")
			end if
			

			if cbx_dos.checked then
			// N° de dossier
				dw_liste.Modify("numero_dossier_t.visible = 1")
				dw_liste.Modify("code_t2.visible = 1")
				dw_liste.Modify("numero_dossier.visible = 1")
				dw_liste.Modify("code_t2.y = 80")
				dw_liste.Modify("numero_dossier.y = 80")
				// Si pas le nom, on remonte ...
				if not(cbx_nom.checked) then
					dw_liste.Modify("code_t2.y = 12")
					dw_liste.Modify("numero_dossier.y = 12")
				else
				//	dw_liste.Modify("Datawindow.header.2.height = 137")
				end if
			else
				dw_liste.Modify("numero_dossier_t.visible = 0")
				dw_liste.Modify("code_t2.visible = 0")
				dw_liste.Modify("numero_dossier.visible = 0")
			end if

			
			if cbx_moulage.checked then
			// N° de moulage
				dw_liste.Modify("moulage_t.visible = 1")
				dw_liste.Modify("patient_moulage.visible = 1")
				// Si pas le nom et pas le code, on remonte 1ère ligne
				if not(cbx_nom.checked) and not(cbx_dos.checked) then
					dw_liste.Modify("moulage_t.y = 12")
					dw_liste.Modify("patient_moulage.y = 12")
				else
					// Si pas le code, on remonte 2ère ligne
					if not(cbx_dos.checked) then
						dw_liste.Modify("moulage_t.y = 80")
						dw_liste.Modify("patient_moulage.y = 80")
						//dw_liste.Modify("Datawindow.header.2.height = 141")
					else
						dw_liste.Modify("moulage_t.y = 148")
						dw_liste.Modify("patient_moulage.y = 148")
						//dw_liste.Modify("Datawindow.header.2.height = 197")
					end if				
				end if
			else
				dw_liste.Modify("moulage_t.visible = 0")
				dw_liste.Modify("patient_moulage.visible = 0")
			end if
		end if	
		
		if cbx_facture.checked then
			// N° de facture 
			dw_liste.Modify("numero_facture.visible = 1")
			dw_liste.Modify("numero_facture_t.visible = 1")

			if cbx_moulage.checked then
				dw_liste.Modify("numero_facture.y = " + string( long(dw_liste.describe("moulage_t.y")) + 64 ) )
				dw_liste.Modify("numero_facture_t.y = " + dw_liste.describe("numero_facture.y") ) 
				//dw_liste.Modify("Datawindow.header.2.height = "  + string ( long ( dw_liste.describe("facture_t.y")) + 64 ) )
			else
				if cbx_dos.checked then
					dw_liste.Modify("numero_facture.y = " + string( long(dw_liste.describe("numero_dossier.y")) + 64 ) )
					dw_liste.Modify("numero_facture_t.y = " + dw_liste.describe("numero_facture.y") ) 
					//dw_liste.Modify("Datawindow.header.2.height = "  + string ( long ( dw_liste.describe("numero_dossier.y")) + 64 ) )
				else
					dw_liste.Modify("numero_facture.y = 80")
					dw_liste.Modify("numero_facture_t.y = 80")
					//dw_liste.Modify("Datawindow.header.2.height = 141")
				end if
			end if
		else
			dw_liste.Modify("numero_facture.visible = 0")
			dw_liste.Modify("numero_facture_t.visible = 0")
		end if
		
		tit = "Entre le "+em_date_min.text+" et le "+em_date_max.text

	
		open(w_patience)
		
		// Gestion du tri
		string ordre_tri
		if rb_tri_payeur.checked then 
			ordre_tri = "paye_date asc, paye_payeur asc, paye_mode asc, paye_dateremise asc, paye_commentaire asc, paye_code_praticien asc, nom asc"
		else
			ordre_tri = "paye_date asc, paye_heure_saisie asc, paye_payeur asc, paye_mode asc, paye_dateremise asc, paye_commentaire asc, paye_code_praticien asc, nom asc"
		end if
		
		dw_liste.setSort(ordre_tri)
		dw_liste.sort()
		
		dw_liste.modify("titre.text = '"+tit+"'")
		
		dw_liste.retrieve(code_min,code_max,var_pra_min,var_pra_max,date_min,date_max,'E','F',typ_min, typ_max, num_min, num_max)
		
		// Gestion de la banque et du mode dans les filtres
		string v_filtre = ""
		
		if rb_une_banque.checked then
			v_filtre = "paye_banque = '"+dw_banque.gettext()+"'"
		end if

		if rb_un_mode.checked then
			if len(trim(v_filtre)) > 0 then 
				v_filtre = v_filtre + " and "
			end if
			v_filtre = v_filtre + "paye_mode = '"+dw_type_regl.gettext()+"'"
		end if
		
		dw_liste.setfilter(v_filtre)
		dw_liste.filter()
		
		// Indispensable pour le calcul du nombre de pièces remises
		dw_liste.groupcalc()
		
		close(w_patience)
		
//		if dw_liste.rowcount() > 0 then
//			em_nb.text = string(dw_liste.getitemnumber(dw_liste.rowcount(),"compte"))+" Règlements"
//			em_nb.visible = true
//		end if
	end if
end if

end subroutine

event open;call super::open;open(w_patience)

string s_code_praticien
uo_size.taille(this)


SELECT max(numero_dossier) INTO :max FROM "patient" ;
SELECT count(*) INTO :max_row FROM "paye" ; 

em_max.text = string(max)

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()
dw_soins.settransobject(SQLCA)
dw_soins.retrieve()
dw_type_regl.settransobject(SQLCA)
dw_type_regl.retrieve()

dw_banque.settransobject(SQLCA)
dw_banque.retrieve()

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )


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

prepa_faite = false

em_date_min.setDate(today())
em_date_max.setDate(today()) 


// remise en place des last choix du user

// TRI
if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Tri_payeur","N") = "O" then
	rb_tri_payeur.checked = true
else
	rb_tri_saisie.checked = true
end if

// Options d'impressions
if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom","O") = "O" then
	cbx_nom.checked = true
else
	cbx_nom.checked = false
end if
if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom_payeur","O") = "O" then
	cbx_Nom_payeur.checked = true
else
	cbx_Nom_payeur.checked = false
end if
if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Moulage","N") = "O" then
	cbx_Moulage.checked = true
else
	cbx_Moulage.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Dossier","N") = "O" then
	cbx_dos.checked = true
else
	cbx_dos.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nomen","N") = "O" then
	cbx_nomen.checked = true
else
	cbx_nomen.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Commentaire","N") = "O" then
	cbx_commentaire.checked = true
else
	cbx_commentaire.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Recap","N") = "O" then
	cbx_recap.checked = true
else
	cbx_recap.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Facture","N") = "O" then
	cbx_facture.checked = true
else
	cbx_facture.checked = false
end if



close(w_patience)
end event

on w_liste_patients_livre_recettes.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.gb_monnaie=create gb_monnaie
this.cbx_dos=create cbx_dos
this.cbx_nomen=create cbx_nomen
this.cbx_recap=create cbx_recap
this.cbx_nom=create cbx_nom
this.cbx_nom_payeur=create cbx_nom_payeur
this.cbx_moulage=create cbx_moulage
this.cbx_commentaire=create cbx_commentaire
this.dw_soins=create dw_soins
this.st_num=create st_num
this.st_a=create st_a
this.em_num1=create em_num1
this.em_num2=create em_num2
this.rb_toussoins=create rb_toussoins
this.rb_unsoin=create rb_unsoin
this.cb_exporter=create cb_exporter
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_tri_payeur=create rb_tri_payeur
this.rb_tri_saisie=create rb_tri_saisie
this.rb_toutes_banques=create rb_toutes_banques
this.rb_une_banque=create rb_une_banque
this.dw_banque=create dw_banque
this.rb_tous_modes=create rb_tous_modes
this.rb_un_mode=create rb_un_mode
this.dw_type_regl=create dw_type_regl
this.dw_export_recap=create dw_export_recap
this.cb_detail=create cb_detail
this.cbx_facture=create cbx_facture
this.gb_options=create gb_options
this.gb_soins=create gb_soins
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.gb_monnaie
this.Control[iCurrent+5]=this.cbx_dos
this.Control[iCurrent+6]=this.cbx_nomen
this.Control[iCurrent+7]=this.cbx_recap
this.Control[iCurrent+8]=this.cbx_nom
this.Control[iCurrent+9]=this.cbx_nom_payeur
this.Control[iCurrent+10]=this.cbx_moulage
this.Control[iCurrent+11]=this.cbx_commentaire
this.Control[iCurrent+12]=this.dw_soins
this.Control[iCurrent+13]=this.st_num
this.Control[iCurrent+14]=this.st_a
this.Control[iCurrent+15]=this.em_num1
this.Control[iCurrent+16]=this.em_num2
this.Control[iCurrent+17]=this.rb_toussoins
this.Control[iCurrent+18]=this.rb_unsoin
this.Control[iCurrent+19]=this.cb_exporter
this.Control[iCurrent+20]=this.em_date_min
this.Control[iCurrent+21]=this.em_date_max
this.Control[iCurrent+22]=this.rb_tri_payeur
this.Control[iCurrent+23]=this.rb_tri_saisie
this.Control[iCurrent+24]=this.rb_toutes_banques
this.Control[iCurrent+25]=this.rb_une_banque
this.Control[iCurrent+26]=this.dw_banque
this.Control[iCurrent+27]=this.rb_tous_modes
this.Control[iCurrent+28]=this.rb_un_mode
this.Control[iCurrent+29]=this.dw_type_regl
this.Control[iCurrent+30]=this.dw_export_recap
this.Control[iCurrent+31]=this.cb_detail
this.Control[iCurrent+32]=this.cbx_facture
this.Control[iCurrent+33]=this.gb_options
this.Control[iCurrent+34]=this.gb_soins
this.Control[iCurrent+35]=this.gb_2
this.Control[iCurrent+36]=this.gb_3
this.Control[iCurrent+37]=this.gb_5
end on

on w_liste_patients_livre_recettes.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_monnaie)
destroy(this.cbx_dos)
destroy(this.cbx_nomen)
destroy(this.cbx_recap)
destroy(this.cbx_nom)
destroy(this.cbx_nom_payeur)
destroy(this.cbx_moulage)
destroy(this.cbx_commentaire)
destroy(this.dw_soins)
destroy(this.st_num)
destroy(this.st_a)
destroy(this.em_num1)
destroy(this.em_num2)
destroy(this.rb_toussoins)
destroy(this.rb_unsoin)
destroy(this.cb_exporter)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_tri_payeur)
destroy(this.rb_tri_saisie)
destroy(this.rb_toutes_banques)
destroy(this.rb_une_banque)
destroy(this.dw_banque)
destroy(this.rb_tous_modes)
destroy(this.rb_un_mode)
destroy(this.dw_type_regl)
destroy(this.dw_export_recap)
destroy(this.cb_detail)
destroy(this.cbx_facture)
destroy(this.gb_options)
destroy(this.gb_soins)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_livre_recettes
integer x = 590
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_livre_recettes
integer x = 1321
integer y = 2024
integer taborder = 80
end type

event cb_imprimer::clicked;
// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")


end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_livre_recettes
integer x = 2761
integer y = 2024
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)
cb_detail.enabled ( false)

st_min.visible = false
st_max.visible = false

em_min.visible = false
em_max.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_livre_recettes
integer x = 3241
integer y = 2024
integer taborder = 90
fontcharset fontcharset = ansi!
end type

event cb_fermer::clicked;// Mémorisation des derniers choix pour pouvoir les proposer par défaut à l'ouverture ...


// TRI
if rb_tri_payeur.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Tri_payeur","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Tri_payeur","N")
end if

if rb_tri_saisie.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Tri_saisie","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Tri_saisie","N")
end if

// Options d'impressions
if cbx_nom.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom","N")
end if

if cbx_nom_payeur.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom_payeur","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nom_payeur","N")
end if

if cbx_moulage.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Moulage","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Moulage","N")
end if

if cbx_dos.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Dossier","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Dossier","N")
end if

if cbx_nomen.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nomen","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Nomen","N")
end if

if cbx_commentaire.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Commentaire","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Commentaire","N")
end if

if cbx_facture.checked then
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Facture","O")
else
	setprofilestring(dir_ini+inifile_orthokis,"LIVRERECETTES","Facture","N")
end if




fermer_fenetre(parent)

end event

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_livre_recettes
integer x = 841
integer y = 2024
integer taborder = 70
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)
cb_detail.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_livre_recettes
integer x = 3040
integer y = 2024
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_livre_recettes
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_livre_recettes
integer x = 165
integer y = 216
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_livre_recettes
integer x = 165
integer y = 120
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_livre_recettes
integer y = 2012
integer taborder = 0
end type

type em_max from w_liste_patients`em_max within w_liste_patients_livre_recettes
boolean visible = false
integer y = 616
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_livre_recettes
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_livre_recettes
integer x = 3767
integer y = 1464
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_livre_recettes
integer x = 50
integer y = 40
integer width = 2213
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_livre_recettes
boolean visible = true
integer x = 933
integer y = 220
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_livre_recettes
end type

type st_min from w_liste_patients`st_min within w_liste_patients_livre_recettes
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_livre_recettes
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_livre_recettes
integer width = 4178
integer height = 1996
integer taborder = 0
string dataobject = "dw_liste_patients_livre_recettes"
end type

event dw_liste::buttonclicked;call super::buttonclicked;// Détail du règlement

if row > 0 then
	string ls_Object
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_detail" 
	
	
			str_reglement reglement_groupe
			
			reglement_groupe.date 		= this.GetitemDate(row,"paye_date")
			reglement_groupe.payeur 	= this.GetitemString(row,"paye_payeur")
			reglement_groupe.mode 	= this.GetitemString(row,"paye_mode")
			reglement_groupe.dateremise 	=	this.GetitemDate(row,"paye_dateremise")
			reglement_groupe.commentaire = 	this.GetitemString(row,"paye_commentaire")
					
			OpenWithParm(w_reglements_regroupes, reglement_groupe)
	end choose

end if
end event

event dw_liste::retrievestart;call super::retrievestart;
// pour éviter que les lignes soient dédoublées sur des ruptures de page
THIS.Modify ( "datawindow.PushCutControlToNextPage=yes" )
end event

type st_1 from statictext within w_liste_patients_livre_recettes
string tag = "a masquer"
integer x = 59
integer y = 384
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements reçus :"
end type

type st_2 from statictext within w_liste_patients_livre_recettes
string tag = "a masquer"
integer x = 791
integer y = 388
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

type st_3 from statictext within w_liste_patients_livre_recettes
string tag = "a masquer"
integer x = 1586
integer y = 388
integer width = 165
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type gb_monnaie from groupbox within w_liste_patients_livre_recettes
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

type cbx_dos from checkbox within w_liste_patients_livre_recettes
integer x = 165
integer y = 728
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° de dossiers"
boolean lefttext = true
end type

type cbx_nomen from checkbox within w_liste_patients_livre_recettes
integer x = 777
integer y = 728
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nomenclature"
boolean lefttext = true
end type

type cbx_recap from checkbox within w_liste_patients_livre_recettes
integer x = 1321
integer y = 844
integer width = 599
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Récapitulatif"
boolean lefttext = true
end type

event clicked;cbx_nom.enabled = not(this.checked)
cbx_nomen.enabled = not(this.checked)
cbx_nom_payeur.enabled = not(this.checked)
cbx_dos.enabled = not(this.checked)
cbx_moulage.enabled = not(this.checked)

end event

type cbx_nom from checkbox within w_liste_patients_livre_recettes
integer x = 165
integer y = 616
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du Patient"
boolean checked = true
boolean lefttext = true
end type

type cbx_nom_payeur from checkbox within w_liste_patients_livre_recettes
integer x = 777
integer y = 620
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du Payeur"
boolean checked = true
boolean lefttext = true
end type

type cbx_moulage from checkbox within w_liste_patients_livre_recettes
integer x = 1381
integer y = 620
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° Moulage"
boolean lefttext = true
end type

type cbx_commentaire from checkbox within w_liste_patients_livre_recettes
integer x = 1381
integer y = 728
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Commentaire"
boolean lefttext = true
end type

type dw_soins from datawindow within w_liste_patients_livre_recettes
string tag = "position"
boolean visible = false
integer x = 466
integer y = 1252
integer width = 1719
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_soins"
boolean border = false
end type

type st_num from statictext within w_liste_patients_livre_recettes
boolean visible = false
integer x = 1184
integer y = 1352
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Numéro :"
alignment alignment = center!
end type

type st_a from statictext within w_liste_patients_livre_recettes
boolean visible = false
integer x = 1723
integer y = 1352
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "à"
alignment alignment = center!
end type

type em_num1 from editmask within w_liste_patients_livre_recettes
boolean visible = false
integer x = 1495
integer y = 1340
integer width = 197
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "0"
boolean spin = true
string displaydata = "Ä"
end type

type em_num2 from editmask within w_liste_patients_livre_recettes
boolean visible = false
integer x = 1893
integer y = 1332
integer width = 206
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "99"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
string displaydata = ""
end type

type rb_toussoins from radiobutton within w_liste_patients_livre_recettes
integer x = 165
integer y = 1112
integer width = 791
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tous les types"
boolean checked = true
end type

event clicked;dw_soins.visible = false
st_num.visible = false
st_a.visible = false
em_num1.visible = false
em_num2.visible = false
end event

type rb_unsoin from radiobutton within w_liste_patients_livre_recettes
integer x = 165
integer y = 1256
integer width = 293
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Un type"
end type

event clicked;dw_soins.visible = true
st_num.visible = true
st_a.visible = true
em_num1.visible = true
em_num2.visible = true

end event

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_livre_recettes
integer x = 1801
integer y = 2024
integer width = 457
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string tiptext = "Export tous types / Export PDF"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

if cbx_recap.checked then
	// Export en mode récapitulatif => spécial
	
	open(w_patience)
	
	dw_export_recap.settransobject(sqlca)
	
	string banq_min, banq_max, mode_min, mode_max
	
	if rb_toutes_banques.checked then
		banq_min = ''
		banq_max = "ZZZZZZ"
	else
		banq_min = dw_banque.gettext()
		banq_max = banq_min
	end if

	if rb_tous_modes.checked then
		mode_min = ''
		mode_max = "ZZZZZZ"
	else
		mode_min = dw_type_regl.gettext()
		mode_max = mode_min
	end if

	
	
	dw_export_recap.retrieve(date_min, date_max, typ_min, typ_max, banq_min, banq_max, mode_min, mode_max, var_pra_min, var_pra_max )
	dw_export_recap.saveAs()


	close(w_patience)

else
	dw_liste.saveAs()
end if
end event

event rbuttondown;call super::rbuttondown;
if cbx_recap.checked then
	// Export en mode récapitulatif => spécial
	
	open(w_patience)
	
	dw_export_recap.settransobject(sqlca)
	
	string banq_min, banq_max, mode_min, mode_max
	
	if rb_toutes_banques.checked then
		banq_min = ''
		banq_max = "ZZZZZZ"
	else
		banq_min = dw_banque.gettext()
		banq_max = banq_min
	end if

	if rb_tous_modes.checked then
		mode_min = ''
		mode_max = "ZZZZZZ"
	else
		mode_min = dw_type_regl.gettext()
		mode_max = mode_min
	end if

	
	
	dw_export_recap.retrieve(date_min, date_max, typ_min, typ_max, banq_min, banq_max, mode_min, mode_max, var_pra_min, var_pra_max )
	
	// Variable passée en paramètre....
	param_win[1] = "P"
	openWithParm(w_exporter_datawindow_excel, dw_export_recap)

	close(w_patience)

else

	param_win[1] = "P"
	openWithParm(w_exporter_datawindow_excel, dw_liste)
end if

end event

type em_date_min from uo_date_calendrier within w_liste_patients_livre_recettes
integer x = 1083
integer y = 380
integer taborder = 190
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_livre_recettes
integer x = 1888
integer y = 380
integer taborder = 200
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_tri_payeur from radiobutton within w_liste_patients_livre_recettes
integer x = 2432
integer y = 1132
integer width = 960
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ordre alphabétique du payeur"
end type

type rb_tri_saisie from radiobutton within w_liste_patients_livre_recettes
integer x = 2432
integer y = 1232
integer width = 960
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Selon l~'heure de saisie"
boolean checked = true
end type

type rb_toutes_banques from radiobutton within w_liste_patients_livre_recettes
integer x = 165
integer y = 1580
integer width = 640
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes les banques"
boolean checked = true
end type

event clicked;

dw_banque.visible = false
end event

type rb_une_banque from radiobutton within w_liste_patients_livre_recettes
integer x = 165
integer y = 1716
integer width = 640
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Une banque"
end type

event clicked;

dw_banque.visible = true
end event

type dw_banque from datawindow within w_liste_patients_livre_recettes
string tag = "position"
boolean visible = false
integer x = 750
integer y = 1712
integer width = 1266
integer height = 92
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_banque"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_tous_modes from radiobutton within w_liste_patients_livre_recettes
integer x = 2409
integer y = 1580
integer width = 640
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tous les modes"
boolean checked = true
end type

event clicked;

dw_type_regl.visible = false
end event

type rb_un_mode from radiobutton within w_liste_patients_livre_recettes
integer x = 2409
integer y = 1716
integer width = 448
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Un mode"
end type

event clicked;
dw_type_regl.visible = true


end event

type dw_type_regl from datawindow within w_liste_patients_livre_recettes
string tag = "position brush"
boolean visible = false
integer x = 2912
integer y = 1716
integer width = 873
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_type_regl_ddlb"
boolean border = false
boolean livescroll = true
end type

type dw_export_recap from datawindow within w_liste_patients_livre_recettes
boolean visible = false
integer x = 2359
integer y = 156
integer width = 1829
integer height = 728
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_export_recettes_recap"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_detail from uo_picturebutton_390x120 within w_liste_patients_livre_recettes
integer x = 2281
integer y = 2024
integer width = 457
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "Détaillé"
string tiptext = "Livre de recettes avec 1 colonne par mode de règlement"
string iconname = "ACTIONS_tableau.png"
end type

event clicked;call super::clicked;open(w_liste_patients_livre_recettes_detaille)
end event

type cbx_facture from checkbox within w_liste_patients_livre_recettes
integer x = 165
integer y = 840
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "N° de factures"
boolean lefttext = true
end type

type gb_options from groupbox within w_liste_patients_livre_recettes
integer x = 50
integer y = 496
integer width = 2213
integer height = 464
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Options d~'impression"
end type

type gb_soins from groupbox within w_liste_patients_livre_recettes
integer x = 50
integer y = 1012
integer width = 2213
integer height = 420
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection sur le type de soins"
end type

type gb_2 from groupbox within w_liste_patients_livre_recettes
integer x = 2322
integer y = 1012
integer width = 1225
integer height = 420
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Ordre de Tri"
end type

type gb_3 from groupbox within w_liste_patients_livre_recettes
integer x = 50
integer y = 1452
integer width = 2213
integer height = 420
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection sur la banque"
end type

type gb_5 from groupbox within w_liste_patients_livre_recettes
integer x = 2322
integer y = 1452
integer width = 1614
integer height = 420
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection sur le mode de règlement"
end type

