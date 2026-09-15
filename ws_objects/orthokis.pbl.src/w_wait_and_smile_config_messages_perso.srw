$PBExportHeader$w_wait_and_smile_config_messages_perso.srw
forward
global type w_wait_and_smile_config_messages_perso from w_fenetre_arakis
end type
type dw_liste from datawindow within w_wait_and_smile_config_messages_perso
end type
type cb_ferme from uo_picturebutton_390x120_fermer within w_wait_and_smile_config_messages_perso
end type
type sle_debut from singlelineedit within w_wait_and_smile_config_messages_perso
end type
type st_1 from statictext within w_wait_and_smile_config_messages_perso
end type
type cb_1 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_2 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_3 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type sle_centre from singlelineedit within w_wait_and_smile_config_messages_perso
end type
type sle_lieu from singlelineedit within w_wait_and_smile_config_messages_perso
end type
type st_2 from statictext within w_wait_and_smile_config_messages_perso
end type
type st_3 from statictext within w_wait_and_smile_config_messages_perso
end type
type em_ordre from editmask within w_wait_and_smile_config_messages_perso
end type
type st_4 from statictext within w_wait_and_smile_config_messages_perso
end type
type sle_numero from singlelineedit within w_wait_and_smile_config_messages_perso
end type
type cbx_accord from checkbox within w_wait_and_smile_config_messages_perso
end type
type st_5 from statictext within w_wait_and_smile_config_messages_perso
end type
type rb_3 from radiobutton within w_wait_and_smile_config_messages_perso
end type
type rb_1 from radiobutton within w_wait_and_smile_config_messages_perso
end type
type rb_2 from radiobutton within w_wait_and_smile_config_messages_perso
end type
type cb_ajouter from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type cb_modifier from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type cb_supprimer from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type pb_trier from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type cb_4 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_5 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_6 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_7 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_8 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
end type
type cb_envoyer from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type cb_annuler from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
end type
type gb_4 from groupbox within w_wait_and_smile_config_messages_perso
end type
end forward

global type w_wait_and_smile_config_messages_perso from w_fenetre_arakis
integer width = 4841
integer height = 2528
string title = "Messages Types Wait and Smile"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_liste dw_liste
cb_ferme cb_ferme
sle_debut sle_debut
st_1 st_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
sle_centre sle_centre
sle_lieu sle_lieu
st_2 st_2
st_3 st_3
em_ordre em_ordre
st_4 st_4
sle_numero sle_numero
cbx_accord cbx_accord
st_5 st_5
rb_3 rb_3
rb_1 rb_1
rb_2 rb_2
cb_ajouter cb_ajouter
cb_modifier cb_modifier
cb_supprimer cb_supprimer
pb_trier pb_trier
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_envoyer cb_envoyer
cb_annuler cb_annuler
gb_4 gb_4
end type
global w_wait_and_smile_config_messages_perso w_wait_and_smile_config_messages_perso

type variables


string tab_debut[], tab_centre[], tab_lieu[], tab_accord[], tab_salle[]
integer tab_ordre[]
integer v_nb_messages

string fichier_config_neotess = "Neotess.ini"

string tab_string_nul[]
integer  tab_integer_nul[]

integer type_usage
end variables

forward prototypes
public subroutine charger_messages ()
public subroutine maj_message (integer v_numero_message)
end prototypes

public subroutine charger_messages ();
tab_debut = tab_string_nul
tab_centre= tab_string_nul
tab_lieu= tab_string_nul
tab_accord= tab_string_nul
tab_salle= tab_string_nul

tab_ordre = tab_integer_nul

dw_liste.reset()

sle_numero.text = ""
em_ordre.text = ""
sle_debut.text = ""
sle_centre.text = ""
sle_lieu.text = ""
cbx_accord.checked = false
rb_1.checked = false
rb_2.checked = false
rb_3.checked = false



v_nb_messages =  ProfileInt(dir_photos + fichier_config_neotess, "messages_types", "nb_messages", 0)

