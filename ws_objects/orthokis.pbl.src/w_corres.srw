$PBExportHeader$w_corres.srw
forward
global type w_corres from w_param2
end type
type pb_1 from uo_picturebutton_390x120 within w_corres
end type
type dw_liste_emails from datawindow within w_corres
end type
type cb_fusionner from uo_picturebutton_390x120 within w_corres
end type
end forward

global type w_corres from w_param2
integer width = 4242
string title = "Table des Correspondants & Dentistes Traitants"
pb_1 pb_1
dw_liste_emails dw_liste_emails
cb_fusionner cb_fusionner
end type
global w_corres w_corres

type variables
datastore dw_liste_etiq

end variables

forward prototypes
public subroutine tout_selectionner (string v_sel)
public subroutine generer_liste_etiquettes (integer v_nb_exemplaire)
end prototypes

public subroutine tout_selectionner (string v_sel);// pour la sélection des étiquettes
long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot 
	dw_liste.SetItem(lig, "selection", v_sel)
next 


end subroutine

public subroutine generer_liste_etiquettes (integer v_nb_exemplaire);	long lig, tot, ligetiq
	integer cpt_exemplaire
	string v_code
	
	tot = dw_liste.rowcount()
	
	dw_liste_etiq.reset()
	
	for lig = 1 to tot
		
		
		if dw_liste.GetItemString(lig, "selection" ) = "O" then 
			
			v_code = dw_liste.getItemString(lig, "code")
			
			// recherche des éléments à partir du code du patient pour être sûr du coup !!!
			string v_nom, v_prenom, v_adr1, v_adr2, v_codep, v_ville, v_titre
			string v_code_titre
			
			select titre, nom, isnull(prenom, ''), adr1, adr2, codep, ville 
			into :v_code_titre, :v_nom, :v_prenom, :v_adr1, :v_adr2, :v_codep, :v_ville 
			from correspondants 
			where correspondants.code = :v_code  ;
		
			select isnull(nom, '') into :v_titre 
			from  titre_personnes 
			where  code = :v_code_titre ;
			
			for cpt_exemplaire = 1 to v_nb_exemplaire
				dw_liste_etiq.insertrow(0)
				ligetiq = dw_liste_etiq.rowcount()
				
	
				if len(trim(v_titre)) = 0 then
					dw_liste_etiq.setitem(ligetiq, "ligne1", v_nom+' ' +v_prenom)
				else
					dw_liste_etiq.setitem(ligetiq, "ligne1", trim(v_titre) + " "+ v_nom+' ' +v_prenom)
				end if
				dw_liste_etiq.setitem(ligetiq, "ligne2",v_adr1)
				dw_liste_etiq.setitem(ligetiq, "ligne3", v_adr2)
				dw_liste_etiq.setitem(ligetiq, "ligne4", v_codep +" "+v_ville ) 
			next
		end if
		
	next
	
end subroutine

event open;call super::open;var_fille = "w_corres_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
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

verification_ordre_par_defaut = true
v_nom_table_a_verifier = "correspondants"


end event

on w_corres.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_liste_emails=create dw_liste_emails
this.cb_fusionner=create cb_fusionner
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_liste_emails
this.Control[iCurrent+3]=this.cb_fusionner
end on

on w_corres.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_liste_emails)
destroy(this.cb_fusionner)
end on

type p_fond from w_param2`p_fond within w_corres
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_corres
boolean visible = true
integer x = 1394
integer y = 1860
integer width = 526
integer height = 144
end type

type cb_annuler from w_param2`cb_annuler within w_corres
integer x = 2816
integer y = 2016
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_corres
integer x = 3278
integer y = 2016
end type

type cb_ajouter from w_param2`cb_ajouter within w_corres
integer x = 37
integer y = 1860
end type

type cb_modifier from w_param2`cb_modifier within w_corres
integer x = 489
integer y = 1860
end type

type cb_supprimer from w_param2`cb_supprimer within w_corres
integer x = 37
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	// On a pas le droit de supprimer le code 'AR' car utilisé par défaut en ajout de Patient
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'AR' then
		MessageBox("ATTENTION !","Vous n'avez pas le droit de supprimer le code 'AR' car il est utilisé par défaut par le logiciel")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_1 from w_param2`cb_1 within w_corres
integer x = 489
end type

type cb_chercher from w_param2`cb_chercher within w_corres
end type

type cb_exporter from w_param2`cb_exporter within w_corres
integer x = 1394
end type

event cb_exporter::clicked;long lig, tot, lig_export
string v_email, v_code
tot = dw_liste.rowcount()

