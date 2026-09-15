$PBExportHeader$w_dossier.srw
forward
global type w_dossier from w_param
end type
type dw_edition from datawindow within w_dossier
end type
type cb_2 from uo_picturebutton_390x120 within w_dossier
end type
type cb_1 from uo_picturebutton_390x120 within w_dossier
end type
end forward

global type w_dossier from w_param
string title = "Table des Types de dossiers"
dw_edition dw_edition
cb_2 cb_2
cb_1 cb_1
end type
global w_dossier w_dossier

type variables
double max
	

end variables

on w_dossier.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
end on

on w_dossier.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;call super::open;dw_edition.settransobject(sqlca)

//SELECT MAX(CONVERT(double,code))
//INTO :max
// FROM "dossier"  
//WHERE ( "dossier"."code" not between 'a' AND 'z' ) AND  
//		( "dossier"."code" not between 'A' AND 'Z' )    ;
//
//IF IsNull(max) THEN
//	max = 1
//ELSE	
//	max = max + 1
//END IF	


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
v_nom_table_a_verifier = "dossier"




end event

type p_fond from w_param`p_fond within w_dossier
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_dossier
boolean visible = true
integer x = 0
integer y = 2020
integer height = 144
end type

type cb_annuler from w_param`cb_annuler within w_dossier
integer x = 2912
integer y = 2020
integer width = 425
integer height = 144
end type

type cb_enregistrer from w_param`cb_enregistrer within w_dossier
integer x = 3342
integer y = 2020
integer width = 425
integer height = 144
end type

type cb_fermer from w_param`cb_fermer within w_dossier
integer x = 3771
integer y = 2020
integer width = 425
integer height = 144
end type

type cb_supprimer from w_param`cb_supprimer within w_dossier
integer x = 997
integer y = 2020
integer width = 425
integer height = 144
integer taborder = 40
end type

event cb_supprimer::clicked;string code
long ligne

if dw_liste.rowcount() > 0 then
	ligne = dw_liste.GetRow() 
	code = dw_liste.GetItemString(ligne,"code")
	
	IF code = 'A' OR code = 'R' THEN
		MessageBox("ATTENTION","Vous ne pouvez pas supprimer ce type de dossier !")
	ELSE	
		son(7)
		dw_liste.deleterow(ligne)
	end if
END IF	
end event

type cb_ajouter from w_param`cb_ajouter within w_dossier
integer x = 567
integer y = 2020
integer width = 425
integer height = 144
integer taborder = 30
end type

event cb_ajouter::clicked;call super::clicked;//dw_liste.InsertRow(0)
//
//max = get_max_code_datawindow(dw_liste, "code") + 1
//
//
//dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))
//
//
//dw_liste.ScrollToRow(dw_liste.rowcount())
//dw_liste.Setcolumn(1)
//dw_liste.SetFocus()
//
end event

type dw_liste from w_param`dw_liste within w_dossier
integer x = 690
integer y = 40
integer width = 2898
end type

event dw_liste::clicked;call super::clicked;If Row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
End If

end event

type uo_1 from w_param`uo_1 within w_dossier
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_dossier
integer x = 2313
end type

type gb_filtre from w_param`gb_filtre within w_dossier
integer x = 2286
integer y = 2004
integer width = 622
end type

type dw_edition from datawindow within w_dossier
boolean visible = false
integer x = 329
integer y = 596
integer width = 411
integer height = 432
integer taborder = 21
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dossier_liste_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from uo_picturebutton_390x120 within w_dossier
integer x = 1426
integer y = 2020
integer width = 425
integer taborder = 31
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

type cb_1 from uo_picturebutton_390x120 within w_dossier
integer x = 1856
integer y = 2020
integer width = 425
integer taborder = 41
boolean bringtotop = true
string text = "&Recalculer"
string iconname = "ACTIONS_recalculer.png"
end type

event clicked;call super::clicked;open(w_patience)

// Mise à jour de DOSSIER
UPDATE dossier SET nombre = (SELECT Count(*) FROM patient WHERE Patient.type_dossier = dossier.code and code > 0)  ;
commit ;

close(w_patience)
dw_liste.retrieve() 

end event

