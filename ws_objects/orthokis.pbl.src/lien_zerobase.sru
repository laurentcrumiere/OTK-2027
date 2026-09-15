$PBExportHeader$lien_zerobase.sru
forward
global type lien_zerobase from userobject
end type
type st_1 from statictext within lien_zerobase
end type
type cb_ajouter from commandbutton within lien_zerobase
end type
end forward

global type lien_zerobase from userobject
integer width = 686
integer height = 200
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
cb_ajouter cb_ajouter
end type
global lien_zerobase lien_zerobase

type variables

w_patient_maj		win_parent

end variables

on lien_zerobase.create
this.st_1=create st_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_1,&
this.cb_ajouter}
end on

on lien_zerobase.destroy
destroy(this.st_1)
destroy(this.cb_ajouter)
end on

type st_1 from statictext within lien_zerobase
integer x = 5
integer y = 12
integer width = 663
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Lien ZEROBASE"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_zerobase
integer x = 5
integer y = 84
integer width = 663
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer"
end type

event clicked;// sauvegarde la fiche ad
win_parent.cb_enregister.TriggerEvent ( Clicked! )


double var_code_local
integer lig
string ligne_fichier[86]




string nom_fichier
long numero_fichier

var_code_local = win_parent.var_code_local

// initialisation ...
for lig = 1 to upperbound(ligne_fichier)

	ligne_fichier[lig]  = ""

next




// recup des éléments dans la base de données
select 

