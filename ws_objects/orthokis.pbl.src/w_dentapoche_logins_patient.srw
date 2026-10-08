$PBExportHeader$w_dentapoche_logins_patient.srw
forward
global type w_dentapoche_logins_patient from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
end type
type cb_annuler from uo_picturebutton_390x120 within w_dentapoche_logins_patient
end type
type cb_fermer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
end type
type dw_liste from datawindow within w_dentapoche_logins_patient
end type
type uo_1 from resize_fenetre within w_dentapoche_logins_patient
end type
type cb_patient from uo_picturebutton_250x120 within w_dentapoche_logins_patient
end type
type cb_parent1 from uo_picturebutton_250x120 within w_dentapoche_logins_patient
end type
type cb_parent2 from uo_picturebutton_250x120 within w_dentapoche_logins_patient
end type
type cb_payeur from uo_picturebutton_250x120 within w_dentapoche_logins_patient
end type
type cb_modifier from uo_picturebutton_390x120 within w_dentapoche_logins_patient
end type
type cb_supprimer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
end type
type gb_inscriptions from groupbox within w_dentapoche_logins_patient
end type
end forward

global type w_dentapoche_logins_patient from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 4928
integer height = 1988
string title = "Inscriptions Dentapoche pour le patient"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
dw_liste dw_liste
uo_1 uo_1
cb_patient cb_patient
cb_parent1 cb_parent1
cb_parent2 cb_parent2
cb_payeur cb_payeur
cb_modifier cb_modifier
cb_supprimer cb_supprimer
gb_inscriptions gb_inscriptions
end type
global w_dentapoche_logins_patient w_dentapoche_logins_patient

type variables
double var_code_local
end variables

forward prototypes
public subroutine wf_separation_nom_prenom (ref string as_nom, ref string as_prenom)
public subroutine wf_repositionnement (long as_lig)
end prototypes

public subroutine wf_separation_nom_prenom (ref string as_nom, ref string as_prenom);// Séparation d'une zone nom en nom + prenom
// En prenant comme prénom la partie de droite après un espace

integer li_pos_espace

as_nom = trim(as_nom)
li_pos_espace = pos(as_nom, " ")

if li_pos_espace > 0 then 
	as_prenom = right(as_nom, len(as_nom) - li_pos_espace)
	as_nom = left(as_nom, li_pos_espace - 1 )
else
	as_prenom = ""
end if
end subroutine

public subroutine wf_repositionnement (long as_lig);// repositionnement de liste sur la liste 

dw_liste.retrieve(var_code_local)

if as_lig > 0 then 
	dw_liste.Scrolltorow(as_lig)
	dw_liste.Setrow(as_lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(as_lig,True)
end if
end subroutine

event open;
var_code_local = message.doubleparm

uo_1.taille(this)
dw_liste.settransobject(sqlca)


colore_datawindow(dw_liste)
backcolor = couleur_fond_fenetre

cb_annuler.triggerevent(clicked!)

if enregistrement_automatique then
	cb_enregistrer.visible = false
	cb_annuler.visible = false
end if










end event

on w_dentapoche_logins_patient.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.cb_patient=create cb_patient
this.cb_parent1=create cb_parent1
this.cb_parent2=create cb_parent2
this.cb_payeur=create cb_payeur
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.gb_inscriptions=create gb_inscriptions
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.cb_patient
this.Control[iCurrent+7]=this.cb_parent1
this.Control[iCurrent+8]=this.cb_parent2
this.Control[iCurrent+9]=this.cb_payeur
this.Control[iCurrent+10]=this.cb_modifier
this.Control[iCurrent+11]=this.cb_supprimer
this.Control[iCurrent+12]=this.gb_inscriptions
end on

on w_dentapoche_logins_patient.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.cb_patient)
destroy(this.cb_parent1)
destroy(this.cb_parent2)
destroy(this.cb_payeur)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.gb_inscriptions)
end on

event close;call super::close;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event resize;call super::resize;uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_dentapoche_logins_patient
integer x = 2363
integer y = 1584
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
integer x = 3685
integer y = 1572
integer width = 562
integer taborder = 60
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

boolean v_suite

v_suite = true

dw_liste.accepttext()

if v_suite then
	if dw_liste.update() = 1   then
		commit ;
	else
		Rollback ;
	end if
end if




end event

type cb_annuler from uo_picturebutton_390x120 within w_dentapoche_logins_patient
integer x = 3095
integer y = 1572
integer width = 562
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
dw_liste.retrieve(var_code_local)




