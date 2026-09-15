$PBExportHeader$w_commande_duplication.srw
forward
global type w_commande_duplication from w_fenetre_arakis
end type
type pb_2 from uo_picturebutton_390x120 within w_commande_duplication
end type
type st_1 from statictext within w_commande_duplication
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_commande_duplication
end type
type em_numero from editmask within w_commande_duplication
end type
end forward

global type w_commande_duplication from w_fenetre_arakis
integer width = 1778
integer height = 548
string title = "Duplication de commande"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_2 pb_2
st_1 st_1
cb_dupliquer cb_dupliquer
em_numero em_numero
end type
global w_commande_duplication w_commande_duplication

on w_commande_duplication.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.st_1=create st_1
this.cb_dupliquer=create cb_dupliquer
this.em_numero=create em_numero
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_dupliquer
this.Control[iCurrent+4]=this.em_numero
end on

on w_commande_duplication.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.cb_dupliquer)
destroy(this.em_numero)
end on

event open;call super::open;
centrer(this)


// recherche du N° maxi
double max_numero

select max(numero_commande) into :max_numero from commande ;

if isnull(max_numero) then
	// En principe impossible mais !!
	max_numero = 1
else
	max_numero = max_numero + 1
end if

em_numero.text = string(max_numero)



end event

type p_fond from w_fenetre_arakis`p_fond within w_commande_duplication
integer x = 1371
integer y = 536
integer height = 40
end type

type pb_2 from uo_picturebutton_390x120 within w_commande_duplication
integer x = 411
integer y = 216
integer width = 466
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn(Parent, -1)
end event

type st_1 from statictext within w_commande_duplication
integer x = 105
integer y = 56
integer width = 878
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nouveau N° de Commande"
boolean focusrectangle = false
end type

type cb_dupliquer from uo_picturebutton_390x120 within w_commande_duplication
integer x = 905
integer y = 216
integer width = 466
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

double v_numero
long v_nb

v_numero = double(em_numero.text)

if v_numero > 0 then
	
	// Y a t il déjà une commande à ce numro
	v_nb = 0
	select count(*) into :v_nb from commande where numero_commande = :v_numero ;
	
	if v_nb > 0 then 
		MessageBox("ATTENTION !","Il existe déjà une commande portant ce numéro !")
	else
		CloseWithReturn(parent, v_numero)
	end if
else
	MessageBox("ATTENTION !","Vous devez indiquer un N° de Commande positif !")
end if
end event

type em_numero from editmask within w_commande_duplication
integer x = 997
integer y = 36
integer width = 402
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
double increment = 1
string minmax = "1~~999999999"
end type

