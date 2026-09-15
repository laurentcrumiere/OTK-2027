$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type st_1 from statictext within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1618
integer height = 472
boolean enabled = false
boolean titlebar = true
string title = "Traitement en cours ..."
windowtype windowtype = popup!
long backcolor = 15780518
string pointer = "HourGlass!"
boolean center = true
st_1 st_1
end type
global w_patience w_patience

event open;// centrage de la fenêtre 
//centrer(this)


//string fichier_gif, fichier_jpg
//
//if profilestring(dir_ini+"orthokis.ini","COULEURS","desactiver_emoticones","N") = "O" then
//	fichier_jpg = "sablier.jpg"
//	if trace then trace ("w_patience - Open 2a")
//	p_sablier.PictureName = fichier_jpg
//	if trace then trace ("w_patience - Open 2b")
//	p_sablier.visible = true
//	if trace then trace ("w_patience - Open 2ca")
//	yield()
//	if trace then trace ("w_patience - Open 2d")
//else
//	// Gif animé aléatoire
//	fichier_gif = string(mod(second(now()) , 26))+".gif"
//	if trace then trace ("w_patience - Open 3a")
//	p_emoticones.PictureName = fichier_gif
//	if trace then trace ("w_patience - Open 3b")
//	p_emoticones.visible = true 
//	if trace then trace ("w_patience - Open 3c")
//	yield()
//	if trace then trace ("w_patience - Open 3d")
//	timer(0.5)
//	if trace then trace ("w_patience - Open 3e")
//end if
end event

on w_patience.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_patience.destroy
destroy(this.st_1)
end on

event close;// On s'en sert aussi sans w_mdi
//w_mdi.setmicrohelp("Prêt")

end event

event timer;

end event

type st_1 from statictext within w_patience
integer x = 32
integer y = 100
integer width = 1550
integer height = 180
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
long backcolor = 15780518
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

