$PBExportHeader$uo_barre.sru
forward
global type uo_barre from userobject
end type
type libelle from statictext within uo_barre
end type
type barre_ancienne from hprogressbar within uo_barre
end type
type barre from rectangle within uo_barre
end type
type r_1 from rectangle within uo_barre
end type
type r_2 from rectangle within uo_barre
end type
type r_3 from rectangle within uo_barre
end type
type r_4 from rectangle within uo_barre
end type
type r_5 from rectangle within uo_barre
end type
type r_6 from rectangle within uo_barre
end type
type r_7 from rectangle within uo_barre
end type
type r_8 from rectangle within uo_barre
end type
type r_9 from rectangle within uo_barre
end type
type r_10 from rectangle within uo_barre
end type
type r_11 from rectangle within uo_barre
end type
type r_12 from rectangle within uo_barre
end type
type r_13 from rectangle within uo_barre
end type
type r_14 from rectangle within uo_barre
end type
type r_15 from rectangle within uo_barre
end type
type r_16 from rectangle within uo_barre
end type
type r_17 from rectangle within uo_barre
end type
type r_18 from rectangle within uo_barre
end type
type r_19 from rectangle within uo_barre
end type
type r_20 from rectangle within uo_barre
end type
type r_21 from rectangle within uo_barre
end type
type r_22 from rectangle within uo_barre
end type
type r_23 from rectangle within uo_barre
end type
type r_24 from rectangle within uo_barre
end type
type r_25 from rectangle within uo_barre
end type
type r_26 from rectangle within uo_barre
end type
type r_27 from rectangle within uo_barre
end type
type r_28 from rectangle within uo_barre
end type
type r_29 from rectangle within uo_barre
end type
type r_30 from rectangle within uo_barre
end type
type r_31 from rectangle within uo_barre
end type
type r_32 from rectangle within uo_barre
end type
type r_33 from rectangle within uo_barre
end type
type r_34 from rectangle within uo_barre
end type
type r_35 from rectangle within uo_barre
end type
type r_36 from rectangle within uo_barre
end type
end forward

global type uo_barre from userobject
integer width = 599
integer height = 148
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event mousemove pbm_mousemove
libelle libelle
barre_ancienne barre_ancienne
barre barre
r_1 r_1
r_2 r_2
r_3 r_3
r_4 r_4
r_5 r_5
r_6 r_6
r_7 r_7
r_8 r_8
r_9 r_9
r_10 r_10
r_11 r_11
r_12 r_12
r_13 r_13
r_14 r_14
r_15 r_15
r_16 r_16
r_17 r_17
r_18 r_18
r_19 r_19
r_20 r_20
r_21 r_21
r_22 r_22
r_23 r_23
r_24 r_24
r_25 r_25
r_26 r_26
r_27 r_27
r_28 r_28
r_29 r_29
r_30 r_30
r_31 r_31
r_32 r_32
r_33 r_33
r_34 r_34
r_35 r_35
r_36 r_36
end type
global uo_barre uo_barre

type variables
date demande,accord,date_relative, date_donnee
integer numero_soin,duree
string lib
string mode
date debut_traitement
date date_reprise

double couleur_barre


string infos_popup = ''
string infos_complete = ''

double var_code_local
end variables

forward prototypes
public subroutine init_infos (double v_code_local)
end prototypes

public subroutine init_infos (double v_code_local);// Mise à jour de la string infos qui pourra être affichée et/ou popup

