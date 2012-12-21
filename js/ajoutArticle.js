function ajoutArticle( formId ) {
    

	
 	var artCode = document.getElementById( formId + '-article_code').value;
	var artQte = parseInt(document.getElementById( formId + '-article_qte').value);	
	var artColisage = parseInt(document.getElementById( formId + '-colisage').value);	
	var artSousColisage = parseInt(document.getElementById( formId + '-art_sous_colisage').value);	
	var artRav = parseInt(document.getElementById( formId  + '-artqt_rav').value);
	var artQteDispo = parseInt(document.getElementById( formId  + '-artqt_dispo').value);
	var artQteArrivage = parseInt(document.getElementById( formId  + '-artqt_arrivage').value);
	var artqtRsvLocal = parseInt(document.getElementById( formId  + '-artqt_rsv_local').value);
	var artQteDispoMax = artRav - artqtRsvLocal ;
	  
	 var artqtetotal=artQte;
    
							
			var artImage = document.getElementById( formId + '-artImage').value;
			var artLibelle = document.getElementById(formId + '-artLibelle').value;
			
		// putArticle( artCode, artqtetotal,artImage,artLibelle ) ;
		// Cas de figure n° 1 blocage d'ajout au panier artQteMax>0 || artQteDispoMax<artColisage
		if(artQteDispoMax <= 0)
			{	
	
			  document.getElementById('alert_message').style.display='inline';
		    	
			 document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			 
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Nous sommes désolé, cet article n'est plus disponible à la vente, les derniéres pièces disponibles ont été  commandées, veuillez nous en excuser.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
	
   			}
 
	   else{
		   
			if(artqtetotal > artQteDispoMax )
				{
				
						var Valdivqtedisp= parseInt(artQteDispoMax/artColisage) ;
			            var qtedispofinal  = (Valdivqtedisp * artColisage);
					
					
					document.getElementById('alert_message').style.display='inline';
					document.getElementById( formId + '-article_qte').value=artQteDispoMax;
					document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
						 
					document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>La quantité demandée est supérieur au stock disponible en entrepôt. Vous pouvez commander "+artQteDispoMax+" pièces maximum.</span>\" type=\"hidden\"/>";
							
					alert(document.frm.alertmessage.value);
 				   //putArticle( artCode, artQteDispoMax ) ;	
			   	 
				 }
	    	  else
 				{		
					 putArticle( artCode, artqtetotal,artImage,artLibelle ) ;
				 }
 
       }
			
				
	
}



function devenir_membre_club()
	{	
	
	 var urlClientSetMembreClub = getAdresseSite() + "Web/pages/WUtils.jsp?name=ClientSetMembreClub&cli_type_code=CLUB" ;
	
	 var req = new Ajax.Request( urlClientSetMembreClub, {
        method:'get' ,
        onComplete:function(response) {
			
		     evalresponseClientSetMembreClub(response);
			 //self.location.href='/Web/?alias=accueil'  ;
			
        }
    });
	
	
	}

function evalresponseClientSetMembreClub( response ) {
    var reponseXML = response.responseXML ;
    var erreurList = reponseXML.getElementsByTagName('erreur') ;
    if( erreurList.length > 0  ) {
        var erreur = erreurList.item(0) ;
        alert(erreur.firstChild.nodeValue) ;
    } else  {
		  alert('Félicitations, vous êtes maintenant membre de club ');
          
    }
   self.location.href='/Web/?alias=accueil';
}




function ajout(artCode) {
    putArticle( artCode, 1 ) ;
}


function putArticle( artCode, artQte,artImage,artLibelle ) {
    var urlPutArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=PutArticle&artCode=" + artCode + "&artQte=" + artQte ;
	
	// alert (urlPutArticle);
	
	var page_alias=document.getElementById('page_alias').value;
	
		
	
    var req = new Ajax.Request( urlPutArticle, {
        method:'get' ,
        onComplete:function(response) {
          
/*document.getElementById('alert_message').style.display='inline';
document.getElementById('alert_message').innerHTML="<div class='alertbtns_grey'><span></span><div class='btn_style_right'><a href='/Web/?alias=cde.detail'  class='ui-corner-bottom ui-btn ui-btn-corner-all ui-shadow ui-btn-up-c' data-wrapperels='span' data-inline='false' data-iconshadow='true' data-shadow='true' data-corners='true' data-role='button'  data-theme='c'  onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" >Voir mon panier</a></div><div class='btn_style_left'><a href='"+page_alias+"'  class='ui-btn ui-btn-corner-all ui-shadow ui-btn-up-b' data-wrapperels='span' data-inline='false' data-iconshadow='true' data-shadow='true' data-corners='true' data-role='button'  data-theme='b'  onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" >Poursuivre mes achats</a></div></div>";
document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'><img align='absmiddle' width='78' hspace='12' height='78' src='http://88.190.22.228/images/paniers/small/shopping-basket-validate.png'/> Cet article a bien été ajouté à votre panier</span><br/> <strong>"+artLibelle+"\"</strong> type=\"hidden\"/>";
alert(document.frm.alertmessage.value);*/
 self.location.href='/Web/?alias=main#/Web/?alias=cde.detail';


        }
    });
}

