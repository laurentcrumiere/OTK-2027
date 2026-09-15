$PBExportHeader$uo_fx_pages_cliniques.sru
forward
global type uo_fx_pages_cliniques from nonvisualobject
end type
end forward

global type uo_fx_pages_cliniques from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine lirepage (ref editmask em, readonly string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly multilineedit mle, ref string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly radiobutton rb, ref string bd_page, integer pos)
public subroutine lirepage (ref checkbox cbx, readonly string bd_page, integer pos)
public subroutine lirepage (ref radiobutton rb, readonly string bd_page, integer pos)
public subroutine ecrirepage (readonly statictext st, ref string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly singlelineedit sle, ref string bd_page, integer pos, integer lg)
public subroutine lirepage (ref statictext st, readonly string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly checkbox cbx, ref string bd_page, integer pos)
public subroutine lirepage (ref singlelineedit sle, readonly string bd_page, integer pos, integer lg)
public subroutine lirepage (ref multilineedit mle, readonly string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly editmask em, ref string bd_page, integer pos, integer lg)
public subroutine lire_pt (ref multilineedit mle, readonly long code_patient)
public subroutine lire_d (ref multilineedit mle, readonly long code_patient)
public subroutine ecrire_d (readonly multilineedit mle, readonly long code_patient)
public subroutine ecrire_pt (readonly multilineedit mle, readonly long code_patient)
public function integer photo_init (readonly window win_cl)
public subroutine lirepage (ref dropdownpicturelistbox ddplb, readonly string bd_page, integer pos, integer lg)
public subroutine lirepage (ref dropdownlistbox ddlb, readonly string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly dropdownlistbox ddlb, ref string bd_page, integer pos, integer lg)
public subroutine ecrirepage (readonly dropdownpicturelistbox ddplb, ref string bd_page, integer pos, integer lg)
private function integer cptnumberofachar (string l_string, character l_char)
public function integer script_init (readonly window win_cl, long starting_char, readonly multilineedit mle_diag, readonly multilineedit mle_plt)
public function integer script_init (readonly window win_cl, long starting_char)
public function integer export_xml (readonly window win_cl)
public function integer ddlb_maquette (readonly window win_cl)
public subroutine reprise (ref string lecture_bd_page, integer old_pos, integer old_lg, ref string ecriture_bd_page, integer new_pos, integer new_lg)
end prototypes

public subroutine lirepage (ref editmask em, readonly string bd_page, integer pos, integer lg);em.text=trim(mid(bd_page,pos,lg))
end subroutine

public subroutine ecrirepage (readonly multilineedit mle, ref string bd_page, integer pos, integer lg);place_avec_blancs(mle.text,bd_page,pos,lg)
end subroutine

public subroutine ecrirepage (readonly radiobutton rb, ref string bd_page, integer pos);if rb.checked then
	place("1",bd_page,pos)
else
	place("0",bd_page,pos)
end if
end subroutine

public subroutine lirepage (ref checkbox cbx, readonly string bd_page, integer pos);if mid(bd_page,pos,1) = "1" then
	cbx.checked=true
else
	cbx.checked=false
end if
end subroutine

public subroutine lirepage (ref radiobutton rb, readonly string bd_page, integer pos);if mid(bd_page,pos,1) = "1" then
	rb.checked=true
else
	rb.checked=false
end if
end subroutine

public subroutine ecrirepage (readonly statictext st, ref string bd_page, integer pos, integer lg);place_avec_blancs(st.text,bd_page,pos,lg)
end subroutine

public subroutine ecrirepage (readonly singlelineedit sle, ref string bd_page, integer pos, integer lg);place_avec_blancs(sle.text,bd_page,pos,lg)
end subroutine

public subroutine lirepage (ref statictext st, readonly string bd_page, integer pos, integer lg);st.text=trim(mid(bd_page,pos,lg))
end subroutine

