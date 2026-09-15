$PBExportHeader$gearbox_speciale_diag.sru
forward
global type gearbox_speciale_diag from gearbox
end type
end forward

global type gearbox_speciale_diag from gearbox
integer width = 786
integer height = 628
end type
global gearbox_speciale_diag gearbox_speciale_diag

type variables


gearbox cadre_1, cadre_2

end variables

forward prototypes
public subroutine cadre_1 ()
public subroutine cadre_2 ()
end prototypes

public subroutine cadre_1 ();
// Mets l'image courante dans le cadre 1
cadre_1.classname = this.classname
cadre_1.nom_cadre_explorateur_v12 = this.classname
cadre_1.var_num_dossier_v12 = this.var_num_dossier_v12
cadre_1.init_gearbox()

end subroutine

public subroutine cadre_2 ();
// Mets l'image courante dans le cadre 1
cadre_2.classname = this.classname
cadre_2.nom_cadre_explorateur_v12 = this.classname
cadre_2.var_num_dossier_v12 = this.var_num_dossier_v12
cadre_2.init_gearbox()

end subroutine

on gearbox_speciale_diag.create
call super::create
end on

on gearbox_speciale_diag.destroy
call super::destroy
end on

event clicked;

cadre_1()
end event

event mousedown;if type_cadre <> 0 then
	if button = 2 then
		cadre_2()
	end if
end if
end event

event mousemove;

//
end event

type mle_commentaire_image_html from gearbox`mle_commentaire_image_html within gearbox_speciale_diag
end type

type cbx_selection from gearbox`cbx_selection within gearbox_speciale_diag
end type

type em_date_acquis from gearbox`em_date_acquis within gearbox_speciale_diag
end type

type ole_image from gearbox`ole_image within gearbox_speciale_diag
end type

