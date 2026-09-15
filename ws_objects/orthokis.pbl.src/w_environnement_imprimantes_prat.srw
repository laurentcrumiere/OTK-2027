$PBExportHeader$w_environnement_imprimantes_prat.srw
forward
global type w_environnement_imprimantes_prat from w_fenetre_arakis
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type cb_annuler from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type cb_fermer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type cb_supprimer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type cb_ajouter from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
end type
type dw_liste from u_basedw within w_environnement_imprimantes_prat
end type
type uo_1 from resize_fenetre within w_environnement_imprimantes_prat
end type
type ddlb_liste_imprimantes from uo_liste_imprimantes within w_environnement_imprimantes_prat
end type
type st_12 from statictext within w_environnement_imprimantes_prat
end type
end forward

global type w_environnement_imprimantes_prat from w_fenetre_arakis
integer x = 32
integer y = 176
integer width = 4393
integer height = 1764
string title = "Configuration des imprimantes DEP selon le praticien"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_raz_ordre_trie pb_raz_ordre_trie
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
dw_liste dw_liste
uo_1 uo_1
ddlb_liste_imprimantes ddlb_liste_imprimantes
st_12 st_12
end type
global w_environnement_imprimantes_prat w_environnement_imprimantes_prat

type variables

string v_commande_sql
string v_nom_poste
end variables

event open;call super::open;uo_1.taille(this) // pour les couleurs 

integer i = 0
string v_nom, v_code

// Table temporaire pour stocker les imprimantes .. .
v_commande_sql = 'CREATE LOCAL TEMPORARY TABLE "imprimantes_locales" ("nom" char(200) NOT NULL)  ON COMMIT PRESERVE ROWS  ;'
execute immediate :v_commande_sql ;
if sqlca.sqlcode <> 0  then
	Messagebox("ATTENTION !", "Erreur dans la création de la table temporaire des IMPRIMANTES :~n~n" + sqlca.sqlerrtext)
	close(this)
else
	// Remplissage de la liste
	for i = 1 to ddlb_liste_imprimantes.nombre_imprimantes
		v_nom = ddlb_liste_imprimantes.text(i)
		insert into  "imprimantes_locales" ("nom") values (:v_nom) ;
	next
	commit ;
	
	v_nom_poste = get_nom_ordinateur()
	dw_liste.settransobject(sqlca)
	dw_liste.retrieve(v_nom_poste)
	
	

end if


end event

on w_environnement_imprimantes_prat.create
int iCurrent
call super::create
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.ddlb_liste_imprimantes=create ddlb_liste_imprimantes
this.st_12=create st_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_raz_ordre_trie
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_supprimer
this.Control[iCurrent+6]=this.cb_ajouter
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.ddlb_liste_imprimantes
this.Control[iCurrent+10]=this.st_12
end on

on w_environnement_imprimantes_prat.destroy
call super::destroy
destroy(this.pb_raz_ordre_trie)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.ddlb_liste_imprimantes)
destroy(this.st_12)
end on

event close;call super::close;

//Suppression des tables temporaires
v_commande_sql = 'DROP TABLE "imprimantes_locales" ;'
execute immediate :v_commande_sql ;

end event

type p_fond from w_fenetre_arakis`p_fond within w_environnement_imprimantes_prat
end type

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
boolean visible = false
integer x = 1065
integer y = 2032
integer width = 562
integer height = 132
integer taborder = 40
string text = "&Trier par défaut"
string iconname = "ACTIONS_trier.png"
end type

event clicked;call super::clicked;
if MessageBox("ATTENTION","Vous allez réinitialiser les ordres de tri à 100 pour tous les éléments.~n~nSi vous confirmez, vous devrez ensuite définir une élément par défaut en lui donnant '1' comme ordre de tri.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	constant string col_name_ordre_trie = "ordre_trie"
	constant int ordre_par_defaut = 100
	
	long nbr_row
	nbr_row = dw_liste.rowcount()
	long row
	for row = 1 to nbr_row
		dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
	next
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
integer x = 2743
integer y = 1468
integer width = 517
integer height = 132
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_liste.retrieve(v_nom_poste)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
integer x = 3269
integer y = 1468
integer width = 517
integer height = 132
integer taborder = 60
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_fermer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
integer x = 3794
integer y = 1468
integer width = 517
integer height = 132
integer taborder = 70
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

boolean faut_fermer = false

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
	 faut_fermer = true
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			 faut_fermer = true
		end if
	else
		 faut_fermer = true
	end if
end if

if faut_fermer then
	
	close(parent)
end if


end event

type cb_supprimer from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
integer x = 489
integer y = 1468
integer width = 457
integer height = 132
integer taborder = 30
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_environnement_imprimantes_prat
integer x = 23
integer y = 1468
integer width = 457
integer height = 132
integer taborder = 20
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
// recherche de la valeur maxi

dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.rowcount(), "nom_poste", v_nom_poste)
dw_liste.SetItem(dw_liste.rowcount(), "nom_imprimante", ddlb_liste_imprimantes.imprimante_defaut)
dw_liste.SetColumn("code_praticien")
dw_liste.SetFocus()

end event

type dw_liste from u_basedw within w_environnement_imprimantes_prat
string tag = "no resize centrer brush"
integer x = 133
integer y = 12
integer width = 4142
integer height = 1380
integer taborder = 10
string dataobject = "dw_prati_imprimantes"
borderstyle borderstyle = stylebox!
end type

event itemchanged;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If



if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event clicked;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type uo_1 from resize_fenetre within w_environnement_imprimantes_prat
boolean visible = false
integer x = 1765
integer y = 352
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type ddlb_liste_imprimantes from uo_liste_imprimantes within w_environnement_imprimantes_prat
boolean visible = false
integer x = 2706
integer y = 368
integer taborder = 20
boolean bringtotop = true
end type

type st_12 from statictext within w_environnement_imprimantes_prat
integer x = 955
integer y = 1496
integer width = 1778
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
boolean enabled = false
string text = "Paramètres locaux propres au poste de travail uniquement"
alignment alignment = center!
boolean focusrectangle = false
end type

