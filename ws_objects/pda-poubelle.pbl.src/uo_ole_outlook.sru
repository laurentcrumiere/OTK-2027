$PBExportHeader$uo_ole_outlook.sru
forward
global type uo_ole_outlook from uo_ole_obj
end type
end forward

global type uo_ole_outlook from uo_ole_obj
end type
global uo_ole_outlook uo_ole_outlook

type variables
constant string	nom_obj_outlook = "Outlook.Application"

private constant int		item_mail = 0
private constant int		item_rdv = 1
private constant int		item_tache = 3


// Types de données des UserProperties
private constant int	olCombination = 19 
private constant int	olCurrency = 14 
private constant int	 olDateTime = 5 
private constant int	olDuration = 7 
private constant int	olEnumeration = 21 
private constant int	olFormula = 18 
private constant int	olInteger = 20 
private constant int	olKeywords = 11 
private constant int	olNumber = 3 
private constant int	olOutlookInternal = 0 
private constant int	olPercent = 12 
private constant int	olSmartFrom = 22 
private constant int	olText = 1 
private constant int	olYesNo = 6  

end variables

forward prototypes
public function integer nouveau_mail (string sujet, string text)
public function integer nouvelle_tache (string sujet, string text)
public function integer nouveau_rdv (any rdv_a_ajouter)
end prototypes

public function integer nouveau_mail (string sujet, string text);// pour ouvrir un nouveau mail
// return 1 si ok
//		-1 si pb

int		returnval = -1
oleobject	nouveau_mail


if isnull( sujet ) then sujet = ""
if isnull( text ) then text = ""

if connecter_ole_obj( nom_obj_outlook ) = 1 then
// on est connecter à OUTLOOK

	nouveau_mail = this.Application.createitem( item_mail )
	nouveau_mail.Subject = sujet
	nouveau_mail.body = text
	nouveau_mail.display()
	
	deconnecter_ole_obj( )
	returnval = 1
end if

return returnval
end function

public function integer nouvelle_tache (string sujet, string text);// pour ouvrir une nouvello tâche
// return 1 si ok
//		-1 si pb

int		returnval = -1
oleobject	nouvelle_tache


if isnull( sujet ) then sujet = ""
if isnull( text ) then text = ""

if connecter_ole_obj( nom_obj_outlook ) = 1 then
// on est connecter à OUTLOOK

	nouvelle_tache = this.Application.createitem( item_tache )
	nouvelle_tache.Subject = sujet
	nouvelle_tache.body = text
	nouvelle_tache.display()
	
	deconnecter_ole_obj( )
	returnval = 1
end if

return returnval
end function

public function integer nouveau_rdv (any rdv_a_ajouter);// pour créer un nouveau rdv
// return 1 si ok
//		-1 si pb
//
// On doit déjà être connecté 


integer		returnval = -1
oleobject	nouveau_rdv

rdv_outlook rdv_outlook

rdv_outlook = rdv_a_ajouter

// pour éviter les plantages comme chez Alexandre
Try 
	nouveau_rdv = this.Application.createitem( item_rdv )

	nouveau_rdv.Body = rdv_outlook.corps
	nouveau_rdv.Subject = rdv_outlook.objet
	nouveau_rdv.Location = rdv_outlook.location
	nouveau_rdv.ReminderSet = false
	nouveau_rdv.Start = rdv_outlook.rdv
	nouveau_rdv.Duration = rdv_outlook.duree
	
	// Propriété spéciale pour reconnaitre les rdv
	nouveau_rdv.UserProperties.Add("Orthokis", olText) 

	nouveau_rdv.save()
	
	returnval = 1

	return returnval


Catch (RuntimeError er)

	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite lors de l'ajout d'un RDV.~nEléments du rendez-vous :~n- Objet : " + rdv_outlook.objet + "~n- Début : "+string(rdv_outlook.rdv, "dd/mm/yyyy à hh:mm")+"~n- Corps : " + rdv_outlook.corps + "~n- Durée : " + string(rdv_outlook.duree) + "~n~nLe rendez-vous n'a pas été ajouté mais la synchronisation va se poursuivre.")

	returnval = -1 
	
	return returnval
	
End Try


end function

on uo_ole_outlook.create
call super::create
end on

on uo_ole_outlook.destroy
call super::destroy
end on

