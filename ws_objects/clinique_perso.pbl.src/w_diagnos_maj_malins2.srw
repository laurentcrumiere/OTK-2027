$PBExportHeader$w_diagnos_maj_malins2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_malins2 from window
end type
type cb_fermer from commandbutton within w_diagnos_maj_malins2
end type
type cb_suivant from commandbutton within w_diagnos_maj_malins2
end type
type cb_precedent from commandbutton within w_diagnos_maj_malins2
end type
type cb_annuler from commandbutton within w_diagnos_maj_malins2
end type
type cb_sauver from commandbutton within w_diagnos_maj_malins2
end type
type cb_imprimer from commandbutton within w_diagnos_maj_malins2
end type
type mle_pt_mandibule from multilineedit within w_diagnos_maj_malins2
end type
type mle_diagnostic from multilineedit within w_diagnos_maj_malins2
end type
type mle_pt_maxilaire from multilineedit within w_diagnos_maj_malins2
end type
type sle_autres from singlelineedit within w_diagnos_maj_malins2
end type
type sle_hyiene from singlelineedit within w_diagnos_maj_malins2
end type
type sle_resorp from singlelineedit within w_diagnos_maj_malins2
end type
type sle_decalcific from singlelineedit within w_diagnos_maj_malins2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_malins2
end type
type sle_4 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_16 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_15 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_37 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_25 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_26 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_27 from singlelineedit within w_diagnos_maj_malins2
end type
type st_17 from statictext within w_diagnos_maj_malins2
end type
type st_16 from statictext within w_diagnos_maj_malins2
end type
type st_15 from statictext within w_diagnos_maj_malins2
end type
type sle_3 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_2 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_1 from singlelineedit within w_diagnos_maj_malins2
end type
type st_14 from statictext within w_diagnos_maj_malins2
end type
type st_13 from statictext within w_diagnos_maj_malins2
end type
type st_12 from statictext within w_diagnos_maj_malins2
end type
type st_7 from statictext within w_diagnos_maj_malins2
end type
type st_6 from statictext within w_diagnos_maj_malins2
end type
type st_correspondant from statictext within w_diagnos_maj_malins2
end type
type st_4 from statictext within w_diagnos_maj_malins2
end type
type sle_remarques from singlelineedit within w_diagnos_maj_malins2
end type
type st_1 from statictext within w_diagnos_maj_malins2
end type
type st_5 from statictext within w_diagnos_maj_malins2
end type
type gb_1 from groupbox within w_diagnos_maj_malins2
end type
type sle_46 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_47 from singlelineedit within w_diagnos_maj_malins2
end type
type st_8 from statictext within w_diagnos_maj_malins2
end type
type sle_35 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_45 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_36 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_17 from singlelineedit within w_diagnos_maj_malins2
end type
type sle_dents from singlelineedit within w_diagnos_maj_malins2
end type
end forward

global type w_diagnos_maj_malins2 from window
integer x = 18
integer y = 168
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cb_fermer cb_fermer
cb_suivant cb_suivant
cb_precedent cb_precedent
cb_annuler cb_annuler
cb_sauver cb_sauver
cb_imprimer cb_imprimer
mle_pt_mandibule mle_pt_mandibule
mle_diagnostic mle_diagnostic
mle_pt_maxilaire mle_pt_maxilaire
sle_autres sle_autres
sle_hyiene sle_hyiene
sle_resorp sle_resorp
sle_decalcific sle_decalcific
sle_agenesie sle_agenesie
sle_4 sle_4
sle_16 sle_16
sle_15 sle_15
sle_37 sle_37
sle_25 sle_25
sle_26 sle_26
sle_27 sle_27
st_17 st_17
st_16 st_16
st_15 st_15
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_14 st_14
st_13 st_13
st_12 st_12
st_7 st_7
st_6 st_6
st_correspondant st_correspondant
st_4 st_4
sle_remarques sle_remarques
st_1 st_1
st_5 st_5
gb_1 gb_1
sle_46 sle_46
sle_47 sle_47
st_8 st_8
sle_35 sle_35
sle_45 sle_45
sle_36 sle_36
sle_17 sle_17
sle_dents sle_dents
end type
global w_diagnos_maj_malins2 w_diagnos_maj_malins2

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine init ()
public subroutine save ()
end prototypes

public subroutine init ();//pour afficher correspondant
string cc,nom_c,prenom_c

