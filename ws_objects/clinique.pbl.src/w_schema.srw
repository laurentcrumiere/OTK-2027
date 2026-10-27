$PBExportHeader$w_schema.srw
forward
global type w_schema from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_schema
end type
type pb_annuler from uo_picturebutton_390x120 within w_schema
end type
type cbx_18 from checkbox within w_schema
end type
type cbx_48 from checkbox within w_schema
end type
type cbx_17 from checkbox within w_schema
end type
type cbx_47 from checkbox within w_schema
end type
type cbx_46 from checkbox within w_schema
end type
type cbx_16 from checkbox within w_schema
end type
type cbx_15 from checkbox within w_schema
end type
type cbx_45 from checkbox within w_schema
end type
type cbx_44 from checkbox within w_schema
end type
type cbx_43 from checkbox within w_schema
end type
type cbx_42 from checkbox within w_schema
end type
type cbx_41 from checkbox within w_schema
end type
type cbx_31 from checkbox within w_schema
end type
type cbx_32 from checkbox within w_schema
end type
type cbx_33 from checkbox within w_schema
end type
type cbx_34 from checkbox within w_schema
end type
type cbx_35 from checkbox within w_schema
end type
type cbx_36 from checkbox within w_schema
end type
type cbx_37 from checkbox within w_schema
end type
type cbx_38 from checkbox within w_schema
end type
type cbx_14 from checkbox within w_schema
end type
type cbx_13 from checkbox within w_schema
end type
type cbx_12 from checkbox within w_schema
end type
type cbx_11 from checkbox within w_schema
end type
type cbx_21 from checkbox within w_schema
end type
type cbx_22 from checkbox within w_schema
end type
type cbx_23 from checkbox within w_schema
end type
type cbx_24 from checkbox within w_schema
end type
type cbx_25 from checkbox within w_schema
end type
type cbx_26 from checkbox within w_schema
end type
type cbx_27 from checkbox within w_schema
end type
type cbx_28 from checkbox within w_schema
end type
type p_1 from picture within w_schema
end type
type cbx_55 from checkbox within w_schema
end type
type cbx_54 from checkbox within w_schema
end type
type cbx_53 from checkbox within w_schema
end type
type cbx_52 from checkbox within w_schema
end type
type cbx_51 from checkbox within w_schema
end type
type cbx_61 from checkbox within w_schema
end type
type cbx_62 from checkbox within w_schema
end type
type cbx_63 from checkbox within w_schema
end type
type cbx_64 from checkbox within w_schema
end type
type cbx_65 from checkbox within w_schema
end type
type cbx_85 from checkbox within w_schema
end type
type cbx_84 from checkbox within w_schema
end type
type cbx_83 from checkbox within w_schema
end type
type cbx_82 from checkbox within w_schema
end type
type cbx_81 from checkbox within w_schema
end type
type cbx_71 from checkbox within w_schema
end type
type cbx_72 from checkbox within w_schema
end type
type cbx_73 from checkbox within w_schema
end type
type cbx_74 from checkbox within w_schema
end type
type cbx_75 from checkbox within w_schema
end type
type pb_aide from uo_bouton_aide within w_schema
end type
type cbx_ssd from checkbox within w_schema
end type
type cbx_sas from checkbox within w_schema
end type
type cbx_ssg from checkbox within w_schema
end type
type cbx_csd from checkbox within w_schema
end type
type cbx_csg from checkbox within w_schema
end type
type cbx_as from checkbox within w_schema
end type
type cbx_sid from checkbox within w_schema
end type
type cbx_sai from checkbox within w_schema
end type
type cbx_sig from checkbox within w_schema
end type
type cbx_cid from checkbox within w_schema
end type
type cbx_cig from checkbox within w_schema
end type
type cbx_ai from checkbox within w_schema
end type
end forward