end event

type cb_fermer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
integer x = 4274
integer y = 1572
integer width = 562
integer taborder = 50
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if dw_liste.modifiedcount() > 0  then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type dw_liste from datawindow within w_dentapoche_logins_patient
string tag = "brush"
integer x = 562
integer y = 44
integer width = 3845
integer height = 1412
integer taborder = 10
string title = "none"
string dataobject = "dw_dentapoche_logins_patient"
boolean livescroll = true
end type

event clicked;If Row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
	this.Setrow(row)
End If
end event

event doubleclicked;

if row > 0 then
	
	this.setrow(row)
	
	cb_modifier.postevent(clicked!)
	
end if
end event

type uo_1 from resize_fenetre within w_dentapoche_logins_patient
boolean visible = false
integer x = 3328
integer y = 952
integer taborder = 60
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_patient from uo_picturebutton_250x120 within w_dentapoche_logins_patient
integer x = 119
integer y = 1612
integer taborder = 70
boolean bringtotop = true
string text = "Patient"
end type

event clicked;call super::clicked;long lig, tot
string ls_nom, ls_prenom, ls_telephone, ls_login, ls_mot_passe
double ldb_id_personne


tot = dw_liste.rowcount()

if dw_liste.find("dentapoche_liens_type_lien = 'P'" , 1, tot)  > 0 then 
	Messagebox("ATTENTION", "Une personne avec un lien PATIENT est déjà définie !")
else
	lig = tot + 1 

	// Ajout du patient dans la liste pour récupérer son id autogénéré
	
	dw_liste.insertrow(0)
	
	select isnull(nom, ''), isnull(prenom, '') , isnull(portable_patient, '') 
	into :ls_nom, :ls_prenom, :ls_telephone
	from patient 
	where code = :var_code_local ;
	
	dw_liste.setitem(lig, "dentapoche_personnes_nom", ls_nom)
	dw_liste.setitem(lig, "dentapoche_personnes_prenom", ls_prenom)
	dw_liste.setitem(lig, "dentapoche_personnes_telephone", ls_telephone)
	dw_liste.setitem(lig, "dentapoche_personnes_type", 'P')

	ls_login = fxg_generate_login(ls_nom)
	ls_mot_passe = fxg_generate_password()


	dw_liste.setitem(lig, "dentapoche_personnes_login", ls_login)
	dw_liste.setitem(lig, "dentapoche_personnes_mot_passe", ls_mot_passe)

	if dw_liste.update() = 1 then 
		commit ;
		
		// récupération de l'ID du login UNIQUE qu'on vient de crééer
		select id_personne into :ldb_id_personne from dentapoche_personnes where "login" = :ls_login ;

		// Ajout du lien patient
		insert into dentapoche_liens ("id_personne", "code_patient", "type_lien") 
		values (:ldb_id_personne, :var_code_local, 'P') ;

		if sqlca.sqlcode = 0 then 
			commit ;
			guo_fenetre_modale.wf_ouvrir_param_nombre(w_dentapoche_personne_fiche, ldb_id_personne)	
			wf_repositionnement(lig)
		else
			rollback ;
			Messagebox("ATTENTION", "Erreur dans la création du lien PATIENT !~n~n" + sqlca.sqlerrtext)
		end if
	else
		rollback ;
		Messagebox("ATTENTION", "Erreur dans la création de la PERSONNE !~n~n" + sqlca.sqlerrtext)	
	end if 
end if


end event

type cb_parent1 from uo_picturebutton_250x120 within w_dentapoche_logins_patient
integer x = 549
integer y = 1608
integer taborder = 80
boolean bringtotop = true
string text = "Parent 1"
end type

event clicked;call super::clicked;long lig, tot
string ls_nom, ls_prenom, ls_telephone, ls_login, ls_mot_passe
double ldb_id_personne
integer li_pos_espace


tot = dw_liste.rowcount()

if dw_liste.find("dentapoche_liens_type_lien = '1'" , 1, tot)  > 0 then 
	Messagebox("ATTENTION", "Une personne avec un lien PARENT 1 est déjà définie !")
