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
      </head>
     <body id="index">
	 

 	
      
 <!--Body-->
 <div data-role="page" id="page">
                    <div data-role="header" data-position="fixed" class="ui-bar">
                          <xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	       

	 <div id="mondiv2">
              <!--====================================Detail commande===============================================--> 	
               <xsl:if test="$current_page_alias='cde.detail'">     
                 	
                			<xsl:apply-templates select="/root/commande_from_stocde/commande_entete" mode="tpl_commande_detail" />
                		
               </xsl:if>    
			
            	
	 		   <!--====================================Choix des adresses===============================================--> 	   
			   
               <xsl:if test="$current_page_alias='cde.adrchoix'">      
                        <xsl:choose>
                             <xsl:when test="$logged='true'">
                              
                                                <xsl:apply-templates select="/root/commande_from_stocde/commande_entete"  mode="tpl_commande_configuration"/>
                                                 <a href="/Web/?alias=cde.detail" data-role="button">Retour au panier</a>
                                                <br /> <br />
                                  
                            </xsl:when>
                             <xsl:otherwise>
								 <script language="javascript"  >
                                        document.location.href=("/Web/?alias=main#/Web/?alias=identification");
                                  </script>
                            </xsl:otherwise>
                       </xsl:choose>
               </xsl:if>      
               
                     </div> 
        			</div>
                    <div data-role="footer" data-id="foo1" data-position="fixed">
                        <!-- Footer -->
                        <xsl:copy-of select="$footerCommun" />
                         <!--FOOTER-->
                   </div>
                    
  </div>                  
               
      </body>

    </html>

  </xsl:template>
  
  
<!-- ********************************************************* Detail de la commande *********************************************************-->  

<xsl:template match="/root/commande_from_stocde/commande_entete" mode="tpl_commande_detail">
 		
        	
        <div id="contenu-detail" align="center"> 
             
            <xsl:if test="stocde_montant_total_ttc>0">


		  <div id="commande-detail" >

<div class="border_grey">
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" class="table-style2">
  <thead class="theader">
    <tr>
      <td width="12%" class="hdleft">Image</td>
      <td width="31%">Article</td>
      <td width="13%">PU H.T</td>
      <td width="10%">Qté</td>
      <td width="11%">Modifier</td>
      <td width="13%">Mtt H.T</td>
      <td width="11%" class="hdright">Supprimer</td>
    </tr>
  </thead>
  <tbody>
    <xsl:for-each select="commande_from_stocde-detail/commande_detail">
      <tr class="ligne-commande-detail">
        <td align="center" valign="middle" class="stocdd_lien_art_code" id="hdleft"> <div class="bloc_phot" align="center"><img  src="http://88.190.22.228/images/images1_mini/{artimg_libelle}" class="imgsmall" /></div>     </td>
        <td class="stocdd_libelle_cart">
            <xsl:value-of select="stocdd_libelle"/><br />
            <xsl:value-of select="stocdd_lien_art_code"/>
        </td>
        <td class="stocdd_piece_prix_ttc"><span class="small_pink_price"><xsl:value-of select="format-number(stocdd_piece_prix_ht,'#0.00')"/> &#128; </span></td>
        <td class="stocdd_qte_piece"><xsl:value-of select="stocdd_qte_piece"/></td>
        <td class="stocdd_modification">
               <a href="/Web/?alias=detail.art&amp;art_code={stocdd_lien_art_code}&amp;art_qte={stocdd_qte_piece}" data-role="button">Modifer</a>
        </td>
        <td align="center" class="stocdd_ligne_montant_ttc">
        	<span class="small_pink_price"><xsl:value-of select="format-number(stocdd_ligne_montant_ht,'#0.00')"/> &#128; </span>
        </td>
        <td class="stocdd_suppression" id="hdright">
        
             <input type="button" onclick="enleveArticle('{stocdd_lien_art_code}');" value="Supprimer" data-icon="delete" data-iconpos="notext" data-theme="b" />
        </td>
      </tr>
      
     
      
      
    </xsl:for-each>
    
      
    <tr>
		<TD colspan="2" class="tdpoidst"></TD>
		<td colspan="5" align="right" class="hdright"><div style="padding-left:37px;"><span class="big_text">Total articles en HT : </span><span class="medium_pink_price"><xsl:value-of select="format-number(stocde_montant_article_remise_ht,'#0.00')" /> &#128;</span></div></td>
	</tr>
  
 

<!--===================================================================================================================================-->
  </tbody>
</table>
<br />

 	

 <br clear="all" />


