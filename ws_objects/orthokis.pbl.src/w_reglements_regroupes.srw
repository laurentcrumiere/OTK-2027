$PBExportHeader$w_reglements_regroupes.srw
forward
global type w_reglements_regroupes from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_reglements_regroupes
end type
type dw_liste from datawindow within w_reglements_regroupes
end type
type st_1 from statictext within w_reglements_regroupes
end type
end forward

global type w_reglements_regroupes from w_fenetre_arakis
integer width = 4475
integer height = 1852
string title = "Règlements Groupés"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
dw_liste dw_liste
st_1 st_1
end type
global w_reglements_regroupes w_reglements_regroupes

type variables
str_reglement reglement_groupe
end variables

on w_reglements_regroupes.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_liste=create dw_liste
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.st_1
end on

on w_reglements_regroupes.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_liste)
destroy(this.st_1)
end on

event open;call super::open;// La fenêtre peux servir pour les règlements groupés ou simplement pour le détail des règlements d'une remise en banque


reglement_groupe = Message.PowerObjectParm

dw_liste.settransobject(sqlca)

dw_liste.retrieve(reglement_groupe.date, reglement_groupe.dateremise, reglement_groupe.commentaire, reglement_groupe.payeur, reglement_groupe.mode)

colore_datawindow(dw_liste)

if dw_liste.rowcount() > 1 then 
	this.title = string(dw_liste.rowcount()) + " Règlements Groupés"
else
	this.title = "1 Règlement"
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_reglements_regroupes
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_reglements_regroupes
integer x = 1966
integer y = 1528
integer width = 475
integer height = 180
integer taborder = 10
boolean bringtotop = true
end type

type dw_liste from datawindow within w_reglements_regroupes
string tag = "brush"
integer x = 37
integer y = 8
integer width = 4389
integer height = 1476
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_reglement_regroupe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)
End If

end event

event doubleclicked;//

// Ouvre le dossier dans les règlements ....
if dw_liste.rowcount() > 0 then
	
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.Setrow(row)

	param_win[1] = 'R'
	param_win[3] = 'M'

	w_soins_reg_maj win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	m_orthokis_2020.ouvrir_mdi(6)

	close(parent)
end if
end event

type st_1 from statictext within w_reglements_regroupes
integer x = 50
integer y = 1540
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Double clic pour ouvrir le dossier du patient"
boolean focusrectangle = false
end type

