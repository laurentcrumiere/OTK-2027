$PBExportHeader$w_ecole_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_ecole_fiche from w_param_fiche
end type
type lb_ville from listbox within w_ecole_fiche
end type
type lb_codep from listbox within w_ecole_fiche
end type
type uo_appel from uo_appeler within w_ecole_fiche
end type
type dw_liste from datawindow within w_ecole_fiche
end type
end forward

global type w_ecole_fiche from w_param_fiche
string title = "Fiche Etablissement Scolaire"
lb_ville lb_ville
lb_codep lb_codep
uo_appel uo_appel
dw_liste dw_liste
end type
global w_ecole_fiche w_ecole_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

end variables

on w_ecole_fiche.create
int iCurrent
call super::create
this.lb_ville=create lb_ville
this.lb_codep=create lb_codep
this.uo_appel=create uo_appel
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_ville
this.Control[iCurrent+2]=this.lb_codep
this.Control[iCurrent+3]=this.uo_appel
this.Control[iCurrent+4]=this.dw_liste
end on

on w_ecole_fiche.destroy
call super::destroy
destroy(this.lb_ville)
destroy(this.lb_codep)
destroy(this.uo_appel)
destroy(this.dw_liste)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm
uo_1.taille(this)
centrer(this)

dw_fiche.settransobject(SQLCA)
dw_liste.settransobject(SQLCA)

if trim(code) = "" then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	double max
	// recherche de la valeur maxi
		
	if isValid(w_ecole) then
		// la fenêtre w_corresp est ouverte par ailleurs
		max = get_max_code_datawindow(w_ecole.dw_liste, "code") + 1
	else
		// on utilise la liste masquée de la fenêtre
		dw_liste.retrieve('%')
		max = get_max_code_datawindow(dw_liste, "code") + 1
	end if
		
		
//  SELECT MAX(CONVERT(double,code))  
//    INTO :max  
//    FROM "caisse"  
//   WHERE ( "caisse"."code" not between 'a' AND 'z' ) AND  
//         ( "caisse"."code" not between 'A' AND 'Z' )   ;
//
//	IF IsNull(max) THEN
//		max = 1
//	ELSE	
//		max = max + 1
//	END IF	
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
		
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	string clause
//	clause = "SELECT * FROM CORRESPONDANTS WHERE CORRESPONDANTS.CODE = '"+ CODE+"'"
//	dw_fiche.dwmodify('datawindow.table.select = "'+clause+'"')
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose



// Initialisation du lien CTI
uo_appel.dw = dw_fiche
uo_appel.nb_zone = 1
uo_appel.zone[1] = "tel"



this.backcolor = couleur_fond_fenetre

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if



end event

type p_fond from w_param_fiche`p_fond within w_ecole_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_ecole_fiche
integer y = 1272
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_ecole_fiche
integer y = 1272
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_ecole_fiche
integer y = 1272
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_ecole_fiche
integer y = 1272
end type

type uo_1 from w_param_fiche`uo_1 within w_ecole_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_ecole_fiche
integer width = 2578
integer height = 1184
string dataobject = "dw_ecole_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;//maj_code_postal(this,5,6,7,8)
ch_tel = "tel"
ch_fax = "fax"
	
maj_code_postal(this,"codep","ville", &
ch_tel,ch_fax,lb_ville,lb_codep,dw_maj,ch_maj,pref)


// Récupération du pays   et application 
string v_pays
v_pays = this.getitemstring(row, "pays")

formater_zone_pays(v_pays, 'T', this, "tel")
formater_zone_pays(v_pays, 'T', this, "fax")

end event

event dw_fiche::buttonclicked;call super::buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)




choose case ls_Object
		case "b_googlemaps"
			
			fxg_recherche_googlemaps (this.getitemstring(1, "adr1"), this.getitemstring(1, "codep"),this.getitemstring(1, "ville"), this.getitemstring(1, "pays") )
	end choose
end event

type lb_ville from listbox within w_ecole_fiche
boolean visible = false
integer x = 1659
integer y = 436
integer width = 1157
integer height = 528
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

end event

event rbuttondown;lb_ville.visible = FALSE
end event

type lb_codep from listbox within w_ecole_fiche
boolean visible = false
integer x = 1623
integer y = 420
integer width = 530
integer height = 528
integer taborder = 11
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

end event

event rbuttondown;lb_codep.visible = FALSE
end event

type uo_appel from uo_appeler within w_ecole_fiche
integer x = 334
integer y = 1272
integer taborder = 41
boolean bringtotop = true
end type

on uo_appel.destroy
call uo_appeler::destroy
end on

type dw_liste from datawindow within w_ecole_fiche
boolean visible = false
integer x = 110
integer y = 1040
integer width = 686
integer height = 400
integer taborder = 21
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ecole_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