else

	
	select isnull(nom_parent1, ''), isnull(portable, '') 
	into :ls_nom, :ls_telephone
	from patient 
	where code = :var_code_local ;
	
	if ls_nom <> "" then 
			lig = tot + 1 

		// Ajout du patient dans la liste pour récupérer son id autogénéré
	
		dw_liste.insertrow(0)	
		
		wf_separation_nom_prenom(ls_nom, ls_prenom)
	
		
		dw_liste.setitem(lig, "dentapoche_personnes_nom", ls_nom)
		dw_liste.setitem(lig, "dentapoche_personnes_prenom", ls_prenom)
		dw_liste.setitem(lig, "dentapoche_personnes_telephone", ls_telephone)
		dw_liste.setitem(lig, "dentapoche_personnes_type", 'P')
	
		ls_login = fxg_generate_login(ls_nom)
		ls_mot_passe = fxg_generate_password()
	
	
		dw_liste.setitem(lig, "dentapoche_personnes_login", ls_login)
		dw_liste.setitem(lig, "dentapoche_personnes_mot_passe", ls_mot_passe)
	
		if dw_liste.update() = 1 then 
			commit ;
			
			// récupération de l'ID du login UNIQUE qu'on vient de crééer
			select id_personne into :ldb_id_personne from dentapoche_personnes where "login" = :ls_login ;
	
			// Ajout du lien patient
			insert into dentapoche_liens ("id_personne", "code_patient", "type_lien") 
			values (:ldb_id_personne, :var_code_local, '1') ;
	
			if sqlca.sqlcode = 0 then 
				commit ;
				guo_fenetre_modale.wf_ouvrir_param_nombre(w_dentapoche_personne_fiche, ldb_id_personne)	
				wf_repositionnement(lig)
			else
				rollback ;
				Messagebox("ATTENTION", "Erreur dans la création du lien PÄRENT 1 !~n~n" + sqlca.sqlerrtext)
			end if
		else
			rollback ;
			Messagebox("ATTENTION", "Erreur dans la création de la PERSONNE !~n~n" + sqlca.sqlerrtext)	
		end if 
	else
		Messagebox("ATTENTION", "Ce patient n'as pas de PARENT 1 !")	
	end if
end if



end event

type cb_parent2 from uo_picturebutton_250x120 within w_dentapoche_logins_patient
integer x = 983
integer y = 1608
integer taborder = 90
boolean bringtotop = true
string text = "Parent 2"
end type

event clicked;call super::clicked;long lig, tot
string ls_nom, ls_prenom, ls_telephone, ls_login, ls_mot_passe
double ldb_id_personne
integer li_pos_espace


tot = dw_liste.rowcount()

if dw_liste.find("dentapoche_liens_type_lien = '2'" , 1, tot)  > 0 then 
	Messagebox("ATTENTION", "Une personne avec un lien PARENT 2 est déjà définie !")
else
	
		if ls_nom <> "" then 
			// Ajout du parent2 dans la liste pour récupérer son id autogénéré
			lig = tot + 1 
			
			dw_liste.insertrow(0)
	
		
		select isnull(nom_parent2, ''), isnull(portable1_parent2, '') 
		into :ls_nom, :ls_telephone
		from patient 
		where code = :var_code_local ;
		
		wf_separation_nom_prenom(ls_nom, ls_prenom)
		
		dw_liste.setitem(lig, "dentapoche_personnes_nom", ls_nom)
		dw_liste.setitem(lig, "dentapoche_personnes_prenom", ls_prenom)
		dw_liste.setitem(lig, "dentapoche_personnes_telephone", ls_telephone)
		dw_liste.setitem(lig, "dentapoche_personnes_type", 'P')
	
		ls_login = fxg_generate_login(ls_nom)
		ls_mot_passe = fxg_generate_password()
	
	
		dw_liste.setitem(lig, "dentapoche_personnes_login", ls_login)
		dw_liste.setitem(lig, "dentapoche_personnes_mot_passe", ls_mot_passe)
	
		if dw_liste.update() = 1 then 
			commit ;
			
			// récupération de l'ID du login UNIQUE qu'on vient de crééer
			select id_personne into :ldb_id_personne from dentapoche_personnes where "login" = :ls_login ;
	
			// Ajout du lien patient
			insert into dentapoche_liens ("id_personne", "code_patient", "type_lien") 
			values (:ldb_id_personne, :var_code_local, '2') ;
	
			if sqlca.sqlcode = 0 then 
				commit ;
				guo_fenetre_modale.wf_ouvrir_param_nombre(w_dentapoche_personne_fiche, ldb_id_personne)	
				wf_repositionnement(lig)
			else
				rollback ;
				Messagebox("ATTENTION", "Erreur dans la création du lien PARENT 2 !~n~n" + sqlca.sqlerrtext)
			end if
		else
			rollback ;
			Messagebox("ATTENTION", "Erreur dans la création de la PERSONNE !~n~n" + sqlca.sqlerrtext)	
		end if 
	else
		Messagebox("ATTENTION", "Ce patient n'as pas de PARENT 2 !")	
	end if