if France or luxembourg then
	string l, libmod, lib_donnee, lib_donnee2
	integer nb_mois
	date v_date_fin
	// Calculs du nombre de mois depuis la date en relatif :
	
	l = lib
	if mode = 'T' then
		if isnull(date_reprise) then
			libmod = "la date de début de traitement"
			nb_mois = round(DaysAfter(debut_traitement,demande) / 30 , 0) 
			//v_date_fin = Relativedate( debut_traitement, DaysAfter(debut_traitement,demande) + duree * 30)
			v_date_fin = Relativedate( debut_traitement, DaysAfter(debut_traitement,demande))
			v_date_fin = ajout_x_mois ( v_date_fin , duree )
		else
			libmod = "la date de reprise"
			nb_mois = round(DaysAfter(date_reprise,demande) / 30 , 0) 
			//v_date_fin = Relativedate( date_reprise, DaysAfter(date_reprise,demande) + duree * 30)
			v_date_fin = Relativedate( date_reprise, DaysAfter(date_reprise,demande))
			v_date_fin = ajout_x_mois ( v_date_fin , duree )
		end if
	
	else
		libmod = "la date de demande"
		nb_mois = round(DaysAfter(demande,today()) / 30 , 0) 
		if nb_mois > duree then
			nb_mois = duree
		end if
		//v_date_fin = relativedate(demande, duree * 30 )
			v_date_fin = ajout_x_mois ( demande , duree )
	end if
	
	
	if numero_soin > 0 then
		l = l + " N°"+string(numero_soin)
	end if
	
	if isnull (date_donnee) then
		lib_donnee = ""
		lib_donnee2 = ""
	else
		lib_donnee = " - Don. : " + string(date_donnee)
		lib_donnee2 = "~nDonnée le : " + string(date_donnee)
	end if
	
	if isnull(Accord) then
		infos_popup = l + " - Dde : "+string(Demande)+" - Fin : " + string(v_date_fin) +  lib_donnee
		infos_complete = l + " - Demande : "+string(Demande)+"~nFin : " + string(v_date_fin) +  lib_donnee2 +  "~n~n("+string(nb_mois)+" mois en relatif selon "+libmod+")"
	else
		infos_popup = l + " - Dde : "+string(Demande)+" - Acc : "+string(Accord)+" - Fin : " + string(v_date_fin)  +  lib_donnee
		infos_complete = l + " - Demande : "+string(Demande)+"~nAccord : "+string(Accord)+"~nFin : " + string(v_date_fin)  +  lib_donnee2 +   "~n~n("+string(nb_mois)+" mois  relatif selon "+libmod+")"
	end if
end if

if Belgique and duree = 1 then
	infos_popup =  lib+" du "+string(Demande)
	infos_complete = infos_popup 
end if


var_code_local = v_code_local

long cpt_rdv, cpt_abs, cpt_futur

if duree > 0 then
	// Stats du rdv
	
	select isnull(count(*), 0)  into :cpt_rdv from rdv where code = :v_code_local and cast(rdv as date) between :Demande and :v_date_fin ;
	
	// absents
	select isnull(count(*), 0)  into :cpt_abs from rdv, etat_rdv where rdv.code = :v_code_local and cast(rdv as date) between :Demande 
	and :v_date_fin and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'O' ;

	// rdv futurs non éliminés
	select isnull(count(*), 0)  into :cpt_futur from rdv, etat_rdv where rdv.code = :v_code_local and cast(rdv as date) between :Demande 
	and :v_date_fin and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' and cast(rdv as date) > cast(getdate() as date) ;
	
	string v_lib_next
	if cpt_futur > 1 then 
		v_lib_next = " futurs)"
	else
		v_lib_next = " futur)"
	end if
	
	infos_popup = infos_popup + " - " + string(cpt_rdv) + " rdv (" + string(cpt_abs) +" abs - "+ string(cpt_futur) + v_lib_next 
	infos_complete = infos_complete + "~n~nRendez-vous : " + string(cpt_rdv) + " rdv (" + string(cpt_abs) +" abs - "+ string(cpt_futur) + v_lib_next 
	
end if
end subroutine

