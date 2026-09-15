$PBExportHeader$w_soins_maj_internet.srw
forward
global type w_soins_maj_internet from w_fenetre_arakis
end type
type dw_liste from datawindow within w_soins_maj_internet
end type
type cb_creation from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type pb_fermer from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type pb_maj from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type cbx_dentiste from checkbox within w_soins_maj_internet
end type
type cbx_orthodontie from checkbox within w_soins_maj_internet
end type
type cbx_parodontie from checkbox within w_soins_maj_internet
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type cb_annuler from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type pb_imprimer from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type pb_majtous from uo_picturebutton_390x120 within w_soins_maj_internet
end type
type cbx_presents from checkbox within w_soins_maj_internet
end type
type cb_rafraichir from picturebutton within w_soins_maj_internet
end type
type pb_aide from uo_bouton_aide within w_soins_maj_internet
end type
type pb_chercher from picturebutton within w_soins_maj_internet
end type
type dw_liste_maj_internet from datawindow within w_soins_maj_internet
end type
type gb_filtres from groupbox within w_soins_maj_internet
end type
type dw_soin_fiche from datawindow within w_soins_maj_internet
end type
type cbx_maj_code_inami_libelle from checkbox within w_soins_maj_internet
end type
type cbx_maj_nom from checkbox within w_soins_maj_internet
end type
type cbx_autres from checkbox within w_soins_maj_internet
end type
end forward

global type w_soins_maj_internet from w_fenetre_arakis
integer width = 4965
integer height = 2944
string title = "Mise à jour des Soins à Partir d~'Internet"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_liste dw_liste
cb_creation cb_creation
pb_fermer pb_fermer
pb_maj pb_maj
cbx_dentiste cbx_dentiste
cbx_orthodontie cbx_orthodontie
cbx_parodontie cbx_parodontie
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
pb_imprimer pb_imprimer
pb_majtous pb_majtous
cbx_presents cbx_presents
cb_rafraichir cb_rafraichir
pb_aide pb_aide
pb_chercher pb_chercher
dw_liste_maj_internet dw_liste_maj_internet
gb_filtres gb_filtres
dw_soin_fiche dw_soin_fiche
cbx_maj_code_inami_libelle cbx_maj_code_inami_libelle
cbx_maj_nom cbx_maj_nom
cbx_autres cbx_autres
end type
global w_soins_maj_internet w_soins_maj_internet

type variables


// Accées internet
Inet iinet_base

// Retour XML
n_inetresult in_irdata

constant string url_arakis = "https://www.arakis.fr/inami/getinami2.php?mdp=m79DiZ3y"


constant string nom_fichier_recu = "inami_tmp.xml"


string v_dentisterie, v_orthodontie, v_parodontie, v_que_presents, v_autres
end variables

forward prototypes
public subroutine appliquer_filtre ()
public subroutine mise_a_jour (long lig, boolean avec_message)
public subroutine init ()
public subroutine affiche_soin_ligne (long row)
end prototypes

public subroutine appliquer_filtre ();

string filtre = ""

if v_dentisterie = "N" and v_orthodontie = "N" and v_parodontie = "N"  and v_autres = "N" then
	// aucun élément ne doit être affiché
	filtre = "dentiste = 'Z'"
else
	if v_dentisterie = "O" then
		filtre = "dentiste = '" + v_dentisterie + "'"
	end if
	
	if v_orthodontie = "O" then
		if filtre <> "" then
			filtre = filtre + " or "
		end if
		filtre = filtre +  " orthodontie = '" + v_orthodontie +"'"
	end if
	
	if v_parodontie = "O" then
		if filtre <> "" then
			filtre = filtre + " or "
		end if
		filtre = filtre + " parodontologie = '"+ v_parodontie +"'"
	end if
	
	if v_autres = "O" then
		if filtre <> "" then
			filtre = filtre + " or "
		end if
		filtre = filtre + " (isnull(parodontologie) and isnull(orthodontie) and isnull(dentiste))"
	end if
end if

