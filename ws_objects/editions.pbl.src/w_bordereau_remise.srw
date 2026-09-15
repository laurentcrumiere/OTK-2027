$PBExportHeader$w_bordereau_remise.srw
forward
global type w_bordereau_remise from w_fenetre_arakis
end type
type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise
end type
type cb_generer from uo_picturebutton_390x120 within w_bordereau_remise
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise
end type
type st_derniere_impression from statictext within w_bordereau_remise
end type
type st_2 from statictext within w_bordereau_remise
end type
type rb_tous from radiobutton within w_bordereau_remise
end type
type rb_un from radiobutton within w_bordereau_remise
end type
type uo_size from resize_fenetre within w_bordereau_remise
end type
type st_banque from statictext within w_bordereau_remise
end type
type dw_banque from datawindow within w_bordereau_remise
end type
type dw_liste from datawindow within w_bordereau_remise
end type
type dw_prati from datawindow within w_bordereau_remise
end type
type st_max from statictext within w_bordereau_remise
end type
type st_min from statictext within w_bordereau_remise
end type
type em_min from uo_date_calendrier within w_bordereau_remise
end type
type em_max from uo_date_calendrier within w_bordereau_remise
end type
type sle_commentaire from singlelineedit within w_bordereau_remise
end type
type dw_type_regl from datawindow within w_bordereau_remise
end type
type rb_sans_patient from radiobutton within w_bordereau_remise
end type
type rb_avec_patient from radiobutton within w_bordereau_remise
end type
type rb_avec from radiobutton within w_bordereau_remise
end type
type rb_normal from radiobutton within w_bordereau_remise
end type
type rb_tri_date_payeur from radiobutton within w_bordereau_remise
end type
type rb_tri_date_saisie from radiobutton within w_bordereau_remise
end type
type rb_tri_payeur_date from radiobutton within w_bordereau_remise
end type
type rb_sans_numero_dossier from radiobutton within w_bordereau_remise
end type
type rb_avec_numero_dossier from radiobutton within w_bordereau_remise
end type
type rb_tous_reg from radiobutton within w_bordereau_remise
end type
type rb_aucun_reg from radiobutton within w_bordereau_remise
end type
type cbx_filtre from u_cst_togglebutton within w_bordereau_remise
end type
type gb_mode from groupbox within w_bordereau_remise
end type
type gb_1 from groupbox within w_bordereau_remise
end type
type gb_2 from groupbox within w_bordereau_remise
end type
type gb_patient from groupbox within w_bordereau_remise
end type
type gb_banque from groupbox within w_bordereau_remise
end type
type gb_dossier from groupbox within w_bordereau_remise
end type
type gb_3 from groupbox within w_bordereau_remise
end type
type gb_4 from groupbox within w_bordereau_remise
end type
type gb_5 from groupbox within w_bordereau_remise
end type
end forward

global type w_bordereau_remise from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4699
integer height = 2756
string title = "Nouvelle Remise en Banque"
windowtype windowtype = child!
cb_ecran cb_ecran
cb_generer cb_generer
cb_fermer cb_fermer
st_derniere_impression st_derniere_impression
st_2 st_2
rb_tous rb_tous
rb_un rb_un
uo_size uo_size
st_banque st_banque
dw_banque dw_banque
dw_liste dw_liste
dw_prati dw_prati
st_max st_max
st_min st_min
em_min em_min
em_max em_max
sle_commentaire sle_commentaire
dw_type_regl dw_type_regl
rb_sans_patient rb_sans_patient
rb_avec_patient rb_avec_patient
rb_avec rb_avec
rb_normal rb_normal
rb_tri_date_payeur rb_tri_date_payeur
rb_tri_date_saisie rb_tri_date_saisie
rb_tri_payeur_date rb_tri_payeur_date
rb_sans_numero_dossier rb_sans_numero_dossier
rb_avec_numero_dossier rb_avec_numero_dossier
rb_tous_reg rb_tous_reg
rb_aucun_reg rb_aucun_reg
cbx_filtre cbx_filtre
gb_mode gb_mode
gb_1 gb_1
gb_2 gb_2
gb_patient gb_patient
gb_banque gb_banque
gb_dossier gb_dossier
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_bordereau_remise w_bordereau_remise

