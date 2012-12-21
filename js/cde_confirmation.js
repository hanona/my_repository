
var modeReglementCode = "" ;
var isClientParticulier = true ;
var debugCommandeConfirmation = false ;

function cdeSetRemDateliv() {
	
	var remarque = document.getElementById('remarque').value;

	var r = remarque.replace("&","@1");

	var v = r.replace("#","dyaz");

    var date_liv = document.getElementById('popup_container').value;
	

 var urlCdeSetRemDateliv = getAdresseSite() + "Web/pages/WUtils.jsp?name=PutRemDateLiv&rem_cli=" +v+"&date_liv_cli="+date_liv+"&stocde_cmd_matrice=0&stocde_cmd_matrice_name=" ;
    
    
    var reqCdeSetModeReglement = new Ajax.Request( urlCdeSetRemDateliv, {
        method:'get' ,
        onComplete:function(response) {
			// alert (urlCdeSetRemDateliv);
			
          cdeSetModeReglement()  ;
        }
    });
		
		
		}
		
function commandeConfimation( clientParticulier ) {

    if( !cgvIsAccepted() ) {
		
		     document.getElementById('alert_message').style.display='inline';
		    	
			 document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			 
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Vous devez accepter les conditions générales de vente pour pouvoir confirmer votre commande</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
				
        return ;
    }
    modeReglementCode = "" ;

    if( debugCommandeConfirmation ) {
        alert( "clientParticulier = " + clientParticulier ) ;
    }
	
    isClientParticulier = true ;
    

    if( debugCommandeConfirmation ) {
        alert( "isClientParticulier = " + isClientParticulier ) ;
    }

    if( isClientParticulier ) {
     
	
    modeReglementCode = getModeReglement() ;
    if( modeReglementCode == '' ) {
		 
		     document.getElementById('alert_message').style.display='inline';
		    	
			 document.getElementById('alert_message').innerHTML="<span></span><input class='btn_input_green' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" />";
			 
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Vous devez choisir un mode de règlement</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
          
            return ;
        }
   
	}

	cdeSetRemDateliv() ;


}

function cgvIsAccepted() {
    var isAccepted = true ;
	
	if(document.getElementById('accept_cgv').checked==false){
		isAccepted = false
		}
 
    return isAccepted ;
}

function getModeReglement() {
    var modeReglement = '' ;
   
	
	for(i=0;i<document.commande_confirmation_form['mode_reglement_liste'].length;i++)
	{
		if (document.commande_confirmation_form['mode_reglement_liste'][i].checked == true)
		modeReglement = document.commande_confirmation_form['mode_reglement_liste'][i].value;
	}
	
    return modeReglement ;
    
    
}

function cdeSetModeReglement() {
	
	//modeReglementCode = document.getElementById("mode_reglement").value;
    var urlCdeSetModeReglement = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetModeReglement&modreg_code=" + modeReglementCode ;
	
    if( debugCommandeConfirmation ) {
       // alert( urlCdeSetModeReglement ) ;
    }
    var reqCdeSetModeReglement = new Ajax.Request( urlCdeSetModeReglement, {
        method:'get' ,
        onComplete:function(response) { 
	//	alert(urlCdeSetModeReglement);
            evalResponseCdeSetModeReglement(response);
			
        }
    });
}

