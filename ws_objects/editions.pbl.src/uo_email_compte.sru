$PBExportHeader$uo_email_compte.sru
forward
global type uo_email_compte from nonvisualobject
end type
end forward

global type uo_email_compte from nonvisualobject
end type
global uo_email_compte uo_email_compte

type variables
private constant int defaut_smtp_port = 25
private constant int defaut_pop3_port = 995

private int id
string nom

string user
string pwd

string my_alias
string my_adr, starttls_str
integer starttls

string email_objet_defaut

// spécif smtp (envoie email)
string Smtp_Host, smtp_ssl_str
int Smtp_Port, smtp_ssl

// spécif pop (réception email)
string pop3_Host, pop3_ssl_str
int pop3_Port, pop3_ssl


// texte brut par défaut
string texte_brut_defaut


// spécif pop3 (réception email)
// string Pop_Host


end variables

forward prototypes
public function boolean sauvegarder ()
public function integer get_id ()
public function boolean charger (string local_nom)
public function boolean supprimer ()
public function boolean charger (integer local_id)
public function boolean creer (string local_nom, string local_smtp_host)
end prototypes

public function boolean sauvegarder ();// sauvegarde en BD les valeurs de l'objet
// renvoie TRUR si pas de pb

boolean val_retour = false

update email_comptes set 
nom = :nom, 
"user" = :user, "pwd" = :pwd, 
Smtp_Host = :Smtp_Host, Smtp_Port = :Smtp_Port, 
my_alias = :my_alias, my_adr = :my_adr,
email_objet_defaut = :email_objet_defaut
where id = :id ;

if SQLCA.SQLCode <> 0 then 
	rollback ;
else
	commit ;
	val_retour = true
end if

return val_retour
end function

public function integer get_id ();return id
end function

public function boolean charger (string local_nom);// charge les valeurs d'un compte à partir de la BD
// renvoie True si pas de pb

boolean val_retour = false

if isnull(local_nom) then return val_retour

int local_id
select id into :local_id from email_comptes where nom = :local_nom ;
if isnull(local_id) then local_id = 0
val_retour = charger(local_id)
return val_retour
end function

public function boolean supprimer ();// supprime de la BD ce compte
// renvoie TRUR si pas de pb (donc bien suppr)

boolean val_retour = false

delete from email_comptes where id = :id ;

if SQLCA.SQLCode <> 0 then 
	rollback ;
else
	commit ;
	val_retour = true
end if

return val_retour
end function

public function boolean charger (integer local_id);// charge les valeurs d'un compte à partir de la BD
// renvoie True si pas de pb

boolean val_retour = false

if isnull(local_id) then return val_retour

select id, nom, "user", pwd, smtp_host, smtp_port, my_alias, my_adr, email_objet_defaut, texte_envoi_piece_jointe, pop3_host, pop3_port, isnull(smtp_ssl, 'N'), isnull(pop3_ssl, 'O'), isnull(starttls, 'N')
into :id, :nom, :user, :pwd, :smtp_host, :smtp_port, :my_alias, :my_adr, :email_objet_defaut, :texte_brut_defaut , :pop3_host, :pop3_port, :smtp_ssl_str, :pop3_ssl_str, :starttls_str
from email_comptes where id = :local_id ;

if isnull(id) then id = 0
if isnull(nom) then nom = ''
if isnull(user) then user = ''
if isnull(pwd) then pwd = ''
if isnull(Smtp_Host) then Smtp_Host = ''
if isnull(Smtp_Port) then smtp_port = defaut_smtp_port
if isnull(pop3_Host) then pop3_Host = ''
if isnull(pop3_Port) then pop3_port = defaut_pop3_port
if isnull(my_alias) then my_alias = ''
if isnull(my_adr) then my_adr = ''
if isnull(email_objet_defaut) then email_objet_defaut = ''
if isnull(texte_brut_defaut) then texte_brut_defaut = ''


if smtp_ssl_str = "O" then 
	smtp_ssl = 1
else
	smtp_ssl = 0
end if

if pop3_ssl_str = "O" then 
	pop3_ssl = 1
else
	pop3_ssl = 0
end if

if starttls_str = "O" then 
	starttls = 1
else
	starttls = 0
end if





if id > 0 then val_retour = true

return val_retour
end function

public function boolean creer (string local_nom, string local_smtp_host);// créer un nouveau compte
// renvoie True si pas de pb

boolean val_retour = false

if isnull(local_nom) then return val_retour
if local_nom = '' then  return val_retour
if isnull(local_smtp_host) then return val_retour
if local_smtp_host = '' then  return val_retour
	
insert into email_comptes(nom, smtp_host) 
values (:local_nom, :local_smtp_host) ;

if SQLCA.SQLCode <> 0 then 
	rollback ;
else
	commit ;
	// maj de l'ID gen en autoincrement
	val_retour = charger(local_nom)
end if

return val_retour
end function

on uo_email_compte.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_email_compte.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