// remplissage de la dw et des tableau
integer i

for i = 1 to v_nb_messages
	
	tab_debut[i] = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "debut_" + string(i), "")
	tab_centre[i] = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "centre_" + string(i), "")
	tab_lieu[i] = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "lieu_" + string(i), "")
	tab_accord[i] = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(i), "O")
	tab_salle[i] = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(i), "1")
	tab_ordre[i] = ProfileInt(dir_photos + fichier_config_neotess, "messages_types", "ordre_" + string(i), 100)
	
	// Mise en place dans  la DW
	dw_liste.insertrow(9999)
	dw_liste.setitem(i, "ordre", tab_ordre[i])
	if tab_accord[i] = "O" then
		dw_liste.setitem(i, "message", tab_debut[i] + " " + tab_centre[i]  + "(e) " + tab_lieu[i])
	else
		dw_liste.setitem(i, "message", tab_debut[i] + " " + tab_centre[i]  + " " + tab_lieu[i])
	end if
	if tab_salle[i] = "1" or tab_salle[i] = "2" then
		dw_liste.setitem(i, "salle", tab_salle[i])
	else
		dw_liste.setitem(i, "salle", "1 & 2")
	end if
	
next


// La colonnne servira de clef par la suite si changement d'ordre
for i = 1 to dw_liste.rowcount()
	dw_liste.setitem(i, "numero", i)
next



end subroutine

public subroutine maj_message (integer v_numero_message);
// met à jour les valeurs d'un message dans le .ini puis recharge la liste 

SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "debut_" + string(v_numero_message), sle_debut.text)
SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "centre_" + string(v_numero_message), sle_centre.text)
SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "lieu_" + string(v_numero_message), sle_lieu.text)
if cbx_accord.checked then 
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(v_numero_message), "O")
else
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(v_numero_message), "N")
end if
if rb_1.checked then 
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(v_numero_message), "1")
else
	if rb_2.checked then 
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(v_numero_message), "2")
	else
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(v_numero_message), "3")
	end if
end if
SetProfileString(dir_photos + fichier_config_neotess, "messages_types", "ordre_" + string(v_numero_message), em_ordre.text)

end subroutine

on w_wait_and_smile_config_messages_perso.create
int iCurrent
call super::create
this.dw_liste=create dw_liste
this.cb_ferme=create cb_ferme
this.sle_debut=create sle_debut
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.sle_centre=create sle_centre
this.sle_lieu=create sle_lieu
this.st_2=create st_2
this.st_3=create st_3
this.em_ordre=create em_ordre
this.st_4=create st_4
this.sle_numero=create sle_numero
this.cbx_accord=create cbx_accord
this.st_5=create st_5
this.rb_3=create rb_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cb_ajouter=create cb_ajouter
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.pb_trier=create pb_trier
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_envoyer=create cb_envoyer
this.cb_annuler=create cb_annuler
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste
this.Control[iCurrent+2]=this.cb_ferme
this.Control[iCurrent+3]=this.sle_debut
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.sle_centre
this.Control[iCurrent+9]=this.sle_lieu
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.em_ordre
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.sle_numero
this.Control[iCurrent+15]=this.cbx_accord
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.rb_3
this.Control[iCurrent+18]=this.rb_1
this.Control[iCurrent+19]=this.rb_2
this.Control[iCurrent+20]=this.cb_ajouter
this.Control[iCurrent+21]=this.cb_modifier
this.Control[iCurrent+22]=this.cb_supprimer
this.Control[iCurrent+23]=this.pb_trier
this.Control[iCurrent+24]=this.cb_4
this.Control[iCurrent+25]=this.cb_5
this.Control[iCurrent+26]=this.cb_6
this.Control[iCurrent+27]=this.cb_7
this.Control[iCurrent+28]=this.cb_8
this.Control[iCurrent+29]=this.cb_envoyer
this.Control[iCurrent+30]=this.cb_annuler
this.Control[iCurrent+31]=this.gb_4
end on

