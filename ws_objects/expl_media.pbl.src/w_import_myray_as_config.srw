$PBExportHeader$w_import_myray_as_config.srw
forward
global type w_import_myray_as_config from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray_as_config
end type
type st_2 from statictext within w_import_myray_as_config
end type
type sle_exe_connect from singlelineedit within w_import_myray_as_config
end type
type pb_as_connect from picturebutton within w_import_myray_as_config
end type
type st_3 from statictext within w_import_myray_as_config
end type
type sle_cas from singlelineedit within w_import_myray_as_config
end type
type pb_cas from picturebutton within w_import_myray_as_config
end type
type st_1 from statictext within w_import_myray_as_config
end type
type sle_exe_model_builder from singlelineedit within w_import_myray_as_config
end type
type pb_model_builder from picturebutton within w_import_myray_as_config
end type
type st_4 from statictext within w_import_myray_as_config
end type
type sle_exe_treatment from singlelineedit within w_import_myray_as_config
end type
type pb_treatment from picturebutton within w_import_myray_as_config
end type
type st_5 from statictext within w_import_myray_as_config
end type
type sle_echanges from singlelineedit within w_import_myray_as_config
end type
type pb_1 from picturebutton within w_import_myray_as_config
end type
type gb_myray from groupbox within w_import_myray_as_config
end type
type gb_orthup from groupbox within w_import_myray_as_config
end type
end forward

global type w_import_myray_as_config from w_fenetre_arakis
integer width = 3159
integer height = 1420
string title = "Passerelle MyRay AS Connect / Dental Design"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
st_2 st_2
sle_exe_connect sle_exe_connect
pb_as_connect pb_as_connect
st_3 st_3
sle_cas sle_cas
pb_cas pb_cas
st_1 st_1
sle_exe_model_builder sle_exe_model_builder
pb_model_builder pb_model_builder
st_4 st_4
sle_exe_treatment sle_exe_treatment
pb_treatment pb_treatment
st_5 st_5
sle_echanges sle_echanges
pb_1 pb_1
gb_myray gb_myray
gb_orthup gb_orthup
end type
global w_import_myray_as_config w_import_myray_as_config

type variables


// AS connect
string s_path_connect, s_exe_connect
string s_path_cas 

// Orth'Up
string s_path_model_builder , s_exe_model_builder	, s_exe_treatment, s_path_treatment, s_echanges




end variables

on w_import_myray_as_config.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_2=create st_2
this.sle_exe_connect=create sle_exe_connect
this.pb_as_connect=create pb_as_connect
this.st_3=create st_3
this.sle_cas=create sle_cas
this.pb_cas=create pb_cas
this.st_1=create st_1
this.sle_exe_model_builder=create sle_exe_model_builder
this.pb_model_builder=create pb_model_builder
this.st_4=create st_4
this.sle_exe_treatment=create sle_exe_treatment
this.pb_treatment=create pb_treatment
this.st_5=create st_5
this.sle_echanges=create sle_echanges
this.pb_1=create pb_1
this.gb_myray=create gb_myray
this.gb_orthup=create gb_orthup
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_exe_connect
this.Control[iCurrent+4]=this.pb_as_connect
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.sle_cas
this.Control[iCurrent+7]=this.pb_cas
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.sle_exe_model_builder
this.Control[iCurrent+10]=this.pb_model_builder
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.sle_exe_treatment
this.Control[iCurrent+13]=this.pb_treatment
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.sle_echanges
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.gb_myray
this.Control[iCurrent+18]=this.gb_orthup
end on

on w_import_myray_as_config.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.sle_exe_connect)
destroy(this.pb_as_connect)
destroy(this.st_3)
destroy(this.sle_cas)
destroy(this.pb_cas)
destroy(this.st_1)
destroy(this.sle_exe_model_builder)
destroy(this.pb_model_builder)
destroy(this.st_4)
destroy(this.sle_exe_treatment)
destroy(this.pb_treatment)
destroy(this.st_5)
destroy(this.sle_echanges)
destroy(this.pb_1)
destroy(this.gb_myray)
destroy(this.gb_orthup)
end on

event open;call super::open;

// Récupération de l'exe à lancer
s_path_connect = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_exe", "C:\Program Files\Alliedstar\Connect\") 
s_exe_connect = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "exe", "connect.exe") 

sle_exe_connect.text =  s_path_connect + s_exe_connect 

s_path_cas = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_cas", "C:\Users\Public\Documents\Alliedstar\Connect\") 
sle_cas.text =  s_path_cas

// Orth'Up
s_exe_model_builder = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "exe_model_builder", "") 
s_path_model_builder = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_model_builder", "") 
sle_exe_model_builder.text = s_path_model_builder + s_exe_model_builder


s_exe_treatment = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "exe_treatment", "") 
s_path_treatment = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_treatment", "") 
sle_exe_treatment.text = s_path_treatment + s_exe_treatment


s_echanges = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_echanges", "\\serveur\power\Orthup\") 
sle_echanges.text =  s_echanges

end event