public subroutine ecrirepage (readonly checkbox cbx, ref string bd_page, integer pos);if cbx.checked then
	place("1",bd_page,pos)
else
	place("0",bd_page,pos)
end if
end subroutine

public subroutine lirepage (ref singlelineedit sle, readonly string bd_page, integer pos, integer lg);sle.text=trim(mid(bd_page,pos,lg))

end subroutine

public subroutine lirepage (ref multilineedit mle, readonly string bd_page, integer pos, integer lg);mle.text=trim(mid(bd_page,pos,lg))
end subroutine

public subroutine ecrirepage (readonly editmask em, ref string bd_page, integer pos, integer lg);place_avec_blancs(em.text,bd_page,pos,lg)
end subroutine

public subroutine lire_pt (ref multilineedit mle, readonly long code_patient);string	pt

SELECT plan_traitement INTO :pt FROM patient WHERE code = :code_patient ;
mle.text = pt

end subroutine

public subroutine lire_d (ref multilineedit mle, readonly long code_patient);string	d

SELECT traitement_effectue INTO :d FROM patient WHERE code = :code_patient ;
mle.text = d
end subroutine

public subroutine ecrire_d (readonly multilineedit mle, readonly long code_patient);string	d

d = mle.text
UPDATE patient SET traitement_effectue = :d WHERE code = :code_patient ;
if SQLCA.Sqlcode <> 0 then
	//son(4)
	rollback ;
	Messagebox("ERREUR BASE DE DONNEES (N°3) : ",SQLCA.SqlErrText)
else
	COMMIT ;
end if
end subroutine

public subroutine ecrire_pt (readonly multilineedit mle, readonly long code_patient);string	pt

pt = mle.text
UPDATE patient SET plan_traitement = :pt WHERE code = :code_patient ;
if SQLCA.Sqlcode <> 0 then
	//son(4)
	rollback ;
	Messagebox("ERREUR BASE DE DONNEES (N°3) : ",SQLCA.SqlErrText)
else
	COMMIT ;
end if

end subroutine

public function integer photo_init (readonly window win_cl);//fx public pour l'aide de la prog des pages cliniques
//cette fx permet remplir chacun des contrôles de type SLE et MLE de leur nombre de
//carac max en gras et rouge
//renvoie tjrs 1 (pas de gestion d'erreur)

long				nb_elem
long				i
long				CouleurText
long				NbrCaracEM
string			classe_name_elem
windowobject	win_obj
object 			type_obj
SingleLineEdit	sle
MultiLineEdit	mle
EditMask			em


//init des vars
CouleurText = RGB(255,0,0)

//on chope le nbr d'elèm de la fenêtre
nb_elem = upperbound(win_cl.Control)

//on attaque la boucle sur les diverses contrôles de la fenêtre
for i = 1 to nb_elem
	win_obj = win_cl.Control[i]	//récup l'obj
	type_obj = win_obj.typeof()	//récup le type de l'objet (sle, mle ....)
	CHOOSE CASE type_obj				//traitement selon le type
		CASE SingleLineEdit!
			sle = win_obj
			sle.textcolor = CouleurText
			sle.text = string(sle.limit)
		CASE MultiLineEdit!
			mle = win_obj
			mle.textcolor = CouleurText
			mle.text = string(mle.limit)
		CASE EditMask!
			em = win_obj
			//on ne s'occupe que des StringMask ou NumericMask
			if (em.maskdatatype = StringMask!) OR (em.maskdatatype = NumericMask!) then
				em.textcolor = CouleurText
				NbrCaracEM = CptNumberOfAChar(em.mask, '#')					//pour les NUMBER
				NbrCaracEM = NbrCaracEM + CptNumberOfAChar(em.mask, 'a')	//pour les ALPHANUM
				NbrCaracEM = NbrCaracEM + CptNumberOfAChar(em.mask, 'x')	//pour les ANY CHARAC
				em.text = string(NbrCaracEM)
			end if
	end choose
next

