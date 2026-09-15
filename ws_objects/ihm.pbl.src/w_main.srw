$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_2 from commandbutton within w_main
end type
type st_percent from statictext within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type hpb_download from hprogressbar within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 4727
integer height = 1956
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_percent_download pbm_custom01
cb_2 cb_2
st_percent st_percent
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
hpb_download hpb_download
cb_1 cb_1
end type
global w_main w_main

type variables


//----------------------------------------------------------------------------------------------------------

n_wininet gn_ftp


end variables

event ue_percent_download;String ls_msg

ls_msg = "Download " + &
			String(wparam / lparam, "#0%") + " complete."


ls_msg = String(wparam) +"  " + string( lparam)
			
			
			hpb_download.position = wparam / lparam
			st_percent.text = ls_msg
			
			yield()
end event

on w_main.create
this.cb_2=create cb_2
this.st_percent=create st_percent
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.hpb_download=create hpb_download
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.st_percent,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.hpb_download,&
this.cb_1}
end on

on w_main.destroy
destroy(this.cb_2)
destroy(this.st_percent)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.hpb_download)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_main
integer x = 270
integer y = 208
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Totale"
end type

event clicked;boolean lb_result
string ls_remotefile
string ls_localfile

string fichier_mise_a_jour

fichier_mise_a_jour = message.StringParm

fichier_mise_a_jour = "Aide_Orthokis_2024.pdf"
ls_remotefile = "/www/fr/telecha/Orthokis_2024/" + fichier_mise_a_jour
ls_localfile = dir_ini + fichier_mise_a_jour


lb_result = gn_ftp.of_Ftp_InternetConnect("ftp.arakis.fr", "arakis", "A3Z2cDs6f4", 21, false )


If not lb_result Then
	messagebox("ERREUR",  "Erreur de connexion au serveur de mise à jour : " + String(gn_ftp.LastErrorNbr))
	close(parent)
else
	
	
	If Not gn_ftp.of_Ftp_ReadFile(ls_remotefile, ls_localfile, Handle(parent), 1024) Then
		MessageBox("Erreur dans la récupération du fichier " + String(gn_ftp.LastErrorNbr), 	gn_ftp.LastErrorMsg, StopSign!)
		close(parent)
	else
		gn_ftp.of_SessionClose()
		// Tout s'est bien passé
		if fileExists(ls_localfile) then
			Messagebox("INFORMATION", "Téléchargement terminé !~n~nOrthokis va désormais se fermer pour lancer la mise à jour téléchargée !")
			//run (ls_localfile)
			//disconnect ;
			//halt close
		else
			Messagebox("ATTENTION", "Impossible de localiser le fichier : " + ls_localfile)
			close(parent)
		end if
		
	End If
	
End If
end event

type st_percent from statictext within w_main
integer x = 617
integer y = 1304
integer width = 1650
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_main
integer x = 23
integer y = 796
integer width = 594
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Download"
end type

event clicked;string ls_remotefile ="/www/fr/telecha/Orthokis_2024/Aide_Orthokis_2024.pdf"
string ls_localfile ="C:\Power\Tests\ftpclient\Aide_Orthokis_2024.pdf"
If Not gn_ftp.of_Ftp_ReadFile(ls_remotefile, ls_localfile, Handle(parent), 1024) Then
	MessageBox("ReadFile Error " + String(gn_ftp.LastErrorNbr), 	gn_ftp.LastErrorMsg, StopSign!)
	Return
End If

end event

type cb_5 from commandbutton within w_main
string tag = "n_wininet gn_ftp"
integer y = 532
integer width = 594
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Connect"
end type

event clicked;boolean lb_result

lb_result = gn_ftp.of_Ftp_InternetConnect("ftp.arakis.fr", "arakis", "A3Z2cDs6f4", 21, false )


If lb_result = False Then
	messagebox("error",  "Connect Error " + String(gn_ftp.LastErrorNbr))
else
	Messagebox("INFO", "Connexion ok")
End If
end event

type cb_4 from commandbutton within w_main
string tag = "n_wininet gn_ftp"
integer x = 18
integer y = 1460
integer width = 594
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Disconnect"
end type

event clicked;gn_ftp.of_SessionClose()
end event

type hpb_download from hprogressbar within w_main
integer x = 23
integer y = 12
integer width = 2542
integer height = 124
unsignedinteger maxposition = 100
integer setstep = 10
end type

type cb_1 from commandbutton within w_main
integer x = 1445
integer y = 1612
integer width = 462
integer height = 152
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

