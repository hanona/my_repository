function cdeSetAdrLivraison( cliadrCompteur, cliadrLienWconfId ) {
    var urlAdrlivChoix = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetAdrLivraison&cliadr_compteur=" + cliadrCompteur +
        "&cliadr_lien_wconf_id=" + cliadrLienWconfId ;
		
		//alert(urlAdrlivChoix);
    var req = new Ajax.Request( urlAdrlivChoix, {
        method:'get' ,
        onComplete:function(response) {
            evalResponse(response);
        }
    });
}

function cdeSetAdrFacturation( cliadrCompteur, cliadrLienWconfId ) {
    var urlAdrlivChoix = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetAdrFacturation&cliadr_compteur=" + cliadrCompteur +
        "&cliadr_lien_wconf_id=" + cliadrLienWconfId ;
    var req = new Ajax.Request( urlAdrlivChoix, {
        method:'get' ,
        onComplete:function(response) {
            evalResponse(response);
        }
    });
}

function evalResponse( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
       alert(erreur.firstChild.nodeValue)  ;
    } else  {
       
        document.location.href='/Web/pages/WPage.jsp?alias=cde.adrchoix';
    }
}

