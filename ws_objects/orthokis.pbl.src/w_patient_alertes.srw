$PBExportHeader$w_patient_alertes.srw
forward
global type w_patient_alertes from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_alertes
end type
type dw_liste from datawindow within w_patient_alertes
end type
type pb_ajouter from uo_picturebutton_390x120 within w_patient_alertes
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_patient_alertes
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_alertes
end type
type pb_bis from uo_picturebutton_390x120 within w_patient_alertes
end type
type pb_supprimer from uo_picturebutton_390x120 within w_patient_alertes
end type
type rb_a_realiser from radiobutton within w_patient_alertes
end type
type rb_toutes_statut from radiobutton within w_patient_alertes
end type
type rb_realisees from radiobutton within w_patient_alertes
end type
type uo_1 from resize_fenetre within w_patient_alertes
end type
type dw_liste_avant from datawindow within w_patient_alertes
end type
type dw_liste_apres from datawindow within w_patient_alertes
end type
type gb_2 from groupbox within w_patient_alertes
end type
end forward

global type w_patient_alertes from w_fenetre_arakis
boolean visible = false
integer width = 3831
integer height = 1952
string title = "Mise à jour des Alertes du Patient"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_liste dw_liste
pb_ajouter pb_ajouter
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
pb_bis pb_bis
pb_supprimer pb_supprimer
rb_a_realiser rb_a_realiser
rb_toutes_statut rb_toutes_statut
rb_realisees rb_realisees
uo_1 uo_1
dw_liste_avant dw_liste_avant
dw_liste_apres dw_liste_apres
gb_2 gb_2
end type
global w_patient_alertes w_patient_alertes

type variables


double var_code_local


end variables

forward prototypes
public subroutine filtrer (datawindow dw)
end prototypes

public subroutine filtrer (datawindow dw);

string filtre

// clic sur autre chose => on joue sur le filtre
if rb_a_realiser.checked then
	// Taches non encore réalisées
	filtre = "patient_alertes_realisee = 'N'" 
else
	if rb_realisees.checked then 
		// Taches realisées
		filtre = "patient_alertes_realisee = 'O'"
	else
		// toutes
		filtre = ""
	end if
end if


dw_liste.setfilter(filtre)
dw_liste.filter()
end subroutine

on w_patient_alertes.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_liste=create dw_liste
this.pb_ajouter=create pb_ajouter
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.pb_bis=create pb_bis
this.pb_supprimer=create pb_supprimer
this.rb_a_realiser=create rb_a_realiser
this.rb_toutes_statut=create rb_toutes_statut
this.rb_realisees=create rb_realisees
this.uo_1=create uo_1
this.dw_liste_avant=create dw_liste_avant
this.dw_liste_apres=create dw_liste_apres
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.pb_ajouter
this.Control[iCurrent+4]=this.pb_enregistrer
this.Control[iCurrent+5]=this.pb_annuler
this.Control[iCurrent+6]=this.pb_bis
this.Control[iCurrent+7]=this.pb_supprimer
this.Control[iCurrent+8]=this.rb_a_realiser
this.Control[iCurrent+9]=this.rb_toutes_statut
this.Control[iCurrent+10]=this.rb_realisees
this.Control[iCurrent+11]=this.uo_1
this.Control[iCurrent+12]=this.dw_liste_avant
this.Control[iCurrent+13]=this.dw_liste_apres
this.Control[iCurrent+14]=this.gb_2
end on

on w_patient_alertes.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_liste)
destroy(this.pb_ajouter)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.pb_bis)
destroy(this.pb_supprimer)
destroy(this.rb_a_realiser)
destroy(this.rb_toutes_statut)
destroy(this.rb_realisees)
destroy(this.uo_1)
destroy(this.dw_liste_avant)
destroy(this.dw_liste_apres)
destroy(this.gb_2)
end on

event open;call super::open;
//------------------------------------------------------------
// La fenêtre est VOLONTAIREMENT invisible
// C'est la fonction CENTRER qui la rendra visible !!!
//------------------------------------------------------------

uo_1.taille(this) // pour le brush de la dw

centrer_selon_w_mdi_2020(this)


// recup du code patient passé en param

var_code_local = message.doubleparm

// recherche des éléments pour titre de la fenêtre
string v_nom, v_prenom, v_numero_dossier

select nom, prenom, numero_dossier into :v_nom, :v_prenom, :v_numero_dossier from patient 
where code = :var_code_local ;


this.title = "Alertes pour le patient "+trim(v_nom)+" "+trim(v_prenom)+" ("+string(v_numero_dossier)+")"


