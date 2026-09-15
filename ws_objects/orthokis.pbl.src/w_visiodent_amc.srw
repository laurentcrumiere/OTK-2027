$PBExportHeader$w_visiodent_amc.srw
forward
global type w_visiodent_amc from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_visiodent_amc
end type
type dw_liste from datawindow within w_visiodent_amc
end type
end forward

global type w_visiodent_amc from w_fenetre_arakis
integer width = 3502
integer height = 1604
string title = "INFORMATIONS VISIODENT"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
dw_liste dw_liste
end type
global w_visiodent_amc w_visiodent_amc

on w_visiodent_amc.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_liste
end on

on w_visiodent_amc.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_liste)
end on

event open;call super::open;
string nom_fichier_recu


nom_fichier_recu = message.StringParm

// Lecture de tous les blocs


integer nb_blocs, cpt

nb_blocs = ProfileInt(nom_fichier_recu,"0", "NbReponses", 1)

for cpt = 1 to nb_blocs
	
	dw_liste.insertrow(0)
	
	dw_liste.SetItem(cpt, "DateFin",  ProfileString(nom_fichier_recu, string(cpt) , "DateFin", "") )
	dw_liste.SetItem(cpt, "DateDebut",  ProfileString(nom_fichier_recu, string(cpt) , "DateDebut", "") )
	dw_liste.SetItem(cpt, "Libelle",  ProfileString(nom_fichier_recu, string(cpt) , "Libelle", "") )
	dw_liste.SetItem(cpt, "rnm",  ProfileString(nom_fichier_recu, string(cpt) , "rnm", "") )
	dw_liste.SetItem(cpt, "TopTP",  ProfileString(nom_fichier_recu, string(cpt) , "TopTP", "") )

next
end event

type p_fond from w_fenetre_arakis`p_fond within w_visiodent_amc
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_visiodent_amc
integer x = 1445
integer y = 1308
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type dw_liste from datawindow within w_visiodent_amc
integer x = 32
integer y = 40
integer width = 3397
integer height = 1192
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_visiodent_amc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