end if




end event

type cb_payeur from uo_picturebutton_250x120 within w_dentapoche_logins_patient
integer x = 1417
integer y = 1608
integer taborder = 100
boolean bringtotop = true
string text = "Payeur"
end type

event clicked;call super::clicked;long lig, tot
string ls_nom, ls_prenom, ls_telephone, ls_login, ls_mot_passe
double ldb_id_personne
integer li_pos_espace


tot = dw_liste.rowcount()

if dw_liste.find("dentapoche_liens_type_lien = '3'" , 1, tot)  > 0 then 
	Messagebox("ATTENTION", "Une personne avec un lien PAYEUR est déjà définie !")
else
	
	select isnull(nom_payeur, ''), isnull(portable1_payeur, '') 
	into :ls_nom, :ls_telephone
	from patient 
	where code = :var_code_local ;
	
	if ls_nom <> "" then 
		// Ajout du payeur dans la liste pour récupérer son id autogénéré
		lig = tot + 1 
		
		dw_liste.insertrow(0)
	
		wf_separation_nom_prenom(ls_nom, ls_prenom)
		
		dw_liste.setitem(lig, "dentapoche_personnes_nom", ls_nom)
		dw_liste.setitem(lig, "dentapoche_personnes_prenom", ls_prenom)
		dw_liste.setitem(lig, "dentapoche_personnes_telephone", ls_telephone)
		dw_liste.setitem(lig, "dentapoche_personnes_type", 'P')
	
		ls_login = fxg_generate_login(ls_nom)
		ls_mot_passe = fxg_generate_password()
	
	
		dw_liste.setitem(lig, "dentapoche_personnes_login", ls_login)
		dw_liste.setitem(lig, "dentapoche_personnes_mot_passe", ls_mot_passe)
	
		if dw_liste.update() = 1 then 
			commit ;
			
			// récupération de l'ID du login UNIQUE qu'on vient de crééer
			select id_personne into :ldb_id_personne from dentapoche_personnes where "login" = :ls_login ;
	
			// Ajout du lien patient
			insert into dentapoche_liens ("id_personne", "code_patient", "type_lien") 
			values (:ldb_id_personne, :var_code_local, '2') ;
	
			if sqlca.sqlcode = 0 then 
				commit ;
				guo_fenetre_modale.wf_ouvrir_param_nombre(w_dentapoche_personne_fiche, ldb_id_personne)	
				wf_repositionnement(lig)
			else
				rollback ;
				Messagebox("ATTENTION", "Erreur dans la création du lien PAYEUR !~n~n" + sqlca.sqlerrtext)
			end if
		else
			rollback ;
			Messagebox("ATTENTION", "Erreur dans la création de la PERSONNE !~n~n" + sqlca.sqlerrtext)	
		end if 
	else
		Messagebox("ATTENTION", "Ce patient n'as pas de PAYEUR !")	
	end if
end if


end event

type cb_modifier from uo_picturebutton_390x120 within w_dentapoche_logins_patient
integer x = 1915
integer y = 1572
integer width = 562
integer height = 148
integer taborder = 40
boolean bringtotop = true
string text = "&Modifier"
boolean ellipsis = false
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	
	double ldb_id_personne
	long lig 
	lig = dw_liste.getrow()
	ldb_id_personne = dw_liste.getitemNumber(lig ,"dentapoche_personnes_id_personne")
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_dentapoche_personne_fiche, ldb_id_personne)	
	dw_liste.retrieve(var_code_local)
	lig = dw_liste.Find("dentapoche_personnes_id_personne = "+string(ldb_id_personne) , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if

end event

type cb_supprimer from uo_picturebutton_390x120 within w_dentapoche_logins_patient
integer x = 2505
integer y = 1572
integer width = 562
integer height = 148
integer taborder = 40
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type gb_inscriptions from groupbox within w_dentapoche_logins_patient
integer x = 41
integer y = 1512
integer width = 1847
integer height = 264
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Nouvelles inscriptions"
borderstyle borderstyle = stylebox!
end type

