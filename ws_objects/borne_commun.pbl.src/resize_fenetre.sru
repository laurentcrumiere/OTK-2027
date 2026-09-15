$PBExportHeader$resize_fenetre.sru
$PBExportComments$Redimensionnement des fenêtres
forward
global type resize_fenetre from userobject
end type
type st_1 from statictext within resize_fenetre
end type
end forward

global type resize_fenetre from userobject
integer width = 946
integer height = 356
boolean border = true
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
st_1 st_1
end type
global resize_fenetre resize_fenetre

type variables
// Spécial RESIZING
int ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h
str_size size_ctrl []

boolean ib_exec = true
double ratiow, ratio, ratioh


end variables

forward prototypes
public function integer taille (window fenetre)
public function integer retaille (window fenetre)
public subroutine tous_invisibles (window fenetre)
end prototypes

public function integer taille (window fenetre);////////////////////////////////////////////////////////////////////////////////////////////////////
// function: taille
////////////////////////////////////////////////////////////////////////////////////////////////////

// Mémorise la taille original de la fenêtre et de ses objets

// NOTE !!!! fenetre process does not work on objects that are not descended
// from the dragobject class.

dragobject temp
int cnt,i
ii_win_width  = fenetre.width
ii_win_height = fenetre.height
ii_win_frame_w = fenetre.width - fenetre.WorkSpaceWidth()
ii_win_frame_h = fenetre.height - fenetre.WorkSpaceHeight()

cnt = upperbound(fenetre.control)
for i = cnt to 1 step -1
	temp = fenetre.control[i]
	
	// everything has a x,y,width and height
	size_ctrl[i].x = temp.x 
	size_ctrl[i].width = temp.width 
	size_ctrl[i].y = temp.y
	size_ctrl[i].height = temp.height 

	// now go get text size information
	choose case typeof(temp)
		case picture!
		// On ne mémorise rien de plus
		case tab!
			tab vtab
			vtab = temp
			size_ctrl[i].fontsize = vtab.textsize 
			if vtab.backcolor = couleur_sky then
				vtab.backcolor = couleur_fond_fenetre
			end if

		case datawindow!
			// pour la coloration de la datawindow 
			colore_datawindow(temp)

		case commandbutton!
			commandbutton cb
			cb = temp
			size_ctrl[i].fontsize = cb.textsize 
			
		case singlelineedit!
			singlelineedit sle
			sle = temp
			size_ctrl[i].fontsize = sle.textsize 
			if sle.backcolor = couleur_sky then
				sle.backcolor = couleur_fond_fenetre
			end if

		case editmask!
			editmask em
			em = temp
			size_ctrl[i].fontsize  	=	em.textsize 
			if em.backcolor = couleur_sky then
				em.backcolor = couleur_fond_fenetre
			end if

		case statictext!
			statictext st
			st = temp
			size_ctrl[i].fontsize  	=	st.textsize 
			if st.backcolor = couleur_sky then
				st.backcolor = couleur_fond_fenetre
			end if
	
		case picturebutton!
			picturebutton pb
			pb = temp
			size_ctrl[i].fontsize = pb.textsize 

		case checkbox!
			checkbox cbx
			cbx = temp
			size_ctrl[i].fontsize  	=	cbx.textsize 
			if cbx.backcolor = couleur_sky then
				cbx.backcolor = couleur_fond_fenetre
			end if

		case dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = temp
			size_ctrl[i].fontsize  	=	ddlb.textsize 

		case groupbox!
			groupbox gb
			gb = temp
			size_ctrl[i].fontsize  	=	gb.textsize 
			if gb.backcolor = couleur_sky then
				gb.backcolor = couleur_fond_fenetre
			end if

		case listbox!
			listbox lb
			lb = temp
			size_ctrl[i].fontsize  	=	lb.textsize 

		case datepicker!
			datepicker dpk
			dpk = temp
			size_ctrl[i].fontsize  	=	dpk.textsize 

		case multilineedit!
			multilineedit mle
			mle = temp
			size_ctrl[i].fontsize  	=	mle.textsize 
			if mle.backcolor = couleur_sky then
				mle.backcolor = couleur_fond_fenetre
			end if
			
		case radiobutton!
			radiobutton rb
			rb = temp
			size_ctrl[i].fontsize  	=	rb.textsize 
			if rb.backcolor = couleur_sky then
				rb.backcolor = couleur_fond_fenetre
			end if
			
			
	end choose
next


// couleur de fond de la fenêtre
this.backcolor = couleur_fond_fenetre


return 1
end function

public function integer retaille (window fenetre);////////////////////////////////////////////////////////////////////////////////////////////////////
// function: retaille
////////////////////////////////////////////////////////////////////////////////////////////////////

//fenetre.setredraw(false)

zeroi(ii_win_height)
zeroi(ii_win_width)

if ii_win_height = 0 or ii_win_width = 0 then
	//MessageBox("ERREUR","Erreur dans le redimensionnement de la fenêtre !~n~nVeuillez la fermer et la rouvrir pour réessayer.")
	ii_win_height = 2192
	ii_win_width = 4206 
end if