function enleveArticle(artCode) {
    delArticle( artCode, 0 ) ;
	
}


function delArticle( artCode, artQte ) {
	
    var delArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=PutArticle&artCode=" + artCode + "&artQte=" + artQte ;
	//alert(delArticle);
    var req = new Ajax.Request( delArticle, {
        method:'get' ,
        onComplete:function(response) {
			//alert('ici');
 		 // document.location.href='/Web/?alias=main#/Web/?alias=cde.detail';
		  window.location.reload();
			
        }
    });
}




 
function positiveNumber(formId){
	
		var artQte = parseInt(document.getElementById(formId + '-article_qte').value);	
		
		if(artQte<=0 || isNaN(document.getElementById(formId + '-article_qte').value)){
			document.getElementById(formId + '-article_qte').value=1;
		 }
		 
}



function sendmailclt(formId){
	
 
	//var page_alias =$F('page') ;
	var article =document.getElementById( formId + '-article_code').value ;
	var user_web_code =document.getElementById('user_web_code').value ;
	
	//alert('Votre demande a bien été prise en compte.');	

	
	var urlArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=WArticleEntreeInfoCreate&artent_lien_code_article=" + article+'&artent_email='+user_web_code  ;
	
//alert(urlArticle);
    var req = new Ajax.Request( urlArticle, {
        method:'get' ,
        onComplete:function(response) {
			
		document.getElementById('alert_message').style.display='inline';
		document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
		document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Votre demande a bien été prise en compte.</span>\" type=\"hidden\"/>";
		alert(document.frm.alertmessage.value);
		
        }
    });
}

function sendmailclt_(formId){
	var article = document.getElementById( formId + '-article_code').value ;
	var art_img = document.getElementById(formId + '-artImage').value ;
	var art_libelle =document.getElementById(formId + '-artLibelle').value ;
	
	window.open('/Web/?alias=inform_me&img='+art_img+'&libelle='+art_libelle+'&artcode='+article,'','width=355,height=400,status=no,resizable=no,toolbar=no,menubar=no' );
	
}		

function sendmailcltano(formId){
	
 
 if(verifyemailArtDispo()){
 
	//var page_alias =$F('page') ;
	var article =document.getElementById( formId + '-article_code').value;
	var user_web_code =document.getElementById('user_web_code').value;
	
	alert('Votre demande a bien été prise en compte.');	
	
	var urlArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=WArticleEntreeInfoCreate&artent_lien_code_article=" + article+'&artent_email='+user_web_code  ;
	
	
 
    var req = new Ajax.Request( urlArticle, {
        method:'get' ,
        onComplete:function(response) {
			
		  self.close();
			
        }
    });
	
 }
}
function verifyemailArtDispo(){	

		var isGood = false ;
		var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

	    if(document.getElementById('user_web_code').value=='' ){
			  
						alert('Merci de saisir votre email !!!');  
						$('usrweb_email_nl').select();
						 isGood = false ;
		 }
		 else if(!emailReg.test(document.getElementById('user_web_code').value)) {
			 
	          alert('Veuillez saisir un email valid.');
			  // alert(document.newleter.usrweb_email.value);
			  document.getElementById('user_web_code').select();
			  isGood = false ;
			   
	     }
		 else{isGood = true ;}
		 return isGood;

	}
function afficheInfo(){
	
		if(document.getElementById('detailart').style.display=='block'){
				document.getElementById('detailart').style.display='none';
				document.getElementById('plusinfoart').innerHTML='<div id="imprim"><a href="#" onclick="printdiv(\'mondiv2\');" ><img src="../../images/imprim.jpg" width="97" height="15" /></a></div><img src="../../images/plus.jpg" width="21" height="20" align="absmiddle" />En savoir plus sur ce produit';
		 }else{
				 document.getElementById('plusinfoart').innerHTML='<div id="imprim"><a href="#" onclick="printdiv(\'mondiv2\');" ><img src="../../images/imprim.jpg" width="97" height="15" /></a></div><img src="../../images/moins.jpg" width="21" height="20" align="absmiddle" />En savoir plus sur ce produit';
				 document.getElementById('detailart').style.display='block';
			 
			 }
	
	}	

