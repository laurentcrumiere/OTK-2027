$PBExportHeader$w_alerte_page_clinique_perso.srw
forward
global type w_alerte_page_clinique_perso from w_fenetre_arakis
end type
type pb_confirmer from uo_picturebutton_780x120 within w_alerte_page_clinique_perso
end type
type pb_annuler from uo_picturebutton_780x120 within w_alerte_page_clinique_perso
end type
type dw_1 from u_basedw within w_alerte_page_clinique_perso
end type
type st_1 from statictext within w_alerte_page_clinique_perso
end type
type st_2 from statictext within w_alerte_page_clinique_perso
end type
type st_3 from statictext within w_alerte_page_clinique_perso
end type
type st_4 from statictext within w_alerte_page_clinique_perso
end type
end forward

global type w_alerte_page_clinique_perso from w_fenetre_arakis
boolean visible = false
integer width = 3301
integer height = 1928
string title = "ALERTE"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_confirmer pb_confirmer
pb_annuler pb_annuler
dw_1 dw_1
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
end type
global w_alerte_page_clinique_perso w_alerte_page_clinique_perso

on w_alerte_page_clinique_perso.create
int iCurrent
call super::create
this.pb_confirmer=create pb_confirmer
this.pb_annuler=create pb_annuler
this.dw_1=create dw_1
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_confirmer
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
end on

on w_alerte_page_clinique_perso.destroy
call super::destroy
destroy(this.pb_confirmer)
destroy(this.pb_annuler)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;
long lig, tot
string v_racine
boolean erreur = false



centrer(this)

dw_1.settransobject(sqlca)

uo_infos_systeme  uo_infos
uo_infos = create uo_infos_systeme


// Récup des infos systemes utiles
string v_adresse_mac, v_adresse_ip

v_adresse_ip = uo_infos.of_get_my_ip()
v_adresse_mac = uo_infos.of_getmac(v_adresse_ip)

dw_1.retrieve(v_adresse_mac)

tot = dw_1.rowcount()

// s'il n'y a qu'une ligne ... no prob ...
if tot > 1 then
	
	// recherche d'un éventuel problème ...
	v_racine = trim(dw_1.getItemString(1,"page_clinique_commentaires_cliniques"))
	
	if len(v_racine) >= 19 then
		v_racine = upper(left(v_racine, 19))
	else
		// surtout pour le cas ABS
		v_racine = upper(left(v_racine, 17))
	end if
	
	for lig = 1 to tot
	
		if v_racine <> left(upper(trim(dw_1.getItemString(lig,"page_clinique_commentaires_cliniques"))) , len(v_racine)) then
			erreur = true
		end if
	next

	if not erreur then
		closeWithReturn (this, 1)
		//	this.visible = true
	else
		this.visible = true
	end if
	
else
	closeWithReturn (this, 1)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_alerte_page_clinique_perso
end type

type pb_confirmer from uo_picturebutton_780x120 within w_alerte_page_clinique_perso
integer x = 603
integer y = 1648
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Confirmer Ouverture"
end type

event clicked;call super::clicked;if MessageBox("ATTENTION","Si vous ouvrez tout de même la page, cela risque d'ENDOMMAGER IRREMEDIABLEMENT VOS DONNEES.~n~nConfirmez-vous malgré tout ?",Question!,Yesno!,2) = 1 then
	CloseWithReturn (parent, 1)
else
	CloseWithReturn (parent, -1)
end if
end event

type pb_annuler from uo_picturebutton_780x120 within w_alerte_page_clinique_perso
integer x = 1495
integer y = 1652
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler Ouverture"
end type

event clicked;call super::clicked;closeWithReturn (parent, -1)
end event

type dw_1 from u_basedw within w_alerte_page_clinique_perso
integer x = 46
integer y = 512
integer width = 3072
integer height = 1064
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_alerte_page_clinique_perso"
end type

type st_1 from statictext within w_alerte_page_clinique_perso
integer x = 73
integer y = 24
integer width = 2674
integer height = 100
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "Nous constatons un problème dans la configuration de vos Pages Cliniques"
end type

type st_2 from statictext within w_alerte_page_clinique_perso
integer x = 78
integer y = 144
integer width = 2674
integer height = 100
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "configurées en tant que raccourcis dans les Commentaires Cliniques."
end type

type st_3 from statictext within w_alerte_page_clinique_perso
integer x = 78
integer y = 260
integer width = 2935
integer height = 100
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "Elle ne sont pas identiques sur tous les postes : vous devez ABSOLUMENT corriger"
end type

type st_4 from statictext within w_alerte_page_clinique_perso
integer x = 78
integer y = 376
integer width = 3150
integer height = 100
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "ce paramétrage avant d~'ouvrir un dossier sinon vous risquez de PERDRE VOS DONNEES."
end type

