$PBExportHeader$w_diagnos_maj_cabot1.srw
$PBExportComments$Gearbox
forward
global type w_diagnos_maj_cabot1 from Window
end type
type st_81 from statictext within w_diagnos_maj_cabot1
end type
type mle_col1 from multilineedit within w_diagnos_maj_cabot1
end type
type mle_col6 from multilineedit within w_diagnos_maj_cabot1
end type
type mle_col5 from multilineedit within w_diagnos_maj_cabot1
end type
type mle_col4 from multilineedit within w_diagnos_maj_cabot1
end type
type mle_col3 from multilineedit within w_diagnos_maj_cabot1
end type
type mle_col2 from multilineedit within w_diagnos_maj_cabot1
end type
type st_19 from statictext within w_diagnos_maj_cabot1
end type
type st_18 from statictext within w_diagnos_maj_cabot1
end type
type st_17 from statictext within w_diagnos_maj_cabot1
end type
type st_16 from statictext within w_diagnos_maj_cabot1
end type
type st_15 from statictext within w_diagnos_maj_cabot1
end type
type st_14 from statictext within w_diagnos_maj_cabot1
end type
type st_13 from statictext within w_diagnos_maj_cabot1
end type
type st_12 from statictext within w_diagnos_maj_cabot1
end type
type st_11 from statictext within w_diagnos_maj_cabot1
end type
type st_10 from statictext within w_diagnos_maj_cabot1
end type
type st_9 from statictext within w_diagnos_maj_cabot1
end type
type st_8 from statictext within w_diagnos_maj_cabot1
end type
type st_7 from statictext within w_diagnos_maj_cabot1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_cabot1
end type
type cb_annuler from commandbutton within w_diagnos_maj_cabot1
end type
type cb_fermer from commandbutton within w_diagnos_maj_cabot1
end type
type st_44 from statictext within w_diagnos_maj_cabot1
end type
type st_45 from statictext within w_diagnos_maj_cabot1
end type
type st_46 from statictext within w_diagnos_maj_cabot1
end type
type st_47 from statictext within w_diagnos_maj_cabot1
end type
type st_49 from statictext within w_diagnos_maj_cabot1
end type
type st_50 from statictext within w_diagnos_maj_cabot1
end type
type st_51 from statictext within w_diagnos_maj_cabot1
end type
type st_52 from statictext within w_diagnos_maj_cabot1
end type
type st_53 from statictext within w_diagnos_maj_cabot1
end type
type st_54 from statictext within w_diagnos_maj_cabot1
end type
type st_55 from statictext within w_diagnos_maj_cabot1
end type
type st_56 from statictext within w_diagnos_maj_cabot1
end type
type st_57 from statictext within w_diagnos_maj_cabot1
end type
type st_58 from statictext within w_diagnos_maj_cabot1
end type
end forward

global type w_diagnos_maj_cabot1 from Window
int X=1
int Y=269
int Width=2789
int Height=1353
boolean TitleBar=true
string Title="Page N°1"
long BackColor=12632256
WindowType WindowType=response!
st_81 st_81
mle_col1 mle_col1
mle_col6 mle_col6
mle_col5 mle_col5
mle_col4 mle_col4
mle_col3 mle_col3
mle_col2 mle_col2
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
st_44 st_44
st_45 st_45
st_46 st_46
st_47 st_47
st_49 st_49
st_50 st_50
st_51 st_51
st_52 st_52
st_53 st_53
st_54 st_54
st_55 st_55
st_56 st_56
st_57 st_57
st_58 st_58
end type
global w_diagnos_maj_cabot1 w_diagnos_maj_cabot1

type variables
double var_code_local 
string page,var_nom_local
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();mle_col1.text = RightTrim(mid(page,1,100))
mle_col2.text = RightTrim(mid(page,101,100))
mle_col3.text = RightTrim(mid(page,201,100))
mle_col4.text = RightTrim(mid(page,301,100))
mle_col5.text = RightTrim(mid(page,401,100))
mle_col6.text = RightTrim(mid(page,501,100))

end subroutine

event open;var_code_local = message.doubleparm

select nom INTO :var_nom_local FROM patient WHERE code = :var_code_local ;
this.title = "Page N°1 : "+var_nom_local+" ("+string(var_code_local)+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()


end event

on w_diagnos_maj_cabot1.create
this.st_81=create st_81
this.mle_col1=create mle_col1
this.mle_col6=create mle_col6
this.mle_col5=create mle_col5
this.mle_col4=create mle_col4
this.mle_col3=create mle_col3
this.mle_col2=create mle_col2
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.st_44=create st_44
this.st_45=create st_45
this.st_46=create st_46
this.st_47=create st_47
this.st_49=create st_49
this.st_50=create st_50
this.st_51=create st_51
this.st_52=create st_52
this.st_53=create st_53
this.st_54=create st_54
this.st_55=create st_55
this.st_56=create st_56
this.st_57=create st_57
this.st_58=create st_58
this.Control[]={ this.st_81,&
this.mle_col1,&
this.mle_col6,&
this.mle_col5,&
this.mle_col4,&
this.mle_col3,&
this.mle_col2,&
this.st_19,&
this.st_18,&
this.st_17,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.st_44,&
this.st_45,&
this.st_46,&
this.st_47,&
this.st_49,&
this.st_50,&
this.st_51,&
this.st_52,&
this.st_53,&
this.st_54,&
this.st_55,&
this.st_56,&
this.st_57,&
this.st_58}
end on