if cbx_presents.checked then
		if filtre <> "" then
			filtre = "("  + filtre + ")  and "
		end if
		filtre = filtre + " integer(right(dent, 1)) > 0"
end if 


dw_liste.setfilter(filtre)
dw_liste.filter()
dw_liste.groupcalc()

end subroutine

public subroutine mise_a_jour (long lig, boolean avec_message);

// Recopie les valeurs de la liste dans la fiche et enregsitre directement !!!


decimal {2}  v_hono, v_multiplication, v_depasse, v_total
long lig_maj	 
string v_code, v_nom, v_libelle

v_total = dw_soin_fiche.getitemnumber(1, "total")
v_depasse = dw_soin_fiche.getitemnumber(1, "depasse")

v_code = dw_soin_fiche.getitemString(1, "code")
v_nom = dw_soin_fiche.getitemString(1, "nom")

dw_soin_fiche.setitem(1, "lettre",dw_liste.getitemstring(lig, "lettre"))
dw_soin_fiche.setitem(1, "nb_lettre",dw_liste.getitemnumber(lig, "nombre_lettre"))
dw_soin_fiche.setitem(1, "valeur",dw_liste.getitemnumber(lig, "valeur_lettre"))
dw_soin_fiche.setitem(1, "coefficient_p",dw_liste.getitemnumber(lig, "indice_p"))
dw_soin_fiche.setitem(1, "valeur",dw_liste.getitemnumber(lig, "valeur_lettre"))
dw_soin_fiche.setitem(1, "inter_inami_avec",dw_liste.getitemnumber(lig, "intervention_avec"))
dw_soin_fiche.setitem(1, "inter_inami_sans",dw_liste.getitemnumber(lig, "intervention_sans"))

if upper(dw_liste.getitemstring(lig, "description")) = "PRESTATIONS RELATIVES" then
	dw_soin_fiche.setitem(1, "categorie_pseudocode",string(dw_liste.getitemnumber(lig, "description_1_numerique")))
	dw_soin_fiche.setitem(1, "pseudocode","O")
else
	dw_soin_fiche.setitem(1, "pseudocode","N")
	dw_soin_fiche.setitem(1, "categorie_pseudocode","")
end if

if cbx_maj_nom.checked then

	if cbx_maj_code_inami_libelle.checked then 
		// Nom = code INALMI  - Nom
		dw_soin_fiche.setitem(1, "nom",dw_liste.getitemstring(lig, "code") + " - " + dw_liste.getitemstring(lig, "nom"))
	else
		// Nom = Nom 
		dw_soin_fiche.setitem(1, "nom",dw_liste.getitemstring(lig, "nom"))
	end if

end if

v_hono = dw_liste.getitemnumber(lig, "honoraire") 
v_multiplication = dw_liste.getitemnumber(lig, "nombre_lettre") * dw_liste.getitemnumber(lig, "valeur_lettre")

if v_hono <> v_multiplication and avec_message then 
	Messagebox("ATTENTION","Le prix des honoraires annoncé (" + string(v_hono) +") n'est pas égal à 'nombre de lettres' x 'valeur de la lettre'  ("+ string( v_multiplication) + ")")
end if





if v_multiplication > v_total then
	
	// Mémorisation du changement

	if not avec_message and( v_total <> v_multiplication or v_depasse <> 0)  then 
		dw_liste_maj_internet.insertrow(999)
		lig_maj = dw_liste_maj_internet.rowcount()
		dw_liste_maj_internet.setitem(lig_maj, "code", v_code )
		dw_liste_maj_internet.setitem(lig_maj, "libelle", v_nom )
		dw_liste_maj_internet.setitem(lig_maj, "changement", "Total : " + string(v_total, "0.00") + " € -> " +  string(v_multiplication, "0.00") + " €~n~nDépassement : " +string(v_depasse, "0.00") + " € ->  0.00 €"  )
		
	end if

	
	dw_soin_fiche.setitem(1, "total", v_multiplication)
	dw_soin_fiche.setitem(1, "depasse",0)
