$PBExportHeader$w_dentapoche_personne_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_dentapoche_personne_fiche from w_param_fiche
end type
end forward

global type w_dentapoche_personne_fiche from w_param_fiche
integer width = 3360
integer height = 1912
string title = "Personne Dentapoche"
end type
global w_dentapoche_personne_fiche w_dentapoche_personne_fiche

type variables

double v_id_personne
end variables

on w_dentapoche_personne_fiche.create
int iCurrent
call super::create
end on

on w_dentapoche_personne_fiche.destroy
call super::destroy
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
v_id_personne = message.doubleparm

uo_1.taille(this)

dw_fiche.settransobject(SQLCA)
dw_fiche.retrieve(v_id_personne)

this.backcolor = couleur_fond_fenetre

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

end event

type p_fond from w_param_fiche`p_fond within w_dentapoche_personne_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_dentapoche_personne_fiche
integer x = 2171
integer y = 1528
end type

event cb_fermer::clicked;dw_fiche.accepttext()

if enregistrement_automatique then
	Close(parent)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la Table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		Close(parent)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_dentapoche_personne_fiche
integer x = 1637
integer y = 1528
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_dentapoche_personne_fiche
integer x = 1102
integer y = 1532
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_dentapoche_personne_fiche
boolean visible = false
integer x = 567
integer y = 1528
end type

type uo_1 from w_param_fiche`uo_1 within w_dentapoche_personne_fiche
integer x = 279
integer y = 804
end type

type dw_fiche from w_param_fiche`dw_fiche within w_dentapoche_personne_fiche
integer y = 16
integer width = 3072
integer height = 1416
string dataobject = "dw_dentapoche_personne_fiche"
end type