// boucle autour de tous les objets mmémorisés par la fonction TAILLE
// et les retaille et les replaces


int rc
dragobject temp
int cnt,i

// recalculate the new ratios and then use the minimum
if ib_exec then  // Check to see if wf_resize_it is already running.
	ratioh = (fenetre.height) / ii_win_height
	ratiow = (fenetre.width) / ii_win_width
	
	//Messagebox("trace",string(ratioh)+"~n~n"+string(ii_win_height)+"~n~n"+string(fenetre.height))
	ratio = min (ratioh, ratiow)





	ib_exec = false // keep the function from being called recursively
	fenetre.hide()
	
	// resize the window
	
//	if fenetre.WindowState = Maximized! then
//		// pas de redimensionnement
//	else
//		fenetre.width = ((  ii_win_width - ii_win_frame_w) * ratiow) + ii_win_frame_w
//		fenetre.height = ((  ii_win_height - ii_win_frame_h) * ratioh) + ii_win_frame_h
//	end if
	
	// for each control in the list, resize it and it's textsize (as applicable)

	// On teste le min des 2 car plantage de redim sur certaines machines plus lentes en 01/2008 (chez cotton) !!
	cnt = min( upperbound(fenetre.control) , upperbound(size_ctrl))
	
	
	for i = cnt to 1 step -1
		temp = fenetre.control[i]
	//	temp.x		 = size_ctrl[i].x * ratio
	//	temp.width   = size_ctrl[i].width  * ratio
	//	temp.y		 = size_ctrl[i].y * ratio
	//	temp.height  = size_ctrl[i].height * ratio 
		

		choose case typeof(temp)
			case richtextedit!
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
				temp.width   = size_ctrl[i].width  * ratiow
				temp.height  = size_ctrl[i].height * ratioh 
				
				
				
			case picture!
				picture vpicture
				vpicture = temp
				
				if temp.tag = "fond" then
					// c'est l'image de fond
					placer_image_fond(fenetre, vpicture, image_fond_fenetre)
				else
					temp.x		 = size_ctrl[i].x * ratiow
					temp.y		 = size_ctrl[i].y * ratioh
					if not pos (temp.tag , "no resizeall" ) > 0  then
						temp.width   = size_ctrl[i].width  * ratiow
						temp.height  = size_ctrl[i].height * ratioh 
					end if
				end if
				
				
			case tab!
				tab vtab
				vtab = temp
				vtab.textsize =  size_ctrl[i].fontsize * ratio
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
//				temp.x		 = (fenetre.width - size_ctrl[i].width) / 2
				// -120 correspond à la place occupée par les boutons en bas dans la fenêtre
//				temp.y		 = (fenetre.height - size_ctrl[i].height ) / 2 - 120
				if pos (temp.tag , "no resizeall" ) > 0 or  pos (temp.tag , "no resize all" ) > 0 then
					// pas de resize du tout du tout
				else
					temp.width   = size_ctrl[i].width  * ratiow
					temp.height  = size_ctrl[i].height * ratioh 
				end if

			case commandbutton!
				commandbutton cb
				cb = temp
	//			cb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
//				temp.width   = size_ctrl[i].width  * ratio
//				temp.height  = size_ctrl[i].height * ratio 


				// Cas particulier des boutons ui_v2020
				temp.width   = size_ctrl[i].width  * min(ratiow,1.2)
				


			case singlelineedit!
				singlelineedit sle
				sle = temp
//				sle.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratioh
//				temp.height  = size_ctrl[i].height * ratio 


			case datepicker!
				datepicker dpk
				dpk = temp
//				sle.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratioh
//				temp.height  = size_ctrl[i].height * ratio 
			
			case editmask!
				editmask em
				em = temp
				if pos (temp.tag , "no resizeall" ) > 0 or  pos (temp.tag , "no resize all" ) > 0 then
					// pas de resize du tout du tout
				else
					temp.x		 = size_ctrl[i].x * ratiow
					temp.y		 = size_ctrl[i].y * ratioh
				end if
			case statictext!
				statictext st
				st = temp
				if pos (temp.tag , "no resizeall" ) > 0 or  pos (temp.tag , "no resize all" ) > 0 then
					// pas de resize du tout du tout
				else
					temp.x		 = size_ctrl[i].x * ratiow
					temp.y		 = size_ctrl[i].y * ratioh
				end if
				
				
			case datawindow! // datawindows get zoomed
				datawindow dw
				dw = temp

				// Etude des mot clef 
				// no resize : on ne la redimenssionne pas ... on la dépacle juste en largeur
				// centrer : on ne la redimmenssionne pas ... on la centre en horizotal à l'cran

				if pos (temp.tag , "centrer" ) > 0 then
						temp.x		 =  ( fenetre.width - size_ctrl[i].width  ) / 2
				else
						temp.x		 = size_ctrl[i].x * ratiow
				end if

				
				
				if pos (temp.tag , "no resizeall" ) > 0 or  pos (temp.tag , "no resize all" ) > 0 then
					// pas de resize du tout du tout
				else
					if pos (temp.tag , "position" ) > 0 then
						//on ne modifie que la position de la dw .. pas la taille
						temp.x		 = size_ctrl[i].x * ratiow
					else
						if pos (temp.tag , "no resize" ) > 0 then
							// pas de redimenssionnement en largeur
						else
							temp.x		 = size_ctrl[i].x * ratiow
							temp.width   = size_ctrl[i].width  * ratiow
						end if
						// Hauteur
						temp.height  = size_ctrl[i].height * ratioh 
					end if
				end if

				// verticalité
				temp.y		 = size_ctrl[i].y * ratioh
	
			case picturebutton!
				
				picturebutton pb
				pb = temp
