$PBExportHeader$w_historique_traitement_liste.srw
forward
global type w_historique_traitement_liste from w_fenetre_arakis
end type
type cb_supprimer from uo_picturebutton_390x120 within w_historique_traitement_liste
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_historique_traitement_liste
end type
type cb_voir from uo_picturebutton_390x120 within w_historique_traitement_liste
end type
type dw_1 from datawindow within w_historique_traitement_liste
end type
type cb_annuler from uo_picturebutton_390x120 within w_historique_traitement_liste
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_historique_traitement_liste
end type
end forward

global type w_historique_traitement_liste from w_fenetre_arakis
integer width = 2729
integer height = 1468
windowtype windowtype = response!
long backcolor = 15780518
cb_supprimer cb_supprimer
pb_2 pb_2
cb_voir cb_voir
dw_1 dw_1
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
end type
global w_historique_traitement_liste w_historique_traitement_liste

type variables
double var_code_local

end variables

on w_historique_traitement_liste.create
int iCurrent
call super::create
this.cb_supprimer=create cb_supprimer
this.pb_2=create pb_2
this.cb_voir=create cb_voir
this.dw_1=create dw_1
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_supprimer
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.cb_voir
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_enregistrer
end on

on w_historique_traitement_liste.destroy
call super::destroy
destroy(this.cb_supprimer)
destroy(this.pb_2)
destroy(this.cb_voir)
destroy(this.dw_1)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
end on

event open;call super::open;
centrer(this)


//Declarations des variables locales
//---------------------------------------

//Recup du code patient
//--------------------------
var_code_local=message.doubleparm

//Connexion des DW
//------------------------
dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)

//Titre de la fenetre
//---------------------
This.title='Patient : ' + var_nom + ' (' + string(var_code_local)+')'

if dw_1.rowcount() <= 0 then
	cb_voir.enabled ( FALSE )
end if


colore_datawindow(dw_1)
end event

type p_fond from w_fenetre_arakis`p_fond within w_historique_traitement_liste
end type

type cb_supprimer from uo_picturebutton_390x120 within w_historique_traitement_liste
integer x = 18
integer y = 1172
integer width = 530
integer height = 152
integer taborder = 30
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_1.getrow() >0 then
	if messagebox("Attention", "Etes-vous sûr de vouloir supprimer cette archive ?",Question!,YesNo!)=1 then
		dw_1.deleterow(dw_1.getrow())
	end if
end if


end event

type pb_2 from uo_picturebutton_390x120_fermer within w_historique_traitement_liste
integer x = 2139
integer y = 1172
integer width = 530
integer height = 152
integer taborder = 40
end type

type cb_voir from uo_picturebutton_390x120 within w_historique_traitement_liste
integer x = 549
integer y = 1172
integer width = 530
integer height = 152
integer taborder = 30
string text = "&Voir"
string iconname = "Add Watch_2!"
end type

event clicked;call super::clicked;
if dw_1.rowcount() > 0 then
	date_historique=dw_1.getitemdate(dw_1.getrow(),"date_sauvegarde")

	openwithparm(w_historique_traitement,var_code_local)
end if
end event

type dw_1 from datawindow within w_historique_traitement_liste
string tag = "brush"
integer x = 41
integer y = 28
integer width = 2606
integer height = 1088
integer taborder = 10
string title = "none"
string dataobject = "dw_historique_traitement_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;db_erreur(dw_1,sqldbcode,sqlerrtext)
return 1
end event

event doubleclicked;
cb_voir.triggerevent(clicked!)
end event

type cb_annuler from uo_picturebutton_390x120 within w_historique_traitement_liste
integer x = 1079
integer y = 1172
integer width = 530
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_1.retrieve(var_code_local)

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_historique_traitement_liste
integer x = 1609
integer y = 1172
integer width = 530
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_1.accepttext()
if dw_1.update() = 1 then 
	commit ;
end if
end event

