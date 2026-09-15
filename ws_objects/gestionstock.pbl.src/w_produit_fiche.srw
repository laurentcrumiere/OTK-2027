$PBExportHeader$w_produit_fiche.srw
forward
global type w_produit_fiche from w_fenetre_arakis
end type
type cb_continuer from uo_picturebutton_390x120 within w_produit_fiche
end type
type cb_annuler_ajout from uo_picturebutton_390x120 within w_produit_fiche
end type
type cb_fermer from uo_picturebutton_390x120 within w_produit_fiche
end type
type cb_annuler from uo_picturebutton_390x120 within w_produit_fiche
end type
type cb_stock from uo_picturebutton_390x120 within w_produit_fiche
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_produit_fiche
end type
type dw_2 from datawindow within w_produit_fiche
end type
type dw_1 from datawindow within w_produit_fiche
end type
type tab_fiche from tab within w_produit_fiche
end type
type tabpage_reference from userobject within tab_fiche
end type
type cb_suppr from uo_picturebutton_780x120 within tabpage_reference
end type
type cb_ajout from uo_picturebutton_780x120 within tabpage_reference
end type
type dw_liste from u_basedw within tabpage_reference
end type
type dw_fiche from datawindow within tabpage_reference
end type
type tabpage_reference from userobject within tab_fiche
cb_suppr cb_suppr
cb_ajout cb_ajout
dw_liste dw_liste
dw_fiche dw_fiche
end type
type tabpage_param from userobject within tab_fiche
end type
type cb_suppr_stock from uo_picturebutton_780x120 within tabpage_param
end type
type cb_ajout_stock from uo_picturebutton_780x120 within tabpage_param
end type
type dw_liste2 from u_basedw within tabpage_param
end type
type dw_fiche2 from datawindow within tabpage_param
end type
type tabpage_param from userobject within tab_fiche
cb_suppr_stock cb_suppr_stock
cb_ajout_stock cb_ajout_stock
dw_liste2 dw_liste2
dw_fiche2 dw_fiche2
end type
type tab_fiche from tab within w_produit_fiche
tabpage_reference tabpage_reference
tabpage_param tabpage_param
end type
type uo_1 from resize_fenetre within w_produit_fiche
end type
type dw_basic from datawindow within w_produit_fiche
end type
type cb_imprimer from uo_picturebutton_390x120 within w_produit_fiche
end type
type dw_edition from datawindow within w_produit_fiche
end type
type gb_3 from groupbox within w_produit_fiche
end type
type gb_1 from groupbox within w_produit_fiche
end type
type dw_ajout from datawindow within w_produit_fiche
end type
type ole_photo_arakis005 from gearbox_fournisseur within w_produit_fiche
end type
end forward

global type w_produit_fiche from w_fenetre_arakis
integer width = 3141
integer height = 2548
string title = "Fiche Produit"
windowtype windowtype = response!
long backcolor = 15780518
cb_continuer cb_continuer
cb_annuler_ajout cb_annuler_ajout
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_stock cb_stock
cb_enregistrer cb_enregistrer
dw_2 dw_2
dw_1 dw_1
tab_fiche tab_fiche
uo_1 uo_1
dw_basic dw_basic
cb_imprimer cb_imprimer
dw_edition dw_edition
gb_3 gb_3
gb_1 gb_1
dw_ajout dw_ajout
ole_photo_arakis005 ole_photo_arakis005
end type
global w_produit_fiche w_produit_fiche

type variables
datawindowchild idw_type, idw_type_ajout, idw_fournisseur, idw_praticien
string code_interne_local, code_praticien_courant, code_fournisseur_courant
str_twostring struct
boolean insertion_fournisseur
boolean prems_enregistrement = true

end variables

forward prototypes
public subroutine insertion_auto_praticien ()
public subroutine insertion_auto_stock ()
public subroutine ajouter ()
public subroutine visi (boolean visi)
end prototypes

public subroutine insertion_auto_praticien ();
string v_prati_defaut
//acquisition du praticien par défaut
SELECT min(code) into :v_prati_defaut from prati where prati_defaut = 1 ; 

  INSERT INTO "param_stock_produit"  
         ( "code_produit",   
           "code_praticien",   
           "qte_stock_min",   
           "interdiction_commande",   
           "type_gestion",   
           "duree_limite_utilisation" )  
  VALUES ( :code_interne_local,   
           :v_prati_defaut,   
           1,   
           'n',   
           1,   
           0 )  ;
commit;
end subroutine

public subroutine insertion_auto_stock ();string v_prati_defaut

//acquisition du praticien par défaut
SELECT min(code) into :v_prati_defaut from prati where prati_defaut = 1 ; 

  INSERT INTO "param_stock_fournisseur"  
         ( "code_produit",              "code_fournisseur",              "code_praticien",              "qte_colisee",              "archive" )  
  VALUES ( :code_interne_local,              :code_fournisseur_courant,              :v_prati_defaut,              1,              'n' )  ;


commit;
end subroutine

public subroutine ajouter ();string code_praticien_default
datawindowchild idw_ajout


// avant d'ajouter, on enregistre car sinon on perd l'ajout précédent !!
cb_enregistrer.triggerevent(clicked!)

