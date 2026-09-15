$PBExportHeader$w_coment_qualite_traitement.srw
forward
global type w_coment_qualite_traitement from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_coment_qualite_traitement
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_coment_qualite_traitement
end type
type cb_annuler from uo_picturebutton_390x120 within w_coment_qualite_traitement
end type
type dw_1 from datawindow within w_coment_qualite_traitement
end type
end forward

global type w_coment_qualite_traitement from w_fenetre_arakis
integer width = 2071
integer height = 2496
string title = "Qualité du Traitement"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_1 dw_1
end type
global w_coment_qualite_traitement w_coment_qualite_traitement

type variables



double var_code_local
end variables

forward prototypes
public subroutine maj_couleur (long v_code_qualite)
public subroutine maj_couleur_respect ()
public subroutine maj_couleur (datawindow dw)
public subroutine maj_dates (datawindow dw)
end prototypes

public subroutine maj_couleur (long v_code_qualite);

// Mise à jour de la courrleur de la qualité du traitement

if dw_1.rowcount() > 0 then
	// En principe pas possible mais 
	
	long v_couleur
	
	select couleur into :v_couleur from qualite_traitement where code = :v_code_qualite;

	if isnull(v_couleur) then
		dw_1.modify ("t_couleur.text = '?????''")
	else
		dw_1.modify ("t_couleur.text = '''")
		dw_1.modify ("t_couleur.background.color = '"+string(v_couleur)+"'")
	end if
	
	
	
	
	
end if
end subroutine

public subroutine maj_couleur_respect ();

// Mise à jour de la courrleur de la qualité du traitement

if dw_1.rowcount() > 0 then
	// En principe pas possible mais 
	
	long v_ecart
	long v_couleur
	
	string rc
	
	v_ecart = dw_1.getitemnumber(dw_1.getrow(),"ecart")
	
	declare cur cursor for select couleur  from respect_delai_traitement where jours_ecart < :v_ecart order by jours_ecart desc ;
	
	
	open cur ;
	fetch first cur into :v_couleur ;
	close cur ;
	
	rc = dw_1.modify ("t_couleur_respect.background.color = '"+string(v_couleur)+"'")
	

	
end if
end subroutine

public subroutine maj_couleur (datawindow dw);

// Mise à jour de la courrleur de la qualité du traitement

if dw.rowcount() > 0 then
	// En principe pas possible mais 
	
	long v_code_qualite
	long v_couleur
	
	string rc
	
	v_code_qualite = dw.getitemnumber(dw.getrow(),"qualite_traitement")
	
	if isnull(v_code_qualite) then
		dw.modify ("t_couleur.text = '?????''")
	else
		select couleur into :v_couleur from qualite_traitement where code = :v_code_qualite;
		dw.modify ("t_couleur.text = '''")
		dw.modify ("t_couleur.background.color = '"+string(v_couleur)+"'")
	end if
	

	
end if
end subroutine

public subroutine maj_dates (datawindow dw);

// mise à jour des dates en auto 


dw.accepttext()


date v_debut, v_reprise, v_fin_estimee, v_fin_reelle

long duree1
integer duree2, duree3

string v_unite

if dw.rowcount() > 0 then
	
	v_debut = dw.getitemdate(dw.getrow(),"debut_traitement")
	v_reprise = dw.getitemdate(dw.getrow(),"date_reprise")
	v_fin_reelle = dw.getitemdate(dw.getrow(),"fin_traitement")
	
	duree1 = dw.getitemnumber(dw.getrow(),"duree_traitement")
	duree2 = dw.getitemnumber(dw.getrow(),"duree_traitement_surveillance")
	duree3 = dw.getitemnumber(dw.getrow(),"duree_traitement_apres")

	v_unite = dw.getitemString(dw.getrow(),"duree_traitement_unite")
	
	zerol(duree1)
	zeroi(duree2)
	zeroi(duree3)
	
	
	
	if not isnull(v_debut) and duree1 + duree2 + duree3 > 0 then
		
		v_fin_estimee = calcul_date_fin_traitement( string(v_debut) , duree1 ,  duree2, string(v_reprise) , duree3, v_unite)
	
		dw.setitem(dw.getrow(),"fin_traitement_estimee",v_fin_estimee)
		
		
		long v_ecart
		long v_couleur
		
		string rc
		
		// On ne prend pas écart dans la dw because pas encore mise à jour
		//v_ecart = dw.getitemnumber(dw.getrow(),"ecart")
		v_ecart = daysafter( v_fin_estimee ,  v_fin_reelle ) 
		declare cur cursor for select couleur  from respect_delai_traitement where jours_ecart > :v_ecart order by jours_ecart asc  ;
		
		
		open cur ;
		fetch cur into :v_couleur ;
		close cur ;
		
		dw.modify ("t_couleur_respect.text = '''")
		dw.modify ("t_couleur_respect.background.color = '"+string(v_couleur)+"'")
	

	else
		setnull(v_fin_estimee)
		dw.modify ("t_couleur_respect.text = '?????''")
	end if

	
	
	
