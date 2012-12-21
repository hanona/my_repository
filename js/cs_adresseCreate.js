function adresseLivraisonCreate() {
//    alert("debut de la demande de creation utilisateur") ;
    
    if ( formulaireAdresseCreateIsCompleted() ) {
        $('adresse-create-form-error-message').innerHTML="" ;
            sendAdresseLivraisonCreate() ;
        
    } else {
        $('adresse-create-form-error-message').innerHTML="<span class=\"info_obligatoire\">Certains champs obligatoires sont vides." +
    "<br/>Envoi du formulaire impossible</span>" ;
    }

}




function evalResponseAdresseCreate( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
//        alert( "la réponse contient une erreur" ) ;
        var erreur = erreurList.item(0) ;
        $('adresse-create-form-error-message').innerHTML = erreur.firstChild.nodeValue  ;
    } else  {
        $('adresse-create-form-error-message').innerHTML = "" ;
		
		 if( document.getElementById('page_adr').value=='comptadr' ){
			   document.location='/Web/?alias=compte.accueil&page=adr';
			}
		else{
			 document.location='/Web/?alias=cde.adrchoix';
		} 
        
    }
}


function sendAdresseLivraisonCreate() {
    var params = $('#adresse-create-form').serialize() ;
	//var usrgrp=$('usrgroup').value;
	
	
		var urlAdresseCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=ClientAdresseLivraisonCreate&" + params +"&cliadr_raison_2="+document.getElementById('nom').value +" "+document.getElementById('prenom').value ;
	
	
    //alert(urlAdresseCreate) ;
    var req = new Ajax.Request( urlAdresseCreate, {
        method:'get' ,
        onComplete:function(response) {
            evalResponseAdresseCreate(response);
        }
    });
}





function formulaireAdresseCreateIsCompleted() {
    var formElements = $('adresse-create-form').getElements() ;
    var isCompleted = true ;
    formElements.each( function(element){
        var elementValue = $F(element) ;
        if( (element.hasClassName('obligatoire') && ( elementValue.length < 1) ) ) {
            isCompleted = false ;
            element.addClassName("erreur") ;
        } else {
            element.removeClassName("erreur") ;
        }
    } ) ;
    return isCompleted ;
}