string(numero_dossier),
isnull(nom,''),
prenom,
'',
isnull(adr1_parent1,''),
isnull(codep_parent1,''),
isnull(ville_parent1,''),
isnull(teldom_parent1,''),
isnull(teldom2_parent1,''),
'',						// ligne 10
isnull(teltra_parent1,''),
isnull(portable,''),
isnull(portable2_parent1,''),
isnull(email,''),
'',
'',
isnull(sexe,''),
isnull(dateformat(date_naissance,'dd/mm/yyyy'),''),
isnull(dateformat(date_contact,'dd/mm/yyyy'),''),
isnull((select nom from titre_personnes where patient.titre_patient = titre_personnes.code), '') ,	// ligne 20
'',
'R',
isnull((select nom from correspondants where patient.code_correspondant = correspondants.code ),	''),
isnull((select prenom from correspondants where patient.code_correspondant = correspondants.code) ,	''),
isnull((select adr1 from correspondants where patient.code_correspondant = correspondants.code ),	''),
isnull((select codep from correspondants where patient.code_correspondant = correspondants.code) ,	''),
isnull((select ville from correspondants where patient.code_correspondant = correspondants.code) ,	''),
isnull((select titre_personnes.nom from titre_personnes, correspondants where patient.code_correspondant = correspondants.code and correspondants.titre = titre_personnes.code) ,	''),
'',	
'O',  // ligne 30
isnull((select nom from correspondants where patient.code_dentiste = correspondants.code ),	''),
isnull((select prenom from correspondants where patient.code_dentiste = correspondants.code ),	''),
isnull((select adr1 from correspondants where patient.code_dentiste = correspondants.code ),	''),
isnull((select codep from correspondants where patient.code_dentiste = correspondants.code) ,	''),
isnull((select ville from correspondants where patient.code_dentiste = correspondants.code) ,	''),
isnull((select titre_personnes.nom from titre_personnes, correspondants where patient.code_dentiste = correspondants.code and correspondants.titre = titre_personnes.code ),	''),
'',
'',
'',
'', // ligne 40
'',
'',
'',
'',
'',
'',
'',
'',
'',
'', // ligne 50
'',
'',
'',
'P',
isnull(nom_parent1,''),
'',
isnull(adr1_parent1,''),
isnull(codep_parent1,''),
isnull(ville_parent1,''),
isnull((select nom from titre_personnes where patient.titre_parent1 = titre_personnes.code),'') ,	// ligne 60
'',
'',
'',
'',
'',
'',
'',
'',
'',
'', // ligne 70
'',
'',
'',
'',
'',
'',
'',
'',
'',
'', // ligne 80
'',
'',
'',
'',
''
into 
:ligne_fichier[1],
:ligne_fichier[2],
:ligne_fichier[3],
:ligne_fichier[4],
:ligne_fichier[5],
:ligne_fichier[6],
:ligne_fichier[7],
:ligne_fichier[8],
:ligne_fichier[9],
:ligne_fichier[10],
:ligne_fichier[11],
:ligne_fichier[12],
:ligne_fichier[13],
:ligne_fichier[14],
:ligne_fichier[15],
:ligne_fichier[16],
:ligne_fichier[17],
:ligne_fichier[18],
:ligne_fichier[19],
:ligne_fichier[20],
:ligne_fichier[21],
:ligne_fichier[22],
:ligne_fichier[23],
:ligne_fichier[24],
:ligne_fichier[25],
:ligne_fichier[26],
:ligne_fichier[27],
:ligne_fichier[28],
:ligne_fichier[29],
:ligne_fichier[30],
:ligne_fichier[31],
:ligne_fichier[32],
:ligne_fichier[33],
:ligne_fichier[34],
:ligne_fichier[35],
:ligne_fichier[36],
:ligne_fichier[37],
:ligne_fichier[38],
:ligne_fichier[39],
:ligne_fichier[40],
:ligne_fichier[41],
:ligne_fichier[42],
:ligne_fichier[43],
:ligne_fichier[44],
:ligne_fichier[45],
:ligne_fichier[46],
:ligne_fichier[47],
:ligne_fichier[48],
:ligne_fichier[49],
:ligne_fichier[50],
:ligne_fichier[51],
:ligne_fichier[52],
:ligne_fichier[53],
:ligne_fichier[54],
:ligne_fichier[55],
:ligne_fichier[56],
:ligne_fichier[57],
:ligne_fichier[58],
:ligne_fichier[59],
:ligne_fichier[60],
:ligne_fichier[61],
:ligne_fichier[62],
:ligne_fichier[63],
:ligne_fichier[64],
:ligne_fichier[65],
:ligne_fichier[66],
:ligne_fichier[67],
:ligne_fichier[68],
:ligne_fichier[69],
:ligne_fichier[70],
:ligne_fichier[71],
:ligne_fichier[72],
:ligne_fichier[73],
:ligne_fichier[74],
:ligne_fichier[75],
:ligne_fichier[76],
:ligne_fichier[77],
:ligne_fichier[78],
:ligne_fichier[79],
:ligne_fichier[80],
:ligne_fichier[81],
:ligne_fichier[82],
:ligne_fichier[83],
:ligne_fichier[84],
:ligne_fichier[85]

from patient
where code = :var_code_local ;

// nom de la procédure zérobase à lancer
ligne_fichier[86] = profilestring(dir_ini+inifile_orthokis,"zerobase","procedure_zerobase","")

nom_fichier = profilestring(dir_ini+inifile_orthokis,"zerobase","nom_fichier_generer", Dir_Ini + "orthokis2zb.txt") 

numero_fichier = fileOpen(nom_fichier, LineMode! , Write!, LockReadWrite!, Replace! , EncodingANSI!)

for lig = 1 to upperbound(ligne_fichier)

	fileWrite ( numero_fichier ,  ligne_fichier[lig] )

next

fileClose(numero_fichier)

string commande_a_lancer
//commande_a_lancer = profilestring(dir_ini+inifile_orthokis,"zerobase","commande_a_lancer","XLaunch.exe -run ") + "  "+nom_fichier

//16.04 : on ne passe plus le nom du fichier des data en paramètre .. il est config ailleurs
commande_a_lancer = profilestring(dir_ini+inifile_orthokis,"zerobase","commande_a_lancer","XLaunch.exe -run ") 

if run(commande_a_lancer)  <> 1 then
	Messagebox("ATTENTION","Erreur dans le lancement de la commande : ~n~n"+commande_a_lancer)
end if


end event

event rbuttondown;

// pour accès à la configuration du lien !!!
open(w_zerobase_config)
end event

