$PBExportHeader$w_maj_centralisee_config.srw
forward
global type w_maj_centralisee_config from w_fenetre_arakis
end type
type pb_3 from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type pb_2 from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type pb_1 from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type cb_annuler from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type cb_fermer from uo_picturebutton_390x120 within w_maj_centralisee_config
end type
type dw_fiche from datawindow within w_maj_centralisee_config
end type
type mle_5 from multilineedit within w_maj_centralisee_config
end type
type mle_4 from multilineedit within w_maj_centralisee_config
end type
type mle_3 from multilineedit within w_maj_centralisee_config
end type
type mle_2 from multilineedit within w_maj_centralisee_config
end type
type mle_1 from multilineedit within w_maj_centralisee_config
end type
end forward

global type w_maj_centralisee_config from w_fenetre_arakis
integer width = 3141
integer height = 1884
string title = "CONFIGURATION DE LA MISE A JOUR CENTRALISEE"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_fiche dw_fiche
mle_5 mle_5
mle_4 mle_4
mle_3 mle_3
mle_2 mle_2
mle_1 mle_1
end type
global w_maj_centralisee_config w_maj_centralisee_config

on w_maj_centralisee_config.create
int iCurrent
call super::create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_fiche=create dw_fiche
this.mle_5=create mle_5
this.mle_4=create mle_4
this.mle_3=create mle_3
this.mle_2=create mle_2
this.mle_1=create mle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_3
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_enregistrer
this.Control[iCurrent+6]=this.cb_fermer
this.Control[iCurrent+7]=this.dw_fiche
this.Control[iCurrent+8]=this.mle_5
this.Control[iCurrent+9]=this.mle_4
this.Control[iCurrent+10]=this.mle_3
this.Control[iCurrent+11]=this.mle_2
this.Control[iCurrent+12]=this.mle_1
end on

on w_maj_centralisee_config.destroy
call super::destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_fiche)
destroy(this.mle_5)
destroy(this.mle_4)
destroy(this.mle_3)
destroy(this.mle_2)
destroy(this.mle_1)
end on

event open;call super::open;
centrer(this)

colore_tous_objets_window(this, couleur_fond_fenetre)

colore_datawindow(dw_fiche)


dw_fiche.setTransObject(SQLCA)
dw_fiche.retrieve()


string repertoire_central, repertoire_central_test
repertoire_central = dw_fiche.getitemString(1,"chemin_maj_orthokis_centralisee")

string nom_du_serveur 
boolean trouve = true