<table width="97%" border="0" align="center" cellpadding="5" cellspacing="0" bordercolor="#006600">
  <tbody>
   
    <!--===================================================================================================================================-->
    <tr class="ligne-commande-detail">
      <td colspan="2" class="tdborderbottom" valign="bottom"><div class="wanthelp"> <strong>Besoin d'aide pour finaliser votre commande ?</strong><br />
        <br />
        Nous sommes à votre écoute par téléphone au :
        04 71 66 12 12  </div></td>
      
    </tr>
 
    <tr class="ligne-commande-detail">
      <td colspan="2" align="right" valign="bottom" class="tdborderbottom">
      
      <input type="button" class="btn_buttom_input_grey" onclick="document.location.href='/Web/?alias=main';" value="Poursuivre mes Achats" data-theme="e" />
      
      
      </td>
      <td colspan="5" align="right" class="hdright">
   
       <xsl:if test="stocde_montant_total_ht &gt;= /root/fiche_client/client/cli_franco_mt_ht" >
         		<input type="hidden" id="mode_liv" value="INDEFINI"/>
       </xsl:if>   
     
     
       <xsl:if test="stocde_montant_total_ht &lt; /root/fiche_client/client/cli_franco_mt_ht and stocde_montant_total_ht &gt;= 500" >
         		<input type="hidden" id="mode_liv" value="FRANCO"/>
       </xsl:if>    
     
     
     
      
      <!-- <input type="button" class="btn_buttom_input_purple" onclick="commandeValidation({stocde_montant_article_remise_ht},{/root/fiche_client/client/cli_franco_mt_ht})"  value="Valider ma commande" data-theme="b"/>-->
       
       <xsl:if test="$logged='true'">
        		<a href="/Web/?alias=cde.adrchoix&amp;modliv_code=INDEFINI"  data-role="button" data-theme="b">Valider ma commande</a>
      </xsl:if>
       <xsl:if test="$logged='false'">
        		<a href="/Web/?alias=identification"  data-role="button" data-theme="b">Valider ma commande</a>
      </xsl:if>
      </td>
    </tr>
  </tbody>
</table>
</div>                  
                    
 </div>     
                 
       
            </xsl:if>
            <xsl:if test="stocde_montant_total_ttc=0">
                <p class="panier_vide">
                    <span>
                            <img src="http://88.190.22.228/images/panier.png"  width="69" height="54" align="absmiddle" hspace="12" />
                             <strong>Votre panier est actuellement vide !</strong>
                    </span>
                </p>
            </xsl:if>
            

        </div>
 </xsl:template>

<!--	debut template affichage  panier CONFIGURATION du client (le choix des adresses de facturation et de livraison) -->

<xsl:template match="/root/commande_from_stocde/commande_entete"  mode="tpl_commande_configuration">

<form method="post" name="confirmation-cde" >
                
                    
<div class="home_initial_top">
        <h2 class="category_title">   Adresse de facturation</h2>
        
        <!--AdrFacturation('{cliadr_compteur}','{cliadr_lien_wconf_id}')-->	
         <xsl:for-each select="/root/adresse_from_cli_code/adresse">
                         
                 
                            <xsl:if test="cliadr_lien_tad_code='1'">
                           
                              <input type="hidden" name="compteur_id_fac" id="compteur_id_fac" value="{cliadr_compteur}" />
                              <input type="hidden" name="lien_wconf_id_fac" id="lien_wconf_id_fac" value="{cliadr_lien_wconf_id}" />                                 
                          
                               <ul>
                                        <li>
                                                <xsl:value-of select="cliadr_raison"/>
                                        </li>
                                
                                     
                                        <li>
                                            <xsl:value-of select="cliadr_adresse1"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_adresse2"/>
                                        </li>
                                        
                                        <li>
                                            <xsl:value-of select="cliadr_cp"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_ville"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_lien_pay_code"/>
                                        </li>

                                        <li><strong>Tel : </strong> <xsl:value-of select="cliadr_tel"/>
                                        </li>
                                        <li><strong>Fax : </strong> <xsl:value-of select="cliadr_fax"/>
                                        </li>
                                        <li><strong>Email : </strong> <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                        </li>
                 </ul>              
                                        
     
                                    <div class="editadrliv">
 <a href="/Web/?alias=edit.adress&amp;adr_compteur={cliadr_compteur}&amp;wconf_id={cliadr_lien_wconf_id}&amp;page=adr" data-role="button" data-theme="e" data-mini="true" > Modifier mon adresse de facturation</a>
                       </div>                 
                             
                         </xsl:if>    
                    
                 </xsl:for-each>     
                   
</div>                
     
     
          
