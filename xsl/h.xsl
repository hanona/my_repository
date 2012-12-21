<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--/*  import commun index box authentification*/-->
  <xsl:import href="../xsl/commun_back.xsl"/>
  
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">

<html>  
      <head>
        <meta http-equiv="MSThemeCompatible" content="No"/>
        <title>
          
		   <xsl:value-of select="root/cpage/page_titre"/>
        </title> 
 
        
   
  <!--Css Upload File-->
        <link rel="stylesheet" href="/css/bootstrap.min.css" />   
        <link rel="stylesheet" href="/css/jquery.fileupload-ui.css" />
         <!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
        <link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-responsive.min.css"/>
        
        <!-- Bootstrap CSS fixes for IE6 -->
        <!--[if lt IE 7]><link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-ie6.min.css"><![endif]-->
        <!-- Bootstrap Image Gallery styles -->
        <link rel="stylesheet" href="http://blueimp.github.com/Bootstrap-Image-Gallery/css/bootstrap-image-gallery.min.css"/>
        <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
        <link rel="stylesheet" href="/css/jquery.fileupload-ui.css"/>
        <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <!--Css Upload File-->       
      
   	    <script src="/js/TableFilter/tablefilter_all.js"></script>
   		<link rel="stylesheet" href="/js/TableFilter/filtergrid.css" type="text/css" media="screen" />
  		<meta name="description" content="" />

        <!--/*  import header commun index (fichier javascript)*/-->
        <xsl:copy-of select="$headerCommun" />
        <script language="javascript" src="/js/GestionTicket.js"></script>
        <!--<script language="javascript" src="/js/jquery.js"></script> -->
          
          
        <!--scriptDownload--> 
 		<link href="/css/facebox.css" media="screen" rel="stylesheet" type="text/css"/>	
		<link rel="stylesheet" type="text/css" href="/css/lightwindow.css" />
		<script src="/js/facebox.js" type="text/javascript"></script>
		
		<link href="/css/downloadr.css" media="screen" rel="stylesheet" type="text/css"/>

		<script src="/js/jqbrowser.js" type="text/javascript"></script>
		<script src="/js/downloadr.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/effects.js"></script>
		<script type="text/javascript" src="/js/lightwindow.js"></script>        
		<script type="text/javascript" src="/js/scriptaculous.js"></script>
        
        <script type="text/javascript">
			$(document).ready(function() {

			  $('a[rel*=downloadr]').downloadr();
			  
			})
		 
		</script>	
        
               <!--scriptDownload--> 
      </head>
     <body>
     
<xsl:copy-of select="$alertmessage" />