else

	if not avec_message and v_depasse <> v_total - v_multiplication then 
		dw_liste_maj_internet.insertrow(999)
		lig_maj = dw_liste_maj_internet.rowcount()
		dw_liste_maj_internet.setitem(lig_maj, "code", v_code )
		dw_liste_maj_internet.setitem(lig_maj, "libelle", v_nom )
		dw_liste_maj_internet.setitem(lig_maj, "changement", "Dépassement : " +string(v_depasse, "0.00") + " € -> " + string(v_total - v_multiplication, "0.00") + " €"  )
	end if	

	dw_soin_fiche.setitem(1, "depasse", v_total - v_multiplication )
		
end if
	

// infos de mise à jour
dw_soin_fiche.setitem(1, "type_maj","I")
dw_soin_fiche.setitem(1, "user_modif",utilisateur_code)
dw_soin_fiche.setitem(1, "date_modif",today())

// Mise à jour automatique

if enregistrement_automatique or not avec_message then
	cb_enregistrer.triggerevent(clicked!)
end if

end subroutine

public subroutine init ();
dw_liste.reset()

v_dentisterie = "N"
v_orthodontie = "O"
v_parodontie = "N"
v_que_presents = "N"

cbx_dentiste.checked = false
cbx_orthodontie.checked = true
cbx_parodontie.checked = false
cbx_presents.checked = false

Integer li_rc, li_last
String ls_filename, ls_ext

string url_complete


open(w_patience)

url_complete = url_arakis 

li_rc = iinet_base.GetURL(url_complete, in_irdata)

if li_rc = 1 then
	
	in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)


	dw_liste.reset()
	dw_liste.importFile(dir_ini + nom_fichier_recu, xml!)
		
	// Vérification si présent ou pas pour mettre en gras
	long lig, tot, nb
	string v_code, v_dent, v_lettre, v_code_trouve, v_age
	long v_nb_lettre, v_coefficient_p
	double v_valeur, v_inter_avec, v_inter_sans
	
	// Astuce avec la zone DENT pour détecter présence ou pas pour mettre en gras
	// Astuce avec la zone AGE pour détecter si infos différentes ou pas
	
	tot = dw_liste.rowcount()
	for lig = 1 to tot
	
		v_code = dw_liste.getitemstring(lig, "code")
		v_dent = dw_liste.getitemstring(lig, "dent")
		v_age = dw_liste.getitemstring(lig, "age")
		
		zeros(v_age)
		zeros(v_dent)
		
		select isnull(count(*),0) into :nb from code_soins where code = :v_code ;
		dw_liste.setitem(lig, "dent", v_dent + space(5)+string(nb))
	
		// differences ???
		if nb > 0 then
			
			
			select isnull(lettre,''), isnull(nb_lettre,0), isnull(valeur,0), isnull(coefficient_p,0) ,  isnull(inter_inami_avec,0),  isnull(inter_inami_sans,0)
			into  :v_lettre, :v_nb_lettre, :v_valeur, :v_coefficient_p , :v_inter_avec, :v_inter_sans
			from code_soins where code = :v_code ;
			
//			if v_code = '305896' then
//				string vl
//				long vnbl,  vc
//				double vv
//				 
//				
//				vl = dw_liste.getitemstring(lig, "lettre")
//				vnbl = dw_liste.getitemnumber(lig, "nombre_lettre")
//				 vv = dw_liste.getitemnumber(lig, "valeur_lettre")
//				 vc = dw_liste.getitemnumber(lig, "indice_p")
//				 
//				 boolean b1, b2, b3, b4
//				 b1 =  v_lettre <> dw_liste.getitemstring(lig, "lettre")
//				 b2 = v_nb_lettre <> dw_liste.getitemnumber(lig, "nombre_lettre")
//				 b3 = v_valeur <> dw_liste.getitemnumber(lig, "valeur_lettre") 
//				 b4 = v_coefficient_p <> dw_liste.getitemnumber(lig, "indice_p") 
//				 
//			end if
			
			if 	v_lettre <> dw_liste.getitemstring(lig, "lettre")  or v_nb_lettre <> dw_liste.getitemnumber(lig, "nombre_lettre") or &
				v_valeur <> dw_liste.getitemnumber(lig, "valeur_lettre") or v_coefficient_p <> dw_liste.getitemnumber(lig, "indice_p") or &
				v_inter_avec <> dw_liste.getitemnumber(lig, "intervention_avec") or v_inter_sans <> dw_liste.getitemnumber(lig, "intervention_sans") then
				
				dw_liste.setitem(lig, "age", v_age + space(5)+"O")
			else
				dw_liste.setitem(lig, "age", v_age + space(5)+"N")
			end if
		else
			dw_liste.setitem(lig, "age", v_age + space(5)+"N")
		end if
		
		
	next
	