global type w_schema from w_fenetre_arakis
integer width = 5669
integer height = 2332
string title = "Schéma Dentaire"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
pb_annuler pb_annuler
cbx_18 cbx_18
cbx_48 cbx_48
cbx_17 cbx_17
cbx_47 cbx_47
cbx_46 cbx_46
cbx_16 cbx_16
cbx_15 cbx_15
cbx_45 cbx_45
cbx_44 cbx_44
cbx_43 cbx_43
cbx_42 cbx_42
cbx_41 cbx_41
cbx_31 cbx_31
cbx_32 cbx_32
cbx_33 cbx_33
cbx_34 cbx_34
cbx_35 cbx_35
cbx_36 cbx_36
cbx_37 cbx_37
cbx_38 cbx_38
cbx_14 cbx_14
cbx_13 cbx_13
cbx_12 cbx_12
cbx_11 cbx_11
cbx_21 cbx_21
cbx_22 cbx_22
cbx_23 cbx_23
cbx_24 cbx_24
cbx_25 cbx_25
cbx_26 cbx_26
cbx_27 cbx_27
cbx_28 cbx_28
p_1 p_1
cbx_55 cbx_55
cbx_54 cbx_54
cbx_53 cbx_53
cbx_52 cbx_52
cbx_51 cbx_51
cbx_61 cbx_61
cbx_62 cbx_62
cbx_63 cbx_63
cbx_64 cbx_64
cbx_65 cbx_65
cbx_85 cbx_85
cbx_84 cbx_84
cbx_83 cbx_83
cbx_82 cbx_82
cbx_81 cbx_81
cbx_71 cbx_71
cbx_72 cbx_72
cbx_73 cbx_73
cbx_74 cbx_74
cbx_75 cbx_75
pb_aide pb_aide
cbx_ssd cbx_ssd
cbx_sas cbx_sas
cbx_ssg cbx_ssg
cbx_csd cbx_csd
cbx_csg cbx_csg
cbx_as cbx_as
cbx_sid cbx_sid
cbx_sai cbx_sai
cbx_sig cbx_sig
cbx_cid cbx_cid
cbx_cig cbx_cig
cbx_ai cbx_ai
end type
global w_schema w_schema

type variables
checkbox tab_cbx[85]

string separateur
end variables