<!--/*  debut body de la page /-->
  <div id="main">
 
      
      <!--HEADER-->
      	<xsl:copy-of select="$siteHeader" />
      <!--HEADER-->
      



<!--************************************Body Type 1****fam-Sfa**********************************-->  
  	<xsl:if test="$logged ='false'">
     <script language="javascript"  >
                             document.location=("?alias=identification");
      </script>
    
    </xsl:if>
  
  <xsl:if test="$current_page_alias='ajout_ticket'">
  
          <script src="/js/jquery_002.js" type="text/javascript"></script>
          
 
 <script language="javascript">
 	$(document).ready(function()
	{
		makeSublist('select_produit','select_version', false, '1');	
		makeSublist('select_produit','select_module', false, '');	
	});	

 </script>



  
  <div id="container">
	
        <div id="content">
        	<div class="big_green_title bold">Ajouter un nouveau ticket</div>  
            <xsl:variable name="p_num_ticket">
          <xsl:copy-of select="$current_cli_code" />/<xsl:value-of select="/root/fiche_client/client/cli_num_app" />
          
          </xsl:variable>
           <xsl:variable name="FolderName">
          <xsl:copy-of select="$current_cli_code" /><xsl:value-of select="/root/fiche_client/client/cli_num_app" />
          
          </xsl:variable>
          
        	<xsl:variable name="p_clis">
         	 <xsl:copy-of select="$current_cli_code" />/<xsl:value-of select="/root/suivi_compteur/compteur/com_compteur + 1" />
           </xsl:variable>
        	<br />
          <form  method="post" target="uploadFrame" action="" onSubmit="" id="myForm" class="formular">
        
            <input type="hidden" value="add" name="pagealias" id="pagealias" />
          	<input id ="p_num_ticket" name="p_num_ticket" type="hidden" value="{$p_num_ticket}"/>
         	<input id ="FolderName" name="FolderName" type="hidden" value="{$FolderName}"/>
            <input id ="P_CLIS" name="P_CLIS" type="hidden" value="{$p_clis}"/>
            <input id ="param_function" name="param_function" type="hidden" value="add"/>
            <input id ="p_mail" name="p_mail" type="hidden" value=""/>
            <input id ="p_interloc_tel" name="p_interloc_tel" type="hidden" value=""/>
          
             <div id="search">
           <table width="658" height="457" border="0" align="center" cellpadding="0" cellspacing="5" class="grey_border">
		   <tr>
		    <td width="83" height="36" valign="middle"><strong>Utilisateur</strong></td>
		    <td colspan="8" valign="middle">
		      
		      
		      <select name="select_user" id="select_user"  class="validate[required]">
		        <option value="">Chercher un utilisateur</option>
		        <xsl:for-each select="/root/fiche_client_contact/client_contact">
		          <option id="{clict_nom}" value="{clict_nom}" ><xsl:value-of select="clict_nom" /></option>
		          
		          
		          </xsl:for-each>
		        
		        </select>
             </td>
		  </tr>
		  <tr>
		    <td height="32" valign="middle"><strong>Produit</strong></td>
		    <td colspan="8" valign="middle">
		      <select name="select_produit" id="select_produit" class="validate[required]">
		        <option>choix produit</option>
		        <xsl:for-each select="/root/liste_produit/produit">
		          <option value="{prod_code}" ><xsl:value-of select="prod_lib" /></option>
		          
		          
		          </xsl:for-each>
		        </select></td>
		  </tr>
		  <tr>
		    <td height="36" valign="middle"><strong>Version</strong></td>
		    <td colspan="8" valign="middle">
		      <select name="select_version" id="select_version" class="validate[required]">
		        <xsl:for-each select="/root/liste_version/version">
		          <option  value="{ver1_code}" class="sub_{ver1_produit}"><xsl:value-of select="ver1_lib" /></option>
		          
		          
		          </xsl:for-each>
		        
		        </select></td>
		   </tr>
		  <tr>
		    <td height="35" valign="middle"><strong>Module</strong></td>
		    <td colspan="8" valign="middle">
		      <select name="select_module" id="select_module" class="validate[required]">
		        <xsl:for-each select="/root/liste_module/module">
                                 <xsl:sort select="prod1_lib" data-type="text" order="ascending"/>

		          <option  value="{prod1_code}" class="sub_{prod1_lien_prd}"><xsl:value-of select="prod1_lib" /></option>
		          
		          
		          </xsl:for-each>
		        </select></td>
		    </tr>
			<!--
		  <tr>
		    <td height="37" align="left" valign="middle"><strong>Priorité</strong></td>
		    <td height="37" valign="middle"><input type="radio" name="radio_priorite" id="radio_priorite_l" value="0" checked="checked" /></td>
		    <td valign="middle">Lente</td>
		    <td valign="middle"><input type="radio" name="radio_priorite" id="radio_priorite_n" value="1" /></td>
		    <td valign="middle">Normal</td>
		    <td valign="middle"><input type="radio" name="radio_priorite" id="radio_priorite_r" value="2" /></td>
		    <td width="72" valign="middle">Rapid</td>
		    <td width="23" valign="middle"><input type="radio" name="radio_priorite" id="radio_priorite_b2" value="3" /></td>
		    <td width="130" valign="middle"> Brulante</td>
		    </tr>
-->		 
		  <tr>
		    <td height="37" align="left" valign="middle"><strong>Objet</strong></td>
		    <td width="38" height="37" valign="middle">
		      <input type="radio" name="radio" id="radio1" value="1" checked="checked" /></td>
		    <td width="117" valign="middle">Demande technique</td>
		    <td width="28" valign="middle"><input type="radio" name="radio" id="radio2" value="2" /></td>
		    <td width="120" valign="middle">Demande commercial</td>
 <td width="28" valign="middle"><input type="radio" name="radio" id="radio3" value="3" /></td>
 <td valign="middle">Autre</td>
 <td valign="middle"></td>
 <td valign="middle"></td>
 </tr>
		  <tr>
		    <td height="40" valign="middle"><strong>Sujet</strong></td>
		    <td colspan="8" valign="middle"><input type="text" name="sujet_tiket" id="sujet_tiket" maxlength="100" size="80" class="validate[required],custom[noSpecialCaracters]]"/></td>
		    </tr>
		  <tr>
		    <td height="42" valign="middle"><strong>Descriptif</strong></td>
		    <td colspan="8" valign="middle"><textarea name="textarea" id="desc_ticket" cols="45" rows="5" class="validate[required],custom[noSpecialCaracters]] widgEditor"></textarea></td>
		    </tr>
		  <tr>
		    <td height="47" valign="middle"></td>
		    <td colspan="8" valign="middle">
                   
		      </td>
		    </tr>
		  <tr>
		    <td height="60" valign="middle">
              
		        </td>
		    <td colspan="4" align="right" valign="middle">
            
 

             <div class="btn_style_left">
             
		        <div class="btn_left_rouge"></div>
		        <div class="btn_buttom_rouge">
		          <input class="btn_buttom_input_rouge" id="submitID" name="submit" width="27" type="button" height="23" onclick="history.back();" value="Annuler" />
		          </div>
		        <div class="btn_right_rouge"></div>
	          </div>
            

		      </td>
		    <td colspan="4" align="right" valign="middle"><div class="btn_style_right">
		      <div class="btn_left_vert"></div>
		      <div class="btn_buttom_vert">
		        <input class="btn_buttom_input_vert" id="submitID" name="submit" width="27" type="submit" height="23" value="Valider" />
		        </div>
		      <div class="btn_right_vert"></div>
		      </div></td>
		    </tr>
      </table>
             </div>
      	  </form>
          
            <!--Upload File form-->
            
            <br />
			<br />

            <p class="peicejoi"><b>Joindre des fichiers</b> </p>
           <form id="fileupload" action="UploadServlet?NumTicket={$p_num_ticket}&amp;FolderName={$FolderName}&amp;P_CLIS={$p_clis}" method="POST" enctype="multipart/form-data">
               
               <xsl:copy-of select="$uploadFile" />
               
               
            </form>
		   <!--Upload File form-->
		      
          <xsl:copy-of select="$script_uploadFile" />
    
      
          <div id="CreateTicket-error-message" ></div>
          
        </div>
        <div id="separation"></div>
	</div>
  
  
  </xsl:if>
    
   <xsl:if test="$current_page_alias='suivie_tickets'">
  
  <div id="container">

        <div id="content">
<!--        	Notre assistance technique est dédiée aux problèmes liés à nos produits et aux questions sur notre service.
        	<br />
        	  Nos horaires d'ouverture sont du Lundi au Vendredi, <span class="bold">de 8h00 à 18h00</span>. <br />
        	  <br />
        	  <br />-->
       	  <div class="big_orange_title left">Avant d'envoyer un ticket support, avez-vous consulté nos aides et informations en ligne ?</div>
    <div id="icones">
    
    
  				<div class="icon" id="update">              
                 <input type="button" class="btn_update" onclick="UpdateTicket();" id="bouton_compte_1" />
                <a href="#">Modifier</a></div>
                    
    
                <div class="icon" id="add"><a href="?alias=ajout_ticket"><img src="../../images/icon_add.png" width="28" height="30" border="0" />Ajouter </a></div>
                
                <div class="icon" id="open">              
                 <input type="button" class="btn_ouvrire" onclick="OuvrireTicket();" id="bouton_compte" />
                <a href="#">Ouvrir</a></div>

                <div class="icon" id="close">
                <input type="button" class="btn_cloture" onclick="CloturerTicket();" id="bouton_compte_2" />
                <a href="#">Clôturer</a></div>
</div>
             <br /><br /><br /> 
             <form action="">      	  
            	 
                <table class="table-style" id="liste_ticket">
				 
                <thead>
                <tr>
                <td width="13%">Numero de ticket</td>
                <td width="12%">Date d'ouverture</td>
                <td width="18%">Etat</td>
				<!-- 
                <td width="18%">Priorité</td>
				/>-->
                <td width="17%">Produit</td>
                <td width="22%">Titre</td>
                <td width="9%">Réponses</td>
                <td width="8%"></td>
                <td width="8%"></td>
                </tr>
                </thead>
                <tbody>
                <xsl:for-each select="/root/liste_tickets/ticket">
                     <xsl:sort select="tksv_seq" order="descending" data-type="number" />
		
		<xsl:variable name="var_class">
            
            <xsl:if test="tksv_priorite = 0">
           	bg_wi
            </xsl:if>
            <xsl:if test="tksv_priorite = 1">
           	bg_bl
            </xsl:if>
            
            <xsl:if test="tksv_priorite = 2">
           	bg_ver
            </xsl:if>
            
            <xsl:if test="tksv_priorite = 3">
           	bg_red
            </xsl:if>
            </xsl:variable>
<!--
<tr class="{$var_class}"> -->

                <tr>
                <td> <span class="bold">
                
             <xsl:value-of select="tksv_code" /></span>
				
				
				</td>
                <td>
                
                <xsl:variable name="date_norm" select="tksv_date_creat" />
                <xsl:variable name="an" select="substring($date_norm, 1, 4)" />

				<xsl:variable name="mois" select="substring($date_norm, 6, 2)" />

				<xsl:variable name="jour" select="substring($date_norm, 9, 2)" />
                
           <xsl:copy-of select="$jour" /> / <xsl:copy-of select="$mois" /> / <xsl:copy-of select="$an" />
                
                
                
                </td>
                <td align="center" class="bold"  >
                
                <xsl:if test="tksv_status = 1">
                <span class="red">Clôturé</span>
                </xsl:if>
                <xsl:if test="tksv_status = 0">
                
                <xsl:choose>
                <xsl:when test="tksv_etat = '0'">
                <span class="black">Non traité</span>
                
                </xsl:when>
                <xsl:when test="tksv_etat = '1'">
                
                <span class="green">Traité le <xsl:value-of select="tksv_date_traite" /> par <xsl:value-of select="tksv_usr_traite" /></span>
                </xsl:when>
                <xsl:when test="tksv_etat = '2'">
                
                <span class="green2">En cours</span>
                </xsl:when>
                <xsl:when test="tksv_etat = '3'">
                
                <span class="orange">Sans suite</span>
                </xsl:when>
                <xsl:when test="tksv_etat = '4'">
                
                <span class="orange">Devis à faire Voir avec <xsl:value-of select="tksv_usr_devis" /></span>
                </xsl:when>
                 <xsl:when test="tksv_etat = '5'">
                
                <span class="green">devis réalisé par <xsl:value-of select="tksv_usr_real_devis" /> N°  <xsl:value-of select="tksv_offre" /></span>
                </xsl:when>
                <xsl:otherwise>
                
                </xsl:otherwise>
                </xsl:choose>
                </xsl:if>
                
                </td>
				<!--
                <td align="center" class="bold">
                 <xsl:choose>
                <xsl:when test="tksv_priorite = '0'">
                  <span class="black">Lente</span>
                
                </xsl:when>
                <xsl:when test="tksv_priorite = '1'">
                
                  <span class="black">Normale</span>
                </xsl:when>
                <xsl:when test="tksv_priorite = '2'">
                
                  <span class="black">Rapide</span>
                </xsl:when>
                <xsl:when test="tksv_priorite = '3'">
                
                  <span class="black">Brulante</span>
                </xsl:when>
               
                <xsl:otherwise>
                
                </xsl:otherwise>
                </xsl:choose>
                </td>
				
				-->
                <td>
                <xsl:variable name="tksv_produit" select="tksv_produit" />

                
                <xsl:for-each select="/root/liste_produit/produit">
                    <xsl:if test="$tksv_produit = prod_code">
                     <xsl:value-of select="prod_lib" />
                    </xsl:if>
                </xsl:for-each>
               
                
                
                </td>
                <td><xsl:value-of select="tksv_titre " /></td>
                <td align="center">
                
               <xsl:if test="exist_reponse = ''">
              
               </xsl:if>
                
               <xsl:if test="exist_reponse/reponse != ''">
               	<a href="?alias=liste_reponse&amp;tksv_code={tksv_code}" >Lire les réponses</a>
               </xsl:if>
               
               
               
                
                </td>
                 <td align="center" valign="middle">
<!--                <a href="?alias=info_ticket&amp;tksv_code={tksv_code}">
-->                
		<a href="?alias=info_ticket&amp;tksv_code={tksv_code}" class='lightwindow page-options'>

                <img src="../../images/Info.png" width="22" height="22" border="0" />
                <div align="left" style="font-size:9px;">
                plus d'info...
                </div>
                </a>
                </td>
                <td align="center" valign="middle">
                
                <input type="checkbox" name="checkbox" id="checkbox" value="{tksv_code}" />
                <input type="hidden" name="{tksv_code}-p_mail" id="{tksv_code}-p_mail" value="{tksv_interloc_mail}" />
    <input type="hidden" name="{tksv_code}-p_tksv_code" id="{tksv_code}-p_tksv_code" value="{tksv_code}" />

                </td>
               
                
                
                </tr>
                </xsl:for-each>
                
                </tbody>
                </table>
                			<script language="javascript" type="text/javascript">  

//<![CDATA[  
  var table10_Props = {  
  					
                    paging: true,  
					col_2: "select",
					col_3: "select",
                    paging_length: 10,  
                    results_per_page: ['lignes par page',[10,20,30]],  
					display_all_text: " Tout voir ",
                    rows_counter: true,  
                    rows_counter_text: "Nb Ticket : ",  
                    btn_reset: true,  
                    btn_next_page_html: '<a href="javascript:;" style="margin:3px;">Suivant ></a>',  
                    btn_prev_page_html: '<a href="javascript:;" style="margin:3px;">< précédent</a>',  
                    btn_last_page_html: '<a href="javascript:;" style="margin:3px;"> Dernier >|</a>',  
                    btn_first_page_html: '<a href="javascript:;" style="margin:3px;"><| Premier</a>'
                    
                };  
    var tf10 = setFilterGrid( "liste_ticket",table10_Props );  
	
	//]]>  
</script>
                
                
            
             </form>
         </div>
         <div id="separation"></div>
	</div>
  
  <script language="javascript">
//<![CDATA[ 
$(document).ready(function() {

	$("#bouton_compte_2").click(function(){
	//alert(verif_cloture_select());
	    if(!verif_cloture_select()){
			document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			 
			
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>veuillez cocher au minimum un ticket !!!!.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);  
			}
		else
		{
		    var n = $(" input:checked").length;
			var compt = new Number(900 * n);
			
			$.blockUI({ css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff',
			height : '30%' 
			
			} }); 
			
			
			setTimeout(function(){
				$.unblockUI;
				self.location.href='/Web/pages/WPage.jsp?alias=suivie_tickets';
		   },compt);
		} 
		
		
	});
	
		 
	$("#bouton_compte").click(function(){
	//alert(verif_cloture_select());
	    if(!verif_cloture_select()){
			document.getElementById('alert_message').style.display='inline';
		    	document.getElementById('alert_message').innerHTML="<span></span><div class='btn_style_right'><div class='btn_left_purple'></div><div class='btn_buttom_purple'><input class='btn_buttom_input_purple' value='OK' type='button' onclick=\"document.body.removeChild(gdAlert.overlay); document.getElementById('alert_message').style.display='none';\" /></div><div class='btn_right_purple'></div></div>";
			 
			
				document.getElementById('message2').innerHTML="<input style=\"width: 400px;\" name=\"alertmessage\" id=\"message\" value=\"<span class='msgart'>veuillez cocher au minimum un ticket !!!!.</span>\" type=\"hidden\"/>";
				
				alert(document.frm.alertmessage.value);  
			}
		else
		{
		    var n = $(" input:checked").length;
			var compt = new Number(900 * n);
			
			$.blockUI({ css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff',
			height : '25%' 
			
			} }); 
			
			
			setTimeout(function(){
				$.unblockUI;
				self.location.href='/Web/pages/WPage.jsp?alias=suivie_tickets';
		   },compt);
		} 
		
		
	});
	
		 
		 
			 
		 
	
	
});
//]]>  
</script>	
  </xsl:if>  
    
      
   <xsl:if test="$current_page_alias='liste_reponse'">
   
     
  <div id="container">
  

     
     <div id="back_reponse">
		<!--     
     bloc file--> 
     <div class="btn_left_gris"></div>
    <div class="btn_buttom_gris"> <input class="btn_buttom_input_gris" id="submitID" name="submit" width="27" type="button" height="23" onclick="history.back();" value="Retour" /></div>
     <div class="btn_right_gris"></div>
     <div class="big red left"> Code ticket : <xsl:value-of select="$current_tksv_code" /></div>
     
          <div class="vers left"> <span class="bold">Produit : </span> 
     <xsl:for-each select="/root/liste_produit/produit">
            <xsl:if test="prod_code =/root/ticket_suivi/ticket_suivi/tksv_produit">  
      <xsl:value-of select="prod_lib" /> 
      </xsl:if>
      </xsl:for-each>
      
      <span class="bold"> - Version : </span> <xsl:for-each select="/root/liste_version/version">
                <xsl:if test="ver1_code =/root/ticket_suivi/ticket_suivi/tksv_version and  ver1_produit= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
            
       		
       <xsl:value-of select="ver1_lib" />
            </xsl:if>
            </xsl:for-each> 
      
      
      <span class="bold"> - Module : </span>   <xsl:for-each select="/root/liste_module/module">
                <xsl:if test="prod1_code =/root/ticket_suivi/ticket_suivi/tksv_module and  prod1_lien_prd= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
            
       <xsl:value-of select="prod1_lib" />
            </xsl:if>
            </xsl:for-each> </div>
     
      <xsl:for-each select="/root/ticket_suivi/ticket_suivi" >
     <xsl:if test="tksv_code =$current_tksv_code">
             <xsl:if test="tksv_status !=1">
                          <div id="close" class="icon right">
                          
                 <input id="bouton_compte" class="btn_cloture" type="button" onclick="Cloturer('{$current_tksv_code}')" /><a href="#">Clôturer</a>
             </div>
<br /><br /><br /><br />
             </xsl:if> 
        </xsl:if>
     </xsl:for-each>
     
   

		         <div class="big smallcaps" style="margin:0 0 10px 25px;"><xsl:value-of select="/root/ticket_suivi/ticket_suivi/tksv_titre" /></div>
		         
     
     
     <xsl:for-each select="/root/liste_reponse_ticket/reponse_ticket">
    
     <xsl:sort select="clis_seq" order="descending" data-type="number" />
       
     <xsl:variable name="bloc_reponse">
     <xsl:if test="clis_sens = 1">bloc_reponse_client</xsl:if>
     <xsl:if test="clis_sens = 0">bloc_reponse</xsl:if>
     </xsl:variable>
     <div class="{$bloc_reponse}">
     
         
         
        <div class="small grey"> <xsl:variable name="date_norm" select="clis_dte_time " />
                <xsl:variable name="an" select="substring($date_norm, 1, 4)" />

				<xsl:variable name="mois" select="substring($date_norm, 6, 2)" />

				<xsl:variable name="jour" select="substring($date_norm, 9, 2)" />
          <xsl:variable name="heure" select="substring($date_norm, 12, 2)" />
         <xsl:variable name="minute" select="substring($date_norm, 15, 2)" />
          <xsl:variable name="seconde" select="substring($date_norm, 17, 2)" />

         
         <xsl:copy-of select="$jour" /> / <xsl:copy-of select="$mois" /> / <xsl:copy-of select="$an" /> à <xsl:copy-of select="$heure" /> heure <xsl:copy-of select="$minute" /> minute 
         
         
         -- <xsl:value-of select="clis_descriptif" />  </div>
 <br />
  <xsl:if  test="clis_usr_traite !=''">
     <span class="bold">Utilisateur Traité : </span><xsl:value-of select="clis_usr_traite" /><br />
     </xsl:if>
     <xsl:if  test="clis_operation !=''">
     <span class="bold">Réponse  : </span><xsl:value-of select="clis_operation" /><br />
     </xsl:if>
      <xsl:if  test="clis_descriptif !=''">
     <span class="bold">Descriptif : </span><xsl:value-of select="clis_descriptif" /><br />
     </xsl:if>
      
      <xsl:if  test="clis_rmq !=''">
     <span class="bold">Remarque : </span><xsl:value-of select="clis_rmq" />
     
     </xsl:if>
     <xsl:if test="liste_file_ticket/file_ticket !=''">
     <div class="bold">L'ensemble des fichiers :</div>
    
    
     <table class="table-style TF">
     
  		<thead><tr>
            <td>Date création</td>
            <td>Heure création</td>
            <td>Extension </td>
              <td>Télécharger </td>
  		</tr></thead>
        <xsl:for-each select="liste_file_ticket/file_ticket ">
        <tbody><tr>
        
    			<xsl:variable name="date_norm" select="a_date " />
                <xsl:variable name="an" select="substring($date_norm, 1, 4)" />

				<xsl:variable name="mois" select="substring($date_norm, 6, 2)" />

				<xsl:variable name="jour" select="substring($date_norm, 9, 2)" />
                
         
                
    		<td>  <xsl:copy-of select="$jour" /> / <xsl:copy-of select="$mois" /> / <xsl:copy-of select="$an" /></td>
            <td><xsl:value-of select="a_heure " /></td>
            <td><xsl:value-of select="substring-after(a_pj,'.')" /></td>
   			<td align="center"> 
            <xsl:variable name="folder"> 
     <xsl:value-of select="substring-before($current_tksv_code,'/')" />
     <xsl:value-of select="substring-after($current_tksv_code,'/')" />
     </xsl:variable>
            <p><a href="/COLSUPPORT/images/{$folder}/{a_pj}" rel="downloadr" title="{a_pj}">Télécharger</a></p>

            
            </td>
     </tr></tbody>
     </xsl:for-each>
        
        
</table>
<br />
</xsl:if>
<br />     
     <div align="left">
   
     
                          <div class="btn_style_left">
							<div class="btn_left_orange"></div>
							<div class="btn_buttom_orange">
     <input class="btn_buttom_input_orange" type="button" value="Répondre" onclick="self.location.href='/Web/?alias=send_response_ticket&amp;tksv_code={clis_lien_tkvs}&amp;clis_descriptif={clis_descriptif}'" />
							</div>
							<div class="btn_right_orange"></div>
					  </div>

    <br /> 
     
     </div>
     
     </div>
     
     </xsl:for-each>
          <div class="btn_style_left">
             
		        <div class="btn_left_gris"></div>
		        <div class="btn_buttom_gris">
		          <input class="btn_buttom_input_gris" id="submitID" name="submit" width="27" type="button" height="23" onclick="history.back();" value="Retour" />
		          </div>
		        <div class="btn_right_gris"></div>
	          </div>
              <br />
     </div>


     
     <div id="separation"></div>
	</div>
   
   </xsl:if>
   
   
    <xsl:if test="$current_page_alias='update_ticket'">
       
                 <script src="/js/jquery_002.js" type="text/javascript"></script>
                 <script src="/js/fileuploader.js" type="text/javascript"></script>
    
      <input type="hidden" value="{/root/ticket_suivi/ticket_suivi/tksv_produit}" name="valCodePrt" id="valCodePrt" />
      
    
      
     <script language="javascript">
        $(document).ready(function()
        {
            var codep=document.getElementById('valCodePrt').value;
            makeSublist('select_produit','select_version', false, codep);	
            makeSublist('select_produit','select_module', false, '');	
        });	
    
     </script>
    
    
    
      
      <div id="container">
        
            <div id="content">
                <div class="big_green_title bold">Modification ticket Numero <xsl:copy-of select="$current_tksv_code"/></div>
                <br />
                
              <form  method="post" target="uploadFrame" 
            action="" onSubmit="" id="myForm" class="formular">
            
                <input type="hidden" value="update" name="pagealias" id="pagealias" />
    
              <xsl:variable name="p_num_ticket">
             <xsl:copy-of select="$current_tksv_code"/>
              
              </xsl:variable>
              
              <xsl:variable name="FolderName">
              <xsl:copy-of select="$current_cli_code" />  <xsl:value-of select="substring-after($current_tksv_code,'/')" />
              
              </xsl:variable>
              
              <input id ="FolderName" name="FolderName" type="hidden" value="{$FolderName}"/>
               <input id ="param_function" name="param_function" type="hidden" value="update"/>
              <input id ="p_num_ticket" name="p_num_ticket" type="hidden" value="{$p_num_ticket}"/>
              <!--<table width="670" height="59" border="0" align="center" cellpadding="0" cellspacing="5" class="grey_border">
                <tr>
                  <td height="49" colspan="2" valign="middle"><div class="btn_style_left">
                    <div class="btn_left_gris"></div>
                    <div class="btn_buttom_gris">
                      <input class="btn_buttom_input_gris" id="submitID2" name="submitID" width="27" type="button" height="23" onclick="history.back();" value="Annuler" />
                    </div>
                    <div class="btn_right_gris"></div>
                  </div></td>
                  <td width="324" colspan="6" align="right" valign="middle"><div class="btn_style_right">
                    <div class="btn_left_orange"></div>
                    <div class="btn_buttom_orange">
                      <input class="btn_buttom_input_orange" id="submitID2" name="submitID" width="27" type="submit" height="23"  value="Valider" />
                    </div>
                    <div class="btn_right_orange"></div>
                  </div></td>
                </tr>
              </table>-->
              
                 <div id="search">
                   <table width="712" height="480" border="0" align="center" cellpadding="0" cellspacing="5" class="grey_border">
              <tr>
                <td width="83" height="36" valign="middle"><strong>Utilisateur</strong></td>
                <td colspan="8" valign="middle">
                  
                  
                  
                  <select name="select_user" id="select_user">    
                    
                    
                    
                    
                    
                    <xsl:for-each select="/root/fiche_client_contact/client_contact">
                      
                      <xsl:if test="clict_nom =/root/ticket_suivi/ticket_suivi/tksv_interloc">
                        <option selected="selected" value="{clict_nom}">
                          
                          <xsl:value-of select="clict_nom" />
                          
                          </option> 
                        </xsl:if>
                      <xsl:if test="clict_nom !=/root/ticket_suivi/ticket_suivi/tksv_interloc">
                        <option id="{clict_nom}" value="{clict_nom}" ><xsl:value-of select="clict_nom" /></option>
                        </xsl:if>              
                      </xsl:for-each>
                    
                    </select></td>
              </tr>
              
              <tr>
                <td height="32" valign="middle"><strong>Produit</strong></td>
                <td colspan="8" valign="middle">
                  
                  <xsl:for-each select="/root/liste_produit/produit">
                    <xsl:if test="prod_code =/root/ticket_suivi/ticket_suivi/tksv_produit">  
                      
                      <input type="hidden" value="{prod_code}" id="select_produit" name="select_produit"  />
                      <xsl:value-of select="prod_lib" />
                      </xsl:if>
                    </xsl:for-each>
                  
                  
                  </td>
              </tr>
              <tr>
                <td height="36" valign="middle"><strong>Version</strong></td>
                <td colspan="8" valign="middle">
                  
                  <xsl:for-each select="/root/liste_version/version">
                    <xsl:if test="ver1_code =/root/ticket_suivi/ticket_suivi/tksv_version and  ver1_produit= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
                      
                      <input type="hidden" value="{ver1_code}" id="select_version" name="select_version"  />
                      <xsl:value-of select="ver1_lib" />
                      </xsl:if>
                    </xsl:for-each>
                  
                  </td>
              </tr>
              <tr>
                <td height="35" valign="middle"><strong>Module</strong></td>
                <td colspan="8" valign="middle">
                  
                  
                  <xsl:for-each select="/root/liste_module/module">
                    <xsl:if test="prod1_code =/root/ticket_suivi/ticket_suivi/tksv_module and  prod1_lien_prd= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
                      
                      <input type="hidden" value="{prod1_code}" id="select_module" name="select_module"  />
                      <xsl:value-of select="prod1_lib" />
                      </xsl:if>
                    </xsl:for-each>
                  
                  
                  </td>
              </tr>
              <!--
              <tr>
                <td height="37" align="left" valign="middle"><strong>Priorité</strong></td>
                <td height="37" valign="middle">
                  
                  <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite = 0">
                    <input type="radio" name="radio_priorite" id="radio_priorite_l" value="0" checked="checked" />
                    </xsl:if>
                  <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite != 0">
                    <input type="radio" name="radio_priorite" id="radio_priorite_l" value="0"  />
                    </xsl:if>
                  
                  </td>
                <td valign="middle">Lente</td>
                <td valign="middle">
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite = 1">
                <input type="radio" name="radio_priorite" id="radio_priorite_n" value="1" checked="checked" />
                </xsl:if>
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite != 1">
                <input type="radio" name="radio_priorite" id="radio_priorite_n" value="1" />
                </xsl:if>
                </td>
                <td valign="middle">Normal</td>
                <td valign="middle">
                 <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite = 2">
                <input type="radio" name="radio_priorite" id="radio_priorite_r" value="2" checked="checked" />
                </xsl:if>
                
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite != 2">
                <input type="radio" name="radio_priorite" id="radio_priorite_r" value="2"  />
                </xsl:if>
                
                </td>
                <td width="83" valign="middle">Rapid</td>
                <td width="23" valign="middle"> <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite = 3">
                <input type="radio" name="radio_priorite" id="radio_priorite_b" value="3" checked="checked"  />
                </xsl:if>
                
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_priorite != 3">
                <input type="radio" name="radio_priorite" id="radio_priorite_b" value="3"  />
                </xsl:if></td>
                <td width="132" valign="middle">Brulante</td>
                
                </tr>
              -->
              
              <tr>
                <td height="37" align="left" valign="middle"><strong>Objet</strong></td>
                <td width="49" height="37" valign="middle">
                  <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet = 1">
                    <input type="radio" name="radio" id="radio1" value="1" checked="checked"  />
                    </xsl:if>
                  <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet != 1">
                    <input type="radio" name="radio" id="radio1" value="1" />
                    </xsl:if>
                  
                  
                  </td>
                <td width="95" valign="middle">Demande technique</td>
                <td width="44" valign="middle">
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet =2">
                    <input type="radio" name="radio" id="radio2" value="2" checked="checked" />
                </xsl:if>
                <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet != 2">
                 <input type="radio" name="radio" id="radio2" value="2" />
                </xsl:if>
                
                </td>
                <td width="114" valign="middle">Demande commercial</td>
                <td width="39" valign="middle">
                 <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet = 3">
                    <input type="radio" name="radio" id="radio3" value="3" checked="checked" />
                </xsl:if>
                 <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet != 3">
                    <input type="radio" name="radio" id="radio3" value="3" />
                </xsl:if>
                </td>
                <td colspan="3" valign="middle">Autre</td>
                
              </tr>
              <tr>
                <td height="40" valign="middle"><strong>Sujet</strong></td>
                <td colspan="8" valign="middle"><input type="text" name="sujet_tiket" id="sujet_tiket" value="{/root/ticket_suivi/ticket_suivi/tksv_titre}" maxlength="100" size="80"  class="validate[required],custom[noSpecialCaracters]]"/></td>
              </tr>
              <tr>
                <td height="42" valign="middle"><strong>Descriptif</strong></td>
                <td colspan="8" valign="middle">
                  
                  <textarea name="textarea" id="desc_ticket" cols="45" rows="5" class="validate[required],custom[noSpecialCaracters]] widgEditor">
                   <xsl:copy-of select="/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_operation" />
                </textarea></td>
             
             
                      <input id ="p_cli_seq" name="p_cli_seq" type="hidden" value="{/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_seq}"/>
                 
                       <input id ="P_CLIS" name="P_CLIS" type="hidden" value="{/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_num_appel}"/>
                      
              </tr>
              <tr>
                <td height="47" valign="middle">
    
                </td>
                <td colspan="8" valign="middle">
                  
                  
                  <div id="file-uploader-demo1">		
                    <noscript>			
                      <p>Please enable JavaScript to use file uploader.</p>
                      <!-- or put a simple form for upload here -->
                      </noscript>         
                    </div>
                  
                  
                  
                  
                  <br />
                  </td>
              </tr>
              <tr>
                <td height="60" colspan="9" valign="middle"><xsl:if test="/root/ticket_suivi/ticket_suivi/liste_pj_ticket /pj_ticket  !=''">
    
                <div class="bold">L'ensemble des fichiers :</div>
                
                <table width="100%" class="table-style TF">
                  
                  <thead><tr>
                <td>Date création</td>
                <td>Heure création</td>
                <td>Extension </td>
                <td>Télécharger </td>
                <td>Détruire</td>
            </tr></thead>
            
      
            <xsl:for-each select="/root/ticket_suivi/ticket_suivi/liste_pj_ticket /pj_ticket  ">
            
            <tbody><tr>
            
                    <xsl:variable name="date_norm" select="a_date " />
                    <xsl:variable name="an" select="substring($date_norm, 1, 4)" />
    
                    <xsl:variable name="mois" select="substring($date_norm, 6, 2)" />
    
                    <xsl:variable name="jour" select="substring($date_norm, 9, 2)" />
                    
             
                    
                <td>  <xsl:copy-of select="$jour" /> / <xsl:copy-of select="$mois" /> / <xsl:copy-of select="$an" /></td>
                <td><xsl:value-of select="a_heure " /></td>
                <td><xsl:value-of select="substring-after(a_pj,'.')" /></td>
                <td align="center"> 
                <xsl:variable name="folder"> 
         <xsl:value-of select="substring-before($current_tksv_code,'/')" />
         <xsl:value-of select="substring-after($current_tksv_code,'/')" />
         </xsl:variable>

                <p><a href="/COLSUPPORT/images/{$folder}/{a_pj}" rel="downloadr" title="{a_pj}">Télécharger</a></p>
    
                
                </td>
                <td>
                    <input class="btn_buttom_input_vert" id="sup_pj" name="btn_sup_pj" width="27" type="button" height="23"  value="Détruire" onClick="Delete_PJ('{a_pj}','{$current_tksv_code}','update_ticket');" />
    
                
                </td>
                
                
         </tr></tbody>
         </xsl:for-each>
            
            
    </table>
       </xsl:if></td>
                </tr>
              <tr>
              
              
              
                <td height="60" colspan="8" valign="middle"> <div class="btn_style_left">
                  
                  <div class="btn_left_rouge"></div>
                  <div class="btn_buttom_rouge">
                    <input class="btn_buttom_input_rouge" id="submitID" name="submit" width="27" type="button" height="23" onclick="history.back();" value="Annuler" />
                    </div>
                  <div class="btn_right_rouge"></div>
                  </div>		      </td>
                <td align="right" valign="middle"><div class="btn_style_right">
                  <div class="btn_left_vert"></div>
                  <div class="btn_buttom_vert">
                    <input class="btn_buttom_input_vert" id="submitID" name="submit" width="27" type="submit" height="23"  value="Valider" />
                    </div>
                  <div class="btn_right_vert"></div>
                  </div></td>
                </tr>
          </table>
          </div>
              </form>
    
              
              <div id="CreateTicket-error-message" ></div>
              
            </div>
            <div id="separation"></div>
        </div>
      
      
      </xsl:if>
      
        
   	<xsl:if test="$current_page_alias='send_response_ticket'">
   
   <script src="/js/jquery_002.js" type="text/javascript"></script>
   <script src="/js/fileuploader.js" type="text/javascript"></script>


  <input type="hidden" value="{/root/ticket_suivi/ticket_suivi/tksv_produit}" name="valCodePrt" id="valCodePrt" />
  
 <script language="javascript">
 	$(document).ready(function()
	{
		var codep=document.getElementById('valCodePrt').value;
		makeSublist('select_produit','select_version', false, codep);	
		makeSublist('select_produit','select_module', false, '');	
	});	

 </script>



  
  <div id="container">
	
        <div id="content">
        	<div class="big_green_title bold">Envoyer une réponse du  ticket Numero <xsl:copy-of select="$current_tksv_code"/></div>
        	<br />
            
          <form  method="post" target="" 
		action="" onSubmit="" id="myForm" class="formular">
                        <input type="hidden" value="reponse" name="pagealias" id="pagealias" />

          <xsl:variable name="p_num_ticket">
         <xsl:copy-of select="$current_tksv_code"/>
          
          </xsl:variable>
          
          <xsl:variable name="FolderName">
          <xsl:copy-of select="$current_cli_code" />  <xsl:value-of select="substring-after($current_tksv_code,'/')" />
          
          </xsl:variable>
          
          <xsl:variable name="p_clis">
         	 <xsl:copy-of select="$current_cli_code" />/<xsl:value-of select="/root/suivi_compteur/compteur/com_compteur + 1" />
           </xsl:variable>
           
           
           <input id ="FolderName" name="FolderName" type="hidden" value="{$FolderName}"/>  
           <input id ="p_num_ticket" name="p_num_ticket" type="hidden" value="{$p_num_ticket}"/>
           <input id ="P_CLIS" name="P_CLIS" type="hidden" value="{$p_clis}"/>
           <table width="668" height="59" border="0" align="center" cellpadding="0" cellspacing="5" class="">
             <tr>
               <td height="49" colspan="2" valign="middle">
               <div class="btn_style_left">
<div class="btn_left_rouge"></div>
<div class="btn_buttom_rouge">
<input height="23" width="27" type="button" class="btn_buttom_input_rouge" id="submitID" name="submit" onclick="history.back();" value="Annuler" />
</div>
<div class="btn_right_rouge"></div>
</div>
              </td>
               <td width="379" colspan="3" align="right" valign="middle"><div class="btn_style_right">
                 <div class="btn_left_vert"></div>
                 <div class="btn_buttom_vert">
                   <input class="btn_buttom_input_vert" id="submitID3" name="submitID2" width="27" type="submit" height="23"  value="Valider" />
                 </div>
                 <div class="btn_right_vert"></div>
               </div></td>
             </tr>
           </table>

           
           
             <div id="search">
               <table width="640" height="456" border="0" align="center" cellpadding="0" cellspacing="5" class="grey_border">
		  <tr>
		    <td height="36" valign="middle"></td>
		    <td height="36" valign="middle">Utilisateur</td>
		    <td colspan="3" valign="middle">
            
             <select name="select_user" id="select_user">    
               
               
               
               
               <xsl:for-each select="/root/fiche_client_contact/client_contact">
                 
                 <xsl:if test="clict_nom =/root/ticket_suivi/ticket_suivi/tksv_interloc">
                   <option selected="selected" value="{clict_nom}">
                     
                     <xsl:value-of select="clict_nom" />
                     
                     </option> 
                   </xsl:if>
                 <xsl:if test="clict_nom !=/root/ticket_suivi/ticket_suivi/tksv_interloc">
                   <option id="{clict_nom}" value="{clict_nom}" ><xsl:value-of select="clict_nom" /></option>
                   </xsl:if>              
                 </xsl:for-each>
              
	        </select>
           </td>
	      </tr>
		  <tr>
		    <td height="32" valign="middle"></td>
		    <td height="32" valign="middle">Produit</td>
		    <td colspan="3" valign="middle">
            
            <xsl:for-each select="/root/liste_produit/produit">
                <xsl:if test="prod_code =/root/ticket_suivi/ticket_suivi/tksv_produit">  
            
       <input type="hidden" value="{prod_code}" id="select_produit" name="select_produit"  />
       <xsl:value-of select="prod_lib" />
            </xsl:if>
            </xsl:for-each>
            
            
            </td>
	      </tr>
		  <tr>
		    <td height="36" valign="middle"></td>
		    <td height="36" valign="middle">Version</td>
		    <td colspan="3" valign="middle">
            
            <xsl:for-each select="/root/liste_version/version">
                <xsl:if test="ver1_code =/root/ticket_suivi/ticket_suivi/tksv_version and  ver1_produit= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
            
       			<input type="hidden" value="{ver1_code}" id="select_version" name="select_version"  />
       <xsl:value-of select="ver1_lib" />
            </xsl:if>
            </xsl:for-each>
                
           </td>
	      </tr>
		  <tr>
		    <td height="35" valign="middle"></td>
		    <td height="35" valign="middle">Module</td>
		    <td colspan="3" valign="middle">
            
            
             <xsl:for-each select="/root/liste_module/module">
                <xsl:if test="prod1_code =/root/ticket_suivi/ticket_suivi/tksv_module and  prod1_lien_prd= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
            
       			<input type="hidden" value="{prod1_code}" id="select_module" name="select_module"  />
       <xsl:value-of select="prod1_lib" />
            </xsl:if>
            </xsl:for-each>
                
                
       </td>
	      </tr>

		  <tr>
		    <td height="40" valign="middle"></td>
		    <td height="40" valign="middle">Sujet</td>
		    <td colspan="3" valign="middle"><input type="text" name="sujet_tiket" id="sujet_tiket" value="{$current_clis_descriptif}"  maxlength="100" size="80" class="validate[required],custom[noSpecialCaracters]]" /></td>
	      </tr>
		  <tr>
		    <td height="42" valign="middle"></td>
		    <td height="42" valign="middle">Descriptif</td>
		    <td colspan="3" valign="middle"><textarea name="textarea" id="desc_ticket" cols="45" rows="5" class="validate[required],custom[noSpecialCaracters]] widgEditor">
              
            </textarea></td>
         
         
                  <input id ="p_cli_seq" name="p_cli_seq" type="hidden" value="{/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_seq}"/>
	      </tr>
		  <tr>
		    <td height="47" valign="middle"></td>
		    <td height="47" valign="middle"></td>
		    <td colspan="3" valign="middle">
           
  
  <div id="file-uploader-demo1">		
		<noscript>			
			<p>Please enable JavaScript to use file uploader.</p>
			<!-- or put a simple form for upload here -->
		</noscript>         
	</div>
             
             
             <br />

             <br />
           </td>
	      </tr>
		  <tr>
		    <td height="60" colspan="2" valign="middle"> <div class="btn_style_left">
             
		        <div class="btn_left_rouge"></div>
		        <div class="btn_buttom_rouge">
		          <input class="btn_buttom_input_rouge" id="submitID" name="submit" width="27" type="button" height="23" onclick="history.back();" value="Annuler" />
		          </div>
		        <div class="btn_right_rouge"></div>
	          </div></td>
		    <td colspan="3" align="right" valign="middle">
		      <div class="btn_style_right">
		        <div class="btn_left_vert"></div>
		        <div class="btn_buttom_vert">
                <input class="btn_buttom_input_vert" id="submitID" name="submit" width="27" type="submit" height="23"  value="Valider" />
		          </div>
		        <div class="btn_right_vert"></div>
	          </div>
		      </td>
		    </tr>
      </table>
      </div>
      	  </form>
          
          
         
	
      
 
          
          
          <div id="CreateTicket-error-message" ></div>
          
        </div>
        <div id="separation"></div>
	</div>
  
  
  </xsl:if>
    
      
      
 	 <xsl:if test="$current_page_alias='info_ticket'">
   
             <script src="/js/jquery_002.js" type="text/javascript"></script>
             <script src="/js/fileuploader.js" type="text/javascript"></script>

  <input type="hidden" value="{/root/ticket_suivi/ticket_suivi/tksv_produit}" name="valCodePrt" id="valCodePrt" />
  

  
 <script language="javascript">
 	$(document).ready(function()
	{
		var codep=document.getElementById('valCodePrt').value;
		makeSublist('select_produit','select_version', false, codep);	
		makeSublist('select_produit','select_module', false, '');	
	});	

 </script>



  
  <div id="container">
	
        <div id="content">
        	<div class="big_green_title bold">Information sur le ticket Numero <xsl:copy-of select="$current_tksv_code"/></div>
        	<br />
            
          <form  method="post" target="uploadFrame" 
		action="" onSubmit="" id="myForm" class="formular">
        
            <input type="hidden" value="update" name="pagealias" id="pagealias" />

          <xsl:variable name="p_num_ticket">
         <xsl:copy-of select="$current_tksv_code"/>
          
          </xsl:variable>
          
          <xsl:variable name="FolderName">
          <xsl:copy-of select="$current_cli_code" />  <xsl:value-of select="substring-after($current_tksv_code,'/')" />
          
          </xsl:variable>
          
    
          
             <div id="search">
               <table width="712" height="462" border="0" align="center" cellpadding="0" cellspacing="5" class="grey_border">
		  <tr>
		    <td width="107" height="36" valign="middle"><strong>Utilisateur</strong></td>
		    <td colspan="8" valign="middle">
		      
		      
		       <xsl:value-of select="/root/ticket_suivi/ticket_suivi/tksv_interloc" />
		        
		        </td>
	      </tr>
          
		  <tr>
		    <td height="32" valign="middle"><strong>Produit</strong></td>
		    <td colspan="8" valign="middle">
		      
		      <xsl:for-each select="/root/liste_produit/produit">
		        <xsl:if test="prod_code =/root/ticket_suivi/ticket_suivi/tksv_produit">  
		          
		          <input type="hidden" value="{prod_code}" id="select_produit" name="select_produit"  />
		          <xsl:value-of select="prod_lib" />
		          </xsl:if>
		        </xsl:for-each>
		      
		      
		      </td>
	      </tr>
		  <tr>
		    <td height="36" valign="middle"><strong>Version</strong></td>
		    <td colspan="8" valign="middle">
		      
		      <xsl:for-each select="/root/liste_version/version">
		        <xsl:if test="ver1_code =/root/ticket_suivi/ticket_suivi/tksv_version and  ver1_produit= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
		          
		          <input type="hidden" value="{ver1_code}" id="select_version" name="select_version"  />
		          <xsl:value-of select="ver1_lib" />
		          </xsl:if>
		        </xsl:for-each>
		      
		      </td>
	      </tr>
		  <tr>
		    <td height="15" valign="middle"><strong>Module</strong></td>
		    <td colspan="8" valign="middle">
		      
		      
		      <xsl:for-each select="/root/liste_module/module">
		        <xsl:if test="prod1_code =/root/ticket_suivi/ticket_suivi/tksv_module and  prod1_lien_prd= /root/ticket_suivi/ticket_suivi/tksv_produit ">  
		          
		          <input type="hidden" value="{prod1_code}" id="select_module" name="select_module"  />
		          <xsl:value-of select="prod1_lib" />
		          </xsl:if>
		        </xsl:for-each>
		      
		      
		      </td>
	      </tr>
		  <tr>
		    <td height="15" valign="middle"><strong>Objet</strong></td>
		    <td colspan="8" valign="middle">
            <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet = 1">
		          Demande technique
		          </xsl:if>		          <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet =2">
		          Demande commercial
		          </xsl:if>		          <xsl:if test="/root/ticket_suivi/ticket_suivi/tksv_objet = 3">
		          Autre
		          </xsl:if>
            </td>
  </tr>
		 

		  <tr>
		    <td height="40" valign="middle"><strong>Sujet</strong></td>
		    <td colspan="8" valign="middle">
            <xsl:value-of select="/root/ticket_suivi/ticket_suivi/tksv_titre" />
            
           </td>
	      </tr>
		  <tr>
		    <td height="18" valign="middle"><strong>Descriptif</strong></td>
		    <td colspan="8" valign="middle">
		      
		      
               <xsl:copy-of select="/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_operation" />
            
            
            </td>
         
         
                  <input id ="p_cli_seq" name="p_cli_seq" type="hidden" value="{/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_seq}"/>
             
                   <input id ="P_CLIS" name="P_CLIS" type="hidden" value="{/root/ticket_suivi/ticket_suivi/client_suivi/client_suivi/clis_num_appel}"/>
                  
	      </tr>
		  <tr>
		    <td height="19" colspan="9" valign="middle">
            <br />           
             <xsl:if test="/root/ticket_suivi/ticket_suivi/liste_pj_ticket /pj_ticket  !=''">

            <div class="bold">L'ensemble des fichiers :</div>
            
            <table width="100%" class="table-style TF">
              
              <thead><tr>
            <td>Date création</td>
            <td>Heure création</td>
            <td>Extension </td>
            <td>Télécharger </td>
            <td>Détruire</td>
  		</tr></thead>
        
  
        <xsl:for-each select="/root/ticket_suivi/ticket_suivi/liste_pj_ticket /pj_ticket  ">
        
        <tbody><tr>
        
    			<xsl:variable name="date_norm" select="a_date " />
                <xsl:variable name="an" select="substring($date_norm, 1, 4)" />

				<xsl:variable name="mois" select="substring($date_norm, 6, 2)" />

				<xsl:variable name="jour" select="substring($date_norm, 9, 2)" />
                
         
                
    		<td>  <xsl:copy-of select="$jour" /> / <xsl:copy-of select="$mois" /> / <xsl:copy-of select="$an" /></td>
            <td><xsl:value-of select="a_heure " /></td>
            <td><xsl:value-of select="substring-after(a_pj,'.')" /></td>
   			<td align="center"> 
            <xsl:variable name="folder"> 
     <xsl:value-of select="substring-before($current_tksv_code,'/')" />
     <xsl:value-of select="substring-after($current_tksv_code,'/')" />
     </xsl:variable>
            <p><a href="/COLSUPPORT/images/{$folder}/{a_pj}" rel="downloadr" title="{a_pj}">Télécharger</a></p>

            
            </td>
            <td>
		        <input class="btn_buttom_input_vert" id="sup_pj" name="btn_sup_pj" width="27" type="button" height="23"  value="Détruire" onClick="Delete_PJ('{a_pj}','{$current_tksv_code}','info_ticket');" />

            
            </td>
            
            
     </tr></tbody>
     </xsl:for-each>
        
        
</table>
   </xsl:if>    
            
            
            </td>
  </tr>

		  <tr>
		    <td height="60" colspan="8" valign="middle"> 		      </td>
		    <td width="234" align="right" valign="middle"><div class="btn_style_right">
		      <div class="btn_left_rouge"></div>
		      <div class="btn_buttom_rouge">
              		        <input class="btn_buttom_input_rouge" id="submitID" name="submit" width="27" type="button" height="23" onClick="history.back();" value="Retour" />

		        </div>
		      <div class="btn_right_rouge"></div>
		      </div></td>
		    </tr>
      </table>
      </div>
      	  </form>

          
          <div id="CreateTicket-error-message" ></div>
          
        </div>
        <div id="separation"></div>
	</div>
  
  
  </xsl:if>    
      
      
      
      
       <!--FOOTER-->
       <xsl:copy-of select="$footerCommun" />
       <!--FOOTER-->
      
 </div>                
      </body>

    </html>
</xsl:template>
</xsl:stylesheet>