type variables
//boolean prepa_faite
//double nb_dossier


// Variables mémorisant les choix de l'utilisateur à l'écran
// Pour faire la même chose à l'imprimante

string pra_min,pra_max			// praticiens
date dmin,dmax					// Dates
char monnaie						// Monnaie demandée : 'F' ou 'E'
char mode_reglement				// Vaudra 'C' ou 'E' ou autres
string libelle_mode_reglement

n_cst_PowerFilter iu_PowerFilter

// Pour eviter de faire le GroupCalc si on clic sur un bouton
boolean b_button_clicked = false
end variables

forward prototypes
public subroutine maj_dates_defaut ()
public subroutine tri_datawindows ()
public subroutine maj_commentaire (boolean mise_a_jour_praticien)
end prototypes

public subroutine maj_dates_defaut ();

// Mise à jour des dates pas défaut ... 

string v_prati 
datetime  v_derniere


if rb_un.checked  then
	v_prati = dw_prati.gettext()

	// recherche de la dernière date de remise ...
	select min(datetime(derniere_remise_effectuee)) into :v_derniere from prati where code =  :v_prati ;

else

	// recherche de la dernière date de remise ...
	select min(datetime(derniere_remise_effectuee)) into :v_derniere from prati where actif = 1 ;
	
end if

st_derniere_impression.text = string(v_derniere)
em_min.setDate( date( v_derniere) )

end subroutine

public subroutine tri_datawindows ();// Gestion du tri
string ordre_tri
if rb_tri_date_payeur.checked then 
	// Date + payeur
	ordre_tri = "paye_dateremise asc, paye_date asc,  paye_payeur asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc, paye_code_pratricien asc"
else
	if rb_tri_date_saisie.checked then 
		// Date + saisie
		ordre_tri = "paye_dateremise asc, paye_heure_saisie asc, paye_payeur asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc,  paye_date asc, paye_code_pratricien asc"
	else
		//  Payeur + Date
		ordre_tri = " paye_payeur asc, paye_dateremise asc, paye_date asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc, paye_dateremise asc,paye_code_pratricien asc"
	end if
end if



dw_liste.setSort(ordre_tri)
dw_liste.sort()


dw_liste.groupcalc()

end subroutine

public subroutine maj_commentaire (boolean mise_a_jour_praticien);
// Mise à jour auto du commentaire en fonction de ce qui est cliqué
string v_code, v_nom, v_banque, v_ident, v_prenom


if rb_tous.checked then 
	sle_commentaire.text = "Tous les praticiens"
else
	v_code = dw_prati.gettext() 
	select isnull(nom,'') + ' ' +  isnull(prenom,'')  into :v_nom from prati where code = :v_code ;
	sle_commentaire.text = v_nom
end if

string v_code_reglement

v_code_reglement = dw_type_regl.gettext()

select isnull(nom, '') into :libelle_mode_reglement from mode_reglement where code = :v_code_reglement ;

sle_commentaire.text = sle_commentaire.text + " - " + libelle_mode_reglement



v_code = dw_banque.gettext()
select isnull(ident,'') into :v_nom from banque where code = :v_code ;
sle_commentaire.text = sle_commentaire.text + " - " + v_nom


if rb_un.checked and mise_a_jour_praticien then 
	v_code_reglement = dw_type_regl.gettext()
	v_code = dw_prati.gettext() 
	v_banque = banque_par_defaut(v_code, v_code_reglement)
	select ident into :v_ident from banque where code = :v_banque ;
	dw_banque.SetItem(1,  "ident", v_ident)

end if
end subroutine

event open;call super::open;datetime d_derniere_impression
string s_code_praticien

cbx_filtre.backcolor = this.backcolor	

// Initialisation des listes ....
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()
dw_banque.settransobject(SQLCA)
dw_banque.retrieve()
dw_type_regl.settransobject(SQLCA)
dw_type_regl.retrieve()

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )

// Comme dans le livre de recettes .... si le MDP est identiques en Multi praticien, on donne la possibilité de regrouper ...

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
		rb_un.triggerevent(clicked!) 			//pour initialiser la date de dernière remise
	end if
end if


// Dates par défaut

maj_dates_defaut()
em_max.setDate(today())


uo_size.taille(this)

// On force l'itemchanged pour mettre à jour la banque par défaut du premier praticien
dw_prati.triggerevent(itemchanged!)


// Mise en place des choix par défaut mémorisés à la sortie de la fenêtre

if profilestring(dir_ini+inifile_orthokis,"REMISE","Commentaires","N") = "N" then
	rb_normal.checked = true
	rb_avec.checked = false
else
	rb_avec.checked = true
	rb_normal.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"REMISE","Patient","N") = "N" then
	rb_sans_patient.checked = true
	rb_avec_patient.checked = false
else
	rb_avec_patient.checked = true
	rb_sans_patient.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"REMISE","Dossier","N") = "N" then
	rb_sans_numero_dossier.checked = true
	rb_avec_numero_dossier.checked = false
else
	rb_avec_numero_dossier.checked = true
	rb_sans_numero_dossier.checked = false
end if

rb_tri_date_payeur.checked = false
rb_tri_date_saisie.checked = false
rb_tri_payeur_date.checked = false

if profilestring(dir_ini+inifile_orthokis,"REMISE","Tri","2") = "1" then
	rb_tri_date_payeur.checked = true
else
	if profilestring(dir_ini+inifile_orthokis,"REMISE","Tri","2") = "2" then
		rb_tri_date_saisie.checked = true
	else
		rb_tri_payeur_date.checked = true
	end if
end if

// Type de reglement
dw_type_regl.SetItem(1,  "code", profilestring(dir_ini+inifile_orthokis,"REMISE","Type_Reglement","C") )

// Praticiens
if profilestring(dir_ini+inifile_orthokis,"REMISE","Tous_praticiens","N") = "O" then
	rb_tous.checked = true
	rb_un.checked = false
	dw_prati.visible = false
else
	rb_tous.checked = false
	rb_un.checked = true
	dw_prati.visible = true
	dw_prati.SetItem(1, "code" , SetProfilestring(dir_ini+inifile_orthokis,"REMISE","Praticien", "" ) )
end if

// Banque
if profilestring(dir_ini+inifile_orthokis,"REMISE","Banque","") <> "" then
	dw_banque.SetItem(1,  "ident", profilestring(dir_ini+inifile_orthokis,"REMISE","Banque","") )
end if

tri_datawindows()

// Mise à jour du commentaire par défaut
maj_commentaire(true)


end event

