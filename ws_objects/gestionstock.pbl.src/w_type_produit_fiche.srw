$PBExportHeader$w_type_produit_fiche.srw
forward
global type w_type_produit_fiche from w_param_fiche
end type
end forward

global type w_type_produit_fiche from w_param_fiche
integer width = 2647
integer height = 1448
string title = "Fiche Type Produit"
end type
global w_type_produit_fiche w_type_produit_fiche

type variables
str_twostring struct
end variables

on w_type_produit_fiche.create
int iCurrent
call super::create
end on

on w_type_produit_fiche.destroy
call super::destroy
end on

event open;call super::open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
struct = Message.PowerObjectParm	

uo_1.taille(this)
centrer(this)

dw_fiche.settransobject(SQLCA)

if struct.code = "      " then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	double max
		
  SELECT MAX(cast (code as float))  
    INTO :max  
    FROM "type_produit"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )   ;

	IF IsNull(max) THEN
		max = 1
	ELSE	
		max = max + 1
	END IF	
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
	dw_fiche.SetItem(dw_fiche.RowCount(),"code_categorie_produit",struct.message)
	dw_fiche.SetItem(dw_fiche.RowCount(),"actif",1)
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	dw_fiche.retrieve(struct.code)
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose

cb_imprimer.visible = false


end event

event close;call super::close;string code_categorie
if dw_fiche.rowcount() > 0 then
	code_categorie = dw_fiche.getitemstring(dw_fiche.Getrow(),"code_categorie_produit")
else
	code_categorie = struct.message
end if
closewithreturn(this,code_categorie)
end event

type p_fond from w_param_fiche`p_fond within w_type_produit_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_type_produit_fiche
integer x = 1742
integer y = 984
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_type_produit_fiche
integer x = 1335
integer y = 984
end type

type cb_annuler from w_param_fiche`cb_annuler within w_type_produit_fiche
integer x = 928
integer y = 984
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_type_produit_fiche
integer x = 521
integer y = 984
end type

type uo_1 from w_param_fiche`uo_1 within w_type_produit_fiche
integer x = 137
integer y = 72
end type

type dw_fiche from w_param_fiche`dw_fiche within w_type_produit_fiche
integer x = 466
integer y = 280
integer width = 1650
integer height = 444
string dataobject = "dw_type_produit_fiche"
end type

