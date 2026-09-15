$PBExportHeader$w_main_chu.srw
forward
global type w_main_chu from window
end type
type st_1 from statictext within w_main_chu
end type
end forward

global type w_main_chu from window
integer width = 2418
integer height = 352
boolean titlebar = true
string title = "lien_chu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event orthokis_pret pbm_custom71
st_1 st_1
end type
global w_main_chu w_main_chu

type variables


boolean orthokis_pret = false

end variables

event orthokis_pret;// Correspondant à l'event 1094
//--------------------------------------

// recu quand Orthokis est prêt

orthokis_pret = true

//messagebox("trace", "ortho pret")
end event

on w_main_chu.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_main_chu.destroy
destroy(this.st_1)
end on

event open;// Orthokis est il lancé ????
if programme_running("orthokis.exe") = 0 then
//if true then
	
	// Faut lancer Orthokis
	string commande_run 

	if isnull(dir_ini) then
		dir_ini = ''
	end if
	
	if not fileExists(dir_ini + "Orthokis.exe") then
		MessageBox("ERREUR","Impossible de localiser ORTHOKIS.EXE dans le dossier : "+dir_ini)
	else
		commande_run = dir_ini + "Orthokis.exe AUTO"
	
	
		// Ecriture du handle de cette fenêtre pour que Orthokis puis nous répondre !!!!!!!!!!
		ulong handle_application
		string  lpClassName
		string titre_application
	
		setnull(lpClassName)
		titre_application = this.title
		handle_application = FindWindowA ( lpClassName, titre_application ) 
		setProfileString(dir_ini + "orthokis.ini" ,"Communication","handle_appelant",string(handle_application))
		
		// lancement d'Orthokis 
	
		run(commande_run)
		
		// Attend que ORTHOKIS soit prêt à traiter les messages

		long sleep_time, nb_boucles
		
		sleep_time = profileInt(dir_ini+"orthokis.ini","Communication","sleep_time",500) 
		nb_boucles = profileInt(dir_ini+"orthokis.ini","Communication","nb_boucles",50) 



		long ll_nb_essai
		// 1. Armement du "chien de garde"
		ll_nb_essai = nb_boucles
		// 2. patiente jusqu'à ce que l'on rencontre un des cas suivants : 
		// - nb d'essai soit dépassé
		// - réception du handle ("handle_televitale" est modifié dans l'évenement OTHER)
		do while ll_nb_essai > 0 and not orthokis_pret 
			// Marque une pause
			sleep(sleep_time)
			// IMPORTANT : l'instruction YIELD permet à PB de raffraichir la liste des messages
			yield()
			// Décompte le nombre d'essai
			ll_nb_essai --
		loop
		
	end if
end if

string fichier_ini

fichier_ini = dir_ini + "orthokis.ini"

handle_application = long(profilestring( fichier_ini ,"Communication","handle","-1"))
if handle_application <> -1 then

	// Mise d'Orthokis en actif
	ShowWindow(handle_application, 3)
	BringWindowToTop(handle_application)
	
	// Envoi du message
	SendMessageA(handle_application,1093,1,0)
		
else
	MessageBox("ERREUR","Impossible de dialoguer avec le logiciel ORTHOKIS !")
end if

close(this)






end event

type st_1 from statictext within w_main_chu
integer x = 178
integer y = 36
integer width = 1998
integer height = 140
integer textsize = -22
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envoi des informations à Orthokis"
alignment alignment = center!
boolean focusrectangle = false
end type