select code_correspondant INTO :cc FROM patient WHERE code = :var_code_local ;
select nom, prenom INTO :nom_c, :prenom_c FROM correspondants WHERE code = :cc ;
if isnull(nom_c) then
	nom_c = ""
end if
if isnull(prenom_c) then
	prenom_c = ""
end if
st_correspondant.text = nom_c + " " + prenom_c

//
f.lirepage(sle_remarques,page,1,30)

//
f.lirepage(sle_1,page,300,10)
f.lirepage(sle_2,page,310,10)
f.lirepage(sle_3,page,320,10)
f.lirepage(sle_4,page,330,10)
f.lirepage(sle_dents,page,340,32)
f.lirepage(sle_agenesie,page,375,32)
f.lirepage(sle_decalcific,page,410,32)
f.lirepage(sle_resorp,page,445,32)
f.lirepage(sle_hyiene,page,480,32)
f.lirepage(sle_autres,page,515,32)

//PLAN TRAITEMENT Maxillaire
f.lirepage(mle_pt_maxilaire,page,550,300)

//PLAN TRAITEMENT Mandibule
f.lirepage(mle_pt_mandibule,page,850,300)

//DIAGNOSTIC
f.lirepage(mle_diagnostic,page,1150,500)

//EXTRACTIONS
f.lirepage(sle_15,page,1650,3)
f.lirepage(sle_16,page,1655,3)
f.lirepage(sle_17,page,1660,3)
f.lirepage(sle_25,page,1665,3)
f.lirepage(sle_26,page,1670,3)
f.lirepage(sle_27,page,1675,3)
f.lirepage(sle_35,page,1680,3)
f.lirepage(sle_36,page,1685,3)
f.lirepage(sle_37,page,1690,3)
f.lirepage(sle_45,page,1695,3)
f.lirepage(sle_46,page,1700,3)
f.lirepage(sle_47,page,1705,3)		// 1710 carac au total pour page 2

modif = false
cb_fermer.setfocus()
end subroutine

public subroutine save ();//
f.ecrirepage(sle_remarques,page,1,30)

//
f.ecrirepage(sle_1,page,300,10)
f.ecrirepage(sle_2,page,310,10)
f.ecrirepage(sle_3,page,320,10)
f.ecrirepage(sle_4,page,330,10)
f.ecrirepage(sle_dents,page,340,32)
f.ecrirepage(sle_agenesie,page,375,32)
f.ecrirepage(sle_decalcific,page,410,32)
f.ecrirepage(sle_resorp,page,445,32)
f.ecrirepage(sle_hyiene,page,480,32)
f.ecrirepage(sle_autres,page,515,32)

//PLAN TRAITEMENT Maxillaire
f.ecrirepage(mle_pt_maxilaire,page,550,300)

//PLAN TRAITEMENT Mandibule
f.ecrirepage(mle_pt_mandibule,page,850,300)

//DIAGNOSTIC
f.ecrirepage(mle_diagnostic,page,1150,500)

//EXTRACTIONS
f.ecrirepage(sle_15,page,1650,3)
f.ecrirepage(sle_16,page,1655,3)
f.ecrirepage(sle_17,page,1660,3)
f.ecrirepage(sle_25,page,1665,3)
f.ecrirepage(sle_26,page,1670,3)
f.ecrirepage(sle_27,page,1675,3)
f.ecrirepage(sle_35,page,1680,3)
f.ecrirepage(sle_36,page,1685,3)
f.ecrirepage(sle_37,page,1690,3)
f.ecrirepage(sle_45,page,1695,3)
f.ecrirepage(sle_46,page,1700,3)
f.ecrirepage(sle_47,page,1705,3)		// 1710 carac au total pour page 2


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

