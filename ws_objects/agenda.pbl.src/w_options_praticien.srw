$PBExportHeader$w_options_praticien.srw
forward
global type w_options_praticien from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_options_praticien
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_options_praticien
end type
type cb_fermer from uo_picturebutton_390x120 within w_options_praticien
end type
type dw_jours from datawindow within w_options_praticien
end type
type dw_praticien from datawindow within w_options_praticien
end type
type gb_1 from groupbox within w_options_praticien
end type
end forward

global type w_options_praticien from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 4325
integer height = 2560
string title = "Paramètres de l~'agenda graphique"
boolean resizable = false
long backcolor = 15780518
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_jours dw_jours
dw_praticien dw_praticien
gb_1 gb_1
end type
global w_options_praticien w_options_praticien

type variables
// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

on w_options_praticien.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_jours=create dw_jours
this.dw_praticien=create dw_praticien
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_jours
this.Control[iCurrent+5]=this.dw_praticien
this.Control[iCurrent+6]=this.gb_1
end on

on w_options_praticien.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_jours)
destroy(this.dw_praticien)
destroy(this.gb_1)
end on

event open;call super::open;dw_jours.settransobject(sqlca)

colore_datawindow(dw_jours)
colore_tous_objets_window(this, couleur_fond_datawindow)


// A l'ouvertur on vérifie les enregistrements de la table ... au cas ou ...

// on vire les praticiens qui n'y sont plus
delete from agenda_praticien where code_praticien not in (select code from prati) ;

// ajout des praticiens qui n'y sont pas encore avec des valeurs par défaut
insert into agenda_praticien ("code_praticien", "heure_debut", "heure_fin", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche", "intervalle", 
"nombre_fauteuil", "pause_debut", "pause_fin", "urgence", "mode_affichage_defaut", "couleur_assistante", "couleur_praticien", "couleur_assistante_rdv" ,"couleur_praticien_rdv" ) 

(select "code",  "agenda"."heure_debut", "agenda"."heure_fin", "agenda"."lundi", "agenda"."mardi", "agenda"."mercredi", "agenda"."jeudi", "agenda"."vendredi", "agenda"."samedi", "agenda"."dimanche", "agenda"."intervalle", 
"agenda"."nombre_fauteuil", "agenda"."pause_debut", "agenda"."pause_fin", "agenda"."urgence", "agenda"."mode_affichage_defaut", "agenda"."couleur_assistante", "agenda"."couleur_praticien", "agenda"."couleur_assistante_rdv" ,"agenda"."couleur_praticien_rdv"  
from prati, agenda where code not in (select code_praticien from agenda_praticien) and actif = 1 ) ;

commit ;



string v_praticien

dw_praticien.settransobject(sqlca)
dw_praticien.retrieve()

v_praticien = dw_praticien.gettext()

dw_jours.retrieve(v_praticien)


end event

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type p_fond from w_fenetre_arakis`p_fond within w_options_praticien
end type

type cb_annuler from uo_picturebutton_390x120 within w_options_praticien
integer x = 2190
integer y = 1960
integer width = 576
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;string v_praticien

v_praticien=parent.dw_praticien.gettext()

dw_jours.retrieve(v_praticien)

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_options_praticien
integer x = 2775
integer y = 1960
integer width = 576
integer taborder = 60
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//Verification des champs
//----------------------------
dw_jours.accepttext()


// Avant la mise à jour , on teste les temps assistante et praticien ...
integer min1,min2, min3
integer min_intervalle
time intervalle_mini

select min(duree_assistante_1) into :min1  from type_rdv where duree_assistante_1 > 0;
select min(duree_praticien_1) into :min1  from type_rdv where duree_praticien_1 > 0;
select min(duree_assistante_2) into :min1  from type_rdv where duree_assistante_2 > 0;

if min1 > 0 then
	min_intervalle = min1
end if

if min2 > 0 then
	min_intervalle = min ( min_intervalle , min2 )
end if

if min3 > 0 then
	min_intervalle = min ( min_intervalle , min3 )
end if

if min_intervalle > 0 then
	if minute(dw_jours.getitemtime(1,"intervalle")) > min_intervalle  then
		
		if MessageBox("ATTENTION !","En analysant les temps Assistantes / Praticien spécifiés dans vos Types de Rendez-vous, nous vous recommandons d'indiquer "+ string(min_intervalle) +" minutes comme intervalle (unité minimale de temps) de votre Agenda.~n~nSouhaitez-vous que cet intervalle soit mis à jour automatiquement ?",Question!,yesNo!,1) = 1 then
			// Mise à jour de l'intervalle
			intervalle_mini = time("00:"+string(min_intervalle)+":00")
			dw_jours.setitem(1,"intervalle", intervalle_mini)
		end if
		
	end if
end if

//Mise à jour du groupe jour ... les autres sont liées => Pas de MAJ
//------------------------------
if dw_jours.update()=1 then
		
	commit;
	
else
	rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_options_praticien
integer x = 3360
integer y = 1960
integer width = 576
integer taborder = 70
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;fermer_fenetre(parent)
end event

type dw_jours from datawindow within w_options_praticien
string tag = "brush"
integer x = 46
integer y = 432
integer width = 4210
integer height = 1344
integer taborder = 10
string title = "Paramêtres Généraux"
string dataobject = "dw_agenda_option_praticien"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event rbuttondown;
//messagebox("trace",string( this.getcolumn()))

long col

col = this.getcolumn()


// On appelle les couleurs pour la colonne 18 ou 19
if col = 18 or col = 19 then

	//Declaration des variables locales
	//--------------------------
	long couleur_choisie
	
	// Les positions seront utilisées dans le timer de la fenêtre	
	ii_palette_x = xpos
	ii_palette_y = ypos
	
	Timer(0.05)

	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		if couleur_choisie=couleur_jour_interdit then
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
		else
			dw_jours.setitem(1, col , couleur_choisie)
			// On bouge le focus pour appliquer la couleur dans la zone
			dw_jours.setcolumn(1)
			dw_jours.setcolumn(col)
			dw_jours.accepttext()
		end if
	end if
end if
end event

type dw_praticien from datawindow within w_options_praticien
integer x = 1413
integer y = 148
integer width = 855
integer height = 72
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string v_praticien

v_praticien=parent.dw_praticien.gettext()

dw_jours.retrieve(v_praticien)


end event

type gb_1 from groupbox within w_options_praticien
integer x = 1262
integer y = 48
integer width = 1179
integer height = 204
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long backcolor = 15780518
string text = "Choix du Praticien"
end type