end if

close(w_patience)

if dw_liste.rowcount() > 0 then
	appliquer_filtre()
	
	if enregistrement_automatique then
		cb_enregistrer.visible = false
		cb_annuler.visible = false
	end if
	
	
else
	Messagebox("ATTENTION","La liste de soins récupérée sur internet est vide.")
	close(this)
end if
end subroutine

public subroutine affiche_soin_ligne (long row);string c
 c = dw_liste.getitemstring(row, "code")
dw_soin_fiche.retrieve(dw_liste.getitemstring(row, "code"))

if dw_soin_fiche.rowcount() > 0 then
	dw_soin_fiche.visible = true
	dw_liste.height = 1180
	pb_maj.visible = true
	cb_creation.visible = false
else
	dw_liste.height = 2352
	dw_soin_fiche.visible = false
	pb_maj.visible = false
	cb_creation.visible = true
end if

end subroutine

on w_soins_maj_internet.create
int iCurrent
call super::create
this.dw_liste=create dw_liste
this.cb_creation=create cb_creation
this.pb_fermer=create pb_fermer
this.pb_maj=create pb_maj
this.cbx_dentiste=create cbx_dentiste
this.cbx_orthodontie=create cbx_orthodontie
this.cbx_parodontie=create cbx_parodontie
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.pb_imprimer=create pb_imprimer
this.pb_majtous=create pb_majtous
this.cbx_presents=create cbx_presents
this.cb_rafraichir=create cb_rafraichir
this.pb_aide=create pb_aide
this.pb_chercher=create pb_chercher
this.dw_liste_maj_internet=create dw_liste_maj_internet
this.gb_filtres=create gb_filtres
this.dw_soin_fiche=create dw_soin_fiche
this.cbx_maj_code_inami_libelle=create cbx_maj_code_inami_libelle
this.cbx_maj_nom=create cbx_maj_nom
this.cbx_autres=create cbx_autres
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste
this.Control[iCurrent+2]=this.cb_creation
this.Control[iCurrent+3]=this.pb_fermer
this.Control[iCurrent+4]=this.pb_maj
this.Control[iCurrent+5]=this.cbx_dentiste
this.Control[iCurrent+6]=this.cbx_orthodontie
this.Control[iCurrent+7]=this.cbx_parodontie
this.Control[iCurrent+8]=this.cb_enregistrer
this.Control[iCurrent+9]=this.cb_annuler
this.Control[iCurrent+10]=this.pb_imprimer
this.Control[iCurrent+11]=this.pb_majtous
this.Control[iCurrent+12]=this.cbx_presents
this.Control[iCurrent+13]=this.cb_rafraichir
this.Control[iCurrent+14]=this.pb_aide
this.Control[iCurrent+15]=this.pb_chercher
this.Control[iCurrent+16]=this.dw_liste_maj_internet
this.Control[iCurrent+17]=this.gb_filtres
this.Control[iCurrent+18]=this.dw_soin_fiche
this.Control[iCurrent+19]=this.cbx_maj_code_inami_libelle
this.Control[iCurrent+20]=this.cbx_maj_nom
this.Control[iCurrent+21]=this.cbx_autres
end on

