$PBExportHeader$w_fournisseur_fiche.srw
forward
global type w_fournisseur_fiche from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type cb_annuler from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type cb_param from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type cb_ajout_fournisseur from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type ole_photo_arakis003 from gearbox_fournisseur within w_fournisseur_fiche
end type
type dw_ajout from datawindow within w_fournisseur_fiche
end type
type uo_1 from resize_fenetre within w_fournisseur_fiche
end type
type dw_basic from datawindow within w_fournisseur_fiche
end type
type tab_fournisseur from tab within w_fournisseur_fiche
end type
type tabpage_administratif from userobject within tab_fournisseur
end type
type dw_admin from datawindow within tabpage_administratif
end type
type tabpage_administratif from userobject within tab_fournisseur
dw_admin dw_admin
end type
type tabpage_contact from userobject within tab_fournisseur
end type
type cb_supprimer_contact from uo_picturebutton_390x120 within tabpage_contact
end type
type cb_ajouter_contact from uo_picturebutton_390x120 within tabpage_contact
end type
type ole_photo_arakis004 from gearbox_fournisseur within tabpage_contact
end type
type dw_fiche from datawindow within tabpage_contact
end type
type dw_liste from u_basedw within tabpage_contact
end type
type tabpage_contact from userobject within tab_fournisseur
cb_supprimer_contact cb_supprimer_contact
cb_ajouter_contact cb_ajouter_contact
ole_photo_arakis004 ole_photo_arakis004
dw_fiche dw_fiche
dw_liste dw_liste
end type
type tabpage_livraisons from userobject within tab_fournisseur
end type
type cb_ajouter_livraison from uo_picturebutton_390x120 within tabpage_livraisons
end type
type cb_supprimer_livraison from uo_picturebutton_390x120 within tabpage_livraisons
end type
type dw_liste2 from u_basedw within tabpage_livraisons
end type
type dw_fiche2 from datawindow within tabpage_livraisons
end type
type tabpage_livraisons from userobject within tab_fournisseur
cb_ajouter_livraison cb_ajouter_livraison
cb_supprimer_livraison cb_supprimer_livraison
dw_liste2 dw_liste2
dw_fiche2 dw_fiche2
end type
type tab_fournisseur from tab within w_fournisseur_fiche
tabpage_administratif tabpage_administratif
tabpage_contact tabpage_contact
tabpage_livraisons tabpage_livraisons
end type
type lb_ville from listbox within w_fournisseur_fiche
end type
type lb_codep from listbox within w_fournisseur_fiche
end type
type cb_annuler_ajout from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
type cb_continuer from uo_picturebutton_390x120 within w_fournisseur_fiche
end type
end forward

global type w_fournisseur_fiche from w_fenetre_arakis
integer width = 2971
integer height = 2476
string title = "Fiche Fournisseur"
windowtype windowtype = response!
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_param cb_param
cb_ajout_fournisseur cb_ajout_fournisseur
ole_photo_arakis003 ole_photo_arakis003
dw_ajout dw_ajout
uo_1 uo_1
dw_basic dw_basic
tab_fournisseur tab_fournisseur
lb_ville lb_ville
lb_codep lb_codep
cb_annuler_ajout cb_annuler_ajout
cb_continuer cb_continuer
end type
global w_fournisseur_fiche w_fournisseur_fiche

type variables
double max //max du code interne de la table contact
double max2 //max du code interne de la table livraisons
integer int_nb_row //nombre de liste de la liste des fournisseurs (instances car sert pour prec suiv)
string code_fournisseur_courant //code du fournisseur de la fiche affichée a l'écran


// Servent pour la MAJ des codes postaux
string ch_maj,ch_tel,ch_fax
string pref[100]
datawindow dw_maj

end variables

forward prototypes
public subroutine ajouter_fournisseur ()
public subroutine recuperer (string code_fournisseur)
public subroutine visi (integer binary)
end prototypes

public subroutine ajouter_fournisseur ();integer max_fournisseur

dw_ajout.reset()
dw_ajout.insertrow(0)

  SELECT MAX(cast (code as float))  
    INTO :max_fournisseur
    FROM "fournisseur"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )   ;