<div class="bloc_adresses">              
   
 <h2 class="category_title">Adresse de livraison</h2>
                          
               <!--AdrLIVRAISON('{cliadr_compteur}','{cliadr_lien_wconf_id}')-->	
             <xsl:if test="count(//commande_from_stocde-adrliv/adresse)&lt;=0">
                                
                             <xsl:for-each select="/root/adresse_from_cli_code/adresse[position()=1]">
                               <ul>
                                        <li>
                                         
                                        	<xsl:value-of select="cliadr_raison"/>
                                        
                                       </li>
                                       <input type="hidden" name="compteur_id_liv" id="compteur_id_liv" value="{cliadr_compteur}" />
                                       <input type="hidden" name="lien_wconf_id_liv" id="lien_wconf_id_liv" value="{cliadr_lien_wconf_id}" />
           
                                     
                                        <li>
                                            <xsl:value-of select="cliadr_adresse1"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_adresse2"/>
                                        </li>
                                      
                                        <li>
                                            <xsl:value-of select="cliadr_cp"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_ville"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="cliadr_lien_pay_code"/>
                                        </li>
                                                                           
                                        <li><strong>Tel : </strong> <xsl:value-of select="cliadr_tel"/>
                                        </li>
                                        <li><strong>Fax : </strong> <xsl:value-of select="cliadr_fax"/>
                                        </li>
                                        <li><strong>Email : </strong> <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                        </li>
                                   </ul>               
                                    <div class="editadrliv">
 <a href="/Web/?alias=edit.adress&amp;adr_compteur={cliadr_compteur}&amp;wconf_id={cliadr_lien_wconf_id}&amp;page=adr" data-role="button" data-theme="e" data-mini="true"  > Modifier mon adresse de livraison</a>
                       </div>    <br />             
                                                   
                                                    
                                         
                                        
               </xsl:for-each>
    </xsl:if>   
                                
    <xsl:if test="count(commande_from_stocde-adrliv/adresse)&gt;0" >
                                
                                   <xsl:for-each select="commande_from_stocde-adrliv/adresse">
                                  		
                                        <input type="hidden" name="compteur_id_liv" id="compteur_id_liv" value="{cliadr_compteur}" />
                                        <input type="hidden" name="lien_wconf_id_liv" id="lien_wconf_id_liv" value="{cliadr_lien_wconf_id}" />
                                       
                                   <ul>
                                        <li>
                                        	<xsl:value-of select="cliadr_raison"/>
                                        </li>
                                      
                                        <li>
                                            	 <xsl:value-of select="cliadr_adresse1"/>
                                        </li>
                                        <li>
                                            	 <xsl:value-of select="cliadr_adresse2"/>
                                        </li>
                                        <li>
                                            	 <xsl:value-of select="cliadr_cp"/>
                                        </li>
                                        <li>
                                           		 <xsl:value-of select="cliadr_ville"/>
                                        </li>
                                        <li>
                                            	<xsl:value-of select="cliadr_lien_pay_code"/>
                                        </li>                                                                         
                                        <li>
                                        		<strong>Tel : </strong> <xsl:value-of select="cliadr_tel"/>
                                        </li>
                                        <li>
                                        		<strong>Fax :</strong> <xsl:value-of select="cliadr_fax"/>
                                        </li>
                                        <li>
                                        		<strong>Email : </strong> <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                        </li>
                                      </ul>  

<div class="editadrliv"><a  href="/Web/?alias=edit.adress&amp;adr_compteur={cliadr_compteur}&amp;wconf_id={cliadr_lien_wconf_id}&amp;page=adr" data-role="button" data-theme="e" data-mini="true"  > Modifier mon adresse de livraison</a></div>
<br />
</xsl:for-each>
</xsl:if>
 <br />                           
<!--<div class="editadrliv"><img src="http://88.190.22.228/images/arrow_1.png" width="5" height="8" border="0" /> <a class="action_optionnelle" href='/Web/?alias=cde.choix.adrliv'> Choisir une autre adresse</a></div><br /><br />
    
<div class="editadrliv"><img src="http://88.190.22.228/images/arrow_1.png" width="5" height="8" border="0" /> <a class="action_optionnelle" href='/Web/?alias=compte.adresse.create&amp;page=adrliv&amp;page_origine=choixadr'> Créer une nouvelle adresse de livraison</a></div>-->
<br />
<br />
<div class="bloc_blanc2"></div>
</div>                  
       
</form>

    <!--Affichage de l'adresse de livraison choisi par le client-->
	<xsl:variable name="adrLiv">
      <xsl:for-each select="/root/commande_from_stocde/commande_entete">
        <xsl:value-of select="count(//commande_from_stocde-adrliv/adresse)" />
      </xsl:for-each>
    </xsl:variable>


    <!--Affichage de l'adresse de facturation choisi par le client-->
    <xsl:variable name="adrFac">
      <xsl:for-each select="/root/commande_from_stocde/commande_entete">
        <xsl:value-of select="count(//commande_from_stocde-adrfac/adresse)" />
      </xsl:for-each>
    </xsl:variable>

	
		 
   <!--**************************************************************************************************-->  
	     <br  clear="all"/>   
       <p id="commande-configuration-form-error-message">
 

       </p>
       
              
             <form method="post" id="commande_confirmation_form" name="commande_confirmation_form">
             
                <!--<xsl:if test="stocde_montant_total_ht &gt;= /root/fiche_client/client/cli_franco_mt_ht" >
         				<input type="hidden" id="modliv_code" value="INDEFINI"/>
                 </xsl:if>   
             
             
               <xsl:if test="stocde_montant_total_ht &lt; /root/fiche_client/client/cli_franco_mt_ht and stocde_montant_total_ht &gt;= 500" >
                        <input type="hidden" id="modliv_code" value="FRANCO"/>
               </xsl:if>    -->
               <input type="hidden" id="modliv_code" value="INDEFINI"/>
                <input type="button" class="btn_buttom_input_purple" onclick="cdeSetModeLivraison();" value="valider les adresses et passer à l'étape suivante"/>
                
              </form>
  
     
     
</xsl:template>

<!--	fin template affichage  PANIER CONFIGURATION du client -->



</xsl:stylesheet>