dw_liste.settransobject(sqlca)
dw_liste.retrieve(var_code_local)

// serviront à analyser les modifications dans le bouton enregistrer
dw_liste_avant.settransobject(sqlca)
dw_liste_avant.retrieve(var_code_local)

dw_liste_apres.settransobject(sqlca)

filtrer(dw_liste)

if enregistrement_automatique then
	pb_enregistrer.visible = false
	pb_annuler.visible = false
end if
end event

event close;call super::close;

if enregistrement_automatique and pb_enregistrer.enabled then
	pb_enregistrer.triggerevent(clicked!)
end if


end event

event resize;call super::resize;uo_1.retaille(this) // pour le brush de la dw

end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_alertes
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_alertes
integer x = 3227
integer y = 1516
integer width = 517
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if enregistrement_automatique and pb_enregistrer.enabled then
	close(parent)
else
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
end if
end event

type dw_liste from datawindow within w_patient_alertes
string tag = "brush"
integer x = 370
integer y = 36
integer width = 3072
integer height = 1376
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_alertes"
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;
if enregistrement_automatique and pb_enregistrer.enabled then
	pb_enregistrer.postevent(clicked!)
end if
end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type pb_ajouter from uo_picturebutton_390x120 within w_patient_alertes
integer x = 55
integer y = 1520
integer width = 517
integer taborder = 20
boolean bringtotop = true
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;


// recherche de la valeur maxi

dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.RowCount(),"code_patient",var_code_local)

// recherche de l'alerte par defaut

long mini
double v_code_alerte

select min(ordre_trie) into :mini from alertes ;
select min(code) into :v_code_alerte from alertes where ordre_trie = :mini ;
dw_liste.SetItem(dw_liste.RowCount(),"code_alerte",v_code_alerte)
dw_liste.Setcolumn(1)
dw_liste.SetFocus()


end event

type pb_enregistrer from uo_picturebutton_390x120 within w_patient_alertes
integer x = 2702
integer y = 1520
integer width = 517
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;string cherche

dw_liste.accepttext()

if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		pb_annuler.TriggerEvent(Clicked!)
	end if
	
	// Analyse des modifs histoire de mettre à jour l'historique ...
	dw_liste_apres.retrieve(var_code_local)
	
	double v_code_alerte
	date v_date_alerte
	string com_avant, com_apres, real_avant, real_apres
	
	long ligavant, totavant, ligapres, totapres
	totavant = dw_liste_avant.rowcount()
	
	for ligavant = 1 to totavant
		v_code_alerte = dw_liste_avant.getItemNumber(ligavant, "code_alerte")
		v_date_alerte = dw_liste_avant.getItemDate(ligavant, "patient_alertes_date")
		cherche = "code_alerte  =  " + string(v_code_alerte) + " and code_patient = " + string(var_code_local) + " and patient_alertes_date = date('" + string(v_date_alerte) + "')"
		
		ligapres = dw_liste_apres.find( cherche , 0, 99999)
		
		// Si c'est un élément de la clef qui est modifié (date/ type alerte, on gèrera ça comme une suppression ajout 
		
		if ligapres = 0 then 
			// l'alerte a été supprimée
			ajout_histo_alertes(var_code_local, v_code_alerte, v_date_alerte, 'S', 'N' )
		else
			// Modification ??? 
			com_avant = dw_liste_avant.getitemstring(ligavant, "patient_alertes_commentaire")
			com_apres = dw_liste_apres.getitemstring(ligapres, "patient_alertes_commentaire") 
			real_avant = dw_liste_avant.getitemstring(ligavant, "patient_alertes_realisee")
			real_apres = dw_liste_apres.getitemstring(ligapres, "patient_alertes_realisee")
			
			if  com_avant <> com_apres or real_avant  <> real_apres then 
				// l'alerte a été modifiée
				ajout_histo_alertes(var_code_local, v_code_alerte, v_date_alerte, 'M', 'N' )
			end if
			// on supprime la ligne de APRES pour poursuivre les test
			dw_liste_apres.deleterow(ligapres)
		end if 
		
	next 
	
	// Les lignes qui restent dans APRES correspondent à des ajouts ou des modifs de clefs .. donc des ajouts
	
	totapres = dw_liste_apres.rowcount()
	
	for ligapres = 1 to totapres
		
		v_code_alerte = dw_liste_apres.getItemNumber(ligapres, "code_alerte")
		v_date_alerte = dw_liste_apres.getItemDate(ligapres, "patient_alertes_date")

		ajout_histo_alertes(var_code_local, v_code_alerte, v_date_alerte, 'A', 'N' )

		
	
	next	
	
	// On réactualise 
	dw_liste_avant.retrieve(var_code_local)
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type pb_annuler from uo_picturebutton_390x120 within w_patient_alertes
integer x = 2176
integer y = 1520
integer width = 517
integer taborder = 40
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;