on w_soins_maj_internet.destroy
call super::destroy
destroy(this.dw_liste)
destroy(this.cb_creation)
destroy(this.pb_fermer)
destroy(this.pb_maj)
destroy(this.cbx_dentiste)
destroy(this.cbx_orthodontie)
destroy(this.cbx_parodontie)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.pb_imprimer)
destroy(this.pb_majtous)
destroy(this.cbx_presents)
destroy(this.cb_rafraichir)
destroy(this.pb_aide)
destroy(this.pb_chercher)
destroy(this.dw_liste_maj_internet)
destroy(this.gb_filtres)
destroy(this.dw_soin_fiche)
destroy(this.cbx_maj_code_inami_libelle)
destroy(this.cbx_maj_nom)
destroy(this.cbx_autres)
end on

event open;call super::open;
// instantiate internet service objects
this.GetContextService("Internet", iinet_base)
in_irdata = CREATE n_inetresult

if profilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_libelle_soin_par_internet","N")  = "O" then
	cbx_maj_nom.checked = true
else
	cbx_maj_nom.checked = false  
end if


if profilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_code_inami_libelle_soin_par_internet","N") = "O"  then
	cbx_maj_code_inami_libelle.checked = true
else
	cbx_maj_code_inami_libelle.checked = false
end if


if cbx_maj_nom.checked  then
	cbx_maj_code_inami_libelle.visible = true
else
	cbx_maj_code_inami_libelle.visible = false
end if

if version_ce_logiciel < "36.90" then 
	dw_soin_fiche.dataobject = "dw_soins_fiche_2026"
end if

dw_soin_fiche.settransobject(sqlca)


gb_filtres.backcolor = couleur_fond_fenetre
cbx_dentiste.backcolor = couleur_fond_fenetre
cbx_orthodontie.backcolor = couleur_fond_fenetre
cbx_parodontie.backcolor = couleur_fond_fenetre
cbx_presents.backcolor = couleur_fond_fenetre 

// pour éviter soucis de transparence
cbx_maj_nom.backcolor = couleur_fond_fenetre 
cbx_maj_code_inami_libelle.backcolor = couleur_fond_fenetre 

// Spécial belgique
// Coefficient pondération
dw_soin_fiche.object.coefficient_p.visible = 1
dw_soin_fiche.object.t_coefficient_p.visible = 1

// renouvt masqué
dw_soin_fiche.object.renouvt.visible = false
dw_soin_fiche.object.renouvt_t.visible = false

// date_accord  masqué
dw_soin_fiche.object.date_dem.visible = false
dw_soin_fiche.object.date_dem_t.visible = false

// pas d'exo
dw_soin_fiche.object.exo_defaut.visible = false
dw_soin_fiche.object.t_exo_defaut.visible = false

// nature  masqué
dw_soin_fiche.object.nature.visible = false
dw_soin_fiche.object.nature_t.visible = false
	
// pas d'exo
dw_soin_fiche.object.exo_defaut.visible = false
dw_soin_fiche.object.t_exo_defaut.visible = false

// Pas de remboursement exceptionnel
dw_soin_fiche.object.remboursement_exceptionnel_defaut.visible = false

// Pseudocodes
dw_soin_fiche.object.gb_pseudocode.visible = true
dw_soin_fiche.object.pseudocode.visible = true
//dw_soin_fiche.object.categorie_pseudocode.visible = true
//dw_soin_fiche.object.t_categorie_pseudocode.visible = true
//
	

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if
init()





end event

event close;call super::close;

// Mémorisation de la case à cocher de mise à jour du libellé pour prochaine fois

if cbx_maj_nom.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_libelle_soin_par_internet","O")  
else
	Setprofilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_libelle_soin_par_internet","N")  
end if

if cbx_maj_code_inami_libelle.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_code_inami_libelle_soin_par_internet","O")  
else
	Setprofilestring(dir_ini+inifile_orthokis,"admini","mise_a_jour_code_inami_libelle_soin_par_internet","N")  
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_maj_internet
end type

type dw_liste from datawindow within w_soins_maj_internet
integer x = 55
integer y = 4
integer width = 4818
integer height = 2352
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des Soins Internet"
string dataobject = "dw_soins_liste_internet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event clicked;If row > 0 Then
	
	affiche_soin_ligne(row)
	
