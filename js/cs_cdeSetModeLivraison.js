    
 
function cdeSetModeLivraison() {
	
	
	 var cliadrCompteur=document.getElementById('compteur_id_fac').value;
	 var cliadrLienWconfId=document.getElementById('lien_wconf_id_fac').value;
	 var cliadrCompteurLiv=document.getElementById('compteur_id_liv').value;
	 var cliadrLienWconfIdLiv=document.getElementById('lien_wconf_id_liv').value;
	

 
    var modlivCode = document.getElementById('modliv_code').value ;
	
		var urlCdeSetModeLivraison = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetModeLivraison&modliv_code=" + modlivCode;
		var reqCdeSetModeLivraison = new Ajax.Request( urlCdeSetModeLivraison, {
			method:'get' ,
			onComplete:function(response) {
				
				
				evalResponseCdeSetModeLivraison(response);
			}
		});
	
}




function evalResponseCdeSetModeLivraison( response ) {
	 var cliadrCompteur=document.getElementById('compteur_id_fac').value;
	 var cliadrLienWconfId=document.getElementById('lien_wconf_id_fac').value;
	 var cliadrCompteurLiv=document.getElementById('compteur_id_liv').value;
	 var cliadrLienWconfIdLiv=document.getElementById('lien_wconf_id_liv').value;

    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
	
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
        document.getElementById('commande-configuration-form-error-message').innerHTML = erreur.firstChild.nodeValue  ;
    } else  {
        document.getElementById('commande-configuration-form-error-message').innerHTML = "" ;
		
		cdeSetAdrFacturation( cliadrCompteur, cliadrLienWconfId );
        /*self.location.href='/Web/pages/WPage.jsp?alias=cde_confirmation' ;*/
    }
}




function cdeSetAdrFacturation( cliadrCompteur, cliadrLienWconfId ) {
	
	 var cliadrCompteur=document.getElementById('compteur_id_fac').value;
	 var cliadrLienWconfId=document.getElementById('lien_wconf_id_fac').value;
	 var cliadrCompteurLiv=document.getElementById('compteur_id_liv').value;
	 var cliadrLienWconfIdLiv=document.getElementById('lien_wconf_id_liv').value;
	

    var urlAdrfacChoix = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetAdrFacturation&cliadr_compteur=" + cliadrCompteur +
        "&cliadr_lien_wconf_id=" + cliadrLienWconfId ;

    var req = new Ajax.Request( urlAdrfacChoix, {
        method:'get' ,
        onComplete:function(response) {
			cdeSetAdrLivraison( cliadrCompteurLiv, cliadrLienWconfIdLiv );
            /*evalResponse(response);*/
        }
    });
}



function cdeSetAdrLivraison( cliadrCompteurLiv, cliadrLienWconfIdLiv ) {

	
	 var cliadrCompteur=document.getElementById('compteur_id_fac').value;
	 var cliadrLienWconfId=document.getElementById('lien_wconf_id_fac').value;
	 var cliadrCompteurLiv=document.getElementById('compteur_id_liv').value;
	 var cliadrLienWconfIdLiv=document.getElementById('lien_wconf_id_liv').value;
	 
	
	 
	 //  alert( 'choix adresse') ;
    var urlAdrlivChoix = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetAdrLivraison&cliadr_compteur=" + cliadrCompteurLiv +
        "&cliadr_lien_wconf_id=" + cliadrLienWconfIdLiv ;
 //alert( 'urlAdrlivChoix : ' + urlAdrlivChoix) ;
    var req = new Ajax.Request( urlAdrlivChoix, {
        method:'get' ,
        onComplete:function(response) {
			
	
			
		
			document.location.href='/Web/?alias=main#/Web/?alias=cde.confirmation' ;		
	
	
        }
    });



}