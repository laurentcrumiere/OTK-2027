$PBExportHeader$w_nb_fiches.srw
forward
global type w_nb_fiches from w_fenetre_arakis
end type
type uo_1 from resize_fenetre within w_nb_fiches
end type
type sle_soins_prevus from singlelineedit within w_nb_fiches
end type
type st_15 from statictext within w_nb_fiches
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_nb_fiches
end type
type sle_histo_dossier from singlelineedit within w_nb_fiches
end type
type st_14 from statictext within w_nb_fiches
end type
type st_22 from statictext within w_nb_fiches
end type
type sle_com_admini from singlelineedit within w_nb_fiches
end type
type sle_codep from singlelineedit within w_nb_fiches
end type
type st_13 from statictext within w_nb_fiches
end type
type sle_histo from singlelineedit within w_nb_fiches
end type
type sle_rdv from singlelineedit within w_nb_fiches
end type
type st_12 from statictext within w_nb_fiches
end type
type st_11 from statictext within w_nb_fiches
end type
type sle_paye from singlelineedit within w_nb_fiches
end type
type sle_soins from singlelineedit within w_nb_fiches
end type
type st_10 from statictext within w_nb_fiches
end type
type st_9 from statictext within w_nb_fiches
end type
type st_8 from statictext within w_nb_fiches
end type
type st_7 from statictext within w_nb_fiches
end type
type sle_cor from singlelineedit within w_nb_fiches
end type
type sle_pra from singlelineedit within w_nb_fiches
end type
type st_6 from statictext within w_nb_fiches
end type
type sle_dos from singlelineedit within w_nb_fiches
end type
type sle_cai from singlelineedit within w_nb_fiches
end type
type st_5 from statictext within w_nb_fiches
end type
type st_4 from statictext within w_nb_fiches
end type
type sle_mut from singlelineedit within w_nb_fiches
end type
type st_3 from statictext within w_nb_fiches
end type
type st_2 from statictext within w_nb_fiches
end type
type sle_adr from singlelineedit within w_nb_fiches
end type
type sle_com from singlelineedit within w_nb_fiches
end type
type sle_pat from singlelineedit within w_nb_fiches
end type
type st_1 from statictext within w_nb_fiches
end type
type st_16 from statictext within w_nb_fiches
end type
type sle_images from singlelineedit within w_nb_fiches
end type
end forward

global type w_nb_fiches from w_fenetre_arakis
integer x = 722
integer y = 88
integer width = 1723
integer height = 2316
string title = "Fiches dans la base de données"
windowtype windowtype = response!
long backcolor = 15780518
uo_1 uo_1
sle_soins_prevus sle_soins_prevus
st_15 st_15
pb_1 pb_1
sle_histo_dossier sle_histo_dossier
st_14 st_14
st_22 st_22
sle_com_admini sle_com_admini
sle_codep sle_codep
st_13 st_13
sle_histo sle_histo
sle_rdv sle_rdv
st_12 st_12
st_11 st_11
sle_paye sle_paye
sle_soins sle_soins
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
sle_cor sle_cor
sle_pra sle_pra
st_6 st_6
sle_dos sle_dos
sle_cai sle_cai
st_5 st_5
st_4 st_4
sle_mut sle_mut
st_3 st_3
st_2 st_2
sle_adr sle_adr
sle_com sle_com
sle_pat sle_pat
st_1 st_1
st_16 st_16
sle_images sle_images
end type
global w_nb_fiches w_nb_fiches

event open;call super::open;
uo_1.taille(this)

double nb_pat,nb_com_admini,nb_com,nb_cor,nb_mut,nb_adr,nb_cai,nb_dos
double nb_pra,nb_paye,nb_soins,nb_rdv,nb_histo,nb_codep,nb_histo_dossier, nb_soins_prevus
double nb_images_infos


centrer(this)

Open(w_patience)

