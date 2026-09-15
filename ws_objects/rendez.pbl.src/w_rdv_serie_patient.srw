$PBExportHeader$w_rdv_serie_patient.srw
forward
global type w_rdv_serie_patient from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_rdv_serie_patient
end type
type dw_serie_patient from datawindow within w_rdv_serie_patient
end type
type st_date_ddt from statictext within w_rdv_serie_patient
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_rdv_serie_patient
end type
type pb_annuler from uo_picturebutton_390x120 within w_rdv_serie_patient
end type
type pb_supprimer from uo_picturebutton_250x120 within w_rdv_serie_patient
end type
type dw_serie_theo from datawindow within w_rdv_serie_patient
end type
type dw_reels from datawindow within w_rdv_serie_patient
end type
type uo_1 from resize_fenetre within w_rdv_serie_patient
end type
type dw_tableau_reels from datawindow within w_rdv_serie_patient
end type
type rb_sans from radiobutton within w_rdv_serie_patient
end type
type rb_avec from radiobutton within w_rdv_serie_patient
end type
type rb_detail from radiobutton within w_rdv_serie_patient
end type
type rb_synthese from radiobutton within w_rdv_serie_patient
end type
type gb_rdv_elimine from groupbox within w_rdv_serie_patient
end type
type gb_rdv_detail from groupbox within w_rdv_serie_patient
end type
type gb_date_ddt from groupbox within w_rdv_serie_patient
end type
type gb_serie from groupbox within w_rdv_serie_patient
end type
end forward

global type w_rdv_serie_patient from w_fenetre_arakis
integer width = 4288
integer height = 2616
string title = "Gestion d~'une série de rendez-vous"
pb_fermer pb_fermer
dw_serie_patient dw_serie_patient
st_date_ddt st_date_ddt
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
pb_supprimer pb_supprimer
dw_serie_theo dw_serie_theo
dw_reels dw_reels
uo_1 uo_1
dw_tableau_reels dw_tableau_reels
rb_sans rb_sans
rb_avec rb_avec
rb_detail rb_detail
rb_synthese rb_synthese
gb_rdv_elimine gb_rdv_elimine
gb_rdv_detail gb_rdv_detail
gb_date_ddt gb_date_ddt
gb_serie gb_serie
end type
global w_rdv_serie_patient w_rdv_serie_patient

type variables


double var_code_local
date var_date_debut_traitement_local
end variables

on w_rdv_serie_patient.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_serie_patient=create dw_serie_patient
this.st_date_ddt=create st_date_ddt
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.pb_supprimer=create pb_supprimer
this.dw_serie_theo=create dw_serie_theo
this.dw_reels=create dw_reels
this.uo_1=create uo_1
this.dw_tableau_reels=create dw_tableau_reels
this.rb_sans=create rb_sans
this.rb_avec=create rb_avec
this.rb_detail=create rb_detail
this.rb_synthese=create rb_synthese
this.gb_rdv_elimine=create gb_rdv_elimine
this.gb_rdv_detail=create gb_rdv_detail
this.gb_date_ddt=create gb_date_ddt
this.gb_serie=create gb_serie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_serie_patient
this.Control[iCurrent+3]=this.st_date_ddt
this.Control[iCurrent+4]=this.pb_enregistrer
this.Control[iCurrent+5]=this.pb_annuler
this.Control[iCurrent+6]=this.pb_supprimer
this.Control[iCurrent+7]=this.dw_serie_theo
this.Control[iCurrent+8]=this.dw_reels
this.Control[iCurrent+9]=this.uo_1
this.Control[iCurrent+10]=this.dw_tableau_reels
this.Control[iCurrent+11]=this.rb_sans
this.Control[iCurrent+12]=this.rb_avec
this.Control[iCurrent+13]=this.rb_detail
this.Control[iCurrent+14]=this.rb_synthese
this.Control[iCurrent+15]=this.gb_rdv_elimine
this.Control[iCurrent+16]=this.gb_rdv_detail
this.Control[iCurrent+17]=this.gb_date_ddt
this.Control[iCurrent+18]=this.gb_serie
end on

