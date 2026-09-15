$PBExportHeader$resize_tag.sru
forward
global type resize_tag from resize_fenetre
end type
end forward

global type resize_tag from resize_fenetre
end type
global resize_tag resize_tag

forward prototypes
public function integer elargit (datawindow datawin)
public function integer retaille (window fenetre)
end prototypes

public function integer elargit (datawindow datawin);/////////////////////////////////////////////////////////////////////////////////
///                fonction elargit                                          ////
/////////////////////////////////////////////////////////////////////////////////

//cette fonction prend en paramètre une datawindow qcq
//elle recupère le nom de tous les objets de la datawindow
//si le tag d'un objet est "resize_h" (ne mettre le tag que pour les colonnes que lon veut élargir)
//alors elle élargit la colonne proportionnellement au ratio calculé dans le resize


int taille_colonne[]
int i,j
int longueur_chaine
int nb_char_restant
int nombre_objet
string liste_objets
string nom_objet[]
string nom_colonne[]
string objet_courant
string clause_modify, clause_describe
int size_h


liste_objets = datawin.describe("Datawindow.objects")
	
longueur_chaine = len(liste_objets)
nb_char_restant = longueur_chaine

j=1
i = 1
DO WHILE nb_char_restant > 0
	FOR i = 1 to nb_char_restant
		if asc(liste_objets) = 9 then
			j=j+1
			nb_char_restant = nb_char_restant -1
			liste_objets = right(liste_objets,nb_char_restant)
			exit
		else
			nom_objet[j] = nom_objet[j] + char(liste_objets)
			nb_char_restant = nb_char_restant -1
			liste_objets = right(liste_objets,nb_char_restant)
		end if
	NEXT
LOOP
nombre_objet = j
j=1
FOR i = 1 to nombre_objet 
	nom_objet[i] = trim(nom_objet[i])
	objet_courant = nom_objet[i]+'.tag'
	if datawin.describe(objet_courant) = 'resize_h' then
		nom_colonne[j] = nom_objet[i]
		j = j + 1
		clause_describe = nom_objet[i]+'.width'
		size_h = integer(datawin.describe(clause_describe))
		size_h = int(size_h * ratio)
		clause_modify = nom_objet[i]+'.width'+' = '+string(size_h)
		datawin.modify(clause_modify)
	end if
NEXT
return 1
end function

public function integer retaille (window fenetre);////////////////////////////////////////////////////////////////////////////////////////////////////
// function: retaille
////////////////////////////////////////////////////////////////////////////////////////////////////


// boucle autour de tous les objets mmémorisés par la fonction TAILLE
// et les retaille et les replaces


int rc
dragobject temp
int cnt,i

// recalculate the new ratios and then use the minimum
if ib_exec then  // Check to see if wf_resize_it is already running.
	ratioh = fenetre.height / ii_win_height
	ratiow = fenetre.width / ii_win_width
	ratio = min (ratioh, ratiow)

	ib_exec = false // keep the function from being called recursively
	fenetre.hide()
	
	// resize the window
	fenetre.width = ((  ii_win_width - ii_win_frame_w) * ratio) + ii_win_frame_w
	fenetre.height = ((  ii_win_height - ii_win_frame_h) * ratio) + ii_win_frame_h
	
	// for each control in the list, resize it and it's textsize (as applicable)
	cnt = upperbound(fenetre.control)
	for i = cnt to 1 step -1
		temp = fenetre.control[i]
	//	temp.x		 = size_ctrl[i].x * ratio
	//	temp.width   = size_ctrl[i].width  * ratio
	//	temp.y		 = size_ctrl[i].y * ratio
	//	temp.height  = size_ctrl[i].height * ratio 
		
	
		choose case typeof(temp)
			case richtextedit!
				temp.x		 = size_ctrl[i].x * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.height  = size_ctrl[i].height * ratio 
			case picture!
				temp.x		 = size_ctrl[i].x * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.height  = size_ctrl[i].height * ratio 
			case tab!
				tab vtab
				vtab = temp
				vtab.textsize =  size_ctrl[i].fontsize * ratio
				temp.x		 = size_ctrl[i].x * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.x		 = (fenetre.width - size_ctrl[i].width) / 2
				// -120 correspond à la place occupée par les boutons en bas dans la fenêtre
//				temp.y		 = (fenetre.height - size_ctrl[i].height ) / 2 - 120
				temp.width   = size_ctrl[i].width  * ratio
				temp.height  = size_ctrl[i].height * ratio 
			case commandbutton!
				commandbutton cb
				cb = temp
	//			cb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.width   = size_ctrl[i].width  * ratio
//				temp.height  = size_ctrl[i].height * ratio 

			case singlelineedit!
				singlelineedit sle
				sle = temp
//				sle.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.height  = size_ctrl[i].height * ratio 
			
			case editmask!
				editmask em
				em = temp
//				em.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.height  = size_ctrl[i].height * ratio 
			
			case statictext!
				statictext st
				st = temp
//				st.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.height  = size_ctrl[i].height * ratio 
	
			case datawindow! // datawindows get zoomed
				datawindow dw
				dw = temp
				choose case dw.tag
					case "no resize" 
						temp.x		 = size_ctrl[i].x * ratiow 
					case "zoom"
						temp.x		 = size_ctrl[i].x * ratio
						temp.width   = size_ctrl[i].width  * ratio
						temp.height   = size_ctrl[i].height  * ratio
						dw.Object.DataWindow.zoom = string(int(ratio*100))
					case "grid"
						temp.x		 = size_ctrl[i].x * ratio
						temp.width   = size_ctrl[i].width  * ratio
						elargit(temp)
					case else
						temp.x		 = size_ctrl[i].x * ratio
						temp.width   = size_ctrl[i].width  * ratio
				end choose
				temp.height  = size_ctrl[i].height * ratio 
				temp.y		 = size_ctrl[i].y * ratio
	
			case picturebutton!
				picturebutton pb
				pb = temp
//				pb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
//				temp.height  = size_ctrl[i].height * ratio 
	
			case checkbox!
				checkbox cbx
				cbx = temp
//				cbx.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
	
			case dropdownlistbox!
				dropdownlistbox ddlb
				ddlb = temp
//				ddlb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
	
			case groupbox!
				groupbox gb
				gb = temp
//				gb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
	
			case listbox!
				listbox lb
				lb = temp
//				lb.textsize  =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
	
			case multilineedit!
				multilineedit mle
				mle = temp
//				mle.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
	
			case radiobutton!
				radiobutton rb
				rb = temp
//				rb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratio
				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratio
				temp.height  = size_ctrl[i].height * ratio 
			case userobject!
				temp.x		 = size_ctrl[i].x * ratio
				temp.y		 = size_ctrl[i].y * ratio
//			Case else
//				temp.x		 = size_ctrl[i].x * ratio
//				temp.y		 = size_ctrl[i].y * ratio
		end choose
	next
	
		
	fenetre.Show()
	ib_exec = true
end if
return 1
end function

on resize_tag.create
call super::create
end on

on resize_tag.destroy
call super::destroy
end on

type st_1 from resize_fenetre`st_1 within resize_tag
end type

