$PBExportHeader$w_rdv_choix.srw
forward
global type w_rdv_choix from w_fenetre_arakis
end type
type dw_liste from datawindow within w_rdv_choix
end type
type cb_choisir from uo_picturebutton_390x120 within w_rdv_choix
end type
type cb_annuler from uo_picturebutton_390x120 within w_rdv_choix
end type
type cb_2 from uo_picturebutton_390x120 within w_rdv_choix
end type
end forward

global type w_rdv_choix from w_fenetre_arakis
integer width = 4037
integer height = 1808
string title = "Choix du Rendez-vous"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_liste dw_liste
cb_choisir cb_choisir
cb_annuler cb_annuler
cb_2 cb_2
end type
global w_rdv_choix w_rdv_choix

type variables
double db_code_interne_rdv, db_code_patient
end variables

on w_rdv_choix.create
int iCurrent
call super::create
this.dw_liste=create dw_liste
this.cb_choisir=create cb_choisir
this.cb_annuler=create cb_annuler
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste
this.Control[iCurrent+2]=this.cb_choisir
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_2
end on

on w_rdv_choix.destroy
call super::destroy
destroy(this.dw_liste)
destroy(this.cb_choisir)
destroy(this.cb_annuler)
destroy(this.cb_2)
end on

event open;call super::open;long l_lig
st_rdv2 str_rdv



// On passe en paramtre le rdv par détaut
// la fenêtre renvoie 
// - 0 si pas de changement
// - null si on ne veut pas de rdv
// - le code interne du rdv sélectioné

str_rdv = message.PowerObjectParm

db_code_interne_rdv = str_rdv.code_interne_rdv
db_code_patient = str_rdv.code_patient

dw_liste.settransobject(sqlca)
dw_liste.retrieve(db_code_patient)

if dw_liste.rowcount() = 0 then
	Messagebox("ATTENTION", "Ce patient n'a aucun rendez-vous !")
	str_rdv.code_interne_rdv = 0
	CloseWithReturn(this, str_rdv)
else
	if isnull(db_code_interne_rdv) then
		
		// Positionnement sur le 1er du jour
		l_lig = dw_liste.find( "date(rdv) = today()", 1, dw_liste.rowcount())
	else
		l_lig = dw_liste.find( "code_interne = " + string(db_code_interne_rdv) ,  1, dw_liste.rowcount())
		
	end if
		
	if l_lig <= 0 then
		l_lig = 1
	end if
	
	colore_datawindow(dw_liste )
	dw_liste.ScrollToRow(l_lig)
	dw_liste.SelectRow(l_lig,True)

end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_choix
end type

type dw_liste from datawindow within w_rdv_choix
string tag = "brush"
integer x = 46
integer y = 32
integer width = 3913
integer height = 1400
integer taborder = 10
string dragicon = "DRAG1PG.ICO"
boolean bringtotop = true
string title = "Rendez-Vous"
string dataobject = "dw_rdv_passes_futurs"
boolean vscrollbar = true
boolean livescroll = true
end type

event rowfocuschanged;//If currentrow > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(currentrow,True)
//	this.triggerevent(clicked!)
//End If
//
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If
end event

event doubleclicked;
cb_choisir.triggerevent(clicked!)
end event

type cb_choisir from uo_picturebutton_390x120 within w_rdv_choix
integer x = 2583
integer y = 1512
integer width = 933
integer taborder = 20
boolean bringtotop = true
string text = "Choisir le Rendez-vous"
boolean default = true
string tiptext = "Quitte la fenêtre en sélectionnant un rendez-vous"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
// on renvoie le code interne du rdv selectionnée
db_code_interne_rdv = dw_liste.getItemNumber(dw_liste.getRow(), "code_interne")
CloseWithReturn(parent, db_code_interne_rdv)
end event

type cb_annuler from uo_picturebutton_390x120 within w_rdv_choix
integer x = 389
integer y = 1512
integer width = 933
integer taborder = 30
boolean bringtotop = true
string text = "Annuler"
string tiptext = "Quitter la fenêtre sans action"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;// on renvoie une code de RDV à 0
db_code_interne_rdv = 0
CloseWithReturn(parent, db_code_interne_rdv)
end event

type cb_2 from uo_picturebutton_390x120 within w_rdv_choix
integer x = 1486
integer y = 1512
integer width = 933
integer taborder = 30
boolean bringtotop = true
string text = "Sortir sans Rendez-vous"
string tiptext = "Quitte la fenêtre en annulant une sélection de rendez-vous "
string iconname = "lc_interdit.png"
end type

event clicked;call super::clicked;// on renvoie une code de RDV null
setnull(db_code_interne_rdv)
CloseWithReturn(parent, db_code_interne_rdv)
end event

