$PBExportHeader$w_main.srw
$PBExportComments$Generated SDI Main Window
forward
global type w_main from window
end type
type pb_1 from picturebutton within w_main
end type
type dw_lignes from datawindow within w_main
end type
type dw_titres from datawindow within w_main
end type
type st_6 from statictext within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type st_5 from statictext within w_main
end type
type st_4 from statictext within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type st_1 from statictext within w_main
end type
end forward

global type w_main from window
integer width = 3433
integer height = 1656
boolean titlebar = true
string title = "Mise à jour 60"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 33554431
boolean center = true
pb_1 pb_1
dw_lignes dw_lignes
dw_titres dw_titres
st_6 st_6
cb_4 cb_4
cb_3 cb_3
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_main w_main

forward prototypes
public subroutine execute_commande_sql (string cde)
end prototypes

public subroutine execute_commande_sql (string cde);
long y_prec
execute immediate :cde ;

if sqlca.sqlcode <> 0 then
	MessageBox("ERREUR DANS LA MISE A JOUR DE LA BASE DE DONNEES","Commande exécutée : "+cde+"~n~nMessage d'erreur : "+sqlca.sqlerrtext)
	// On deplace le fenetre patience pour être sur que ...
end if


end subroutine

on w_main.create
this.pb_1=create pb_1
this.dw_lignes=create dw_lignes
this.dw_titres=create dw_titres
this.st_6=create st_6
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.pb_1,&
this.dw_lignes,&
this.dw_titres,&
this.st_6,&
this.cb_4,&
this.cb_3,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_main.destroy
destroy(this.pb_1)
destroy(this.dw_lignes)
destroy(this.dw_titres)
destroy(this.st_6)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type pb_1 from picturebutton within w_main
integer x = 430
integer y = 1232
integer width = 247
integer height = 216
integer taborder = 40
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "lc_help.png"
alignment htextalign = left!
end type

event clicked;

// pour ouvrir un fichier .. comme si double clic sous Windows
string chemin_complet_courrier
string dir_ini

// On va chercher le répertoire d'installation d'ORTHOkis
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)
if pos(dir_ini,";") > 0 then
	dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
end if
dir_ini = dir_ini + "\"
chemin_complet_courrier = dir_ini + "maj60.pdf"

if FileExists(chemin_complet_courrier) then

	
	// utilisation techno de scripting windows (WSH)
	oleobject WshShell
	if gfx_open_connection_ole(WshShell, "WScript.Shell") = 1 then
		
		
		Try 
			WshShell.Run('"'+chemin_complet_courrier+'"', 1)
			
		Catch (RuntimeError er)
					
			Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite à l'ouverture du fichier '"+ chemin_complet_courrier+ "'.~n~nVeuillez vérifier votre configuration.")
			
			
		End Try					
		
		gfx_close_connection_ole(WshShell)
		
	end if
	
else
	Messagebox("ERREUR","Impossible de locliser le fichier : " +chemin_complet_courrier  )
end if
end event

type dw_lignes from datawindow within w_main
boolean visible = false
integer x = 2651
integer y = 488
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_lignes_soins_auto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_titres from datawindow within w_main
boolean visible = false
integer x = 2651
integer y = 68
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_titres_soins_autto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_main
integer x = 133
integer y = 624
integer width = 3214
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "- De nouveaux soins automatiques seront créés si besoin ; vos soins actuels ne seront pas modifiés"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_main
integer x = 2071
integer y = 1252
integer width = 741
integer height = 180
integer taborder = 30
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Lancer"
end type

event clicked;boolean b_poursuivre
integer nb_user


nb_user = nombre_user_connectes()

if nb_user > 1 then 
	if Messagebox("ATTENTION", "Il semblerait qu'il y ait " + string(nb_user) + " autres postes connectés !~n~nVoulez-vous tout de même poursuivre ?", Question!, YesNo!, 2) = 1 then 
		b_poursuivre = true
	else
		b_poursuivre = false
	end if
else
	b_poursuivre = true
end if

