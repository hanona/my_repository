 function startLogin() {
	var user =document.getElementById('userweb_code2').value ;
    var pwd =document.getElementById('user_password').value ;
	//	alert(user + pwd);
	if(user=='' || pwd=='')
	{
		
		
		
		        document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			 
			
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Les champs sont vides.Indentification impossible.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);  
		
		
		}
  else{
        login() ;
		}
   /*  if ( formulaireLoginIsCompleted() ) { } else {
        $('login-error-message').innerHTML="<span class=\"info-obligatoire\">Les champs sont vides.Indentification impossible.</span>" ;
    }*/
}

function formulaireLoginIsCompleted() {

	
    var formElements = document.login_form.getElements() ;
    var isCompleted = true ;
    formElements.each( function(element){
        var elementValue = $F(element) ;
        if( (element.hasClassName('login') && ( elementValue.length < 1)  ) ) {
			
            isCompleted = false ;
            element.addClassName("erreur") ;
        } else {
            element.removeClassName("erreur") ;
        }
    } ) ;
    return isCompleted ;
}


function login() {
	
    var user =document.getElementById('userweb_code2').value ;
    var pwd =document.getElementById('user_password').value ;
   
    var urlLogin = getAdresseSite() + "Web/pages/WUtils.jsp?name=UserLogin&log=true&user_code=" + user + "&user_password=" + pwd ;
//alert('urlLogin : '+urlLogin);
    var req = new Ajax.Request( urlLogin, {
        method:'get' ,
        onComplete:function(response) {
            evalResponseLogin(response);
        }
    });
}

function evalResponseLogin(response) {
    var reponseXML = response.responseXML ;
  //alert('reponseXML : '+reponseXML);
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
             
				document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>"+erreur.firstChild.nodeValue+"</span>\" type=\"hidden\"/>";
				alert(document.frm.alertmessage.value);  
				
	   
	 
		
    } else  {
		
		
		if(document.getElementById('countCmd').value > 0){
			//self.location.href='/Web/pages/WPage.jsp?alias=cde.adrchoix#/Web/?alias=cde.detail';
			 document.location='/Web/?alias=main';
		}
		else{//compte.accueil
			 document.location='/Web/?alias=main';
			}
		
    }
}

function stopLogin(){
    var urlLogoff = getAdresseSite() + "Web/pages/WUtils.jsp?name=UserLogin&log=false" ;
    var req = new Ajax.Request( urlLogoff, {
        method:'get',
        onComplete:function(response) {
           // evalResponseLogoff(response);
	
		   //$('logoff_form').submit() ;
		    document.location.href='/Web/?alias=main';
        }
    });
}

function evalResponseLogoff( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
        $('login-error-message').innerHTML = erreur.firstChild.nodeValue ;
    } else  {
		
        $('login-error-message').innerHTML="" ;
        $('logoff-form').submit() ;
		
    }
}

<!--/*****************************************Désabonnement Newsletter*************************************************/-->
function NewsletterDesabone() {

    window.open('/Web/pages/WPage.jsp?alias=desabonne_newsletter',' Désabonnement_de_la_Newsletter ','width=880,height=400,status=no,resizable=no,toolbar=no,menubar=no' );
	
}

function verifyemailnews(){	

		var isGood = false ;
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

	    if(document.getElementById('usrweb_email_nl').value=='' ){
			  
			    			  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Merci de saisir votre email !!!</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
						
						
						document.getElementById('usrweb_email_nl').select();
						 isGood = false ;
		 }
		 else if(!emailReg.test(document.getElementById('usrweb_email_nl').value)) {
			 
			  				  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Veuillez saisir un email valid.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
	   
			  document.getElementById('usrweb_email_nl').select();
			  isGood = false ;
			   
	     }
		 else{isGood = true ;}
		 return isGood;

	}
 