on uo_barre.create
this.libelle=create libelle
this.barre_ancienne=create barre_ancienne
this.barre=create barre
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
this.r_5=create r_5
this.r_6=create r_6
this.r_7=create r_7
this.r_8=create r_8
this.r_9=create r_9
this.r_10=create r_10
this.r_11=create r_11
this.r_12=create r_12
this.r_13=create r_13
this.r_14=create r_14
this.r_15=create r_15
this.r_16=create r_16
this.r_17=create r_17
this.r_18=create r_18
this.r_19=create r_19
this.r_20=create r_20
this.r_21=create r_21
this.r_22=create r_22
this.r_23=create r_23
this.r_24=create r_24
this.r_25=create r_25
this.r_26=create r_26
this.r_27=create r_27
this.r_28=create r_28
this.r_29=create r_29
this.r_30=create r_30
this.r_31=create r_31
this.r_32=create r_32
this.r_33=create r_33
this.r_34=create r_34
this.r_35=create r_35
this.r_36=create r_36
this.Control[]={this.libelle,&
this.barre_ancienne,&
this.barre,&
this.r_1,&
this.r_2,&
this.r_3,&
this.r_4,&
this.r_5,&
this.r_6,&
this.r_7,&
this.r_8,&
this.r_9,&
this.r_10,&
this.r_11,&
this.r_12,&
this.r_13,&
this.r_14,&
this.r_15,&
this.r_16,&
this.r_17,&
this.r_18,&
this.r_19,&
this.r_20,&
this.r_21,&
this.r_22,&
this.r_23,&
this.r_24,&
this.r_25,&
this.r_26,&
this.r_27,&
this.r_28,&
this.r_29,&
this.r_30,&
this.r_31,&
this.r_32,&
this.r_33,&
this.r_34,&
this.r_35,&
this.r_36}
end on

on uo_barre.destroy
destroy(this.libelle)
destroy(this.barre_ancienne)
destroy(this.barre)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
destroy(this.r_5)
destroy(this.r_6)
destroy(this.r_7)
destroy(this.r_8)
destroy(this.r_9)
destroy(this.r_10)
destroy(this.r_11)
destroy(this.r_12)
destroy(this.r_13)
destroy(this.r_14)
destroy(this.r_15)
destroy(this.r_16)
destroy(this.r_17)
destroy(this.r_18)
destroy(this.r_19)
destroy(this.r_20)
destroy(this.r_21)
destroy(this.r_22)
destroy(this.r_23)
destroy(this.r_24)
destroy(this.r_25)
destroy(this.r_26)
destroy(this.r_27)
destroy(this.r_28)
destroy(this.r_29)
destroy(this.r_30)
destroy(this.r_31)
destroy(this.r_32)
destroy(this.r_33)
destroy(this.r_34)
destroy(this.r_35)
destroy(this.r_36)
end on

event rbuttondown;MessageBox("Information", infos_complete )


//if France then
//	string l, libmod
//	integer nb_mois
//	date v_date_fin
//	// Calculs du nombre de mois depuis la date en relatif :
//	
//	l = lib
//	if mode = 'T' then
//		if isnull(date_reprise) then
//			libmod = "la date de début de traitement"
//			nb_mois = round(DaysAfter(debut_traitement,demande) / 30 , 0) 
//			v_date_fin = Relativedate( debut_traitement, DaysAfter(debut_traitement,demande) + duree * 30)
//		else
//			libmod = "la date de reprise"
//			nb_mois = round(DaysAfter(date_reprise,demande) / 30 , 0) 
//			v_date_fin = Relativedate( date_reprise, DaysAfter(date_reprise,demande) + duree * 30)
//		end if
//	
//	else
//		libmod = "la date de demande"
//		nb_mois = round(DaysAfter(demande,today()) / 30 , 0) 
//		if nb_mois > duree then
//			nb_mois = duree
//		end if
//		v_date_fin = relativedate(demande, duree * 30 )
//	end if
//	
//	
//	if numero_soin > 0 then
//		l = l + " N°"+string(numero_soin)
//	end if
//	
//	
//	if isnull(Accord) then
//		MessageBox("Information",l+" - Demande : "+string(Demande)+"~nFin : " + string(v_date_fin) +"~n~n("+string(nb_mois)+" mois en relatif selon "+libmod+")")
//	else
//		MessageBox("Information",l+" - Demande : "+string(Demande)+"~nAccord : "+string(Accord)+"~nFin : " + string(v_date_fin) + "~n~n("+string(nb_mois)+" mois  relatif selon "+libmod+")")
//	end if
//end if
//
//if Belgique and duree = 1 then
//	MessageBox("Information",lib+" du "+string(Demande))
//end if
end event

