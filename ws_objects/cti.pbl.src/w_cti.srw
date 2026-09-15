$PBExportHeader$w_cti.srw
forward
global type w_cti from window
end type
type ole_phonepc from olecustomcontrol within w_cti
end type
type cb_masquer from commandbutton within w_cti
end type
type cb_reprise from commandbutton within w_cti
end type
type cb_garde from commandbutton within w_cti
end type
type sle_numero from singlelineedit within w_cti
end type
type cb_appeler from commandbutton within w_cti
end type
type st_entrant from statictext within w_cti
end type
type st_sortant from statictext within w_cti
end type
type cb_raccrocher from commandbutton within w_cti
end type
type cb_prendre from commandbutton within w_cti
end type
type cb_restart from commandbutton within w_cti
end type
type st_dernier_appel from statictext within w_cti
end type
type em_compteur from editmask within w_cti
end type
type st_libre from statictext within w_cti
end type
type ole_phonepc11111111 from olecustomcontrol within w_cti
end type
type cb_fermer from commandbutton within w_cti
end type
type gb_etat from groupbox within w_cti
end type
type gb_1 from groupbox within w_cti
end type
type st_occupee from statictext within w_cti
end type
type gb_2 from groupbox within w_cti
end type
type p_1 from picture within w_cti
end type
end forward

global type w_cti from window
integer width = 375
integer height = 452
boolean titlebar = true
string title = "Lien CTI Orthokis"
boolean resizable = true
long backcolor = 15780518
ole_phonepc ole_phonepc
cb_masquer cb_masquer
cb_reprise cb_reprise
cb_garde cb_garde
sle_numero sle_numero
cb_appeler cb_appeler
st_entrant st_entrant
st_sortant st_sortant
cb_raccrocher cb_raccrocher
cb_prendre cb_prendre
cb_restart cb_restart
st_dernier_appel st_dernier_appel
em_compteur em_compteur
st_libre st_libre
ole_phonepc11111111 ole_phonepc11111111
cb_fermer cb_fermer
gb_etat gb_etat
gb_1 gb_1
st_occupee st_occupee
gb_2 gb_2
p_1 p_1
end type
global w_cti w_cti

type variables

// pour le temps de ligne occupée
time compteur

// est ce qu'on est occupé
boolean en_communication

// pour savoir s'il y a desjà eu des appels entrant => affichage ou non de temps du dernier appel
boolean appels_entrants

// L'appel en cours estil entrant ou sortant
boolean appel_sortant, appel_entrant

end variables

forward prototypes
public subroutine ligne_libre (boolean libre)
end prototypes

public subroutine ligne_libre (boolean libre);if libre then
//	// la ligne est libre

	en_communication = false

//	ligne_libre = true
//	
	appel_entrant = false
	appel_sortant = false
	st_libre.visible = true
	st_occupee.visible = false
	em_compteur.visible = false
//	cb_decrocher.enabled = false
//	cb_raccrocher.enabled = false
	if appels_entrants then
		st_dernier_appel.text = "Le dernier appel a duré : "+em_compteur.text
		st_dernier_appel.visible = true
	end if
else
	// la ligne est occupée
//	ligne_libre = false
	
	appels_entrants = true
	st_libre.visible = false
	st_occupee.visible = true	
	em_compteur.visible = true
//	cb_decrocher.enabled = false
//	cb_raccrocher.enabled = true
	compteur = now()
end if
end subroutine

