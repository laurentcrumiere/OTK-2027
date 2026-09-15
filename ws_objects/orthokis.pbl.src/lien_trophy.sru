$PBExportHeader$lien_trophy.sru
forward
global type lien_trophy from userobject
end type
type st_1 from statictext within lien_trophy
end type
type cb_ajouter from commandbutton within lien_trophy
end type
end forward

global type lien_trophy from userobject
integer width = 686
integer height = 200
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
cb_ajouter cb_ajouter
end type
global lien_trophy lien_trophy

type variables
private uo_lien_trophy		uo_trophy
w_patient_maj		win_parent
double var_code_local
end variables

on lien_trophy.create
this.st_1=create st_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_1,&
this.cb_ajouter}
end on

on lien_trophy.destroy
destroy(this.st_1)
destroy(this.cb_ajouter)
end on

event constructor;// allocation mem pour obj uo_lien_trophy
uo_trophy = create uo_lien_trophy
end event

event destructor;destroy uo_trophy

end event

type st_1 from statictext within lien_trophy
integer x = 5
integer y = 12
integer width = 663
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Lien Carestream"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_trophy
integer x = 5
integer y = 84
integer width = 663
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Module Radio"
end type

event clicked;// sauvegarde la fiche ad
if isvalid (win_parent) then
	win_parent.cb_enregister.TriggerEvent ( Clicked! )
	var_code_local = win_parent.var_code_local 
else
	// appel autre (com clinique) => var_code_local  mise à jour la bas
end if


if  serial = "87001" or serial = "87475" or serial = "87620" or serial = "87595"  or serial = "87612" or serial = "87004" or serial = "87701" or serial = "87346" or serial = "87674" or serial = "87330" &
or serial = "87531" or serial = "87105" or serial = "87265" or serial = "87256" or serial = "87259" or serial = "87591"  or serial = "87405" or serial = "87682"  or serial = "87319" or serial = "87621" &
or serial = "87266" or serial = "87585" or serial = "87165" or serial = "87132" or serial = "87215" or serial = "87292"  or serial = "87476" or serial = "87619"   &
or serial = "87239" or serial = "87655" or serial = "87641" or serial = "87166" or serial = "87643" or serial = "87548" or serial = "87687" or serial = "87140" or serial = "87058" &
or serial = "87639" or serial = "87401" or serial = "87328" or serial = "87467" or serial = "87374" or serial = "87227" or serial = "87273" or serial = "87407" or serial = "87736"  or serial = "87313" &
or serial = "87647" or serial = "87146" or serial = "87159" or serial = "87518" or serial = "87226" or serial = "87342" or serial = "87310" or serial = "87479" or serial = "87228" or serial = "87090" & 
or serial = "87142" or serial = "87606" or serial = "87254" or serial = "87354" or serial = "87096" or serial = "87403" or serial = "87115" or serial = "87543" or serial >= "87715" then
	// nouveau lien Kodak
	// lien CareStream
	uo_lien_radios lien_radios
	
	lien_radios = create uo_lien_radios
	
	if lien_radios.init(1) = 1 then
		lien_radios.prepa_fichier_ini_carestream("Creer")
		lien_radios.lancer_lien( var_code_local )
	end if
	
else
	// ancien lien
	// on continue ..
	uo_trophy.ouvrir_trophy( var_code_local )
end if

end event

