$PBExportHeader$uo_libelle_groupe_imagerie_2013.sru
forward
global type uo_libelle_groupe_imagerie_2013 from statictext
end type
end forward

global type uo_libelle_groupe_imagerie_2013 from statictext
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type
global uo_libelle_groupe_imagerie_2013 uo_libelle_groupe_imagerie_2013

type variables


long numero_groupe

uo_image premiere_image
end variables

on uo_libelle_groupe_imagerie_2013.create
end on

on uo_libelle_groupe_imagerie_2013.destroy
end on

event clicked;

premiere_image.selection_groupe(numero_groupe)
end event

event rbuttondown;if isvalid(premiere_image.w_fenetre_mere) then
	if premiere_image.w_fenetre_mere.compter_images_selectionnees() > 0 then


		openWithParm(w_saisie_date, string(premiere_image.date_image))
		
		// recupération de la date passée en string
		
		if message.StringParm <> "" then
			
			date v_nouvelle_date
			v_nouvelle_date = date(message.StringParm)
			
			premiere_image.maj_date_groupe(v_nouvelle_date)
			
		end if
	else
		 Messagebox("ATTENTION","Vous devez sélectionner des images pour modifier la date avec cette fonctionnalité.")
	end if
end if



end event