if MessageBox("ATTENTION","Souhaitez-vous exporter uniquement les adresses email ?~n~n(Seuls les correspondants sélectionnés et ayant une adresse emails seront exportés)", Question!, YesNo!, 1) = 1 then
	dw_liste_emails.reset()
	
	// Pour lister les patients sélectionnés
	for lig = 1 to tot
		if len(trim(dw_liste.GetItemString(lig, "email")) ) > 0 and dw_liste.GetItemString(lig, "selection") = "O" then
			// Ajouter une adresse email à la liste
			dw_liste_emails.insertrow(0)
			dw_liste_emails.SetItem(dw_liste_emails.rowcount(), "email", dw_liste.GetItemString(lig, "email"))
		end if
	next
	dw_liste_emails.saveas()
else
	dw_liste.saveas()
end if
end event

type cb_fermer from w_param2`cb_fermer within w_corres
integer x = 3739
integer y = 2016
end type

type dw_liste from w_param2`dw_liste within w_corres
string tag = "no resize centrer brush"
integer x = 14
integer width = 4183
integer height = 1792
string dataobject = "dw_corresp_liste"
end type

event dw_liste::rbuttondown;
string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_selection" 
		tout_selectionner("N")
end choose
end event

event dw_liste::clicked;call super::clicked;


string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_selection" 
		tout_selectionner("O")
end choose
end event

type uo_1 from w_param2`uo_1 within w_corres
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_corres
string dataobject = "dw_corresp_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_corres
integer y = 2028
end type

type gb_filtre from w_param2`gb_filtre within w_corres
end type

type pb_1 from uo_picturebutton_390x120 within w_corres
integer x = 942
integer y = 1860
integer width = 448
integer height = 148
integer taborder = 31
boolean bringtotop = true
string text = "Etique&ttes"
string iconname = "ACTIONS_etiquettes.png"
end type

event clicked;call super::clicked;
// replissage de la liste des adresse

dw_liste_etiq = create datastore
dw_liste_etiq.DataObject = "dw_etiquettes"

long tot, lig, ligetiq
string v_code


if dw_liste.Find("selection = 'O'", 1, 99999)  = 0 then 
	Messagebox("ATTENTION", "Vous n'avez sélectionné aucun correspondant !")
else
	
	
//	tot = dw_liste.rowcount()
//	
//	for lig = 1 to tot
//		
//		
//		if dw_liste.GetItemString(lig, "selection" ) = "O" then 
//			
//			v_code = dw_liste.getItemString(lig, "code")
//			
//			dw_liste_etiq.insertrow(0)
//			ligetiq = dw_liste_etiq.rowcount()
//			
//			// recherche des éléments à partir du code du patient pour être sûr du coup !!!
//			string v_nom, v_prenom, v_adr1, v_adr2, v_codep, v_ville, v_titre
//			string v_code_titre
//			
//			select titre, nom, isnull(prenom, ''), adr1, adr2, codep, ville 
//			into :v_code_titre, :v_nom, :v_prenom, :v_adr1, :v_adr2, :v_codep, :v_ville 
//			from correspondants 
//			where correspondants.code = :v_code  ;
//		
//			select isnull(nom, '') into :v_titre 
//			from  titre_personnes 
//			where  code = :v_code_titre ;
//			
//			if len(trim(v_titre)) = 0 then
//				dw_liste_etiq.setitem(ligetiq, "ligne1", v_nom+' ' +v_prenom)
//			else
//				dw_liste_etiq.setitem(ligetiq, "ligne1", trim(v_titre) + " "+ v_nom+' ' +v_prenom)
//			end if
//			dw_liste_etiq.setitem(ligetiq, "ligne2",v_adr1)
//			dw_liste_etiq.setitem(ligetiq, "ligne3", v_adr2)
//			dw_liste_etiq.setitem(ligetiq, "ligne4", v_codep +" "+v_ville ) 
//		end if
//		
//	next
//


	generer_liste_etiquettes(1)
	
	OpenWithParm (w_etiquettes, dw_liste_etiq)
	
end if
end event

type dw_liste_emails from datawindow within w_corres
boolean visible = false
integer x = 1595
integer y = 888
integer width = 1275
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_emails"
boolean livescroll = true
end type

type cb_fusionner from uo_picturebutton_390x120 within w_corres
integer x = 1925
integer y = 1860
integer width = 448
integer height = 148
integer taborder = 31
boolean bringtotop = true
string text = "Fusionner"
string iconname = "ACTIONS_fusionner.png"
end type

event clicked;call super::clicked;ok_mdp = false

guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
// pour se repositionner ensuite
string v_code 
v_code = dw_liste.getitemstring(dw_liste.getrow(),"code")

if ok_mdp then
	open(w_corres_fusionner)

	dw_liste.retrieve('%')
	
	long lig 
	lig = dw_liste.Find("Code = '"+v_code+"'" , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if
end event