IF IsNull(max_fournisseur) THEN
	max_fournisseur = 1
ELSE	
	max_fournisseur = max_fournisseur + 1
END IF

dw_ajout.setitem(dw_ajout.getrow(),"code",string(max_fournisseur))
dw_ajout.selecttext(1,6)
dw_ajout.setfocus()
end subroutine

public subroutine recuperer (string code_fournisseur);//fonction qui affiche la fiche du fournisseur de code "code_fournisseur" passé en param
integer i //pour la boucle for
boolean test //pour vérification qu'on a bien recuperer la fiche

test = false
int_nb_row = dw_basic.retrieve()
for i = 1 to int_nb_row
	if dw_basic.getitemstring(i,"code") = code_fournisseur then
		test = true
		dw_basic.scrolltorow(i)
		tab_fournisseur.tabpage_administratif.dw_admin.scrolltorow(i)
		tab_fournisseur.selecttab(1)
	end if
next

if test then
	code_fournisseur_courant = code_fournisseur
	ole_photo_arakis003.dossier_fournisseur = code_fournisseur_courant
	ole_photo_arakis003.triggerevent(constructor!)
else
	//ne devrait jamais arrivé
	MessageBOx("Attention","Erreur dans la récupération de la fiche du fournisseur")
end if
end subroutine

public subroutine visi (integer binary);//fonction rendant visible ou invisibles différents éléments de la fenêtre
//pour les ajouts de fournisseurs
if binary = 0 then
	ole_photo_arakis003.visible = false
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = false
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = false
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = false
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = false
	cb_fermer.visible = false
	cb_enregistrer.visible = false
	cb_ajout_fournisseur.visible = false
	cb_annuler.visible = false
	cb_annuler_ajout.visible = true
	cb_continuer.visible = true
	dw_basic.visible = false
	tab_fournisseur.visible = false
	dw_ajout.visible = true
	cb_param.visible = false
end if
if binary = 1 then
	ole_photo_arakis003.visible = true
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = true
	tab_fournisseur.tabpage_contact.cb_ajouter_contact.visible = true
	tab_fournisseur.tabpage_livraisons.cb_supprimer_livraison.visible = true
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = true
	cb_fermer.visible = true
	cb_enregistrer.visible = true
	cb_ajout_fournisseur.visible = true
	cb_annuler.visible = true
	cb_annuler_ajout.visible = false
	cb_continuer.visible = false
	dw_basic.visible = true
	tab_fournisseur.visible = true
	dw_ajout.visible = false
	cb_param.visible = true
end if

end subroutine

on w_fournisseur_fiche.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_param=create cb_param
this.cb_ajout_fournisseur=create cb_ajout_fournisseur
this.ole_photo_arakis003=create ole_photo_arakis003
this.dw_ajout=create dw_ajout
this.uo_1=create uo_1
this.dw_basic=create dw_basic
this.tab_fournisseur=create tab_fournisseur
this.lb_ville=create lb_ville
this.lb_codep=create lb_codep
this.cb_annuler_ajout=create cb_annuler_ajout
this.cb_continuer=create cb_continuer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_param
this.Control[iCurrent+5]=this.cb_ajout_fournisseur
this.Control[iCurrent+6]=this.ole_photo_arakis003
this.Control[iCurrent+7]=this.dw_ajout
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.dw_basic
this.Control[iCurrent+10]=this.tab_fournisseur
this.Control[iCurrent+11]=this.lb_ville
this.Control[iCurrent+12]=this.lb_codep
this.Control[iCurrent+13]=this.cb_annuler_ajout
this.Control[iCurrent+14]=this.cb_continuer
end on

on w_fournisseur_fiche.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_param)
destroy(this.cb_ajout_fournisseur)
destroy(this.ole_photo_arakis003)
destroy(this.dw_ajout)
destroy(this.uo_1)
destroy(this.dw_basic)
destroy(this.tab_fournisseur)
destroy(this.lb_ville)
destroy(this.lb_codep)
destroy(this.cb_annuler_ajout)
destroy(this.cb_continuer)
end on