if tab_fiche.selectedtab = 1 then
	// Ajout d'un fournisseur
	tab_fiche.tabpage_reference.dw_fiche.dataobject = 'dw_reference_produit_fiche_ajout'
	tab_fiche.tabpage_reference.dw_fiche.settransobject(sqlca)
	tab_fiche.tabpage_reference.dw_liste.settransobject(sqlca)
	colore_datawindow(tab_fiche.tabpage_reference.dw_fiche)
	tab_fiche.tabpage_reference.dw_liste.retrieve(code_interne_local)
	
	tab_fiche.tabpage_reference.dw_fiche.getchild("code_fournisseur",idw_ajout)
	idw_ajout.settransobject(sqlca)
	if idw_ajout.retrieve(code_interne_local) = 0 then
		idw_ajout.insertrow(0)
	end if
	
	tab_fiche.tabpage_reference.dw_fiche.insertrow(0)
	// Si on ajoute le premier fournisseur, par défaut on le mais comme principal
	if tab_fiche.tabpage_reference.dw_liste.rowcount() = 0 then
		tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"reference_produit_fournisseur_par_defaut","O")
	else
		tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"reference_produit_fournisseur_par_defaut","N")
	end if
	tab_fiche.tabpage_reference.dw_fiche.scrolltorow(tab_fiche.tabpage_reference.dw_fiche.rowcount())
	tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"code_produit",code_interne_local)
	tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"unite_vente",1)
	tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"code_type_taxe",'TTC')
	tab_fiche.tabpage_reference.dw_fiche.setitem(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"reference",'')
	
	if not(multistock) then
		tab_fiche.tabpage_reference.cb_ajout.enabled ( false)
		tab_fiche.tabpage_reference.cb_suppr.enabled ( false)
		insertion_fournisseur = true
	end if
end if

if tab_fiche.selectedtab = 2 then
	// Ajout d'un praticien
	tab_fiche.tabpage_param.dw_fiche2.dataobject = 'dw_produit_param_fiche_ajout'
	tab_fiche.tabpage_param.dw_fiche2.settransobject(sqlca)
	tab_fiche.tabpage_param.dw_liste2.settransobject(sqlca)
	colore_datawindow(tab_fiche.tabpage_param.dw_fiche2)
	tab_fiche.tabpage_param.dw_liste2.retrieve(code_interne_local)
	
	tab_fiche.tabpage_param.dw_fiche2.getchild("code_praticien",idw_ajout)
	idw_ajout.settransobject(sqlca)
	if idw_ajout.retrieve(code_interne_local) = 0 then
		idw_ajout.insertrow(0)
	end if

	tab_fiche.tabpage_param.dw_fiche2.insertrow(0)
	tab_fiche.tabpage_param.dw_fiche2.scrolltorow(tab_fiche.tabpage_param.dw_fiche2.rowcount())

	
	// Mise à jour du praticien par défaut si le praticien n'est pas déjà saisi dans liste2
	string v_prati_defaut
	SELECT min(code) into :v_prati_defaut from prati where prati_defaut = 1 ; 
	
	if tab_fiche.tabpage_param.dw_liste2.find("prati_code = '"+v_prati_defaut+"'",0,tab_fiche.tabpage_param.dw_liste2.rowcount()) = 0 then
		tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"code_praticien",v_prati_defaut)
	end if

	tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"code_produit",code_interne_local)
	tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"interdiction_commande",'n')
	tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"qte_stock_min",1)
	tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"type_gestion",1)
	tab_fiche.tabpage_param.dw_fiche2.setitem(tab_fiche.tabpage_param.dw_fiche2.rowcount(),"duree_limite_utilisation",0)
end if
end subroutine

public subroutine visi (boolean visi);gb_1.visible = visi
gb_3.visible = visi
cb_fermer.visible = visi
cb_stock.visible = visi
cb_imprimer.visible = visi
cb_enregistrer.visible = visi
cb_annuler.visible = visi
cb_annuler_ajout.visible = not visi
cb_continuer.visible = not visi
dw_basic.visible = visi
tab_fiche.visible = visi
dw_ajout.visible = not visi
end subroutine

on w_produit_fiche.create
int iCurrent
call super::create
this.cb_continuer=create cb_continuer
this.cb_annuler_ajout=create cb_annuler_ajout
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_stock=create cb_stock
this.cb_enregistrer=create cb_enregistrer
this.dw_2=create dw_2
this.dw_1=create dw_1
this.tab_fiche=create tab_fiche
this.uo_1=create uo_1
this.dw_basic=create dw_basic
this.cb_imprimer=create cb_imprimer
this.dw_edition=create dw_edition
this.gb_3=create gb_3
this.gb_1=create gb_1
this.dw_ajout=create dw_ajout
this.ole_photo_arakis005=create ole_photo_arakis005
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_continuer
this.Control[iCurrent+2]=this.cb_annuler_ajout
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_stock
this.Control[iCurrent+6]=this.cb_enregistrer
this.Control[iCurrent+7]=this.dw_2
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.tab_fiche
this.Control[iCurrent+10]=this.uo_1
this.Control[iCurrent+11]=this.dw_basic
this.Control[iCurrent+12]=this.cb_imprimer
this.Control[iCurrent+13]=this.dw_edition
this.Control[iCurrent+14]=this.gb_3
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.dw_ajout
this.Control[iCurrent+17]=this.ole_photo_arakis005
end on

on w_produit_fiche.destroy
call super::destroy
destroy(this.cb_continuer)
destroy(this.cb_annuler_ajout)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_stock)
destroy(this.cb_enregistrer)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.tab_fiche)
destroy(this.uo_1)
destroy(this.dw_basic)
destroy(this.cb_imprimer)
destroy(this.dw_edition)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.dw_ajout)
destroy(this.ole_photo_arakis005)
end on

event open;call super::open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
integer rapport_share1, rapport_share2
struct = message.powerobjectparm