//pas de gestion d'erreur complète
return 1
end function

public subroutine lirepage (ref dropdownpicturelistbox ddplb, readonly string bd_page, integer pos, integer lg);ddplb.selectitem(integer(mid(bd_page,pos,lg)))
end subroutine

public subroutine lirepage (ref dropdownlistbox ddlb, readonly string bd_page, integer pos, integer lg);ddlb.selectitem(integer(mid(bd_page,pos,lg)))
end subroutine

public subroutine ecrirepage (readonly dropdownlistbox ddlb, ref string bd_page, integer pos, integer lg);//place(string(ddlb.FindItem(ddlb.text,0)),bd_page,pos)
place_avec_blancs(string(ddlb.FindItem(ddlb.text,0)),bd_page,pos,lg)
end subroutine

public subroutine ecrirepage (readonly dropdownpicturelistbox ddplb, ref string bd_page, integer pos, integer lg);place_avec_blancs(string(ddplb.FindItem(ddplb.text,0)),bd_page,pos,lg)
end subroutine

private function integer cptnumberofachar (string l_string, character l_char);//CptNumberOfAChar
//fx qui va comptabiliser le nombre de caractère d'un type l_char
//ds une string passée en param
//return le nombre trouvé
//0 sinon

long	NbrTotCarac, i
int	NbrCaracReturn


//init des vars
NbrTotCarac		= len(l_string)

if NbrTotCarac = 0 then return NbrTotCarac	//évite des erreurs

For i = 1 to NbrTotCarac	//passe en revue toute la string en param
	//on en rajoute 1
	if mid(l_string, i, 1) = l_char then NbrCaracReturn++
Next

return NbrCaracReturn
end function

public function integer script_init (readonly window win_cl, long starting_char, readonly multilineedit mle_diag, readonly multilineedit mle_plt);//fx public pour l'aide de la prog des pages cliniques
//cette fx permet de générer sur le bureau windows un fichier text "Init_xxxxxx.txt"
//ou "xxxxxx" est le nom du Dr. et le N° de sa page clinique.
//Dans ce fichier il y le scrip à recopier ds la fx "Init" de la page clinique en question
//renvoie 1

constant	string	emplacement = "C:\"
constant	string	prefixe_nom_fichier = "Init_"
constant	string	prefixe_classe_name_page = "w_diagnos_maj_"
constant	string	ligne_1 = "f.lirepage("
constant	string	ligne_2 = ",page_buffer[1],"
constant	string	ligne_3 = ","
constant	string	ligne_4 = ")"
constant	string	ligne_1_diag = "f.lire_d("
constant	string	ligne_1_plt = "f.lire_pt("
constant	string	id_patient = "var_code_local"

long			nb_elem
long			i
long			len_string,len_string2
string		nom_fichier
string		ligne_pour_fichier
int			id_fichier
int			limit_carac
int			type_pour_traitement	// si 1 alors sle,mle,em,ddlb,ddplb
											// si 2 alors rb,cb
											// si 3 alors mle pour diag à relier
											// si 4 alors mle pour plt à relier
string						classe_name_elem
windowobject				win_obj
object 						type_obj
SingleLineEdit				sle
MultiLineEdit				mle
EditMask						em
Checkbox						cb
RadioButton					rb
DropDownListBox			ddlb
DropDownPictureListBox	ddplb
boolean						continuer


//recup le nom de la fenètre
nom_fichier = win_cl.Classname()

//recup le nom du doc et le N° de la page
len_string = len(nom_fichier)
len_string2 = len(prefixe_classe_name_page)
nom_fichier = right(nom_fichier, len_string - len_string2)

//construction du nom complet (avec le chemin)
nom_fichier = emplacement + prefixe_nom_fichier + nom_fichier + ".txt"

//ouvre un fichier en mode ecriture sur le bureau (remplace le fichier s'il existe déjà)
id_fichier = FileOpen(nom_fichier, LineMode!, Write!, LockReadWrite!, Replace!)