function NewsletterDesabonne() {	

	var usrweb_email=document.getElementById('usrweb_email_nl').value;
	
	if(verifyemailnews()){

	
		 var urlUserCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=DesabonnerNewsLetter&usrweb_code="+ document.getElementById('usrweb_code').value  +"&usrweb_email=" + document.getElementById('usrweb_email_nl').value;
		 
			//alert(urlUserCreate);
			var req = new Ajax.Request( urlUserCreate, {
			method:'get' ,
			onComplete:function(response) {
				
				var reponseXML = response.responseXML ;
				var erreurList = reponseXML.getElementsByTagName('erreur') ;
				
				if( erreurList.length > 0  ) {
			    
					var erreur = erreurList.item(0) ;
				     
					
					if(erreur.firstChild.nodeValue=="Desabonnement de l'utilisateur succes")
					{		
					
					   
						DesabonMailNotification();
					
					
				   }
				   else{
					   
					          document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>"+erreur.firstChild.nodeValue+"</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
					   }
			   
					
				} 
					
		 
			   
			
			}
		}); 
		
	}
}	


function DesabonMailNotification()
{
 
  
 
    var usrweb_email=document.getElementById('usrweb_email_nl').value;
    var urlDesabonMail = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMail" ;


    urlDesabonMail = urlDesabonMail + "&mailSender=no-reply@imagin-jouets.com";
    var mailTitle = "ColInternet : Désabonnement de la newsletter ";

    urlDesabonMail = urlDesabonMail + "&mailTitle=" + mailTitle ;
    urlDesabonMail = urlDesabonMail + "&mailTo=commercial" ;

	var mailContenu = 'Bonjour ,<br/>%0A%0A%0A Le compte :  ' + usrweb_email + ' c\'est désabonné de votre newsletter.';
	


    urlDesabonMail = urlDesabonMail + "&mailMessage=" + mailContenu  ;
  
   // alert (urlDesabonMail);
	
    var req = new Ajax.Request( urlDesabonMail, {
        method:'get' ,
        onComplete:function(response) {
			
		 SendMailDesabonnementClient()
			
							
			
        }
    });
		

}	



function SendMailDesabonnementClient()
	{
		
		
		
 
    var usrweb_email=document.getElementById('usrweb_email_nl').value;
    var urlDesabonMail = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMail" ;


    urlDesabonMail = urlDesabonMail + "&mailSender=no-reply@imagin-jouets.com";
    var mailTitle = "IMAGIN : Désabonnement de la newsletter ";

    urlDesabonMail = urlDesabonMail + "&mailTitle=" + mailTitle ;
    urlDesabonMail = urlDesabonMail + "&mailTo="+ usrweb_email ;

	var mailContenu = 'Bonjour ,<br/>%0A%0A%0A Le compte :  ' + usrweb_email + ' c\'est désabonné de votre newsletter.';
	


    urlDesabonMail = urlDesabonMail + "&mailMessage=" + mailContenu  ;
  
   // alert (urlDesabonMail);
	
    var req = new Ajax.Request( urlDesabonMail, {
        method:'get' ,
        onComplete:function(response) { 
		
		//evalResponseDesabonNL( response )
  							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';window.opener.location.reload();\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Vous êtes maintenant désabonné de notre newsletter.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
							 
						
		
		}
    });
		
		
		
		
		
	}
	
function evalResponseDesabonNL( response ) {
	
     var reponseXML = response.responseXML ;
	 var erreurList = reponseXML.getElementsByTagName('erreur') ;
	
	 if( erreurList.length > 0  ) {

			var erreur = erreurList.item(0) ;
							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>"+erreur.firstChild.nodeValue+"fffffffff</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
			
			
	 } 

	 else{
		 
			
			 self.close();
			 //alert("F\u00e9licitation, vous êtes maintenant d\u00e9sabonn\u00e9 de notre NewsLetter.");
			
		}
}
	

<!--**********************************************************************************************************************************************-->

<!--/******************************************************************Newsletter Header*********************************************************/-->
<!--**********************************************************************************************************************************************-->

/********************************************NEWSLETTER****************************************************/	
function verifyemailnl(){	

		var isGood = false ;
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

		
	      if(document.getElementById('nltxt').value=='' || document.getElementById('nltxt').value=='Votre e-mail' ){
						
				document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';document.newleter.usrweb_email.select();\" type='button' />";
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Merci de saisir votre email !!!</span>\" type=\"hidden\"/>";
				alert(document.frm.alertmessage.value);  
				
				isGood = false ;
			  
		 }
		 else if(!emailReg.test(document.getElementById('nltxt').value)) {
			
			    document.getElementById('alert_message').style.display='inline';
				
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';document.getElementById('nltxt').select();\" type='button' />";
				
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Votre inscription a échouée car l'email saisi n'est pas valide, veuillez corriger.</span>\" type=\"hidden\"/>";
				alert(document.frm.alertmessage.value);  

			   isGood = false ;
			   
	     }
		 else{isGood = true ;}
		 return isGood;

	}
	