if b_poursuivre then 

	if Messagebox("ATTENTION","Confirmez-vous l'exécution des commandes ?", Question!, YesNo!, 2) = 1 then 
		
		open(w_patience)
		
		
		// Ajout des nouveaux actes 
		INSERT INTO code_soins VALUES (	'CD-202310',	'Consultation Dentiste',	'CD',	23.000000,	1.00,	'N',	0,	'N',	'O',	0,
			'N',	1,	100,	'N',	'O',	'D',	0,	NULL,	NULL,	23.00,
			'M',	'COL',	'2023-08-02',	4259584,	134217730,	NULL,	NULL,	NULL,	NULL,	NULL,	'O');
			
		teste_erreur_bd(1)
		
		INSERT INTO code_soins VALUES (	'CSD-202310',	'Consultation Spécialiste Dentiste',	'CSD',	23.000000,	1.00,	'N',	0,	'N',	'O',	0,
			'N',	1,	100,	'N',	'O',	'D',	0,	NULL,	NULL,	23.00,
			'M',	'COL',	'2023-08-02',	4259584,	134217730,	NULL,	NULL,	NULL,	NULL,	NULL,	'O');
			
		teste_erreur_bd(2)
		
		// Passage pour détecter les soins automatiques à dupliquer .... 
		
		dw_titres.settransobject(sqlca)
		dw_lignes.settransobject(sqlca)


		long lig, tot, ligtrouve
		double v_code
		string v_condition_recherche
		double code_soin_depart, code_soin_arrivee
		string nom_soin_depart,nom_soin_arrivee
		
		
		dw_titres.retrieve()
		tot = dw_titres.rowcount()
		
		
		
		v_condition_recherche = "upper(lettre) = 'C' or upper(lettre) = 'CS' or upper(lettre) = 'Z' or ( (upper(lettre) = 'TO' or upper(lettre) = 'ORT') and (scp_demande = 5 or scp_demande = 10 or scp_demande = 15 or scp_demande = 20 or scp_demande = 50) )"
		
		for lig = 1 to tot
			
			code_soin_depart = dw_titres.getitemnumber(lig, "code")
			
			dw_lignes.retrieve(code_soin_depart)
			
			ligtrouve = dw_lignes.find( v_condition_recherche , 1, 999999) 
			
			if ligtrouve > 0 then
				// On duplique le soins
				nom_soin_depart = dw_titres.getitemString(lig , "nom")

				nom_soin_arrivee = left("MAJ60 - "+nom_soin_depart,40)

				// Récupération du code du soin d'arrivée ..
				SELECT max(code) INTO :code_soin_arrivee FROM "dba"."titres_soins_auto" ;
		
				if isnull(code_soin_arrivee)  then
					// Théoriquement impossible mais ...
					code_soin_arrivee = 1
				else
					code_soin_arrivee = code_soin_arrivee + 1
				end if
			
				// Ajout du titre ....
		
				INSERT INTO "dba"."titres_soins_auto" ("code","nom", "actif","ordre_trie")
				VALUES (:code_soin_arrivee, :nom_soin_arrivee, 1, 100) ;

				// Ajout des soins ...
			
				  INSERT INTO "soins_auto"  
							 ( "cle",      "code",     "type",     "numero",     "date_demande",     "scp_demande",      "date_accord",     "scp_accord",   
								"hn",       "total",        "tp",     "date_cara", "nombre_decalage","mode_decalage", "code_association"  )  
				  SELECT "soins_auto"."cle",   
							:code_soin_arrivee,   
							"soins_auto"."type",   
							"soins_auto"."numero",   
							"soins_auto"."date_demande",   
							"soins_auto"."scp_demande",   
							"soins_auto"."date_accord",   
							"soins_auto"."scp_accord",   
							"soins_auto"."hn",   
							"soins_auto"."total",   
							"soins_auto"."tp",   
							"soins_auto"."date_cara"  , 
							"nombre_decalage",
							"mode_decalage",
							 "code_association"
					 FROM "soins_auto"  
					WHERE "soins_auto"."code" = :code_soin_depart    ;
				
					// Ajout des lignes ....
				  INSERT INTO "ligne_soins_auto"  
						( "cle",   "code",    "date",   "montant",    "tp",   "origine_tp", "nombre_decalage","mode_decalage" )  
					  SELECT "ligne_soins_auto"."cle",   
								:code_soin_arrivee,      
								 "ligne_soins_auto"."date",      
								 "ligne_soins_auto"."montant",   
								"ligne_soins_auto"."tp",     
								"ligne_soins_auto"."origine_tp"  , 
								"ligne_soins_auto". "nombre_decalage", 
								"ligne_soins_auto"."mode_decalage" 
					FROM "ligne_soins_auto"  WHERE "ligne_soins_auto"."code" = :code_soin_depart   ;
					
				
					commit ;
			end if
			
		next 
		
		// Modification ses soins dupliqués
		
		// Soins automatiques C -> CD CS -> CSD
		update "soins_auto", "code_soins", "titres_soins_auto" 
		set "soins_auto"."type" = 'CSD-202310' 
		where "code_soins"."lettre" = 'CS' and "code_soins"."code" = "soins_auto"."type" 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		teste_erreur_bd(3)
		
		update "soins_auto", "code_soins" , "titres_soins_auto" 
		set "soins_auto"."type" = 'CD-202310' 
		where "code_soins"."lettre" = 'C' and "code_soins"."code" = "soins_auto"."type"
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		
		teste_erreur_bd(4)
		
		// Consulations Caisse 
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 13.80 where "ligne_soins_auto"."montant" = 16.10 and 
		"code_soins"."lettre" in ('CD', 'CSD') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 1 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C'
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(5)
		
		// Consultations Mutuelle 
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 9.20 where "ligne_soins_auto"."montant" = 6.90 and 
		"code_soins"."lettre" in ('CD', 'CSD') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 1 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		
		teste_erreur_bd(6)
		
		// Z15 Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 11.97 where "ligne_soins_auto"."montant" = 13.97 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 15 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(7)
		
		// Z15 Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 7.98 where "ligne_soins_auto"."montant" = 5.99 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 15 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		
		teste_erreur_bd(8)
		
		// Z20 Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 15.96 where "ligne_soins_auto"."montant" = 18.62 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 20 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(9)
		
		// Z20 Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 10.64 where "ligne_soins_auto"."montant" = 7.98 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 20 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(10)
		
		// Z25 Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 19.95 where "ligne_soins_auto"."montant" = 23.28 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 25 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(91)
		
		// Z25 Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 13.30 where "ligne_soins_auto"."montant" = 9.97 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 25 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(101)

		// Z30 Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 23.94 where "ligne_soins_auto"."montant" = 27.93 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 30 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(11)
		
		// Z30 Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 15.96 where "ligne_soins_auto"."montant" = 11.97 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 30 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(12)

		// Z35 Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 27.93 where "ligne_soins_auto"."montant" = 32.59 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 35 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(111)
		
		// Z35 Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 18.62 where "ligne_soins_auto"."montant" = 13.97 and 
		"code_soins"."lettre" = 'Z' and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 35 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(112)	
		
		
		// TO 5 - ORT 5 - Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 6.45 where "ligne_soins_auto"."montant" = 7.53 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 5 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(13)
		
		// TO 5 - ORT 5 - Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 4.30 where "ligne_soins_auto"."montant" = 3.23 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 5 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		
		teste_erreur_bd(14)
		
		
		// TO 10 - ORT 10 - Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 12.90 where "ligne_soins_auto"."montant" = 15.05 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 10 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(15)
		
		// TO 10 - ORT 10 - Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 8.60 where "ligne_soins_auto"."montant" = 6.45 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 10 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		
		teste_erreur_bd(16)
		
		// TO 15 - ORT 15 - Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 19.35 where "ligne_soins_auto"."montant" = 22.58 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 15 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(117)
		
		// TO 15 - ORT 15 - Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 12.90 where "ligne_soins_auto"."montant" = 9.68 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 15 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(118)
		
		// TO 20 - ORT 20 - Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 25.80 where "ligne_soins_auto"."montant" = 30.10 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 20 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(17)
		
		// TO 20 - ORT 20 - Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 17.20 where "ligne_soins_auto"."montant" = 12.90 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 20 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(18)
		
		// TO 50 - ORT 50 - Caisse
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 64.50 where "ligne_soins_auto"."montant" = 75.25 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 50 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='C' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
		
		teste_erreur_bd(19)
		
		// TO 50 - ORT 50 - Mutuelle
		update "ligne_soins_auto",  "soins_auto", "code_soins" , "titres_soins_auto" 
		set "ligne_soins_auto"."montant" = 43.00 where "ligne_soins_auto"."montant" = 32.25 and 
		"code_soins"."lettre" in ('ORT', 'TO') and "code_soins"."code" = "soins_auto"."type" and "code_soins"."nb_lettre" = 50 and 
		"ligne_soins_auto"."code" = "soins_auto"."code" and "ligne_soins_auto"."cle" = "soins_auto"."cle" 
		and "ligne_soins_auto"."tp" ='O' and "ligne_soins_auto"."origine_tp" ='M' 
		and "titres_soins_auto"."code"  = "soins_auto"."code" and left("titres_soins_auto"."nom", 5) = 'MAJ60' ;
		
			
		teste_erreur_bd(20)
		
		
		
		
		
		
		// on met un marqueur en base de données pour ne pas le lancer 2 fois
		
		execute_commande_sql("alter table agenda add maj_70_60 char(1) ;")
		
		update agenda set maj_70_60 = 'O' ;

		teste_erreur_bd(21)
		
		commit ;

		teste_erreur_bd(20)

		close(w_patience)
		
		Messagebox("INFORMATION","La mise à jour jour est terminée !")
		close(parent)
	end if
end if

end event

type cb_3 from commandbutton within w_main
integer x = 992
integer y = 1252
integer width = 741
integer height = 180
integer taborder = 20
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Annuler"
boolean default = true
end type

event clicked;close(parent)
end event

type st_5 from statictext within w_main
integer x = 146
integer y = 960
integer width = 1253
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Elle ne durera que quelques secondes."
boolean focusrectangle = false
end type

type st_4 from statictext within w_main
integer x = 146
integer y = 792
integer width = 2016
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Cette action nécessite qu~'aucun poste ne doit utiliser Orthokis."
boolean focusrectangle = false
end type

type st_3 from statictext within w_main
integer x = 133
integer y = 500
integer width = 3063
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "- Mettre à jour les Soins Automatiques utilisant des Tiers Payants (montants Caisse / Mutuelle)"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 133
integer y = 392
integer width = 1737
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "- Créer 2 nouveaux soins de Consultations (CD, CSD)"
boolean focusrectangle = false
end type

type st_1 from statictext within w_main
integer x = 146
integer y = 168
integer width = 2011
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Vous allez mettre à jour votre base de données pour : "
boolean focusrectangle = false
end type

