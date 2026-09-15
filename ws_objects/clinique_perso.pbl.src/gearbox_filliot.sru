$PBExportHeader$gearbox_filliot.sru
forward
global type gearbox_filliot from gearbox
end type
end forward

global type gearbox_filliot from gearbox
end type
global gearbox_filliot gearbox_filliot

type variables
m_btdroit_gearbox_filliot		Menu_filliot
end variables

on gearbox_filliot.create
call super::create
end on

on gearbox_filliot.destroy
call super::destroy
end on

event mousedown;if button = 2 then	// Clic avec le bouton droit de la souris
	Menu_filliot = CREATE m_btdroit_gearbox_filliot
	Menu_filliot.m_editer_avec.text = "Ouvrir avec " + profilestring(dir_ini + &
							"Orthokis.ini", "photos", "nom_editer_avec01", "")
	Menu_filliot.GearPopMenu(w_mdi_2020.pointerx(), w_mdi_2020.pointery(), this)
	DESTROY Menu_filliot
end if
end event

type cbx_selection from gearbox`cbx_selection within gearbox_filliot
end type

type em_date_acquis from gearbox`em_date_acquis within gearbox_filliot
end type

type ole_image from gearbox`ole_image within gearbox_filliot
end type