event open;call super::open;integer rapport_sharedata	//au cas ou le partage de buffers entre dw_basic et dw_admin se passe mal
datawindowchild idw_pays_ddlb //dw fille dddw pays de dw_admin


colore_tous_objets_tab(tab_fournisseur, couleur_fond_datawindow)

//////////////////////////////////////////////////////////////////////////////////
// passage de paramètres : stirng du code fournisseur du fournisseur à afficher //
//////////////////////////////////////////////////////////////////////////////////

code_fournisseur_courant = message.stringparm

dw_basic.settransobject(sqlca) //dw du code,nom et statut
dw_ajout.settransobject(sqlca) //dw invisible ici qui sert à l'ajout d'un fournisseur

tab_fournisseur.tabpage_administratif.dw_admin.getchild("code_pays",idw_pays_ddlb) 
//on récupère la dddw pays de dw_admin car le partage de dw_admin avec dw_basic supprime le retrieve automatique
idw_pays_ddlb.settransobject(sqlca)
idw_pays_ddlb.retrieve()

tab_fournisseur.tabpage_contact.dw_fiche.settransobject(sqlca) //dw de la fiche contact
tab_fournisseur.tabpage_contact.dw_liste.settransobject(sqlca) //dw de la liste des contacts
tab_fournisseur.tabpage_livraisons.dw_fiche2.settransobject(sqlca) // dw de la fiche des livraisons
tab_fournisseur.tabpage_livraisons.dw_liste2.settransobject(sqlca) // dw de la liste des livraisons

rapport_sharedata = dw_basic.ShareData(tab_fournisseur.tabpage_administratif.dw_admin)
//partage entre dw_basic et dw_admin 
if rapport_sharedata <> 1 then
	messagebox ("Sharedata error","error sharing data with admin")
end if

if code_fournisseur_courant = "      " then
	// Ajout
	cb_ajout_fournisseur.triggerevent(clicked!)
else
	// Modif
	recuperer(code_fournisseur_courant)
end if


//on récupère les codes internes maximaux des tables contacts et livraisons
//on le fait et dans des variables d'instances car plusieurs ajout possibles
//de contact et/ou livraisons : achaque ajout on incremente la variable d'instances
  SELECT MAX(cast (code as float))  
    INTO :max  
    FROM "contact"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )   ;
			
	SELECT MAX(cast (code as float))  
   	INTO :max2  
   	FROM "livraison"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )   ;

if isnull(max) then
	max = 1
end if
if isnull(max2) then
	max2 = 1
end if

ole_photo_arakis003.dossier_fournisseur = code_fournisseur_courant
ole_photo_arakis003.triggerevent(constructor!)

centrer(this)
uo_1.taille(this)


//this.backcolor = 16246738 //bleu un peu plus clair que sky

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
		cb_ajout_fournisseur.enabled = false
		tab_fournisseur.tabpage_contact.cb_supprimer_contact.enabled = false
		tab_fournisseur.tabpage_contact.cb_supprimer_contact.enabled = false
		tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.enabled = false
		tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.enabled = false
	Case 'M'
		// Modification
		cb_ajout_fournisseur.enabled = false
		tab_fournisseur.tabpage_contact.cb_supprimer_contact.enabled = false
		tab_fournisseur.tabpage_contact.cb_supprimer_contact.enabled = false
		tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.enabled = false
		tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.enabled = false
end choose

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


end event

event resize;uo_1.retaille(this)
end event

event close;call super::close;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_fournisseur_fiche
integer y = 908
end type

type cb_fermer from uo_picturebutton_390x120 within w_fournisseur_fiche
integer x = 2327
integer y = 2136
integer width = 562
integer taborder = 120
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
tab_fournisseur.tabpage_administratif.dw_admin.accepttext()
tab_fournisseur.tabpage_contact.dw_fiche.accepttext()
tab_fournisseur.tabpage_livraisons.dw_fiche2.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
	close(parent)
else

	if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or tab_fournisseur.tabpage_contact.dw_fiche.modifiedcount() > 0 or tab_fournisseur.tabpage_contact.dw_fiche.deletedcount()>0 or tab_fournisseur.tabpage_livraisons.dw_fiche2.modifiedcount() > 0 or tab_fournisseur.tabpage_livraisons.dw_fiche2.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_fournisseur_fiche
