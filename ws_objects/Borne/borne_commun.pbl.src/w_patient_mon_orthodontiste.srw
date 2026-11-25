$PBExportHeader$w_patient_mon_orthodontiste.srw
forward
global type w_patient_mon_orthodontiste from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_patient_mon_orthodontiste
end type
type dw_connexions from u_basedw within w_patient_mon_orthodontiste
end type
type dw_rdv_futurs_orthokis from u_basedw within w_patient_mon_orthodontiste
end type
type dw_rdv_futurs_monorthodontiste from u_basedw within w_patient_mon_orthodontiste
end type
type cb_maj from uo_picturebutton_390x120 within w_patient_mon_orthodontiste
end type
end forward

global type w_patient_mon_orthodontiste from w_fenetre_arakis
integer width = 4279
integer height = 2140
string title = "Suivi de MonOrthodontiste"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
dw_connexions dw_connexions
dw_rdv_futurs_orthokis dw_rdv_futurs_orthokis
dw_rdv_futurs_monorthodontiste dw_rdv_futurs_monorthodontiste
cb_maj cb_maj
end type
global w_patient_mon_orthodontiste w_patient_mon_orthodontiste

type variables

double var_code_local

end variables

on w_patient_mon_orthodontiste.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_connexions=create dw_connexions
this.dw_rdv_futurs_orthokis=create dw_rdv_futurs_orthokis
this.dw_rdv_futurs_monorthodontiste=create dw_rdv_futurs_monorthodontiste
this.cb_maj=create cb_maj
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_connexions
this.Control[iCurrent+3]=this.dw_rdv_futurs_orthokis
this.Control[iCurrent+4]=this.dw_rdv_futurs_monorthodontiste
this.Control[iCurrent+5]=this.cb_maj
end on

on w_patient_mon_orthodontiste.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_connexions)
destroy(this.dw_rdv_futurs_orthokis)
destroy(this.dw_rdv_futurs_monorthodontiste)
destroy(this.cb_maj)
end on

event open;call super::open;
var_code_local = Message.DoubleParm

string v_nom, v_prenom

select isnull(trim(nom),''), isnull(trim(prenom),'') into :v_nom, :v_prenom 
from patient where code = :var_code_local ;

title = "Suivi de MonOrthodontiste de " + v_prenom + " "+ v_nom

dw_connexions.settransobject(sqlca)
dw_connexions.retrieve(var_code_local)

colore_datawindow(dw_rdv_futurs_orthokis)
colore_datawindow(dw_rdv_futurs_monorthodontiste)


dw_rdv_futurs_orthokis.settransobject(sqlca)
dw_rdv_futurs_orthokis.retrieve(var_code_local)

// on se sert de la meme DW - on fera des insert à l'interieur (sans mise à jour) à partir des infos venant de monorthodontiste
dw_rdv_futurs_monorthodontiste.settransobject(sqlca)
dw_rdv_futurs_monorthodontiste.reset()

if fxg_lancer_commande_myorthokis_simple("action?type=getRdvMonOrtho&code="+string(var_code_local) , true, "A" ) then
	
	string nom_fichier_recu
	integer numero_fichier_recu, nb_rdv, cpt_rdv, v_duree, v_fauteuil
	double code_rdv
	long lig
	string v_type_rdv, v_etat_rdv, v_code_praticien
	datetime v_rdv
	
	nom_fichier_recu = dir_ini + "wb.xml"
	
	nb_rdv = integer( ProfileString(nom_fichier_recu, "0", "NbReponses" , "0") )
	
	for cpt_rdv = 1 to nb_rdv
		
		code_rdv =  double( ProfileString(nom_fichier_recu,string(cpt_rdv), "id_rdv", "0") )
		
		if code_rdv <> 0 then
			
			 select top 1 "rdv"."rdv",   "type",   "rdv"."code_praticien",     "rdv"."duree",        "rdv"."fauteuil",       "rdv"."absent"
			 into :v_rdv , :v_type_rdv, :v_code_praticien, :v_duree,:v_fauteuil, :v_etat_rdv 
			 FROM "rdv"   
			WHERE ( "rdv"."code_interne" = :code_rdv ) ;  
			
			
			dw_rdv_futurs_monorthodontiste.Insertrow(99999)
			lig = dw_rdv_futurs_monorthodontiste.rowcount()
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "rdv", v_rdv)
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "type", v_type_rdv)
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "duree", v_duree)
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "fauteuil", v_fauteuil)
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "absent", v_etat_rdv)
			dw_rdv_futurs_monorthodontiste.SetItem(lig, "code_praticien", v_code_praticien)
					
		end if
	
		
	next
	
	dw_rdv_futurs_monorthodontiste.sort()
	
	


else
	MessageBox("ATTENTION","Impossible de récupérer les rendez-vous présents dans MonOrthodontiste !")
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_mon_orthodontiste
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_patient_mon_orthodontiste
integer x = 3739
integer y = 1884
integer width = 457
integer taborder = 10
boolean bringtotop = true
end type

type dw_connexions from u_basedw within w_patient_mon_orthodontiste
string tag = "brush"
integer x = 27
integer y = 12
integer width = 4210
integer height = 996
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Appareils avec MonOrthodontiste"
string dataobject = "dw_patient_mon_orthodontiste"
boolean hscrollbar = false
end type

type dw_rdv_futurs_orthokis from u_basedw within w_patient_mon_orthodontiste
string tag = "brush"
integer x = 50
integer y = 1056
integer width = 1545
integer height = 924
integer taborder = 11
boolean bringtotop = true
boolean titlebar = true
string title = "Prochains rendez-vous Orthokis"
string dataobject = "dw_rdv_futurs"
end type

type dw_rdv_futurs_monorthodontiste from u_basedw within w_patient_mon_orthodontiste
string tag = "brush"
integer x = 2130
integer y = 1044
integer width = 1545
integer height = 924
integer taborder = 21
boolean bringtotop = true
boolean titlebar = true
string title = "Prochains rendez-vous MonOrthodontiste"
string dataobject = "dw_rdv_futurs"
end type

type cb_maj from uo_picturebutton_390x120 within w_patient_mon_orthodontiste
integer x = 1637
integer y = 1504
integer width = 457
integer taborder = 21
boolean bringtotop = true
string text = "Envoyer"
string iconname = "Where_2!"
end type

event clicked;call super::clicked;
if fxg_lancer_commande_myorthokis_simple("action?type=majRdvMonOrtho&code="+string(var_code_local), true, "A" ) then
	Messagebox("INFORMATION","MonOrthodontiste a été mis à jour avec succès")
	close(parent)
else
	MessageBox("ATTENTION","Erreur dans la mise à jour de MonOrthodontiste")
end if
end event

