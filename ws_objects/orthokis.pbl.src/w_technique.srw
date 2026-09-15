$PBExportHeader$w_technique.srw
forward
global type w_technique from window
end type
type dw_fs from datawindow within w_technique
end type
type cb_18 from commandbutton within w_technique
end type
type cb_9 from commandbutton within w_technique
end type
type cb_4 from commandbutton within w_technique
end type
type cb_7 from commandbutton within w_technique
end type
type st_5 from statictext within w_technique
end type
type em_1 from editmask within w_technique
end type
type cb_6 from commandbutton within w_technique
end type
type cb_5 from commandbutton within w_technique
end type
type cb_fermer from commandbutton within w_technique
end type
type cb_3 from commandbutton within w_technique
end type
type sle_3 from singlelineedit within w_technique
end type
type st_11 from statictext within w_technique
end type
type st_3 from statictext within w_technique
end type
type cb_2 from commandbutton within w_technique
end type
type sle_2 from singlelineedit within w_technique
end type
type st_2 from statictext within w_technique
end type
type st_1 from statictext within w_technique
end type
type cb_1 from commandbutton within w_technique
end type
type gb_1 from groupbox within w_technique
end type
type st_4 from statictext within w_technique
end type
type sle_1 from singlelineedit within w_technique
end type
type st_10 from statictext within w_technique
end type
type gb_3 from groupbox within w_technique
end type
type dw_fst from datawindow within w_technique
end type
type r_1 from rectangle within w_technique
end type
end forward

global type w_technique from window
integer width = 3685
integer height = 2352
boolean titlebar = true
string title = "Dévelopements Spécifiques ..."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 15780518
boolean center = true
dw_fs dw_fs
cb_18 cb_18
cb_9 cb_9
cb_4 cb_4
cb_7 cb_7
st_5 st_5
em_1 em_1
cb_6 cb_6
cb_5 cb_5
cb_fermer cb_fermer
cb_3 cb_3
sle_3 sle_3
st_11 st_11
st_3 st_3
cb_2 cb_2
sle_2 sle_2
st_2 st_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
st_4 st_4
sle_1 sle_1
st_10 st_10
gb_3 gb_3
dw_fst dw_fst
r_1 r_1
end type
global w_technique w_technique

type prototypes
Function ulong CreateToolhelp32Snapshot ( ulong dwFlags, ulong th32ProcessID ) Library "kernel32.dll"

Function boolean Process32First ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32FirstW"

Function boolean Process32Next ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32NextW"


end prototypes

type variables
double	var_code_local 
string		save_serial
uo_fx_pages_cliniques f

end variables

forward prototypes
private subroutine serial_restaurer ()
public function string extraire_champ (string ligne, string champ, integer position)
end prototypes

private subroutine serial_restaurer ();if save_serial <> "" then
	serial = save_serial
	save_serial = ""
end if
end subroutine

public function string extraire_champ (string ligne, string champ, integer position);

// Extrait la valeur d'un champ de la forme

//     CHAMP="Valeur"

string valeur

valeur = ""

integer p1,p2

p1 = pos(ligne, champ, position)

if p1 > 0 then
	p1 = p1 + len(champ) + 3
	
	p2 = pos(ligne, '"', p1)
	
	if p2 > 0 then
		valeur = mid(ligne,p1 - 1, p2 - p1 + 1)
	end if
	
	
	
end if

return valeur
end function

on w_technique.create
this.dw_fs=create dw_fs
this.cb_18=create cb_18
this.cb_9=create cb_9
this.cb_4=create cb_4
this.cb_7=create cb_7
this.st_5=create st_5
this.em_1=create em_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_fermer=create cb_fermer
this.cb_3=create cb_3
this.sle_3=create sle_3
this.st_11=create st_11
this.st_3=create st_3
this.cb_2=create cb_2
this.sle_2=create sle_2
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.st_4=create st_4
this.sle_1=create sle_1
this.st_10=create st_10
this.gb_3=create gb_3
this.dw_fst=create dw_fst
this.r_1=create r_1
this.Control[]={this.dw_fs,&
this.cb_18,&
this.cb_9,&
this.cb_4,&
this.cb_7,&
this.st_5,&
this.em_1,&
this.cb_6,&
this.cb_5,&
this.cb_fermer,&
this.cb_3,&
this.sle_3,&
this.st_11,&
this.st_3,&
this.cb_2,&
this.sle_2,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.gb_1,&
this.st_4,&
this.sle_1,&
this.st_10,&
this.gb_3,&
this.dw_fst,&
this.r_1}
end on