//on chope le nbr d'elèm de la fenêtre
nb_elem = upperbound(win_cl.Control)

//on attaque la boucle sur les diverses contrôles de la fenêtre
for i = 1 to nb_elem
	//init du boolean pour traitement ultérieur
	continuer = false
	
	//récup l'obj
	win_obj = win_cl.Control[i]
	
	//récup le type de l'objet (sle, mle ....)
	type_obj = win_obj.typeof()
	
	//pré-traitement selon le type
	CHOOSE CASE type_obj
		CASE SingleLineEdit!
			sle = win_obj
			classe_name_elem = sle.classname()
			limit_carac = sle.limit
			type_pour_traitement = 1
			continuer = true
			
		CASE MultiLineEdit!
			mle = win_obj
			classe_name_elem = mle.classname()
			//vérif si une mle standard ou si diag ou plt
			choose case mle
				case mle_diag
					type_pour_traitement = 3
				case mle_plt
					type_pour_traitement = 4
				case else
					limit_carac = mle.limit
					type_pour_traitement = 1
			end choose
			continuer = true
			
		CASE EditMask!
			em = win_obj
			classe_name_elem = em.classname()
			limit_carac = len(em.mask)
			type_pour_traitement = 1
			continuer = true
		
		case DropDownListBox!
			ddlb = win_obj
			classe_name_elem = ddlb.classname()
			limit_carac = int(len(string(ddlb.TotalItems())))
			type_pour_traitement = 1
			continuer = true
			
		case DropDownPictureListBox!
			ddplb = win_obj
			classe_name_elem = ddplb.classname()
			limit_carac = int(len(string(ddplb.TotalItems())))
			type_pour_traitement = 1
			continuer = true
			
		Case Checkbox!
			cb = win_obj
			classe_name_elem = cb.classname()
			type_pour_traitement = 2
			continuer = true
			
		case RadioButton!
			rb = win_obj
			classe_name_elem = rb.classname()
			type_pour_traitement = 2
			continuer = true
			
	end choose
	
	//test su le booléen
	if continuer then
		//traitement selon la var "type_pour_traitement"
		//pour construction de la ligne à écrire ds le fichier
		choose case type_pour_traitement
			case 1	//style mle,em,sle,ddlb,ddplb sur 2 chiffres ou plus
				if limit_carac > 0 then
					ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_2 + string(starting_char) + ligne_3 + string(limit_carac) + ligne_4
					starting_char = starting_char + long(limit_carac)
				else	//pour indiquer qu'il y un pb de limit non remplie
					ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_3 + "****************" + ligne_4
				end if
				
			case 2	//style rb,cb,ddlb sur 1 chiffre
				ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_2 + string(starting_char) + ligne_4
				starting_char = starting_char + 1
				
			case 3	//mle pour diag relié
				ligne_pour_fichier = ligne_1_diag + classe_name_elem + ligne_3 + id_patient + ligne_4
				
			case 4	//mle pour plt relié
				ligne_pour_fichier = ligne_1_plt + classe_name_elem + ligne_3 + id_patient + ligne_4
				
		end choose
		
		//on écrit la ligne ds le fichier
		FileWrite(id_fichier,ligne_pour_fichier)
	end if
	
next

//on écrit une dernière ligne avec le nbr total de caractères
//utilisée par cette page clinique
ligne_pour_fichier = "// max carac = " + string(starting_char)
FileWrite(id_fichier,ligne_pour_fichier)

//ferme le fichier text et envoie un message à l'utilisateur
if FileClose(id_fichier) <> 1 then
	messagebox("ATTENTION", "Pb lors de la fermeture du fichier text")
else
	messagebox("INFORMATION", "Opération terminée avec succés !")
end if

//pas de gestion d'erreur complète
return 1
end function

