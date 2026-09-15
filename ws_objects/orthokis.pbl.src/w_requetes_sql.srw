$PBExportHeader$w_requetes_sql.srw
forward
global type w_requetes_sql from window
end type
type pb_aide from uo_bouton_aide within w_requetes_sql
end type
type uo_resize from resize_fenetre within w_requetes_sql
end type
type cb_ajouter from uo_picturebutton_390x120 within w_requetes_sql
end type
type cb_executer from uo_picturebutton_390x120 within w_requetes_sql
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_requetes_sql
end type
type uo_query from u_cst_querybuilder within w_requetes_sql
end type
end forward

global type w_requetes_sql from window
integer width = 4960
integer height = 1980
boolean titlebar = true
string title = "Requêtes SQL"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_aide pb_aide
uo_resize uo_resize
cb_ajouter cb_ajouter
cb_executer cb_executer
cb_fermer cb_fermer
uo_query uo_query
end type
global w_requetes_sql w_requetes_sql

event open;uo_query.of_SetParentWindow( THIS)

uo_query.of_SetDBMS(uo_query.SQLAnywhere)  
uo_query.of_SetTransactionObject(SQLCA)


uo_resize.taille(this)



end event

on w_requetes_sql.create
this.pb_aide=create pb_aide
this.uo_resize=create uo_resize
this.cb_ajouter=create cb_ajouter
this.cb_executer=create cb_executer
this.cb_fermer=create cb_fermer
this.uo_query=create uo_query
this.Control[]={this.pb_aide,&
this.uo_resize,&
this.cb_ajouter,&
this.cb_executer,&
this.cb_fermer,&
this.uo_query}
end on

on w_requetes_sql.destroy
destroy(this.pb_aide)
destroy(this.uo_resize)
destroy(this.cb_ajouter)
destroy(this.cb_executer)
destroy(this.cb_fermer)
destroy(this.uo_query)
end on

event resize;uo_resize.retaille(this)

uo_query.width = this.width - 200
uo_query.height = this.height - 500


//cb_ajouter.y = height - 300
//cb_fermer.y = height - 300
//cb_executer.y = height - 300

end event

type pb_aide from uo_bouton_aide within w_requetes_sql
string tag = "Requeteur SQL"
integer x = 3296
integer y = 1736
integer width = 142
integer height = 124
integer taborder = 50
boolean bringtotop = true
end type

type uo_resize from resize_fenetre within w_requetes_sql
event destroy ( )
boolean visible = false
integer x = 3941
integer y = 1400
integer taborder = 50
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type cb_ajouter from uo_picturebutton_390x120 within w_requetes_sql
integer x = 1083
integer y = 1724
integer width = 599
integer taborder = 40
string text = "Ajouter Table"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;uo_query.of_AddTable()
end event

type cb_executer from uo_picturebutton_390x120 within w_requetes_sql
integer x = 1728
integer y = 1724
integer width = 599
integer taborder = 30
string text = "Exécuter"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
string ls_commande_sql, ls_fichier_commande, ls_fichier_resultat, ls_commande_run, ls_commande_export
integer li_fichier_commande

trace("*** DEMANDE DE REQUETES SQL *** ")

ls_commande_sql = uo_query.of_getsyntax () + ";"

ls_fichier_commande = dir_ini + "last_query.sql"
ls_fichier_resultat = dir_ini + "resultat_query.csv"

FileDelete(ls_fichier_resultat)

li_fichier_commande = fileopen(ls_fichier_commande, linemode!, write!, LockReadWrite!, replace!)
fileWrite(li_fichier_commande, ls_commande_sql)

// Ajout de la commande export
ls_commande_export = "OUTPUT TO '" + ls_fichier_resultat + "' FORMAT TEXT QUOTE '' DELIMITED BY ';'  "
fileWrite(li_fichier_commande, ls_commande_export)

FileClose(li_fichier_commande)


trace("Commande SQL : " + 	ls_commande_export )

ls_commande_run = "dbisql -datasource Orthokis_local -q " + ls_fichier_commande

runwait(ls_commande_run, 0) 

If FileExists(ls_fichier_resultat) then 
	trace("Fichier résultat OK : " + 	ls_fichier_resultat )
	if Messagebox("INFORMATION", "Le résultat de la requête se trouve dans le fichier : " + ls_fichier_resultat + ".~n~nSouhaitez-vous l'ouvrir ?", Question!, YesNo!, 1) = 1 then 
		fxg_ouvrir_fichier_shell(ls_fichier_resultat)
	end if

else
	Messagebox("ATTENTION", "Erreur dans l'exécution de la requête !" )
	trace("Erreur dans l'exécution de la requête !" )
end if

if not trace then
	// pour éviter que le client voit comment on génère le résultat
	FileDelete(ls_fichier_commande)
end if 


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_requetes_sql
integer x = 2373
integer y = 1724
integer width = 599
integer taborder = 40
end type

event clicked;fermer_fenetre(parent)
end event

type uo_query from u_cst_querybuilder within w_requetes_sql
integer x = 23
integer width = 4681
integer taborder = 20
end type

on uo_query.destroy
call u_cst_querybuilder::destroy
end on

