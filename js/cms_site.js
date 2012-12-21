//adresse_site = 'http://192.168.22.215/' ;



function getAdresseSite() {
    var url=document.location.href;
    var adresseSite = url.substring(0,url.indexOf("/",7)) + "/";
    return  adresseSite ;
}


  
    //function quand l user n est pas authentifié
  
  function user_notlogged(){
	          document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style' align=center><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" type='button'  /></div><div class='btn_right_purple'></div></div>";
			 
			
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>Accès ou fonction réservés aux personnes disposant d'identifiants de connexion. Si vous n'êtes pas encore client et que vous souhaitez le devenir, utilisez le lien « Créer un nouveau compte » situé dans l'en-tête du site pour en faire la demande.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);  
	  
	  
	  }