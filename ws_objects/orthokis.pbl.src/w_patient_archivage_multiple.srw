$PBExportHeader$w_patient_archivage_multiple.srw
forward
global type w_patient_archivage_multiple from w_fenetre_arakis
end type
type cb_archiver from uo_picturebutton_390x120 within w_patient_archivage_multiple
end type
type pb_1 from uo_picturebutton_390x120 within w_patient_archivage_multiple
end type
type dw_liste from datawindow within w_patient_archivage_multiple
end type
type em_max from editmask within w_patient_archivage_multiple
end type
type st_max from statictext within w_patient_archivage_multiple
end type
type em_min from editmask within w_patient_archivage_multiple
end type
type st_min from statictext within w_patient_archivage_multiple
end type
type dw_prati from datawindow within w_patient_archivage_multiple
end type
type rb_tous from radiobutton within w_patient_archivage_multiple
end type
type rb_un from radiobutton within w_patient_archivage_multiple
end type
type sle_archivage from singlelineedit within w_patient_archivage_multiple
end type
type st_1 from statictext within w_patient_archivage_multiple
end type
type dw_type1 from datawindow within w_patient_archivage_multiple
end type
type sle_etat from singlelineedit within w_patient_archivage_multiple
end type
type st_23 from statictext within w_patient_archivage_multiple
end type
type dw_type2 from datawindow within w_patient_archivage_multiple
end type
type gb_2 from groupbox within w_patient_archivage_multiple
end type
type st_4 from statictext within w_patient_archivage_multiple
end type
type gb_1 from groupbox within w_patient_archivage_multiple
end type
end forward

global type w_patient_archivage_multiple from w_fenetre_arakis
integer x = 663
integer y = 428
integer width = 2386
integer height = 1608
string title = "Archivage Multiple de Dossiers"
windowtype windowtype = response!
long backcolor = 15780518
cb_archiver cb_archiver
pb_1 pb_1
dw_liste dw_liste
em_max em_max
st_max st_max
em_min em_min
st_min st_min
dw_prati dw_prati
rb_tous rb_tous
rb_un rb_un
sle_archivage sle_archivage
st_1 st_1
dw_type1 dw_type1
sle_etat sle_etat
st_23 st_23
dw_type2 dw_type2
gb_2 gb_2
st_4 st_4
gb_1 gb_1
end type
global w_patient_archivage_multiple w_patient_archivage_multiple

forward prototypes
public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2)
end prototypes

public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
	next
end if


end subroutine

event open;call super::open;string s_code_praticien


open(w_patience)

colore_tous_objets_window(this, couleur_fond_datawindow)

dw_liste.settransobject(sqlca)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )

dw_type1.settransobject(sqlca)
dw_type1.retrieve()

dw_type2.settransobject(sqlca)
dw_type2.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

double max

SELECT max(numero_dossier) INTO :max 
FROM patient WHERE numero_dossier < 100000000 ;

em_min.text = '0'
em_max.text = string(max)

// On se postionne sur le premier TYPE DE DOSSIER qui commence par "ARCHIV"
long lig
lig = dw_type2.find("upper(left(nom,6)) = 'ARCHIV'",0,9999)
if lig > 0 then
	dw_type2.scrollTorow(lig)
	dw_type1.scrollTorow(lig)
	dw_type2.setrow(lig)
	dw_type1.setrow(lig)
end if




centrer(this)



close(w_patience)



end event

on w_patient_archivage_multiple.create
int iCurrent
call super::create
this.cb_archiver=create cb_archiver
this.pb_1=create pb_1
this.dw_liste=create dw_liste
this.em_max=create em_max
this.st_max=create st_max
this.em_min=create em_min
this.st_min=create st_min
this.dw_prati=create dw_prati
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.sle_archivage=create sle_archivage
this.st_1=create st_1
this.dw_type1=create dw_type1
this.sle_etat=create sle_etat
this.st_23=create st_23
this.dw_type2=create dw_type2
this.gb_2=create gb_2
this.st_4=create st_4
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_archiver
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.em_max
this.Control[iCurrent+5]=this.st_max
this.Control[iCurrent+6]=this.em_min
this.Control[iCurrent+7]=this.st_min
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.rb_tous
this.Control[iCurrent+10]=this.rb_un
this.Control[iCurrent+11]=this.sle_archivage
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.dw_type1
this.Control[iCurrent+14]=this.sle_etat
this.Control[iCurrent+15]=this.st_23
this.Control[iCurrent+16]=this.dw_type2
this.Control[iCurrent+17]=this.gb_2
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.gb_1
end on