integer x = 1755
integer y = 2136
integer width = 562
integer taborder = 130
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update1, rapport_update2, rapport_update3, indextab


rapport_update1 = dw_basic.Update()

rapport_update2 = tab_fournisseur.tabpage_contact.dw_fiche.Update()

rapport_update3 = tab_fournisseur.tabpage_livraisons.dw_fiche2.Update()

if rapport_update1 = 1 and rapport_update2 = 1 and rapport_update3 = 1 then
	commit using sqlca ;
else
	rollback using sqlca ;
end if

indextab = tab_fournisseur.selectedtab
recuperer(code_fournisseur_courant)
tab_fournisseur.selecttab(indextab)
end event

type cb_annuler from uo_picturebutton_390x120 within w_fournisseur_fiche
integer x = 1184
integer y = 2136
integer width = 562
integer taborder = 110
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;integer i
rollback ;
i = tab_fournisseur.selectedtab
recuperer(code_fournisseur_courant)
if dw_basic.rowcount() > 0 then
	tab_fournisseur.tabpage_contact.dw_liste.retrieve(code_fournisseur_courant)
	tab_fournisseur.tabpage_contact.dw_fiche.reset()
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.visible = false
	tab_fournisseur.tabpage_livraisons.dw_liste2.retrieve(code_fournisseur_courant)
	tab_fournisseur.tabpage_livraisons.dw_fiche2.reset()
	tab_fournisseur.selecttab(i)
end if
end event

type cb_param from uo_picturebutton_390x120 within w_fournisseur_fiche
integer x = 613
integer y = 2136
integer width = 562
integer taborder = 100
string text = "&Réf. Bagues"
string iconname = "Custom046a!"
end type

event clicked;call super::clicked;openwithparm(w_reference_bague,code_fournisseur_courant)
end event

type cb_ajout_fournisseur from uo_picturebutton_390x120 within w_fournisseur_fiche
integer x = 41
integer y = 2136
integer width = 562
integer taborder = 90
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
tab_fournisseur.tabpage_administratif.dw_admin.accepttext()
tab_fournisseur.tabpage_contact.dw_fiche.accepttext()
tab_fournisseur.tabpage_livraisons.dw_fiche2.accepttext()
if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or tab_fournisseur.tabpage_contact.dw_fiche.modifiedcount() > 0 or tab_fournisseur.tabpage_contact.dw_fiche.deletedcount()>0 or tab_fournisseur.tabpage_livraisons.dw_fiche2.modifiedcount() > 0 or tab_fournisseur.tabpage_livraisons.dw_fiche2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		visi(0)
		ajouter_fournisseur()
	end if
else
	visi(0)
	ajouter_fournisseur()
end if
end event

type ole_photo_arakis003 from gearbox_fournisseur within w_fournisseur_fiche
boolean visible = true
integer x = 1650
integer y = 4
integer width = 1029
integer height = 452
integer taborder = 40
boolean border = false
end type

on ole_photo_arakis003.destroy
call gearbox_fournisseur::destroy
end on

type dw_ajout from datawindow within w_fournisseur_fiche
string tag = "brush"
boolean visible = false
integer x = 526
integer y = 724
integer width = 1243
integer height = 364
integer taborder = 50
string title = "none"
string dataobject = "dw_fournisseur_ajout_basic_data"
boolean livescroll = true
end type

type uo_1 from resize_fenetre within w_fournisseur_fiche
boolean visible = false
integer x = 1358
integer y = 832
integer taborder = 80
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_basic from datawindow within w_fournisseur_fiche
string tag = "brush"
integer x = 55
integer y = 16
integer width = 1477
integer height = 416
integer taborder = 10
string title = "none"
string dataobject = "dw_fournisseur_basic_data"
boolean livescroll = true
end type

event itemchanged;if dwo.name = 'code' then
	recuperer(data)
end if


if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event rowfocuschanged;code_fournisseur_courant = dw_basic.getitemstring(currentrow,"code")

end event

type tab_fournisseur from tab within w_fournisseur_fiche
integer x = 59
integer y = 496
integer width = 2793
integer height = 1604
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_administratif tabpage_administratif
tabpage_contact tabpage_contact
tabpage_livraisons tabpage_livraisons
end type