on w_technique.destroy
destroy(this.dw_fs)
destroy(this.cb_18)
destroy(this.cb_9)
destroy(this.cb_4)
destroy(this.cb_7)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_fermer)
destroy(this.cb_3)
destroy(this.sle_3)
destroy(this.st_11)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_10)
destroy(this.gb_3)
destroy(this.dw_fst)
destroy(this.r_1)
end on

event open;var_code_local = message.doubleparm
centrer(this)
end event

event key;GraphicObject which_control


if key = KeyEnter! then
	which_control = GetFocus()					//quelle zone de saisie a le focus ?
	if TypeOf(which_control) = SingleLineEdit! then	//si c une SLE alors ...
		choose case which_control.Classname()			//a qui ont parle ?
			case "sle_1"							//trigger event sur le bon bouton OK
				cb_1.TriggerEvent(Clicked!)
			case "sle_2"
				cb_2.TriggerEvent(Clicked!)
			case "sle_3"
				cb_3.TriggerEvent(Clicked!)
		end choose
	end if
end if

end event

type dw_fs from datawindow within w_technique
integer x = 2606
integer y = 1536
integer width = 823
integer height = 480
integer taborder = 50
string title = "none"
string dataobject = "dw_feuille_soins"
boolean border = false
boolean livescroll = true
end type

type cb_18 from commandbutton within w_technique
integer x = 2167
integer y = 2064
integer width = 850
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "test feuille soins tableau"
end type

event clicked;dw_fs.settransobject(SQLCA)
dw_fs.retrieve(751)
dw_fst.settransobject(SQLCA)
dw_fst.retrieve("O")

long job
job = PrintOpen( )

dw_fs.print(job, 0, 0)
dw_fst.print(job, 46, 3024)

PrintClose(job)
end event

type cb_9 from commandbutton within w_technique
integer x = 1152
integer y = 408
integer width = 576
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Export XML"
end type

event clicked;string	nom_fenetre
window	w_dev


if sle_2.text = "" then
	messagebox("INFORMATION ...","Veuillez entrer le nom du praticien~nsuivi du numéro de page.")
	sle_2.setfocus()
else
	nom_fenetre = st_2.text + sle_2.text
	Open(w_dev,nom_fenetre)
	f.export_xml(w_dev)
	close(w_dev)
end if
end event

type cb_4 from commandbutton within w_technique
integer x = 1646
integer y = 744
integer width = 878
integer height = 120
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recharger Serial d~'origine"
end type

event clicked;serial_restaurer()			//restaure la var globale "serial"
end event

type cb_7 from commandbutton within w_technique
integer x = 1783
integer y = 456
integer width = 869
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Liste maquette des DD(P)LB"
end type

event clicked;string	nom_fenetre
window	w_dev


if sle_2.text = "" then	//va t'on plus loing ?
	messagebox("INFORMATION ...","Veuillez entrer le nom du praticien~nsuivi du numéro de page.")
	sle_2.setfocus()
else
	//open(w_cherche)							//recherche d'un patient
	//if var_suite then
		nom_fenetre = st_2.text + sle_2.text	//init var
		Open(w_dev,nom_fenetre)		//ouvre la fenètre
		f.ddlb_maquette(w_dev)			//créer sur le bureau le fichier text pour maquette
		close(w_dev)					//ferme la fenêtre
	//end if
end if
end event

type st_5 from statictext within w_technique
integer x = 503
integer y = 532
integer width = 914
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Position du caractère de départ :"
boolean focusrectangle = false
end type

type em_1 from editmask within w_technique
integer x = 1417
integer y = 532
integer width = 320
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
string minmax = "~~65535"
end type

type cb_6 from commandbutton within w_technique
integer x = 1783
integer y = 532
integer width = 869
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Script fonctions INIT / SAVE"
end type

event clicked;string	nom_fenetre
window	w_dev


if sle_2.text = "" then	//va t'on plus loing ?
	messagebox("INFORMATION ...","Veuillez entrer le nom du praticien~nsuivi du numéro de page.")
	sle_2.setfocus()
else
	//open(w_cherche)							//recherche d'un patient
	//if var_suite then
		nom_fenetre = st_2.text + sle_2.text	//init var
		Open(w_dev,nom_fenetre)						//ouvre la fenètre
		f.script_init(w_dev,long(em_1.text))	//créer sur le bureau le fichier text du script
		close(w_dev)									//ferme la fenêtre
	//end if