dw_liste.retrieve(var_code_local)

end event

type pb_bis from uo_picturebutton_390x120 within w_patient_alertes
integer x = 581
integer y = 1520
integer width = 517
integer taborder = 30
boolean bringtotop = true
string text = "&Bis"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;
// Duplique l'alerte en cours en la planifiant selon le délais par défaut	


date v_date, v_next_date
double v_code_alerte
string v_patient_alertes_commentaire

integer nb_perio
string ty_perio

integer lig

if dw_liste.rowcount() > 0 then
	
	dw_liste.accepttext()
	
	lig = dw_liste.getrow()
	v_date = dw_liste.getitemdate(lig,"patient_alertes_date")	
	v_code_alerte = dw_liste.getitemnumber(lig,"code_alerte")	
	v_patient_alertes_commentaire =  dw_liste.getitemstring(lig,"patient_alertes_commentaire")	
	
	
	  SELECT "alertes"."nombre_periodicite",    "alertes"."type_periodicite"  
	    INTO :nb_perio,   :ty_perio  
	    FROM "alertes"     WHERE "alertes"."code" = :v_code_alerte     ;

	// Calcul de la date suivante
	
	choose case ty_perio
		case 'J'
			v_next_date = relativedate(v_date,nb_perio )
		case 'S'
			v_next_date = relativedate(v_date,nb_perio * 7)
		case 'M'
			v_next_date = ajout_x_mois(v_date,nb_perio)
		case 'A'
			v_next_date = ajout_x_mois(v_date,nb_perio * 12) 
	end choose

	// Ajout de la nouvelle alerte
	
	dw_liste.insertrow(99999)
	lig = dw_liste.rowcount()
	
	
	dw_liste.setitem(lig,"patient_alertes_date",v_next_date)
	dw_liste.setitem(lig,"code_alerte",v_code_alerte)	
	dw_liste.setitem(lig,"code_patient",var_code_local)	
	dw_liste.setitem(lig,"patient_alertes_commentaire",v_patient_alertes_commentaire)	
	dw_liste.setrow(lig)
			
			
	
	
	
	
end if
//
//// récup des data de la liste
//
//if dw_liste.rowcount() > 0 then
//	
//	double  v_patient2
//	
//	v_patient2 = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
//	
//	dw_maj.retrieve(var_code_local, v_patient2)
//	if dw_maj.rowcount() = 0 then
//		dw_maj.retrieve(v_patient2, var_code_local)
//	end if
//	
//	if dw_maj.rowcount() > 0 then
//
//		dw_maj.visible = true
//		pb_annuler.visible = true
//		pb_enregistrer.visible = true
//		
//		pb_ajouter.visible = false
//		pb_modifier.visible = false
//		pb_supprimer.visible = false		
//	end if
//	
//end if
//		
end event

type pb_supprimer from uo_picturebutton_390x120 within w_patient_alertes
integer x = 1106
integer y = 1520
integer width = 517
integer taborder = 40
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if


end event

type rb_a_realiser from radiobutton within w_patient_alertes
integer x = 1687
integer y = 1524
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "A réaliser"
boolean checked = true
end type

event clicked;

filtrer(dw_liste)

end event

type rb_toutes_statut from radiobutton within w_patient_alertes
integer x = 1687
integer y = 1596
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Toutes"
end type

event clicked;

filtrer(dw_liste)

end event

type rb_realisees from radiobutton within w_patient_alertes
integer x = 1687
integer y = 1668
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Réalisées"
end type

event clicked;

filtrer(dw_liste)

end event

type uo_1 from resize_fenetre within w_patient_alertes
boolean visible = false
integer x = 110
integer y = 1144
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste_avant from datawindow within w_patient_alertes
string tag = "brush"
boolean visible = false
integer x = 64
integer y = 528
integer width = 1614
integer height = 912
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_alertes"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_liste_apres from datawindow within w_patient_alertes
string tag = "brush"
boolean visible = false
integer x = 64
integer y = 1460
integer width = 1614
integer height = 912
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_alertes"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_patient_alertes
integer x = 1632
integer y = 1456
integer width = 535
integer height = 300
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Filtre Statut"
end type