event constructor;

colore_tous_objets(this)
end event

type libelle from statictext within uo_barre
integer y = 64
integer width = 302
integer height = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;parent.triggerevent(rbuttondown!)
end event

event rbuttondown;parent.triggerevent(rbuttondown!)
end event

type barre_ancienne from hprogressbar within uo_barre
integer y = 168
integer width = 585
integer height = 56
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

event rbuttondown;parent.triggerevent(rbuttondown!)
end event

event clicked;parent.triggerevent(rbuttondown!)
end event

type barre from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 134217730
integer y = 4
integer width = 585
integer height = 56
end type

type r_1 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 37
integer y = 348
integer width = 59
integer height = 56
end type

type r_2 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 41
integer y = 424
integer width = 59
integer height = 56
end type

type r_3 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 41
integer y = 496
integer width = 59
integer height = 56
end type

type r_4 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 41
integer y = 568
integer width = 59
integer height = 56
end type

type r_5 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 41
integer y = 640
integer width = 59
integer height = 56
end type

type r_6 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 155
integer y = 352
integer width = 59
integer height = 56
end type

type r_7 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 155
integer y = 428
integer width = 59
integer height = 56
end type

type r_8 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 155
integer y = 500
integer width = 59
integer height = 56
end type

type r_9 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 155
integer y = 572
integer width = 59
integer height = 56
end type

type r_10 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 155
integer y = 644
integer width = 59
integer height = 56
end type

type r_11 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 364
integer width = 59
integer height = 56
end type

type r_12 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 436
integer width = 59
integer height = 56
end type

type r_13 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 508
integer width = 59
integer height = 56
end type

type r_14 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 580
integer width = 59
integer height = 56
end type

type r_15 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 652
integer width = 59
integer height = 56
end type

type r_16 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 728
integer width = 59
integer height = 56
end type

type r_17 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 804
integer width = 59
integer height = 56
end type

type r_18 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 880
integer width = 59
integer height = 56
end type

type r_19 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 956
integer width = 59
integer height = 56
end type

type r_20 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1032
integer width = 59
integer height = 56
end type

type r_21 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1108
integer width = 59
integer height = 56
end type

type r_22 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1184
integer width = 59
integer height = 56
end type

type r_23 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1260
integer width = 59
integer height = 56
end type

type r_24 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1336
integer width = 59
integer height = 56
end type

type r_25 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1412
integer width = 59
integer height = 56
end type

type r_26 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1488
integer width = 59
integer height = 56
end type

type r_27 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1564
integer width = 59
integer height = 56
end type

type r_28 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1640
integer width = 59
integer height = 56
end type

type r_29 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1716
integer width = 59
integer height = 56
end type

type r_30 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1792
integer width = 59
integer height = 56
end type

type r_31 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1868
integer width = 59
integer height = 56
end type

type r_32 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 1944
integer width = 59
integer height = 56
end type

type r_33 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 2020
integer width = 59
integer height = 56
end type

type r_34 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 2096
integer width = 59
integer height = 56
end type

type r_35 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 2172
integer width = 59
integer height = 56
end type

type r_36 from rectangle within uo_barre
integer linethickness = 4
long fillcolor = 65280
integer x = 283
integer y = 2248
integer width = 59
integer height = 56
end type

