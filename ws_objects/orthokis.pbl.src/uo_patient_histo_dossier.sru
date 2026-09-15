$PBExportHeader$uo_patient_histo_dossier.sru
forward
global type uo_patient_histo_dossier from datawindow
end type
end forward

global type uo_patient_histo_dossier from datawindow
integer width = 1751
integer height = 1312
boolean titlebar = true
string title = "Historique des Changements de Type de Dossier"
string dataobject = "dw_patient_histo_dossier"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global uo_patient_histo_dossier uo_patient_histo_dossier

type variables


double var_code_local

end variables

on uo_patient_histo_dossier.create
end on

on uo_patient_histo_dossier.destroy
end on

event buttonclicked;string ls_object

ls_Object = String(dwo.name)

If ls_Object = "b_ajouter" Then
	this.insertrow(0)
	this.scrolltorow(this.rowcount())
	this.setitem(this.rowcount(),"histo_dossier_code",var_code_local)
	this.setitem(this.rowcount(),"histo_dossier_date_heure",datetime(today(),now()))
else
	If ls_Object = "b_enregistrer" Then
		this.update()
	else
		If ls_Object = "b_supprimer" Then
			if row > 0 then
				this.deleterow(this.getrow())
			end if
		else
			If ls_Object = "b_fermer" Then
				this.visible = false
			end if
		end if
	end if
end if



end event

