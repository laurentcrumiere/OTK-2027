$PBExportHeader$w_ia_vocale.srw
forward
global type w_ia_vocale from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_ia_vocale
end type
type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
end type
type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
end type
type st_statut from statictext within w_ia_vocale
end type
type st_timer from statictext within w_ia_vocale
end type
end forward

global type w_ia_vocale from w_fenetre_arakis
integer width = 2359
integer height = 892
string title = "IA Vocale"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_demarrer cb_demarrer
cb_arreter cb_arreter
st_statut st_statut
st_timer st_timer
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
end prototypes

type variables
DateTime idtm_start
end variables

on w_ia_vocale.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_demarrer=create cb_demarrer
this.cb_arreter=create cb_arreter
this.st_statut=create st_statut
this.st_timer=create st_timer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_demarrer
this.Control[iCurrent+3]=this.cb_arreter
this.Control[iCurrent+4]=this.st_statut
this.Control[iCurrent+5]=this.st_timer
end on

on w_ia_vocale.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_demarrer)
destroy(this.cb_arreter)
destroy(this.st_statut)
destroy(this.st_timer)
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
	ll_total_seconds += DaysAfter(Date(idtm_start), Date(ldtm_end)) * 86400
END IF

// 3. Convertit les secondes en heures, minutes et secondes
ll_hours   = ll_total_seconds / 3600
ll_minutes = Mod(ll_total_seconds, 3600) / 60
ll_seconds = Mod(ll_total_seconds, 60)

// 4. Formate au format HH:MM:SS avec zéros d'appoint
ls_formatted_time = String(ll_hours, "00") + ":" + &
                    String(ll_minutes, "00") + ":" + &
                    String(ll_seconds, "00")

// 5. Affiche le résultat dans le StaticText
st_timer.Text = ls_formatted_time
end event

type p_fond from w_fenetre_arakis`p_fond within w_ia_vocale
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_ia_vocale
integer x = 1490
integer y = 476
integer width = 539
integer taborder = 10
boolean bringtotop = true
end type

type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
integer x = 302
integer y = 476
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



// 2. Configurer la qualité sonore (ex: 44.1 kHz, 16-bit, Stéréo)
mciSendString("set voice_rec time format ms", ls_return, 0, 0)
mciSendString("set voice_rec bitspersample 16", ls_return, 0, 0)
mciSendString("set voice_rec samplespersec 44100", ls_return, 0, 0)
mciSendString("set voice_rec channels 2", ls_return, 0, 0)

// 3. Lancer l'enregistrement
ls_command = "record voice_rec"
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

IF lul_rc = 0 THEN
	st_statut.visible = true
	st_statut.text = "Enregistrement en cours ..."
	st_timer.visible = true

	// Enregistre la date et l'heure actuelles
	idtm_start = DateTime(Today(), Now())
	cb_arreter.enabled(true)
	this.enabled(false)
	timer(1)
ELSE
	MessageBox("Erreur", "Échec du démarrage de l'enregistrement.")
END IF
end event

type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 896
integer y = 476
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

ls_wav_path = dir_ini + "mon_enregistrement.wav"

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
ELSE
	MessageBox("ARRENTION", "Impossible de sauvegarder le fichier audio !")
END IF
end event

type st_statut from statictext within w_ia_vocale
boolean visible = false
integer x = 443
integer y = 116
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
integer x = 809
integer y = 248
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

