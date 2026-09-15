$PBExportHeader$w_numeros_moulages_inutilises.srw
forward
global type w_numeros_moulages_inutilises from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_numeros_moulages_inutilises
end type
type cb_imprimer from uo_picturebutton_390x120 within w_numeros_moulages_inutilises
end type
type cb_lancer from uo_picturebutton_390x120 within w_numeros_moulages_inutilises
end type
type uo_1 from resize_fenetre within w_numeros_moulages_inutilises
end type
type dw_moulage from datawindow within w_numeros_moulages_inutilises
end type
type dw_liste from datawindow within w_numeros_moulages_inutilises
end type
type em_max from editmask within w_numeros_moulages_inutilises
end type
type em_min from editmask within w_numeros_moulages_inutilises
end type
type st_4 from statictext within w_numeros_moulages_inutilises
end type
type st_5 from statictext within w_numeros_moulages_inutilises
end type
type st_1 from statictext within w_numeros_moulages_inutilises
end type
end forward

global type w_numeros_moulages_inutilises from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 4219
integer height = 2200
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
long backcolor = 15780518
pb_1 pb_1
cb_imprimer cb_imprimer
cb_lancer cb_lancer
uo_1 uo_1
dw_moulage dw_moulage
dw_liste dw_liste
em_max em_max
em_min em_min
st_4 st_4
st_5 st_5
st_1 st_1
end type
global w_numeros_moulages_inutilises w_numeros_moulages_inutilises

type variables


double min_moulage,max_moulage
end variables

event open;call super::open;string moulage
integer ligne
double mou

uo_1.taille(this)

OPEN (w_patience)

min_moulage = 0
max_moulage = 0


// On constitue une liste dans dw_moulage qui servira de base ensuite à la recherche proprement dite
// ça sert AUSSI à déterminer le min et le max
 DECLARE curs_mou CURSOR FOR  
  SELECT "patient"."moulage"  
    FROM "patient"
 ORDER BY "patient"."moulage" ;

OPEN curs_mou ;

FETCH curs_mou INTO :moulage ;

DO WHILE SQLCA.SQLcode = 0 
	mou = double(moulage)
	IF IsNull(moulage) THEN
		mou = 0
	END IF
	ligne = dw_moulage.InsertRow(0)
	dw_moulage.SetItem(ligne,"moulage",mou)
	IF mou < min_moulage THEN
		min_moulage = mou
	END IF
	IF mou > max_moulage THEN
		max_moulage = mou
	END IF
	
	FETCH curs_mou INTO :moulage ;
LOOP

CLOSE curs_mou ;

CLOSE (w_patience)

em_max.text = string(max_moulage)
em_min.text = string(min_moulage)

// On trie la DataWindow sur moulage 
dw_moulage.SetSort("#1 A")
dw_moulage.Sort()

end event

on w_numeros_moulages_inutilises.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.uo_1=create uo_1
this.dw_moulage=create dw_moulage
this.dw_liste=create dw_liste
this.em_max=create em_max
this.em_min=create em_min
this.st_4=create st_4
this.st_5=create st_5
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_lancer
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.dw_moulage
this.Control[iCurrent+6]=this.dw_liste
this.Control[iCurrent+7]=this.em_max
this.Control[iCurrent+8]=this.em_min
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.st_1
end on

on w_numeros_moulages_inutilises.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.uo_1)
destroy(this.dw_moulage)
destroy(this.dw_liste)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_1)
end on

event resize;uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_numeros_moulages_inutilises
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_numeros_moulages_inutilises
integer x = 2254
integer y = 1904
integer width = 489
integer taborder = 70
boolean default = true
end type

event clicked;
fermer_fenetre(parent)


end event

type cb_imprimer from uo_picturebutton_390x120 within w_numeros_moulages_inutilises
integer x = 1705
integer y = 1904
integer width = 489
integer taborder = 52
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_lancer from uo_picturebutton_390x120 within w_numeros_moulages_inutilises
integer x = 1157
integer y = 1904
integer width = 489
integer height = 152
integer taborder = 42
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double min,max,cour,prec
string cours
long i, tot


