$PBExportHeader$w_patient_archivage_numero.srw
forward
global type w_patient_archivage_numero from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_patient_archivage_numero
end type
type cb_archiver from uo_picturebutton_390x120 within w_patient_archivage_numero
end type
type em_num_plus_grand from editmask within w_patient_archivage_numero
end type
type st_5 from statictext within w_patient_archivage_numero
end type
type dw_2 from datawindow within w_patient_archivage_numero
end type
type st_4 from statictext within w_patient_archivage_numero
end type
type em_num_nv from editmask within w_patient_archivage_numero
end type
type st_3 from statictext within w_patient_archivage_numero
end type
type em_nom from editmask within w_patient_archivage_numero
end type
type st_1 from statictext within w_patient_archivage_numero
end type
type em_num from editmask within w_patient_archivage_numero
end type
type st_2 from statictext within w_patient_archivage_numero
end type
type dw_1 from datawindow within w_patient_archivage_numero
end type
end forward

global type w_patient_archivage_numero from w_fenetre_arakis
integer x = 663
integer y = 428
integer width = 1783
integer height = 1528
string title = "Archivage d~'un Dossier"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_archiver cb_archiver
em_num_plus_grand em_num_plus_grand
st_5 st_5
dw_2 dw_2
st_4 st_4
em_num_nv em_num_nv
st_3 st_3
em_nom em_nom
st_1 st_1
em_num em_num
st_2 st_2
dw_1 dw_1
end type
global w_patient_archivage_numero w_patient_archivage_numero

type variables
double var_code_local
double var_numero_dossier_local
end variables

forward prototypes
public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2)
public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2)
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

public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
		dw2.setitem(lig,"type_dossier",code)
		dw2.setitem(lig,"archivage",zone)
	next
end if

end subroutine

event open;call super::open;var_code_local = Message.DoubleParm


colore_datawindow(dw_1)
em_num.backcolor = couleur_fond_fenetre
em_num_plus_grand.backcolor = couleur_fond_fenetre
em_nom.backcolor = couleur_fond_fenetre


open(w_patience)


select numero_dossier into :var_numero_dossier_local from patient where code = :var_code_local ;

// Le patient à archiver est dans var_code_local

// Vérification si doit de l'argent ou pas
if due(var_code_local,today()) <> 0 then
	string  v_libelle1, v_libelle2, v_libelle3
	affichage_somme_due(var_code_local,  true , v_libelle1, v_libelle2, v_libelle3)
end if

centrer(this)

double max
SELECT max(numero_dossier) INTO :max FROM "patient" ;


// attention Idem dans Archivage multiple et modification de N°
// COMMENTAIRES CLINIQUES SPECIAUX


var_suite = false

em_num.text = string(var_numero_dossier_local)
em_nom.text = var_nom

// Recherche du 1er N° archivable dispo
double v_numero_archivage

v_numero_archivage = proposer_numero_archivage (var_numero_dossier_local)
	
em_num_nv.text = string(v_numero_archivage)

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve(var_code_local)
dw_2.SetTransObject(SQLCA)
dw_2.Retrieve()

// On se postionne sur le premier TYPE DE DOSSIER qui commence par "ARCHIV"
long lig
lig = dw_2.find("upper(left(nom,6)) = 'ARCHIV'",0,9999)
if lig > 0 then
	dw_2.scrollTorow(lig)
	dw_2.setrow(lig)
end if


em_num_plus_grand.text = string(max)

close(w_patience)

end event

on w_patient_archivage_numero.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_archiver=create cb_archiver
this.em_num_plus_grand=create em_num_plus_grand
this.st_5=create st_5
this.dw_2=create dw_2
this.st_4=create st_4
this.em_num_nv=create em_num_nv
this.st_3=create st_3
this.em_nom=create em_nom
this.st_1=create st_1
this.em_num=create em_num
this.st_2=create st_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_archiver
this.Control[iCurrent+3]=this.em_num_plus_grand
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.em_num_nv
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.em_nom
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.em_num
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.dw_1
end on

