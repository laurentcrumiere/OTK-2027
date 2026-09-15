$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_1 from commandbutton within w_main
end type
type ole_image from olecustomcontrol within w_main
end type
type dw_detail from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 1961
integer height = 1748
boolean titlebar = true
string title = "Importation d~'une image dans Orthokis"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
ole_image ole_image
dw_detail dw_detail
end type
global w_main w_main

event open;// pour mettre de manière SUR  au premier plan
this.setPosition(TopMost!)
centrer(this)

this.backcolor = couleur_fond_fenetre

colore_datawindow(dw_detail)

boolean var_suite

//************************ Connection à la base ************************//

//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "SQL"
SQLCA.autocommit 	= false

// Source de données sélectionnée
SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"


CONNECT;	//connection


var_suite = true

//************************ Connection à la base ************************//

if SQLCA.sqlcode <> 0 Then
	Messagebox("ATTENTION","Erreur de connexion à la Base de données d'Orthokis !~n~nL'importation n'a pas été effectué.")
	var_suite = false
else
	
	
	// Conversion du Fichier dicom en Jpeg
	string v_exe, commande, v_options
	date v_date_image
	long hauteur, largeur
	
	v_exe = dir_ini +  exe_convert_dicom
	v_options = profilestring(dir_ini+inifile_orthokis,"dcm2jpg","options","-b 300 -c 800")

	
	commande = v_exe + " -o "+dir_ini+" "+v_options+" " + fichier_dicom_a_importer

	runwait(commande, 1)

	// Le fichier converti est dans le dossier d'orthokis avec le même nom qu'envoyé par NNT
	fichier_jpg_a_importer = gfx_fichier_sans_extension (fichier_dicom_a_importer) + ".jpg"
	
	if not fileExists (dir_ini +  fichier_jpg_a_importer) then 
		Messagebox("ATTENTION","Erreur dans la conversion de l'image !~n~nL'importation n'a pas été effectué.")
		var_suite = false
	else
		
		// On va pouvoir importer ...
		dw_detail.settransobject(sqlca)
		
		// recopie de l'image ou il faut
		string next_cadre_image, next_fichier_image
		next_cadre_image = get_nom_prochain_cadre_image (var_code_patient)
		next_fichier_image = profilestring(dir_photos+inifile_photo,"ARAKIS",next_cadre_image,"")
		
		string fichier_destination
		fichier_destination = dir_photos + string(var_code_patient)
		
		
		if  not DirectoryExists (fichier_destination) then 
			// Création du dossier
			if CreateDirectory (fichier_destination) <> 1 then
				Messagebox("ATTENTION","Erreur dans la création du dossier de destination de l'image (" + fichier_destination + ").~n~nL'importation n'a pas été effectué.")
				var_suite = false
			end if
		end if
		
		if var_suite then
			// le dossier existe ... recopie
			fichier_destination = fichier_destination + win_delimiter + next_fichier_image

			
			If FileCopy(dir_ini + fichier_jpg_a_importer, fichier_destination) <> 1 then
				Messagebox("ATTENTION","Erreur dans la recopie du fichier image dans le dossier de destination de l'image (" + fichier_destination + ").~n~nL'importation n'a pas été effectué.")
				var_suite = false
			else
		
				ole_image.object.LoadImage	=  fichier_destination
				
				v_date_image = deduire_date_image(fichier_destination)
				
				long v_temps_traitement, v_type_image
				// Recherche temps de traitement par défaut avant l'acquisition en cours
				v_temps_traitement = proposition_temps_traitement(var_code_patient)

				largeur = ole_image.object.ImageWidth
				hauteur	= ole_image.object.ImageHeight
				
				//messagebox("trace", "Hauteur : " + string(hauteur) + "~n~nLargeur : " + string(largeur) )
				// Mise en place du type image par défaut
				if largeur >= hauteur * 1.6 then
					v_type_image = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_pano",0)
				else
					v_type_image = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_radio",0)
				end if 
		
		
			
				
				// Ajout des éléments en base de données
				dw_detail.insertrow(0)
				dw_detail.Setitem(1, "code",var_code_patient)
				dw_detail.Setitem(1, "nom_fichier", next_fichier_image)
				dw_detail.Setitem(1, "date_acquis", v_date_image)
				dw_detail.Setitem(1, "temps_traitement", v_temps_traitement)
				dw_detail.Setitem(1, "type_image", v_type_image)
			end if

		end if
		
		// Suppression du fichier JPG
		FileDelete (dir_ini +  fichier_jpg_a_importer)
		
		
	end if
	
end if

if not var_suite then
	close(this)
end if

end event

on w_main.create
this.cb_1=create cb_1
this.ole_image=create ole_image
this.dw_detail=create dw_detail
this.Control[]={this.cb_1,&
this.ole_image,&
this.dw_detail}
end on

on w_main.destroy
destroy(this.cb_1)
destroy(this.ole_image)
destroy(this.dw_detail)
end on

event close;

disconnect ;
end event

type cb_1 from commandbutton within w_main
integer x = 585
integer y = 1372
integer width = 549
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
end type

event clicked;
dw_detail.accepttext()

if dw_detail.update() = 1 then
	commit ;
else
	rollback ;
end if 

close (parent)
end event

type ole_image from olecustomcontrol within w_main
event paintevent ( )
event selectevent ( long lplleft,  long lpltop,  long lplright,  long lplbottom )
event statusevent ( long lppercent )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event scroll ( long scrolltype )
event errorevent ( integer nerrcount )
event thumbnail ( string filename,  long page )
event tag ( long tagid,  long tagtype,  long tagsize,  integer wordval,  long longval,  string strval )
event thumbtitle ( string title,  integer page )
event scanbeforepage ( long pagenumber,  double left,  double top,  double right,  double bottom )
event scanafterpage ( long pagenumber,  long pendcount,  string filename )
event scanafterdoc ( long pagecount,  long adfloaded )
event tagex ( long ltagid,  any vdata )
event warningevent ( integer nwarningcount )
integer x = 411
integer y = 68
integer width = 1033
integer height = 748
integer taborder = 10
boolean focusrectangle = false
string binarykey = "w_main.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_detail from datawindow within w_main
string tag = "brush"
integer x = 32
integer y = 880
integer width = 1815
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_affectations_type_temps_image"
boolean border = false
boolean livescroll = true
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_main.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000030000000000000000000000000000000000000000000000000000000064fd5b0001dc2e2700000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000004d00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad040000000064fd5b0001dc2e2764fd5b0001dc2e2700000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020206b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b000000300000001d0000000100000000000000100000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_main.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