colore_tous_objets_window(this, couleur_fond_datawindow)
colore_tous_objets_tab(tab_fiche, couleur_fond_datawindow)
this.backcolor = couleur_fond_fenetre

colore_datawindow(tab_fiche.tabpage_reference.dw_fiche)
colore_datawindow(tab_fiche.tabpage_param.dw_fiche2)

uo_1.taille(this)

dw_basic.settransobject(SQLCA)
dw_ajout.settransobject(SQLCA)
tab_fiche.tabpage_reference.dw_fiche.settransobject(SQLCA)
tab_fiche.tabpage_param.dw_fiche2.settransobject(sqlca)
dw_basic.getchild("produit_code_type_produit",idw_type)
idw_type.settransobject(sqlca)
if idw_type.retrieve(struct.message) = 0 then
	idw_type.insertrow(0)
end if

dw_ajout.getchild("produit_code_type_produit",idw_type_ajout)
idw_type_ajout.settransobject(sqlca)
if idw_type_ajout.retrieve(struct.message) = 0 then
	idw_type_ajout.insertrow(0)
end if

rapport_share1 = tab_fiche.tabpage_reference.dw_fiche.ShareData(tab_fiche.tabpage_reference.dw_liste)
if rapport_share1 <> 1 then
	messagebox ("Sharedata error","error sharing data with tab_reference_fiche")
end if

rapport_share2 = tab_fiche.tabpage_param.dw_fiche2.ShareData(tab_fiche.tabpage_param.dw_liste2)
if rapport_share2 <> 1 then
	messagebox ("Sharedata error","error sharing data with tab_param_fiche")
end if

if struct.code = "      " then
	
	open(w_patience)
	
	// Ajout
	visi(false)
	
	double max, nb
		
  SELECT count(*)     INTO :max      FROM "produit"  ;
	
	

	IF IsNull(max) THEN
		max = 1
	ELSE	
		
		max = get_next_code_produit()
		
	END IF

	code_interne_local =  string(max)
	dw_ajout.insertrow(0)
	dw_ajout.SetItem(dw_ajout.RowCount(),"produit_code_interne", code_interne_local)
	dw_ajout.SetItem(dw_ajout.RowCount(),"type_produit_code_categorie_produit",struct.message)
	if not isnull(struct.auxiliaire) then
		dw_ajout.SetItem(dw_ajout.RowCount(),"produit_code_type_produit",struct.auxiliaire)
		//cb_continuer.enabled = true
	else
		//cb_continuer.enabled = false
	end if
	dw_ajout.selecttext(1,20)
	dw_ajout.SetFocus()
	
	close(w_patience)
else
	// Modif
	code_interne_local = struct.code
	dw_basic.retrieve(code_interne_local)
	if tab_fiche.tabpage_reference.dw_fiche.retrieve(code_interne_local) = 0 then
//		tab_fiche.tabpage_reference.dw_fiche.insertrow(0)
	end if
	tab_fiche.tabpage_reference.dw_fiche.setfocus()
	tab_fiche.tabpage_param.dw_fiche2.retrieve(code_interne_local)
	ole_photo_arakis005.visible = true
end if


//Parametrage fenetre selon multistockage
if not(multistock) then
	tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false )
	tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false )
	insertion_fournisseur = false
	tab_fiche.tabpage_reference.cb_ajout.enabled ( true)
	tab_fiche.tabpage_reference.cb_suppr.enabled ( true)
end if

ole_photo_arakis005.numero_produit = code_interne_local
ole_photo_arakis005.triggerevent(constructor!)

// Edition
dw_edition.Settransobject(sqlca)

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
	Case 'C'
		// Consultation 
		tab_fiche.tabpage_reference.cb_ajout.enabled ( false)
		tab_fiche.tabpage_reference.cb_suppr.enabled ( false)
		tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false )
		tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false )
		cb_enregistrer.enabled ( false )
	Case 'M'
		// Modification
		tab_fiche.tabpage_reference.cb_ajout.enabled ( false )
		tab_fiche.tabpage_reference.cb_suppr.enabled ( false )
		tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false )
		tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false )
end choose


if tab_fiche.tabpage_param.dw_liste2.rowcount() = 1 then
	tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false )
end if
//this.backcolor = 16246738

centrer(this)


end event

event resize;call super::resize;//uo_1.retaille(this)
end event

event close;call super::close;str_twostring struct_retour
if dw_basic.rowcount() > 0 then
	struct_retour.message = dw_basic.getitemstring(dw_basic.Getrow(),"type_produit_code_categorie_produit")
	if (not struct.auxiliaire = "") then
		struct_retour.auxiliaire = dw_basic.getitemstring(dw_basic.Getrow(),"produit_code_type_produit")
	end if
else
	struct_retour.message = struct.message
	if not struct.auxiliaire = "" then
		struct_retour.auxiliaire = struct.auxiliaire
	end if
end if
closewithreturn(this,struct_retour)
end event