on w_diagnos_maj_cabot1.destroy
destroy(this.st_81)
destroy(this.mle_col1)
destroy(this.mle_col6)
destroy(this.mle_col5)
destroy(this.mle_col4)
destroy(this.mle_col3)
destroy(this.mle_col2)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.st_44)
destroy(this.st_45)
destroy(this.st_46)
destroy(this.st_47)
destroy(this.st_49)
destroy(this.st_50)
destroy(this.st_51)
destroy(this.st_52)
destroy(this.st_53)
destroy(this.st_54)
destroy(this.st_55)
destroy(this.st_56)
destroy(this.st_57)
destroy(this.st_58)
end on

type st_81 from statictext within w_diagnos_maj_cabot1
int X=197
int Y=873
int Width=229
int Height=73
boolean Enabled=false
string Text="LEVRES"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_col1 from multilineedit within w_diagnos_maj_cabot1
int X=686
int Y=77
int Width=206
int Height=873
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_col6 from multilineedit within w_diagnos_maj_cabot1
int X=2282
int Y=81
int Width=206
int Height=873
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_col5 from multilineedit within w_diagnos_maj_cabot1
int X=1962
int Y=81
int Width=206
int Height=873
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_col4 from multilineedit within w_diagnos_maj_cabot1
int X=1642
int Y=81
int Width=206
int Height=873
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_col3 from multilineedit within w_diagnos_maj_cabot1
int X=1322
int Y=81
int Width=206
int Height=873
int TabOrder=30
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type mle_col2 from multilineedit within w_diagnos_maj_cabot1
int X=1002
int Y=81
int Width=206
int Height=873
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean IgnoreDefaultButton=true
long BackColor=16777215
int TextSize=-9
int Weight=400
string FaceName="Fixedsys"
FontFamily FontFamily=Modern!
FontPitch FontPitch=Fixed!
end type

type st_19 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=745
int Width=138
int Height=73
boolean Enabled=false
string Text="SE"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_18 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=685
int Width=348
int Height=73
boolean Enabled=false
string Text="GoGn / SN"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_17 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=625
int Width=266
int Height=73
boolean Enabled=false
string Text="Occl / SN"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_16 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=565
int Width=138
int Height=73
boolean Enabled=false
string Text="I / i"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_15 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=505
int Width=348
int Height=73
boolean Enabled=false
string Text="Po to NB mm"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_14 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=445
int Width=247
int Height=73
boolean Enabled=false
string Text="i to NB °"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_13 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=385
int Width=293
int Height=73
boolean Enabled=false
string Text="i to NB mm"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_12 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=325
int Width=247
int Height=73
boolean Enabled=false
string Text="I to NA °"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_11 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=265
int Width=293
int Height=73
boolean Enabled=false
string Text="I to NA mm"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_10 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=205
int Width=138
int Height=73
boolean Enabled=false
string Text="ANB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_9 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=145
int Width=138
int Height=73
boolean Enabled=false
string Text="SNB"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_8 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=805
int Width=138
int Height=73
boolean Enabled=false
string Text="SL"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_7 from statictext within w_diagnos_maj_cabot1
int X=202
int Y=85
int Width=138
int Height=73
boolean Enabled=false
string Text="SNA"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=12632256
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_cabot1
int X=1884
int Y=1109
int Width=385
int Height=109
int TabOrder=80
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;place_avec_blancs(mle_col1.text,page,1,100)
place_avec_blancs(mle_col2.text,page,101,100)
place_avec_blancs(mle_col3.text,page,201,100)
place_avec_blancs(mle_col4.text,page,301,100)
place_avec_blancs(mle_col5.text,page,401,100)
place_avec_blancs(mle_col6.text,page,501,100)


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;



end on

type cb_annuler from commandbutton within w_diagnos_maj_cabot1
int X=1482
int Y=1109
int Width=385
int Height=109
int TabOrder=70
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_cabot1
int X=2286
int Y=1109
int Width=385
int Height=109
int TabOrder=90
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

type st_44 from statictext within w_diagnos_maj_cabot1
int X=353
int Y=93
int Width=2241
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_45 from statictext within w_diagnos_maj_cabot1
int X=353
int Y=153
int Width=2241
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_46 from statictext within w_diagnos_maj_cabot1
int X=353
int Y=213
int Width=2241
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_47 from statictext within w_diagnos_maj_cabot1
int X=503
int Y=273
int Width=1930
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_49 from statictext within w_diagnos_maj_cabot1
int X=426
int Y=333
int Width=2017
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_50 from statictext within w_diagnos_maj_cabot1
int X=513
int Y=393
int Width=1939
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_51 from statictext within w_diagnos_maj_cabot1
int X=426
int Y=453
int Width=2017
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_52 from statictext within w_diagnos_maj_cabot1
int X=572
int Y=513
int Width=1852
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_53 from statictext within w_diagnos_maj_cabot1
int X=343
int Y=573
int Width=2017
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_54 from statictext within w_diagnos_maj_cabot1
int X=462
int Y=633
int Width=1998
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_55 from statictext within w_diagnos_maj_cabot1
int X=467
int Y=693
int Width=1998
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_56 from statictext within w_diagnos_maj_cabot1
int X=330
int Y=753
int Width=1998
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_57 from statictext within w_diagnos_maj_cabot1
int X=330
int Y=813
int Width=1998
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_58 from statictext within w_diagnos_maj_cabot1
int X=362
int Y=873
int Width=1998
int Height=61
boolean Enabled=false
string Text="-----------------------------------------------------------------------------------------------------------------"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-9
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

