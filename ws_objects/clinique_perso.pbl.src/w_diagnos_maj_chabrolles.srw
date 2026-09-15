$PBExportHeader$w_diagnos_maj_chabrolles.srw
$PBExportComments$gearbox~r~nSert uniquement à appeler la page 1
forward
global type w_diagnos_maj_chabrolles from window
end type
type st_1 from statictext within w_diagnos_maj_chabrolles
end type
end forward

global type w_diagnos_maj_chabrolles from window
integer x = 5
integer y = 360
integer width = 3013
integer height = 544
boolean titlebar = true
string title = "Page Clinique"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 12632256
boolean clientedge = true
st_1 st_1
end type
global w_diagnos_maj_chabrolles w_diagnos_maj_chabrolles

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
end variables

forward prototypes
public subroutine init ()
public subroutine init_photos (double num)
public subroutine zoom_photo (string photo)
end prototypes

public subroutine init ();//string pt
//
//SELECT plan_traitement INTO :pt FROM patient WHERE code = :var_code_local ;
//
//
//modif = false
//
//mle_traitement_suite.text = RightTrim(mid(page,500,350))
//
//mle_plan_traitement.text = pt
//
end subroutine

public subroutine init_photos (double num);//if FileExists(dir_photos+string(num)+"\1.jpg") then
//	ole_photo1.object.image = dir_photos+string(num)+"\1.jpg"
//	ole_photo1.object.Display()
//	ole_photo1.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\2.jpg") then
//	ole_photo2.object.image = dir_photos+string(num)+"\2.jpg"
//	ole_photo2.object.Display()
//	ole_photo2.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\3.jpg") then
//	ole_photo3.object.image = dir_photos+string(num)+"\3.jpg"
//	ole_photo3.object.Display()
//	ole_photo3.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\4.jpg") then
//	ole_photo4.object.image = dir_photos+string(num)+"\4.jpg"
//	ole_photo4.object.Display()
//	ole_photo4.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\5.jpg") then
//	ole_photo5.object.image = dir_photos+string(num)+"\5.jpg"
//	ole_photo5.object.Display()
//	ole_photo5.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\6.jpg") then
//	ole_photo6.object.image = dir_photos+string(num)+"\6.jpg"
//	ole_photo6.object.Display()
//	ole_photo6.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\7.jpg") then
//	ole_photo7.object.image = dir_photos+string(num)+"\7.jpg"
//	ole_photo7.object.Display()
//	ole_photo7.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\8.jpg") then
//	ole_photo8.object.image = dir_photos+string(num)+"\8.jpg"
//	ole_photo8.object.Display()
//	ole_photo8.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\9.jpg") then
//	ole_photo9.object.image = dir_photos+string(num)+"\9.jpg"
//	ole_photo9.object.Display()
//	ole_photo9.object.FitTo(0)
//end if
//if FileExists(dir_photos+string(num)+"\10.jpg") then
//	ole_photo10.object.image = dir_photos+string(num)+"\10.jpg"
//	ole_photo10.object.Display()
//	ole_photo10.object.FitTo(0)
//end if
//
end subroutine

public subroutine zoom_photo (string photo);//if trim(photo) <> '' then
//	ole_plein.object.image = photo
//	ole_plein.object.Display()
//	ole_plein.object.FitTo(0)
//	ole_plein.visible = true
//else
//	son(5)
//end if
//
end subroutine

event open;var_code_local = var_code
OpenSheetWithParm(w_diagnos_maj_chabrolles1,var_code_local,w_mdi,1,Original!)
close(this)
end event

on w_diagnos_maj_chabrolles.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_diagnos_maj_chabrolles.destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_diagnos_maj_chabrolles
integer x = 667
integer y = 224
integer width = 1906
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "INVISIBLE ... UNIQUEMENT POUR L~'affichage de la fenêtre des photos"
boolean focusrectangle = false
end type

