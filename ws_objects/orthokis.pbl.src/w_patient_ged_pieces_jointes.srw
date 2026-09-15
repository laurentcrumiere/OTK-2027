$PBExportHeader$w_patient_ged_pieces_jointes.srw
forward
global type w_patient_ged_pieces_jointes from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_patient_ged_pieces_jointes
end type
type cb_visualiser from uo_picturebutton_390x120 within w_patient_ged_pieces_jointes
end type
type dw_liste from u_basedw within w_patient_ged_pieces_jointes
end type
end forward

global type w_patient_ged_pieces_jointes from w_fenetre_arakis
integer width = 5166
integer height = 1796
string title = "Pièces jointes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_visualiser cb_visualiser
dw_liste dw_liste
end type
global w_patient_ged_pieces_jointes w_patient_ged_pieces_jointes

type variables
double var_code_local
string var_code_interne_historique_editions
end variables

on w_patient_ged_pieces_jointes.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_visualiser=create cb_visualiser
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_visualiser
this.Control[iCurrent+3]=this.dw_liste
end on

on w_patient_ged_pieces_jointes.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_visualiser)
destroy(this.dw_liste)
end on

event open;call super::open;
// On se sert d'une structure patient pour passer en paramètres ... Pas très proposer mais cela évite de créer une autre structure
str_patient v_patient

v_patient = message.PowerObjectParm

var_code_local = v_patient.code 
var_code_interne_historique_editions = v_patient.nom 

dw_liste.settransobject(sqlca)
dw_liste.retrieve( var_code_local, var_code_interne_historique_editions , dir_ini + dir_fonds)

if dw_liste.rowcount() = 0 then
	
	Messagebox("ATTENTION", "Il n'y a aucune pièce jointe mémorisée pour ce mail !")
	
	close(this)
	
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_ged_pieces_jointes
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_patient_ged_pieces_jointes
integer x = 2542
integer y = 1436
integer width = 635
integer height = 164
integer taborder = 10
boolean bringtotop = true
end type

type cb_visualiser from uo_picturebutton_390x120 within w_patient_ged_pieces_jointes
integer x = 1829
integer y = 1436
integer width = 635
integer height = 164
integer taborder = 20
boolean bringtotop = true
string text = "Visualiser"
string iconname = "Preview1.png"
end type

event clicked;call super::clicked;
string v_chemin_complet_courrier

v_chemin_complet_courrier = dir_photos + string(var_code_local) + win_delimiter + dw_liste.getitemstring(dw_liste.getrow(), "nom_document")

if not fileExists(v_chemin_complet_courrier) then
	Messagebox("ATTENTION", "Impossible de localiser le fichier : " + v_chemin_complet_courrier )
else
	fxg_ouvrir_fichier_shell(v_chemin_complet_courrier)
end if
end event

type dw_liste from u_basedw within w_patient_ged_pieces_jointes
integer x = 73
integer y = 48
integer width = 5029
integer height = 1296
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_patient_ged_pieces_jointes"
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;
cb_visualiser.triggerevent(clicked!)
end event

