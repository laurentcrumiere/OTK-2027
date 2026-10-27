$PBExportHeader$w_ia_vocale.srw
forward
global type w_ia_vocale from w_fenetre_arakis
end type
type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
end type
type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
end type
type st_statut from statictext within w_ia_vocale
end type
type st_timer from statictext within w_ia_vocale
end type
type cb_traiter from uo_picturebutton_390x120 within w_ia_vocale
end type
type uo_1 from resize_fenetre within w_ia_vocale
end type
type st_1 from statictext within w_ia_vocale
end type
type rb_mp3 from radiobutton within w_ia_vocale
end type
type rb_wav from radiobutton within w_ia_vocale
end type
type sle_dossier from singlelineedit within w_ia_vocale
end type
type pb_dossier_de_sortie from picturebutton within w_ia_vocale
end type
type pb_explorer from picturebutton within w_ia_vocale
end type
type cb_pause from uo_picturebutton_390x120 within w_ia_vocale
end type
type sle_fichier_a_importer from singlelineedit within w_ia_vocale
end type
type st_2 from statictext within w_ia_vocale
end type
type pb_fichier_a_importer from picturebutton within w_ia_vocale
end type
type cb_traiter_import from uo_picturebutton_390x120 within w_ia_vocale
end type
type st_status_magic_lemp from statictext within w_ia_vocale
end type
type gb_1 from groupbox within w_ia_vocale
end type
end forward

global type w_ia_vocale from w_fenetre_arakis
integer width = 4201
integer height = 2124
string title = ""
boolean center = true
cb_demarrer cb_demarrer
cb_arreter cb_arreter
st_statut st_statut
st_timer st_timer
cb_traiter cb_traiter
uo_1 uo_1
st_1 st_1
rb_mp3 rb_mp3
rb_wav rb_wav
sle_dossier sle_dossier
pb_dossier_de_sortie pb_dossier_de_sortie
pb_explorer pb_explorer
cb_pause cb_pause
sle_fichier_a_importer sle_fichier_a_importer
st_2 st_2
pb_fichier_a_importer pb_fichier_a_importer
cb_traiter_import cb_traiter_import
st_status_magic_lemp st_status_magic_lemp
gb_1 gb_1
end type
global w_ia_vocale w_ia_vocale

type prototypes
// Déclaration de winmm.dll pour envoyer des commandes MCI à Windows
FUNCTION uLong mciSendString ( &
	String lpstrCommand, &
	Ref String lpstrReturnString, &
	uLong uReturnLength, &
	uLong hwndCallback &
) LIBRARY "winmm.dll" ALIAS FOR "mciSendStringW"

//Pour le Drag and drop externe
FUNCTION ulong DragQueryFile( &
   ulong hDrop, &
   ulong iFile, &
   REF string lpszFile, &
   ulong cch &
) LIBRARY "shell32.dll" ALIAS FOR "DragQueryFileW"

SUBROUTINE DragFinish(  ulong hDrop ) LIBRARY "shell32.dll"


SUBROUTINE DragAcceptFiles(   ulong hWnd,  boolean fAccept ) LIBRARY "shell32.dll"
end prototypes

type variables
DateTime idtm_start
long il_total_seconds_complet


double var_code_locale


// pour le Drag and Drop avec l'OS 
nca_DragDrop	inca_DragDrop




end variables

forward prototypes
public subroutine traiter (string as_fichier_vocal)
end prototypes

public subroutine traiter (string as_fichier_vocal);// Si renseigné, on mémorise le dossier de sortie pour la prochaine fois 

if trim(sle_dossier.text) <> "" then 
	
	setprofilestring(dir_ini+inifile_orthokis,"IA","dossier_sortie_ia_vocale",trim(sle_dossier.text))

end if

String ls_json_complet, ls_err

IF fxg_transcription_envoyer(as_fichier_vocal, ls_json_complet, ls_err, st_status_magic_lemp) = 1 THEN
	st_status_magic_lemp.visible = false
	str_rapport_ia lstr_rapport_ia
	lstr_rapport_ia.code_patient = var_code_locale
	lstr_rapport_ia.json_ia_complet = ls_json_complet
	openWithParm(w_rapport_ia, lstr_rapport_ia)
ELSE
	MessageBox("Erreur dans la Transcription", ls_err, StopSign!)
END IF

end subroutine