SELECT COUNT(*) INTO :nb_pat FROM patient ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_com FROM coment ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_com_admini FROM coment_admini ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_cor FROM correspondants ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_mut FROM mutuelle ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_cai FROM caisse ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_adr FROM adresses ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_dos FROM dossier ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_pra FROM prati ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_soins FROM soins ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_paye FROM paye ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_rdv FROM rdv ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_histo FROM historique_editions ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_codep FROM code_postaux ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_histo_dossier FROM histo_dossier ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_soins_prevus FROM soins_prevus ;
w_patience.Wf_AddValue(6)
SELECT COUNT(*) INTO :nb_images_infos FROM images_infos ;
w_patience.Wf_AddValue(6)

sle_pat.text = string(nb_pat)
sle_com.text = string(nb_com)
sle_com_admini.text = string(nb_com_admini)
sle_cor.text = string(nb_cor)
sle_mut.text = string(nb_mut)
sle_cai.text = string(nb_cai)
sle_adr.text = string(nb_adr)
sle_dos.text = string(nb_dos)
sle_pra.text = string(nb_pra)
sle_soins.text = string(nb_soins)
sle_paye.text = string(nb_paye)
sle_rdv.text = string(nb_rdv)
sle_histo.text = string(nb_histo)
sle_codep.text = string(nb_codep)
sle_histo_dossier.text = string(nb_histo_dossier)
sle_soins_prevus.text = string(nb_soins_prevus)
sle_images.text = string(nb_images_infos)

close(w_patience)
end event

on w_nb_fiches.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.sle_soins_prevus=create sle_soins_prevus
this.st_15=create st_15
this.pb_1=create pb_1
this.sle_histo_dossier=create sle_histo_dossier
this.st_14=create st_14
this.st_22=create st_22
this.sle_com_admini=create sle_com_admini
this.sle_codep=create sle_codep
this.st_13=create st_13
this.sle_histo=create sle_histo
this.sle_rdv=create sle_rdv
this.st_12=create st_12
this.st_11=create st_11
this.sle_paye=create sle_paye
this.sle_soins=create sle_soins
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.sle_cor=create sle_cor
this.sle_pra=create sle_pra
this.st_6=create st_6
this.sle_dos=create sle_dos
this.sle_cai=create sle_cai
this.st_5=create st_5
this.st_4=create st_4
this.sle_mut=create sle_mut
this.st_3=create st_3
this.st_2=create st_2
this.sle_adr=create sle_adr
this.sle_com=create sle_com
this.sle_pat=create sle_pat
this.st_1=create st_1
this.st_16=create st_16
this.sle_images=create sle_images
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.sle_soins_prevus
this.Control[iCurrent+3]=this.st_15
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.sle_histo_dossier
this.Control[iCurrent+6]=this.st_14
this.Control[iCurrent+7]=this.st_22
this.Control[iCurrent+8]=this.sle_com_admini
this.Control[iCurrent+9]=this.sle_codep
this.Control[iCurrent+10]=this.st_13
this.Control[iCurrent+11]=this.sle_histo
this.Control[iCurrent+12]=this.sle_rdv
this.Control[iCurrent+13]=this.st_12
this.Control[iCurrent+14]=this.st_11
this.Control[iCurrent+15]=this.sle_paye
this.Control[iCurrent+16]=this.sle_soins
this.Control[iCurrent+17]=this.st_10
this.Control[iCurrent+18]=this.st_9
this.Control[iCurrent+19]=this.st_8
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.sle_cor
this.Control[iCurrent+22]=this.sle_pra
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.sle_dos
this.Control[iCurrent+25]=this.sle_cai
this.Control[iCurrent+26]=this.st_5
this.Control[iCurrent+27]=this.st_4
this.Control[iCurrent+28]=this.sle_mut
this.Control[iCurrent+29]=this.st_3
this.Control[iCurrent+30]=this.st_2
this.Control[iCurrent+31]=this.sle_adr
this.Control[iCurrent+32]=this.sle_com
this.Control[iCurrent+33]=this.sle_pat
this.Control[iCurrent+34]=this.st_1
this.Control[iCurrent+35]=this.st_16
this.Control[iCurrent+36]=this.sle_images
end on

