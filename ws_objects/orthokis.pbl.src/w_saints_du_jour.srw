$PBExportHeader$w_saints_du_jour.srw
forward
global type w_saints_du_jour from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_250x120 within w_saints_du_jour
end type
type st_4 from statictext within w_saints_du_jour
end type
type st_1 from statictext within w_saints_du_jour
end type
type st_3 from statictext within w_saints_du_jour
end type
type st_2 from statictext within w_saints_du_jour
end type
type st_titre_dw_soins_prevus from statictext within w_saints_du_jour
end type
type cb_fermer from uo_picturebutton_390x120 within w_saints_du_jour
end type
type dw_rdv_anniversaire from datawindow within w_saints_du_jour
end type
type dw_rdv from datawindow within w_saints_du_jour
end type
type mle_proverbe from multilineedit within w_saints_du_jour
end type
type dw_saints from datawindow within w_saints_du_jour
end type
type st_date from statictext within w_saints_du_jour
end type
type p_1 from picture within w_saints_du_jour
end type
type p_2 from picture within w_saints_du_jour
end type
end forward

global type w_saints_du_jour from w_fenetre_arakis
integer x = 402
integer width = 2994
integer height = 2412
string title = "Ephéméride"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
long backcolor = 15780518
boolean clientedge = true
boolean center = true
pb_1 pb_1
st_4 st_4
st_1 st_1
st_3 st_3
st_2 st_2
st_titre_dw_soins_prevus st_titre_dw_soins_prevus
cb_fermer cb_fermer
dw_rdv_anniversaire dw_rdv_anniversaire
dw_rdv dw_rdv
mle_proverbe mle_proverbe
dw_saints dw_saints
st_date st_date
p_1 p_1
p_2 p_2
end type
global w_saints_du_jour w_saints_du_jour

forward prototypes
public function string proverbe ()
end prototypes

public function string proverbe ();
// rechercher aléatoirement un proverbe dans la base et le renvoie, avec l'auteur si connu

string proverbe
string texte, auteur

long nb_prov


select count(*) into :nb_prov from proverbes ;


long hazard 

// Initalisation du système aléatoire ...
randomize(0)
hazard = rand(nb_prov)

select texte, auteur into :proverbe, :auteur from proverbes where id = :hazard ;

if len(trim(auteur)) > 0 then
	proverbe = proverbe + " ("+auteur+")"
end if




return proverbe




end function

on w_saints_du_jour.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.st_4=create st_4
this.st_1=create st_1
this.st_3=create st_3
this.st_2=create st_2
this.st_titre_dw_soins_prevus=create st_titre_dw_soins_prevus
this.cb_fermer=create cb_fermer
this.dw_rdv_anniversaire=create dw_rdv_anniversaire
this.dw_rdv=create dw_rdv
this.mle_proverbe=create mle_proverbe
this.dw_saints=create dw_saints
this.st_date=create st_date
this.p_1=create p_1
this.p_2=create p_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_titre_dw_soins_prevus
this.Control[iCurrent+7]=this.cb_fermer
this.Control[iCurrent+8]=this.dw_rdv_anniversaire
this.Control[iCurrent+9]=this.dw_rdv
this.Control[iCurrent+10]=this.mle_proverbe
this.Control[iCurrent+11]=this.dw_saints
this.Control[iCurrent+12]=this.st_date
this.Control[iCurrent+13]=this.p_1
this.Control[iCurrent+14]=this.p_2
end on

on w_saints_du_jour.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_titre_dw_soins_prevus)
destroy(this.cb_fermer)
destroy(this.dw_rdv_anniversaire)
destroy(this.dw_rdv)
destroy(this.mle_proverbe)
destroy(this.dw_saints)
destroy(this.st_date)
destroy(this.p_1)
destroy(this.p_2)
end on

event open;call super::open;
// Patience car ça peut prendre du temps

open(w_patience)


// mise en couleurs
mle_proverbe.backcolor = couleur_fond_fenetre
colore_datawindow(dw_saints)
colore_datawindow(dw_rdv)
colore_datawindow(dw_rdv_anniversaire)


st_date.text = jour[daynumber(today())]+ " "+ string(day(today())) +" "+ mois[month(today())] + " "+string(year(today()))

mle_proverbe.text = proverbe()


dw_saints.settransobject(sqlca)
dw_saints.retrieve(day(today()) , month(today()) )