on tab_fournisseur.create
this.tabpage_administratif=create tabpage_administratif
this.tabpage_contact=create tabpage_contact
this.tabpage_livraisons=create tabpage_livraisons
this.Control[]={this.tabpage_administratif,&
this.tabpage_contact,&
this.tabpage_livraisons}
end on

on tab_fournisseur.destroy
destroy(this.tabpage_administratif)
destroy(this.tabpage_contact)
destroy(this.tabpage_livraisons)
end on

event selectionchanged;//on met à jour l'affichage des boutons en fonction de la page ouverte
//on prépare l'ajout d'un contact ou d'une livraison si liste vide

integer int_nb_liste_row, int_nb_liste2_row
if newindex = 1 then
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = false
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = false
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = false
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = false
end if
if newindex = 2 then
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = true
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = true
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = true
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = true
	int_nb_liste_row = tab_fournisseur.tabpage_contact.dw_liste.retrieve(code_fournisseur_courant)
	if int_nb_liste_row > 0 then
		tab_fournisseur.tabpage_contact.dw_fiche.retrieve(code_fournisseur_courant)
		
		//pour la gear box
		tab_fournisseur.tabpage_contact.ole_photo_arakis004.visible = true
		tab_fournisseur.tabpage_contact.ole_photo_arakis004.numero_contact = tab_fournisseur.tabpage_contact.dw_fiche.getitemstring(tab_fournisseur.tabpage_contact.dw_fiche.getrow(),"code")
		tab_fournisseur.tabpage_contact.ole_photo_arakis004.dossier_fournisseur = code_fournisseur_courant
		
		tab_fournisseur.tabpage_contact.ole_photo_arakis004.triggerevent(constructor!)
	else
		tab_fournisseur.tabpage_contact.ole_photo_arakis004.visible = false
	end if
end if
if newindex = 3 then
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = true
	tab_fournisseur.tabpage_contact.cb_supprimer_contact.visible = true
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = true
	tab_fournisseur.tabpage_livraisons.cb_ajouter_livraison.visible = true
	int_nb_liste2_row = tab_fournisseur.tabpage_livraisons.dw_liste2.retrieve(code_fournisseur_courant)
	if int_nb_liste2_row > 0 then
		tab_fournisseur.tabpage_livraisons.dw_fiche2.retrieve(code_fournisseur_courant)
	end if
end if



end event

type tabpage_administratif from userobject within tab_fournisseur
integer x = 18
integer y = 108
integer width = 2757
integer height = 1480
long backcolor = 16777215
string text = "Administratif"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_admin dw_admin
end type

on tabpage_administratif.create
this.dw_admin=create dw_admin
this.Control[]={this.dw_admin}
end on

on tabpage_administratif.destroy
destroy(this.dw_admin)
end on

type dw_admin from datawindow within tabpage_administratif
string tag = "brush"
integer x = 114
integer y = 48
integer width = 2112
integer height = 1416
integer taborder = 10
string title = "none"
string dataobject = "dw_fournisseur_data"
boolean border = false
boolean livescroll = true
end type

event itemfocuschanged;

IF row > 0 then
	ch_tel = "telephone"
	ch_fax = "fax"
	
	maj_code_postal(this,"code_postal","ville", ch_tel,ch_fax,lb_ville,lb_codep,dw_maj,ch_maj,pref)


	// Récupération du pays   et application 
	string v_pays
	v_pays = this.getitemstring(row, "code_pays")
	
	formater_zone_pays(v_pays, 'T', this, ch_tel)
	formater_zone_pays(v_pays, 'T', this, ch_fax)
	formater_zone_pays(v_pays, 'P', this, ch_fax)

end if
end event

event buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

this.accepttext()

if row > 0 then

	
	choose case ls_Object
		case "b_email" 
			// Envoi d'un email avec l'outil configuré sur le PC
				string v_email 
			
				v_email = this.getItemString(row, "email")
				send_email_autre(v_email)
		
			case "b_googlemaps"
				
				fxg_recherche_googlemaps (this.getitemstring(1, "adresse1"), this.getitemstring(1, "code_postal"),this.getitemstring(1, "ville"), this.getitemstring(1, "code_pays") )
		end choose
		
	end if
