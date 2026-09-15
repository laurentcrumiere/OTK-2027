$PBExportHeader$uo_filtre_emails.sru
forward
global type uo_filtre_emails from userobject
end type
type dw_liste_pour_envoi from datawindow within uo_filtre_emails
end type
type cbx_parent2 from checkbox within uo_filtre_emails
end type
type pb_envoi from picturebutton within uo_filtre_emails
end type
type cbx_patient from checkbox within uo_filtre_emails
end type
type cbx_parent from checkbox within uo_filtre_emails
end type
type gb_1 from groupbox within uo_filtre_emails
end type
end forward

global type uo_filtre_emails from userobject
integer width = 727
integer height = 160
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_liste_pour_envoi dw_liste_pour_envoi
cbx_parent2 cbx_parent2
pb_envoi pb_envoi
cbx_patient cbx_patient
cbx_parent cbx_parent
gb_1 gb_1
end type
global uo_filtre_emails uo_filtre_emails

type variables


datawindow dw_liste	// La vraie



editmask em_statut_mere


string filtre_initial	= ""	// dans certaines liste, y a déjà un filtre

string filtre = ""			// filtre lié aux case emails

string filtre_supplementaire = ""  // qu'on appliquera au moment de l'envoi au mail (pour des listes qui permettes de cocher / decocher des lignes

boolean liste_avec_groupe = false

boolean b_epat_affiche = true
boolean b_epar1_affiche = true
boolean b_epar2_affiche = true

end variables

forward prototypes
public subroutine filtre_emails ()
public subroutine set_filtre_initial (string v_filtre)
public subroutine set_filtre_supplementaire (string v_filtre)
end prototypes

public subroutine filtre_emails ();

// Filtre emails .. selon les cases à cocher


// Sans email parent 1
if cbx_parent.thirdstate then
	// les 2 .. pas de filtre		
	filtre = ""
else
	if  cbx_parent.checked then 
		// avec email parent 1
		filtre = "patient_email <> ''"
	else
		// pas cochée
		// Sans email parent 1
		filtre = "(patient_email = '' or isnull(patient_email))"
	end if
end if


if cbx_patient.thirdstate then
	// les 2 .. pas de filtre		
	filtre = filtre + ""
else
	if cbx_patient.checked then 
		if filtre <> "" then
			filtre = filtre + " and " 
		end if
		// avec email patient 1
		filtre = filtre + "patient_email_patient <> ''"
	else
		// Sans email patient
		// pas cochée
		if filtre <> "" then
			filtre = filtre + " and " 
		end if
		filtre = filtre + " (patient_email_patient = '' or isnull(patient_email_patient)) "
	end if
end if

if cbx_parent2.thirdstate then
	// les 2 .. pas de filtre		
	filtre = filtre + ""
else
	if cbx_parent2.checked then 
		if filtre <> "" then
			filtre = filtre + " and " 
		end if
		// avec email patient 2
		filtre = filtre + "patient_email_parent2 <> ''"
	else
		// Sans email patient
		// pas cochée
		if filtre <> "" then
			filtre = filtre + " and " 
		end if
		filtre = filtre + " (patient_email_parent2 = '' or isnull(patient_email_parent2)) "
	end if
end if


if filtre_initial <> "" then
	if filtre <> "" then 
		filtre = "(" +  filtre_initial + ") and " + filtre 
	else
		filtre =  filtre_initial
	end if
end if 

//messagebox("trace", filtre)

dw_liste.SetFilter(filtre)
dw_liste.filter()
dw_liste.GroupCalc()

if isvalid(em_statut_mere) then
	if pos(em_statut_mere.text,"Dossiers") > 0 then
		em_statut_mere.text = string(dw_liste.rowcount())+" Dossiers"
	else
		if pos(em_statut_mere.text,"Rendez") > 0 then
			em_statut_mere.text = string(dw_liste.rowcount())+" Rendez-vous"
		else
			em_statut_mere.text = string(dw_liste.rowcount())+" Eléments"
		end if
	end if
