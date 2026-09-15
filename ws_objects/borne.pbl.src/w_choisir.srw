$PBExportHeader$w_choisir.srw
forward
global type w_choisir from window
end type
type cb_annuler from commandbutton within w_choisir
end type
type cb_choisir from commandbutton within w_choisir
end type
type st_etat from statictext within w_choisir
end type
type dw_liste from datawindow within w_choisir
end type
end forward

global type w_choisir from window
integer width = 3653
integer height = 2380
boolean titlebar = true
string title = "Plusieurs patients correspondent à la saisie ..."
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
cb_annuler cb_annuler
cb_choisir cb_choisir
st_etat st_etat
dw_liste dw_liste
end type
global w_choisir w_choisir

type variables



string v_etat_par_defaut		// Servira à stocker l'état par défaut d'un rdv à la création 
end variables

forward prototypes
public subroutine choisir (long ligne)
end prototypes

public subroutine choisir (long ligne);
// On a choisit le patient ...
//=> Mise à jour de la salle d'attente

double v_code 
integer res
date v_date_naissance
double v_due, v_montant_minimal
patient v_patient


v_code = dw_liste.getitemnumber(ligne,"code")

trace(" - Recherche pour " + dw_liste.getitemString(ligne,"nom") + " " +  dw_liste.getitemString(ligne,"prenom") + " Code interne : " + string(v_code))


// on prend le premier rendez-vous trouvé pour le patient (s'il en a 2 dans la journée)
datetime prems , prems_plus_une_heure
double v_code_interne
string v_message_borne_patient

string etat_salle_attente
etat_salle_attente = ProfileString (dir_ini+"orthokis.ini","Borne","etat_salle_attente","S")

// recherche du rdv à mettre à jour
select min(rdv) into :prems from rdv, etat_rdv where date(rdv) = today(*) and rdv.code = :v_code and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' and absent = :v_etat_par_defaut ; 

prems_plus_une_heure = datetime( date(prems), relativetime(time(prems), 3600))


// code interne du rdv à mettre à jour
select round(min(code_interne),0) into :v_code_interne from rdv 
where date(rdv) = today(*) and code = :v_code and rdv = :prems ;

string v_etat_rdv_type_rdv = ""
string v_etat_rdv_type_rdv_message_enfant = ""
string v_etat_rdv_type_rdv_message_adulte = ""

// Le texte d'accueil et l'état de salle d'attente peuvent dépendre du type de rendez-vous ...
select isnull(type_rdv.etat_borne, '')
into :v_etat_rdv_type_rdv 
from rdv, type_rdv 
where rdv."type" = type_rdv.code and round(rdv.code_interne,0) = :v_code_interne ;

Trace("- Code interne du rendez-vous : " + string(v_code_interne))
Trace("- Etat salle d'attente général : " + etat_salle_attente)

if v_etat_rdv_type_rdv <> "" then
	// on remplace l'état par défaut de la salle d'attente ..
	etat_salle_attente = v_etat_rdv_type_rdv
	Trace("=> Etat salle d'attente pour ce type de rendez-vous : " + v_etat_rdv_type_rdv)
	
	// Recherche des textes spécifiques sur l'état du rendez-vous
	select isnull(message_enfant_borne, '') , isnull(message_adulte_borne, '')  
	into :v_etat_rdv_type_rdv_message_enfant, :v_etat_rdv_type_rdv_message_adulte 
	from etat_rdv 
	where etat_rdv.code = :v_etat_rdv_type_rdv ;
end if