on w_patient_archivage_multiple.destroy
call super::destroy
destroy(this.cb_archiver)
destroy(this.pb_1)
destroy(this.dw_liste)
destroy(this.em_max)
destroy(this.st_max)
destroy(this.em_min)
destroy(this.st_min)
destroy(this.dw_prati)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.sle_archivage)
destroy(this.st_1)
destroy(this.dw_type1)
destroy(this.sle_etat)
destroy(this.st_23)
destroy(this.dw_type2)
destroy(this.gb_2)
destroy(this.st_4)
destroy(this.gb_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_archivage_multiple
end type

type cb_archiver from uo_picturebutton_390x120 within w_patient_archivage_multiple
integer x = 535
integer y = 1316
integer width = 526
integer taborder = 60
string text = "&Archivage"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double 				num,var_numero_local,tot,cpt, var_numero_dossier_local, var_code_local
string 				var_cp
string 				var_type1		// Type de dossier AVANT archivage
string 				var_type2		// Type de dossier APRES archivage
string 				prat_min, prat_max
double 				numero_min , numero_max
boolean 				ok , pb_rep_radio
string				lstr_rep_photos_pwo


// recup rep photos pwo
//lstr_rep_photos_pwo = fxg_get_rep_photos()

if rb_tous.checked then
	prat_min = "      "
	prat_max = "ZZZZZZ"
else
	prat_min = dw_prati.gettext()
	prat_max = prat_min
end if

var_type1 = dw_type1.gettext()


numero_min = double(em_min.text)
numero_max = double(em_max.text)


open(w_patience)

sle_etat.visible = true

sle_etat.text = "Comptage"

dw_liste.retrieve(numero_min, numero_max, var_type1, prat_min, prat_max)

tot = dw_liste.rowcount()
//SELECT count(*) INTO :tot FROM patient WHERE type_dossier = :var_type1 and code < 100000000  and numero_praticien between :prat_min and :prat_max 
//and code between :numero_min and :numero_max ;

close(w_patience)


//DECLARE cur_type CURSOR FOR SELECT code FROM patient WHERE type_dossier = :var_type1 and code < 100000000 and numero_praticien 
//between :prat_min and :prat_max and code between :numero_min and :numero_max ORDER by code  ;

string lib_type1
select nom into :lib_type1 from dossier where code = :var_type1 ;




if Messagebox("ATTENTION","Vous allez archiver "+ string(tot)+" dossiers de type '"+ lib_type1 +"' !~n~n1. Cette opération peut être longue.~n~n2. Si vous êtes en réseau, VOUS DEVEZ DEMANDER aux autres utilisateurs de quitter ORTHOkis le temps de l'archivage.~nDe plus, VOUS DEVEZ FERMER les toutes les fenêtres.~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
	
		open(w_patience)

		long lig
		
		for lig = 1 to tot
			
			var_code_local = dw_liste.getitemnumber(lig,"code")
			var_numero_local = dw_liste.getitemnumber(lig,"numero_dossier")
		
			cpt = cpt + 1
			
			num = proposer_numero_archivage(abs(var_numero_local))
			
			
			sle_etat.text = string(cpt)+" / "+string(tot) + "   ("+string(var_numero_local)+")"
			
			yield()

		// var_numero_local = ancien code ; num = nouveau
			
			if num < 1000000000 then
				
				string type_dossier, zone, ancien_type_dossier
				
				// zone d'archivage
				zone = sle_archivage.text
				
				
				// Ancien Type de dossier 
				ancien_type_dossier = dw_liste.GetItemString(lig,"type_dossier")
					
				
				//Type de dossier une fois archivé
				type_dossier = dw_type2.Gettext()
			
				
				// changer le numero de dossier
		
				
				// Modif des infos d'archivage et du numéro de dossier
				update patient set type_dossier = :type_dossier, archivage = :zone, numero_dossier = :num
				where code = :var_code_local ;
						
				if sqlca.sqlcode = 0 then
					commit ;	
					ajout_histo_actions(var_code_local, "NUMPAT", today(),"Ancien N° : "+string(var_numero_local)+" -> Nouveau N° "+string(num))

					// Si le nouveau type de dossier est différent 
					if ancien_type_dossier <> type_dossier then
							// Mise à jour de l'historique des dossiers
							INSERT INTO histo_dossier (code, date_heure, type_dossier) 
							VALUES (:var_code_local, getdate(), :type_dossier) ;
							COMMIT ;
							// Mémorisation de la création du dossier
							ajout_histo_actions(var_code,"ARCPAT",today(),"" )
					end if

				else
					rollback ;
					MessageBox("ERREUR DANS LA RENUMEROTATION DU DOSSIER !",sqlca.sqlerrtext)
				end if
				
	
			end if 		// Le nouveau numéro est bon
			
		
		next
		
		sle_etat.text = "Enregistrement"
		
		commit ;
		


end if

close(parent)
end event

type pb_1 from uo_picturebutton_390x120 within w_patient_archivage_multiple
integer x = 1074
integer y = 1316
integer width = 526
integer taborder = 70
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_liste from datawindow within w_patient_archivage_multiple
boolean visible = false
integer x = 1563
integer y = 1084
integer width = 791
integer height = 432
string title = "none"
string dataobject = "dw_patient_archivage_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_max from editmask within w_patient_archivage_multiple
integer x = 1586
integer y = 352
integer width = 457
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type st_max from statictext within w_patient_archivage_multiple
integer x = 1147
integer y = 364
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au Dossier N°"
alignment alignment = right!
end type

type em_min from editmask within w_patient_archivage_multiple
integer x = 599
integer y = 352
integer width = 457
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type st_min from statictext within w_patient_archivage_multiple
integer x = 160
integer y = 364
integer width = 389
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du Dossier N°"
alignment alignment = right!
end type

type dw_prati from datawindow within w_patient_archivage_multiple
string tag = "no resizeall brush"
boolean visible = false
integer x = 722
integer y = 212
integer width = 859
integer height = 80
integer taborder = 50
string title = "none"
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type rb_tous from radiobutton within w_patient_archivage_multiple
integer x = 160
integer y = 116
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type rb_un from radiobutton within w_patient_archivage_multiple
integer x = 160
integer y = 212
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type sle_archivage from singlelineedit within w_patient_archivage_multiple
integer x = 626
integer y = 936
integer width = 928
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_patient_archivage_multiple
integer x = 137
integer y = 944
integer width = 480
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Zone archivage "
end type

type dw_type1 from datawindow within w_patient_archivage_multiple
string tag = "brush"
integer x = 974
integer y = 512
integer width = 869
integer height = 76
integer taborder = 30
string title = "none"
string dataobject = "dw_dossier_ddlb1"
boolean border = false
boolean livescroll = true
end type

type sle_etat from singlelineedit within w_patient_archivage_multiple
boolean visible = false
integer x = 631
integer y = 1164
integer width = 823
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
borderstyle borderstyle = stylelowered!
end type

type st_23 from statictext within w_patient_archivage_multiple
integer x = 119
integer y = 512
integer width = 855
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de dossier à archiver"
alignment alignment = center!
end type

type dw_type2 from datawindow within w_patient_archivage_multiple
string tag = "brush"
integer x = 1129
integer y = 808
integer width = 864
integer height = 76
integer taborder = 80
string dataobject = "dw_dossier_ddlb1"
boolean border = false
boolean livescroll = true
end type

type gb_2 from groupbox within w_patient_archivage_multiple
integer x = 69
integer y = 700
integer width = 2213
integer height = 396
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Informations des dossiers une fois archivés"
end type

type st_4 from statictext within w_patient_archivage_multiple
integer x = 119
integer y = 808
integer width = 1010
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de dossier une fois archivé"
end type

type gb_1 from groupbox within w_patient_archivage_multiple
integer x = 69
integer y = 28
integer width = 2213
integer height = 608
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection des dossiers à archiver"
end type