public function integer script_init (readonly window win_cl, long starting_char);//fx public pour l'aide de la prog des pages cliniques
//cette fx permet de générer sur le bureau windows un fichier text "Init_xxxxxx.txt"
//ou "xxxxxx" est le nom du Dr. et le N° de sa page clinique.
//Dans ce fichier il y le scrip à recopier ds la fx "Init" de la page clinique en question
//renvoie 1

constant	string	emplacement = "C:\"
constant	string	prefixe_nom_fichier = "Init_"
constant	string	prefixe_classe_name_page = "w_diagnos_maj_"
constant	string	ligne_1 = "f.lirepage("
constant	string	ligne_2 = ",page_buffer[1],"
constant	string	ligne_3 = ","
constant	string	ligne_4 = ")"

long			nb_elem
long			i
long			len_string,len_string2
string		nom_fichier
string		ligne_pour_fichier
int			id_fichier
int			limit_carac
int			type_pour_traitement	// 1 : sle,mle,em,ddlb,ddplb
											// 2 : rb,cb
string						classe_name_elem
windowobject				win_obj
object 						type_obj
SingleLineEdit				sle
MultiLineEdit				mle
EditMask						em
Checkbox						cb
RadioButton					rb
DropDownListBox			ddlb
DropDownPictureListBox	ddplb
boolean						continuer


//recup le nom de la fenètre
nom_fichier = win_cl.Classname()

//recup le nom du doc et le N° de la page
len_string = len(nom_fichier)
len_string2 = len(prefixe_classe_name_page)
nom_fichier = right(nom_fichier, len_string - len_string2)

//construction du nom complet (avec le chemin)
nom_fichier = emplacement + prefixe_nom_fichier + nom_fichier + ".txt"

//ouvre un fichier en mode ecriture sur le bureau (remplace le fichier s'il existe déjà)
id_fichier = FileOpen(nom_fichier, LineMode!, Write!, LockReadWrite!, Replace!)

//on chope le nbr d'elèm de la fenêtre
nb_elem = upperbound(win_cl.Control)

//on attaque la boucle sur les diverses contrôles de la fenêtre
for i = 1 to nb_elem
	//init du boolean pour traitement ultérieur
	continuer = false
	
	//récup l'obj
	win_obj = win_cl.Control[i]
	
	//récup le type de l'objet (sle, mle ....)
	type_obj = win_obj.typeof()
	
	//pré-traitement selon le type
	CHOOSE CASE type_obj
		CASE SingleLineEdit!
			sle = win_obj
			classe_name_elem = sle.classname()
			limit_carac = sle.limit
			type_pour_traitement = 1
			continuer = true
			
		CASE MultiLineEdit!
			mle = win_obj
			classe_name_elem = mle.classname()
			limit_carac = mle.limit
			type_pour_traitement = 1
			continuer = true
			
		CASE EditMask!
			em = win_obj
			classe_name_elem = em.classname()
			limit_carac = len(em.mask)
			type_pour_traitement = 1
			continuer = true
		
		case DropDownListBox!
			ddlb = win_obj
			classe_name_elem = ddlb.classname()
			limit_carac = int(len(string(ddlb.TotalItems())))
			type_pour_traitement = 1
			continuer = true
			
		case DropDownPictureListBox!
			ddplb = win_obj
			classe_name_elem = ddplb.classname()
			limit_carac = int(len(string(ddplb.TotalItems())))
			type_pour_traitement = 1
			continuer = true
			
		Case Checkbox!
			cb = win_obj
			classe_name_elem = cb.classname()
			type_pour_traitement = 2
			continuer = true
			
		case RadioButton!
			rb = win_obj
			classe_name_elem = rb.classname()
			type_pour_traitement = 2
			continuer = true
			
	end choose
	
	//test sur le booléen
	if continuer then
		//traitement selon la var "type_pour_traitement"
		//pour construction de la ligne à écrire ds le fichier
		choose case type_pour_traitement
			case 1	//style mle,em,sle,ddlb,ddplb sur 2 chiffres ou plus
				if limit_carac > 0 then
					ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_2 + string(starting_char) + ligne_3 + string(limit_carac) + ligne_4
					starting_char = starting_char + long(limit_carac)
				else	//pour indiquer qu'il y un pb de limit non remplie
					ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_3 + "****************" + ligne_4
				end if
				
			case 2	//style rb,cb,ddlb sur 1 chiffre
				ligne_pour_fichier = ligne_1 + classe_name_elem + ligne_2 + string(starting_char) + ligne_4
				starting_char = starting_char + 1
				
		end choose
		
		//on écrit la ligne ds le fichier
		FileWrite(id_fichier,ligne_pour_fichier)
	end if
	