on w_nb_fiches.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.sle_soins_prevus)
destroy(this.st_15)
destroy(this.pb_1)
destroy(this.sle_histo_dossier)
destroy(this.st_14)
destroy(this.st_22)
destroy(this.sle_com_admini)
destroy(this.sle_codep)
destroy(this.st_13)
destroy(this.sle_histo)
destroy(this.sle_rdv)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.sle_paye)
destroy(this.sle_soins)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.sle_cor)
destroy(this.sle_pra)
destroy(this.st_6)
destroy(this.sle_dos)
destroy(this.sle_cai)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.sle_mut)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_adr)
destroy(this.sle_com)
destroy(this.sle_pat)
destroy(this.st_1)
destroy(this.st_16)
destroy(this.sle_images)
end on

event resize;call super::resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_nb_fiches
integer x = 809
integer y = 372
end type

type uo_1 from resize_fenetre within w_nb_fiches
boolean visible = false
integer x = 443
integer y = 372
integer taborder = 10
boolean border = false
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type sle_soins_prevus from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1056
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within w_nb_fiches
integer x = 5
integer y = 1064
integer width = 1175
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Lignes de soins Prévisionnels :"
alignment alignment = right!
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_nb_fiches
integer x = 571
integer y = 1976
integer width = 489
integer height = 160
integer taborder = 30
fontcharset fontcharset = ansi!
boolean default = true
end type

type sle_histo_dossier from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1728
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within w_nb_fiches
integer x = 279
integer y = 1736
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Historique des Dossiers :"
alignment alignment = right!
end type

type st_22 from statictext within w_nb_fiches
integer x = 73
integer y = 156
integer width = 1106
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Commentaires administratifs :"
alignment alignment = right!
end type

type sle_com_admini from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 152
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_codep from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1616
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_13 from statictext within w_nb_fiches
integer x = 279
integer y = 1624
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Codes Postaux :"
alignment alignment = right!
end type

type sle_histo from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1504
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_rdv from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1392
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_nb_fiches
integer x = 279
integer y = 1512
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Editions en historique :"
alignment alignment = right!
end type

type st_11 from statictext within w_nb_fiches
integer x = 279
integer y = 1400
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Rendez-vous :"
alignment alignment = right!
end type

type sle_paye from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1280
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_soins from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1168
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_nb_fiches
integer x = 279
integer y = 1288
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Lignes de règlements :"
alignment alignment = right!
end type

type st_9 from statictext within w_nb_fiches
integer x = 279
integer y = 1176
integer width = 901
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Lignes de soins :"
alignment alignment = right!
end type

type st_8 from statictext within w_nb_fiches
integer x = 23
integer y = 952
integer width = 1157
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Correspondants && Dentistes :"
alignment alignment = right!
end type

type st_7 from statictext within w_nb_fiches
integer x = 562
integer y = 840
integer width = 617
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Praticiens :"
alignment alignment = right!
end type

type sle_cor from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 944
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_pra from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 832
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_nb_fiches
integer x = 242
integer y = 736
integer width = 937
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Types de Dossier :"
alignment alignment = right!
end type

type sle_dos from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 720
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_cai from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 608
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_nb_fiches
integer x = 375
integer y = 624
integer width = 805
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Caisses :"
alignment alignment = right!
end type

type st_4 from statictext within w_nb_fiches
integer x = 375
integer y = 512
integer width = 805
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Mutuelles :"
alignment alignment = right!
end type

type sle_mut from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 496
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_nb_fiches
integer x = 393
integer y = 400
integer width = 786
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Adresses :"
alignment alignment = right!
end type

type st_2 from statictext within w_nb_fiches
integer x = 293
integer y = 288
integer width = 887
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Commentaires cliniques :"
alignment alignment = right!
end type

type sle_adr from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 384
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_com from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 272
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_pat from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 28
integer width = 279
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_nb_fiches
integer x = 558
integer y = 44
integer width = 622
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Patients :"
alignment alignment = right!
end type

type st_16 from statictext within w_nb_fiches
integer x = 279
integer y = 1848
integer width = 901
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Images :"
alignment alignment = right!
end type

type sle_images from singlelineedit within w_nb_fiches
integer x = 1202
integer y = 1836
integer width = 279
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

