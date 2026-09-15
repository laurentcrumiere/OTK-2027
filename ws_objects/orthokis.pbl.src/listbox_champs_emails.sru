$PBExportHeader$listbox_champs_emails.sru
forward
global type listbox_champs_emails from listbox
end type
end forward

global type listbox_champs_emails from listbox
integer width = 942
integer height = 1508
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {""}
end type
global listbox_champs_emails listbox_champs_emails

on listbox_champs_emails.create
end on

on listbox_champs_emails.destroy
end on

event constructor;

// Construction dynamique de la liste


// Patient
additem("{nom_patient}")
additem("{prenom_patient}")
additem("{titre_patient}")
additem("{numero_dossier_patient}")
additem("{numero_secu_patient}")
additem("{age_patient}")
additem("{date_naissance_patient}")
additem("{email_patient}")

additem("{portable_patient}")

additem("-")

//Rendez-vous
additem("{prochain_rdv}")
additem("{prochain_rdv2}")
additem("{prochain_rdv3}")
additem("{prochain_rdv4}")
additem("{prochain_rdv5}")
additem("{prochain_rdv6}")

additem("-")

additem("{type_prochain_rendez-vous}")
additem("{type_prochain_rendez-vous2}")
additem("{type_prochain_rendez-vous3}")
additem("{type_prochain_rendez-vous4}")
additem("{type_prochain_rendez-vous5}")
additem("{type_prochain_rendez-vous6}")

additem("-")

additem("{jour_prochain_rendez-vous}")
additem("{jour_prochain_rendez-vous2}")
additem("{jour_prochain_rendez-vous3}")
additem("{jour_prochain_rendez-vous4}")
additem("{jour_prochain_rendez-vous5}")
additem("{jour_prochain_rendez-vous6}")

additem("-")

additem("{duree_prochain_rendez-vous}")
additem("{duree_prochain_rendez-vous2}")
additem("{duree_prochain_rendez-vous3}")
additem("{duree_prochain_rendez-vous4}")
additem("{duree_prochain_rendez-vous5}")
additem("{duree_prochain_rendez-vous6}")

additem("-")

additem("{commentaire_prochain_rdv}")
additem("{dernier_rendez_vous_honore}")
additem("{dernier_rendez_vous_non_honore}")
additem("{rendez_vous_du_jour}")

additem("-")

// Divers
additem("{somme_due_a_ce_jour}")
additem("{date_prochain_reglement}")
additem("{montant_prochain_reglement}")
additem("-")

// Parent 1
additem("{titre_parent1}")
additem("{nom_parent1}")
additem("{email_parent1}")

additem("{portable1_parent1}")

additem("-")

// Correspondant
additem("{titre_correspondant}")
additem("{nom_correspondant}")
additem("{prenom_correspondant}")
additem("{formule_politesse_correspondant}")
additem("{email_correspondant}")
additem("{telephone_correspondant}")

additem("-")

// Dentiste
additem("{titre_dentiste}")
additem("{nom_dentiste}")
additem("{prenom_dentiste}")
additem("{formule_politesse_dentiste}")
additem("{email_dentiste}")
additem("{telephone_dentiste}")

additem("-")

// Praticien
additem("{nom_praticien}")
additem("{prenom_praticien}")
additem("{logo_praticien}")
additem("{logo2_praticien}")
additem("{logo3_praticien}")
additem("{signature_praticien}")
additem("-")

// Utilisateur
additem("{nom_utilisateur}")
additem("{date_du_jour}")
additem("-")

// Covid
additem("{covid_deroulement}")
additem("{covid_questionnaire}")




end event

