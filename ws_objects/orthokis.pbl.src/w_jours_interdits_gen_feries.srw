$PBExportHeader$w_jours_interdits_gen_feries.srw
forward
global type w_jours_interdits_gen_feries from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_jours_interdits_gen_feries
end type
type cb_jf2 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
end type
type cb_jf3 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
end type
type cb_jf1 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
end type
type rb_tous from radiobutton within w_jours_interdits_gen_feries
end type
type rb_un from radiobutton within w_jours_interdits_gen_feries
end type
type dw_prati from datawindow within w_jours_interdits_gen_feries
end type
type uo_1 from resize_fenetre within w_jours_interdits_gen_feries
end type
type st_commentaire from statictext within w_jours_interdits_gen_feries
end type
type sle_commentaire from singlelineedit within w_jours_interdits_gen_feries
end type
type st_couleur from statictext within w_jours_interdits_gen_feries
end type
type sle_couleur from singlelineedit within w_jours_interdits_gen_feries
end type
type gb_1 from groupbox within w_jours_interdits_gen_feries
end type
end forward

global type w_jours_interdits_gen_feries from w_fenetre_arakis
integer width = 2853
integer height = 1548
string title = "Génération de Jours Interdits - Jours Fériés"
cb_fermer cb_fermer
cb_jf2 cb_jf2
cb_jf3 cb_jf3
cb_jf1 cb_jf1
rb_tous rb_tous
rb_un rb_un
dw_prati dw_prati
uo_1 uo_1
st_commentaire st_commentaire
sle_commentaire sle_commentaire
st_couleur st_couleur
sle_couleur sle_couleur
gb_1 gb_1
end type
global w_jours_interdits_gen_feries w_jours_interdits_gen_feries

type variables
integer jf1,jf2,jf3


// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0


end variables

forward prototypes
public subroutine jf (integer annee)
end prototypes

public subroutine jf (integer annee);// Génération des jours interdits / jours fériés de l'année N

// praticiens
string prat_min,prat_max

// Compteurs pour savoir combien de jours ont été ajoutés
double nbj1,nbj2

// jour qu'on ajoute
datetime jdeb,jfin

// 8 Jours fériés sont fixes 
// => On les met en tableau pour les insérer ensuite

// 1ere zone : le jour
// 2eme zone : le mois
integer jf[8,2],nb_jours = 8,i

string v_commentaire
long v_couleur

v_commentaire = sle_commentaire.text
v_couleur = long(sle_couleur.text)
zerol(v_couleur)


// 1er Janvier 
jf[1,1] = 1
jf[1,2] = 1

// 1er Mai 
jf[2,1] = 1
jf[2,2] = 5

if France then
	// 8 Mai 
	jf[3,1] = 8
	jf[3,2] = 5
else
	jf[3,1] = 0
	jf[3,1] = 0
end if

if Belgique then
	// 21 Juillet
	jf[4,1] = 21
	jf[4,2] = 7
else
	if Luxembourg then
		// 23 Juin
		jf[4,1] = 23
		jf[4,2] = 6
	else
		// 14 Juillet
		jf[4,1] = 14
		jf[4,2] = 7
	end if
end if

// 15 Aout 
jf[5,1] = 15
jf[5,2] = 8

// 11 Novembre 
jf[6,1] = 11
jf[6,2] = 11

// 25 Décembre 
jf[7,1] = 25
jf[7,2] = 12

// 1 Novembre 
jf[8,1] = 1
jf[8,2] = 11


if rb_tous.checked then
	prat_min = '      '
	prat_max = 'ZZZZZZ'
else
	prat_min = dw_prati.gettext()
	prat_max = prat_min
end if


if MessageBox("ATTENTION !","Vous avez demandé la génération des jours interdits pour les jours fériés (à date fixe) de l'année "+string(annee)+".~n~nLes jours 'flottants' tels que Lundi de Paques ou Jeudi de l'Ascension ne sont pas générés.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
	
	open(w_patience)
	
	Select count(*) into :nbj1 from "jours_interdits" ;
	
	For i = 1 to nb_jours
		
		if jf[i,2] <> 0 then 
			jdeb = datetime(date(annee,jf[i,2],jf[i,1]))
			jfin = datetime(date(annee,jf[i,2],jf[i,1]),time('23:59:00'))
			
	
			INSERT INTO "jours_interdits" 
			("date_debut","date_fin","fauteuil_debut","fauteuil_fin","code_praticien","user_modif","date_modif", "commentaire", "Couleur")
			SELECT :jdeb, :jfin, 0, 99, code,:utilisateur_code, getdate(), :v_commentaire, :v_couleur FROM "prati"
			WHERE code between :prat_min and :prat_max and actif = 1 ;
			
	
			commit ;
		end if

	next

	
	Select count(*) into :nbj2 from "jours_interdits" ;
	
	if isnull(nbj1) then
		nbj1 = 0
	end if
	if isnull(nbj2) then
		nbj2 = 0
	end if
		
	close(w_patience)
	
	MessageBox("INFORMATION",string(nbj2 - nbj1) + " jours ont été ajoutés.")

end if









end subroutine

on w_jours_interdits_gen_feries.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_jf2=create cb_jf2
this.cb_jf3=create cb_jf3
this.cb_jf1=create cb_jf1
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.dw_prati=create dw_prati
this.uo_1=create uo_1
this.st_commentaire=create st_commentaire
this.sle_commentaire=create sle_commentaire
this.st_couleur=create st_couleur
this.sle_couleur=create sle_couleur
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_jf2
this.Control[iCurrent+3]=this.cb_jf3
this.Control[iCurrent+4]=this.cb_jf1
this.Control[iCurrent+5]=this.rb_tous
this.Control[iCurrent+6]=this.rb_un
this.Control[iCurrent+7]=this.dw_prati
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.st_commentaire
this.Control[iCurrent+10]=this.sle_commentaire
this.Control[iCurrent+11]=this.st_couleur
this.Control[iCurrent+12]=this.sle_couleur
this.Control[iCurrent+13]=this.gb_1
end on

on w_jours_interdits_gen_feries.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_jf2)
destroy(this.cb_jf3)
destroy(this.cb_jf1)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.dw_prati)
destroy(this.uo_1)
destroy(this.st_commentaire)
destroy(this.sle_commentaire)
destroy(this.st_couleur)
destroy(this.sle_couleur)
destroy(this.gb_1)
end on