//				pb.textsize =  size_ctrl[i].fontsize * ratio
				temp.x		 = size_ctrl[i].x * ratiow
//				temp.width   = size_ctrl[i].width  * ratio
				temp.y		 = size_ctrl[i].y * ratioh
//				temp.height  = size_ctrl[i].height * ratio 
	
			case checkbox!
				checkbox cbx
				cbx = temp
//				cbx.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
				
				if pos (temp.tag , "no resize all" ) > 0 then
					// pas de redimenssionnement en largeur ni en hauteur
				else
					temp.width   = size_ctrl[i].width  * ratiow
					temp.height  = size_ctrl[i].height * ratioh 
				end if
				
				
	
			case dropdownlistbox!
				dropdownlistbox ddlb
				ddlb = temp
				//ddlb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
				if ratiow > 1 then      // sinon c'est trop large !!!!
					temp.width   = size_ctrl[i].width  * ratiow * 0.8
				else
					temp.width   = size_ctrl[i].width  * ratiow 
				end if
				temp.y		 = size_ctrl[i].y * ratioh
				temp.height  = size_ctrl[i].height * ratioh
	
			case groupbox!
				groupbox gb
				gb = temp
//				gb.textsize =  size_ctrl[i].fontsize * ratio 

				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
				
				if pos( temp.tag , "no resize" ) > 0 then
					// on ne fait rien !!
				else
					temp.width   = size_ctrl[i].width  * ratiow
					temp.height  = size_ctrl[i].height * ratioh
				end if	
			case listbox!
				listbox lb
				lb = temp
//				lb.textsize  =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
				temp.width   = size_ctrl[i].width  * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
				temp.height  = size_ctrl[i].height * ratioh
	
			case multilineedit!
				multilineedit mle
				mle = temp
//				mle.textsize =  size_ctrl[i].fontsize * ratio 
				if pos (temp.tag , "no resize" ) > 0 then
					// pas de resize en largeur
				else
					temp.width   = size_ctrl[i].width  * ratiow
				end if
				
				temp.height  = size_ctrl[i].height * ratioh 
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
	
			case radiobutton!
				radiobutton rb
				rb = temp
//				rb.textsize =  size_ctrl[i].fontsize * ratio 
				temp.x		 = size_ctrl[i].x * ratiow
				if pos (temp.tag , "no resize" ) > 0 then
					// pas de retail
				else
					temp.width   = size_ctrl[i].width  * ratiow
				end if
				temp.y		 = size_ctrl[i].y * ratioh
				temp.height  = size_ctrl[i].height * ratioh 
				
			case userobject!

				temp.y		 = size_ctrl[i].y * ratioh
				if pos (temp.tag , "centrer" ) > 0 then
					temp.x		 =  (fenetre.width - size_ctrl[i].width ) / 2
				else
					temp.x		 = size_ctrl[i].x * ratiow
				end if
				
				if pos( temp.tag , "no resize" ) > 0 or left(temp.ClassName(),7) = "pb_aide"  then
					// on ne fait rien !!
				else
					if pos( temp.tag , "no resize hauteur" ) > 0   then
						// on ne resize que la largeur !!
						temp.width   = size_ctrl[i].width  * ratio
					else
						// On prend le min des 2 ratio pour pas déformer les user objects graphique
						temp.width   = size_ctrl[i].width  * ratio
						temp.height  = size_ctrl[i].height * ratio 
					end if
				end if
				
				
			Case rectangle!
				temp.x		 = size_ctrl[i].x * ratiow
				temp.y		 = size_ctrl[i].y * ratioh
				temp.width		 = size_ctrl[i].x * ratiow
				temp.height		 = size_ctrl[i].y * ratioh
//			Case else
//				temp.x		 = size_ctrl[i].x * ratio
//				temp.y		 = size_ctrl[i].y * ratio
		end choose
	next
	


	fenetre.Show()
	ib_exec = true
end if

//fenetre.setredraw(true)

return 1














end function

public subroutine tous_invisibles (window fenetre);// Mets TOUS les controles d'une fenêtre invisibles

dragobject temp
int cnt,i


cnt = upperbound(fenetre.control)
for i = cnt to 1 step -1
	fenetre.control[i].visible = false
next
end subroutine

on resize_fenetre.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on resize_fenetre.destroy
destroy(this.st_1)
end on

type st_1 from statictext within resize_fenetre
integer x = 101
integer y = 40
integer width = 736
integer height = 252
integer textsize = -20
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "OBJET RESIZE"
alignment alignment = center!
boolean focusrectangle = false
end type