next

//on écrit une dernière ligne avec le nbr total de caractères
//utilisée par cette page clinique
ligne_pour_fichier = "// max carac = " + string(starting_char)
FileWrite(id_fichier,ligne_pour_fichier)

//ferme le fichier text et envoie un message à l'utilisateur
if FileClose(id_fichier) <> 1 then
	messagebox("ATTENTION", "Pb lors de la fermeture du fichier text")
else
	messagebox("INFORMATION", "Opération terminée avec succés !")
end if

//pas de gestion d'erreur complète
return 1
end function

public function integer export_xml (readonly window win_cl);// exporte sous format  XML la page clinique passée en param
// pour orthokis JAVA
// return 1 si ok
//		-1 si pb

constant	string	emplacement = "C:\"

int			return_val = -1
long		nb_elem
long		i
string		nom_fichier
string		ligne_text
int			id_fichier
boolean	ecrire = true
windowobject			win_obj
object 					type_obj
SingleLineEdit		sle
//statictext				st
MultiLineEdit			mle
//EditMask			em
Checkbox			cb
//RadioButton			rb
//DropDownListBox	ddlb
//DropDownPictureListBox	ddplb


// path du fichier d'export XML
//nom_fichier = win_cl.Classname()
//nom_fichier = emplacement + nom_fichier + ".txt"
nom_fichier = emplacement + "TestClinique.xml"

// init du fichier d'export XML
id_fichier = FileOpen(nom_fichier, LineMode!, Write!, LockReadWrite!, Replace!)
FileWrite(id_fichier, "<?xml>")
FileWrite(id_fichier, "<titre >Page Clinique n°</titre>")
FileWrite(id_fichier, "<page >" + left(win_cl.Classname(), 1) + "</page>")
FileWrite(id_fichier, "")

nb_elem = upperbound( win_cl.Control )
for i = 1 to nb_elem
// boucle sur les diverses contrôles de la fenêtre	
	// recup de l'obj pour convertion de type
	win_obj = win_cl.Control[i]
	type_obj = win_obj.typeof()
	
	CHOOSE CASE type_obj
//		CASE StaticText!
//			st = win_obj
//			
		CASE SingleLineEdit!
			sle = win_obj
			ligne_text	= '<zoneSaisie name="' + sle.classname() + '" valeur="" cible=""'
			ligne_text	+= ' coordSaisieX="' + string(UnitsToPixels(sle.x, XUnitsToPixels!)) + '"'
			ligne_text	+= ' coordSaisieY="' +  string(UnitsToPixels(sle.y, YUnitsToPixels!)) + '"'
			ligne_text	+= ' tailleSaisieX="' +  string(UnitsToPixels(sle.width, XUnitsToPixels!)) + '"'
			ligne_text	+= ' tailleSaisieY="' +  string(UnitsToPixels(sle.height, YUnitsToPixels!)) + '"'
			ligne_text	+= ' font="' + sle.facename + '"'
			ligne_text	+= ' size="' +  string( sle.textsize ) + '"'
			ligne_text	+= ' style="aucun"'
			ligne_text	+= ' textColor="0"'
			ligne_text	+= ' bgColor="16777215"'
			ligne_text	+= ' visible="true"'
			ligne_text	+= '></zoneSaisie>'
			
		CASE MultiLineEdit!
			mle = win_obj
			ligne_text	= '<TextArea name="' + mle.classname() + '" valeur="" cible=""'
			ligne_text	+= ' coordSaisieX="' + string(UnitsToPixels(mle.x, XUnitsToPixels!)) + '"'
			ligne_text	+= ' coordSaisieY="' +  string(UnitsToPixels(mle.y, YUnitsToPixels!)) + '"'
			ligne_text	+= ' tailleSaisieX="' +  string(UnitsToPixels(mle.width, XUnitsToPixels!)) + '"'
			ligne_text	+= ' tailleSaisieY="' +  string(UnitsToPixels(mle.height, YUnitsToPixels!)) + '"'
			ligne_text	+= ' colonnes="5" lignes="30" scrollbar="1"'
			ligne_text	+= ' font="' + mle.facename + '"'
			ligne_text	+= ' size="' +  string( mle.textsize ) + '"'
			ligne_text	+= ' style="aucun"'
			ligne_text	+= ' textColor="0"'
			ligne_text	+= ' bgColor="16777215"'
			ligne_text	+= ' visible="true"'
			ligne_text	+= '></TextArea>'
			