on w_diagnos_maj_malins2.create
this.cb_fermer=create cb_fermer
this.cb_suivant=create cb_suivant
this.cb_precedent=create cb_precedent
this.cb_annuler=create cb_annuler
this.cb_sauver=create cb_sauver
this.cb_imprimer=create cb_imprimer
this.mle_pt_mandibule=create mle_pt_mandibule
this.mle_diagnostic=create mle_diagnostic
this.mle_pt_maxilaire=create mle_pt_maxilaire
this.sle_autres=create sle_autres
this.sle_hyiene=create sle_hyiene
this.sle_resorp=create sle_resorp
this.sle_decalcific=create sle_decalcific
this.sle_agenesie=create sle_agenesie
this.sle_4=create sle_4
this.sle_16=create sle_16
this.sle_15=create sle_15
this.sle_37=create sle_37
this.sle_25=create sle_25
this.sle_26=create sle_26
this.sle_27=create sle_27
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_7=create st_7
this.st_6=create st_6
this.st_correspondant=create st_correspondant
this.st_4=create st_4
this.sle_remarques=create sle_remarques
this.st_1=create st_1
this.st_5=create st_5
this.gb_1=create gb_1
this.sle_46=create sle_46
this.sle_47=create sle_47
this.st_8=create st_8
this.sle_35=create sle_35
this.sle_45=create sle_45
this.sle_36=create sle_36
this.sle_17=create sle_17
this.sle_dents=create sle_dents
this.Control[]={this.cb_fermer,&
this.cb_suivant,&
this.cb_precedent,&
this.cb_annuler,&
this.cb_sauver,&
this.cb_imprimer,&
this.mle_pt_mandibule,&
this.mle_diagnostic,&
this.mle_pt_maxilaire,&
this.sle_autres,&
this.sle_hyiene,&
this.sle_resorp,&
this.sle_decalcific,&
this.sle_agenesie,&
this.sle_4,&
this.sle_16,&
this.sle_15,&
this.sle_37,&
this.sle_25,&
this.sle_26,&
this.sle_27,&
this.st_17,&
this.st_16,&
this.st_15,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_7,&
this.st_6,&
this.st_correspondant,&
this.st_4,&
this.sle_remarques,&
this.st_1,&
this.st_5,&
this.gb_1,&
this.sle_46,&
this.sle_47,&
this.st_8,&
this.sle_35,&
this.sle_45,&
this.sle_36,&
this.sle_17,&
this.sle_dents}
end on

on w_diagnos_maj_malins2.destroy
destroy(this.cb_fermer)
destroy(this.cb_suivant)
destroy(this.cb_precedent)
destroy(this.cb_annuler)
destroy(this.cb_sauver)
destroy(this.cb_imprimer)
destroy(this.mle_pt_mandibule)
destroy(this.mle_diagnostic)
destroy(this.mle_pt_maxilaire)
destroy(this.sle_autres)
destroy(this.sle_hyiene)
destroy(this.sle_resorp)
destroy(this.sle_decalcific)
destroy(this.sle_agenesie)
destroy(this.sle_4)
destroy(this.sle_16)
destroy(this.sle_15)
destroy(this.sle_37)
destroy(this.sle_25)
destroy(this.sle_26)
destroy(this.sle_27)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_correspondant)
destroy(this.st_4)
destroy(this.sle_remarques)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.gb_1)
destroy(this.sle_46)
destroy(this.sle_47)
destroy(this.st_8)
destroy(this.sle_35)
destroy(this.sle_45)
destroy(this.sle_36)
destroy(this.sle_17)
destroy(this.sle_dents)
end on

event open;var_code_local = message.doubleparm

string vn,vp
double vnd
date vd
integer an, vmois

select nom, prenom, date_naissance, numero_dossier INTO :vn,:vp,:vd, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if
if isnull(vd) then
	vd = Today()
end if

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	vmois = month(today()) - month( vd ) +12
ELSE
	vmois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°2 : " + vn + " " + vp +" - N° dossier : "+string(vnd) + " - Age : " + string(an) + " ans " + string(vmois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

init()
mep_win_mdi(this,1)


end event

type cb_fermer from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 1704
integer width = 402
integer height = 112
integer taborder = 240
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_suivant from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 1536
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		If ui_v2020 then 
			OpenWithParm( w_diagnos_maj_malins3, var_code_local, "w_diagnos_maj_malins2", w_mdi_2020)
		else
			OpenSheetWithParm( w_diagnos_maj_malins3, var_code_local, "w_diagnos_maj_malins3", w_mdi, 0, Original!)
		end if
		Close(parent)
	end if
else
	If ui_v2020 then 
		OpenWithParm( w_diagnos_maj_malins3, var_code_local, "w_diagnos_maj_malins3", w_mdi_2020)
	else
		OpenSheetWithParm( w_diagnos_maj_malins3, var_code_local, "w_diagnos_maj_malins3", w_mdi, 0, Original!)
	end if
	close(parent)
end if


end event

type cb_precedent from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 1368
integer width = 402
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		If ui_v2020 then 
			OpenWithParm( w_diagnos_maj_malins1, var_code_local, "w_diagnos_maj_malins1", w_mdi_2020)
		else
			OpenSheetWithParm( w_diagnos_maj_malins1, var_code_local, "w_diagnos_maj_malins1", w_mdi, 0, Original!)
		end if
		Close(parent)
	end if