on w_cti.create
this.ole_phonepc=create ole_phonepc
this.cb_masquer=create cb_masquer
this.cb_reprise=create cb_reprise
this.cb_garde=create cb_garde
this.sle_numero=create sle_numero
this.cb_appeler=create cb_appeler
this.st_entrant=create st_entrant
this.st_sortant=create st_sortant
this.cb_raccrocher=create cb_raccrocher
this.cb_prendre=create cb_prendre
this.cb_restart=create cb_restart
this.st_dernier_appel=create st_dernier_appel
this.em_compteur=create em_compteur
this.st_libre=create st_libre
this.ole_phonepc11111111=create ole_phonepc11111111
this.cb_fermer=create cb_fermer
this.gb_etat=create gb_etat
this.gb_1=create gb_1
this.st_occupee=create st_occupee
this.gb_2=create gb_2
this.p_1=create p_1
this.Control[]={this.ole_phonepc,&
this.cb_masquer,&
this.cb_reprise,&
this.cb_garde,&
this.sle_numero,&
this.cb_appeler,&
this.st_entrant,&
this.st_sortant,&
this.cb_raccrocher,&
this.cb_prendre,&
this.cb_restart,&
this.st_dernier_appel,&
this.em_compteur,&
this.st_libre,&
this.ole_phonepc11111111,&
this.cb_fermer,&
this.gb_etat,&
this.gb_1,&
this.st_occupee,&
this.gb_2,&
this.p_1}
end on

on w_cti.destroy
destroy(this.ole_phonepc)
destroy(this.cb_masquer)
destroy(this.cb_reprise)
destroy(this.cb_garde)
destroy(this.sle_numero)
destroy(this.cb_appeler)
destroy(this.st_entrant)
destroy(this.st_sortant)
destroy(this.cb_raccrocher)
destroy(this.cb_prendre)
destroy(this.cb_restart)
destroy(this.st_dernier_appel)
destroy(this.em_compteur)
destroy(this.st_libre)
destroy(this.ole_phonepc11111111)
destroy(this.cb_fermer)
destroy(this.gb_etat)
destroy(this.gb_1)
destroy(this.st_occupee)
destroy(this.gb_2)
destroy(this.p_1)
end on

event open;
ole_PhonePc.object.activerPhonePc = true


appels_entrants = false
appel_entrant = false
appel_sortant = false



ligne_libre(true)

st_sortant.backcolor = 36863
st_entrant.backcolor = 36863

compteur = now()
timer(1)






end event

event close;

ole_PhonePc.object.activerPhonePc = false
end event

event timer;
if em_compteur.visible then
	long sec, h,m,s

	sec = secondsAfter(compteur, now())

	h = int( sec / 3600)
	m = int( (sec - (h * 3600) ) / 60 )
	s = sec - h * 3600 - m * 60
	em_compteur.text = string(time( h, m, s))
end if

end event

type ole_phonepc from olecustomcontrol within w_cti
event evtcallerid ( string stdata )
event evtcalledid ( string stdata )
event evtidle ( )
event evtconnected ( )
event evtinterface ( )
event evtidcall ( long nidcall )
event evtpopcall ( integer ntypecall )
event evtpopinfo ( string stnumtel )
event evtpopfiche ( string stnumtel )
event evtcallsecondaire ( long nidcall )
event evtnewcall ( long nidcall )
event evtfunctions ( integer nidcall,  string stinfo )
event evtcareponse ( string stcde,  string streponse )
event evtcadossier ( integer nidcall,  string stdossier )
event evtcagroupe ( integer nidcall,  string stgroupe )
event evtcagroupeorg ( integer nidcall,  string stgroupeorg )
event evtcawatchdog ( )
event evtcastateagent ( integer nstate )
event evtnbcallattente ( integer nnbcall )
event evtcacampagneid ( integer nidcall,  string stcampgneid )
boolean visible = false
integer x = 393
integer y = 272
integer width = 846
integer height = 164
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_cti.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event evtcallerid(string stdata);



// il y a un appel entrant 
// Test supprimé en V2015 car pb chez Pic et Vaast
// if ole_phonepc.object.Et_PrendreLigne() then

	// lecture du nombre minimal pour prise en compte des appels
	long nb_ignorer
	nb_ignorer = long(profilestring(dir_ini+inifile_orthokis,"CTI","ignorer",""))
	string numero_entrant
	
	
	// Réception d'un appel 
	//------------------------------
	
	
	// on enleve tout ce qui n'est pas alphanumérique
	numero_entrant = espace(trim(stdata))
	
	// On ne gère pas les appels internes <  x chiffres
	if len(trim(numero_entrant)) > nb_ignorer then
		appel_entrant = true 
		st_entrant.visible = true
		
		openWithParm(w_gestion_appel_entrant,numero_entrant)
	end if
	
	
	