function evalResponseCdeSetModeReglement( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    var stocdeCode = document.getElementById('stocde-code').value ;
//	var modeReglementCode = document.getElementById("mode_reglement").value;
	
   
	
    if( debugCommandeConfirmation ) {
        alert( "response cdeSetModeReglement" ) ;
    }
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
        document.getElementById('commande-confirmation-form-error-message').innerHTML = erreur.firstChild.nodeValue  ;
    } else  {
        document.getElementById('commande-confirmation-form-error-message').innerHTML = "" ;
		
	
		
	//if(modeReglementCode == 'VIR') {	}
	
	//alert('ici');
				var urlCdeSetValidated = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMailCommandeValider&stocde_code="+stocdeCode ;
				//alert(urlCdeSetValidated);
				var reqCdeSetValidated = new Ajax.Request( urlCdeSetValidated, {
					method:'get' ,
					onComplete:function(response) {
						
						  cdeSetValidated() ;
						
				  }
				});
      
	// modeReglementCode != 'CBI' &&  
		if(modeReglementCode == 'CHQ') {	
	
		//alert('ici');
				var urlCdeSetValidated = getAdresseSite() + "ColCMS/pages/WUtils.jsp?name=SendMailCommandeValider&stocde_code="+stocdeCode ;
				//alert(urlCdeSetValidated);
				var reqCdeSetValidated = new Ajax.Request( urlCdeSetValidated, {
					method:'get' ,
					onComplete:function(response) {
						
						  cdeSetValidated() ;
						
				  }
				});
      
	}
	//alert(modeReglementCode)
	if( modeReglementCode == 'CBI') {	
		
        document.commande_confirmation_test_sgmb.submit() ;
          return ; 
	}

	}
	
  
}

function cdeSetValidated() {
    var urlCdeSetValidated = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSetValidated" ;
    if( debugCommandeConfirmation ) {
        alert( "send cdeSetValidated" ) ;
    }
    var reqCdeSetValidated = new Ajax.Request( urlCdeSetValidated, {
        method:'get' ,
        onComplete:function(response) {
            CdeExport();
        }
    });
}

function CdeExport() {
	
	var  stocdeCode = document.getElementById('stocde-code').value ;
    var urlCdeExport = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeExport&stocde_code=" + stocdeCode ;
	
    if( debugCommandeConfirmation ) {
        alert( "send cdeSetValidated" ) ;
    }
    var reqCdeExport= new Ajax.Request( urlCdeExport, {
        method:'get' ,
        onComplete:function(response) {
            evalResponseCdeSetValidated(response);
        }
    });
}


function evalResponseCdeSetValidated( response ) {
    if( debugCommandeConfirmation ) {
        alert( "response cdeSetValidated" ) ;
    }

    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
        document.getElementById('commande-confirmation-form-error-message').innerHTML = erreur.firstChild.nodeValue  ;
    } else  {
        document.getElementById('commande-confirmation-form-error-message').innerHTML = "" ;

        var stocdeCode = document.getElementById('stocde-code').value ;
       
   
	    CmdMailConfirm();
		  
        if( isClientParticulier ) {
         
                self.location.href='/Web/?alias=main#/Web/?alias=cde.resume&stocde_code=' + stocdeCode;
                return ;
         
           
        }

    }
}



function CmdMailConfirm()
{
 
    var cmd_code= document.getElementById('stocde-code').value;
    var urlAdresseCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMail" ;


    urlAdresseCreate = urlAdresseCreate + "&mailSender=magin@imagin-jouets.com";
    var mailTitle = "ColInternet : Commande vient de passer : " + cmd_code;

    urlAdresseCreate = urlAdresseCreate + "&mailTitle=" + mailTitle ;
    urlAdresseCreate = urlAdresseCreate + "&mailTo=commercial" ;

	var mailContenu = 'Bonjour ,<br/>%0A%0A%0A Une nouvelle commande \340 \351t\351 valid\351e sur le site marchand, elle porte le num\351ro :  ' + cmd_code +'<br />L\'email associé \340 la commande est : '+ $('mailclt').value+'.';
	


    urlAdresseCreate = urlAdresseCreate + "&mailMessage=" + mailContenu  ;
    //alert (urlAdresseCreate);
	
    var req = new Ajax.Request( urlAdresseCreate, {
        method:'get' ,
        onComplete:function(response) {


        }
    });
		

}


function InfoCheque(){
	if(getModeReglement()=='PP')
	{
		document.getElementById('infoCheq').innerHTML='';
	 }
	 
	else if(getModeReglement()=='CHQ')
	{
		document.getElementById('infoCheq').innerHTML='Paiement par cheque test validation commande';
	 }
	 else{document.getElementById('infoCheq').innerHTML='Paiement par carte bancaire sécurisé par la Société Générale ';}

	
	}