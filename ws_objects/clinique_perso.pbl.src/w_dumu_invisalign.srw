$PBExportHeader$w_dumu_invisalign.srw
forward
global type w_dumu_invisalign from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_invisalign
end type
type st_target from statictext within w_dumu_invisalign
end type
type st_semaine from statictext within w_dumu_invisalign
end type
type st_mois from statictext within w_dumu_invisalign
end type
type st_3 from statictext within w_dumu_invisalign
end type
type st_libelle_mois from statictext within w_dumu_invisalign
end type
type st_libelle_annee from statictext within w_dumu_invisalign
end type
type st_annee from statictext within w_dumu_invisalign
end type
type uo_circle from u_cst_circleprogress within w_dumu_invisalign
end type
type dw_trimestres from datawindow within w_dumu_invisalign
end type
type dw_annee from datawindow within w_dumu_invisalign
end type
type gb_1 from groupbox within w_dumu_invisalign
end type
type gb_2 from groupbox within w_dumu_invisalign
end type
end forward

global type w_dumu_invisalign from w_fenetre_arakis
integer width = 4649
integer height = 2088
string title = "Placements Invisalign"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
st_target st_target
st_semaine st_semaine
st_mois st_mois
st_3 st_3
st_libelle_mois st_libelle_mois
st_libelle_annee st_libelle_annee
st_annee st_annee
uo_circle uo_circle
dw_trimestres dw_trimestres
dw_annee dw_annee
gb_1 gb_1
gb_2 gb_2
end type
global w_dumu_invisalign w_dumu_invisalign

type variables

long i_target = 80
string s_code_rdv = "22"
date d_date_du_jour
end variables

on w_dumu_invisalign.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_target=create st_target
this.st_semaine=create st_semaine
this.st_mois=create st_mois
this.st_3=create st_3
this.st_libelle_mois=create st_libelle_mois
this.st_libelle_annee=create st_libelle_annee
this.st_annee=create st_annee
this.uo_circle=create uo_circle
this.dw_trimestres=create dw_trimestres
this.dw_annee=create dw_annee
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_target
this.Control[iCurrent+3]=this.st_semaine
this.Control[iCurrent+4]=this.st_mois
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_libelle_mois
this.Control[iCurrent+7]=this.st_libelle_annee
this.Control[iCurrent+8]=this.st_annee
this.Control[iCurrent+9]=this.uo_circle
this.Control[iCurrent+10]=this.dw_trimestres
this.Control[iCurrent+11]=this.dw_annee
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_dumu_invisalign.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_target)
destroy(this.st_semaine)
destroy(this.st_mois)
destroy(this.st_3)
destroy(this.st_libelle_mois)
destroy(this.st_libelle_annee)
destroy(this.st_annee)
destroy(this.uo_circle)
destroy(this.dw_trimestres)
destroy(this.dw_annee)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;
// Paramètres
i_target = long(profilestring(dir_photos + inifile_photo,"dumu","target_invisalign","80"))
s_code_rdv =  profilestring(dir_photos + inifile_photo,"dumu","type_rdv_invisalign","22")

// Target
st_target.text = string(i_target) + " / mois"


// Semaine / mois / année
long l_cpt
date d_debut, d_fin

d_date_du_jour = today()

d_date_du_jour = relativedate(today(), -365)



// Lundi de la semaine courante
d_debut = relativedate(d_date_du_jour, 2 - daynumber(d_date_du_jour))
d_fin = relativedate(d_debut, 7)
select count(*) into :l_cpt from rdv , etat_rdv where rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and cast(rdv as date) between :d_debut and :d_fin and "rdv"."type" = :s_code_rdv ;
st_semaine.text = string(l_cpt)

// Mois
d_debut = date(year(d_date_du_jour), month(d_date_du_jour), 1)
d_fin = fin_mois(d_debut)
select count(*) into :l_cpt from rdv , etat_rdv where rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and cast(rdv as date) between :d_debut and :d_fin and "rdv"."type" = :s_code_rdv ;
st_mois.text = string(l_cpt)

if i_target > 0 then
	uo_circle.of_setprogress  ( (l_cpt / i_target ) * 100 )
end if

// Année
d_debut = date(year(d_date_du_jour), 1, 1)
d_fin = date(year(d_date_du_jour), 12, 31)
select count(*) into :l_cpt from rdv , etat_rdv where rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' and cast(rdv as date) between :d_debut and :d_fin and "rdv"."type" = :s_code_rdv ;
st_annee.text = string(l_cpt)


dw_trimestres.settransobject(SQLCA)
dw_trimestres.retrieve(year(d_date_du_jour), s_code_rdv)
dw_annee.settransobject(SQLCA)
dw_annee.retrieve(year(d_date_du_jour), s_code_rdv)


end event

type p_fond from w_fenetre_arakis`p_fond within w_dumu_invisalign
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_invisalign
integer x = 1861
integer y = 1796
integer width = 517
integer taborder = 10
boolean bringtotop = true
end type

type st_target from statictext within w_dumu_invisalign
integer x = 110
integer y = 160
integer width = 969
integer height = 180
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_semaine from statictext within w_dumu_invisalign
integer x = 1883
integer y = 212
integer width = 530
integer height = 152
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_mois from statictext within w_dumu_invisalign
integer x = 2715
integer y = 212
integer width = 530
integer height = 152
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dumu_invisalign
integer x = 1879
integer y = 148
integer width = 571
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Cette semaine"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_libelle_mois from statictext within w_dumu_invisalign
integer x = 2757
integer y = 148
integer width = 434
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Ce mois"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_libelle_annee from statictext within w_dumu_invisalign
integer x = 3470
integer y = 148
integer width = 530
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Cette Année"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_annee from statictext within w_dumu_invisalign
integer x = 3483
integer y = 212
integer width = 530
integer height = 152
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_circle from u_cst_circleprogress within w_dumu_invisalign
integer x = 1211
integer y = 104
integer width = 485
integer height = 356
integer taborder = 30
boolean bringtotop = true
long backcolor = 16777215
integer fontsize = 16
integer circlethickness = 4
end type

on uo_circle.destroy
call u_cst_circleprogress::destroy
end on

type dw_trimestres from datawindow within w_dumu_invisalign
integer x = 78
integer y = 528
integer width = 1842
integer height = 1248
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dumu_invisalign_graph_trimestre"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_annee from datawindow within w_dumu_invisalign
integer x = 1952
integer y = 528
integer width = 2560
integer height = 1248
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dumu_invisalign_graph_annee"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_dumu_invisalign
integer x = 1157
integer y = 24
integer width = 3355
integer height = 480
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Placements"
end type

type gb_2 from groupbox within w_dumu_invisalign
integer x = 69
integer y = 24
integer width = 1051
integer height = 480
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Target"
end type

