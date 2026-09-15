$PBExportHeader$w_soins_reg_deplacer_reglement.srw
forward
global type w_soins_reg_deplacer_reglement from w_fenetre_arakis
end type
type cb_ok from uo_picturebutton_390x120 within w_soins_reg_deplacer_reglement
end type
type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_deplacer_reglement
end type
type dw_soins from datawindow within w_soins_reg_deplacer_reglement
end type
end forward

global type w_soins_reg_deplacer_reglement from w_fenetre_arakis
integer width = 4722
integer height = 2244
string title = "Déplacement d~'un règlement"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_ok cb_ok
cb_annuler cb_annuler
dw_soins dw_soins
end type
global w_soins_reg_deplacer_reglement w_soins_reg_deplacer_reglement

type variables

// fenetre appellante
w_soins_reg_maj w_soins_appelante
long lig_reg
end variables

on w_soins_reg_deplacer_reglement.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.dw_soins=create dw_soins
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_soins
end on

on w_soins_reg_deplacer_reglement.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.dw_soins)
end on

event open;call super::open;
w_soins_appelante = Message.PowerObjectParm

lig_reg = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.getrow()

// variables glogales existantes
v_cle_regl =  w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.getitemNumber(lig_reg, "cle")
v_code_regl =  w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.getitemNumber(lig_reg, "code") 
	

dw_soins.SetTransobject(sqlca)
dw_soins.SetFilter("cle <> " + string(v_cle_regl))
dw_soins.Filter()

colore_datawindow(dw_soins)

Messagebox("INFORMATION","Sur la fenêtre qui va suivre, veuillez cliquer sur le soin auquel vous souhaitez affecter le règlement, puis sur le bouton OK pour valider.")

dw_soins.retrieve(v_code_regl)

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_reg_deplacer_reglement
end type

type cb_ok from uo_picturebutton_390x120 within w_soins_reg_deplacer_reglement
integer x = 2258
integer y = 1964
integer width = 544
integer taborder = 10
boolean bringtotop = true
string text = "OK"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
double var_nouvelle_clef

var_nouvelle_clef = dw_soins.getItemNumber(dw_soins.getrow(), "cle")


if var_nouvelle_clef <> v_cle_regl then
	if Messagebox("ATTENTION !", "Vous allez déplacer le règlement vers cette ligne de soin.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then


		// récup des autres valeurs clefs du reglement
		date var_date, var_dateremise
		double var_montant
		string var_mode, var_commentaire
		
		
		var_date = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.GetItemDate(lig_reg, "date")
		var_dateremise = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.GetItemDate(lig_reg, "dateremise")
		var_mode = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.GetItemString(lig_reg, "mode")
		var_commentaire = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.GetItemString(lig_reg, "commentaire")
		var_montant = w_soins_appelante.tab_1.tabpage_reglements.dw_reglements.GetItemNumber(lig_reg, "montant")

		
		// Modification effective du règlement ...
		update paye set cle = :var_nouvelle_clef 
		where code = :v_code_regl and cle = :v_cle_regl and "date" = :var_date and "dateremise" = :var_dateremise 
		and "mode" = :var_mode and "commentaire" = :var_commentaire and montant = :var_montant ;
		
		if sqlca.sqlcode = 0 then
			commit ;
		else
			MessageBox("ATTENTION", "Erreur dans le déplacement de ce règlement !~n~nOpération Annulée !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if

		close(parent)
	end if
else
	if Messagebox("ATTENTION !", "Vous avez indiquer la même ligne de soins. Aucun changement ne sera réalisé.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		close(parent)
	end if
end if


end event

type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_deplacer_reglement
integer x = 1673
integer y = 1964
integer width = 544
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;Close( parent)
end event

type dw_soins from datawindow within w_soins_reg_deplacer_reglement
string tag = "centrer no resize brush"
integer x = 14
integer y = 44
integer width = 4658
integer height = 1868
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Lignes de soins"
string dataobject = "dw_soins"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

