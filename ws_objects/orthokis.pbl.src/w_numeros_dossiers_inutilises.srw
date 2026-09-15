$PBExportHeader$w_numeros_dossiers_inutilises.srw
forward
global type w_numeros_dossiers_inutilises from w_fenetre_arakis
end type
type cb_lancer from uo_picturebutton_390x120 within w_numeros_dossiers_inutilises
end type
type cb_imprimer from uo_picturebutton_390x120 within w_numeros_dossiers_inutilises
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_numeros_dossiers_inutilises
end type
type uo_1 from resize_fenetre within w_numeros_dossiers_inutilises
end type
type dw_liste from datawindow within w_numeros_dossiers_inutilises
end type
type st_3 from statictext within w_numeros_dossiers_inutilises
end type
type st_2 from statictext within w_numeros_dossiers_inutilises
end type
type st_1 from statictext within w_numeros_dossiers_inutilises
end type
type em_max from editmask within w_numeros_dossiers_inutilises
end type
type em_min from editmask within w_numeros_dossiers_inutilises
end type
end forward

global type w_numeros_dossiers_inutilises from w_fenetre_arakis
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
cb_lancer cb_lancer
cb_imprimer cb_imprimer
pb_1 pb_1
uo_1 uo_1
dw_liste dw_liste
st_3 st_3
st_2 st_2
st_1 st_1
em_max em_max
em_min em_min
end type
global w_numeros_dossiers_inutilises w_numeros_dossiers_inutilises

event open;call super::open;double min,max

SELECT min(numero_dossier),max(numero_dossier) INTO :min,:max 
FROM patient WHERE numero_dossier <= 100000000;

em_max.text = string(max)
em_min.text = string(min)

uo_1.taille(this)
end event

on w_numeros_dossiers_inutilises.create
int iCurrent
call super::create
this.cb_lancer=create cb_lancer
this.cb_imprimer=create cb_imprimer
this.pb_1=create pb_1
this.uo_1=create uo_1
this.dw_liste=create dw_liste
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_max=create em_max
this.em_min=create em_min
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_lancer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.dw_liste
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.em_max
this.Control[iCurrent+10]=this.em_min
end on

on w_numeros_dossiers_inutilises.destroy
call super::destroy
destroy(this.cb_lancer)
destroy(this.cb_imprimer)
destroy(this.pb_1)
destroy(this.uo_1)
destroy(this.dw_liste)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_max)
destroy(this.em_min)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_numeros_dossiers_inutilises
end type

type cb_lancer from uo_picturebutton_390x120 within w_numeros_dossiers_inutilises
integer x = 1147
integer y = 1980
integer width = 489
integer taborder = 41
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
if MessageBox("ATTENTION !","Cette opération risque~nDE PRENDRE DU TEMPS !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	open(w_patience)
	dw_liste.reset()
	double min,max,cour,prec

	max = double(em_max.text)
	min = double(em_min.text)

	boolean fin
	fin = false

	 DECLARE curs_p CURSOR FOR  
	  SELECT "patient"."numero_dossier"  
	    FROM "patient"  	
		WHERE numero_dossier between :min and :max
	ORDER BY "patient"."numero_dossier" ASC  ;

	Open curs_p ;

	FETCH curs_p INTO :cour ;
	prec = cour

	// Cas du premier dossier trouvé 
	if cour > min then
//Messagebox("courant 1",cour)
		dw_liste.insertrow(0)
		dw_liste.scrolltorow(99999)
		dw_liste.setitem(dw_liste.getrow(),"min",string(min))
		dw_liste.setitem(dw_liste.getrow(),"max",string(cour - 1))
	end if

	do while not fin and SQLCA.sqlcode = 0

//Messagebox("courant 2",cour)
		if  abs(prec - cour ) > 1 then
			// Il y a un trou !!
			dw_liste.insertrow(0)
			dw_liste.scrolltorow(99999)
			dw_liste.setitem(dw_liste.getrow(),"min",string(prec + 1))
			dw_liste.setitem(dw_liste.getrow(),"max",string(cour - 1))
		end if
		prec = cour ;

//		if Messagebox("Question","On continue ?",Question!,Yesno!,2) = 2 then
//			fin = true
//		end if

		FETCH curs_p INTO :cour ;

	LOOP

	// Cas du dernier dossier trouvé 
	if cour < max then
//Messagebox("courant 3",cour)
		dw_liste.insertrow(0)
		dw_liste.scrolltorow(99999)
		dw_liste.setitem(dw_liste.getrow(),"min",string(cour + 1))
		dw_liste.setitem(dw_liste.getrow(),"max",string(max))
	end if

	CLOSE curs_p ;
	close(w_patience)

end if


end event

type cb_imprimer from uo_picturebutton_390x120 within w_numeros_dossiers_inutilises
integer x = 1659
integer y = 1980
integer width = 489
integer taborder = 41
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_numeros_dossiers_inutilises
integer x = 2171
integer y = 1980
integer width = 489
integer taborder = 41
boolean default = true
end type

event clicked;

fermer_fenetre(parent)


end event

type uo_1 from resize_fenetre within w_numeros_dossiers_inutilises
boolean visible = false
integer x = 1842
integer y = 340
integer taborder = 31
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste from datawindow within w_numeros_dossiers_inutilises
string tag = "no resize centrer"
integer x = 736
integer y = 232
integer width = 2176
integer height = 1644
integer taborder = 30
string dataobject = "dw_numeros_dossiers_inutilises"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type st_3 from statictext within w_numeros_dossiers_inutilises
integer x = 32
integer y = 32
integer width = 736
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Bornes d~'examen :"
end type

type st_2 from statictext within w_numeros_dossiers_inutilises
integer x = 1719
integer y = 44
integer width = 206
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Au N°"
end type

type st_1 from statictext within w_numeros_dossiers_inutilises
integer x = 891
integer y = 44
integer width = 192
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Du N°"
end type

type em_max from editmask within w_numeros_dossiers_inutilises
integer x = 1975
integer y = 32
integer width = 498
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
string mask = "#########"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type em_min from editmask within w_numeros_dossiers_inutilises
integer x = 1125
integer y = 32
integer width = 498
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
string mask = "#########"
boolean spin = true
string displaydata = ""
double increment = 1
end type