on w_patient_archivage_numero.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_archiver)
destroy(this.em_num_plus_grand)
destroy(this.st_5)
destroy(this.dw_2)
destroy(this.st_4)
destroy(this.em_num_nv)
destroy(this.st_3)
destroy(this.em_nom)
destroy(this.st_1)
destroy(this.em_num)
destroy(this.st_2)
destroy(this.dw_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_archivage_numero
end type

type cb_annuler from uo_picturebutton_390x120 within w_patient_archivage_numero
integer x = 873
integer y = 1240
integer width = 512
integer taborder = 80
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_archiver from uo_picturebutton_390x120 within w_patient_archivage_numero
integer x = 343
integer y = 1240
integer width = 512
integer taborder = 70
string text = "&Archivage"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double 				num, deja_utilise
string 				var_cp


NUM = double(em_num_nv.text)

if num = var_code then
	son(5)
	MessageBox("ATTENTION !","Vous avez indiqué le même numéro !~n~nAucun archivage réalisé !")
else
	if num = 0 or isnull(num) then
		son(5)
		MessageBox("ATTENTION !","Le numéro de dossier peut être positif,~nnégatif, mais pas nul !")
	else
		if not (-99999999<=num and num<=999999999) then
			son(5)
			MessageBox("ATTENTION !","Le numéro de dossier doit être compris entre -99999999 et 999999999 !")
		else
			
			select count(*) into :deja_utilise from patient where numero_dossier = :NUM ;
			
			if deja_utilise > 0 then
			// si le nume existe déjà -> msg utilisateur
				MessageBox("ATTENTION !","Le numéro de dossier indiqué existe déjà, ~n~nveuillez le changer avant de poursuivre !")
				
				// on met le focus sur le nouveau num de dossier
				em_num_nv.setfocus()
				
			else
				// le numéro n'existe pas encore ... GO !
				if Messagebox("ATTENTION","Vous allez changer le dossier N°"+string(var_numero_dossier)+" en N°"+string(num)+" !~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
					open(w_patience)
					// Var_numero_dossier = ancien code ; num = nouveau
					boolean ok
		
					string ancien_type_dossier, type_dossier, zone
					
					dw_1.AcceptText()
					// zone d'archivage
					zone = dw_1.GetItemString(dw_1.GetRow(),"archivage")

					
					// Ancien Type de dossier 
					ancien_type_dossier = dw_1.GetItemString(dw_1.GetRow(),"type_dossier")
					
					//Type de dossier une fois archivé
					type_dossier = dw_2.Gettext()
					
				
				
					// changer le numero de dossier
		
				
						// Modif des infos d'archivage et du numéro de dossier
						update patient set type_dossier = :type_dossier, archivage = :zone, numero_dossier = :num
						where code = :var_code ;
						
						if sqlca.sqlcode = 0 then
							commit ;	
							ajout_histo_actions(var_code, "NUMPAT", today(),"Ancien N° : "+string(var_numero_dossier)+" -> Nouveau N° "+string(num))
							// Si le nouveau type de dossier est différent 
							if ancien_type_dossier <> type_dossier then
									// Mise à jour de l'historique des dossiers
									INSERT INTO histo_dossier (code, date_heure, type_dossier) 
									VALUES (:var_code, getdate(), :type_dossier) ;
									COMMIT ;
									// Mémorisation de la création du dossier
									ajout_histo_actions(var_code,"ARCPAT",today(),"" )
							end if
							MessageBox("INFORMATION","Le dossier a été archivé avec succès !")
							
						else
							rollback ;
							MessageBox("ERREUR DANS LA RENUMEROTATION DU DOSSIER !",sqlca.sqlerrtext)
						end if
								
						
						close(parent)
						
					
				end if
			end if
		end if
	end if
end if

end event

type em_num_plus_grand from editmask within w_patient_archivage_numero
integer x = 795
integer y = 288
integer width = 462
integer height = 96
integer taborder = 111
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
string mask = "########0"
string displaydata = "p,~bˆ"
end type

type st_5 from statictext within w_patient_archivage_numero
integer x = 73
integer y = 300
integer width = 695
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Plus grand N° actuel :"
alignment alignment = right!
end type

type dw_2 from datawindow within w_patient_archivage_numero
integer x = 850
integer y = 1064
integer width = 869
integer height = 76
integer taborder = 60
string dataobject = "dw_dossier_ddlb1"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_patient_archivage_numero
integer x = 288
integer y = 1044
integer width = 535
integer height = 172
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de Dossier une fois archivé : "
end type

type em_num_nv from editmask within w_patient_archivage_numero
integer x = 786
integer y = 440
integer width = 443
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = "Ä"
end type

type st_3 from statictext within w_patient_archivage_numero
integer x = 73
integer y = 448
integer width = 695
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Archivé : "
alignment alignment = right!
end type

type em_nom from editmask within w_patient_archivage_numero
integer x = 553
integer y = 156
integer width = 1106
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
string displaydata = "~r"
end type

type st_1 from statictext within w_patient_archivage_numero
integer x = 265
integer y = 164
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Patient : "
alignment alignment = right!
end type

type em_num from editmask within w_patient_archivage_numero
integer x = 553
integer y = 28
integer width = 462
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
string mask = "########"
string displaydata = "~b"
end type

type st_2 from statictext within w_patient_archivage_numero
integer x = 178
integer y = 44
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier : "
alignment alignment = right!
end type

type dw_1 from datawindow within w_patient_archivage_numero
string tag = "brush"
integer x = 32
integer y = 604
integer width = 1687
integer height = 388
integer taborder = 30
string dataobject = "dw_type_dossier"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