function evalResponseNL( response ) {
	
     var reponseXML = response.responseXML ;
	 var erreurList = reponseXML.getElementsByTagName('erreur') ;
	
	 if( erreurList.length > 0  ) {

		var erreur = erreurList.item(0) ;
		alert(erreur.firstChild.nodeValue ) ;
	 } 

	 else{
			
				document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Félicitation, vous aller recevoir un email de confirmation. </span>\" type=\"hidden\"/>";
				alert(document.frm.alertmessage.value);
				

		}
}
	
	
function NewsletterCreate() {

	if(verifyemailnl()){
    
		var urlUserCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=NewsLetterCreate&usrweb_code="+ document.getElementById('usrweb_code_nl').value  +"&usrweb_email=" + document.getElementById('nltxt').value +"&nletter_actif=1";
		//alert(urlUserCreate);
			var req = new Ajax.Request( urlUserCreate, {
			method:'get' ,
			onComplete:function(response) {
				
				var reponseXML = response.responseXML ;
				var erreurList = reponseXML.getElementsByTagName('erreur') ;
				
				if( erreurList.length > 0  ) {
			    
					var erreur = erreurList.item(0) ;
							
					
				document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Vous êtes déjà inscrit(e) à notre newsletter. Vous allez recevoir nos prochaines communications.</span>\" type=\"hidden\"/>";
				 alert(document.frm.alertmessage.value);
					
					
					
					
				} 
								
				else 
				{		
				var urlUserCreate = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendNewsLetterData&usrweb_email=" + document.getElementById('nltxt').value +"&usrweb_code="+ document.getElementById('usrweb_code_nl').value ;
				var req = new Ajax.Request( urlUserCreate, {
				method:'get' ,
				onComplete:function(response) {
					
								evalResponseNL( response );	 
					
				 }
			    });
				
		       }
			
			}
		});
		
	}
}	


/*================================================Forgot Password================================================*/



function verifyemailFp(){	

		var isGood = false ;
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

	    if(document.psw_forgot_form.usrweb_email.value=='' ){
			  
						//alert('Merci de saisir votre email !!!');  
						  document.getElementById('alert_message').style.display='inline';
		    	         document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			 
			
			        	document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Merci de saisir votre email !!!</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
						
						
						
						document.psw_forgot_form.usrweb_email.select();
						 isGood = false ;
		 }
		 else if(!emailReg.test(document.psw_forgot_form.usrweb_email.value)) {
			 
	         // alert('Veuillez saisir un email valid.');
			  
			    document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Veuillez saisir un email valid.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
			  
			  document.psw_forgot_form.usrweb_email.select();
			  isGood = false ;
			   
	     }
		 else{isGood = true ;}
		 return isGood;

	}
	
function ForgotPassword(){
	
			 if(verifyemailFp()){	
			 
	            var urlPwdForgot = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMailForgotPassword&userMail=" + document.psw_forgot_form.usrweb_email.value ;
				var req = new Ajax.Request( urlPwdForgot, {
				method:'get' ,
				onComplete:function(response) {
					
				  	 var reponseXML = response.responseXML ;
					 var erreurList = reponseXML.getElementsByTagName('erreur') ;
					
					 if( erreurList.length > 0  ) {
				
							var erreur = erreurList.item(0) ;
							
							//alert('Aucun utilisateur avec cet email n\'a été trouvé, veuillez réessayer') ;
							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Cette adresse email ne correspond pas à un compte client. Veuillez ressaisir votre adresse email.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
							
					 } 
				
					 else{
							
							//alert(urlPwdForgot);  
					        //document.location='/Web/pages/WPage.jsp?alias=confirm.forget.pwd';
							//$('psw-forgot-form').submit();
							
							document.getElementById('alert_message').style.display='inline';
		    				document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    			document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Un email contenant votre mot de passe a été envoyé dans votre boite email.</span>\" type=\"hidden\"/>";
				            alert(document.frm.alertmessage.value);

							
							
							
						}
					   
				   }
					
				
			   });
		 }
	}