on w_rdv_serie_patient.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_serie_patient)
destroy(this.st_date_ddt)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.pb_supprimer)
destroy(this.dw_serie_theo)
destroy(this.dw_reels)
destroy(this.uo_1)
destroy(this.dw_tableau_reels)
destroy(this.rb_sans)
destroy(this.rb_avec)
destroy(this.rb_detail)
destroy(this.rb_synthese)
destroy(this.gb_rdv_elimine)
destroy(this.gb_rdv_detail)
destroy(this.gb_date_ddt)
destroy(this.gb_serie)
end on

event open;call super::open;
var_code_local = Message.DoubleParm


double v_code_serie_rdv 
long v_cpt
boolean v_suite = true

select isnull(count(*),0) into :v_cpt from rdv_serie ;


if v_cpt = 0 then

	Messagebox("ATTENTION","Pour accéder à ce module vous devez d'abord définir des Séries de Rendez-vous (menu Tables, puis Series de Rendez-vous).")
	
else
	
	select code_serie_rdv, debut_traitement  into :v_code_serie_rdv, :var_date_debut_traitement_local from patient where code = :var_code_local ;
	
	if isnull(v_code_serie_rdv) then
		If MessagebOx("ATTENTION","Ce patient n'a pas d'affectation série de rendez-vous actuellement.~n~nVoulez-vous lui en affecter une ?",Question!, YesNo!, 2) = 2 then
			v_suite = false
		end if
	end if 
end if

if v_suite then
	
	st_date_ddt.text = string(var_date_debut_traitement_local, "dd/mm/yyyy")
	
	dw_serie_patient.settransobject(sqlca)
	dw_serie_patient.retrieve(var_code_local)
	
	if isnull(v_code_serie_rdv) then
		select min(code) into :v_code_serie_rdv from rdv_serie where ordre_trie = (select min(ordre_trie) from rdv_serie) ; 
		// on affecte
		dw_serie_patient.SetItem(1, "code_serie_rdv", v_code_serie_rdv )
		if enregistrement_automatique and pb_enregistrer.enabled then
			pb_enregistrer.triggerevent(clicked!)
		end if
	end if

	dw_serie_theo.settransobject(sqlca)
	dw_serie_theo.retrieve(var_code_local, v_code_serie_rdv)
	
	dw_reels.settransobject(sqlca)
	dw_reels.retrieve(var_code_local)
	
	dw_tableau_reels.settransobject(sqlca)
	dw_tableau_reels.retrieve(var_code_local)
	
	
	centrer(this)
	
	if enregistrement_automatique and pb_enregistrer.enabled then
		pb_annuler.visible = false
		pb_enregistrer.visible = false
	end if
	
	colore_tous_objets_window (this, couleur_fond_fenetre)
	
	uo_1.taille(this)	// uniquement pour colorer les DW
else
	close (this)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_serie_patient
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_rdv_serie_patient
integer x = 3698
integer y = 2324
integer width = 489
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

event clicked;dw_serie_patient.AcceptText()

if enregistrement_automatique and pb_enregistrer.enabled then
	close(parent)
else
	if dw_serie_patient.modifiedcount() > 0 or dw_serie_patient.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
end if
end event

type dw_serie_patient from datawindow within w_rdv_serie_patient
string tag = "no resize all"
integer x = 174
integer y = 80
integer width = 1225
integer height = 84
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_serie_patient"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
long v_code_serie_rdv
v_code_serie_rdv = long(this.gettext())


dw_serie_theo.retrieve(var_code_local, v_code_serie_rdv)

if enregistrement_automatique and pb_enregistrer.enabled then
	pb_enregistrer.triggerevent(clicked!)
end if



end event

