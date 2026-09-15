$PBExportHeader$w_etat_rdv_message_borne.srw
forward
global type w_etat_rdv_message_borne from w_param_fiche
end type
type lb_champs from listbox_champs_emails within w_etat_rdv_message_borne
end type
type sle_copy from singlelineedit within w_etat_rdv_message_borne
end type
end forward

global type w_etat_rdv_message_borne from w_param_fiche
integer width = 3383
integer height = 1644
lb_champs lb_champs
sle_copy sle_copy
end type
global w_etat_rdv_message_borne w_etat_rdv_message_borne

on w_etat_rdv_message_borne.create
int iCurrent
call super::create
this.lb_champs=create lb_champs
this.sle_copy=create sle_copy
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_champs
this.Control[iCurrent+2]=this.sle_copy
end on

on w_etat_rdv_message_borne.destroy
call super::destroy
destroy(this.lb_champs)
destroy(this.sle_copy)
end on

event open;call super::open;
this.title = "Messages d'accueil pour : " + dw_fiche.getitemstring(1, "nom")
end event

type p_fond from w_param_fiche`p_fond within w_etat_rdv_message_borne
end type

type cb_fermer from w_param_fiche`cb_fermer within w_etat_rdv_message_borne
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_etat_rdv_message_borne
end type

type cb_annuler from w_param_fiche`cb_annuler within w_etat_rdv_message_borne
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_etat_rdv_message_borne
end type

type uo_1 from w_param_fiche`uo_1 within w_etat_rdv_message_borne
integer x = 210
end type

type dw_fiche from w_param_fiche`dw_fiche within w_etat_rdv_message_borne
integer y = 64
integer width = 3182
integer height = 1128
string dataobject = "dw_etat_rdv_message_borne"
end type

event dw_fiche::rbuttondown;call super::rbuttondown;//Declaration des variables locales
//--------------------------

long l

l = getcolumn()

Choose case getcolumn()
	case 1
		lb_champs.visible = true
		return 1
	case 2
		lb_champs.visible = true
		return 1
end choose


		

end event

type lb_champs from listbox_champs_emails within w_etat_rdv_message_borne
boolean visible = false
integer x = 2345
integer y = 204
integer height = 524
integer taborder = 50
boolean bringtotop = true
string item[] = {"{nom}","{prenom}","{titre}","{numero_dossier}","{numero_moulage}","{heure_rdv}","{retard}","","",""}
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;

dw_fiche.accepttext()

//string texte, texte_deja, texte_final, texte_selectionne

 sle_copy.text = lb_champs.item[index]
 sle_copy.selectText(1, len(sle_copy.text))
 sle_copy.copy()

dw_fiche.paste()



this.visible = false


end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type sle_copy from singlelineedit within w_etat_rdv_message_borne
boolean visible = false
integer x = 23
integer y = 1396
integer width = 745
integer height = 112
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

