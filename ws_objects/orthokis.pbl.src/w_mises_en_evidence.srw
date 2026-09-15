$PBExportHeader$w_mises_en_evidence.srw
forward
global type w_mises_en_evidence from w_param
end type
end forward

global type w_mises_en_evidence from w_param
string title = "Table des Mises en Evidence"
end type
global w_mises_en_evidence w_mises_en_evidence

on w_mises_en_evidence.create
int iCurrent
call super::create
end on

on w_mises_en_evidence.destroy
call super::destroy
end on

type p_fond from w_param`p_fond within w_mises_en_evidence
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_mises_en_evidence
boolean visible = true
integer x = 841
integer y = 2008
end type

type cb_annuler from w_param`cb_annuler within w_mises_en_evidence
integer x = 2601
end type

type cb_enregistrer from w_param`cb_enregistrer within w_mises_en_evidence
integer x = 3003
end type

type cb_fermer from w_param`cb_fermer within w_mises_en_evidence
integer x = 3406
end type

type cb_supprimer from w_param`cb_supprimer within w_mises_en_evidence
integer x = 430
integer y = 2008
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	
	string v_code
	boolean v_suite = true
	
	v_code = dw_liste.GetItemString(dw_liste.getrow(), "code") 
	
	if France then
		if v_code = 'C' or v_code = 'M' then
			Messagebox("ATTENTION",'Les codes "C" pour C2S et "M" pour MGEN ne peuvent pas être supprimés~n~nVous pouvez éventuellement les désactiver.') 
			v_suite = false
		end if
	else
		if Belgique then
			if v_code = 'V'  then
				Messagebox("ATTENTION",'Le code "V" pour VIPO ne peut pas être supprimé.~n~nVous pouvez éventuellement le désactiver.') 
				v_suite = false
			else
				if v_code = 'B'  then
					Messagebox("ATTENTION",'Le code "B" pour BIM ne peut pas être supprimé.~n~nVous pouvez éventuellement le désactiver.') 
					v_suite = false
				end if
			end if
		end if
	end if
	
	if v_suite then
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_mises_en_evidence
integer x = 18
integer y = 2008
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_mises_en_evidence
integer x = 1047
integer y = 56
integer width = 2112
integer height = 1860
string dataobject = "dw_mises_en_evidence_liste"
end type

type uo_1 from w_param`uo_1 within w_mises_en_evidence
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_mises_en_evidence
end type

type gb_filtre from w_param`gb_filtre within w_mises_en_evidence
end type