type st_date_ddt from statictext within w_rdv_serie_patient
integer x = 2994
integer y = 72
integer width = 535
integer height = 84
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

type pb_enregistrer from uo_picturebutton_390x120 within w_rdv_serie_patient
integer x = 3177
integer y = 2324
integer width = 489
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;


dw_serie_patient.acceptText()

if dw_serie_patient.update() = 1 then 
	commit ;
else
	rollback ;
	Messagebox("ATTENTION","Erreur dans la mise  jour des données.")
end if





end event

type pb_annuler from uo_picturebutton_390x120 within w_rdv_serie_patient
integer x = 2656
integer y = 2324
integer width = 489
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

dw_serie_patient.retrieve(var_code_local)


end event

type pb_supprimer from uo_picturebutton_250x120 within w_rdv_serie_patient
integer x = 2121
integer y = 28
integer width = 599
integer height = 112
integer taborder = 20
boolean bringtotop = true
string text = "&Sup Affect. Série"
end type

event clicked;call super::clicked;

If MessagebOx("ATTENTION","Confirmez-vous la suppression de cette affection pour ce patient ?",Question!, YesNo!, 2) = 1 then

	update patient set  code_serie_rdv = null where code = :var_code_local ;
	commit ;
	
	close (parent)
end if

end event

type dw_serie_theo from datawindow within w_rdv_serie_patient
string tag = "brush "
integer x = 9
integer y = 212
integer width = 1893
integer height = 2064
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Rendez-vous selon la Série (Théoriques)"
string dataobject = "dw_rdv_serie_detail_liste_patient"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieveend;
//	Calcul du date selon règle de série de rdv .. pour les dates théoriques

date date_relative, date_finale
date v_date_debut_traitement
string v_type_delai, v_unite_delai
long v_nb
long lig, tot

date v_date_dernier_rdv_reel, v_date_dernier_theo

tot = this.rowcount()

Setnull(v_date_dernier_theo)

for lig = 1 to tot

	v_type_delai = this.getItemString(lig, "type_delai")
	v_unite_delai = this.getItemString(lig, "unite_delai")
	v_nb = this.getItemNumber(lig, "nb_delai")
	
	// On est en relatif mais selon quoi 
	
	choose case v_type_delai
			
		case 'J'
			// Date du jour
			date_relative = today()
			
		case 'D'
			// Debut de traitement
			select debut_traitement into :v_date_debut_traitement from patient where code = :var_code_local ;
			date_relative = v_date_debut_traitement
			
		case 'P'
			
				// 1er calcul, on prend le vrai dernier
				// Rendez-vous précédent (non absent)
				  SELECT max( cast("rdv"."rdv" as date))
					 INTO :v_date_dernier_rdv_reel 
					 FROM "rdv"  , "etat_rdv"
					WHERE ( "rdv"."code" = :var_code_local ) AND rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;

			if isnull(v_date_dernier_theo) then
				// premiere ligne
				date_relative = v_date_dernier_rdv_reel
			else
				if isnull(v_date_dernier_rdv_reel) then
					// Pas de rééel
					date_relative = v_date_dernier_theo
				else
					// y a des réels !!
					if v_date_dernier_rdv_reel < v_date_dernier_theo then
						date_relative =  v_date_dernier_theo
					else
						date_relative =  v_date_dernier_rdv_reel
					end if
				end if
			end if
	end choose
	
	
	
	// Calcul de la nouvelle date
	
	choose case v_unite_delai
		case 'J' 
			// jours
			date_finale = relativedate(date_relative, v_nb)
		case 'E'
			// semaine
			date_finale = relativedate(date_relative, v_nb * 7)
		case 'M'
			// mois
			date_finale = relativedate(date_relative, v_nb * 30)
		case 'T'
			// trimestre
			date_finale = relativedate(date_relative, v_nb * 91)
		case 'S'
			// Semestre
			date_finale = relativedate(date_relative, v_nb * 182)
		case 'A'
			// année
			date_finale = relativedate(date_relative, v_nb * 365)
	end choose		

	// Mise à jour de la date
	this.SetItem(lig, "delai_absolu", date_finale)
	v_date_dernier_theo = date_finale
	