on w_schema.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_annuler=create pb_annuler
this.cbx_18=create cbx_18
this.cbx_48=create cbx_48
this.cbx_17=create cbx_17
this.cbx_47=create cbx_47
this.cbx_46=create cbx_46
this.cbx_16=create cbx_16
this.cbx_15=create cbx_15
this.cbx_45=create cbx_45
this.cbx_44=create cbx_44
this.cbx_43=create cbx_43
this.cbx_42=create cbx_42
this.cbx_41=create cbx_41
this.cbx_31=create cbx_31
this.cbx_32=create cbx_32
this.cbx_33=create cbx_33
this.cbx_34=create cbx_34
this.cbx_35=create cbx_35
this.cbx_36=create cbx_36
this.cbx_37=create cbx_37
this.cbx_38=create cbx_38
this.cbx_14=create cbx_14
this.cbx_13=create cbx_13
this.cbx_12=create cbx_12
this.cbx_11=create cbx_11
this.cbx_21=create cbx_21
this.cbx_22=create cbx_22
this.cbx_23=create cbx_23
this.cbx_24=create cbx_24
this.cbx_25=create cbx_25
this.cbx_26=create cbx_26
this.cbx_27=create cbx_27
this.cbx_28=create cbx_28
this.p_1=create p_1
this.cbx_55=create cbx_55
this.cbx_54=create cbx_54
this.cbx_53=create cbx_53
this.cbx_52=create cbx_52
this.cbx_51=create cbx_51
this.cbx_61=create cbx_61
this.cbx_62=create cbx_62
this.cbx_63=create cbx_63
this.cbx_64=create cbx_64
this.cbx_65=create cbx_65
this.cbx_85=create cbx_85
this.cbx_84=create cbx_84
this.cbx_83=create cbx_83
this.cbx_82=create cbx_82
this.cbx_81=create cbx_81
this.cbx_71=create cbx_71
this.cbx_72=create cbx_72
this.cbx_73=create cbx_73
this.cbx_74=create cbx_74
this.cbx_75=create cbx_75
this.pb_aide=create pb_aide
this.cbx_ssd=create cbx_ssd
this.cbx_sas=create cbx_sas
this.cbx_ssg=create cbx_ssg
this.cbx_csd=create cbx_csd
this.cbx_csg=create cbx_csg
this.cbx_as=create cbx_as
this.cbx_sid=create cbx_sid
this.cbx_sai=create cbx_sai
this.cbx_sig=create cbx_sig
this.cbx_cid=create cbx_cid
this.cbx_cig=create cbx_cig
this.cbx_ai=create cbx_ai
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.cbx_18
this.Control[iCurrent+4]=this.cbx_48
this.Control[iCurrent+5]=this.cbx_17
this.Control[iCurrent+6]=this.cbx_47
this.Control[iCurrent+7]=this.cbx_46
this.Control[iCurrent+8]=this.cbx_16
this.Control[iCurrent+9]=this.cbx_15
this.Control[iCurrent+10]=this.cbx_45
this.Control[iCurrent+11]=this.cbx_44
this.Control[iCurrent+12]=this.cbx_43
this.Control[iCurrent+13]=this.cbx_42
this.Control[iCurrent+14]=this.cbx_41
this.Control[iCurrent+15]=this.cbx_31
this.Control[iCurrent+16]=this.cbx_32
this.Control[iCurrent+17]=this.cbx_33
this.Control[iCurrent+18]=this.cbx_34
this.Control[iCurrent+19]=this.cbx_35
this.Control[iCurrent+20]=this.cbx_36
this.Control[iCurrent+21]=this.cbx_37
this.Control[iCurrent+22]=this.cbx_38
this.Control[iCurrent+23]=this.cbx_14
this.Control[iCurrent+24]=this.cbx_13
this.Control[iCurrent+25]=this.cbx_12
this.Control[iCurrent+26]=this.cbx_11
this.Control[iCurrent+27]=this.cbx_21
this.Control[iCurrent+28]=this.cbx_22
this.Control[iCurrent+29]=this.cbx_23
this.Control[iCurrent+30]=this.cbx_24
this.Control[iCurrent+31]=this.cbx_25
this.Control[iCurrent+32]=this.cbx_26
this.Control[iCurrent+33]=this.cbx_27
this.Control[iCurrent+34]=this.cbx_28
this.Control[iCurrent+35]=this.p_1
this.Control[iCurrent+36]=this.cbx_55
this.Control[iCurrent+37]=this.cbx_54
this.Control[iCurrent+38]=this.cbx_53
this.Control[iCurrent+39]=this.cbx_52
this.Control[iCurrent+40]=this.cbx_51
this.Control[iCurrent+41]=this.cbx_61
this.Control[iCurrent+42]=this.cbx_62
this.Control[iCurrent+43]=this.cbx_63
this.Control[iCurrent+44]=this.cbx_64
this.Control[iCurrent+45]=this.cbx_65
this.Control[iCurrent+46]=this.cbx_85
this.Control[iCurrent+47]=this.cbx_84
this.Control[iCurrent+48]=this.cbx_83
this.Control[iCurrent+49]=this.cbx_82
this.Control[iCurrent+50]=this.cbx_81
this.Control[iCurrent+51]=this.cbx_71
this.Control[iCurrent+52]=this.cbx_72
this.Control[iCurrent+53]=this.cbx_73
this.Control[iCurrent+54]=this.cbx_74
this.Control[iCurrent+55]=this.cbx_75
this.Control[iCurrent+56]=this.pb_aide
this.Control[iCurrent+57]=this.cbx_ssd
this.Control[iCurrent+58]=this.cbx_sas
this.Control[iCurrent+59]=this.cbx_ssg
this.Control[iCurrent+60]=this.cbx_csd
this.Control[iCurrent+61]=this.cbx_csg
this.Control[iCurrent+62]=this.cbx_as
this.Control[iCurrent+63]=this.cbx_sid
this.Control[iCurrent+64]=this.cbx_sai
this.Control[iCurrent+65]=this.cbx_sig
this.Control[iCurrent+66]=this.cbx_cid
this.Control[iCurrent+67]=this.cbx_cig
this.Control[iCurrent+68]=this.cbx_ai
end on