on w_bordereau_remise.create
int iCurrent
call super::create
this.cb_ecran=create cb_ecran
this.cb_generer=create cb_generer
this.cb_fermer=create cb_fermer
this.st_derniere_impression=create st_derniere_impression
this.st_2=create st_2
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.uo_size=create uo_size
this.st_banque=create st_banque
this.dw_banque=create dw_banque
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.st_max=create st_max
this.st_min=create st_min
this.em_min=create em_min
this.em_max=create em_max
this.sle_commentaire=create sle_commentaire
this.dw_type_regl=create dw_type_regl
this.rb_sans_patient=create rb_sans_patient
this.rb_avec_patient=create rb_avec_patient
this.rb_avec=create rb_avec
this.rb_normal=create rb_normal
this.rb_tri_date_payeur=create rb_tri_date_payeur
this.rb_tri_date_saisie=create rb_tri_date_saisie
this.rb_tri_payeur_date=create rb_tri_payeur_date
this.rb_sans_numero_dossier=create rb_sans_numero_dossier
this.rb_avec_numero_dossier=create rb_avec_numero_dossier
this.rb_tous_reg=create rb_tous_reg
this.rb_aucun_reg=create rb_aucun_reg
this.cbx_filtre=create cbx_filtre
this.gb_mode=create gb_mode
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_patient=create gb_patient
this.gb_banque=create gb_banque
this.gb_dossier=create gb_dossier
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ecran
this.Control[iCurrent+2]=this.cb_generer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.st_derniere_impression
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.rb_tous
this.Control[iCurrent+7]=this.rb_un
this.Control[iCurrent+8]=this.uo_size
this.Control[iCurrent+9]=this.st_banque
this.Control[iCurrent+10]=this.dw_banque
this.Control[iCurrent+11]=this.dw_liste
this.Control[iCurrent+12]=this.dw_prati
this.Control[iCurrent+13]=this.st_max
this.Control[iCurrent+14]=this.st_min
this.Control[iCurrent+15]=this.em_min
this.Control[iCurrent+16]=this.em_max
this.Control[iCurrent+17]=this.sle_commentaire
this.Control[iCurrent+18]=this.dw_type_regl
this.Control[iCurrent+19]=this.rb_sans_patient
this.Control[iCurrent+20]=this.rb_avec_patient
this.Control[iCurrent+21]=this.rb_avec
this.Control[iCurrent+22]=this.rb_normal
this.Control[iCurrent+23]=this.rb_tri_date_payeur
this.Control[iCurrent+24]=this.rb_tri_date_saisie
this.Control[iCurrent+25]=this.rb_tri_payeur_date
this.Control[iCurrent+26]=this.rb_sans_numero_dossier
this.Control[iCurrent+27]=this.rb_avec_numero_dossier
this.Control[iCurrent+28]=this.rb_tous_reg
this.Control[iCurrent+29]=this.rb_aucun_reg
this.Control[iCurrent+30]=this.cbx_filtre
this.Control[iCurrent+31]=this.gb_mode
this.Control[iCurrent+32]=this.gb_1
this.Control[iCurrent+33]=this.gb_2
this.Control[iCurrent+34]=this.gb_patient
this.Control[iCurrent+35]=this.gb_banque
this.Control[iCurrent+36]=this.gb_dossier
this.Control[iCurrent+37]=this.gb_3
this.Control[iCurrent+38]=this.gb_4
this.Control[iCurrent+39]=this.gb_5
end on

on w_bordereau_remise.destroy
call super::destroy
destroy(this.cb_ecran)
destroy(this.cb_generer)
destroy(this.cb_fermer)
destroy(this.st_derniere_impression)
destroy(this.st_2)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.uo_size)
destroy(this.st_banque)
destroy(this.dw_banque)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.st_max)
destroy(this.st_min)
destroy(this.em_min)
destroy(this.em_max)
destroy(this.sle_commentaire)
destroy(this.dw_type_regl)
destroy(this.rb_sans_patient)
destroy(this.rb_avec_patient)
destroy(this.rb_avec)
destroy(this.rb_normal)
destroy(this.rb_tri_date_payeur)
destroy(this.rb_tri_date_saisie)
destroy(this.rb_tri_payeur_date)
destroy(this.rb_sans_numero_dossier)
destroy(this.rb_avec_numero_dossier)
destroy(this.rb_tous_reg)
destroy(this.rb_aucun_reg)
destroy(this.cbx_filtre)
destroy(this.gb_mode)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_patient)
destroy(this.gb_banque)
destroy(this.gb_dossier)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event resize;uo_size.retaille(this)
end event

event close;call super::close;// Mémorisation des derniers choix pour pouvoir les proposer par défaut à l'ouverture ...

if rb_normal.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Commentaires","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Commentaires","O")
end if

if rb_sans_patient.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Patient","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Patient","O")
end if

if rb_sans_numero_dossier.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Dossier","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Dossier","O")
end if

if rb_tri_date_payeur.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE","Tri","1")
else
	if rb_tri_date_saisie.checked then
		setprofilestring(dir_ini+inifile_orthokis,"REMISE","Tri","2")
	else
		setprofilestring(dir_ini+inifile_orthokis,"REMISE","Tri","3")
	end if
end if


// Type de reglement 
Setprofilestring(dir_ini+inifile_orthokis,"REMISE","Type_Reglement", dw_type_regl.GetItemString(1,  "code" ) )

// Praticiens
if rb_tous.checked then
	SetProfilestring(dir_ini+inifile_orthokis,"REMISE","Tous_praticiens","O") 
