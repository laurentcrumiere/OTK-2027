$PBExportHeader$w_histo_modifs.srw
forward
global type w_histo_modifs from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_histo_modifs
end type
type dw_liste from u_basedw within w_histo_modifs
end type
end forward

global type w_histo_modifs from w_fenetre_arakis
integer width = 4219
integer height = 2212
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
dw_liste dw_liste
end type
global w_histo_modifs w_histo_modifs

type variables


end variables

on w_histo_modifs.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_liste
end on

on w_histo_modifs.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_liste)
end on

event open;call super::open;double var_code_local
var_code_local = message.DoubleParm

if w_mdi_2020.width >= 4933 then
	this.width = 4933
	dw_liste.width = 4878
end if


open(w_patience)
dw_liste.Modify("t_1.text = 'HISTORIQUE DES ACTIONS PORTANT SUR LES RENDEZ-VOUS'")
//dw_liste.Modify("Titre2.text = '"+tit2+"'")


dw_liste.settransobject(sqlca)
dw_liste.SetSort("historique_editions_date_modif Desc")
dw_liste.Sort()
dw_liste.SetFilter("historique_editions_code_courrier = 'MODRDV' or historique_editions_code_courrier = 'SUPRDV' or historique_editions_code_courrier = 'AJORDV'")
dw_liste.Filter()

dw_liste.retrieve(var_code_local,var_code_local,'','ZZZZZZ', '' , 'ZZZZZZ',  datetime('1900-1-1') , datetime(today(), time('23:00')), '', 'ZZZZZZ')
close(w_patience)

end event

type p_fond from w_fenetre_arakis`p_fond within w_histo_modifs
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_histo_modifs
integer x = 1888
integer y = 2016
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type dw_liste from u_basedw within w_histo_modifs
integer x = 23
integer y = 16
integer width = 4155
integer height = 1968
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_analyse_historique_editions"
end type