on w_schema.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_annuler)
destroy(this.cbx_18)
destroy(this.cbx_48)
destroy(this.cbx_17)
destroy(this.cbx_47)
destroy(this.cbx_46)
destroy(this.cbx_16)
destroy(this.cbx_15)
destroy(this.cbx_45)
destroy(this.cbx_44)
destroy(this.cbx_43)
destroy(this.cbx_42)
destroy(this.cbx_41)
destroy(this.cbx_31)
destroy(this.cbx_32)
destroy(this.cbx_33)
destroy(this.cbx_34)
destroy(this.cbx_35)
destroy(this.cbx_36)
destroy(this.cbx_37)
destroy(this.cbx_38)
destroy(this.cbx_14)
destroy(this.cbx_13)
destroy(this.cbx_12)
destroy(this.cbx_11)
destroy(this.cbx_21)
destroy(this.cbx_22)
destroy(this.cbx_23)
destroy(this.cbx_24)
destroy(this.cbx_25)
destroy(this.cbx_26)
destroy(this.cbx_27)
destroy(this.cbx_28)
destroy(this.p_1)
destroy(this.cbx_55)
destroy(this.cbx_54)
destroy(this.cbx_53)
destroy(this.cbx_52)
destroy(this.cbx_51)
destroy(this.cbx_61)
destroy(this.cbx_62)
destroy(this.cbx_63)
destroy(this.cbx_64)
destroy(this.cbx_65)
destroy(this.cbx_85)
destroy(this.cbx_84)
destroy(this.cbx_83)
destroy(this.cbx_82)
destroy(this.cbx_81)
destroy(this.cbx_71)
destroy(this.cbx_72)
destroy(this.cbx_73)
destroy(this.cbx_74)
destroy(this.cbx_75)
destroy(this.pb_aide)
destroy(this.cbx_ssd)
destroy(this.cbx_sas)
destroy(this.cbx_ssg)
destroy(this.cbx_csd)
destroy(this.cbx_csg)
destroy(this.cbx_as)
destroy(this.cbx_sid)
destroy(this.cbx_sai)
destroy(this.cbx_sig)
destroy(this.cbx_cid)
destroy(this.cbx_cig)
destroy(this.cbx_ai)
end on

event open;call super::open;// paramètre en entrée
// param_win[1] = "E" : extraction ... dents séparées par virgules
// param_win[1] = "D" : pour la zone Dent des soins  ... dents séparées par  "-"  
// param_win[1] = "S" : dents soins de la fiche diagnostique

this.backcolor = couleur_blanche

if  param_win[1] = "E" or param_win[1] = "S" then
	separateur = ", "
else
	if CCVITALE then
		separateur = "-"
	else
		separateur = " "
	end if
end if


string v_extract

// valeurs déjà saisies passées en paramètre
// chaine ... valeur séparées par des espaces et/ou des ,
v_extract = Message.StringParm

tab_cbx[1] = cbx_as
tab_cbx[2] = cbx_ai

tab_cbx[3] = cbx_ssd
tab_cbx[4] = cbx_sas
tab_cbx[5] = cbx_ssg


tab_cbx[7] = cbx_sai
tab_cbx[6] = cbx_sig
tab_cbx[8] = cbx_sid


tab_cbx[10] = cbx_csd
tab_cbx[20] = cbx_csg
tab_cbx[30] = cbx_cig
tab_cbx[40] = cbx_cid

tab_cbx[11] = cbx_11
tab_cbx[12] = cbx_12
tab_cbx[13] = cbx_13
tab_cbx[14] = cbx_14
tab_cbx[15] = cbx_15
tab_cbx[16] = cbx_16
tab_cbx[17] = cbx_17
tab_cbx[18] = cbx_18


tab_cbx[21] = cbx_21
tab_cbx[22] = cbx_22
tab_cbx[23] = cbx_23
tab_cbx[24] = cbx_24
tab_cbx[25] = cbx_25
tab_cbx[26] = cbx_26
tab_cbx[27] = cbx_27
tab_cbx[28] = cbx_28

tab_cbx[31] = cbx_31
tab_cbx[32] = cbx_32
tab_cbx[33] = cbx_33
tab_cbx[34] = cbx_34
tab_cbx[35] = cbx_35
tab_cbx[36] = cbx_36
tab_cbx[37] = cbx_37
tab_cbx[38] = cbx_38