//	dw_soin_fiche.retrieve(this.getitemstring(row, "code"))
//	
//	if dw_soin_fiche.rowcount() > 0 then
//		dw_soin_fiche.visible = true
//		this.height = 1180
//		pb_maj.visible = true
//		cb_creation.visible = false
//	else
//		this.height = 2352
//		dw_soin_fiche.visible = false
//		pb_maj.visible = false
//		cb_creation.visible = true
//	end if
	
	// repositionnement de la liste
	This.ScrollToRow(row)
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	
end if
end event

type cb_creation from uo_picturebutton_390x120 within w_soins_maj_internet
boolean visible = false
integer x = 2427
integer y = 2664
integer width = 494
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Ajouter"
boolean default = true
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

if Messagebox("CONFIRMATION","Vous allez AJOUTER un nouveau soin à partir des informations de la base Internet.~n~nConfirmez-vous ?",Question!, YesNo!, 2) = 1 then

	// Recopie les valeurs de la liste dans la fiche et enregsitre directement !!!
	long lig
	
	decimal {2}  v_hono, v_multiplication, v_depassement, v_total
	
	lig = dw_liste.getrow()
	
	dw_soin_fiche.visible = true
	
	v_total = 0
	
	dw_soin_fiche.insertrow(0)
	
	dw_soin_fiche.setitem(1, "code",dw_liste.getitemstring(lig, "code"))
	
	if left(dw_liste.getitemstring(lig, "code"), 2) = "38" then
		dw_soin_fiche.setitem(1, "pseudocode", "O")
	else
		dw_soin_fiche.setitem(1, "pseudocode", "N")
	end if

	dw_soin_fiche.setitem(1, "nom", dw_liste.getitemstring(lig, "nom"))
	
	dw_soin_fiche.setitem(1, "lettre",dw_liste.getitemstring(lig, "lettre"))
	dw_soin_fiche.setitem(1, "nb_lettre",dw_liste.getitemnumber(lig, "nombre_lettre"))
	dw_soin_fiche.setitem(1, "valeur",dw_liste.getitemnumber(lig, "valeur_lettre"))
	dw_soin_fiche.setitem(1, "coefficient_p",dw_liste.getitemnumber(lig, "indice_p"))
	dw_soin_fiche.setitem(1, "valeur",dw_liste.getitemnumber(lig, "valeur_lettre"))

	if upper(dw_liste.getitemstring(lig, "description")) = "PRESTATIONS RELATIVES" then
		dw_soin_fiche.setitem(1, "categorie_pseudocode",string(dw_liste.getitemnumber(lig, "description_1_numerique")))
		dw_soin_fiche.setitem(1, "pseudocode","O")
	else
		dw_soin_fiche.setitem(1, "pseudocode","N")
		dw_soin_fiche.setitem(1, "categorie_pseudocode","")
	end if

	v_hono = dw_liste.getitemnumber(lig, "honoraire") 
	v_multiplication = dw_liste.getitemnumber(lig, "nombre_lettre") * dw_liste.getitemnumber(lig, "valeur_lettre")
	
	if v_hono <> v_multiplication then 
		Messagebox("ATTENTION","Le prix des honoraires annoncé (" + string(v_hono) +") n'est pas égal à 'nombre de lettres' x 'valeur de la lettre'  ("+ string( v_multiplication) + ")")
	end if
	
	if v_multiplication > v_total then
		dw_soin_fiche.setitem(1, "total", v_multiplication)
		dw_soin_fiche.setitem(1, "depasse",0)
	else
		dw_soin_fiche.setitem(1, "depasse", v_total -v_multiplication )
	end if
	
	
	// infos de mise à jour
	dw_soin_fiche.setitem(1, "type_maj","I")
	dw_soin_fiche.setitem(1, "user_modif",utilisateur_code)
	dw_soin_fiche.setitem(1, "date_modif",today())
	
	// Mise à jour automatique
	
	if enregistrement_automatique then
		cb_enregistrer.triggerevent(clicked!)
	end if
		