type p_fond from w_fenetre_arakis`p_fond within w_import_myray_as_config
integer x = 864
integer y = 316
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray_as_config
integer x = 1307
integer y = 1096
integer width = 512
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type st_2 from statictext within w_import_myray_as_config
integer x = 178
integer y = 156
integer width = 640
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Logiciel AS Connect :"
boolean focusrectangle = false
end type

type sle_exe_connect from singlelineedit within w_import_myray_as_config
integer x = 869
integer y = 140
integer width = 1957
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type pb_as_connect from picturebutton within w_import_myray_as_config
integer x = 2853
integer y = 120
integer width = 151
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;

if GetFileOpenName("Fichiers exécutables",s_path_connect, s_exe_connect,"EXE","Fichiers exécutables (*.exe),*.exe") = 1 then

	s_path_connect = gfx_extraire_path_fichier(s_path_connect)
 	sle_exe_connect.text = s_path_connect + s_exe_connect 
	// Mémoriation dans .ini pour next time
	
	Setprofilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_exe",  s_path_connect ) 
	Setprofilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "exe", s_exe_connect ) 

end if

end event

event rbuttondown;sle_exe_connect.enabled = true
end event

type st_3 from statictext within w_import_myray_as_config
integer x = 178
integer y = 296
integer width = 640
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Dossier des Cas :"
boolean focusrectangle = false
end type

type sle_cas from singlelineedit within w_import_myray_as_config
integer x = 869
integer y = 288
integer width = 1957
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type pb_cas from picturebutton within w_import_myray_as_config
integer x = 2857
integer y = 268
integer width = 151
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;

if GetFolder("Dossier des Cas",s_path_cas ) = 1 then

	s_path_cas = s_path_cas + win_delimiter
	sle_cas.text = s_path_cas
	// Mémoriation dans .ini pour next time
	Setprofilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_cas",  s_path_cas ) 
end if

end event

event rbuttondown;sle_cas.enabled = true
end event

type st_1 from statictext within w_import_myray_as_config
integer x = 160
integer y = 568
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Logiciel Model Builder :"
boolean focusrectangle = false
end type

type sle_exe_model_builder from singlelineedit within w_import_myray_as_config
integer x = 869
integer y = 556
integer width = 1957
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type pb_model_builder from picturebutton within w_import_myray_as_config
integer x = 2853
integer y = 536
integer width = 151
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;

if GetFileOpenName("Fichiers exécutables",s_path_model_builder, s_exe_model_builder,"EXE","Fichiers exécutables (*.exe),*.exe") = 1 then

	s_path_model_builder = gfx_extraire_path_fichier(s_path_model_builder)
 	sle_exe_model_builder.text = s_path_model_builder + s_exe_model_builder
	// Mémoriation dans .ini pour next time
	
	Setprofilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_model_builder",  s_path_model_builder ) 
	Setprofilestring(dir_ini+inifile_orthokis,"ORTHUP", "exe_model_builder", s_exe_model_builder ) 

end if




end event

event rbuttondown;sle_exe_model_builder.enabled = true
end event

type st_4 from statictext within w_import_myray_as_config
integer x = 160
integer y = 708
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Logiciel Treatment :"
boolean focusrectangle = false
end type

type sle_exe_treatment from singlelineedit within w_import_myray_as_config
integer x = 869
integer y = 700
integer width = 1957
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type pb_treatment from picturebutton within w_import_myray_as_config
integer x = 2853
integer y = 680
integer width = 151
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;if GetFileOpenName("Fichiers exécutables",s_path_treatment, s_exe_treatment,"EXE","Fichiers exécutables (*.exe),*.exe") = 1 then

	s_path_treatment = gfx_extraire_path_fichier(s_path_treatment)
 	sle_exe_treatment.text = s_path_treatment + s_exe_treatment
	
	// Mémoriation dans .ini pour next time
	
	Setprofilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_treatment",  s_path_treatment ) 
	Setprofilestring(dir_ini+inifile_orthokis,"ORTHUP", "exe_treatment", s_exe_treatment ) 

end if



end event

event rbuttondown;sle_exe_treatment.enabled = true
end event

type st_5 from statictext within w_import_myray_as_config
integer x = 160
integer y = 852
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Dossier de données :"
boolean focusrectangle = false
end type

type sle_echanges from singlelineedit within w_import_myray_as_config
integer x = 869
integer y = 844
integer width = 1957
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_import_myray_as_config
integer x = 2853
integer y = 824
integer width = 151
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;

if GetFolder("Dossier d'échanges",s_echanges ) = 1 then

	s_echanges = s_echanges + win_delimiter
	sle_echanges.text = s_echanges
	
	// Mémoriation dans .ini pour next time
	Setprofilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_echanges",  s_echanges ) 
end if

end event

event losefocus;sle_echanges.enabled = true
end event

type gb_myray from groupbox within w_import_myray_as_config
integer x = 91
integer y = 48
integer width = 2953
integer height = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "MyRay AS Connect"
end type

type gb_orthup from groupbox within w_import_myray_as_config
integer x = 91
integer y = 468
integer width = 2953
integer height = 544
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Dental Design"
end type