//end if

end event

event evtidle();
//MessageBox("Trace","EvtIdle")

ligne_libre(true)
end event

event evtconnected();

ligne_libre(false)
//MessageBox("Trace","EvtConnected")
end event

event evtinterface();// changement dans l'interface

if ole_phonepc.object.Et_Appeler() then
	cb_appeler.enabled = true
else
	cb_appeler.enabled = false
end if

if ole_phonepc.object.Et_Raccrocher() then
	cb_raccrocher.enabled = true
else
	cb_raccrocher.enabled = false
end if


if ole_phonepc.object.Et_PrendreLigne() then
	cb_prendre.enabled = true
else
	cb_prendre.enabled = false
end if


if ole_phonepc.object.Et_Garde() then
	cb_garde.enabled = true
else
	cb_garde.enabled = false
end if


if ole_phonepc.object.Et_reprise() then
	cb_reprise.enabled = true
else
	cb_reprise.enabled = false
end if

//parent.show()




end event

type cb_masquer from commandbutton within w_cti
integer x = 9
integer y = 192
integer width = 315
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Masquer"
end type

event clicked;
parent.hide()
end event

type cb_reprise from commandbutton within w_cti
integer x = 2176
integer y = 556
integer width = 366
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Reprise"
end type

event clicked;

// Reprise de l'appel
//-------------------------

ole_phonepc.object.reprise()

end event

type cb_garde from commandbutton within w_cti
integer x = 1787
integer y = 564
integer width = 366
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Garde"
end type

event clicked;

// Garde de l'appel
//----------------------

ole_phonepc.object.garde()

end event

type sle_numero from singlelineedit within w_cti
integer x = 1184
integer y = 808
integer width = 1061
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_appeler from commandbutton within w_cti
integer x = 727
integer y = 800
integer width = 366
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appeler"
end type

event clicked;
string numero