<!--================================================Delete Cde Non Validated=========================================================-->	
function delCmdNoValidated(stocdecode){
  
    var urlCdeDelete = getAdresseSite() + "Web/pages/WUtils.jsp?name=CdeSuppNonValidated&stocdecode="+stocdecode;
	//alert(urlCdeDelete);
    var req = new Ajax.Request( urlCdeDelete, {
        method:'get' ,
        onComplete:function(response) {
			
           		
						    var reponseXML = response.responseXML ;
							var erreurList = reponseXML.getElementsByTagName('erreur') ;
							if( erreurList.length > 0  ) {
								var erreur = erreurList.item(0) ;
								 document.getElementById('alert_message').style.display='inline';
		    				     document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>"+erreur.firstChild.nodeValue+"</span>\" type=\"hidden\"/>";
				
				             alert(document.frm.alertmessage.value);
							}
							else	{
								
							  document.getElementById('alert_message').style.display='inline';
		    				  document.getElementById('alert_message').innerHTML=" <span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.location='/Web/?alias=compte.accueil'; document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			    			  document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>La commande : "+stocdecode+" est supprimé</span>\" type=\"hidden\"/>";
				
				              alert(document.frm.alertmessage.value);
								  

								// document.location='/Web/?alias=compte.accueil';
						    }
  	   
        }
    });
	
	
	}
	
	

	

function validCmdNoValidated(){
	
	  document.getElementById('alert_message').style.display='inline';
		    	
document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			 
document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Impossible de supprimer une commande confirmée .</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);
				
}


<!--Hisorique de commande-->
function cocherTout() {
	
var tab_checkbox =document.getElementsByName('checkbox_t');

for(i=0 ;i<tab_checkbox.length;i++){
	
	tab_checkbox[i].checked=true;
}
	

}

<!--verifier si au minimum un article est coché-->
function verif_cmd_select()
	{
		var tab_checkbox =document.getElementsByName('checkbox_t');
	
		for(i=0 ;i<tab_checkbox.length;i++)
		{
			if(tab_checkbox[i].checked==true)
				return true;

		}
		
     return false;

}


function commander_selection() {
	
	if(!verif_cmd_select())
	
		{
			document.getElementById('alert_message').style.display='inline';
		    document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='Ok' class='butok' onclick=\"document.body.removeChild(gdAlert.overlay);document.getElementById('alert_message').style.display='none';\" type='button'/></div><div class='btn_right_purple'></div></div>";
			 
			
		    document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Veuillez cocher un article</span>\" type=\"hidden\"/>";
				
			alert(document.frm.alertmessage.value);  
		}
	else{
	
	
	
	
	var tab_checkbox =document.getElementsByName('checkbox_t');

	var tab_handle_form =document.getElementsByName('handle_form');
	
	var cmp=0;

	for(i=0 ;i<tab_checkbox.length;i++){
		
	
		if(tab_checkbox[i].checked==true){
		
		
			var artCode = document.getElementById(tab_handle_form[i].value+'-article').value;

			var qte = parseInt( document.getElementById(tab_handle_form[i].value+'-qte').value) ;
			
			var qteDispo = parseInt( document.getElementById(tab_handle_form[i].value+'-dispo').value) ;
			
			if(qte > qteDispo){
				
			
				
			     // alert(document.frm.alertmessage.value);  
			     var urlPutArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=PutArticle&artCode=" + artCode + "&artQte=" + qteDispo  
	        
					cmp=cmp+1;
			 
					//    alert( urlPutArticle ) ;
					var req = new Ajax.Request( urlPutArticle, {
					method:'get' ,
					onComplete:function(response) {
						
						
					}
					});
				
				  
				  //return;
				
				}
				else{
				    var urlPutArticle = getAdresseSite() + "Web/pages/WUtils.jsp?name=PutArticle&artCode=" + artCode + "&artQte=" + qte  
	        
					cmp=cmp+1;
			 
					//    alert( urlPutArticle ) ;
					var req = new Ajax.Request( urlPutArticle, {
					method:'get' ,
					onComplete:function(response) {
						
						
						
					}
					});
					}
				}
    }
	

	
}

}
 