end if

// libère t on le bouton pour envoyer les emails .... ??

pb_envoi.visible = false

if dw_liste.rowcount() > 0 and ( (cbx_patient.checked and not cbx_patient.thirdstate) or (cbx_parent.checked and not cbx_parent.thirdstate) or (cbx_parent2.checked and not cbx_parent2.thirdstate)  ) then 
	pb_envoi.visible = true
end if


end subroutine

public subroutine set_filtre_initial (string v_filtre);

filtre_initial = v_filtre
end subroutine

public subroutine set_filtre_supplementaire (string v_filtre);

filtre_supplementaire = v_filtre
end subroutine

on uo_filtre_emails.create
this.dw_liste_pour_envoi=create dw_liste_pour_envoi
this.cbx_parent2=create cbx_parent2
this.pb_envoi=create pb_envoi
this.cbx_patient=create cbx_patient
this.cbx_parent=create cbx_parent
this.gb_1=create gb_1
this.Control[]={this.dw_liste_pour_envoi,&
this.cbx_parent2,&
this.pb_envoi,&
this.cbx_patient,&
this.cbx_parent,&
this.gb_1}
end on

on uo_filtre_emails.destroy
destroy(this.dw_liste_pour_envoi)
destroy(this.cbx_parent2)
destroy(this.pb_envoi)
destroy(this.cbx_patient)
destroy(this.cbx_parent)
destroy(this.gb_1)
end on

type dw_liste_pour_envoi from datawindow within uo_filtre_emails
boolean visible = false
integer y = 304
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_liste_pour_envoi_email"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_parent2 from checkbox within uo_filtre_emails
string tag = "no resize all"
integer x = 379
integer y = 72
integer width = 187
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Par2"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;

filtre_emails()
end event

event constructor;this.backcolor = couleur_fond_fenetre
end event

event rbuttondown;// Masque ou affiche l'information d'email
if b_epar2_affiche then
	// on masque
	b_epar2_affiche = false
	dw_liste.object.t_epar2.visible = false

else
	// on affiche
	b_epar2_affiche = true
	dw_liste.object.t_epar2.visible = "1~tif ( patient_email_parent2 <> '', 1, 0)" 
	
end if

string a1, a2, a3

a1 = upper(dw_liste.object.datawindow.detail.Height.AutoSize )
a2 = upper(dw_liste.describe("datawindow.header.1.Height.AutoSize" ) )
a3 = upper(dw_liste.describe("datawindow.header.2.Height.AutoSize" ) )

// Si une des band est en autosize ; on redimmensionne 
if a1 = "YES" or a2 = "YES" or a3 = "YES" then
	dw_liste.groupcalc()
end if
end event

type pb_envoi from picturebutton within uo_filtre_emails
boolean visible = false
integer x = 567
integer y = 40
integer width = 137
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_envoi_message.png"
alignment htextalign = left!
end type

event clicked;long lig, tot, lig_pour_envoi
double v_code

if filtre_supplementaire <> "" then
	// On applique le fitre supplémentaire avant l'envoi
	
	string ls_filter 
	
	ls_filter = dw_liste.Object.DataWindow.Table.Filter
	
	// pour éliminer les ~ qui font ensuite planter le Setfiler
	ls_filter = gfx_tout_remplacer(ls_filter, char(126) , "")
	
	filtre =  ls_filter + " and (" + filtre_supplementaire + ") "
	
	dw_liste.setfilter(filtre)
	dw_liste.filter()

end if

if dw_liste.rowcount() = 0 then 
	Messagebox("ATTENTION", "Il n'y a plus d'éléments sélectionné dans la liste !")
else
	
	
	
	// uniquement pour compatibilité de l'appel
	double v_code_local = 0 
	integer desti
	
	 if cbx_parent.checked and not cbx_parent.thirdstate then 
		desti = 1
	else
		 if cbx_patient.checked and not cbx_patient.thirdstate then 
			desti = 0
		else
			desti = 9
		end if
	end if
