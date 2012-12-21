function sendCompteCreate() {
	
	RemplirAdrFacLiv();
//alert('ici');
	//var question = document.getElementById('cli_form_commentaire1').value+" "+document.getElementById('cli_form_commentaire2').value;	
    var params = $('#compte-create-form').serialize() ;
  
    
    var urlUserCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=CompteCreate&" + params +"&usrweb_email=" + document.compte_create_form.usrweb_code.value+"&cliadr_raison_0="+document.getElementById('cli_raison_1').value+"&cliadr_raison_1="+document.getElementById('cli_raison_1').value+"&cliadr_raison_2="+document.getElementById('cli_raison_1').value+"&cliadr_es_0="+document.getElementById('cli_raison_1').value+"&cliadr_raison_1="+document.getElementById('cli_raison_1').value+"&cliadr_raison_2="+document.getElementById('cli_raison_1').value+"&cliadr_enseigne_0="+document.getElementById('cli_enseigne_1').value+"&cliadr_enseigne_1="+document.getElementById('cli_enseigne_1').value+"&cliadr_enseigne_2="+document.getElementById('cli_enseigne_1').value;
	
	//alert(urlUserCreate);
	    var req = new Ajax.Request( urlUserCreate, {
        method:'get' ,
        onComplete:function(response) {
		   
			if(200 == response.status){
				evalResponse(response);
			}
			else{
				sendCompteCreate();
			}

        }
    });
		
		
}
function evalResponse( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
      // alert( "la réponse contient une erreur" ) ;
        var erreur = erreurList.item(0) ;
		 //alert(erreur.firstChild.nodeValue);
			 document.getElementById('alert_message').style.display='inline';
  			 document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
  			 document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\""+erreur.firstChild.nodeValue+"\" type=\"hidden\"/>";
  			 alert(document.frm.alertmessage.value);  
		 
    } else  {
 				
				sendMailAdmin();
				
       
    }
}




function RefreshCaptcha(){
	document.getElementById('captcha').src='Captcha?captchaId='+(new Date()).getTime();
	}




function sendMailAdmin() {

   // var params = $('contact-mail-form').serialize() ;
   var urlAdresseCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMailDemandeOuvertureCompte&usrweb_code="+document.compte_create_form.usrweb_code.value ;
	
    var req = new Ajax.Request( urlAdresseCreate, {
        method:'get' ,
        onComplete:function(response) {
			
         // alert(urlAdresseCreate);	
			
						    var reponseXML = response.responseXML ;
							var erreurList = reponseXML.getElementsByTagName('erreur') ;
							if( erreurList.length > 0  ) {
								var erreur = erreurList.item(0) ;
								 $('compte-create-form-error-message').innerHTML = erreur.firstChild.nodeValue ; 
							}
							else
							{
								
								envoiMailContactWeb();
								
							}
  	   
        }
    });
	
	
}



/********************************************Foction Envoi Mail Contact *****************************************/
function envoiMailContactWeb()
			{

			 	var urlEnvoiMailContact = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendUserDataAccess&userMail="+document.compte_create_form.usrweb_code.value ;
				
				var req = new Ajax.Request( urlEnvoiMailContact, {
				method:'get' ,
				onComplete:function(response) {
				 
				 //alert(urlEnvoiMailContact);	
					
							var reponseXML = response.responseXML ;
							var erreurList = reponseXML.getElementsByTagName('erreur') ;
							if( erreurList.length > 0  ) {
								
								var erreur = erreurList.item(0) ;
								$('compte-create-form-error-message').innerHTML = erreur.firstChild.nodeValue ; 
								
							}
				     		 else
							 	{
									//envoiMailInscriptionNewsLetter();
									document.location.href='/Web/?alias=main#/Web/?alias=confimation.compte';
									
								}
					 
				}
			   });

				}




/*********************************************************************************************************************************/
/********************************************Fonction Envoi Mail Insecription NewsLetter *****************************************/

function envoiMailInscriptionNewsLetter()
			{
				//envoi mail newsletter
				var nletter_actif=$('input:radio[name=nletter_actif]:checked').val();
				//alert(nletter_actif);
				if(nletter_actif==1){
var urlEnvoiMailInscpNL = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendNewsLetterData&usrweb_email=" + document.compte_create_form.usrweb_code.value+"&usrweb_code="+ document.compte_create_form.usrweb_code.value ;


							 var req = new Ajax.Request( urlEnvoiMailInscpNL, {
							 method:'get' ,
							 onComplete:function(response) { 
							     
								
								 
									var reponseXML = response.responseXML ;
									var erreurList = reponseXML.getElementsByTagName('erreur') ;
									if( erreurList.length > 0  ) {
										var erreur = erreurList.item(0) ;
									 $('compte-create-form-error-message').innerHTML = erreur.firstChild.nodeValue ; 
									}else{

										document.location.href='/Web/?alias=main#/Web/?alias=confimation.compte';
										//login() ;
										//$('compte-create-form').submit();
										
										}
						
								
							 }
					        });	
			 }	
			 else{
				 
				document.location.href='/Web/?alias=main#/Web/?alias=confimation.compte';
				 //login() ;
				 //document.location.href='/Web/pages/WPage.jsp?alias=confimation.compte';
			 }
				
			
			
			}