dw_rdv.settransobject(sqlca)
dw_rdv.retrieve(today())

dw_rdv_anniversaire.settransobject(sqlca)
dw_rdv_anniversaire.retrieve(today())

this.title = "Bonjour "+utilisateur_nom + " !"

// En version mutli .. on affiche le code du praticien
if multi then
	dw_rdv.object.rdv_code_praticien.visible = 1
	dw_rdv_anniversaire.object.rdv_code_praticien.visible = 1
else
	dw_rdv.object.rdv_code_praticien.visible = 0
	dw_rdv_anniversaire.object.rdv_code_praticien.visible = 0
end if


//// On centre uniquement en horizontal
//double larg
//environment env
//GetEnvironment(env)
//// Récupération de la taille de l'écran
//larg = PixelsToUnits(env.ScreenWidth,XPixelsToUnits!)
//// Ajustement de la fenêtre au centre de l'écran
//this.x = (larg - this.Width) / 2


close(w_patience)

end event

type p_fond from w_fenetre_arakis`p_fond within w_saints_du_jour
end type

type pb_1 from uo_picturebutton_250x120 within w_saints_du_jour
integer x = 1979
integer y = 684
integer width = 471
integer height = 112
integer taborder = 30
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;mle_proverbe.text = proverbe()
end event

type st_4 from statictext within w_saints_du_jour
integer x = 9
integer y = 1488
integer width = 2921
integer height = 104
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "Anniversaires à souhaiter pour les rendez-vous du jour"
alignment alignment = center!
boolean border = true
end type

type st_1 from statictext within w_saints_du_jour
integer x = 9
integer y = 812
integer width = 2921
integer height = 104
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "Fêtes à souhaiter pour les rendez-vous du jour"
alignment alignment = center!
boolean border = true
end type

type st_3 from statictext within w_saints_du_jour
integer x = 1431
integer y = 136
integer width = 1499
integer height = 104
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "Proverbe ou citation du Jour"
alignment alignment = center!
boolean border = true
end type

type st_2 from statictext within w_saints_du_jour
integer x = 9
integer y = 136
integer width = 1390
integer height = 104
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "Les fêtes du Jour"
alignment alignment = center!
boolean border = true
end type

type st_titre_dw_soins_prevus from statictext within w_saints_du_jour
boolean visible = false
integer x = 896
integer y = 3744
integer width = 3744
integer height = 84
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 134217730
string text = "Lignes de Soins Prévus"
alignment alignment = center!
boolean border = true
end type

type cb_fermer from uo_picturebutton_390x120 within w_saints_du_jour
integer x = 1125
integer y = 2180
integer width = 503
integer height = 124
integer taborder = 10
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_rdv_anniversaire from datawindow within w_saints_du_jour
string tag = "brush"
integer x = 9
integer y = 1588
integer width = 2921
integer height = 572
string title = "Rendez-vous du Jour - Anniversaire à Souhaiter"
string dataobject = "dw_saints_du_jour_rdv_anniv"
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_rdv from datawindow within w_saints_du_jour
string tag = "brush"
integer x = 9
integer y = 912
integer width = 2921
integer height = 572
string title = "Rendez-vous du Jour - Fête à souhaiter"
string dataobject = "dw_saints_du_jour_rdv"
boolean vscrollbar = true
boolean livescroll = true
end type

type mle_proverbe from multilineedit within w_saints_du_jour
integer x = 1431
integer y = 236
integer width = 1499
integer height = 572
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "none"
alignment alignment = center!
end type

type dw_saints from datawindow within w_saints_du_jour
string tag = "brush"
integer x = 9
integer y = 236
integer width = 1390
integer height = 572
string title = "Les Saints du jour"
string dataobject = "dw_saints_du_jour"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_date from statictext within w_saints_du_jour
integer x = 32
integer y = 8
integer width = 2784
integer height = 116
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "none"
alignment alignment = center!
end type

type p_1 from picture within w_saints_du_jour
integer x = 2341
integer y = 1008
integer width = 421
integer height = 388
boolean bringtotop = true
string picturename = "lc_fete.png"
boolean focusrectangle = false
end type

type p_2 from picture within w_saints_du_jour
integer x = 2345
integer y = 1676
integer width = 398
integer height = 356
boolean bringtotop = true
string picturename = "lc_anniv_128.png"
boolean focusrectangle = false
end type