on w_wait_and_smile_config_messages_perso.destroy
call super::destroy
destroy(this.dw_liste)
destroy(this.cb_ferme)
destroy(this.sle_debut)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.sle_centre)
destroy(this.sle_lieu)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_ordre)
destroy(this.st_4)
destroy(this.sle_numero)
destroy(this.cbx_accord)
destroy(this.st_5)
destroy(this.rb_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cb_ajouter)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.pb_trier)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_envoyer)
destroy(this.cb_annuler)
destroy(this.gb_4)
end on

event open;call super::open;// En paramètre 
// 1 : pour configuration des messages
// 2 : pour sélection d'un message en vue d'un envoi

type_usage = message.DoubleParm


// initialisation du tout
charger_messages()


if type_usage = 2 then
	height = 1800
	cb_annuler.visible = true
	cb_envoyer.visible = true
	
	if dw_liste.rowcount() = 0 then
		Messagebox("ATTENTION","Vous devez définir des messages d'annonce spéciques ou utiliser les messages classiques !")
		close(this)
	else
		dw_liste.SelectRow(1,True)
		dw_liste.setrow(1)
	end if
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_wait_and_smile_config_messages_perso
end type

type dw_liste from datawindow within w_wait_and_smile_config_messages_perso
integer x = 352
integer y = 40
integer width = 3803
integer height = 1404
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des Messages"
string dataobject = "dw_wait_and_smile_messages_types"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	
	
	// Mise à jour des infos dans les zones de saisie
	sle_numero.text = string(row)
	em_ordre.text = string(tab_ordre[row])
	sle_debut.text = tab_debut[row]
	sle_centre.text = tab_centre[row]
	sle_lieu.text = tab_lieu[row]
	if tab_accord[row] = "O" then
		cbx_accord.checked = true
	else
		cbx_accord.checked = false
	end if
	if tab_salle[row] = "1" then 
		rb_1.checked = true
		rb_2.checked = false
		rb_3.checked = false
	else
		if tab_salle[row] = "2" then 
			rb_1.checked = false
			rb_2.checked = true
			rb_3.checked = false
		else
			rb_1.checked = false
			rb_2.checked = false
			rb_3.checked = true
		end if
	end if
end if
end event

type cb_ferme from uo_picturebutton_390x120_fermer within w_wait_and_smile_config_messages_perso
integer x = 3451
integer y = 2228
integer width = 549
integer height = 148
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

type sle_debut from singlelineedit within w_wait_and_smile_config_messages_perso
integer x = 393
integer y = 1808
integer width = 1239
integer height = 112
integer taborder = 30
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

type st_1 from statictext within w_wait_and_smile_config_messages_perso
integer x = 567
integer y = 1708
integer width = 791
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Début (ex : {prénom} {nom})"
boolean focusrectangle = false
end type

type cb_1 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 485
integer y = 1948
integer width = 311
integer taborder = 100
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "{titre}"
end type

event clicked;call super::clicked;if sle_debut.text = "" then
	sle_debut.text = this.text +" "
else
	sle_debut.text = trim(sle_debut.text) + " " + this.text
end if
sle_debut.setfocus()
end event

type cb_2 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 818
integer y = 1948
integer width = 311
integer taborder = 110
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "{nom}"
end type

event clicked;call super::clicked;if sle_debut.text = "" then
	sle_debut.text = this.text +" "
else
	sle_debut.text = trim(sle_debut.text) + " " + this.text
end if
sle_debut.setfocus()
end event

type cb_3 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 1152
integer y = 1948
integer width = 311
integer taborder = 150
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "{prénom}"
end type

event clicked;call super::clicked;if sle_debut.text = "" then
	sle_debut.text = this.text +" "
else
	sle_debut.text = trim(sle_debut.text) + " " + this.text
end if
sle_debut.setfocus()
end event