tab_cbx[41] = cbx_41
tab_cbx[42] = cbx_42
tab_cbx[43] = cbx_43
tab_cbx[44] = cbx_44
tab_cbx[45] = cbx_45
tab_cbx[46] = cbx_46
tab_cbx[47] = cbx_47
tab_cbx[48] = cbx_48

tab_cbx[51] = cbx_51
tab_cbx[52] = cbx_52
tab_cbx[53] = cbx_53
tab_cbx[54] = cbx_54
tab_cbx[55] = cbx_55

tab_cbx[61] = cbx_61
tab_cbx[62] = cbx_62
tab_cbx[63] = cbx_63
tab_cbx[64] = cbx_64
tab_cbx[65] = cbx_65

tab_cbx[71] = cbx_71
tab_cbx[72] = cbx_72
tab_cbx[73] = cbx_73
tab_cbx[74] = cbx_74
tab_cbx[75] = cbx_75

tab_cbx[81] = cbx_81
tab_cbx[82] = cbx_82
tab_cbx[83] = cbx_83
tab_cbx[84] = cbx_84
tab_cbx[85] = cbx_85






// Parcours de la chaine pour interprétation ...
boolean v_fin
integer v_longueur, v_cpt
string v_numero_courant, v_var_courant
integer v_numero_dent

v_extract = trim(v_extract)


v_longueur = len(v_extract)
v_numero_courant = ""
for v_cpt = 1 to v_longueur + 1  // pour gérer la dernière dent
	if v_cpt <= v_longueur then
		v_var_courant = mid(v_extract, v_cpt, 1)
	else
		v_var_courant = " "
	end if
	if v_var_courant >= "0" and v_var_courant <= "9" then
		// valeur numérique... on mémorise le N°
		v_numero_courant = v_numero_courant + v_var_courant
	else
		// Valeur non numérique 
		// => on analyse pour cocher ou pas 
		v_numero_dent = integer(v_numero_courant)
		if v_numero_dent > 0 and v_numero_dent <= 85 then
			if isvalid (tab_cbx[v_numero_dent] ) then
				tab_cbx[v_numero_dent].checked = true
			end if
		end if
		v_numero_courant = ""
	end if
next






end event