event open;call super::open;st_commentaire.visible = true
sle_commentaire.visible = true
st_couleur.visible = true


// Années de travail

jf1 = year(today())
jf2 = jf1 + 1
jf3 = jf2 + 1


// Mise en place des boutons

cb_jf1.text = "Jours Fériés "+string(jf1)
cb_jf2.text = "Jours Fériés "+string(jf2)
cb_jf3.text = "Jours Fériés "+string(jf3)


uo_1.taille(this)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

end event

event resize;uo_1.retaille(this)

end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_jours_interdits_gen_feries
end type

type cb_fermer from uo_picturebutton_390x120 within w_jours_interdits_gen_feries
integer x = 2331
integer y = 1284
integer width = 471
integer taborder = 30
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;// réactialisaton de la liste des jours_interdits si elle est ouverte

if isvalid(w_jours_interdits) then
	// la fenêtre parente est encore là !!
	w_jours_interdits.dw_liste.retrieve()

end if


fermer_fenetre(parent)
end event

type cb_jf2 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
integer x = 795
integer y = 1284
integer taborder = 20
string text = "jf2"
string iconname = "ACTIONS_generer_jours_feries.png"
end type

event clicked;call super::clicked;jf(jf2)
end event

type cb_jf3 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
integer x = 1563
integer y = 1284
integer taborder = 20
string text = "jf3"
string iconname = "ACTIONS_generer_jours_feries.png"
end type

event clicked;call super::clicked;jf(jf3)
end event

type cb_jf1 from uo_picturebutton_780x120 within w_jours_interdits_gen_feries
integer x = 27
integer y = 1284
integer taborder = 20
string text = "jf1"
string iconname = "ACTIONS_generer_jours_feries.png"
end type

event clicked;call super::clicked;jf(jf1)
end event

type rb_tous from radiobutton within w_jours_interdits_gen_feries
event clicked pbm_bnclicked
integer x = 219
integer y = 112
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les praticiens"
boolean checked = true
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type rb_un from radiobutton within w_jours_interdits_gen_feries
event clicked pbm_bnclicked
integer x = 219
integer y = 208
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un praticien"
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type dw_prati from datawindow within w_jours_interdits_gen_feries
string tag = "position"
boolean visible = false
integer x = 992
integer y = 204
integer width = 859
integer height = 76
integer taborder = 20
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type uo_1 from resize_fenetre within w_jours_interdits_gen_feries
boolean visible = false
integer x = 1669
integer y = 444
integer taborder = 10
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_commentaire from statictext within w_jours_interdits_gen_feries
boolean visible = false
integer x = 105
integer y = 544
integer width = 443
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Commentaire :"
boolean focusrectangle = false
end type

type sle_commentaire from singlelineedit within w_jours_interdits_gen_feries
boolean visible = false
integer x = 558
integer y = 532
integer width = 2217
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Férié"
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;long couleur_choisie

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 


Timer(0.05)	// pour déclencher le repositionnement de la palette


//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie)  then
	// Clic droit dans le zone commentaire => couleur
	if couleur_choisie=couleur_jour_interdit then
		messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de fond des jours interdits.")
	else
		if couleur_choisie = couleur_rouge then 
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des rendez-vous saisis dans une periode interdite.")
		else
			sle_commentaire.textColor = couleur_choisie
			sle_couleur.text = string(couleur_choisie)
		end if
	end if
end if


end event

type st_couleur from statictext within w_jours_interdits_gen_feries
boolean visible = false
integer x = 544
integer y = 652
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Clic-Droit pour modifier la couleur d~'écriture"
boolean focusrectangle = false
end type

type sle_couleur from singlelineedit within w_jours_interdits_gen_feries
boolean visible = false
integer x = 178
integer y = 1052
integer width = 567
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_jours_interdits_gen_feries
integer x = 55
integer y = 32
integer width = 2121
integer height = 304
integer taborder = 11
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du praticien"
end type