type sle_centre from singlelineedit within w_wait_and_smile_config_messages_perso
integer x = 1659
integer y = 1808
integer width = 1239
integer height = 112
integer taborder = 60
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

type sle_lieu from singlelineedit within w_wait_and_smile_config_messages_perso
integer x = 2994
integer y = 1808
integer width = 1239
integer height = 112
integer taborder = 90
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

type st_2 from statictext within w_wait_and_smile_config_messages_perso
integer x = 3269
integer y = 1720
integer width = 599
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Lieu (ex : ~"en salle 1~")"
boolean focusrectangle = false
end type

type st_3 from statictext within w_wait_and_smile_config_messages_perso
integer x = 1893
integer y = 1712
integer width = 754
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Centre (ex : ~"est attendu~")"
boolean focusrectangle = false
end type

type em_ordre from editmask within w_wait_and_smile_config_messages_perso
integer x = 151
integer y = 1808
integer width = 224
integer height = 112
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "100"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

type st_4 from statictext within w_wait_and_smile_config_messages_perso
integer x = 169
integer y = 1716
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Ordre"
boolean focusrectangle = false
end type

type sle_numero from singlelineedit within w_wait_and_smile_config_messages_perso
integer x = 18
integer y = 1808
integer width = 119
integer height = 112
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type cbx_accord from checkbox within w_wait_and_smile_config_messages_perso
integer x = 2917
integer y = 1824
integer width = 59
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
end type

type st_5 from statictext within w_wait_and_smile_config_messages_perso
integer x = 2839
integer y = 1728
integer width = 247
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Accord"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within w_wait_and_smile_config_messages_perso
integer x = 4302
integer y = 2000
integer width = 416
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 1 && 2"
end type

type rb_1 from radiobutton within w_wait_and_smile_config_messages_perso
integer x = 4302
integer y = 1776
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 1"
end type

type rb_2 from radiobutton within w_wait_and_smile_config_messages_perso
integer x = 4302
integer y = 1888
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle 2"
end type

type cb_ajouter from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
integer x = 635
integer y = 2228
integer width = 549
integer height = 148
integer taborder = 130
boolean bringtotop = true
string text = "&Ajouter"
boolean ellipsis = false
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

// Ajout de la ligne d'abord dans le .ini ... ensuite on rechargera les données
v_nb_messages = v_nb_messages + 1
SetProfileString(dir_photos + fichier_config_neotess, "messages_types", "nb_messages", string(v_nb_messages))

maj_message(v_nb_messages)


// initisalition de l'ensemble
charger_messages()
end event

type cb_modifier from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
integer x = 2043
integer y = 2228
integer width = 549
integer height = 148
integer taborder = 160
boolean bringtotop = true
string text = "&Modifier"
boolean ellipsis = false
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;integer v_numero

v_numero = integer(sle_numero.text)
maj_message(v_numero)

charger_messages()

end event

type cb_supprimer from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
integer x = 1339
integer y = 2228
integer width = 549
integer height = 148
integer taborder = 140
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;// principe : on mets à jour tous les messags sauf celui qu'on veut supprimer et o nrecharge les données

integer v_numero_a_supprimer, i, v_numero_message_destination

v_numero_a_supprimer = integer(sle_numero.text)

for i = 1 to v_nb_messages
	if i <> v_numero_a_supprimer then
	
		if i < v_numero_a_supprimer then
			v_numero_message_destination = i 
		else
			v_numero_message_destination = i - 1
		end if
		
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "debut_" + string(v_numero_message_destination), tab_debut[i])
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "centre_" + string(v_numero_message_destination), tab_centre[i])
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "lieu_" + string(v_numero_message_destination), tab_lieu[i])
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(v_numero_message_destination), tab_accord[i])
		SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(v_numero_message_destination), tab_salle[i])
		SetProfileString(dir_photos + fichier_config_neotess, "messages_types", "ordre_" + string(v_numero_message_destination), string(tab_ordre[i]))

	end if