//		CASE EditMask!
//			em = win_obj
//		case DropDownListBox!
//			ddlb = win_obj
//		case DropDownPictureListBox!
//			ddplb = win_obj
//		Case Checkbox!
//			cb = win_obj
//			ligne_text	= '<TextArea name="' + cb.classname() + '" valeur="" cible=""'
//			ligne_text	+= ' coordSaisieX="' + string(UnitsToPixels(cb.x, XUnitsToPixels!)) + '"'
//			ligne_text	+= ' coordSaisieY="' +  string(UnitsToPixels(cb.y, YUnitsToPixels!)) + '"'
//			ligne_text	+= ' tailleSaisieX="' +  string(UnitsToPixels(cb.width, XUnitsToPixels!)) + '"'
//			ligne_text	+= ' tailleSaisieY="' +  string(UnitsToPixels(cb.height, YUnitsToPixels!)) + '"'
//			ligne_text	+= ' font="' + cb.facename + '"'
//			ligne_text	+= ' size="' +  string( cb.textsize ) + '"'
//			ligne_text	+= ' style="aucun"'
//			ligne_text	+= ' textColor="0"'
//			ligne_text	+= ' bgColor="16777215"'
//			ligne_text	+= ' visible="true"'
//			ligne_text	+= '></TextArea>'
//			
//		case RadioButton!
//			rb = win_obj
		CASE else
			ecrire = false
	end choose
	
	if ecrire then
		FileWrite(id_fichier,ligne_text)
	else
		ecrire = true
	end if
next

if FileClose(id_fichier) <> 1 then
	messagebox("ATTENTION", "Pb lors de la fermeture du fichier text")
else
	messagebox("INFORMATION", "Opération terminée avec succés !")
	return_val = 1
end if

return return_val

end function

public function integer ddlb_maquette (readonly window win_cl);//fx public pour l'aide à la maquette des pages cliniques
//cette fx permet de générer sur le bureau windows un fichier text "ddlb_maquette_xxxxxx.txt"
//ou "xxxxxx" est le nom du Dr. et le N° de sa page clinique.


constant	string	emplacement = "C:\"
constant	string	prefixe_nom_fichier = "ddlb_maquette_"
constant	string	prefixe_classe_name_page = "w_diagnos_maj_"
constant	string	une_tab = "	"

long			nb_elem, nb_item
long			i, j
long			len_string, len_string2
string		nom_fichier
string		ligne_pour_fichier
int			id_fichier
boolean		continuer

windowobject				win_obj
object 						type_obj
DropDownListBox			ddlb
DropDownPictureListBox	ddplb


//recup le nom de la fenètre
nom_fichier = win_cl.Classname()

//recup le nom du doc et le N° de la page
len_string = len(nom_fichier)
len_string2 = len(prefixe_classe_name_page)
nom_fichier = right(nom_fichier, len_string - len_string2)

