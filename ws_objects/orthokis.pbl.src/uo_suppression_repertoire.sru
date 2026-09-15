$PBExportHeader$uo_suppression_repertoire.sru
forward
global type uo_suppression_repertoire from userobject
end type
type lb_files from listbox within uo_suppression_repertoire
end type
end forward

global type uo_suppression_repertoire from userobject
integer width = 681
integer height = 484
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
lb_files lb_files
end type
global uo_suppression_repertoire uo_suppression_repertoire

forward prototypes
public function integer supprimer_repertoire (string repertoire)
public subroutine lister_fichier (string repertoire, ref string tab_item[])
end prototypes

public function integer supprimer_repertoire (string repertoire);

// L'argument doit être passé sans \ final
// exemple : c:\power\photos

// on utilise une listbox externe pour la fonction DirList mais en fait on place
// tous les élements de la DirList dans un tableau local pour les utiliser

// Renvoie 1 si OK ou 0 si pas pu le supprimer


//------------------------------------------------------------------------------



string file, rep_defaut, item
long nb_files, cpt

// listbox lb_files
// 
// lb_files = create listbox

lb_files.reset()

string tab_item[]


// on recherche les répertoires et les fichiers
lb_files.DirList(repertoire+"\*.*",0 + 1 + 2 + 4 + 32 + 16)

nb_files = lb_files.TotalItems()
for cpt = 1 to nb_files
	tab_item[cpt] = lb_files.text(cpt)
next

// Le premier répertoire listé est [..] => on le zap
for cpt = 1 to nb_files
	
	item =tab_item[cpt] 
	// Les répertoires dans la listes sont entre [] pas les fichiers
	if left(item,1) = "[" and right(item,1) = "]" then
	
		if item <> "[..]" then
			supprimer_repertoire ( repertoire+"\"+ mid(item,2,len(item) - 2) )
		end if
	else
		// c'est un fichier
		file = repertoire + "\"+item
		
		// pour être sur on met l'attribut archive au fichier (pour virer des lectures seules éventuelles
		SetFileAttributesA(file, 32)
		// On détruit
		DeleteFileA (file) 
	end if
next


// pour supr un rep, ATTENTION = il doit être vide (return 0 si pb)

 
rep_defaut = dir_ini
SetCurrentDirectoryA (rep_defaut) 

 if RemoveDirectoryA (repertoire) = 0 then
 	return 0
else
	return 1
end if





end function

public subroutine lister_fichier (string repertoire, ref string tab_item[]);

// Place la liste des fichiers du répertoie (et uniquement des fichiers) dans lb_files

long nb_files, cpt


lb_files.reset() 

lb_files.DirList(repertoire+"\*.*",0 + 1 + 2 + 4 + 32 )

nb_files = lb_files.TotalItems()
for cpt = 1 to nb_files
	tab_item[cpt] = lb_files.text(cpt)
next

end subroutine

on uo_suppression_repertoire.create
this.lb_files=create lb_files
this.Control[]={this.lb_files}
end on

on uo_suppression_repertoire.destroy
destroy(this.lb_files)
end on

type lb_files from listbox within uo_suppression_repertoire
boolean visible = false
integer x = 50
integer y = 16
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.SetRedraw ( false )
end event