// Vérification de la borne
max = double(em_max.text)
min = double(em_min.text)

if min < min_moulage then
	Messagebox("ATTENTION","Il n'y a pas de numéro de moulage inférieur à " + string(min_moulage) + ".~n~nInutile de mettre la borne minimale aussi bas.")
	em_min.text = string( min_moulage )
	min = min_moulage
end if

if max_moulage < max then
	Messagebox("ATTENTION","Il n'y a pas de numéro de moulage supérieur à " + string(max_moulage) + ".~n~nInutile de mettre la borne maximale aussi haut.")
	em_max.text = string( max_moulage )
	max = max_moulage
end if
	

if MessageBox("ATTENTION !","Cette opération risque~nDE PRENDRE DU TEMPS !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	open(w_patience)
	dw_liste.reset()

	max = double(em_max.text)
	min = double(em_min.text)

	IF IsNull(min) THEN
		min = 0
	END IF 	
	IF IsNull(max) THEN
		max = 0
	END IF 	

	boolean fin
	fin = false

	tot = dw_moulage.rowcount() 
	
	i = 1
	cour = - 999999
	DO WHILE cour < min 
		cour = dw_moulage.getItemNumber(i,"moulage")
		i += 1
	LOOP	

	prec = cour

	// Cas du premier dossier trouvé 
	if cour > min then
		//Messagebox("courant 1",cour)
		dw_liste.insertrow(0)
		dw_liste.scrolltorow(99999)
		dw_liste.setitem(dw_liste.getrow(),"min",min)
		dw_liste.setitem(dw_liste.getrow(),"max",cour - 1)
	end if

	do while not fin AND cour < max

		//Messagebox("courant 2",cour)
		if  abs(prec - cour ) > 1 then
			// Il y a un trou !!
			dw_liste.insertrow(0)
			dw_liste.scrolltorow(99999)
			dw_liste.setitem(dw_liste.getrow(),"min",prec + 1)
			dw_liste.setitem(dw_liste.getrow(),"max",cour - 1)
		end if
		prec = cour ;

		if i <= tot then
			cour = dw_moulage.getItemNumber(i,"moulage")
			i += 1
		else
			fin = true
		end if
	LOOP

	// Cas du dernier dossier trouvé 
	if cour = max and prec + 1 <= max - 1 then
		dw_liste.insertrow(0)
		dw_liste.scrolltorow(99999)
		dw_liste.setitem(dw_liste.getrow(),"min",prec + 1)
		dw_liste.setitem(dw_liste.getrow(),"max",max - 1)
	end if


	close(w_patience)

end if


end event

type uo_1 from resize_fenetre within w_numeros_moulages_inutilises
boolean visible = false
integer x = 2039
integer y = 344
integer taborder = 32
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_moulage from datawindow within w_numeros_moulages_inutilises
boolean visible = false
integer x = 128
integer y = 332
integer width = 494
integer height = 496
integer taborder = 40
string dataobject = "dw_numeros_moulages_inter"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_numeros_moulages_inutilises
string tag = "no resize centrer"
integer x = 1280
integer y = 212
integer width = 1307
integer height = 1548
integer taborder = 30
string dataobject = "dw_numeros_moulages_inutilises"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type em_max from editmask within w_numeros_moulages_inutilises
integer x = 1975
integer y = 32
integer width = 439
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######0"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "-9999~~"
end type

type em_min from editmask within w_numeros_moulages_inutilises
integer x = 1125
integer y = 32
integer width = 439
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######0"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "-9999~~"
end type

type st_4 from statictext within w_numeros_moulages_inutilises
integer x = 882
integer y = 36
integer width = 201
integer height = 92
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du N°"
end type

type st_5 from statictext within w_numeros_moulages_inutilises
integer x = 1737
integer y = 36
integer width = 219
integer height = 92
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au N°"
end type

type st_1 from statictext within w_numeros_moulages_inutilises
integer x = 37
integer y = 36
integer width = 722
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Bornes d~'examen :"
end type

