$PBExportHeader$w_ia_bi.srw
forward
global type w_ia_bi from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_ia_bi
end type
type wb_1 from webbrowser within w_ia_bi
end type
type uo_1 from resize_fenetre within w_ia_bi
end type
end forward

global type w_ia_bi from w_fenetre_arakis
integer width = 2610
integer height = 1384
string title = "Demandez à Adent ..."
windowtype windowtype = popup!
boolean clientedge = true
boolean center = true
cb_fermer cb_fermer
wb_1 wb_1
uo_1 uo_1
end type
global w_ia_bi w_ia_bi

type prototypes

end prototypes

type variables

end variables

on w_ia_bi.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.wb_1=create wb_1
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.wb_1
this.Control[iCurrent+3]=this.uo_1
end on

on w_ia_bi.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.wb_1)
destroy(this.uo_1)
end on

event open;call super::open;uo_1.taille(this)

String ls_url
ls_url = "https://demonstrateur-bi-ia.magic-lemp.com/bi/?auth_token=c59be6ae162bbf30ae16c70e26676be37eb750b380865a36"

wb_1.Navigate(ls_url)
end event

event resize;call super::resize;//uo_1.retaille(this)

//wb_1.height = this.height - 100
//wb_1.width = this.width - 1000

//cb_fermer.x = this.width - 800

wb_1.height = this.height - 100
wb_1.width = this.width
end event

event close;call super::close;

// Mémorisation des coordonnées de la fenêtre en sortant
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"IA","w_ia_bi_height", string(this.height))



end event

type p_fond from w_fenetre_arakis`p_fond within w_ia_bi
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_ia_bi
integer x = 3630
integer y = 2108
integer width = 539
integer taborder = 10
boolean bringtotop = true
end type

event clicked;

fermer_fenetre(parent)
end event

type wb_1 from webbrowser within w_ia_bi
integer width = 2551
integer height = 1256
boolean bringtotop = true
end type

type uo_1 from resize_fenetre within w_ia_bi
boolean visible = false
integer x = 3671
integer y = 316
integer taborder = 10
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

