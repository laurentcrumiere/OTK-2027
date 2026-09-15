

// Purger le stock 

delete from historique_es from stock_produit, produit, type_produit, categorie_produit 
	where historique_es.code_barre = stock_produit.code_barre 
	and stock_produit.code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;


delete from fiche_tracabilite from stock_produit, produit, type_produit, categorie_produit 
	where fiche_tracabilite.code_barre = stock_produit.code_barre 
	and stock_produit.code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;

delete from stock_produit from produit, type_produit, categorie_produit 
	where code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;


delete from ligne_commande ;

delete from commande ;


delete from tracabilite_liste_produit ;


delete from param_stock_produit from produit, type_produit, categorie_produit 
	where code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;

delete from param_stock_fournisseur from produit, type_produit, categorie_produit 
	where code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;




delete from reference_produit from produit, type_produit, categorie_produit 
	where code_produit = produit.code_interne and produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;



delete from produit from type_produit, categorie_produit 
	where produit.code_type_produit = type_produit.code 
	and type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;


delete from type_produit from categorie_produit 
	where type_produit.code_categorie_produit = categorie_produit.code 
	and left(categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;

delete from categorie_produit 
	where (categorie_produit.categorie_produit,2) <> 'EM' and categorie_produit.categorie_produit <> 'EV BAGUES' ;