type p_fond from w_fenetre_arakis`p_fond within w_schema
integer x = 165
integer y = 2016
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_schema
integer x = 2555
integer y = 2056
integer width = 736
integer height = 152
integer taborder = 10
boolean bringtotop = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;
// Retour des cases cochées

integer cpt
string v_extraction = ""

for cpt = 1 to 85
	
	if isvalid(tab_cbx[cpt]) then
		if tab_cbx[cpt].checked then
			if len(v_extraction ) > 0 then
				v_extraction = v_extraction + separateur 
			end if
			v_extraction = v_extraction  + string(cpt, "00")
		end if
	end if
next 




CloseWithReturn(Parent, trim(v_extraction))
end event

type pb_annuler from uo_picturebutton_390x120 within w_schema
integer x = 1595
integer y = 2056
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn(Parent, '-1')
end event

type cbx_18 from checkbox within w_schema
integer x = 256
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_48 from checkbox within w_schema
integer x = 251
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_17 from checkbox within w_schema
integer x = 443
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_47 from checkbox within w_schema
integer x = 439
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_46 from checkbox within w_schema
integer x = 631
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_16 from checkbox within w_schema
integer x = 635
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_15 from checkbox within w_schema
integer x = 823
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_45 from checkbox within w_schema
integer x = 818
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_44 from checkbox within w_schema
integer x = 1010
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_43 from checkbox within w_schema
integer x = 1207
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_42 from checkbox within w_schema
integer x = 1403
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_41 from checkbox within w_schema
integer x = 1582
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_31 from checkbox within w_schema
integer x = 1742
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_32 from checkbox within w_schema
integer x = 1897
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_33 from checkbox within w_schema
integer x = 2085
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_34 from checkbox within w_schema
integer x = 2286
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_35 from checkbox within w_schema
integer x = 2473
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_36 from checkbox within w_schema
integer x = 2670
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_37 from checkbox within w_schema
integer x = 2871
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_38 from checkbox within w_schema
integer x = 3067
integer y = 1216
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_14 from checkbox within w_schema
integer x = 1024
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_13 from checkbox within w_schema
integer x = 1211
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_12 from checkbox within w_schema
integer x = 1408
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_11 from checkbox within w_schema
integer x = 1595
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_21 from checkbox within w_schema
integer x = 1746
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_22 from checkbox within w_schema
integer x = 1911
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_23 from checkbox within w_schema
integer x = 2098
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_24 from checkbox within w_schema
integer x = 2295
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_25 from checkbox within w_schema
integer x = 2491
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_26 from checkbox within w_schema
integer x = 2693
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_27 from checkbox within w_schema
integer x = 2875
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_28 from checkbox within w_schema
integer x = 3077
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type p_1 from picture within w_schema
integer x = 78
integer y = 36
integer width = 5486
integer height = 1780
boolean originalsize = true
string picturename = "lc_schema_dentaire.jpg"
boolean focusrectangle = false
end type

type cbx_55 from checkbox within w_schema
integer x = 3570
integer y = 944
integer width = 78
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_54 from checkbox within w_schema
integer x = 3758
integer y = 944
integer width = 91
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_53 from checkbox within w_schema
integer x = 3945
integer y = 944
integer width = 123
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_52 from checkbox within w_schema
integer x = 4142
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_51 from checkbox within w_schema
integer x = 4325
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_61 from checkbox within w_schema
integer x = 4494
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_62 from checkbox within w_schema
integer x = 4667
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_63 from checkbox within w_schema
integer x = 4859
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_64 from checkbox within w_schema
integer x = 5061
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_65 from checkbox within w_schema
integer x = 5257
integer y = 944
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_85 from checkbox within w_schema
integer x = 3552
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_84 from checkbox within w_schema
integer x = 3749
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_83 from checkbox within w_schema
integer x = 3936
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_82 from checkbox within w_schema
integer x = 4133
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_81 from checkbox within w_schema
integer x = 4325
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_71 from checkbox within w_schema
integer x = 4494
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_72 from checkbox within w_schema
integer x = 4667
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_73 from checkbox within w_schema
integer x = 4859
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_74 from checkbox within w_schema
integer x = 5061
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type cbx_75 from checkbox within w_schema
integer x = 5257
integer y = 1216
integer width = 82
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type pb_aide from uo_bouton_aide within w_schema
string tag = "Commentaires Cliniques"
integer x = 5221
integer y = 2056
integer taborder = 120
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type cbx_ssd from checkbox within w_schema
integer x = 393
integer y = 344
integer width = 818
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Supérieur Droit (03)"
end type

type cbx_sas from checkbox within w_schema
integer x = 1367
integer y = 344
integer width = 869
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Antéro-Supérieur (04)"
end type

type cbx_ssg from checkbox within w_schema
integer x = 2336
integer y = 344
integer width = 901
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Supérieur Gauche (05)"
end type

type cbx_csd from checkbox within w_schema
integer x = 677
integer y = 264
integer width = 800
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Cadran Supérieur Droit (10)"
end type

type cbx_csg from checkbox within w_schema
integer x = 2039
integer y = 264
integer width = 882
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Cadran Supérieur Gauche (20)"
end type

type cbx_as from checkbox within w_schema
integer x = 1399
integer y = 204
integer width = 617
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Arcade Supérieure (01)"
end type

type cbx_sid from checkbox within w_schema
integer x = 302
integer y = 1780
integer width = 818
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Inférieur Droit (08)"
end type

type cbx_sai from checkbox within w_schema
integer x = 1275
integer y = 1780
integer width = 869
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Antéro-Inférieur (07)"
end type

type cbx_sig from checkbox within w_schema
integer x = 2245
integer y = 1780
integer width = 901
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sextant Inférieur Gauche (06)"
end type

type cbx_cid from checkbox within w_schema
integer x = 549
integer y = 1864
integer width = 800
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Cadran Inférieur Droit (40)"
end type

type cbx_cig from checkbox within w_schema
integer x = 1911
integer y = 1864
integer width = 882
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Cadran Inférieur Gauche (30)"
end type

type cbx_ai from checkbox within w_schema
integer x = 1349
integer y = 1956
integer width = 617
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Arcade Inférieure (01)"
end type