end if

end subroutine

on w_coment_qualite_traitement.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.dw_1
end on

on w_coment_qualite_traitement.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_1)
end on

event open;call super::open;

//récup du message d'ouverture
var_code_local = message.doubleparm

// Mise en place d'un motif par défaut si le motif est null 
long motif_defaut
select min(code) into :motif_defaut from motif_fin_traitement as motif1 
where ordre_trie  = (select min(ordre_trie) from motif_fin_traitement) ;
update patient set motif_fin_traitement = :motif_defaut where motif_fin_traitement is null and code = :var_code_local ;


// Idem pour la qualité par défaut
long qualite_defaut
select min(code) into :qualite_defaut from qualite_traitement as qualite1 
where ordre_trie  = (select min(ordre_trie) from qualite_traitement) ;
update patient set qualite_traitement = :qualite_defaut where qualite_traitement is null and code = :var_code_local ;
 

commit ;

//retrieve de la datawindow
dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)


if enregistrement_automatique then
	cb_enregistrer.visible = false
	cb_annuler.visible = false
end if

end event

event activate;call super::activate;


// repositionnement de la fenêtre en haut à droite !!!

environment env

GetEnvironment(env)
	
this.y = 0
this.x =  PixelsToUnits(env.ScreenWidth,XPixelsToUnits!) - this.width - 20


colore_datawindow(dw_1)

end event

type p_fond from w_fenetre_arakis`p_fond within w_coment_qualite_traitement
end type

type cb_fermer from uo_picturebutton_390x120 within w_coment_qualite_traitement
integer x = 1266
integer y = 2248
integer width = 457
integer taborder = 40
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if not enregistrement_automatique then
	dw_1.accepttext()

	if dw_1.modifiedcount() > 0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
else
	
	cb_enregistrer.triggerevent(clicked!)	
	close(parent)
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_coment_qualite_traitement
integer x = 795
integer y = 2248
integer width = 457
integer taborder = 30
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_1.accepttext()

if dw_1.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_coment_qualite_traitement
integer x = 325
integer y = 2248
integer width = 457
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_1.retrieve(var_code_local)
end event

type dw_1 from datawindow within w_coment_qualite_traitement
string tag = "brush"
integer x = 18
integer y = 20
integer width = 2011
integer height = 2184
integer taborder = 10
string title = "none"
string dataobject = "dw_coment_qualite_traitement"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;

// Mise à jour de la couleur de la qualite
maj_couleur(dw_1)

// mise à jour des dates et couleur de respect
maj_dates(dw_1)


this.update()


end event

event itemchanged;accepttext()


if not isnull(dwo) then
	
	// Mise a jour de la couleurs
	if dwo.type = "column" and dwo.name = 'qualite_traitement' then

		long code_qualite
		// récupération du code à la volée
		code_qualite = long(this.gettext())
		maj_couleur(code_qualite)
	
	end if
end if

// Mise à jour des dates
maj_dates(this)



if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event buttonclicked;string ls_object

ls_Object = String(dwo.name)


If ls_Object = "b_debut_traitement" Then
	// Date de jour
	set_today(this, "debut_traitement")
end if
If ls_Object = "b_fin_traitement" Then
	// Date de jour
	set_today(this, "fin_traitement")
end if
If ls_Object = "b_date_reprise" Then
	// Date de jour
	set_today(this, "date_reprise")
end if

end event

