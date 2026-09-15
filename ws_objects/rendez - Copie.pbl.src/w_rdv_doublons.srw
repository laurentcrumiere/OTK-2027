$PBExportHeader$w_rdv_doublons.srw
forward
global type w_rdv_doublons from w_fenetre_arakis
end type
type dw_liste from datawindow within w_rdv_doublons
end type
type st_etat from statictext within w_rdv_doublons
end type
type cb_2 from uo_picturebutton_390x120 within w_rdv_doublons
end type
type cb_annuler from uo_picturebutton_390x120 within w_rdv_doublons
end type
end forward

global type w_rdv_doublons from w_fenetre_arakis
integer width = 3982
integer height = 1380
string title = "Vérification de rendez-vous en doublons"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_liste dw_liste
st_etat st_etat
cb_2 cb_2
cb_annuler cb_annuler
end type
global w_rdv_doublons w_rdv_doublons

type variables
// sera passé en paramètre
st_rdv2 st_rdv_a_verfier
end variables

on w_rdv_doublons.create
int iCurrent
call super::create
this.dw_liste=create dw_liste
this.st_etat=create st_etat
this.cb_2=create cb_2
this.cb_annuler=create cb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste
this.Control[iCurrent+2]=this.st_etat
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_annuler
end on

on w_rdv_doublons.destroy
call super::destroy
destroy(this.dw_liste)
destroy(this.st_etat)
destroy(this.cb_2)
destroy(this.cb_annuler)
end on

event open;call super::open;// Vérifie si besoin qu'un autre rdv n'a pas été saisie en double pour ce patient

// la fenetre renvoiec1 si pas de soucis de doublon, 0 sinon


// En paramètre le rdv à vérifier

// le code inter du rdv est passé en paramètre
st_rdv_a_verfier = message.PowerObjectParm

colore_datawindow(dw_liste)

boolean b_retour = true
integer i_cpt
double v_code_patient
date  d_min, d_max
datetime dt_rdv
double v_code_interne_rdv
string s_verification_doublons
integer i_verification_doublons_jours 

// recherche de l'option de verif ou pas
select top 1 isnull(rdv_verification_doublons, 'N'), isnull(rdv_verification_doublons_jours,0)
into :s_verification_doublons, :i_verification_doublons_jours from param ;

if s_verification_doublons = "O" then
	
	// On prend les infos en paramètre
	v_code_patient = st_rdv_a_verfier.code_patient
	dt_rdv = st_rdv_a_verfier.rdv
	if isnull(st_rdv_a_verfier.code_interne_rdv) then 
		v_code_interne_rdv = -1
	else
		// rdv qu'on modifie => on recherche
		v_code_interne_rdv= st_rdv_a_verfier.code_interne_rdv ;
	end if
	
	// intervalle de vérification
	d_min = relativedate(date(dt_rdv), - i_verification_doublons_jours )
	d_max = relativedate( date(dt_rdv), + i_verification_doublons_jours )
	
	dw_liste.settransobject(sqlca)
	dw_liste.retrieve(v_code_patient , v_code_interne_rdv, d_min, d_max)
	
	i_cpt = dw_liste.rowcount()
	
	if i_cpt >= 1 then
		// y a des doublons, on reste sur la fenetre
		if i_cpt = 1 then
			st_etat.text = "Le rendez-vous ci-dessous peut être en doublon par rapport à votre saisie :"
		else
			st_etat.text = "Les "+ string(i_cpt) +" rendez-vous ci-dessous peuvent être en doublon par rapport à votre saisie :"
		end if
	
	else
		closeWithReturn(this,1)
	end if
else
	closeWithReturn(this, 1)
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_doublons
end type

type dw_liste from datawindow within w_rdv_doublons
string tag = "centrer no resize brush"
integer x = 14
integer y = 160
integer width = 3895
integer height = 864
integer taborder = 10
string dragicon = "DRAG1PG.ICO"
boolean bringtotop = true
string title = "Rendez-Vous"
string dataobject = "dw_rdv_doublons"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_etat from statictext within w_rdv_doublons
integer x = 37
integer y = 12
integer width = 3904
integer height = 96
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 553648127
boolean focusrectangle = false
end type

type cb_2 from uo_picturebutton_390x120 within w_rdv_doublons
integer x = 1874
integer y = 1080
integer width = 672
integer taborder = 20
boolean bringtotop = true
string text = "Confirmer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;	closeWithReturn(parent, 1)
end event

type cb_annuler from uo_picturebutton_390x120 within w_rdv_doublons
integer x = 1129
integer y = 1080
integer width = 672
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closeWithReturn(parent, 0)
end event