//construction du nom complet (avec le chemin)
nom_fichier = emplacement + prefixe_nom_fichier + nom_fichier + ".txt"

//ouvre un fichier en mode ecriture sur le bureau (remplace le fichier s'il existe déjà)
id_fichier = FileOpen(nom_fichier, LineMode!, Write!, LockReadWrite!, Replace!)

//on chope le nbr d'elèm de la fenêtre
nb_elem = upperbound(win_cl.Control)

//on attaque la boucle sur les diverses contrôles de la fenêtre
for i = 1 to nb_elem
	
	//récup l'obj
	win_obj = win_cl.Control[i]
	
	//récup le type de l'objet (sle, mle ....)
	type_obj = win_obj.typeof()
	
	CHOOSE CASE type_obj

		case DropDownListBox!
		// c une ddlb
			ddlb = win_obj
			continuer = true
			
			// init la ligne à inscrire ds fichier
			ligne_pour_fichier = ddlb.tag
			
			// recup du nbr total d'item
			nb_item = upperbound(ddlb.item)
			
			for j = 1 to nb_item
			// pour chacun des item d'une ddlb
				if trim(ddlb.item[j]) <> "" then
				// si chaine NON vide après un trim()
					// on rajoute à la ligne à inscrire
					ligne_pour_fichier += une_tab + trim(ddlb.item[j])
				end if
			next
			
		case DropDownPictureListBox!
		// c une ddlb
			ddPlb = win_obj
			continuer = true
			
			// init la ligne à inscrire ds fichier
			ligne_pour_fichier = ddPlb.tag
			
			// recup du nbr total d'item
			nb_item = upperbound(ddPlb.item)
			
			for j = 1 to nb_item
			// pour chacun des item d'une ddlb
				if trim(ddPlb.item[j]) <> "" then
				// si chaine NON vide après un trim()
					// on rajoute à la ligne à inscrire
					ligne_pour_fichier += une_tab + trim(ddPlb.item[j])
				end if
			next
			
		case else
		// un autre type de contrôle
			continuer = false
	end choose
	
	// si on continue ->	c pour écrire la ligne ds le fichier
	if continuer then FileWrite(id_fichier,ligne_pour_fichier)
	
next

//ferme le fichier text et envoie un message à l'utilisateur
if FileClose(id_fichier) <> 1 then
	messagebox("ATTENTION", "Pb lors de la fermeture du fichier text")
else
	messagebox("INFORMATION", "Opération terminée avec succés !")
end if

//pas de gestion d'erreur complète
return 1
end function

public subroutine reprise (ref string lecture_bd_page, integer old_pos, integer old_lg, ref string ecriture_bd_page, integer new_pos, integer new_lg);//// fx de reprise de champ
//// la fx travail sur les 2 buffers de page celui de lecture et celui de la sauvegarde
//// ex d'utilisation : un champ 5 carac doit passer à 30 carac
//// --> à utiliser ds le open de la fenetre suivi d'une sauvegarde forcée des données
//// --> ensuite il faut changer ds les fx load et unload les nouvelles positions et les nouvelles longueurs de zone
//
//string new_text, old_text
//
//new_text = trim(mid(lecture_bd_page,new_pos,new_lg))
//
//if not len(new_text) > 0 then
//	// rien ds la nouvelle plage de valeur
//	// -> on essaye de voir ds l'ancienne zone
//	old_text = trim(mid(lecture_bd_page,old_pos,old_lg))
//	if len(old_text) > 0 then
//		// il y a des données
//		// on les reprend ds nouvelle espace
//		place_avec_blancs(old_text,new_bd_page,new_pos,new_lg)
//		// puis on vierge l'espace d'origine
//		place_avec_blancs('',old_bd_page,old_pos,old_lg)
//	end if
//end if
//
end subroutine

on uo_fx_pages_cliniques.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_fx_pages_cliniques.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