end if

end event

type pb_fermer from uo_picturebutton_390x120 within w_soins_maj_internet
integer x = 4402
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;str_twostring struct //pour la passage de param

setnull(struct.code)

CloseWithReturn(parent, struct)



end event

type pb_maj from uo_picturebutton_390x120 within w_soins_maj_internet
boolean visible = false
integer x = 1440
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 70
boolean bringtotop = true
string text = "MàJ Un"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;

if Messagebox("CONFIRMATION","Vous allez mettre à jour la fiche de ce soin à partir des informations financières de la base Internet.~n~nConfirmez-vous ?",Question!, YesNo!, 2) = 1 then


	mise_a_jour (dw_liste.getrow(), true)
	

end if

end event

type cbx_dentiste from checkbox within w_soins_maj_internet
integer x = 32
integer y = 2656
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
long backcolor = 67108864
string text = "Dentisterie"
end type

event clicked;
if checked then 
	v_dentisterie = "O"
else
	v_dentisterie = "N"
end if


appliquer_filtre()
end event

type cbx_orthodontie from checkbox within w_soins_maj_internet
integer x = 393
integer y = 2656
integer width = 393
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
string text = "Orthodontie"
boolean checked = true
end type

event clicked;if checked then 
	v_orthodontie = "O"
else
	v_orthodontie = "N"
end if


appliquer_filtre()
end event

type cbx_parodontie from checkbox within w_soins_maj_internet
integer x = 782
integer y = 2656
integer width = 379
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
string text = "Parodontie"
end type

event clicked;if checked then 
	v_parodontie = "O"
else
	v_parodontie = "N"
end if


appliquer_filtre()
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_soins_maj_internet
integer x = 3909
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_soin_fiche.accepttext()
if dw_soin_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_soins_maj_internet
integer x = 3415
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "Annuler"
boolean default = true
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	
	dw_soin_fiche.retrieve(dw_liste.getitemstring(dw_liste.getrow(), "code"))
	
end if
end event

type pb_imprimer from uo_picturebutton_390x120 within w_soins_maj_internet
integer x = 2921
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
boolean default = true
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

dw_liste.print()
end event

type pb_majtous from uo_picturebutton_390x120 within w_soins_maj_internet
integer x = 1934
integer y = 2660
integer width = 494
integer height = 152
integer taborder = 80
boolean bringtotop = true
string text = "MàJ Tous"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
if Messagebox("ATTENTION","Vous allez mettre à jour TOUS VOS SOINS à partir des informations financières de la base Internet.~n~nConfirmez-vous ?",Question!, YesNo!, 2) = 1 then
	boolean v_suite = false
	
	// Liste qui consigne les changements de tarif
	dw_liste_maj_internet.reset()
	
	
	if cbx_maj_nom.checked then
		if MessageBox("ATTENTION", "Vous allez également mettre à jour TOUS LES LIBELLES de vos soins !~n~nConfirmez-vous ?",Question!, YesNo!, 2) = 1 then
			v_suite = true
		end if
	else
		v_suite = true
	end if 
	if v_suite then
		open(w_patience)
		long lig, tot
		
		tot = dw_liste.rowcount()
		
		for lig = 1 to tot
			dw_soin_fiche.retrieve(dw_liste.getitemstring(lig, "code"))
			if dw_soin_fiche.rowcount() > 0 then
				mise_a_jour (lig , false)
			end if
		next
		messagebox("FIN DE LA MISE A JOUR","Tous vos soins présents ont été mis à jour.")
		
	
		if dw_liste_maj_internet.rowcount() > 0 then
			
			Messagebox("ATTENTION !", "Il y a eu des changements de tarifs dans vos soins.~n~nVeuillez en prendre connaissance afin de, si besoin, mettre à jour vos soins automatiques.")
			open(w_soins_liste_maj_internet)
			
		end if

		
		// raffraissiement de la liste
		init()
		close(w_patience)
	end if
	
end if

end event