next

v_nb_messages = v_nb_messages - 1
SetProfileString(dir_photos + fichier_config_neotess, "messages_types", "nb_messages", string(v_nb_messages))

charger_messages()

end event

type pb_trier from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
integer x = 2747
integer y = 2228
integer width = 549
integer height = 148
integer taborder = 80
boolean bringtotop = true
string text = "&Trier"
string iconname = "ACTIONS_trier.png"
end type

event clicked;call super::clicked;// On tri la dw puis en sauvegarde et on recharge

dw_liste.setsort("ordre, message")
dw_liste.sort()

integer i, v_numero_tableau

for i = 1 to v_nb_messages
	
	v_numero_tableau = dw_liste.getitemNumber( i, "numero")
		
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "debut_" + string(i), tab_debut[v_numero_tableau])
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "centre_" + string(i), tab_centre[v_numero_tableau])
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "lieu_" + string(i), tab_lieu[v_numero_tableau])
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(i), tab_accord[v_numero_tableau])
	SetProfilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(i), tab_salle[v_numero_tableau])
	SetProfileString(dir_photos + fichier_config_neotess, "messages_types", "ordre_" + string(i), string(tab_ordre[v_numero_tableau]))

next


dw_liste.setsort("")
dw_liste.sort()

charger_messages()


end event

type cb_4 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 1728
integer y = 1948
integer width = 352
integer taborder = 170
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "est attendu"
end type

event clicked;call super::clicked;if sle_centre.text = "" then
	sle_centre.text = this.text +" "
else
	sle_centre.text = trim(sle_centre.text) + " " + this.text
end if
sle_centre.setfocus()
end event

type cb_5 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 2089
integer y = 1948
integer width = 338
integer taborder = 180
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "doit aller"
end type

event clicked;call super::clicked;if sle_centre.text = "" then
	sle_centre.text = this.text +" "
else
	sle_centre.text = trim(sle_centre.text) + " " + this.text
end if
sle_centre.setfocus()
end event

type cb_6 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 2450
integer y = 1948
integer width = 352
integer taborder = 200
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "doit monter"
end type

event clicked;call super::clicked;if sle_centre.text = "" then
	sle_centre.text = this.text +" "
else
	sle_centre.text = trim(sle_centre.text) + " " + this.text
end if
sle_centre.setfocus()
end event

type cb_7 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 3035
integer y = 1948
integer width = 521
integer taborder = 210
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "en Salle de Soins"
end type

event clicked;call super::clicked;if sle_lieu.text = "" then
	sle_lieu.text = this.text +" "
else
	sle_lieu.text = trim(sle_lieu.text) + " " + this.text
end if
sle_lieu.setfocus()
end event

type cb_8 from uo_picturebutton_250x120 within w_wait_and_smile_config_messages_perso
integer x = 3584
integer y = 1948
integer width = 521
integer taborder = 220
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "en Salle N°"
end type

event clicked;call super::clicked;if sle_lieu.text = "" then
	sle_lieu.text = this.text +" "
else
	sle_lieu.text = trim(sle_lieu.text) + " " + this.text
end if
sle_lieu.setfocus()
end event

type cb_envoyer from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
boolean visible = false
integer x = 2441
integer y = 1500
integer width = 549
integer height = 148
integer taborder = 40
boolean bringtotop = true
string text = "Envoyer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// En renvoie le Numéro du message 

closeWithreturn(parent, dw_liste.getrow())
end event

type cb_annuler from uo_picturebutton_390x120 within w_wait_and_smile_config_messages_perso
boolean visible = false
integer x = 1614
integer y = 1496
integer width = 549
integer height = 148
integer taborder = 50
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closeWithreturn(parent, 0)
end event

type gb_4 from groupbox within w_wait_and_smile_config_messages_perso
integer x = 4251
integer y = 1680
integer width = 494
integer height = 444
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Diffusion"
end type

