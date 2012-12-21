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
 <div data-role="page" id="page">
                    <div data-role="header" data-position="fixed" class="ui-bar">
                          <a href="#" data-rel="back" data-icon="arrow-l" data-theme="a">Retour</a>
                          <xsl:copy-of select="$headerApp" />
                          
                            
                    </div>
                    <div data-role="content" data-theme="c">	       
             
						 <div id="mondiv2">
     
     
       <xsl:choose>
                         <xsl:when test="$logged='true'">
                          
                          
                             <xsl:apply-templates select="/root/commande_from_stocde" />
                               
                        </xsl:when>
                         <xsl:otherwise>
						 <script language="javascript"  >
                               document.location=("/Web/pages/WPage.jsp?alias=identification");
                          </script>
                        </xsl:otherwise>
  				   </xsl:choose>
                   
     
     
                       
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
  

<xsl:template match="/root/commande_from_stocde" name="tpl_commande_detail">

<div id="contenu-detail">
            <div id="commande-detail">
            
           
              
			<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2"  class="table-style2">
                    <thead class="theader">
                        <tr>
                            <td>Les produits</td>
                            <td width="10%">Quantité</td>
                            <td width="23%">Prix Unitaire H.T</td>
                            <td width="26%">Total</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="commande_entete/commande_from_stocde-detail/commande_detail">
                            <tr>
                                <td > 
                                   
                                            <xsl:value-of select="stocdd_libelle"/>
                                       <br /><b>Code :</b>
                                           <span class="pink"> <xsl:value-of select="stocdd_lien_art_code"/></span>
                                     
                                </td>
                                <td>
                                    <xsl:value-of select="stocdd_qte_piece"/>
                                </td>
                               
                                <td>
                                    <div class="small_purple_price"><xsl:value-of select="format-number(stocdd_piece_prix_ht,'#0.00')"/> &#128;</div>
                                </td>
                                <td>
                                    <div class="medium_purple_price"><xsl:value-of select="format-number(stocdd_ligne_montant_ht,'#0.00')"/> &#128;</div>
                                </td>
                            </tr>
                        </xsl:for-each>
                      
                           
                           
                <tr class="resume_bg">
                   <td align="center" class="noborder"></td>
                   <td colspan="3" align="right" class="noborder">
                   
                   <table width="300" class="tabledta" align="right">
                     <tr>
                       <td colspan="2" align="left" class="blutd">Total articles HT</td>
                       <td class="blutd" align="left"><xsl:value-of select="format-number(commande_entete/stocde_montant_article_remise_ht,'#0.00')" /> &#128;</td>
                     </tr>
                     <tr>
                       <td colspan="2" align="left" class="blutd"> Frais de transport</td>
                       <td class="blutd" align="left">
                       	<xsl:if test="commande_entete/stocde_montant_port_ht=0">
                       		Offerts
                        </xsl:if>
                        <xsl:if test="commande_entete/stocde_montant_port_ht!=0">
                       		<xsl:value-of select="format-number(commande_entete/stocde_montant_port_ht,'0.00')"/> &#128; 
                        </xsl:if>
                       </td>
                     </tr>
                     <tr>
                       <td class="blutd" colspan="2" align="left">Total HT</td>
                       <td align="center" class="big_purple_price"><xsl:value-of select="format-number(commande_entete/stocde_montant_total_ht,'#0.00')"/> € </td>
                     </tr>
                     <tr>
                       <td class="blutd" colspan="2" align="left">Total TTC</td>
                       <td align="center" class="big_purple_price"><xsl:value-of select="format-number(commande_entete/stocde_montant_total_ttc,'#0.00')"/> € </td>
                     </tr>
                     
                   </table></td>
                   </tr>
               </tbody>
           </table>
            
            
        <form method="post" id="commande-confirmation-form" name="commande_confirmation_form">
            <table width="94%" border="0" align="center" cellpadding="0" cellspacing="5">
             
              <tr>
                <td width="50%" align="left" valign="top">
                     <div class="border_grey_auto">
                        <u class="small_blue_text"><strong>Adresses de livraison</strong></u>
                       
                       
                        <xsl:for-each select="commande_entete/commande_from_stocde-adrliv/adresse">
                				  <ul class="listadr">
                                  		<li><xsl:value-of select="cliadr_raison"/></li>	
                                        <li><xsl:value-of select="cliadr_adresse1"/></li>
                                        <li><xsl:value-of select="cliadr_adresse2"/></li>
                                        <li><xsl:value-of select="cliadr_cp"/>&#160;&#160;<xsl:value-of select="cliadr_ville"/></li>
                                       <li>Tél : <xsl:value-of select="cliadr_tel"/></li>
					           </ul>
					    </xsl:for-each>  
                        </div>
                </td>
                <td colspan="2" align="left" valign="top">                <div class="border_grey_auto">
                      <u class="small_blue_text"><strong>Adresses de facturation</strong></u>
					  
					  <xsl:for-each select="commande_entete/commande_from_stocde-adrfac/adresse">
                           	  <ul class="listadr">
                                  		<li><xsl:value-of select="cliadr_raison"/></li>	
                                        <li><xsl:value-of select="cliadr_adresse1"/></li>
                                        <li><xsl:value-of select="cliadr_adresse2"/></li>
                                        <li><xsl:value-of select="cliadr_cp"/>&#160;&#160;<xsl:value-of select="cliadr_ville"/></li>
                                       <li>Tél : <xsl:value-of select="cliadr_tel"/></li>
					           </ul>
			    </xsl:for-each>   </div></td>
              </tr>
             <tr>
              	<td colspan="4">
               		 
                   
                            
                         <br />
						<b style="font-size:12px;">Choisissez votre mode de règlement :</b>
                        <div id="mode-paiement">
                        		 
							
                            <div id="cheque">
                                <input type="radio" name="mode_reglement_liste"  id="mode_reglement_liste" value="CHQ" />Chèque
                            </div>
                            <div id="cb">
                                <input type="radio" name="mode_reglement_liste" id="mode_reglement_liste" value="CBI"  />Carte Bancaire
                            </div>
                              <div id="esp">
                                <input type="radio" name="mode_reglement_liste" id="mode_reglement_liste" value="CHQ"  />En espèces  à la livraison
                            </div>
                        </div>
                        <div id="infoCheq"  ></div>
                    
                </td>
              </tr>
              <tr>
              	<td height="47" colspan="2"> 
              	   <div class="txtliv">
                 	Si vous voulez nous laisser un message à propos de votre demande, merci de l'écrire ici. Si il s'agit d'une commande ferme, merci de nous l'indiquer ici, avec les informations de livraison nécessaires. :</div> 
                    <textarea name="remarque" id="remarque" cols="40" rows="5" class="remarque"></textarea>
                    <br />
 
       	        </td>
                <td height="47"  valign="top">
                <div class="txtdateliv"> 
                      
                 </div> <input id="popup_container" type="hidden" class="remarque" />
                    <br />
       	        </td>
  			  </tr>
              <tr>
                <td height="41" colspan="3" align="left" valign="top">
                <div class="trait_dotted_2"></div>
                <input type="checkbox" name="accept_cgv" id="accept_cgv" class="custom" />
				<strong>J'ai lu et j'accepte les <a href="/Web/?alias=cond.gen">conditions générales de vente</a>
                </strong> (cochez la case ci à gauche) 
				 
                </td>
              </tr>
              <tr>
                <td colspan="2" align="left" valign="bottom">
                    <a href="/Web/?alias=cde.adrchoix" data-role="button">Revenir au choix des adresses</a>
                </td>
                <td width="40%" align="right" valign="bottom">
                    <input type="hidden" id="stocde-code" value="{$currentstocde_code_old}"  />
                  <!-- <input type="hidden" id="mode_reglement" value="{/root/fiche_client/client/cli_lien_modreg_code}"  />-->
                   
                
                   <input type="button" class="btn_buttom_input_purple" value="Valider ma commande" onClick="commandeConfimation('PRO');" data-theme="b"/>
                

                   
               </td>
              </tr>
            </table>
            
               <input type="hidden" id="montantTtc" name="montantTtc" value="{commande_entete/stocde_montant_article_remise_ttc}" />
               <input type="hidden" id="mailclt" name="mailclt" value="{commande_entete/stocde_lien_usrweb_code}" />
        </form>

                <form method="post" id="commande_confirmation_test_sgmb" name="commande_confirmation_test_sgmb" action="http://88.191.129.23:8148/Web/Paiement" >
                    <input type="hidden" id="stocde_code" name="stocde_code" value="{commande_entete/stocde_code}" />
		  		</form>
                
            </div>
            
				
               
            <p id="commande-confirmation-form-error-message" ></p>

    </div>

</xsl:template>



</xsl:stylesheet>