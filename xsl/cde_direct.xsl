<?xml version="1.0" encoding="utf-8"?>
<!--
    Document   : 
    Created on : 
    Author     : 
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  
<!--/*  import commun index box authentification*/-->
  
  <xsl:import href="../xsl/commun_back.xsl"/>

  <xsl:output method="html"
    encoding="utf-8"  
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN" />

  <xsl:template match="/">

    <html>
      <head>
        <meta http-equiv="MSThemeCompatible" content="No"/>
        <title>
          COLINTERNET MOBILE
        </title>
        
  		<meta name="description" content="" />

        <!--/*  import header commun index (fichier javascript)*/-->
        <xsl:copy-of select="$headerCommun" />
          <link rel="stylesheet" href="/css/validationEngine.css" type="text/css" media="screen" title="no title" charset="utf-8" />
          <link rel="stylesheet" href="/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
      </head>
     <body id="index">
		<xsl:copy-of select="$alertmessage" />
<!--/*  debut body de la page /-->

 
      
      <!--HEADER-->
      <xsl:copy-of select="$siteHeader" />

<xsl:if test="$logged='false'">
        
       			 <script language="javascript" >
					document.location=("/Web/pages/WPage.jsp?alias=identification");
				</script>

</xsl:if>
<xsl:if test="$logged='true'">        
 <!--Body-->
<div id="wrapper">

		<div id="content">
        
                    <div id="axo_breadcrumb">
                    	<div class="breadcrumb">
   							 <a title="retour à Accueil" href="/Web/?alias=accueil">Accueil</a>
                          
                                 <span class="navigation-pipe">&gt;</span><span class="navigation_page">Commander par référence</span>

   						 </div>
                    </div>

	
          	
         <div id="center_column_index" class="round5"> 
			<h2 class="UniversCondensedBold round5t">Commander par référence</h2>
            <div id="blockcmsnews">
           	
            <span class="purple_title">Comment utiliser ce système de prise de commande ?</span><br />
            1 - Saisir la référence exacte de l'article recherché<br />
            2 - Lister l'ensemble des produits que vous souhaitez commander et saisissez la quantité désirée<br />
            3 - Cochez la case "Supprimer" et cliquez sur le bouton "Supprimer" si vous souhaitez enlever une ligne de la liste<br />
            4 - Cliquez sur le bouton une fois votre commande terminée<br />
            5 - Passez à l'étape suivante, la confirmation de votre commande.  
                      
               <div class="border_grey">  
               
                   <form name="f_search_art" class="cde" method="post">
                
                 <div  class="commander_direct">
            
                    
                    <input type="hidden" name="lg" value="{$current_language}" />
                  <!--  <input type="hidden" name="user_grp" id="user_grp" value="{$user_grp}" />-->
                  <div class="bloc_recherche_right"> 
                     
                         <div class="btn_style_right">
                                 <div class="btn_left_blue"></div>
                                 <div class="btn_buttom_blue">
                                     <input class="btn_buttom_input_blue" style="cursor:pointer" type="button"  onClick="chercher('dataTable')" value='Chercher' />
                                 </div>
                                 <div class="btn_right_blue"></div>
                         </div>
                         
                         <div class="back_input">
                     
                     <input name="ref" type="text" onkeypress="if (event.keyCode == 13) chercher('dataTable');" value="Saisir une référence" align="top" onfocus="this.value=''" class="input_recherche"/> 
                    
                     </div>
                   </div> 
                   <br />
                  <div id="infos_art" /></div>
                     
                <table id="dataTable"  border="0" cellpadding="0" cellspacing="2" style="width:855px !important">
                <thead>
                <tr class="theader">
                    <th width="70" class="theader_content">Réf article</th>
                    <th width="540" class="theader_content">Libellé</th>
                    <th width="50" class="theader_content">Cdt</th>
                    <th width="50" class="theader_content">Ss Cdt</th>
                    <th width="80" class="theader_content">PU H.T</th>
                    <th width="96" class="theader_content">Disponibilté(état)</th>
                    <th width="93" class="theader_content">Qté</th>
                    <th width="65" class="theader_content"></th>
                </tr>
                
                </thead>
                <tbody>
                <tr style="display:none">
                    <td><strong>123456</strong></td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                     <td> </td>
                    <td><div class="qtee"><input type="text" id="qte" name="qte" class="tab_qte" /></div></td>
                    <td><input type="checkbox" id="checkbox_t" name="checkbox_t" class="Style_Form_Recherche"/>
                    </td>
                </tr>
                </tbody>
                </table>
    
            </form>
                   <br />
                   <div align="" style="">
                        <form name="f_deladd_art" method="post"  >
                        
                                <input type="hidden" name="lg" value="{$current_language}" />
                                <input type="hidden" name="tarif" value="{$current_tarif_general}" />
                                
                                 <input name="addpanier" id="butadd_mini"  class="btn_buttom_input_purple" type="button" value="Valider ma commande"  onclick="ajouter_au_panier('dataTable');" data-theme="b"/>
                             &#160;
                                 <input id="butsupp_mini" class="btn_buttom_input_grey" type="button" value="Supprimer" onClick="deleteRow('dataTable')" />
                        
                        </form>
                    </div>      <br />  <br /><br />  <br />
       
       			</div>
            </div>
            
            
            
</div>
                    
	
		</div>
        
</div>
 <!--Body-->
</xsl:if>
        <!-- Footer -->
		<xsl:copy-of select="$footerCommun" />
         <!--FOOTER-->
        

    
    
        
        
     
      
               
      </body>

    </html>

  </xsl:template>
  



</xsl:stylesheet>