numero = sle_numero.text

	
	// on ajoute "0" en dur comme préfixe
	
	//numero = "0"+numero
	
	if MessageBox("Confirmation","Vous allez appeler le N°"+numero+"~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

		appel_sortant = true
		st_sortant.visible = true
		ole_phonepc.object.compose(numero)
		
	end if

end event

type st_entrant from statictext within w_cti
boolean visible = false
integer x = 1522
integer y = 132
integer width = 1102
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
string text = "Appel Entrant"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_sortant from statictext within w_cti
boolean visible = false
integer x = 1522
integer y = 132
integer width = 1102
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 33554431
string text = "Appel Sortant"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_raccrocher from commandbutton within w_cti
integer x = 1349
integer y = 968
integer width = 366
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Raccrocher"
end type

event clicked;

// Raccrocher de l'appel
//---------------------------------

ole_phonepc.object.raccrocher()




end event

type cb_prendre from commandbutton within w_cti
integer x = 919
integer y = 968
integer width = 366
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Prendre"
end type

event clicked;

// Prise de l'appel
//----------------------

ole_phonepc.object.prendre()

end event

type cb_restart from commandbutton within w_cti
integer x = 32
integer y = 952
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Restart"
end type

event clicked;ole_phonepc.object.restart()
end event

type st_dernier_appel from statictext within w_cti
boolean visible = false
integer x = 1563
integer y = 272
integer width = 1623
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type em_compteur from editmask within w_cti
boolean visible = false
integer x = 2857
integer y = 112
integer width = 480
integer height = 112
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm:ss"
end type

type st_libre from statictext within w_cti
boolean visible = false
integer x = 1522
integer y = 132
integer width = 1102
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65280
string text = "Ligne Libre"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_phonepc11111111 from olecustomcontrol within w_cti
event evtcallerid ( string stdata )
event evtcalledid ( string stdata )
event evtidle ( )
event evtconnected ( )
event evtinterface ( )
event evtidcall ( long nidcall )
event evtpopcall ( integer ntypecall )
event evtpopinfo ( string stnumtel )
event evtpopfiche ( string stnumtel )
boolean visible = false
integer x = 677
integer y = 64
integer width = 370
integer height = 164
integer taborder = 30
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_cti.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event evtcallerid(string stdata);



// il y a un appel entrant 
if ole_phonepc.object.Et_PrendreLigne() then

	// lecture du nombre minimal pour prise en compte des appels
	long nb_ignorer
	nb_ignorer = long(profilestring(dir_ini+inifile_orthokis,"CTI","ignorer",""))
	string numero_entrant
	
	
	// Réception d'un appel 
	//------------------------------
	
	
	// on enleve tout ce qui n'est pas alphanumérique
	numero_entrant = espace(trim(stdata))
	
	// On ne gère pas les appels internes <  x chiffres
	if len(trim(numero_entrant)) > nb_ignorer then
		appel_entrant = true 
		st_entrant.visible = true
		
		openWithParm(w_gestion_appel_entrant,numero_entrant)
	end if
	
	
	
end if

end event

event evtidle();
//MessageBox("Trace","EvtIdle")

ligne_libre(true)
end event

event evtconnected();

ligne_libre(false)
//MessageBox("Trace","EvtConnected")
end event

event evtinterface();// changement dans l'interface

if ole_phonepc.object.Et_Appeler() then
	cb_appeler.enabled = true
else
	cb_appeler.enabled = false
end if

if ole_phonepc.object.Et_Raccrocher() then
	cb_raccrocher.enabled = true
else
	cb_raccrocher.enabled = false
end if


if ole_phonepc.object.Et_PrendreLigne() then
	cb_prendre.enabled = true
else
	cb_prendre.enabled = false
end if


if ole_phonepc.object.Et_Garde() then
	cb_garde.enabled = true
else
	cb_garde.enabled = false
end if


if ole_phonepc.object.Et_reprise() then
	cb_reprise.enabled = true
else
	cb_reprise.enabled = false
end if

//parent.show()




end event

type cb_fermer from commandbutton within w_cti
boolean visible = false
integer x = 2537
integer y = 820
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;
close(parent)
end event

type gb_etat from groupbox within w_cti
integer x = 1486
integer y = 32
integer width = 1993
integer height = 360
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Etat de la ligne"
end type

type gb_1 from groupbox within w_cti
integer x = 1746
integer y = 468
integer width = 846
integer height = 252
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestion des Gardes"
end type

type st_occupee from statictext within w_cti
boolean visible = false
integer x = 1522
integer y = 132
integer width = 1102
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 255
string text = "Ligne Occupée"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_cti
integer x = 667
integer y = 704
integer width = 1632
integer height = 420
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestion des appels"
end type

type p_1 from picture within w_cti
integer x = 91
integer y = 28
integer width = 146
integer height = 132
boolean bringtotop = true
boolean originalsize = true
string picturename = "lc_telephone.png"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Dw_cti.bin 
2700000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000c43636c001d00ed300000003000001000000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004300000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003eeea8ffe4fa095922fa474b057f5ab6300000000c4360fb001d00ed3c43636c001d00ed3000000000000000000000000004f00430054004e004f00520053004c005600410053004500520054004100450000004d0000000000000000000000000000000000000000000000000000000001020024ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000002000000430000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff304650546e45540c6850587650656e6f4c040063027466656f540300050002707464695700b90368696548060274686763410e29657669746f6850726350656e00000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304650546e45540c6850587650656e6f4c040063027466656f540300050002707464695700b90368696548060274686763410e29657669746f6850726350656e000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Dw_cti.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