type p_fond from w_fenetre_arakis`p_fond within w_produit_fiche
integer x = 1134
integer y = 916
end type

type cb_continuer from uo_picturebutton_390x120 within w_produit_fiche
boolean visible = false
integer x = 1481
integer y = 1580
integer width = 507
integer height = 152
integer taborder = 80
string text = "Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;int rapport_update

dw_ajout.accepttext()

rapport_update = dw_ajout.Update()

if rapport_update = 1 then
	commit using sqlca ;
	code_interne_local = dw_ajout.getitemstring(dw_ajout.getrow(),"produit_code_interne")
	visi(true)
	idw_type.retrieve(dw_ajout.getitemstring(dw_ajout.getrow(),"type_produit_code_categorie_produit"))
	dw_basic.retrieve(code_interne_local)
	if not(multistock) then
		insertion_auto_praticien()
	end if
	ajouter()
	ole_photo_arakis005.visible = true
else
	rollback using sqlca ;
end if
end event

type cb_annuler_ajout from uo_picturebutton_390x120 within w_produit_fiche
boolean visible = false
integer x = 951
integer y = 1580
integer width = 507
integer height = 152
integer taborder = 70
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_fermer from uo_picturebutton_390x120 within w_produit_fiche
integer x = 2405
integer y = 2220
integer width = 558
integer height = 152
integer taborder = 60
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
tab_fiche.tabpage_reference.dw_liste.accepttext()
tab_fiche.tabpage_reference.dw_fiche.accepttext()
tab_fiche.tabpage_param.dw_liste2.accepttext()
tab_fiche.tabpage_param.dw_fiche2.accepttext()
if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or tab_fiche.tabpage_reference.dw_liste.modifiedcount() > 0 or tab_fiche.tabpage_reference.dw_liste.deletedcount()>0 or tab_fiche.tabpage_param.dw_liste2.modifiedcount() > 0 or tab_fiche.tabpage_param.dw_liste2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_produit_fiche
integer x = 1271
integer y = 2220
integer width = 558
integer height = 152
integer taborder = 60
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;int rapport_share1, rapport_share2

rollback;
tab_fiche.tabpage_reference.dw_fiche.dataobject = 'dw_reference_produit_fiche'
tab_fiche.tabpage_reference.dw_fiche.settransobject(sqlca)
rapport_share1 = tab_fiche.tabpage_reference.dw_fiche.ShareData(tab_fiche.tabpage_reference.dw_liste)
if rapport_share1 <> 1 then
	messagebox ("Sharedata error","error sharing data with tab_reference_liste")
end if

tab_fiche.tabpage_param.dw_fiche2.dataobject = 'dw_produit_param_fiche'
tab_fiche.tabpage_param.dw_fiche2.settransobject(sqlca)
rapport_share2 = tab_fiche.tabpage_param.dw_fiche2.ShareData(tab_fiche.tabpage_param.dw_liste2)
if rapport_share2 <> 1 then
	messagebox ("Sharedata error","error sharing data with tab_param_fiche")
end if

dw_basic.retrieve(code_interne_local)
tab_fiche.tabpage_reference.dw_fiche.retrieve(code_interne_local)
tab_fiche.tabpage_param.dw_fiche2.retrieve(code_interne_local)

if not(multistock) then
	tab_fiche.tabpage_reference.cb_ajout.enabled ( true )
	tab_fiche.tabpage_reference.cb_suppr.enabled ( true )
end if

end event

type cb_stock from uo_picturebutton_390x120 within w_produit_fiche
integer x = 137
integer y = 2220
integer width = 558
integer height = 152
integer taborder = 60
string text = "&Stock"
string iconname = "update5!.png"
end type

event clicked;call super::clicked;boolean ok_close = false

dw_basic.accepttext()
tab_fiche.tabpage_reference.dw_liste.accepttext()
tab_fiche.tabpage_reference.dw_fiche.accepttext()
tab_fiche.tabpage_param.dw_liste2.accepttext()
tab_fiche.tabpage_param.dw_fiche2.accepttext()
if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or tab_fiche.tabpage_reference.dw_liste.modifiedcount() > 0 or tab_fiche.tabpage_reference.dw_liste.deletedcount()>0 or tab_fiche.tabpage_param.dw_liste2.modifiedcount() > 0 or tab_fiche.tabpage_param.dw_liste2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		ok_close = true
	end if
else
	ok_close = true
end if


if ok_close then
	if tab_fiche.tabpage_param.dw_liste2.rowcount() > 0 then
		str_boolstring v_struct
		integer compteur
		
		v_struct.code_produit = dw_basic.getitemstring(dw_basic.getrow(),"produit_code_interne")
		v_struct.code_praticien = tab_fiche.tabpage_param.dw_liste2.getitemstring(tab_fiche.tabpage_param.dw_liste2.getrow(),"prati_code")
		
		select count(*) into :compteur 	from "param_stock_fournisseur"
			where code_produit = :v_struct.code_produit and code_praticien = :v_struct.code_praticien;
			
		if compteur = 0 then
			v_struct.ajout = true
		else
			v_struct.ajout = false
		end if
		//if cbx_archive.checked then
		//	v_struct.archive = true
		//else
		//	v_struct.archive = false
		//end if
		Openwithparm(w_maj_stock_produit,v_struct)
		close(parent)
	else
		Messagebox("ATTENTION !","Vous devez d'abord affecter ce produit à un praticien !")
	end if
end if

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_produit_fiche
integer x = 1838
integer y = 2220
integer width = 558
integer height = 152
integer taborder = 50
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update1, rapport_update2,rapport_update3
int rapport_share1,rapport_share2

if tab_fiche.tabpage_reference.dw_fiche.rowcount() > 0 then
	code_fournisseur_courant = tab_fiche.tabpage_reference.dw_fiche.getitemstring(tab_fiche.tabpage_reference.dw_fiche.rowcount(),"code_fournisseur")
end if

dw_basic.accepttext()

// pour le cas on on modifie le code interne
if dw_basic.rowcount() > 0 then
	if code_interne_local <> dw_basic.getItemString(1, "produit_code_interne") then
		code_interne_local = dw_basic.getItemString(1, "produit_code_interne")
		long lig, tot
		tot = tab_fiche.tabpage_reference.dw_fiche.rowcount()
		for lig = 1 to tot
			tab_fiche.tabpage_reference.dw_fiche.SetItem(lig, "code_produit", code_interne_local )
		next

		tot = tab_fiche.tabpage_param.dw_fiche2.rowcount()
		for lig = 1 to tot
			tab_fiche.tabpage_param.dw_fiche2.SetItem(lig, "code_produit", code_interne_local )
		next

		tot = tab_fiche.tabpage_reference.dw_liste.rowcount()
		for lig = 1 to tot
			tab_fiche.tabpage_reference.dw_liste.SetItem(lig, "code_produit", code_interne_local )
		next

		tot =tab_fiche.tabpage_param.dw_liste2.rowcount()
		for lig = 1 to tot
			tab_fiche.tabpage_param.dw_liste2.SetItem(lig, "code_produit", code_interne_local )
		next

		
	end if
end if


dw_basic.accepttext()
tab_fiche.tabpage_reference.dw_liste.accepttext()
tab_fiche.tabpage_reference.dw_fiche.accepttext()
tab_fiche.tabpage_param.dw_liste2.accepttext()
tab_fiche.tabpage_param.dw_fiche2.accepttext()

rapport_update1 = dw_basic.Update()
rapport_update2 = tab_fiche.tabpage_reference.dw_fiche.Update()
rapport_update3 = tab_fiche.tabpage_param.dw_fiche2.Update()

boolean v_suite = false

if rapport_update1 = 1 and rapport_update2 = 1 and rapport_update3 = 1 then
	commit  ;
	
	if not prems_enregistrement then
		// pour éviter message erreur initial

		if tab_fiche.tabpage_reference.dw_liste.rowcount() = 0 and tab_fiche.tabpage_reference.dw_fiche.rowcount() = 0 then 
			Messagebox("ATTENTION","Vous devez saisir au moins un Fournisseur !")
			 v_suite = false
			 tab_fiche.SelectTab (1)
		else
			if tab_fiche.tabpage_param.dw_fiche2.rowcount() = 0 and multistock then 
				Messagebox("ATTENTION","Vous devez saisir au moins un Praticien !")
				 v_suite = false
				 tab_fiche.SelectTab (2)
			else
				v_suite = true
			end if
		end if
	end if

else
	messagebox("ATTENTION","Erreur dans la mise à jour de la fiche : " + string(rapport_update1) + " / " + string(rapport_update2) + " / " + string(rapport_update3) + "~n~n" + sqlca.sqlerrtext)
	rollback ;
	
	if rapport_update2 = -1 then  
		// remise en place de la DW
		tab_fiche.SelectTab (1)
		tab_fiche.tabpage_reference.dw_fiche.insertrow(0)
	end if
	if rapport_update3 = -1 and multistock then  
		// remise en place de la DW
		 tab_fiche.SelectTab (2)
		 tab_fiche.tabpage_param.dw_fiche2.insertrow(0)
	end if
end if


if v_suite then
	
	tab_fiche.tabpage_reference.dw_fiche.dataobject = 'dw_reference_produit_fiche'
	tab_fiche.tabpage_reference.dw_fiche.settransobject(sqlca)
	rapport_share1 = tab_fiche.tabpage_reference.dw_fiche.ShareData(tab_fiche.tabpage_reference.dw_liste)
	if rapport_share1 <> 1 then
		messagebox ("Sharedata error","error sharing data with tab_reference_liste")
	end if
	
	
	tab_fiche.tabpage_param.dw_fiche2.dataobject = 'dw_produit_param_fiche'
	tab_fiche.tabpage_param.dw_fiche2.settransobject(sqlca)
	rapport_share2 = tab_fiche.tabpage_param.dw_fiche2.ShareData(tab_fiche.tabpage_param.dw_liste2)
	if rapport_share2 <> 1 then
		messagebox ("Sharedata error","error sharing data with tab_param_fiche")
	end if
	
	
	dw_basic.retrieve(code_interne_local)
	
	
	tab_fiche.tabpage_reference.dw_fiche.retrieve(code_interne_local)
	tab_fiche.tabpage_param.dw_fiche2.retrieve(code_interne_local)
	
	if not(multistock) and insertion_fournisseur then
		insertion_auto_stock()
		insertion_fournisseur = false
		tab_fiche.tabpage_reference.cb_ajout.enabled ( true )
		tab_fiche.tabpage_reference.cb_suppr.enabled ( true )
	end if
	
	
	if not multistock then
		tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false)
	else
		if tab_fiche.tabpage_param.dw_liste2.rowcount() = 1 then
			tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false)
		else
			if droits_acces[70] = 'C' or droits_acces[70] = 'M' then
				tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false)
			else
				tab_fiche.tabpage_param.cb_suppr_stock.enabled ( true )
			end if
		end if
	end if
	
	
	
	// depuis 19.02e, vérifiation des références de stock pour ajouter si manque
	
	string v_code_fournisseur, v_code_praticien 
	long v_cpt
	double v_qte_com_min, v_qte_colisee, v_remise
	string v_archive, v_generer
	double v_code_index 
	
	// Liste des produits manquants par fournisseur
	
	declare cur1 cursor for select code_fournisseur from reference_produit where code_produit  = :code_interne_local ;
	
	declare cur2 cursor for select code_praticien from param_stock_produit where code_produit = :code_interne_local ;
	
	declare cur3 cursor for select  code_praticien from param_stock_produit where code_produit = :code_interne_local ;
	
	declare cur4 cursor for select code_fournisseur from reference_produit where code_produit = :code_interne_local ;
	
	// TEST SELON LE FOURNISSEUR
	
	open cur1 ;
	
	fetch cur1 into :v_code_fournisseur ;
	
	do while sqlca.sqlcode = 0 
	
		// on etudie pour tous les praticiens du produit
		open cur2 ;
		
		fetch cur2 into :v_code_praticien ; 
		
		do while sqlca.sqlcode = 0 
				
				select isnull(count(*),0) into :v_cpt from param_stock_fournisseur where code_produit = :code_interne_local and 
				code_fournisseur = :v_code_fournisseur and code_praticien = :v_code_praticien ;
				
				if v_cpt = 0 then
					
					// Faut ajouter ....
					select top 1 qte_com_min, qte_colisee, remise, archive, generer, code_index 
					into :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index 
					from param_stock_fournisseur where code_produit = :code_interne_local ;
					
					if sqlca.sqlcode <> 0 then
						// Valeurs par défaut
						v_qte_com_min = 0
						v_qte_colisee = 1
						v_remise = 0
						v_archive = 'n'
						setnull(v_generer)
						setnull(v_code_index)
					end if
					
					// ajout effectif 
					insert into param_stock_fournisseur 	(code_produit, code_fournisseur, code_praticien, qte_com_min, qte_colisee, remise, archive, generer, code_index ) 				
					values (:code_interne_local, :v_code_fournisseur, :v_code_praticien, :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index ) ;
				
				end if
				
				fetch cur2 into :v_code_praticien ; 
				
		loop
		
	
		close cur2 ;
		
		fetch cur1 into :v_code_fournisseur ;
	
	loop
	
	
	close cur1 ;
	
	commit ;
	
	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// TEST SELON LE PRATICIEN 
	
	open cur3 ;
	
	fetch cur3 into :v_code_praticien ;
	
	do while sqlca.sqlcode = 0 
	
		// on etudie pour tous les fournisseurs du produit
		open cur4 ;
		
		fetch cur4 into :v_code_fournisseur ; 
		
		do while sqlca.sqlcode = 0 
				
				select isnull(count(*),0) into :v_cpt from param_stock_fournisseur where code_produit = :code_interne_local and 
				code_fournisseur = :v_code_fournisseur and code_praticien = :v_code_praticien ;
				
				if v_cpt = 0 then
					
					// Faut ajouter ....
					select top 1 qte_com_min, qte_colisee, remise, archive, generer, code_index 
					into :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index 
					from param_stock_fournisseur where code_produit = :code_interne_local ;
					
					if sqlca.sqlcode <> 0 then
						// Valeurs par défaut
						v_qte_com_min = 0
						v_qte_colisee = 1
						v_remise = 0
						v_archive = 'n'
						setnull(v_generer)
						setnull(v_code_index)
					end if
					
					// ajout effectif 
					insert into param_stock_fournisseur 	(code_produit, code_fournisseur, code_praticien, qte_com_min, qte_colisee, remise, archive, generer, code_index ) 				
					values (:code_interne_local, :v_code_fournisseur, :v_code_praticien, :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index ) ;
				
				end if
				
				fetch cur4 into :v_code_fournisseur ; 
				
		loop
		
	
		close cur4 ;
		
		fetch cur3 into :v_code_praticien ;
	
	loop
	
	
	close cur1 ;
	
	commit ;
	
end if	

prems_enregistrement = false

end event

type dw_2 from datawindow within w_produit_fiche
boolean visible = false
integer x = 1806
integer y = 1020
integer width = 571
integer height = 600
integer taborder = 20
string title = "none"
string dataobject = "dw_produit_param_fiche_ajout"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_produit_fiche
boolean visible = false
integer x = 1943
integer y = 1060
integer width = 571
integer height = 600
integer taborder = 30
string title = "none"
string dataobject = "dw_reference_produit_fiche_ajout"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_fiche from tab within w_produit_fiche
event create ( )
event destroy ( )
integer x = 617
integer y = 772
integer width = 1824
integer height = 1404
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 15780518
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_reference tabpage_reference
tabpage_param tabpage_param
end type

on tab_fiche.create
this.tabpage_reference=create tabpage_reference
this.tabpage_param=create tabpage_param
this.Control[]={this.tabpage_reference,&
this.tabpage_param}
end on

on tab_fiche.destroy
destroy(this.tabpage_reference)
destroy(this.tabpage_param)
end on

type tabpage_reference from userobject within tab_fiche
integer x = 18
integer y = 100
integer width = 1787
integer height = 1288
long backcolor = 15780518
string text = "Référencement"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
cb_suppr cb_suppr
cb_ajout cb_ajout
dw_liste dw_liste
dw_fiche dw_fiche
end type

on tabpage_reference.create
this.cb_suppr=create cb_suppr
this.cb_ajout=create cb_ajout
this.dw_liste=create dw_liste
this.dw_fiche=create dw_fiche
this.Control[]={this.cb_suppr,&
this.cb_ajout,&
this.dw_liste,&
this.dw_fiche}
end on

on tabpage_reference.destroy
destroy(this.cb_suppr)
destroy(this.cb_ajout)
destroy(this.dw_liste)
destroy(this.dw_fiche)
end on

type cb_suppr from uo_picturebutton_780x120 within tabpage_reference
integer x = 919
integer y = 1120
integer width = 777
integer height = 152
integer taborder = 80
string text = "Supprimer Fournisseur"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if tab_fiche.tabpage_reference.dw_fiche.rowcount() > 0 then
	
	// Vérification si pas de commande pour ce fournisseur ... pas fait en base de données*
	long lig, cpt
	string v_code_fournisseur, v_code_produit
	
	
	lig = tab_fiche.tabpage_reference.dw_liste.getrow()
	v_code_fournisseur = dw_fiche.GetItemString(lig, "code_fournisseur")
	v_code_produit = dw_fiche.GetItemString(lig, "code_produit")
	
	select count(*) into :cpt from  ligne_commande, commande where ligne_commande.numero_commande = commande.numero_commande 
	and commande.code_fournisseur = :v_code_fournisseur and ligne_commande.code_produit = :v_code_produit ;
	zerol(cpt)
	
	if cpt = 0 then 
		tab_fiche.tabpage_reference.dw_fiche.deleterow(lig)
	else
		Messagebox("ATTENTION", "Vous ne pouvez pas supprimer le référencement de ce fournisseur car vous avez déjà passé des commandes chez lui.")
	end if
end if

end event

type cb_ajout from uo_picturebutton_780x120 within tabpage_reference
integer x = 96
integer y = 1120
integer width = 777
integer height = 152
integer taborder = 90
string text = "Ajouter Fournisseur"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;ajouter()

end event

type dw_liste from u_basedw within tabpage_reference
string tag = "brush"
integer x = 453
integer y = 16
integer width = 1033
integer height = 308
integer taborder = 60
string dataobject = "dw_produit_fournisseur_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	tab_fiche.tabpage_reference.dw_fiche.scrolltorow(row)
end if
end event

type dw_fiche from datawindow within tabpage_reference
string tag = "brush"
integer x = 165
integer y = 336
integer width = 1499
integer height = 768
integer taborder = 20
string title = "none"
string dataobject = "dw_reference_produit_fiche"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;string statut, code_fournisseur

if currentrow > 0 and newrow > 0 then
	tab_fiche.tabpage_reference.dw_liste.selectrow(newrow,true)
	tab_fiche.tabpage_reference.dw_liste.selectrow(currentrow,false)
	code_fournisseur = this.getitemstring(newrow,"code_fournisseur")

	select "statut"
		into :statut
		from "fournisseur"
		where code = :code_fournisseur;
		
	if statut = "3" then
		this.modify("code_fabricant.visible = true")
		this.modify("code_fabricant_t.visible = true")
		this.settaborder("code_fabricant",2)
	else
		this.modify("code_fabricant.visible = false")
		this.modify("code_fabricant_t.visible = false")
		this.settaborder("code_fabricant",0)
	end if
end if
end event

event retrieveend;//string statut, code_fournisseur
//if rowcount > 0 then
//	code_fournisseur = this.getitemstring(getrow(),"code_fournisseur")
//	
//		select "statut"
//			into :statut
//			from "fournisseur"
//			where code = :code_fournisseur;
//		
//	if statut = "3" then
//		this.modify("code_fabricant.visible = true")
//		this.modify("code_fabricant_t.visible = true")
//		this.settaborder("code_fabricant",2)
//	else
//		this.modify("code_fabricant.visible = false")
//		this.modify("code_fabricant_t.visible = false")
//		this.settaborder("code_fabricant",0)
//	end if
//end if

	colore_datawindow(this)
end event

event itemchanged;string statut, code_fournisseur
if row > 0 and dwo.name = "code_fournisseur" then
		select "statut"
			into :statut
			from "fournisseur"
			where code = :data;
		
	if statut = "3" then
		this.modify("code_fabricant.visible = true")
		this.modify("code_fabricant_t.visible = true")
		this.settaborder("code_fabricant",2)
	else
		this.modify("code_fabricant.visible = false")
		this.modify("code_fabricant_t.visible = false")
		this.settaborder("code_fabricant",0)
		this.setitem(row,"code_fabricant",data)
	end if
end if
end event

event dberror;if sqldbcode = -195 then
	son(4)
	MessageBox("Alerte Base de Données","Vous devez indiquer un Fournisseur !",Information!)
else	
	db_erreur(dw_fiche,sqldbcode,sqlerrtext)
end if

return 1
end event

type tabpage_param from userobject within tab_fiche
integer x = 18
integer y = 100
integer width = 1787
integer height = 1288
long backcolor = 15780518
string text = "Gestion de stock"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
cb_suppr_stock cb_suppr_stock
cb_ajout_stock cb_ajout_stock
dw_liste2 dw_liste2
dw_fiche2 dw_fiche2
end type

on tabpage_param.create
this.cb_suppr_stock=create cb_suppr_stock
this.cb_ajout_stock=create cb_ajout_stock
this.dw_liste2=create dw_liste2
this.dw_fiche2=create dw_fiche2
this.Control[]={this.cb_suppr_stock,&
this.cb_ajout_stock,&
this.dw_liste2,&
this.dw_fiche2}
end on

on tabpage_param.destroy
destroy(this.cb_suppr_stock)
destroy(this.cb_ajout_stock)
destroy(this.dw_liste2)
destroy(this.dw_fiche2)
end on

type cb_suppr_stock from uo_picturebutton_780x120 within tabpage_param
integer x = 910
integer y = 1104
integer width = 690
integer height = 152
integer taborder = 100
string text = "Supprimer Praticien"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if tab_fiche.tabpage_param.dw_fiche2.rowcount() > 0 then
	tab_fiche.tabpage_param.dw_fiche2.deleterow(tab_fiche.tabpage_param.dw_liste2.getrow())
	if not multistock then
		tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false)
	else
		if tab_fiche.tabpage_param.dw_liste2.rowcount() = 1 then
			tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false)
		else
			tab_fiche.tabpage_param.cb_suppr_stock.enabled ( true)
		end if
	end if
end if

end event

type cb_ajout_stock from uo_picturebutton_780x120 within tabpage_param
integer x = 133
integer y = 1104
integer width = 690
integer height = 152
integer taborder = 90
string text = "Ajouter Praticien"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;ajouter()

if not multistock then
	tab_fiche.tabpage_param.cb_ajout_stock.enabled ( false)
else
	if tab_fiche.tabpage_param.dw_liste2.rowcount() = 1 then
		tab_fiche.tabpage_param.cb_suppr_stock.enabled ( false)
	else
		tab_fiche.tabpage_param.cb_suppr_stock.enabled ( true)
	end if
end if
end event

type dw_liste2 from u_basedw within tabpage_param
string tag = "brush"
integer x = 137
integer y = 44
integer width = 1559
integer height = 364
integer taborder = 11
string dataobject = "dw_produit_prati_liste"
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	tab_fiche.tabpage_param.dw_fiche2.scrolltorow(row)
end if
end event

type dw_fiche2 from datawindow within tabpage_param
string tag = "brush"
integer x = 192
integer y = 480
integer width = 1394
integer height = 552
integer taborder = 30
string title = "none"
string dataobject = "dw_produit_param_fiche"
boolean border = false
boolean livescroll = true
end type

event dberror;if sqldbcode = -195 then
	son(4)
	MessageBox("Alerte Base de Données","Vous devez indiquer un Praticien !",Information!)
else	
	db_erreur(dw_fiche2,sqldbcode,sqlerrtext)
end if

return 1
end event

event retrieveend;	colore_datawindow(this)

end event

type uo_1 from resize_fenetre within w_produit_fiche
boolean visible = false
integer x = 1897
integer y = 1180
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_basic from datawindow within w_produit_fiche
string tag = "brush"
integer x = 110
integer y = 80
integer width = 1957
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_produit_fiche_basic"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type.retrieve(data)
	dw_basic.setitem(dw_basic.getrow(),"produit_code_type_produit","")
end if
end event

event buttonclicked;string	ls_Object
string	ls_win
long couleur_choisie
string v_message

ls_Object = String(dwo.name)


choose case ls_object
	case "b_gs1" 
		//Mise à jour du GTIN
	if row > 0 then
		boolean v_suite
		str_udi v_udi
		open(w_udi_lecture)
		v_udi = message.powerobjectParm
		
		if not isnull(v_udi) then
			if len(trim(this.GetItemString(1, "produit_gtin"))) > 0 then 
				if Messagebox("ATTENTION", "Vous allez remplacer l'idendifiant UDI actuel par : " +   v_udi.di+ "~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
					v_suite = true
				else
					v_suite = false
				end if
			else
				v_suite = true
			end if
			if v_suite then
				this.SetItem(1, "produit_gtin", v_udi.di)
			end if
		end if
		
		
		// Mise à jour de la zone lue !!
		
//		if 	dw_histo_dossier.visible then
//			dw_histo_dossier.visible = false
//		else
//			dw_histo_dossier.settransobject(sqlca)
//			dw_histo_dossier.var_code_local = var_code_local
//			dw_histo_dossier.retrieve(var_code_local)
//			dw_histo_dossier.visible = true
//		end if
	end if
end choose
end event

type cb_imprimer from uo_picturebutton_390x120 within w_produit_fiche
integer x = 704
integer y = 2220
integer width = 558
integer height = 152
integer taborder = 70
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

dw_edition.retrieve(code_interne_local)
dw_edition.print()
end event

type dw_edition from datawindow within w_produit_fiche
boolean visible = false
integer x = 219
integer y = 1660
integer width = 686
integer height = 400
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_produit_fiche_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_produit_fiche
integer x = 32
integer y = 16
integer width = 2057
integer height = 596
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Produit"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_produit_fiche
integer x = 585
integer y = 704
integer width = 1897
integer height = 1496
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Fiche détaillée du produit"
end type

type dw_ajout from datawindow within w_produit_fiche
string tag = "brush"
boolean visible = false
integer x = 416
integer y = 908
integer width = 2176
integer height = 368
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_produit_fiche_basic_ajout"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type_ajout.retrieve(data)
	dw_ajout.setitem(dw_ajout.getrow(),"produit_code_type_produit","")
//	cb_continuer.enabled = false
end if

//messagebox("type",this.getitemstring(row,"type_produit_code_categorie_produit"))
//messagebox("code",this.getitemstring(row,"produit_code_type_produit"))
//


//if dwo.name = 'produit_code_type_produit' then
//	cb_continuer.enabled = true
//end if
//
end event

event dberror;db_erreur(dw_ajout,sqldbcode,sqlerrtext)
return 1
end event

event itemfocuschanged;if not isnull(this.getitemstring(row,"type_produit_code_categorie_produit")) and  not isnull(this.getitemstring(row,"produit_code_type_produit"))  and &
 this.getitemstring(row,"type_produit_code_categorie_produit") <> ''  and  this.getitemstring(row,"produit_code_type_produit") <> '' then
	//cb_continuer.enabled = true
else
	//cb_continuer.enabled = false
end if

end event

type ole_photo_arakis005 from gearbox_fournisseur within w_produit_fiche
integer x = 2126
integer y = 24
integer width = 951
integer height = 584
integer taborder = 30
boolean bringtotop = true
end type

on ole_photo_arakis005.destroy
call gearbox_fournisseur::destroy
end on

