$PBExportHeader$w_historique_retours_noemie.srw
forward
global type w_historique_retours_noemie from window
end type
type st_2 from statictext within w_historique_retours_noemie
end type
type cb_2 from uo_picturebutton_390x120 within w_historique_retours_noemie
end type
type lb_fichiers from listbox within w_historique_retours_noemie
end type
type dw_prati from datawindow within w_historique_retours_noemie
end type
type st_1 from statictext within w_historique_retours_noemie
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_historique_retours_noemie
end type
end forward

global type w_historique_retours_noemie from window
integer width = 2441
integer height = 1956
boolean titlebar = true
string title = "Historique des Retours Noemie"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
cb_2 cb_2
lb_fichiers lb_fichiers
dw_prati dw_prati
st_1 st_1
cb_1 cb_1
end type
global w_historique_retours_noemie w_historique_retours_noemie

type variables
string s_dir_retours
end variables

on w_historique_retours_noemie.create
this.st_2=create st_2
this.cb_2=create cb_2
this.lb_fichiers=create lb_fichiers
this.dw_prati=create dw_prati
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.st_2,&
this.cb_2,&
this.lb_fichiers,&
this.dw_prati,&
this.st_1,&
this.cb_1}
end on

on w_historique_retours_noemie.destroy
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.lb_fichiers)
destroy(this.dw_prati)
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;
s_dir_retours = dir_photos +  "Retours_Noemie\"

dw_prati.settransobject(sqlca)
dw_prati.retrieve()


// Praticien par defaut
string s_code_praticien
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )


this.backcolor = couleur_fond_fenetre
end event

type st_2 from statictext within w_historique_retours_noemie
integer y = 172
integer width = 2377
integer height = 172
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Double-cliquez sur le fichier pour l~'ouvrir (vous devez disposer, sur ce poste, d~'un logiciel capable de lire les documets au format PDF)"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from uo_picturebutton_390x120 within w_historique_retours_noemie
integer x = 1609
integer y = 20
integer width = 686
integer taborder = 20
string text = "Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;
string v_code_praticien

v_code_praticien  = dw_prati.gettext()
			
lb_fichiers.dirlist(s_dir_retours + v_code_praticien + "*.pdf", 32)


end event

type lb_fichiers from listbox within w_historique_retours_noemie
integer x = 517
integer y = 352
integer width = 1239
integer height = 1268
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string s_fichier_a_ouvrir

s_fichier_a_ouvrir = s_dir_retours + SelectedItem()

fxg_ouvrir_fichier_shell( s_fichier_a_ouvrir  )
end event

type dw_prati from datawindow within w_historique_retours_noemie
string tag = "position brush"
integer x = 645
integer y = 56
integer width = 859
integer height = 72
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_1 from statictext within w_historique_retours_noemie
integer x = 82
integer y = 48
integer width = 539
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du praticien : "
boolean focusrectangle = false
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_historique_retours_noemie
integer x = 891
integer y = 1680
integer width = 549
integer taborder = 10
end type

