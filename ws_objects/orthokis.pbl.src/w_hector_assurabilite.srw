$PBExportHeader$w_hector_assurabilite.srw
forward
global type w_hector_assurabilite from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_hector_assurabilite
end type
type mle_1 from multilineedit within w_hector_assurabilite
end type
type tv_1 from treeview within w_hector_assurabilite
end type
end forward

global type w_hector_assurabilite from w_fenetre_arakis
integer width = 3200
integer height = 2484
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
mle_1 mle_1
tv_1 tv_1
end type
global w_hector_assurabilite w_hector_assurabilite

event open;call super::open;constant string nom_fichier_recu = "wb.hec"

integer v_fichier
string v_contenu


double var_code_local
var_code_local = message.DoubleParm
string v_nom, v_prenom 

Select isnull(nom,''), isnull(prenom,'') into :v_nom, :v_prenom from patient where code = :var_code_local ;

title = "Assurabilité du patient : " + v_nom + " " + v_prenom

if FileExists(dir_ini + nom_fichier_recu) then
	
	v_fichier =  fileOpen(dir_ini + nom_fichier_recu, LineMode!, read!)
	
	FileRead(v_fichier, v_contenu)
	
	v_contenu = String_Non_Nulle(v_contenu)
	
	fileClose(v_fichier)
	
	if v_contenu <> "" then
		mle_1.text = v_contenu
		
		sailjson json
		integer handle
		
		json = create sailjson
		json.parse( mle_1.text)
		tv_1.deleteitem( 0)
		handle = tv_1.insertitemfirst(0, 'root', 2)
		json.buildtree( tv_1, handle, 2,3,1)
		//tv_1.expanditem( handle)
		
		tv_1.ExpandAll(handle)
		destroy json
		
		
	else
		Messagebox("ATTENTION","Aucune information reçue du Service Assurabilité !")
	end if
	
	
else
	
	Messagebox("ATTENTION","Impossible de lire les informations reçues du Service Assurabilité !")
end if


end event

on w_hector_assurabilite.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.mle_1=create mle_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.mle_1
this.Control[iCurrent+3]=this.tv_1
end on

on w_hector_assurabilite.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.tv_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_hector_assurabilite
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_hector_assurabilite
integer x = 1243
integer y = 2172
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean originalsize = false
end type

type mle_1 from multilineedit within w_hector_assurabilite
boolean visible = false
integer x = 37
integer y = 156
integer width = 1317
integer height = 1096
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tv_1 from treeview within w_hector_assurabilite
integer x = 27
integer y = 28
integer width = 3095
integer height = 2076
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean singleexpand = true
string picturename[] = {"ExecuteSQL5_2!","Compile_2!","lc_copy.png"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