// Depuis 2012, on prend les RDV dans l'heure (si le patient à 2 rdv à la suite)
update rdv set absent = :etat_salle_attente, arrivee = now(*) , user_modif = :utilisateur_code , date_modif = now(*) 
where round(code_interne,0) in ( select round(code_interne,0) from rdv, etat_rdv where date(rdv) = today(*) and rdv.code = :v_code and 
rdv between :prems and :prems_plus_une_heure and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' ) ;

if sqlca.sqlcode = 0 then 
	trace("- Mise à jour du rendez-vous ok ") 
	commit ;
else
	trace("- ERREUR DANS LA MISE A JOUR DU RENDEZ-VOUS : " + sqlca.sqlerrtext)
	rollback ;
end if


integer v_heure, v_minute, v_retard
string v_message_specifique, v_message_specifique_adulte, v_son_specifique_borne
string v_type_rdv
datetime v_rdv

if version_ce_logiciel_borne < "36.90" then 
	// Recherche de l'heure à laquelle il avait rdv et d'un message spécifique éventuel
	select hour(rdv) , minute(rdv), minutes(rdv, arrivee), isnull(type_rdv.message_salle_attente,''), isnull(type_rdv.message_addulte_salle_attente,''), rdv."type", "rdv"."rdv"
	into :v_heure, :v_minute , :v_retard , :v_message_specifique, :v_message_specifique_adulte, :v_type_rdv, :v_rdv
	from "rdv" , "type_rdv" 
	where round(code_interne,0) = :v_code_interne and rdv."type" = type_rdv.code ;
else
	// Recherche de l'heure à laquelle il avait rdv et d'un message spécifique éventuel
	select hour(rdv) , minute(rdv), minutes(rdv, arrivee), isnull(type_rdv.message_salle_attente,''), isnull(type_rdv.message_addulte_salle_attente,''), rdv."type", "rdv"."rdv", isnull(type_rdv.son_borne,'')
	into :v_heure, :v_minute , :v_retard , :v_message_specifique, :v_message_specifique_adulte, :v_type_rdv, :v_rdv, :v_son_specifique_borne
	from "rdv" , "type_rdv" 
	where round(code_interne,0) = :v_code_interne and rdv."type" = type_rdv.code ;
end if

// Recherche de texte selon l'état du rendez-vous
if dw_liste.getitemstring(ligne,"adulte") = "N" and v_message_specifique = "" and  v_etat_rdv_type_rdv <> "" and v_etat_rdv_type_rdv_message_enfant <> "" then
	//v_patient.etat_rdv_message_enfant = v_etat_rdv_type_rdv_message_enfant
	v_message_specifique= v_etat_rdv_type_rdv_message_enfant
end if
if dw_liste.getitemstring(ligne,"adulte") = "O" and v_message_specifique_adulte = "" and  v_etat_rdv_type_rdv <> "" and v_etat_rdv_type_rdv_message_adulte <> "" then
	//v_patient.etat_rdv_message_adulte = v_etat_rdv_type_rdv_message_adulte
	v_message_specifique_adulte = v_etat_rdv_type_rdv_message_adulte
end if

	



// Envoi de SMS ??

if OPERATEUR_SMS = 2 then
	// Gestion des alertes par SMS sur les arrivées / départs de patient ... si Dental SMS
	st_rdv2 st_rdv
	
	st_rdv.code_patient = v_code
	st_rdv.etat = etat_salle_attente
	st_rdv.rdv = v_rdv
	st_rdv.afficher_message_confirmation = false
	openwithparm( w_sms_alertes_depart_arrivee , st_rdv)

end if



// Selon le type de rendez-vous, on ajoute ou pas des soins automatiques 
string v_ajout_soin
double v_ajout_soin_code

// pour tous les rdv du patient (au cas ou plusieurs)

declare cur cursor for select "type" from rdv where round(code_interne,0) in ( select round(code_interne,0) from rdv, etat_rdv where date(rdv) = today(*) and rdv.code = :v_code and 
rdv between :prems and :prems_plus_une_heure and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda = 'N' ) ;

open cur ;

fetch cur into :v_type_rdv ;

do while sqlca.sqlcode = 0

	// Si patient arrive en salle d'attente ... doit on ajouter des soins ?
	select ajout_soin, ajout_soin_code into :v_ajout_soin, :v_ajout_soin_code from type_rdv where code = :v_type_rdv ;
	
	if v_ajout_soin = "O" then
		trace("- Ajout de soins automatiques : " + string(v_ajout_soin_code)  )

		// Ajout de soins automatique
		ajout_soins_automatiques(v_code, "S", v_ajout_soin_code, 1, today(), true, false, 0, 0, false)
	end if
	
	// Les automatistimes de changement de type de dossier et de mise à jour de dates
	verif_change_dossier_auto_rdv(v_code, v_type_rdv, etat_salle_attente)
	
	fetch cur into :v_type_rdv ;

loop

close cur ;

// Mise en mémoire de l'état du rdv
ajout_histo_etat_rdv( v_code_interne, etat_salle_attente )

v_patient.nom = dw_liste.getitemstring(ligne,"nom")
v_patient.prenom = dw_liste.getitemstring(ligne,"prenom")
v_patient.adulte = dw_liste.getitemstring(ligne,"adulte")
v_patient.titre = dw_liste.getitemstring(ligne,"titre")
v_patient.heure = string(v_heure)+" h "+string(v_minute)
// Pour les retard ET les avances
v_patient.retard = string(v_retard)
v_patient.message_specifique = v_message_specifique
v_patient.message_specifique_adulte = v_message_specifique_adulte
v_patient.code = v_code
v_patient.son_specifique = v_son_specifique_borne

// Ajout d'infos supplémentaires ... 
select numero_dossier, moulage , date_naissance, isnull(message_borne, '')
into :v_patient.numero_dossier, :v_patient.moulage, :v_date_naissance, :v_message_borne_patient
from patient 
where code = :v_code ;

// Y a t il un message prioritaire GENERAL à diffuser en plus
string v_message
select top 1 isnull(message_borne,'') into :v_message from param ;

if v_message <> "" then
	param_win[1] = "M" 	// Type de message de la fenetre message
	OpenWithParm(w_message , v_patient)		// on passe v_patient inquement pour compatibilité
end if


// Anniversaire ?
boolean v_souhaiter_anniversaire

if v_patient.adulte = "O" then
	if ProfileString (dir_ini+"orthokis.ini","Borne","souhaiter_anniversaire_adulte","N") = "O" then
		v_souhaiter_anniversaire = true
	else
		v_souhaiter_anniversaire = false
	end if
else
	if ProfileString (dir_ini+"orthokis.ini","Borne","souhaiter_anniversaire","N") = "O" then
		v_souhaiter_anniversaire = true
	else
		v_souhaiter_anniversaire = false
	end if
end if

if v_souhaiter_anniversaire then 
	
	// Est ce l'anniversaire du patient le jour même (res = 2) ?
	res =  calcul_anniversaire(string( v_date_naissance))
	
	// C'est le Jour J
	if res = 2 then
		param_win[1] = "A" 	// Type de message de la fenetre message
		OpenWithParm(w_message , v_patient)		
	end if
end if

// Y a t il un message PRIORITAIRE SPECIQUE AU PATIENT à diffuser à la place des autres ?

if v_message_borne_patient <> "" then
	// message de spécifique patient (saisit dans la fiche administative)
	// depuis 2019 + c'est un message supplémentaire, qui ne remplace pas 
	param_win[1] = "P" 	// Type de message de la fenetre message
	OpenWithParm(w_message , v_patient)		
end if

// y a t il somme due
v_due = due(v_code, today())
v_montant_minimal = double( ProfileString (dir_ini+"orthokis.ini","Borne","montant_minimal_retard","999999.99") )

if v_due >= v_montant_minimal then 
	// message de retard de règlement qui remplace la bienvenue
	param_win[1] = "R" 	// Type de message de la fenetre message
	OpenWithParm(w_message , v_patient)		

else

	if ProfileString (dir_ini+"orthokis.ini","Borne","pronostics_actives","N") = "O" then
		// Pronostics pour Pic et Mailly ?
	
		integer nb_match 
		// Y a t il un match prévu aujourd'hui ?
		select count(*) into :nb_match from matchs where "date" = today(*) ; 
		
		if nb_match = 0 then
			trace("- Message Bienvenue")
			// Fenêtre normale
			openWithParm(w_bienvenue, v_patient)
		else
			// Fenêtre spéciale
			openWithParm(w_bienvenue_pronostics, v_patient)
		end if
		
	else
		// Fenetre normal d'accueil
		trace("- Message Bienvenue")
		openWithParm(w_bienvenue, v_patient)
	end if
end if

close(this)
end subroutine

on w_choisir.create
this.cb_annuler=create cb_annuler
this.cb_choisir=create cb_choisir
this.st_etat=create st_etat
this.dw_liste=create dw_liste
this.Control[]={this.cb_annuler,&
this.cb_choisir,&
this.st_etat,&
this.dw_liste}
end on

on w_choisir.destroy
destroy(this.cb_annuler)
destroy(this.cb_choisir)
destroy(this.st_etat)
destroy(this.dw_liste)
end on

event open;st_etat.text = "Recherche en cours ..."

trace("------------------------ Début w_choisir ----------------------------")

// Etat par défaut
SELECT isnull(min(code),'N') INTO :v_etat_par_defaut FROM etat_rdv where ordre_trie = (select min(ordre_trie) from etat_rdv where actif = 1 ) ;


// Si on saisit un nom ou un prénom

DECLARE cur_rdv CURSOR FOR 
SELECT patient.code, patient.nom, isnull(patient.prenom,''), patient.adulte, patient.titre_patient  from patient , rdv 
WHERE isnull(patient.nom,'') like :v_nom_saisi and isnull(patient.prenom,'') like :v_prenom_saisi 
and 	date(rdv) = today(*) and absent = :v_etat_par_defaut and patient.code = rdv.code 
group by patient.code, patient.nom, patient.prenom, patient.adulte, patient.titre_patient ;


// Si on saisit un Pass Sanitaire

DECLARE cur_rdv_pass CURSOR FOR 
SELECT patient.code, patient.nom, isnull(patient.prenom,''), patient.adulte, patient.titre_patient  from patient , rdv 
WHERE isnull(patient.nom,'') = :v_nom_saisi and isnull(patient.prenom,'') = :v_prenom_saisi and date_naissance = :v_date_naissance_saisie
and 	date(rdv) = today(*) and absent = :v_etat_par_defaut and patient.code = rdv.code 
group by patient.code, patient.nom, patient.prenom, patient.adulte, patient.titre_patient ;


// Si on saisit un numéro de dossier
DECLARE cur_rdv2 CURSOR FOR 
SELECT patient.code, patient.nom, isnull(patient.prenom,''), patient.adulte, patient.titre_patient  from patient , rdv 
WHERE patient.numero_dossier = :v_numero_dossier_saisi 
and 	date(rdv) = today(*) and absent = :v_etat_par_defaut and patient.code = rdv.code 
group by patient.code, patient.nom, patient.prenom, patient.adulte, patient.titre_patient ;

string v_nom, v_prenom, v_adulte, v_code_titre, v_nom_titre 
double v_code

//messagebox("trace", "Choisir Entrée")

dw_liste.reset()

//messagebox("trace", "Type qrcode : " + v_type_qr_code ) 
//messagebox("trace", "Saisise : ~n~nNom : " + v_nom_saisi + "~n~nPrénom : " +v_prenom_saisi + + "~n~nDate N : " +string(v_date_naissance_saisie)   ) 
//messagebox("trace", "Saisise : ~n~nNom : " + v_nom_saisi + "~n~nPrénom : " +v_prenom_saisi    ) 

if v_numero_dossier_saisi > 0 then
	open cur_rdv2 ;
	fetch cur_rdv2 into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
else
	if v_type_qr_code <> "" then 
		open cur_rdv_pass ;
		fetch cur_rdv_pass into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
		
		//messagebox("trace", "sqlca.sqlcode : " + string(sqlca.sqlcode))
		
	else
		//messagebox("trace", "Curseur sur le nom")
		open cur_rdv ;
		//messagebox("trace", "Résultat de l'open : " + string(sqlca.sqlcode)  + " - " + sqlca.sqlerrtext )
		fetch cur_rdv into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
	end if
end if

//messagebox("trace", "Résultat du Fetch : " + string(sqlca.sqlcode)  + " - " + sqlca.sqlerrtext )


//select nom, prenom into :v_nom_saisi, :v_prenom_saisi from patient where numero_dossier = :v_numero_dossier_saisi ;

if sqlca.sqlcode <> 0 and  sqlca.sqlcode <> 100 then
	
	MessageBox("ATTENTION !","Erreur dans la recherche (" + string(sqlca.sqlcode) + ") : ~n~n" + sqlca.sqlerrtext)
	
else
	
	do while sqlca.sqlcode = 0
	
		//messagebox("trace", "Ajout de : " + v_nom + " - " + v_prenom )
		dw_liste.insertrow(0)
		dw_liste.setitem(dw_liste.rowcount(),"code",v_code)
		dw_liste.setitem(dw_liste.rowcount(),"nom",v_nom)
		dw_liste.setitem(dw_liste.rowcount(),"prenom",v_prenom)
		dw_liste.setitem(dw_liste.rowcount(),"adulte",v_adulte)
		
		v_nom_titre = ""
		select nom into :v_nom_titre from titre_personnes where code = :v_code_titre ;
		
		if isnull(v_nom_titre) then v_nom_titre = ""
		
		dw_liste.setitem(dw_liste.rowcount(),"titre",v_nom_titre)
	
		dw_liste.sort()
			
		if v_numero_dossier_saisi > 0 then
			fetch cur_rdv2 into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
		else
			if v_type_qr_code <> "" then 
				fetch cur_rdv_pass into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
			else
				fetch cur_rdv into :v_code, :v_nom, :v_prenom,  :v_adulte, :v_code_titre ;
			end if
		end if

	
	loop
	
end if


if v_numero_dossier_saisi > 0 then
	close cur_rdv2 ;
else
	if v_type_qr_code <> "" then 
		close cur_rdv_pass ;
	else
		close cur_rdv ;
	end if
end if

trace("- Nombre de rdv trouvés : " + string(dw_liste.rowcount()))




// A la fin de la recherche .. on analyse !!

if dw_liste.rowcount() = 0 then
	trace("- Message non trouvé !")
	//MessageBox("ATTENTION","Nous sommes désolés mais nous trouvons pas de patient pour ces critères !~n~nVeuillez réessayer ou vous présenter au secrétariat.")
	open(w_non_trouve)
	close(this)
else
	if dw_liste.rowcount() = 1 then
		trace("- 1 trouvé")
		choisir(1)
	else
	trace("- Choix dans la liste!")
//				// il faut choisir dans la liste
//				if image_fond <> "" then
//					Messagebox("INFORMATION","Veuillez cliquer sur votre nom dans la liste puis cliquer sur Choisir.")
//				else
//					st_etat.text = "Veuillez cliquer sur votre nom dans la liste puis cliquer sur Choisir."
//				end if
	end if
end if
trace("------------------------ Fin w_choisir ----------------------------")

end event

type cb_annuler from commandbutton within w_choisir
integer x = 1746
integer y = 1960
integer width = 1088
integer height = 300
integer taborder = 30
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Annuler"
end type

event clicked;


// On se remet à l'état initial !!!
close(parent)
end event

type cb_choisir from commandbutton within w_choisir
integer x = 603
integer y = 1960
integer width = 1088
integer height = 300
integer taborder = 30
integer textsize = -28
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Choisir"
end type

event clicked;

//on prend celui qui est cliqué !!
choisir(dw_liste.getrow())




end event

type st_etat from statictext within w_choisir
integer x = 27
integer y = 32
integer width = 3506
integer height = 360
integer textsize = -28
string facename = "Tahoma"
long backcolor = 553648127
boolean enabled = false
string text = "Veuillez indiquer votre nom sur la liste puis cliquer sur Choisir"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_liste from datawindow within w_choisir
integer x = 27
integer y = 428
integer width = 3502
integer height = 1488
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_borne"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

event itemchanged;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