function loginAuto() {
    var user =document.getElementById('usrweb_code').value ;
    //alert('user : '+user);
    var pwd = document.getElementById('usrweb_password').value;
    //alert('pwd : '+pwd);
    var urlLogin = getAdresseSite() + "Web/pages/WUtils.jsp?name=UserLogin&log=true&user_code=" + user + "&user_password=" + pwd ;
     //alert('urlLogin : '+urlLogin);
    var req = new Ajax.Request( urlLogin, {
        method:'get' ,
        onComplete:function(response) {
            evalResponseLoginAuto(response);
        }
    });
}

function evalResponseLoginAuto(response) {
    var reponseXML = response.responseXML ;
   //alert('reponseXML : '+reponseXML);
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
       alert( erreur.firstChild.nodeValue );
    } else  {
		
				document.getElementById('alert_message').style.display='inline';
				
				
			  if(document.getElementById('countCmd').value >= 1)
			  {
				 document.getElementById('alert_message').innerHTML="<span></span><input class='pours_ma_cmd' onclick=\"document.location='/Web/?alias=cde.adrchoix'\" type='button' /><input class='acceder_cmpt' onclick=\"document.location='/Web/?alias=compte.accueil'\" type='button' /><input class='revenir_accueil' onclick=\"document.location='/Web/?alias=accueil'\" type='button' />";
				 
				document.getElementById('message2').innerHTML="<input style=\"width: 580px;\" name=\"alertmessage\" id=\"message\" value=\" F\u00e9licitation, votre inscription a bien \u00e9t\u00e9 enregistr\u00e9e, un email de confirmation vous a \u00e9t\u00e9 envoy\u00e9.\" type=\"hidden\"/>";
			  }
			  
			  else
			  {
				  
				  
		   document.getElementById('alert_message').innerHTML="<span></span><input class='effect_achats' onclick=\"document.location='/Web/?alias=accueil'\" type='button' /><input class='acceder_cmpt' onclick=\"document.location='/Web/?alias=compte.accueil'\" type='button' /><input class='revenir_accueil' onclick=\"document.location='/Web/?alias=accueil'\" type='button' />";
				 
				document.getElementById('message2').innerHTML="<input style=\"width: 580px;\" name=\"alertmessage\" id=\"message\" value=\" F\u00e9licitation, votre inscription a bien \u00e9t\u00e9 enregistr\u00e9e, un email de confirmation vous a \u00e9t\u00e9 envoy\u00e9.\" type=\"hidden\"/>"; 
				  
			  }
				
				window.location.hash="TOP";
				alert(document.frm.alertmessage.value);
		
    }
}


/*******************************************************Test adresse de livraison*****************************************
****************************************************************************************************************************/
function CheckoptinAdrLiv(){
	
	    //alert($('input:radio[name=adrLiv]:checked').val() ) ;
		var adrLivRadio=$('input:radio[name=adrLiv]:checked').val();
	
	 
		
		if(adrLivRadio==1){
			 
			document.getElementById('adrlivdiv').style.display='inline';
			document.getElementById('cliadr_adresse1_2').value=' ';
			document.getElementById('cliadr_adresse2_2').value='';
			document.getElementById('cliadr_cp_2').value=' ';
			document.getElementById('cliadr_ville_2').value=' ';
			document.getElementById('cliadr_lien_pay_code_2').value='';
			
		}
		else{
			
			document.getElementById('adrlivdiv').style.display='none';
			RemplirAdrFacLiv();
			
			}
	
	}


function RemplirAdrFacLiv()
{
	
		
	 
		document.getElementById('cliadr_adresse1_0').value=document.getElementById('cliadr_adresse1_1').value;
		document.getElementById('cliadr_adresse2_0').value=document.getElementById('cliadr_adresse2_1').value;
		
		document.getElementById('cliadr_cp_0').value=document.getElementById('cliadr_cp_1').value;
		document.getElementById('cliadr_ville_0').value=document.getElementById('cliadr_ville_1').value;
	    document.getElementById('cliadr_lien_pay_code_0').value='FR';
		
		
		 
		document.getElementById('cliadr_adresse1_2').value=document.getElementById('cliadr_adresse1_1').value;
		document.getElementById('cliadr_adresse2_2').value=document.getElementById('cliadr_adresse2_1').value;
		document.getElementById('cliadr_cp_2').value=document.getElementById('cliadr_cp_1').value;
		document.getElementById('cliadr_ville_2').value=document.getElementById('cliadr_ville_1').value;
		document.getElementById('cliadr_lien_pay_code_2').value=document.getElementById('cliadr_lien_pay_code_1').value;
/*	var adrLivRadio=$('input:radio[name=adrLiv]:checked').val();
		
		
		
    if(adrLivRadio==0){}
	else{
		document.getElementById('cliadr_adresse1_0').value=document.getElementById('cliadr_adresse1_1').value;
		document.getElementById('cliadr_adresse2_0').value=document.getElementById('cliadr_adresse2_1').value;
		
		document.getElementById('cliadr_cp_0').value=document.getElementById('cliadr_cp_1').value;
		document.getElementById('cliadr_ville_0').value=document.getElementById('cliadr_ville_1').value;
		 document.getElementById('cliadr_lien_pay_code_0').value='FR';
		}*/
		
		
}