else
	SetProfilestring(dir_ini+inifile_orthokis,"REMISE","Tous_praticiens","N") 
	SetProfilestring(dir_ini+inifile_orthokis,"REMISE","Praticien", dw_prati.GetItemString(1, "code")) 
end if

// Banque
Setprofilestring(dir_ini+inifile_orthokis,"REMISE","Banque", dw_banque.GetItemString(1,  "ident" ))


end event

type p_fond from w_fenetre_arakis`p_fond within w_bordereau_remise
end type

type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise
integer x = 3355
integer y = 2440
integer width = 430
integer taborder = 90
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;// Praticiens
if rb_un.checked then
	// Pour un praticien
	pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max = pra_min
else
	 // Tous les praticiens
	 SELECT min(code),max(code) INTO :pra_min,:pra_max
	  FROM "prati" where actif = 1 ;	
end if
	

// Dates 
dmin = date(em_min.text)
dmax = date(em_max.text)


	ok_mdp = true

	if dmin <= relativedate(today(),- fxg_get_delai_mdp_financier(pra_min)) then
		ok_mdp = false
		// Si tous les praticiens,ils ont tous le même MDP

		// Saisie du mot de passe financier ....
		  SELECT "prati"."pasfin"  
		    INTO :pasfin  FROM "prati"  
		   WHERE ( "prati"."code" = :pra_min) ;

			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	end if

	if ok_mdp then

		// Mode de règlement
		mode_reglement = dw_type_regl.gettext()
		select top 1 nom into :libelle_mode_reglement from mode_reglement where code = :mode_reglement;
		

		// Monnaie demandée
		monnaie = 'E'
		

		open(w_patience)
		
		cb_generer.enabled ( false)
		
		
		
		// Avec ou ans commentaires
		if rb_normal.checked then
		// Sans commentaires
			dw_liste.Modify("DataWindow.Header.1.Height=80")
		else
			dw_liste.Modify("DataWindow.Header.1.Height=152")
		end if
	
		// Avec le patient visible ou pas
		if rb_avec_patient.checked then
			dw_liste.Modify("patient_nom.visible = 1")
			dw_liste.Modify("patient_nom_t.visible = 1")
		else
			dw_liste.Modify("patient_nom.visible = 0")
			dw_liste.Modify("patient_nom_t.visible = 0")
		end if
		
			
		// Avec le N° de dossier
		if rb_avec_numero_dossier.checked then
			dw_liste.Modify("numero_dossier.visible = 1")
			dw_liste.Modify("numero_dossier_t.visible = 1")
		else
			dw_liste.Modify("numero_dossier.visible = 0")
			dw_liste.Modify("numero_dossier_t.visible = 0")
		end if		
		
		// Inscription en dur car soucis avec le PowerFilter sinon
		dw_liste.Modify("t_mode_reglement.text = 'Mode de règlement : " + libelle_mode_reglement + " ' ")
		
		string s_ident_banque, s_code_banque
		s_code_banque = dw_banque.gettext()
//		s_code_banque = dw_banque.GetItemString(1,  "ident")		// Ident contient e
//		// Ecriture dans le .ini avant d'ouvrir le soft
//		select top 1 isnull(code, '') 
//		into :s_code_banque
//		from banque 
//		where ident = :s_ident_banque ;
		
		dw_liste.retrieve(pra_min,pra_max,dmin,dmax,monnaie,s_code_banque )
		
//		messagebox("trace", string(dw_liste.rowcount()))

		dw_liste.setfilter("paye_mode = '" + mode_reglement + "'")
		dw_liste.filter()

//		messagebox("trace", string(dw_liste.rowcount()))
	
		// Indispensable pour le calcul du nombre de pièces remises
		dw_liste.groupcalc()
		dw_liste.visible = true
		cbx_filtre.visible = true

		close(w_patience)
	end if
end event

type cb_generer from uo_picturebutton_390x120 within w_bordereau_remise
integer x = 3785
integer y = 2440
integer width = 430
integer taborder = 80
boolean enabled = false
string text = "&Générer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;



// Création de la remise ....
If messagebox("ATTENTION","Confirmez-vous la génération de la remise avec les règlements sélectionnés ?", Question!, Yesno!, 2) = 1 then
	
	string v_commentaire 
	double v_code_ajout
	long lig, tot
	
	
	v_commentaire = trim(sle_commentaire.text)
	
	// Création de la remise
	insert into remises ("commentaire", "user_modif") values (:v_commentaire, :utilisateur_code) ;
	
	if sqlca.sqlcode = 0 then
		commit ;
		select max(code) into :v_code_ajout from remises where commentaire = :v_commentaire ; 
		
		// Mise à jour des reglements de la liste
		lig = 1 
		tot = dw_liste.rowcount()
		for lig = 1 to tot
			
			if dw_liste.GetItemNumber(lig, "paye_deja_imprime") = 1 then
				// Faut la mettre 
				dw_liste.SetItem(lig, "paye_code_remise", v_code_ajout)
			end if
			
			
		next 


		if dw_liste.update() = 1 then 
			commit ;

			// Mise à jour de la date dernière remise réalisée
			if rb_un.checked then
				// Un seul praticien ...
				UPDATE prati SET derniere_remise_effectuee = getdate() WHERE code = :pra_min ;
			else
				// tous les praticiens
				UPDATE prati SET derniere_remise_effectuee = getdate() where actif = 1 ;
			end if
			commit;

			// ouverture de la fenêtre pour impression
			w_bordereau_remise_imprimer w2
			
			w_mdi_2020.uo_powerdock.of_openDocument(w2, "Remise en Banque", image_menu_listes_admini )
			
			// Mise à jour des options de fltres et affichages ...


			w2.rb_normal.checked = rb_normal.checked
			w2.rb_avec.checked = rb_avec.checked

			w2.rb_sans_patient.checked = rb_sans_patient.checked 
			w2.rb_avec_patient.checked = rb_avec_patient.checked

			w2.rb_sans_numero_dossier.checked = rb_sans_numero_dossier.checked
			w2.rb_avec_numero_dossier.checked = rb_avec_numero_dossier.checked

			w2.rb_tri_date_payeur.checked = rb_tri_date_payeur.checked
			w2.rb_tri_date_saisie.checked = rb_tri_date_saisie.checked
			w2.rb_tri_payeur_date.checked = rb_tri_payeur_date.checked

			w2.cb_ecran.triggerevent(clicked!)
			fermer_fenetre(parent)
			
		else
			Messagebox("ATTENTION","Un problème est survenu durant la création de la remise.~n~n"+sqlca.sqlerrtext)
			rollback ;
		end if


	else
		
		rollback ;
		Messagebox("ATTENTION","Un problème est survenu durant la création de la remise.~n~n"+sqlca.sqlerrtext)

	end if
	
	
end if


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise
integer x = 4215
integer y = 2440
integer width = 430
integer taborder = 80
end type

event clicked;
// mémorisations des éléments dans le close event
fermer_fenetre(parent)
end event

type st_derniere_impression from statictext within w_bordereau_remise
integer x = 3749
integer y = 152
integer width = 654
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "00/00/0000 00:00:00"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_bordereau_remise
integer x = 3063
integer y = 168
integer width = 699
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Dernière date remise :"
end type

type rb_tous from radiobutton within w_bordereau_remise
integer x = 137
integer y = 96
integer width = 654
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
end type

event clicked;dw_prati.visible = false

maj_dates_defaut()

maj_commentaire(false)


end event

type rb_un from radiobutton within w_bordereau_remise
integer x = 137
integer y = 200
integer width = 567
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
boolean checked = true
end type

event clicked;dw_prati.visible = true

maj_dates_defaut()

maj_commentaire(true)

end event

type uo_size from resize_fenetre within w_bordereau_remise
boolean visible = false
integer x = 1463
integer y = 568
integer taborder = 20
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type st_banque from statictext within w_bordereau_remise
integer x = 3063
integer y = 280
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Banque"
end type

type dw_banque from datawindow within w_bordereau_remise
string tag = "no resizeall"
integer x = 3328
integer y = 272
integer width = 1266
integer height = 76
integer taborder = 50
string dataobject = "dw_cherche_banque"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

maj_commentaire(false)
end event

type dw_liste from datawindow within w_bordereau_remise
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 46
integer y = 404
integer width = 4576
integer height = 1940
string dataobject = "dw_bordereau_remise_ecran"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_leftbuttonup;
iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)

if (not b_button_clicked and  iu_PowerFilter.checked)  then
	// pour être sûr que les affichages ne sont pas doublés
	dw_liste.groupcalc()
end if

b_button_clicked = false


end event

event retrieveend;

if rowcount > 0 then
	cb_generer.enabled ( true )
	
	long lig, tot
	
	tot = dw_liste.rowcount()
	
	// sélection de toutes les lignes
	for lig = 1 to tot
		dw_liste.SetItem(lig, "paye_deja_imprime", 1) 
	next	
	
else
	cb_generer.enabled ( false)
end if
end event

event buttonclicked;
b_button_clicked = true
// sera mis à False ensuite dans le ue_leftbutton

string ls_object

ls_Object = String(dwo.name)


choose case ls_Object
		
	// pour toutes les lignes du groupe
	case "b_selectionne" 
		// Date de jour
		long lig, tot
		
		tot = rowcount()
		
		date v_paye_date, v_paye_dateremise
		string v_paye_payeur, v_paye_mode, v_paye_commentaire
		
		lig = row
		
		v_paye_date = GetItemDate(lig,"paye_date")
		v_paye_dateremise = GetItemDate(lig,"paye_dateremise")
		v_paye_payeur = GetItemString(lig,"paye_payeur")
		v_paye_mode = GetItemString(lig,"paye_mode")
		v_paye_commentaire = GetItemString(lig,"paye_commentaire")
		
		
		do while lig <= tot 
			
			if v_paye_date = GetItemDate(lig,"paye_date") and v_paye_dateremise = GetItemDate(lig,"paye_dateremise") and &
					v_paye_payeur = GetItemString(lig,"paye_payeur") and 	v_paye_mode = GetItemString(lig,"paye_mode") and v_paye_commentaire = GetItemString(lig,"paye_commentaire") then
					
				if GetItemNumber(lig, "paye_deja_imprime") = 1 then
					SetItem(lig, "paye_deja_imprime", 0)
				else
					SetItem(lig, "paye_deja_imprime", 1)
				end if
			end if
			lig = lig + 1
		loop
	
	case "b_detail" 

			str_reglement reglement_groupe
			
			reglement_groupe.date 		= this.GetitemDate(row,"paye_date")
			reglement_groupe.payeur 	= this.GetitemString(row,"paye_payeur")
			reglement_groupe.mode 	= this.GetitemString(row,"paye_mode")
			reglement_groupe.dateremise 	=	this.GetitemDate(row,"paye_dateremise")
			reglement_groupe.commentaire = 	this.GetitemString(row,"paye_commentaire")
					
			OpenWithParm(w_reglements_regroupes, reglement_groupe)

end choose





end event

event rbuttondown;if this.visible then
	this.visible = false
	cb_generer.enabled ( false )
end if
end event

event constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;iu_PowerFilter.event ue_positionbuttons()
end event

type dw_prati from datawindow within w_bordereau_remise
string tag = "no resizeall"
integer x = 873
integer y = 212
integer width = 869
integer height = 76
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

event itemchanged;

// Recherche de la banque par défaut du praticien !

string var_praticien , var_banque


var_praticien = this.gettext()
var_banque = ''


// banque par défaut
select banque into :var_banque from prati where code = :var_praticien ; 

// mise à jour de la banque
dw_banque.setitem(1,"ident",var_banque)


maj_dates_defaut()

maj_commentaire(true)
end event

type st_max from statictext within w_bordereau_remise
integer x = 3749
integer y = 56
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
end type

type st_min from statictext within w_bordereau_remise
integer x = 3063
integer y = 56
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type em_min from uo_date_calendrier within w_bordereau_remise
integer x = 3310
integer y = 44
integer taborder = 200
boolean bringtotop = true
end type

on em_min.destroy
call uo_date_calendrier::destroy
end on

type em_max from uo_date_calendrier within w_bordereau_remise
integer x = 3931
integer y = 44
integer taborder = 210
boolean bringtotop = true
end type

on em_max.destroy
call uo_date_calendrier::destroy
end on

type sle_commentaire from singlelineedit within w_bordereau_remise
integer x = 1536
integer y = 2468
integer width = 1774
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

type dw_type_regl from datawindow within w_bordereau_remise
string tag = "position brush"
integer x = 576
integer y = 2472
integer width = 878
integer height = 68
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_type_regl_ddlb"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
maj_commentaire(false)


end event

type rb_sans_patient from radiobutton within w_bordereau_remise
integer x = 1207
integer y = 1200
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type rb_avec_patient from radiobutton within w_bordereau_remise
integer x = 1207
integer y = 1292
integer width = 224
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type rb_avec from radiobutton within w_bordereau_remise
integer x = 585
integer y = 1292
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type rb_normal from radiobutton within w_bordereau_remise
integer x = 585
integer y = 1200
integer width = 334
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type rb_tri_date_payeur from radiobutton within w_bordereau_remise
integer x = 2843
integer y = 1108
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Date + Payeur"
end type

event clicked;tri_datawindows()
end event

type rb_tri_date_saisie from radiobutton within w_bordereau_remise
integer x = 2843
integer y = 1240
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Date + Saisie"
boolean checked = true
end type

event clicked;tri_datawindows()
end event

type rb_tri_payeur_date from radiobutton within w_bordereau_remise
integer x = 2843
integer y = 1372
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Payeur + Date"
end type

event clicked;tri_datawindows()
end event

type rb_sans_numero_dossier from radiobutton within w_bordereau_remise
integer x = 1865
integer y = 1200
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type rb_avec_numero_dossier from radiobutton within w_bordereau_remise
integer x = 1865
integer y = 1292
integer width = 224
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type rb_tous_reg from radiobutton within w_bordereau_remise
integer x = 1979
integer y = 96
integer width = 663
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
string text = "Tous les règlements"
boolean checked = true
end type

event clicked;long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot
	dw_liste.SetItem(lig, "paye_deja_imprime", 1)
next


end event

type rb_aucun_reg from radiobutton within w_bordereau_remise
integer x = 1979
integer y = 196
integer width = 663
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
string text = "Aucun règlement"
end type

event clicked;long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot
	dw_liste.SetItem(lig, "paye_deja_imprime", 0)
next


end event

type cbx_filtre from u_cst_togglebutton within w_bordereau_remise
event destroy ( )
boolean visible = false
integer x = 18
integer y = 2444
integer width = 517
integer height = 92
integer taborder = 60
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

type gb_mode from groupbox within w_bordereau_remise
integer x = 549
integer y = 2380
integer width = 942
integer height = 232
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Mode de Règlement"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_bordereau_remise
integer x = 27
integer y = 12
integer width = 1847
integer height = 320
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Praticien"
end type

type gb_2 from groupbox within w_bordereau_remise
integer x = 1504
integer y = 2380
integer width = 1842
integer height = 232
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Commentaire"
borderstyle borderstyle = styleraised!
end type

type gb_patient from groupbox within w_bordereau_remise
integer x = 1170
integer y = 1124
integer width = 594
integer height = 296
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Patient"
borderstyle borderstyle = styleraised!
end type

type gb_banque from groupbox within w_bordereau_remise
integer x = 535
integer y = 1124
integer width = 594
integer height = 296
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Commentaires"
borderstyle borderstyle = styleraised!
end type

type gb_dossier from groupbox within w_bordereau_remise
integer x = 1806
integer y = 1124
integer width = 594
integer height = 296
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "N° Dossier"
end type

type gb_3 from groupbox within w_bordereau_remise
integer x = 2674
integer y = 1004
integer width = 1047
integer height = 524
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Tri"
end type

type gb_4 from groupbox within w_bordereau_remise
integer x = 430
integer y = 1004
integer width = 2158
integer height = 524
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Contenu de la liste"
end type

type gb_5 from groupbox within w_bordereau_remise
integer x = 1902
integer y = 12
integer width = 1074
integer height = 320
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection"
end type