end event

event itemchanged;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event updateend;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email")
	if fxg_isvalid_email(email_a_verifier)  then
		return 0 
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données n'est pas effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 1
	end if
end if
end event

type tabpage_contact from userobject within tab_fournisseur
integer x = 18
integer y = 108
integer width = 2757
integer height = 1480
long backcolor = 16777215
string text = "Contacts"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_supprimer_contact cb_supprimer_contact
cb_ajouter_contact cb_ajouter_contact
ole_photo_arakis004 ole_photo_arakis004
dw_fiche dw_fiche
dw_liste dw_liste
end type

on tabpage_contact.create
this.cb_supprimer_contact=create cb_supprimer_contact
this.cb_ajouter_contact=create cb_ajouter_contact
this.ole_photo_arakis004=create ole_photo_arakis004
this.dw_fiche=create dw_fiche
this.dw_liste=create dw_liste
this.Control[]={this.cb_supprimer_contact,&
this.cb_ajouter_contact,&
this.ole_photo_arakis004,&
this.dw_fiche,&
this.dw_liste}
end on

on tabpage_contact.destroy
destroy(this.cb_supprimer_contact)
destroy(this.cb_ajouter_contact)
destroy(this.ole_photo_arakis004)
destroy(this.dw_fiche)
destroy(this.dw_liste)
end on

type cb_supprimer_contact from uo_picturebutton_390x120 within tabpage_contact
integer x = 2080
integer y = 1204
integer width = 549
integer height = 152
integer taborder = 41
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;integer  i
int nb_row
string code_courant

	nb_row = tab_fournisseur.tabpage_contact.dw_fiche.rowcount()
	
	if nb_row > 0 then
		code_courant = tab_fournisseur.tabpage_contact.dw_liste.getitemstring(tab_fournisseur.tabpage_contact.dw_liste.getrow(),"code")
		tab_fournisseur.tabpage_contact.dw_liste.deleterow(tab_fournisseur.tabpage_contact.dw_liste.getrow())
		for i = nb_row to 1 step -1
			if tab_fournisseur.tabpage_contact.dw_fiche.getitemstring(i,"code") = code_courant then
				tab_fournisseur.tabpage_contact.dw_fiche.deleterow(i)
			end if
		next
	else
		MessageBox("Attention","Vous devez séléctionner un contact")
	end if
	DeleteFileA(tab_fournisseur.tabpage_contact.ole_photo_arakis004.fichier_photo)
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.visible = false

end event

type cb_ajouter_contact from uo_picturebutton_390x120 within tabpage_contact
integer x = 2080
integer y = 1044
integer width = 549
integer height = 152
integer taborder = 31
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;	max = max + 1 //on incremente la variable d'instance max qui stocke le max du code interne de la table contact 
	tab_fournisseur.tabpage_contact.dw_fiche.insertrow(0)
	tab_fournisseur.tabpage_contact.dw_fiche.scrolltorow(tab_fournisseur.tabpage_contact.dw_fiche.rowcount())
	tab_fournisseur.tabpage_contact.dw_fiche.setitem(tab_fournisseur.tabpage_contact.dw_fiche.getrow(),"code_fournisseur",code_fournisseur_courant)
	tab_fournisseur.tabpage_contact.dw_fiche.setitem(tab_fournisseur.tabpage_contact.dw_fiche.getrow(),"code",string(max))
	tab_fournisseur.tabpage_contact.dw_fiche.setfocus()

end event

type ole_photo_arakis004 from gearbox_fournisseur within tabpage_contact
integer x = 1801
integer y = 400
integer taborder = 20
end type

on ole_photo_arakis004.destroy
call gearbox_fournisseur::destroy
end on

type dw_fiche from datawindow within tabpage_contact
string tag = "brush"
integer x = 41
integer y = 372
integer width = 1728
integer height = 1108
integer taborder = 20
string title = "none"
string dataobject = "dw_contact_data"
boolean border = false
boolean livescroll = true
end type