end if

if liste_avec_groupe then
	// si la liste est avec groupe, on la parcours pour prendre le 1er code de chaque groupe et constituer une liste de mail
	//code_groupe
	dw_liste_pour_envoi.reset()
	
	tot = dw_liste.rowcount() 
	for lig = 1 to tot
		v_code = dw_liste.getitemNumber(lig, "code")
		
		if dw_liste_pour_envoi.find("code = " + string(v_code), 0, 999) = 0 then
			// code pas encore dans la liste /.. on ajoute
			
			dw_liste_pour_envoi.insertrow(9999)
			lig_pour_envoi = dw_liste_pour_envoi.rowcount()
			dw_liste_pour_envoi.setitem(lig_pour_envoi, "code", v_code)
			dw_liste_pour_envoi.setitem(lig_pour_envoi, "patient_email", dw_liste.getitemString(lig, "patient_email"))
			dw_liste_pour_envoi.setitem(lig_pour_envoi, "patient_email_patient", dw_liste.getitemString(lig, "patient_email_patient"))
			dw_liste_pour_envoi.setitem(lig_pour_envoi, "patient_email_parent2", dw_liste.getitemString(lig, "patient_email_parent2"))
			
		end if
		
	next
	fxg_envoi_email_libre(v_code_local, dw_liste_pour_envoi, desti)
	
else
	fxg_envoi_email_libre(v_code_local, dw_liste, desti)
end if

end event

type cbx_patient from checkbox within uo_filtre_emails
string tag = "no resize all"
integer x = 210
integer y = 72
integer width = 169
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pat"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;
filtre_emails()


end event

event constructor;this.backcolor = couleur_fond_fenetre
end event

event rbuttondown;// Masque ou affiche l'information d'email
if b_epat_affiche then
	// on masque
	b_epat_affiche = false
	dw_liste.object.t_epat.visible = false

else
	// on affiche
	b_epat_affiche = true
	dw_liste.object.t_epat.visible = "1~tif ( patient_email_patient <> '', 1, 0)" 
	
end if

string a1, a2, a3

a1 = upper(dw_liste.object.datawindow.detail.Height.AutoSize )
a2 = upper(dw_liste.describe("datawindow.header.1.Height.AutoSize" ) )
a3 = upper(dw_liste.describe("datawindow.header.2.Height.AutoSize" ) )

// Si une des band est en autosize ; on redimmensionne 
if a1 = "YES" or a2 = "YES" or a3 = "YES" then
	dw_liste.groupcalc()
end if


end event

type cbx_parent from checkbox within uo_filtre_emails
string tag = "no resize all"
integer x = 23
integer y = 72
integer width = 187
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Par1"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;

filtre_emails()
end event

event constructor;this.backcolor = couleur_fond_fenetre
end event

event rbuttondown;// Masque ou affiche l'information d'email
if b_epar1_affiche then
	// on masque
	b_epar1_affiche = false
	dw_liste.object.t_epar.visible = false

else
	// on affiche
	b_epar1_affiche = true
	dw_liste.object.t_epar.visible = "1~tif ( patient_email <> '', 1, 0)" 
	
end if

string a1, a2, a3

a1 = upper(dw_liste.object.datawindow.detail.Height.AutoSize )
a2 = upper(dw_liste.describe("datawindow.header.1.Height.AutoSize" ) )
a3 = upper(dw_liste.describe("datawindow.header.2.Height.AutoSize" ) )

// Si une des band est en autosize ; on redimmensionne 
if a1 = "YES" or a2 = "YES" or a3 = "YES" then
	dw_liste.groupcalc()
end if



end event

type gb_1 from groupbox within uo_filtre_emails
string tag = "no resize"
integer width = 718
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre Emails"
end type

event constructor;

this.backcolor = couleur_fond_fenetre

end event

