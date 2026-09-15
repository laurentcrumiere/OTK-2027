$PBExportHeader$uo_fenetre_modale.sru
forward
global type uo_fenetre_modale from userobject
end type
end forward

global type uo_fenetre_modale from userobject
integer width = 503
integer height = 864
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global uo_fenetre_modale uo_fenetre_modale

type variables
n_cst_powermodal inv_modal

end variables

forward prototypes
public subroutine wf_ouvrir_param_nombre (ref window v_fenetre, double v_param)
public subroutine wf_ouvrir_param_fenetre (ref window v_fenetre, readonly window v_fenetre_param)
public subroutine wf_ouvrir_param_string (ref window v_fenetre, string v_param)
public subroutine wf_ouvrir (ref window v_fenetre)
public subroutine wf_ouvrir_param_str_traca (ref window v_fenetre, str_traca v_param)
public subroutine wf_fermer_param_string (window v_fenetre, string v_param)
end prototypes

public subroutine wf_ouvrir_param_nombre (ref window v_fenetre, double v_param);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	openwithparm(v_fenetre , v_param )
else
	inv_modal.of_register(w_mdi_2020)
	inv_modal.OpenModal(v_fenetre , v_param, false )
end if


end subroutine

public subroutine wf_ouvrir_param_fenetre (ref window v_fenetre, readonly window v_fenetre_param);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	openwithparm(v_fenetre , v_fenetre_param )
else
	inv_modal.of_register(w_mdi_2020)
	inv_modal.OpenModal(v_fenetre , v_fenetre_param , false)
end if


end subroutine

public subroutine wf_ouvrir_param_string (ref window v_fenetre, string v_param);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	openwithparm(v_fenetre , v_param )
else
	inv_modal.of_register(w_mdi_2020)
	inv_modal.OpenModal(v_fenetre , v_param , false)
end if
end subroutine

public subroutine wf_ouvrir (ref window v_fenetre);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	open(v_fenetre )
else
	inv_modal.of_register(w_mdi_2020)
	inv_modal.OpenModal(v_fenetre, false)
end if

end subroutine

public subroutine wf_ouvrir_param_str_traca (ref window v_fenetre, str_traca v_param);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	openwithparm(v_fenetre , v_param )
else
	inv_modal.of_register(w_mdi_2020)
	inv_modal.OpenModal(v_fenetre , v_param , false)
end if


end subroutine

public subroutine wf_fermer_param_string (window v_fenetre, string v_param);if 	profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_effet_modal","N") = "O" then
	CloseWithReturn(v_fenetre , v_param )
else
	inv_modal.CloseModal( v_param )
end if


end subroutine

on uo_fenetre_modale.create
end on

on uo_fenetre_modale.destroy
end on