event itemfocuschanged;IF row > 0 then

	// Récupération du pays   et application 
	string v_pays
	v_pays = this.getitemstring(row, "code_pays")
	
	formater_zone_pays(v_pays, 'T', this, "telephone")
	formater_zone_pays(v_pays, 'T', this, "fax")
	formater_zone_pays(v_pays, 'P', this, "tel_portable")

end if
end event

event buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

this.accepttext()


If ls_Object = "b_email" Then
	// Envoi d'un email avec l'outil configuré sur le PC
	if row > 0 then
		string v_email 
	
		v_email = this.getItemString(row, "email")
		send_email_autre(v_email)

	end if
	
end if
end event

event updatestart;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email")
	if fxg_isvalid_email(email_a_verifier)  then
		return 0 
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données n'est pas effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 1
	end if
end if
end event

type dw_liste from u_basedw within tabpage_contact
string tag = "brush"
integer x = 23
integer y = 32
integer width = 2327
integer height = 340
integer taborder = 11
string dataobject = "dw_contact_liste"
boolean hscrollbar = false
boolean border = false
boolean livescroll = false
end type

event clicked;call super::clicked;string code
integer nb_row, i

if row > 0 then
	code = dw_liste.getitemstring(row,"code")
	
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.numero_contact = code
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.dossier_fournisseur = code_fournisseur_courant
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.fichier_photo = "" 
	tab_fournisseur.tabpage_contact.ole_photo_arakis004.triggerevent(constructor!)
	
	nb_row = dw_fiche.rowcount()
	FOR i = 1 to nb_row
		if dw_fiche.getitemstring(i,"code") = code then
			tab_fournisseur.tabpage_contact.dw_fiche.scrolltorow(i)
		end if
	NEXT
end if
end event

event retrieveend;call super::retrieveend;IF rowcount > 0 then

	// Récupération du pays   et application 
	string v_pays
	v_pays = this.getitemstring(1, "code_pays")
	
	formater_zone_pays(v_pays, 'T', this, "telephone")

end if
end event

type tabpage_livraisons from userobject within tab_fournisseur
integer x = 18
integer y = 108
integer width = 2757
integer height = 1480
long backcolor = 16777215
string text = "Livraisons"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_ajouter_livraison cb_ajouter_livraison
cb_supprimer_livraison cb_supprimer_livraison
dw_liste2 dw_liste2
dw_fiche2 dw_fiche2
end type

on tabpage_livraisons.create
this.cb_ajouter_livraison=create cb_ajouter_livraison
this.cb_supprimer_livraison=create cb_supprimer_livraison
this.dw_liste2=create dw_liste2
this.dw_fiche2=create dw_fiche2
this.Control[]={this.cb_ajouter_livraison,&
this.cb_supprimer_livraison,&
this.dw_liste2,&
this.dw_fiche2}
end on

on tabpage_livraisons.destroy
destroy(this.cb_ajouter_livraison)
destroy(this.cb_supprimer_livraison)
destroy(this.dw_liste2)
destroy(this.dw_fiche2)
end on

type cb_ajouter_livraison from uo_picturebutton_390x120 within tabpage_livraisons
integer x = 1810
integer y = 1044
integer width = 549
integer height = 152
integer taborder = 31
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;	//livraisons
	max2 = max2 + 1 //on incremente la variable d'instance max2 qui stocke le max du code interne de la table livraison 
	tab_fournisseur.tabpage_livraisons.dw_fiche2.insertrow(0)
	tab_fournisseur.tabpage_livraisons.dw_fiche2.scrolltorow(tab_fournisseur.tabpage_livraisons.dw_fiche2.rowcount())
	tab_fournisseur.tabpage_livraisons.dw_fiche2.setitem(tab_fournisseur.tabpage_livraisons.dw_fiche2.getrow(),"code_type_taxe",'TTC')
	tab_fournisseur.tabpage_livraisons.dw_fiche2.setitem(tab_fournisseur.tabpage_livraisons.dw_fiche2.getrow(),"code_fournisseur",code_fournisseur_courant)
	tab_fournisseur.tabpage_livraisons.dw_fiche2.setitem(tab_fournisseur.tabpage_livraisons.dw_fiche2.getrow(),"code",string(max2))
	tab_fournisseur.tabpage_livraisons.dw_fiche2.setfocus()

