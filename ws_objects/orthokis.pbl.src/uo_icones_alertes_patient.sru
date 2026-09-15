$PBExportHeader$uo_icones_alertes_patient.sru
forward
global type uo_icones_alertes_patient from userobject
end type
type pb_historique from uo_raccourci_histo_editions within uo_icones_alertes_patient
end type
type uo_anniv from uo_anniversaire within uo_icones_alertes_patient
end type
type uo_alerte from uo_alertes within uo_icones_alertes_patient
end type
type uo_parente from uo_lien_parente within uo_icones_alertes_patient
end type
type uo_due from uo_somme_due within uo_icones_alertes_patient
end type
type uo_confid from uo_confidentiel_contre_indication within uo_icones_alertes_patient
end type
type gb_user from groupbox within uo_icones_alertes_patient
end type
end forward

global type uo_icones_alertes_patient from userobject
integer width = 1271
integer height = 260
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_historique pb_historique
uo_anniv uo_anniv
uo_alerte uo_alerte
uo_parente uo_parente
uo_due uo_due
uo_confid uo_confid
gb_user gb_user
end type
global uo_icones_alertes_patient uo_icones_alertes_patient

type variables


window fenetre_parent
end variables

forward prototypes
public subroutine maj (double v_code, window v_fenetre_mere, window v_fenetre_mdi_mere)
end prototypes

public subroutine maj (double v_code, window v_fenetre_mere, window v_fenetre_mdi_mere);
// actualise les affichage pour tous les icones

uo_parente.maj(v_code)
uo_parente.init_fenetre_mere(v_fenetre_mere)

uo_due.maj(v_code)

uo_alerte.maj(v_code)
uo_alerte.init_fenetre_mere(v_fenetre_mere)

uo_confid.maj(v_code)
uo_confid.init_fenetre_mere(v_fenetre_mere)

uo_anniv.maj(v_code)


// Raccourci historique
// On a besoin du nom patient pour la fenetre mere
string v_nom
select isnull(nom,'')+' '+isnull(prenom,'') into :v_nom from patient where code = :v_code ;
if mdi_patient then
	pb_historique.init(v_code, v_nom, v_fenetre_mdi_mere)
else
	// Le passage de w_mdi_patient est inutile .. uniquement pour compatibilité
	pb_historique.init(v_code, v_nom, w_mdi_patient)
end if


//// Controle de la visiblité ou pas
//if not uo_due.p_due.visible and not uo_due.p_due_tp.visible then
//	uo_due.visible = false
//else
//	uo_due.visible = true 
//end if

//uo_anniv.visible = uo_anniv.p_anni.visible

end subroutine

on uo_icones_alertes_patient.create
this.pb_historique=create pb_historique
this.uo_anniv=create uo_anniv
this.uo_alerte=create uo_alerte
this.uo_parente=create uo_parente
this.uo_due=create uo_due
this.uo_confid=create uo_confid
this.gb_user=create gb_user
this.Control[]={this.pb_historique,&
this.uo_anniv,&
this.uo_alerte,&
this.uo_parente,&
this.uo_due,&
this.uo_confid,&
this.gb_user}
end on

on uo_icones_alertes_patient.destroy
destroy(this.pb_historique)
destroy(this.uo_anniv)
destroy(this.uo_alerte)
destroy(this.uo_parente)
destroy(this.uo_due)
destroy(this.uo_confid)
destroy(this.gb_user)
end on

event constructor;


this.backcolor = couleur_fond_fenetre
gb_user.backcolor = couleur_fond_fenetre

end event

type pb_historique from uo_raccourci_histo_editions within uo_icones_alertes_patient
integer x = 1079
integer y = 72
integer width = 174
integer taborder = 20
boolean bringtotop = true
end type

event clicked;call super::clicked;// pour réactiver le bouton dans 5 secondes !!
//timer(5)
end event

event rbuttondown;call super::rbuttondown;// pour réactiver le bouton dans 5 secondes !!
//timer(5)
end event

type uo_anniv from uo_anniversaire within uo_icones_alertes_patient
integer x = 901
integer y = 72
integer width = 174
integer height = 160
integer taborder = 20
end type

on uo_anniv.destroy
call uo_anniversaire::destroy
end on

type uo_alerte from uo_alertes within uo_icones_alertes_patient
string tag = "no resize"
integer x = 18
integer y = 60
integer taborder = 10
boolean bringtotop = true
end type

on uo_alerte.destroy
call uo_alertes::destroy
end on

type uo_parente from uo_lien_parente within uo_icones_alertes_patient
string tag = "no resize"
integer x = 210
integer y = 60
integer width = 174
integer height = 160
integer taborder = 10
boolean bringtotop = true
end type

on uo_parente.destroy
call uo_lien_parente::destroy
end on

type uo_due from uo_somme_due within uo_icones_alertes_patient
event cick_gauche pbm_bnclicked
string tag = "no resize"
integer x = 389
integer y = 60
integer width = 183
integer taborder = 10
end type

on uo_due.destroy
call uo_somme_due::destroy
end on

type uo_confid from uo_confidentiel_contre_indication within uo_icones_alertes_patient
string tag = "no resize"
integer x = 581
integer y = 80
integer width = 302
integer height = 136
integer taborder = 10
end type

on uo_confid.destroy
call uo_confidentiel_contre_indication::destroy
end on

type gb_user from groupbox within uo_icones_alertes_patient
string tag = "no resize"
integer width = 1271
integer height = 248
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

