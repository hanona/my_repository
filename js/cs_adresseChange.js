function adresseChange() {

    if ( formulaireAdresseChangeIsCompleted() ) {
            sendAdresseChange() ;
    } else {
          alert('Envoi du formulaire impossible');
    }
}

function evalResponseAdresseChange( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
		
       alert( erreur.firstChild.nodeValue);
		
		
    } else  {
			
		if( document.getElementById('page_adr').value=='null'){document.location.href='/Web/?alias=compte.accueil&page=adr';	}
		else{
			 document.location.href='/Web/?alias=cde.adrchoix';
			} 
        //$('adresse-change-form').submit() ;
    }
}


function sendAdresseChange() {
	var formAdresseChange = $('#adresse-change-form');  
    var params =  formAdresseChange.serialize() ;
//	alert(params);
    var urlAdresseChange = getAdresseSite() + "Web/pages/WUtils.jsp?name=ClientAdresseUpdate&" + params ;
	//alert(urlAdresseChange);
    var req = new Ajax.Request( urlAdresseChange, {
        method:'get' ,
        onComplete:function(response) {
            evalResponseAdresseChange(response);
        }
    });
}

function formulaireAdresseChangeIsCompleted() {
	var formAdresseChange = $('#adresse-change-form');  
    var formElements = formAdresseChange.getElements() ;
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