next

// Selection d'une ligne
if rowcount > 0 then
	this.SelectRow(0,False)
	this.SelectRow(1,True)
	this.setrow(1)
end if

end event

type dw_reels from datawindow within w_rdv_serie_patient
string tag = "brush "
integer x = 1911
integer y = 212
integer width = 2313
integer height = 2064
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Rendez-vous Rééls"
string dataobject = "dw_rdv_serie_reels_patient"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type uo_1 from resize_fenetre within w_rdv_serie_patient
boolean visible = false
integer x = 1157
integer y = 1748
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_tableau_reels from datawindow within w_rdv_serie_patient
string tag = "no resizeall brush"
boolean visible = false
integer x = 2149
integer y = 220
integer width = 1888
integer height = 2056
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Rendez-vous réels passés"
string dataobject = "dw_graph_rdv_maj2"
boolean vscrollbar = true
boolean livescroll = true
end type

type rb_sans from radiobutton within w_rdv_serie_patient
integer x = 78
integer y = 2376
integer width = 270
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
string text = "Sans"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

event clicked;

if this.checked then 
	dw_reels.setfilter ("elimine_agenda  <> 'O'")
	dw_reels.filter()
else
	dw_reels.setfilter ("")
	dw_reels.filter()
end if



dw_reels.visible = true
dw_tableau_reels.visible = false
rb_synthese.checked = false
rb_detail.checked = true





end event

type rb_avec from radiobutton within w_rdv_serie_patient
integer x = 457
integer y = 2376
integer width = 270
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
string text = "Avec"
borderstyle borderstyle = styleraised!
end type

event clicked;

if this.checked then 
	dw_reels.setfilter ("")
	dw_reels.filter()
else
	dw_reels.setfilter ("elimine_agenda  <> 'O'")
	dw_reels.filter()
end if


dw_reels.visible = true
dw_tableau_reels.visible = false
rb_synthese.checked = false
rb_detail.checked = true



end event

type rb_detail from radiobutton within w_rdv_serie_patient
integer x = 1175
integer y = 2376
integer width = 443
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
string text = "Détail (tous)"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

event clicked;

if this.checked then
	dw_reels.visible = true
	dw_tableau_reels.visible = false
else
	dw_reels.visible = false
	dw_tableau_reels.visible = true
end if
end event

type rb_synthese from radiobutton within w_rdv_serie_patient
integer x = 1673
integer y = 2376
integer width = 805
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
string text = "Synthèse (passés réalisés)"
borderstyle borderstyle = styleraised!
end type

event clicked;

if this.checked then
	dw_reels.visible = false
	dw_tableau_reels.visible = true
else
	dw_reels.visible = true
	dw_tableau_reels.visible = false
end if
end event

type gb_rdv_elimine from groupbox within w_rdv_serie_patient
integer x = 23
integer y = 2304
integer width = 859
integer height = 176
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Rendez-vous non réalisés"
borderstyle borderstyle = styleraised!
end type

type gb_rdv_detail from groupbox within w_rdv_serie_patient
integer x = 1070
integer y = 2308
integer width = 1481
integer height = 176
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Affichage des rendez-vous rééls"
borderstyle borderstyle = styleraised!
end type

type gb_date_ddt from groupbox within w_rdv_serie_patient
integer x = 2880
integer width = 750
integer height = 176
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = " Début de Traitement"
borderstyle borderstyle = styleraised!
end type

type gb_serie from groupbox within w_rdv_serie_patient
integer x = 110
integer width = 1472
integer height = 200
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Série de Rendez-vous"
borderstyle borderstyle = styleraised!
end type

