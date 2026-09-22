$PBExportHeader$w_jours_interdits.srw
forward
global type w_jours_interdits from w_param
end type
type cb_1 from uo_picturebutton_390x120 within w_jours_interdits
end type
type cb_generer from uo_picturebutton_390x120 within w_jours_interdits
end type
type cb_generer_repet from uo_picturebutton_390x120 within w_jours_interdits
end type
type cbx_futures from checkbox within w_jours_interdits
end type
type pb_verif from uo_picturebutton_390x120 within w_jours_interdits
end type
type gb_1 from groupbox within w_jours_interdits
end type
end forward

global type w_jours_interdits from w_param
integer width = 5371
integer height = 3020
string title = "Table des Périodes Interdites"
cb_1 cb_1
cb_generer cb_generer
cb_generer_repet cb_generer_repet
cbx_futures cbx_futures
pb_verif pb_verif
gb_1 gb_1
end type
global w_jours_interdits w_jours_interdits

type variables
string cpdef

//// Menu clic droit sur les jours interdits
m_btdroit_jours_interdits newmenu 

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

forward prototypes
public subroutine filtre_dw ()
end prototypes

public subroutine filtre_dw ();

if cbx_futures.checked then 
	dw_liste.setfilter("date_debut >= today()") 
else
	dw_liste.setfilter("")
end if

dw_liste.filter()
end subroutine

event open;call super::open;open(w_patience)

uo_1.taille(this)

dw_liste.settransobject(SQLCA)
dw_liste.retrieve()

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

// Pour proposer un praticien par défaut 
//SELECT code INTO :cpdef FROM "prati" where prati_defaut = 1 ;
cpdef = fxg_get_praticien_par_defaut()

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[33]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose


// Menu clic droit sur les jours interdits
newmenu = CREATE m_btdroit_jours_interdits

// pour filtrage de la dw
filtre_dw()


close(w_patience)

end event

on w_jours_interdits.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_generer=create cb_generer
this.cb_generer_repet=create cb_generer_repet
this.cbx_futures=create cbx_futures
this.pb_verif=create pb_verif
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_generer
this.Control[iCurrent+3]=this.cb_generer_repet
this.Control[iCurrent+4]=this.cbx_futures
this.Control[iCurrent+5]=this.pb_verif
this.Control[iCurrent+6]=this.gb_1
end on

on w_jours_interdits.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_generer)
destroy(this.cb_generer_repet)
destroy(this.cbx_futures)
destroy(this.pb_verif)
destroy(this.gb_1)
end on

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type p_fond from w_param`p_fond within w_jours_interdits
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_jours_interdits
integer x = 320
integer y = 1828
integer taborder = 30
end type

type cb_annuler from w_param`cb_annuler within w_jours_interdits
integer x = 3739
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 110
end type

type cb_enregistrer from w_param`cb_enregistrer within w_jours_interdits
integer x = 4247
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 120
end type

event cb_enregistrer::clicked;call super::clicked;dw_liste.accepttext()

// On vérifie d'abord si pas d'erreur de chronologie dans les jours interdits 
if verif_jours_interdit(dw_liste) then

	
	if dw_liste.update() = 1 then
		commit ;
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		if not enregistrement_automatique then
			cb_annuler.TriggerEvent(Clicked!)
		end if
	else
	//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
	//	"Aucune modification ne sera prise en compte !",Exclamation!)
		Rollback ;
	end if
end if


end event

type cb_fermer from w_param`cb_fermer within w_jours_interdits
integer x = 4754
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 130
end type

event cb_fermer::clicked;dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

// Vérification de la chronologie des debuts fin
if verif_jours_interdit(dw_liste) then
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2)  = 1 Then
			fermer_fenetre(parent)
		end if
	else
		fermer_fenetre(parent)
	end if
end if
end event

type cb_supprimer from w_param`cb_supprimer within w_jours_interdits
integer x = 1202
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 50
end type

type cb_ajouter from w_param`cb_ajouter within w_jours_interdits
integer x = 695
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 40
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()


dw_liste.setitem(dw_liste.getrow(),"date_debut",datetime(today()))
dw_liste.setitem(dw_liste.getrow(),"date_fin",datetime(today(),time('23:59:00')))
dw_liste.setitem(dw_liste.getrow(),"code_praticien",cpdef)


// informations de modifications
fxg_set_infos_modifs(dw_liste, dw_liste.getrow())

end event