on w_ia_vocale.create
int iCurrent
call super::create
this.cb_demarrer=create cb_demarrer
this.cb_arreter=create cb_arreter
this.st_statut=create st_statut
this.st_timer=create st_timer
this.cb_traiter=create cb_traiter
this.uo_1=create uo_1
this.st_1=create st_1
this.rb_mp3=create rb_mp3
this.rb_wav=create rb_wav
this.sle_dossier=create sle_dossier
this.pb_dossier_de_sortie=create pb_dossier_de_sortie
this.pb_explorer=create pb_explorer
this.cb_pause=create cb_pause
this.sle_fichier_a_importer=create sle_fichier_a_importer
this.st_2=create st_2
this.pb_fichier_a_importer=create pb_fichier_a_importer
this.cb_traiter_import=create cb_traiter_import
this.st_status_magic_lemp=create st_status_magic_lemp
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_demarrer
this.Control[iCurrent+2]=this.cb_arreter
this.Control[iCurrent+3]=this.st_statut
this.Control[iCurrent+4]=this.st_timer
this.Control[iCurrent+5]=this.cb_traiter
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.rb_mp3
this.Control[iCurrent+9]=this.rb_wav
this.Control[iCurrent+10]=this.sle_dossier
this.Control[iCurrent+11]=this.pb_dossier_de_sortie
this.Control[iCurrent+12]=this.pb_explorer
this.Control[iCurrent+13]=this.cb_pause
this.Control[iCurrent+14]=this.sle_fichier_a_importer
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.pb_fichier_a_importer
this.Control[iCurrent+17]=this.cb_traiter_import
this.Control[iCurrent+18]=this.st_status_magic_lemp
this.Control[iCurrent+19]=this.gb_1
end on

on w_ia_vocale.destroy
call super::destroy
destroy(this.cb_demarrer)
destroy(this.cb_arreter)
destroy(this.st_statut)
destroy(this.st_timer)
destroy(this.cb_traiter)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.rb_mp3)
destroy(this.rb_wav)
destroy(this.sle_dossier)
destroy(this.pb_dossier_de_sortie)
destroy(this.pb_explorer)
destroy(this.cb_pause)
destroy(this.sle_fichier_a_importer)
destroy(this.st_2)
destroy(this.pb_fichier_a_importer)
destroy(this.cb_traiter_import)
destroy(this.st_status_magic_lemp)
destroy(this.gb_1)
end on

event timer;call super::timer;DateTime ldtm_end
Time lt_elapsed
Long ll_total_seconds, ll_hours, ll_minutes, ll_seconds
String ls_formatted_time

// 1. Capture l'heure de fin
ldtm_end = DateTime(Today(), Now())

// 2. Calcule le total de secondes écoulées
ll_total_seconds = SecondsAfter(Time(idtm_start), Time(ldtm_end))

// Prise en compte du passage à minuit si le chrono dépasse minuit le même jour ou sur plusieurs jours
IF Date(ldtm_end) > Date(idtm_start) THEN
	ll_total_seconds = ll_total_seconds + DaysAfter(Date(idtm_start), Date(ldtm_end)) * 86400
END IF

il_total_seconds_complet = il_total_seconds_complet + ll_total_seconds

// 3. Convertit les secondes en heures, minutes et secondes
ll_hours   = il_total_seconds_complet / 3600
ll_minutes = Mod(il_total_seconds_complet, 3600) / 60
ll_seconds = Mod(il_total_seconds_complet, 60)

// 4. Formate au format HH:MM:SS avec zéros d'appoint
ls_formatted_time = String(ll_hours, "00") + ":" + &
                    String(ll_minutes, "00") + ":" + &
                    String(ll_seconds, "00")

// 5. Affiche le résultat dans le StaticText
st_timer.Text = ls_formatted_time
end event

event open;call super::open;
// patient passé en paramètre
var_code_locale = message.doubleparm

// Jeton : c59be6ae162bbf30ae16c70e26676be37eb750b380865a36

uo_1.taille(this)

inca_DragDrop.BeginDragDrop( sle_fichier_a_importer )

if trim(profilestring(dir_ini+inifile_orthokis,"IA","dossier_sortie_ia_vocale", "")) <> "" then 
	sle_dossier.text = trim(profilestring(dir_ini+inifile_orthokis,"IA","dossier_sortie_ia_vocale", "")) 
end if
end event

event resize;call super::resize;

uo_1.retaille(this)


// on repositionne certains 
pb_dossier_de_sortie.x = sle_dossier.x + sle_dossier.width + 100
pb_explorer.x = pb_dossier_de_sortie.x + pb_dossier_de_sortie.width + 100

pb_fichier_a_importer.x = sle_fichier_a_importer.x + sle_fichier_a_importer.width + 100

st_timer.x = st_statut.x +  st_timer.width / 2 
end event

