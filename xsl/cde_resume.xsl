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
     <body >
     
 <div data-role="page" id="page">
                    <div data-role="header" data-position="fixed">
                    
                          <xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	

					         <div id="mondiv2">
     
     
       <xsl:choose>
                         <xsl:when test="$logged='true'">
                          
                          
                               <xsl:apply-templates select="/root/commande_of_stocde" />
                               
                        </xsl:when>
                         <xsl:otherwise>
							   <script language="javascript"  >
                                   document.location=("/Web/?alias=identification");
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
  



<xsl:template match="/root/commande_of_stocde" name="tpl_commande_detail">
   
        <div id="contenu-detail">
     
            <div id="commande-detail">
                
                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" class="table-style2">
                    <thead class="theader">
                        <tr>
                            <td>Les produits</td>
                            <td width="10%">Quantité</td>
                            <td width="23%">Prix Unitaire H.T.</td>
                            <td width="26%">Total</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="commande_entete/commande_of_stocde-detail/commande_detail">
                            <tr>
                                <td class="stocdd_libelle_cart" align="left"> 
                                   
                                            <xsl:value-of select="stocdd_libelle"/>
                                       <br /><b>Code :</b>
                                            <span class="pink"><xsl:value-of select="stocdd_lien_art_code"/></span>
                                     
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
                   <td colspan="4" align="right" class="noborder">
                   <table width="300" class="tabledta" align="right">
                     <tr>
                       <td colspan="2" align="center" class="blutd">Total articles HT</td>
                       <td class="blutd" align="center"><xsl:value-of select="format-number(commande_entete/stocde_montant_article_remise_ht,'#0.00')" /> &#128;</td>
                     </tr>
                     <tr>
                       <td colspan="2" align="center" class="blutd"> Frais de livraison </td>
                       <td class="blutd" align="center"><xsl:value-of select="format-number(commande_entete/stocde_montant_port_ht,'0.00')"/> &#128; </td>
                     </tr>
                     <tr>
                       <td class="blutd" colspan="2" align="center">Total HT</td>
                       <td align="center" class="big_purple_price"><xsl:value-of select="format-number(commande_entete/stocde_montant_total_ht,'#0.00')"/> € </td>
                     </tr>
                      <tr>
                       <td class="blutd" colspan="2" align="center">Total TTC</td>
                       <td align="center" class="big_purple_price"><xsl:value-of select="format-number(commande_entete/stocde_montant_total_ttc,'#0.00')"/> € </td>
                     </tr>
                   </table></td>
                   </tr>
               </tbody>
           </table>
                
          
                

                <table id="adresses-resume" width="100%">

                    <thead>
                        <tr>
                            <td ></td>
                            <td ></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                           
                                <td>
                 
                           
                                 
                                   <u class="small_blue_text"><strong>Adresses de facturation</strong></u>
                                   <ul class="listadr">
                                       <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_raison"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_adresse1"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_adresse2"/>
                                        </li>
                                     
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_cp"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_ville"/>
                                        </li>
                                      
                                        <li>Tel :
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrfac/adresse/cliadr_tel"/>
                                        </li>
                                     
                                        <li>Email :
                                            <xsl:value-of select="//stocde_lien_usrweb_code"/>
                                        </li>
                                    </ul>
                                     
                                </td>
                          
                           
                                <td>
                                
                                   <u class="small_blue_text"><strong>Adresses de livraison</strong></u>
                                   <ul class="listadr">
                                       <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_raison"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_adresse1"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_adresse2"/>
                                        </li>
                                      
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_cp"/>
                                        </li>
                                        <li>
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_ville"/>
                                        </li>
                                     
                                        <li>Tel :
                                            <xsl:value-of select="commande_entete/commande_of_stocde-adrliv/adresse/cliadr_tel"/>
                                        </li>
                                        
                                        <li>Email :
                                            <xsl:value-of select="//stocde_lien_usrweb_code"/>
                                        </li>
                                    </ul>
                                </td>
                          
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="modreg"> 
                  <strong>Mode de transport : </strong> <span class="pink"><xsl:value-of select="commande_entete/stocde_lien_modliv_code "/></span><br /><br />
                  <strong>Mode de règlement : </strong> <span class="pink"><xsl:value-of select="commande_entete/modregres_libelle"/></span><br /><br />
				  <!--<strong>Date de livraison : </strong> <span class="pink"><xsl:value-of select="commande_entete/stocde_date_livraison "/></span><br /><br />-->
                  <strong>Remarque : </strong> <span class="pink"><xsl:value-of select="commande_entete/stocde_remarque_client "/></span><br /><br />
            </div>
             <!--Télécharger le pdf-->
              <!-- <div align="center" class="small_blue_text" >
           	 <strong>Télécharger la commande au Format PDF : </strong>
             <br />
            <a href="/Web/?alias=cde.resume&amp;stocde_code={$current_stocde_code}&amp;sortie=pdf" target="_self" >
            	<img src="../../images/file_pdf.png" border="0" />
            </a>
            &#160;&#160;&#160;
         <a href="?alias=cde.resume&amp;stocde_code={$current_stocde_code}&amp;sortie=xls" target="_self" >
            Format Excel</a>
            
            </div>-->
            
            
            
            <div class="modreg"> 
            <div class="btn_style_left"><div class="btn_left_blue"></div><div class="btn_buttom_blue">
                <input type="button" class="btn_buttom_input_blue" onclick="self.location.href='/Web/?alias=main';" value="Retour à la page d'accueil" />
            </div><div class="btn_right_blue"></div></div>
            </div>
<br /><br />
        </div>
    </xsl:template>



</xsl:stylesheet>