end if

end event

type cb_5 from commandbutton within w_technique
integer x = 1783
integer y = 380
integer width = 869
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Photo d~'écran maquette"
end type

event clicked;string	nom_fenetre
window	w_dev


if sle_2.text = "" then	//va t'on plus loing ?
	messagebox("INFORMATION ...","Veuillez entrer le nom du praticien~nsuivi du numéro de page.")
	sle_2.setfocus()
else
	//open(w_cherche)							//recherche d'un patient
	//if var_suite then
		nom_fenetre = st_2.text + sle_2.text	//init var
		Open(w_dev,nom_fenetre)						//ouvre la fenètre
		w_dev.title = " "								//on vide le titre
		f.photo_init(w_dev)							//on place le nbr max de carac par contrôle
	//end if
end if

end event

type cb_fermer from commandbutton within w_technique
integer x = 1893
integer y = 1368
integer width = 795
integer height = 144
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_technique
integer x = 1234
integer y = 760
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Go !"
end type

event clicked;if sle_3.text = "" then		//va t'on plus loing ?
	messagebox("INFORMATION ...","Veuillez entrer un Numéro de série.")
	sle_3.setfocus()
else
	save_serial = serial								//init var de sauvegarde
	open(w_cherche)									//recherche d'un patient
	serial = st_11.text + sle_3.text				//on place le nouveau num série
	//if var_suite then commentaires_cliniques()	//lance la fonction globale "Commentaires_Cliniques"
	m_orthokis_2020.ouvrir_mdi(9)
end if

end event

type sle_3 from singlelineedit within w_technique
integer x = 869
integer y = 760
integer width = 320
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_technique
integer x = 731
integer y = 760
integer width = 137
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "87"
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_3 from statictext within w_technique
integer x = 137
integer y = 152
integer width = 914
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ouverture d~'un menu spécifique :"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_technique
integer x = 1783
integer y = 304
integer width = 869
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Go !"
end type

event clicked;string	nom_fenetre
window	w_dev


if sle_2.text = "" then	//va t'on plus loing ?
	messagebox("INFORMATION ...","Veuillez entrer le nom du praticien~nsuivi du numéro de page.")
	sle_2.setfocus()
else
	open(w_cherche)							//recherche d'un patient
	if var_suite then
		nom_fenetre = st_2.text + sle_2.text					//init var
		//opensheet(w_dev, nom_fenetre,w_mdi,0,original!)		//open de la fenètre
		OpenWithParm(w_dev,VAR_CODE,nom_fenetre)
	end if
end if

end event

type sle_2 from singlelineedit within w_technique
integer x = 1143
integer y = 304
integer width = 594
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_technique
integer x = 640
integer y = 304
integer width = 503
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "w_diagnos_maj_"
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_technique
integer x = 137
integer y = 304
integer width = 503
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Page spécifique :"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_technique
integer x = 1783
integer y = 152
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Go !"
end type

event clicked;//va t'on plus loing ?
if sle_1.text = "" then
	messagebox("INFORMATION ...","Veuillez entrer un Numéro de série.")
	sle_1.setfocus()
else
	save_serial = serial						//init var de sauvegarde
	open(w_cherche)							//recherche d'un patient
	serial = st_4.text + sle_1.text		//on place le nouveau num série
	if var_suite then pages_cliniques()	//lance la fonction globale "Page_Cliniques"
	serial_restaurer()						//restaure la var globale "serial"
end if

end event

type gb_1 from groupbox within w_technique
integer x = 46
integer y = 76
integer width = 2651
integer height = 580
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Pages Cliniques"
end type

type st_4 from statictext within w_technique
integer x = 1097
integer y = 152
integer width = 137
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "87"
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_technique
integer x = 1234
integer y = 152
integer width = 320
integer height = 76
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_technique
integer x = 137
integer y = 760
integer width = 594
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fenètre spécifique :"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_technique
integer x = 46
integer y = 684
integer width = 2651
integer height = 228
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Commentaires Cliniques"
end type

type dw_fst from datawindow within w_technique
integer x = 1728
integer y = 1536
integer width = 823
integer height = 480
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_feuille_soin_tableau"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type r_1 from rectangle within w_technique
integer linethickness = 4
long fillcolor = 12639424
integer x = 1399
integer y = 1512
integer width = 2167
integer height = 672
end type