type p_fond from w_fenetre_arakis`p_fond within w_ia_vocale
end type

type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1097
integer y = 344
integer width = 539
integer taborder = 20
boolean bringtotop = true
string text = "Démarrer"
string tiptext = "Lance l~'enregistrement"
string iconname = "actions_executer.png"
end type

event clicked;call super::clicked;String ls_return, ls_command
uLong lul_rc

// 1. Ouvrir le périphérique d'capture audio WAVEAUDIO
ls_command = "open new type waveaudio alias voice_rec"
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

IF lul_rc <> 0 THEN
	MessageBox("Erreur", "Impossible d'ouvrir le périphérique d'enregistrement audio.")
	RETURN
END IF

cb_traiter.enabled(false)
cb_pause.enabled(true)

// 2. Configurer la qualité sonore (ex: 44.1 kHz, 16-bit, Stéréo)
//mciSendString("set voice_rec time format ms", ls_return, 0, 0)
//mciSendString("set voice_rec bitspersample 16", ls_return, 0, 0)
//mciSendString("set voice_rec samplespersec 44100", ls_return, 0, 0)
//mciSendString("set voice_rec channels 2", ls_return, 0, 0)


mciSendString("set voice_rec bitspersample 16", ls_return, 0, 0)
mciSendString("set voice_rec samplespersec 16000", ls_return, 0, 0)
mciSendString("set voice_rec channels 1", ls_return, 0, 0)
mciSendString("set voice_rec bytespersec 32000", ls_return, 0, 0)
mciSendString("set voice_rec alignment 2", ls_return, 0, 0)



// 3. Lancer l'enregistrement
ls_command = "record voice_rec"
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

IF lul_rc = 0 THEN
	st_statut.visible = true
	st_statut.text = "Enregistrement en cours ..."
	st_timer.visible = true
	il_total_seconds_complet = 0
	// Enregistre la date et l'heure actuelles
	idtm_start = DateTime(Today(), Now())
	cb_arreter.enabled(true)
	this.enabled(false)
	timer(1)
ELSE
	MessageBox("Erreur", "Échec du démarrage de l'enregistrement.")
END IF

//lame.exe -b 32 --resample 16 -m m "input.wav" "output.mp3"

end event

type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 2405
integer y = 336
integer width = 539
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "Arrêter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "actions_abandonner.png"
end type

event clicked;call super::clicked;String ls_return, ls_command, ls_wav_path
uLong lul_rc

ls_wav_path = trim(sle_dossier.text )

//if ls_wav_path


ls_wav_path = dir_ini + "OTK_mon_enregistrement.wav"




// 1. Arrêter l'enregistrement
mciSendString("stop voice_rec", ls_return, 0, 0)

// 2. Sauvegarder le fichier audio sur le disque
ls_command = 'save voice_rec "' + ls_wav_path + '"'
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

// 3. Fermer le périphérique MCI
mciSendString("close voice_rec", ls_return, 0, 0)

cb_demarrer.enabled(true)
this.enabled(false)
st_statut.visible = false
timer(0)

IF lul_rc = 0 THEN
	MessageBox("INFORMATION", "Enregistrement sauvegardé : " + ls_wav_path)
	cb_traiter.enabled(true)
ELSE
	MessageBox("ARRENTION", "Impossible de sauvegarder le fichier audio !")
END IF
end event

type st_statut from statictext within w_ia_vocale
boolean visible = false
integer x = 1042
integer y = 628
integer width = 1509
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type st_timer from statictext within w_ia_vocale
boolean visible = false
integer x = 1408
integer y = 760
integer width = 782
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_traiter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1582
integer y = 980
integer width = 539
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Traiter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "imageeditor_effects.png"
end type

event clicked;call super::clicked;traiter("c:\power\ortho\mon_enregistrement.wav")



end event

type uo_1 from resize_fenetre within w_ia_vocale
boolean visible = false
integer x = 2478
integer y = 644
integer taborder = 10
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_1 from statictext within w_ia_vocale
integer x = 192
integer y = 164
integer width = 768
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Dossier Fichier de sortie : "
boolean focusrectangle = false
end type

type rb_mp3 from radiobutton within w_ia_vocale
integer x = 3301
integer y = 176
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mp3"
end type

type rb_wav from radiobutton within w_ia_vocale
integer x = 3547
integer y = 176
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Wav"
end type

type sle_dossier from singlelineedit within w_ia_vocale
integer x = 992
integer y = 160
integer width = 1723
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;//this.text = teim
end event

type pb_dossier_de_sortie from picturebutton within w_ia_vocale
integer x = 2752
integer y = 140
integer width = 151
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
string powertiptext = "Permet de sélectionner un répertoire"
long backcolor = 553648127
end type

event clicked;string repertoire
repertoire = sle_dossier.text
sle_dossier.text = get_repertoire("Sélectionnez le dossier de destination ...",repertoire)

end event

type pb_explorer from picturebutton within w_ia_vocale
integer x = 2926
integer y = 140
integer width = 151
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_windows.png"
string disabledname = "lc_explorer.png"
string powertiptext = "Lance l~'explorateur Windows dans le répertoire"
long backcolor = 553648127
end type

event clicked;

String v_commande

v_commande = "Explorer.exe /n," + sle_dossier.text


run(v_commande)
end event

type cb_pause from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1778
integer y = 344
integer width = 539
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Pause"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "ACTIONS_pause.png"
end type

event clicked;call super::clicked;String ls_return
uLong lul_rc

ls_return = Space(255)

IF this.Text = "Pause" THEN
	// 1. Mettre en pause l'enregistrement
	lul_rc = mciSendString("pause voice_rec", ls_return, 255, 0)
	
	IF lul_rc = 0 THEN
		Timer(0) // Stopper le rafraîchissement du chrono
		st_statut.Text = "Enregistrement en pause"
		this.iconname("actions_executer.png")
		this.Text = "Reprendre"
	ELSE
		MessageBox("Erreur", "Impossible de mettre en pause.")
	END IF

ELSE
	// 2. Reprendre l'enregistrement
	lul_rc = mciSendString("resume voice_rec", ls_return, 255, 0)
	
	IF lul_rc = 0 THEN
		// Nouveau départ
		idtm_start = DateTime(Today(), Now())
		Timer(1) // Relancer le timer
		st_statut.Text = "Enregistrement en cours..."
		this.Text = "Pause"
		this.iconname("ACTIONS_pause.png")

	ELSE
		MessageBox("Erreur", "Impossible de reprendre l'enregistrement.")
	END IF
END IF
end event

type sle_fichier_a_importer from singlelineedit within w_ia_vocale
event ue_dropfiles pbm_dropfiles
integer x = 837
integer y = 1268
integer width = 2889
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event ue_dropfiles;string ls_file
ulong lu_len
ulong lul_hDrop

// Le handle du fichier déposé est passé via le paramètre wparam
lul_hDrop = handle

// 1. Obtenir la taille du chemin du fichier (iFile = 0, buffer = null)
lu_len = DragQueryFile(lul_hDrop, 0, ls_file, 0)

IF lu_len > 0 THEN
    // 2. Allouer un buffer suffisamment grand pour récupérer le chemin complet
    ls_file = Space(lu_len + 1)
    
    // 3. Récupérer le chemin du fichier
    DragQueryFile(lul_hDrop, 0, ls_file, lu_len + 1)
    
    // 4. Assigner le chemin au SingleLineEdit
    this.text = Trim(ls_file)
END IF

// 5. Libérer la mémoire
DragFinish(lul_hDrop)

// vérification du fichier ...
if this.text <> "" then 
	ls_file = Trim(ls_file) 
	if right(ls_file, 3) <> "mp3" and  right(ls_file, 3) <> "wav" then
		Messagebox("ATTENTION", "Vous devez glisser / déposer un fichier vocal au format mp3 ou un fichier wav !")
		this.text = ""
	end if
	
end if


if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if

RETURN 0
end event

event constructor;
//DragAcceptFiles(Handle(this), True)




end event

event modified;

if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if
end event

event losefocus;

if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if

end event

type st_2 from statictext within w_ia_vocale
integer x = 55
integer y = 1284
integer width = 768
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fichier vocal à importer :"
boolean focusrectangle = false
end type

type pb_fichier_a_importer from picturebutton within w_ia_vocale
integer x = 3762
integer y = 1256
integer width = 151
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
string powertiptext = "Permet de sélectionner un répertoire"
long backcolor = 553648127
end type

event clicked;
string ficname,ficpath

if GetFileOpenName("Fichiers Son",ficname,ficpath,"WAV","Fichiers Sons (*.wav, *.mp3),*.Wav, *.mp3") = 1 then
	sle_fichier_a_importer.text = ficname
end if
end event

type cb_traiter_import from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1582
integer y = 1488
integer width = 539
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "Traiter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "imageeditor_effects.png"
end type

event clicked;call super::clicked;traiter(sle_fichier_a_importer.text)
end event

type st_status_magic_lemp from statictext within w_ia_vocale
boolean visible = false
integer x = 165
integer y = 1752
integer width = 3909
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_ia_vocale
integer x = 3214
integer y = 60
integer width = 704
integer height = 260
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Format du fichier"
end type