function displayblocprdt(){
	  
	  if(document.getElementById('footerprdt').style.display=='none'){
		  	 
		 
		 	 document.getElementById('footerprdt').style.display='inline';
			 document.getElementById('pink_text').innerHTML='Toute notre offre accessible facilement :&#160;&#160;&#160;&#160;&#160;&#160;voir tout  <img src="../../images/arrow_1.jpg"  border="0" align="absmiddle" onclick="displayblocprdt()" class="pointer_img" />';
			 
			 
	   }else{
		  
		     document.getElementById('footerprdt').style.display='none';
			 document.getElementById('pink_text').innerHTML='Toute notre offre accessible facilement :&#160;&#160;&#160;&#160;&#160;&#160;voir tout  <img src="../../images/arrow_2.jpg"  border="0" align="absmiddle" onclick="displayblocprdt()" class="pointer_img" />';
			 
		   }
	
	}




function send_idees()
{
 
    
 
 	var message_idees=document.getElementById('message_idees').value;
	if(message_idees==""){
		
							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Merci de saisir votre texte.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
		}
	else{
		var urlsend_idees = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMail" ;
	
	
		urlsend_idees = urlsend_idees + "&mailSender=no-reply@imagin-jouets.com";
		var mailTitle = "Un client a soumis des idées via le site Internet";
	
		urlsend_idees = urlsend_idees + "&mailTitle=" + mailTitle ;
		urlsend_idees = urlsend_idees + "&mailTo=commercial" ;
	
		var mailContenu = message_idees ;
		
	
	
		urlsend_idees = urlsend_idees + "&mailMessage=" + mailContenu  ;
  
   // alert (urlDesabonMail);
	
    var req = new Ajax.Request( urlsend_idees, {
        method:'get' ,
        onComplete:function(response) {
		
			evalResponseSend_idees( response )

        }
    });
		
	}
}	
	
function evalResponseSend_idees( response ) {
	
     var reponseXML = response.responseXML ;
	 var erreurList = reponseXML.getElementsByTagName('erreur') ;
	
	 if( erreurList.length > 0  ) {

			var erreur = erreurList.item(0) ;
			 				  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>"+erreur.firstChild.nodeValue+"</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
			 
			
	 } 

	 else{
		
		 	//alert('Aucun utilisateur avec cet email n\'a été trouvé, veuillez réessayer') ;
							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button' />";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Merci pour vos idées, nous allons les étudier avec intérêt.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
		 	
			
			 //alert("F\u00e9licitation, vous êtes maintenant d\u00e9sabonn\u00e9 de notre NewsLetter.");
			
		}
}


//Message rempli sur le formulaire de contact
function sendMsgContact(){
	   var MsgContact = getAdresseSite() + "Web/pages/WUtils.jsp?name=SendMail" ;
	
	
		MsgContact = MsgContact + "&mailSender=no-reply@imagin-jouets.com";
		var mailTitle = "ColInternet :  Formulaire contact";
	
		MsgContact = MsgContact + "&mailTitle=" + mailTitle ;
		MsgContact = MsgContact + "&mailTo=commercial" ;
	
		var mailContenu = 'Objet = ' + document.getElementById('id_contact').value + '%0A' +
		'Adresse email = ' + document.getElementById('email').value + '%0A' +
		'Commentaires = ' + document.getElementById('message').value + '%0A' ;

		MsgContact = MsgContact + "&mailMessage=" + mailContenu  ;
  
   // alert (urlDesabonMail);
	
    var req = new Ajax.Request( MsgContact, {
        method:'get' ,
        onComplete:function(response) {
		
			 				  document.getElementById('alert_message').style.display='inline';
							  document.getElementById('id_contact').value="";
							  document.getElementById('email').value="";
							  document.getElementById('message').value ="";
		    				  document.getElementById('alert_message').innerHTML="<span></span> <input value='OK' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'/>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Votre demande est bien été envoyé, nous allons l\'étudier avec intérêt.</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);

        }
    });
	
	
	}