type dw_liste from w_param`dw_liste within w_jours_interdits
string tag = "brush centrer  no resize"
integer x = 27
integer y = 28
integer width = 5147
integer height = 2620
string dataobject = "dw_jours_interdits"
end type

event dw_liste::dberror;
CHOOSE CASE sqldbcode
	CASE -193
		MessageBox("Alerte Base de Données","La période que vous avez saisie existe dejà pour ce praticien !",Information!)
	CASE -195
		MessageBox("Alerte Base de Données","Aucune des zones ne peut pas être nul !",Information!)
	CASE -198
		MessageBox("Alerte Base de Données","Vous n'avez pas le droit de supprimer cette ligne !~n~nElle est utilisée dans un rendez-vous.",Information!)
	CASE ELSE
		MessageBox("Alerte Base de Données Non Référencée","N° "+String(sqldbcode)+"~nText : "+sqlerrtext+"~n~nVeuillez en avertir ARAKIS ...",Information!)
END CHOOSE
return 1

end event

event dw_liste::itemchanged;

if row > 0 then
	
	// Si modif de la 1ère date, on corrige la 2ème
	
	if dwo.type = "column" then
		//sélection suivant le nom de la "column" de la data window
		choose case dwo.name
			case "date_debut"	
				datetime d1, d2
				accepttext()
				d1 = getitemDateTime(row,  "date_debut")
				d2 = getitemDateTime(row,  "date_fin")
				if d1 >= d2 then 
					setitem(row, "date_fin" , datetime( date(d1), time("23:59")))
				end if
		end choose
	end if
		
	
	// informations de modifications
	fxg_set_infos_modifs(this, row)
end if


if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event dw_liste::rbuttondown;

if row > 0 then
	
	long couleur_choisie

	if getcolumn() = 8 then 
		
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette

		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie)  then
			// Clic droit dans le zone commentaire => couleur
			if couleur_choisie=couleur_jour_interdit then
				messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de fond des jours interdits.")
			else
				if couleur_choisie=couleur_rouge then
					messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de présence de rendez-vous durant une période interdite.")
				else
					this.setitem(row,"couleur",couleur_choisie)
					this.setitem(row,"couleur",couleur_choisie)
					// On bouge le focus pour appliquer la couleur dans la zone
					this.setcolumn(1)
					this.setcolumn(8)
					this.accepttext()
					if enregistrement_automatique and cb_enregistrer.enabled then
						cb_enregistrer.triggerevent(clicked!)
					end if
				end if
			end if
		end if
	else
		newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())
	end if
end if
end event

type uo_1 from w_param`uo_1 within w_jours_interdits
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_jours_interdits
boolean visible = false
integer x = 2432
integer y = 2760
end type

type gb_filtre from w_param`gb_filtre within w_jours_interdits
boolean visible = false
integer x = 2368
integer y = 2688
end type

type cb_1 from uo_picturebutton_390x120 within w_jours_interdits
integer x = 1710
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;open(w_jours_interdits_edition)
end event

type cb_generer from uo_picturebutton_390x120 within w_jours_interdits
integer x = 2217
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 70
boolean bringtotop = true
string text = "&Gén. J. Fériés"
string iconname = "ACTIONS_generer_jours_feries.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant de lancer la génération.",Information!)
else
	if fxg_ouverture_onglet_possible() then
		w_mdi_2020.uo_powerdock.of_openDocument(w_jours_interdits_gen_feries, "Génération Jours Fériés", image_menu_listes_rdv )
	end if
end if

end event

type cb_generer_repet from uo_picturebutton_390x120 within w_jours_interdits
integer x = 2725
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 100
boolean bringtotop = true
string text = "&Maj Groupe"
string iconname = "ACTIONS_mise_a_jour_jour_interdits.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

boolean v_suite = true

if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	if enregistrement_automatique then
		cb_enregistrer.triggerevent(clicked!) 
	else
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant de lancer la génération.",Information!)
		v_suite = false
	end if
end if

if v_suite then
	w_mdi_2020.uo_powerdock.of_openDocument(w_jours_interdits_gen_repet, "Génération Jours Interdits", image_menu_listes_rdv )
end if



end event

type cbx_futures from checkbox within w_jours_interdits
integer x = 37
integer y = 2756
integer width = 617
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ne voir que les Futures"
boolean checked = true
end type

event clicked;

filtre_dw()


end event

type pb_verif from uo_picturebutton_390x120 within w_jours_interdits
integer x = 3232
integer y = 2720
integer width = 507
integer height = 152
integer taborder = 80
boolean bringtotop = true
string text = "&Vérif RDV"
string iconname = "ACTIONS_verifier_rdv.png"
end type

event clicked;call super::clicked;
// Vérification de la présence de RDV dans les jours interdits


open(w_patience)

long lig, tot
long nb, nb_tot

datetime debut, fin
integer f1,f2
string prat 


tot = dw_liste.rowcount()
nb_tot = 0

for lig = 1 to tot
	
	yield()																				// pour que le sablier de patience tourne !!
	prat = dw_liste.getitemstring(lig,"code_praticien")
	
	
	debut = dw_liste.getitemdatetime(lig,"date_debut")
	fin = dw_liste.getitemdatetime(lig,"date_fin")
	
	f1 = dw_liste.getitemnumber(lig,"fauteuil_debut")
	f2 = dw_liste.getitemnumber(lig,"fauteuil_fin")
	
	if prat = "ER" and date(debut) = date('2013-05-13') then
		string aa
		aa = "a"
	end if
	
	nb = verif_nb_rendez_vous_periode(debut, fin, f1, f2, prat)
	nb_tot = nb_tot + nb
	
	if nb > 0 then
		if MessageBox("ATTENTION !","Il y a "+string(nb)+" rendez-vous déjà saisis durant la période suivante :~n~nDébut : "+string(debut)+"~nFin : "+string(fin)+"~n~nVoulez-vous poursuivre la vérification ?",Question!,YesNo!,1) = 2 then
			lig = tot + 1
		end if
	end if
	
next

if nb_tot = 0 then
	// Y a pas eu de pb
		MessageBox("FIN DE LA VERIFICATION","Auncun rendez-vous n'a été trouvé dans une période interdite.")
end if


close(w_patience)
end event

type gb_1 from groupbox within w_jours_interdits
integer x = 14
integer y = 2704
integer width = 658
integer height = 140
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

