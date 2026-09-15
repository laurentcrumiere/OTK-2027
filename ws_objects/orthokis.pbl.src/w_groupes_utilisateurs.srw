$PBExportHeader$w_groupes_utilisateurs.srw
forward
global type w_groupes_utilisateurs from w_param2
end type
type dw_membres from datawindow within w_groupes_utilisateurs
end type
end forward

global type w_groupes_utilisateurs from w_param2
string title = "Table des Groupes d~'Utilisateurs"
dw_membres dw_membres
end type
global w_groupes_utilisateurs w_groupes_utilisateurs

type variables


double id_max
end variables

forward prototypes
public subroutine raffraichir_dw_membres ()
end prototypes

public subroutine raffraichir_dw_membres ();// Memo au fur et à mesure
//cb_enregistrer.TriggerEvent(Clicked!)

if dw_liste.rowcount() > 0 then
	dw_membres.retrieve(dw_liste.GetitemNumber(dw_liste.Getrow(), "id"))
else
	dw_membres.reset()
end if
end subroutine

on w_groupes_utilisateurs.create
int iCurrent
call super::create
this.dw_membres=create dw_membres
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_membres
end on

on w_groupes_utilisateurs.destroy
call super::destroy
destroy(this.dw_membres)
end on

event open;dw_membres.settransobject(sqlca)
dw_liste.settransobject(SQLCA)
dw_liste.retrieve('%')

dw_liste_edition.settransobject(SQLCA)

uo_1.taille(this)

//on force l'enregistrement auto pour synchro les 2 dw
enregistrement_automatique = true

if enregistrement_automatique then 
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	
end if

colore_tous_objets_window(this, couleur_fond_fenetre)


// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose


// on gere l'increment de l'ID en interne sinon soucis pour dw_membres
select max(id) into :id_max from groupes ;

If dw_liste.rowcount() > 0 Then
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(1,True)
End If



end event

type p_fond from w_param2`p_fond within w_groupes_utilisateurs
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_groupes_utilisateurs
integer x = 1266
integer y = 2016
end type

type cb_annuler from w_param2`cb_annuler within w_groupes_utilisateurs
integer y = 2016
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_groupes_utilisateurs
integer y = 2016
end type

event cb_enregistrer::clicked;dw_membres.accepttext()
dw_liste.accepttext()

	
if dw_liste.update() = 1 and  dw_membres.update() = 1  then
	commit ;
else
	//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
	//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if

end event

type cb_ajouter from w_param2`cb_ajouter within w_groupes_utilisateurs
integer x = 448
integer y = 2016
end type

event cb_ajouter::clicked;

id_max = id_max+1

dw_liste.InsertRow(0)
dw_liste.SelectRow(0,False)
dw_liste.SelectRow(dw_liste.rowcount(),True)

dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.RowCount(),"id",id_max)
dw_liste.Setcolumn("nom")
dw_liste.SetFocus()

end event

type cb_modifier from w_param2`cb_modifier within w_groupes_utilisateurs
boolean visible = false
integer y = 1932
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	
	integer v_code 
	v_code = dw_liste.getitemNumber(dw_liste.getrow(),"id")
	
	OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve()
	long lig 
	lig = dw_liste.Find("id = "+string(v_code) , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from w_param2`cb_supprimer within w_groupes_utilisateurs
integer x = 919
end type

type cb_1 from w_param2`cb_1 within w_groupes_utilisateurs
boolean visible = false
integer x = 357
integer y = 1328
end type

type cb_chercher from w_param2`cb_chercher within w_groupes_utilisateurs
boolean visible = false
integer x = 946
integer y = 1308
end type

type cb_exporter from w_param2`cb_exporter within w_groupes_utilisateurs
integer x = 1390
end type

type cb_fermer from w_param2`cb_fermer within w_groupes_utilisateurs
integer y = 2016
end type

type dw_liste from w_param2`dw_liste within w_groupes_utilisateurs
integer x = 329
integer y = 48
integer width = 1856
integer height = 1892
string dataobject = "dw_groupes_utilisateurs"
end type

event dw_liste::retrieveend;call super::retrieveend;raffraichir_dw_membres()
end event

event dw_liste::rowfocuschanged;call super::rowfocuschanged;raffraichir_dw_membres()
end event

event dw_liste::updateend;call super::updateend;raffraichir_dw_membres()
end event

event dw_liste::clicked;call super::clicked;setrow(row)
raffraichir_dw_membres()
end event

event dw_liste::doubleclicked;raffraichir_dw_membres()
end event

event dw_liste::rbuttondown;call super::rbuttondown;raffraichir_dw_membres()
end event

type uo_1 from w_param2`uo_1 within w_groupes_utilisateurs
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_groupes_utilisateurs
string dataobject = "dw_diagnostic_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_groupes_utilisateurs
end type

type gb_filtre from w_param2`gb_filtre within w_groupes_utilisateurs
end type

type dw_membres from datawindow within w_groupes_utilisateurs
string tag = "no resize brush"
integer x = 2382
integer y = 240
integer width = 1362
integer height = 1552
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Membres"
string dataobject = "dw_groupes_membres"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

if dw_liste.rowcount() > 0 then
	
	choose case ls_object
		case "b_plus" 
			InsertRow(0)
			SetItem(this.rowcount(), "id_groupe", dw_liste.GetItemNumber(dw_liste.GetRow(), "id"))
			ScrollToRow(this.rowcount())
			SetRow(this.rowcount())
			SetFocus()
			
			
		case "b_moins" 
			Deleterow(this.GetRow())

		case "b_sauver" 
			dw_membres.accepttext()
			if dw_membres.update() = 1  then
				commit ;
			else
				MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
				"Aucune modification ne sera prise en compte !",Exclamation!)
				Rollback ;
			end if
		
	end choose
end if
end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

event getfocus;
// On force l'enregistrement des groupes pour éviter les erreurs
dw_liste.accepttext()
if dw_liste.update() = 1  then
	commit ;
else
	rollback ;
end if
end event

