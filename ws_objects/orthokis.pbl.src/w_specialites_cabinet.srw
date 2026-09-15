$PBExportHeader$w_specialites_cabinet.srw
$PBExportComments$Héritée de param
forward
global type w_specialites_cabinet from w_param
end type
type dw_edition from datawindow within w_specialites_cabinet
end type
type cb_imprimer from uo_picturebutton_390x120 within w_specialites_cabinet
end type
end forward

global type w_specialites_cabinet from w_param
string title = "Table des Spécialités Cabinet"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_specialites_cabinet w_specialites_cabinet

type variables
double max
end variables

on w_specialites_cabinet.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_specialites_cabinet.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;dw_edition.settransobject(SQLCA)
	
SELECT MAX(cast(code as float)) 
INTO :max
 FROM "specialites"  
WHERE ( "specialites"."code" not between 'a' AND 'z' ) AND  
		( "specialites"."code" not between 'A' AND 'Z' )    ;

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


end event

type p_fond from w_param`p_fond within w_specialites_cabinet
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_specialites_cabinet
boolean visible = true
integer y = 1112
end type

type cb_annuler from w_param`cb_annuler within w_specialites_cabinet
integer x = 1499
end type

type cb_enregistrer from w_param`cb_enregistrer within w_specialites_cabinet
integer x = 1911
integer weight = 700
end type

event cb_enregistrer::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;

	// On balaie la liste pour ajouter à la table des autorisations !!!
	
	integer lig, tot, cpt
	
	
	tot = dw_liste.rowcount()
	
	for lig = 1 to tot
		string v_code
		v_code = dw_liste.GetItemString(lig, "code")
	
		select count(*) into :cpt from code_soins_specialites where code_specialites = :v_code ;
		zeroi(cpt)
		
		if cpt = 0 then
	
			// C'est une nouvelle spécialité => Ajout des autorisation
			
			INSERT INTO code_soins_specialites (code_soins, code_specialites, autorise)
			(select code_soins.code , :v_code, 'O' from code_soins ) ;
			
			if sqlca.sqlcode <> 0 then
				Messagebox("ERREUR EN AJOUT D'AUTORISATION",sqlca.sqlerrtext)
			end if
			commit ;
		end if
	
	next	
	
	// si tout va bien on retrieve pour remetre l'ordre entre autre
	cb_annuler.TriggerEvent(Clicked!)
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_fermer from w_param`cb_fermer within w_specialites_cabinet
integer x = 2322
end type

type cb_supprimer from w_param`cb_supprimer within w_specialites_cabinet
end type

event cb_supprimer::clicked;

if dw_liste.rowcount() > 0 then
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'ORTHO' then
		Messagebox("ERREUR","Vous n'avez pas le droit de supprimer cette spécialité.")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_specialites_cabinet
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
	

IF IsNull(max) THEN
	max = 1
ELSE	
	max = max + 1
END IF	
dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))

dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_specialites_cabinet
integer x = 379
integer y = 40
integer width = 2117
integer height = 976
string dataobject = "dw_specialites_cabinet_liste"
end type

type uo_1 from w_param`uo_1 within w_specialites_cabinet
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_specialites_cabinet
end type

type gb_filtre from w_param`gb_filtre within w_specialites_cabinet
end type

type dw_edition from datawindow within w_specialites_cabinet
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_specialites_cabinet_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_specialites_cabinet
integer x = 882
integer y = 1264
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