type cbx_presents from checkbox within w_soins_maj_internet
integer x = 32
integer y = 2748
integer width = 1175
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
string text = "N~'afficher que les présents dans Orthokis"
end type

event clicked;

appliquer_filtre()


end event

type cb_rafraichir from picturebutton within w_soins_maj_internet
integer x = 55
integer y = 2388
integer width = 174
integer height = 152
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation la liste pour tenir compte d~'éventuelles modifications"
long backcolor = 553648127
end type

event clicked;

// Réactualisation de tous les éléments affichées
init()

	
	
	
	


end event

type pb_aide from uo_bouton_aide within w_soins_maj_internet
string tag = "Soins Inami"
integer x = 4617
integer y = 2424
integer taborder = 140
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type pb_chercher from picturebutton within w_soins_maj_internet
integer x = 4411
integer y = 2436
integer width = 174
integer height = 152
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ACTIONS_chercher.png"
alignment htextalign = left!
string powertiptext = "Recherche un code de soin dans la liste"
long backcolor = 553648127
end type

event clicked;
// Positionnement sur un soin cherché
string v_code_soin
long lig

v_code_soin = trim(inputbox("Recherche d'un soin", "Veuillez indiquer le code du soin recherché"))


lig = dw_liste.find("code = '" + v_code_soin + "'", 1, 9999)

if lig > 0 then
	


	affiche_soin_ligne(lig)

	dw_liste.scrolltorow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)
	dw_liste.setrow(lig)

else
	Messagebox("ATTENTION", "Le code '" + v_code_soin + "' n'est pas présent dans la liste !")
end if
	


end event

type dw_liste_maj_internet from datawindow within w_soins_maj_internet
boolean visible = false
integer x = 3963
integer y = 1272
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_liste_maj_internet"
boolean border = false
boolean livescroll = true
end type

type gb_filtres from groupbox within w_soins_maj_internet
integer x = 23
integer y = 2568
integer width = 1394
integer height = 276
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre"
end type

type dw_soin_fiche from datawindow within w_soins_maj_internet
boolean visible = false
integer x = 1015
integer y = 844
integer width = 3438
integer height = 1800
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Fiche soin d~'Orthokis"
string dataobject = "dw_soins_fiche"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

// pour valider les modifs en cours
this.accepttext()

// Mise à jour automatique des champs DEPASSE et TOTAL selon ...


//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then

	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "total"	// On quitte total => Mise à jour de dépassement
			setitem(row,"depasse",   getItemNumber(row, "total") - getItemNumber(row, "nb_lettre") * getItemNumber(row, "valeur"))
			
		case "depasse", "nb_lettre", "valeur"	// On quitte depasse, nb_lettre, valeur => Mise à jour de total
			setitem(row,"total",   getItemNumber(row, "depasse") + getItemNumber(row, "nb_lettre") * getItemNumber(row, "valeur"))
			
	end choose
end if

// infos de mise à jour
setitem(row, "type_maj","M")
setitem(row, "user_modif",utilisateur_code)
setitem(row, "date_modif",today())

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event rbuttondown;


// Efface la fenetre de mise à jour et redimensionne

dw_liste.height = 2352
dw_soin_fiche.visible = false
pb_maj.visible = false
cb_creation.visible = true


end event

type cbx_maj_code_inami_libelle from checkbox within w_soins_maj_internet
boolean visible = false
integer x = 238
integer y = 2476
integer width = 1047
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Intégrer le code INAMI dans le libellé"
end type

type cbx_maj_nom from checkbox within w_soins_maj_internet
integer x = 238
integer y = 2388
integer width = 640
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Mise à jour du libellé"
end type

event clicked;


if checked  then
	cbx_maj_code_inami_libelle.visible = true
else
	cbx_maj_code_inami_libelle.visible = false
end if


end event

type cbx_autres from checkbox within w_soins_maj_internet
integer x = 1152
integer y = 2656
integer width = 270
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Autres"
end type

event clicked;if checked then 
	v_autres = "O"
else
	v_autres = "N"
end if


appliquer_filtre()
end event