end event

type cb_supprimer_livraison from uo_picturebutton_390x120 within tabpage_livraisons
integer x = 1810
integer y = 1204
integer width = 549
integer height = 152
integer taborder = 41
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;integer i
int nb_row
string code_courant

nb_row = tab_fournisseur.tabpage_livraisons.dw_fiche2.rowcount()
	if nb_row > 0 then
		code_courant = tab_fournisseur.tabpage_livraisons.dw_liste2.getitemstring(tab_fournisseur.tabpage_livraisons.dw_liste2.getrow(),"code")
		tab_fournisseur.tabpage_livraisons.dw_liste2.deleterow(tab_fournisseur.tabpage_livraisons.dw_liste2.getrow())
		for i = nb_row to 1 step -1
			if tab_fournisseur.tabpage_livraisons.dw_fiche2.getitemstring(i,"code") = code_courant then
				tab_fournisseur.tabpage_livraisons.dw_fiche2.deleterow(i)
			end if
		next
	else
		MessageBox("Attention","Vous devez séléctionner une livraison")
	end if

end event

type dw_liste2 from u_basedw within tabpage_livraisons
string tag = "brush"
integer x = 567
integer y = 60
integer width = 1321
integer height = 348
integer taborder = 11
string dataobject = "dw_livraison_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;string code
integer nb_row, i

if row > 0 then
	code = dw_liste2.getitemstring(row,"code")
	nb_row = dw_fiche2.rowcount()
	
	FOR i = 1 to nb_row
		if dw_fiche2.getitemstring(i,"code") = code then
			tab_fournisseur.tabpage_livraisons.dw_fiche2.scrolltorow(i)
		end if
	NEXT
end if

end event

type dw_fiche2 from datawindow within tabpage_livraisons
string tag = "brush"
integer x = 238
integer y = 476
integer width = 1522
integer height = 844
integer taborder = 20
string title = "Fiche Fournisseur"
string dataobject = "dw_livraison_data"
boolean border = false
boolean livescroll = true
end type

type lb_ville from listbox within w_fournisseur_fiche
boolean visible = false
integer x = 1381
integer y = 108
integer width = 1134
integer height = 524
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

// Met le focus à la colonne téléphone
dw_maj.SetFocus()
dw_maj.SetColumn(ch_tel)

end event

event rbuttondown;lb_ville.visible = FALSE
end event

type lb_codep from listbox within w_fournisseur_fiche
boolean visible = false
integer x = 1330
integer y = 136
integer width = 1248
integer height = 528
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,left(this.selecteditem(),5))

// On bidouille ici pour aller mettre à jour le champ suivant
// le code postal, à savoir LA VILLE
dw_maj.setcolumn(ch_maj)
dw_maj.setitem(v_row, (dw_maj.getcolumn() + 1), mid(this.selecteditem(),7,len(this.selecteditem()) - 6))


this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if
	
// Met le focus à la colonne téléphone
dw_maj.SetFocus()
dw_maj.SetColumn(ch_tel)
end event

event rbuttondown;lb_codep.visible = FALSE
end event

type cb_annuler_ajout from uo_picturebutton_390x120 within w_fournisseur_fiche
boolean visible = false
integer x = 672
integer y = 1192
integer width = 512
integer taborder = 70
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;if dw_basic.rowcount() > 0 then
	recuperer(code_fournisseur_courant)
	visi(1)
else
//	close(parent)
end if
end event

type cb_continuer from uo_picturebutton_390x120 within w_fournisseur_fiche
boolean visible = false
integer x = 1257
integer y = 1192
integer width = 512
integer taborder = 60
boolean bringtotop = true
string text = "Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;int rapport_update

dw_ajout.accepttext()
rapport_update = dw_ajout.Update()

if rapport_update = 1 then
	commit using sqlca ;
	code_fournisseur_courant = dw_ajout.getitemstring(dw_ajout.getrow(),"code")
	recuperer(code_fournisseur_courant)
	visi(1)
else
	rollback using sqlca ;
end if



end event