else
	If ui_v2020 then 
		OpenWithParm( w_diagnos_maj_malins1, var_code_local, "w_diagnos_maj_malins1", w_mdi_2020)
	else
		OpenSheetWithParm( w_diagnos_maj_malins1, var_code_local, "w_diagnos_maj_malins1", w_mdi, 0, Original!)
	end if
	close(parent)
end if


end event

type cb_annuler from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 1200
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_sauver from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 1032
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_imprimer from commandbutton within w_diagnos_maj_malins2
integer x = 3095
integer y = 864
integer width = 402
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)

end event

type mle_pt_mandibule from multilineedit within w_diagnos_maj_malins2
integer x = 1627
integer y = 1024
integer width = 1399
integer height = 328
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type mle_diagnostic from multilineedit within w_diagnos_maj_malins2
integer x = 55
integer y = 1468
integer width = 1399
integer height = 328
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type mle_pt_maxilaire from multilineedit within w_diagnos_maj_malins2
integer x = 55
integer y = 1024
integer width = 1399
integer height = 328
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type sle_autres from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 788
integer width = 1019
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_hyiene from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 692
integer width = 1019
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_resorp from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 596
integer width = 1019
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_decalcific from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 500
integer width = 1019
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_agenesie from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 404
integer width = 1019
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_4 from singlelineedit within w_diagnos_maj_malins2
integer x = 713
integer y = 596
integer width = 613
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_16 from singlelineedit within w_diagnos_maj_malins2
integer x = 1865
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_15 from singlelineedit within w_diagnos_maj_malins2
integer x = 2071
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_37 from singlelineedit within w_diagnos_maj_malins2
integer x = 2752
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_25 from singlelineedit within w_diagnos_maj_malins2
integer x = 2341
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_26 from singlelineedit within w_diagnos_maj_malins2
integer x = 2546
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_27 from singlelineedit within w_diagnos_maj_malins2
integer x = 2752
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type st_17 from statictext within w_diagnos_maj_malins2
integer x = 73
integer y = 960
integer width = 914
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLAN TRAITEMENT Maxillaire :"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_malins2
integer x = 55
integer y = 1404
integer width = 466
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DIAGNOSTIC :"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_malins2
integer x = 1627
integer y = 960
integer width = 928
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "PLAN TRAITEMENT Mandibule :"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_diagnos_maj_malins2
integer x = 87
integer y = 596
integer width = 613
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_2 from singlelineedit within w_diagnos_maj_malins2
integer x = 713
integer y = 500
integer width = 613
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_1 from singlelineedit within w_diagnos_maj_malins2
integer x = 87
integer y = 500
integer width = 613
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type st_14 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 796
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Autres"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 700
integer width = 265
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hygiène :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 604
integer width = 334
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résorption :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 508
integer width = 434
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Décalcification :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 412
integer width = 434
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Agénésie :"
boolean focusrectangle = false
end type

type st_correspondant from statictext within w_diagnos_maj_malins2
integer x = 562
integer y = 24
integer width = 1225
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_malins2
integer x = 73
integer y = 32
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correspondant :"
boolean focusrectangle = false
end type

type sle_remarques from singlelineedit within w_diagnos_maj_malins2
integer x = 562
integer y = 128
integer width = 1225
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type st_1 from statictext within w_diagnos_maj_malins2
integer x = 73
integer y = 136
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remarques :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_malins2
integer x = 1385
integer y = 316
integer width = 549
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dents manquantes :"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_diagnos_maj_malins2
integer x = 32
integer y = 244
integer width = 2994
integer height = 664
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type sle_46 from singlelineedit within w_diagnos_maj_malins2
integer x = 1865
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_47 from singlelineedit within w_diagnos_maj_malins2
integer x = 1659
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 260
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type st_8 from statictext within w_diagnos_maj_malins2
integer x = 2071
integer y = 1424
integer width = 512
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "EXTRACTIONS"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_35 from singlelineedit within w_diagnos_maj_malins2
integer x = 2341
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_45 from singlelineedit within w_diagnos_maj_malins2
integer x = 2071
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_36 from singlelineedit within w_diagnos_maj_malins2
integer x = 2546
integer y = 1664
integer width = 197
integer height = 84
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_17 from singlelineedit within w_diagnos_maj_malins2
integer x = 1659
integer y = 1540
integer width = 197
integer height = 84
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_dents from singlelineedit within w_diagnos_maj_malins2
integer x = 1943
integer y = 308
integer width = 1019
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 32
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