if repertoire_central = "INITIALISATION" then 
	// recherche du répertoire initial ...
	
	// Sur quel postes sont les courriers ....??
	if left(dir_courriers,2) = "\\" then
		// le dossier est du type   \\serveur\....
		nom_du_serveur = mid(dir_courriers, 3,    pos(dir_courriers, '\', 3) - 3) 
	else
		// on ne sait pas le nom du serveur !!!!
		nom_du_serveur = "SERVEUR"
	end if
		
		repertoire_central_test = "\\"+nom_du_serveur+"\Power\"
		if Not DirectoryExists ( repertoire_central_test ) then
			repertoire_central_test = "\\"+nom_du_serveur+"\d\Power\"
			if Not DirectoryExists ( repertoire_central_test ) then
				repertoire_central_test = "\\"+nom_du_serveur+"\e\Power\"
				if Not DirectoryExists ( repertoire_central_test ) then
					repertoire_central_test = "\\"+nom_du_serveur+"\c\Power\"
					if Not DirectoryExists ( repertoire_central_test ) then
						trouve = false
					else
					end if
				else
				end if
			else
			end if
		else
		end if
		
		if not trouve then
			// Aucun répertoire à proposé par défaut
			dw_fiche.Setitem(1,"chemin_maj_orthokis_centralisee", "")
		else
			dw_fiche.Setitem(1,"chemin_maj_orthokis_centralisee",repertoire_central_test+'maj_arakis\')
			dw_fiche.Setitem(1,"maj_orthokis_centralisee",'O')
			
			// Si le dossier power existe ... on automatise la mise à jour 
			if DirectoryExists ( repertoire_central_test ) then
				if CreateDirectory( repertoire_central_test+'maj_arakis') = 1 then
					// On a reussi la crétion => tout est en place ... on valide et on sort
					if dw_fiche.update() = 1 then
						commit ;
					else
						Rollback ;
					end if
					close(this)
				end if
			end if
		end if
end if

	
	
end event

type p_fond from w_fenetre_arakis`p_fond within w_maj_centralisee_config
end type

type pb_3 from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 901
integer y = 1572
integer width = 517
integer taborder = 70
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_fiche.retrieve()


end event

type pb_2 from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 1440
integer y = 1572
integer width = 517
integer taborder = 70
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.getitemString(1,"maj_orthokis_centralisee") = 'O' then

	// on teste d'abord si OK pour le répertoire
	string repertoire_central
	repertoire_central = dw_fiche.getitemString(1,"chemin_maj_orthokis_centralisee")
	boolean v_suite = false
	
	if left(repertoire_central, 2) <> "\\" then
		Messagebox("ATTENTION","Le répertoire de Centralisation doit être sous la forme '\\Serveur\nom1\'.~n~nVeuillez corriger avant d'enregistrer.")
	else
		if Not DirectoryExists(repertoire_central) then
			if MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'existe pas.~n~nVoulez-vous le créer ?",Question!,YesNo!,2) = 1 then
				if  CreateDirectory(repertoire_central) = -1 then
					MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'a pas pu être créé.~n~nVous devez en spécifier un autre.") 
				else
					v_suite = true
				end if
			end if
		else
			v_suite = true
		end if
	end if
else
	v_suite = true
end if


if v_suite then
	if dw_fiche.update() = 1 then
		commit ;
	else
		Rollback ;
	end if
end if

end event

type pb_1 from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 1979
integer y = 1572
integer width = 517
integer taborder = 70
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.modifiedcount() > 0     Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 1216
integer y = 2000
integer taborder = 70
string text = "&Annuler"
end type

event clicked;call super::clicked;//tab_1.tabpage_dep.dw_1.retrieve(var_code_local)
//tab_1.tabpage_traitement.dw_traitement.retrieve(var_code_local)
//
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 1637
integer y = 2000
integer taborder = 70
string text = "&Enregistrer"
boolean default = true
end type

event clicked;call super::clicked;//tab_1.tabpage_dep.dw_1.accepttext()
//tab_1.tabpage_traitement.dw_traitement.accepttext()
//
//
//
//if tab_1.tabpage_dep.dw_1.update() = 1 or tab_1.tabpage_traitement.dw_traitement.update() = 1 Then
//	commit ;
//else
//	Rollback ;
//end if
//
end event

type cb_fermer from uo_picturebutton_390x120 within w_maj_centralisee_config
integer x = 2057
integer y = 2000
integer taborder = 70
string text = "&Fermer"
end type

type dw_fiche from datawindow within w_maj_centralisee_config
string tag = "brush"
integer x = 9
integer y = 1016
integer width = 3040
integer height = 460
integer taborder = 60
string title = "none"
string dataobject = "dw_maj_centralisee_config"
boolean livescroll = true
end type

event buttonclicked;string ls_object

ls_Object = String(dwo.name)
string file_name,file_path,col_name

string repertoire_central
repertoire_central = this.getitemString(1,"chemin_maj_orthokis_centralisee")

choose case ls_Object
	case  "b_dossier" 
		repertoire_central = get_repertoire("Sélectionnez le dossier pour la Mise à Jour Centralisée ...",repertoire_central)
		this.Setitem(1,"chemin_maj_orthokis_centralisee", repertoire_central)
end choose


end event

type mle_5 from multilineedit within w_maj_centralisee_config
integer x = 9
integer y = 752
integer width = 3040
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Pour que cet automatisme soit actif, vous devez le configurer ...."
boolean border = false
end type

type mle_4 from multilineedit within w_maj_centralisee_config
integer x = 9
integer y = 624
integer width = 3040
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Vous serez ainsi sûr que tous les postes soient à jour."
boolean border = false
end type

type mle_3 from multilineedit within w_maj_centralisee_config
integer x = 9
integer y = 420
integer width = 3040
integer height = 188
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Au démarrage d~'ORTHOkis, si une mise à jour est disponible sur le serveur, le logiciel vous proposera automatiquement de faire la mise à jour."
boolean border = false
end type

type mle_2 from multilineedit within w_maj_centralisee_config
integer x = 9
integer y = 220
integer width = 3040
integer height = 184
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Le principe est le suivant : lors de l~'installation d~'une mise à jour d~'Orthokis sur un ordinateur, le programme de mise à jour du logiciel est copié sur votre serveur."
boolean border = false
end type

type mle_1 from multilineedit within w_maj_centralisee_config
integer x = 9
integer y = 16
integer width = 3040
integer height = 188
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "ORTHOkis intègre la notion de ~"MISE A JOUR CENTRALISEE~" automatisant les mises à jour de vos ordinateurs lors de la mise en place de nouvelles version du logiciel."
boolean border = false
end type

