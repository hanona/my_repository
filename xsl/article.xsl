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

    <html class="ui-mobile">
      <head>
        <title>
          COLINTERNET MOBILE
        </title>

        <!--/*  import header commun index (fichier javascript)*/-->
		
      </head>
     <body id="index" class="ui-mobile-viewport">
		 
                        <xsl:variable name="FamLibSfa">
                                   <!--Groupe Famille-->
                                    <xsl:for-each select="/root/grpfam_simple_liste/groupe_famille">
                                            <xsl:if test="grpfam_code=$current_grp_fam_code" >
                                           		 <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}">
                                                		<xsl:value-of select="grpfam_libelle" />
                                                </a> &gt;  
                                            </xsl:if>
                                    </xsl:for-each>
 									<!-- Famille-->
                                    <xsl:for-each select="/root/fam_and_sfa_liste/famille">
                                    	 <xsl:if test="fam_code=$current_fam_code" >	
                                         <a href="/Web/?alias=sfa&amp;grpfam_code={fam_lien_grpfam_code}&amp;fam_code={fam_code}">
                                                 <xsl:value-of select="fam_libelle" /> 
                                          </a>    &gt; 
                                          </xsl:if>
                                    </xsl:for-each>
                                    <!-- Sous Famille-->
                                    <xsl:for-each select="/root/grpfam_simple_liste/groupe_famille/sfa_of_grpfam/famille">
                                        <xsl:if test="sfa_code=$current_sfa_code">
                                           <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={$current_fam_code}&amp;sfa_code={$current_sfa_code}">
                                           <xsl:value-of select="sfa_libelle" />
                                            </a>
                                        </xsl:if>
                                    </xsl:for-each>
                          </xsl:variable>

           <div data-role="page" id="page">
                    <div data-role="header" data-position="fixed" id="header">
                          		<xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	          

						 <div id="mondiv4" align="center">
                                     
                                      <!--===========================Fiche article===============================-->
                                      <xsl:apply-templates select="/root/art_detail_from_art_code/article_detail" />
                         		
                                      <!--===========================Liste des articles associés==============================-->
                                      <xsl:apply-templates select="/root" mode="artocleAssocier" />
                             
                       
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
  
  
<!--============================================================Fiche article=========================================================================-->
<xsl:template match="/root/art_detail_from_art_code/article_detail"> 
 			
<xsl:variable name="artcode"> <xsl:value-of select="art_code" /> </xsl:variable>	          
  <h1 class="category_title" style="float:left"><xsl:value-of select="arttr_libelle" /></h1><br /><br />
  <br clear="all" />
  
   <div id="gallery">
        <a href="http://88.190.22.228/images/images1/{./article_image_liste/article_image/artimg_libelle}"> 
            <img src="http://88.190.22.228/images/images1/{./article_image_liste/article_image/artimg_libelle}" alt="" id="zoom"  class="piczoom" border="0"/>
        </a>
  </div>
  
  <br />
  
   <script>
      $('#gallery a').touchGallery();
   </script>
    
  <br  clear="all"/>
  
  <div id="info_details">    
        <!--Prix-->
        <xsl:if test="$current_cli_type_code!='AUTRE'">
          <div class="prixart">
            <xsl:if test="arttar_promo_prix_ht != 0">
              <span data-type="price" class="price_listing_promo" ><xsl:value-of select="format-number(arttar_promo_prix_ht,'#0.00')"/> &#128; HT</span>
              <span class="promoprice">
                <xsl:value-of select="format-number(arttar_prix_ht,'#0.00')"/> &#128; HT
              </span>
            </xsl:if>
            <xsl:if test="arttar_promo_prix_ht =0">
              <strong data-type="price" class="price_listing" ><xsl:value-of select="format-number(arttar_prix_ht,'#0.00')"/> &#128; HT</strong> 
            </xsl:if>
          </div>
        </xsl:if>
        
        <!--Référence-->
        <div class="ref"><xsl:value-of select="art_code" />
        </div>
        
        
        <!--Disponibilité--> 
        <xsl:for-each select="article_qte_liste/article_qte">
          <div class="descom">
          
            <xsl:if test="artqt_dispo &gt; 0 and artqt_rav &gt; 0">
                <span class="infostock2">En stock</span>
             </xsl:if>
            
              <xsl:if test="artqt_dispo &lt;= 0 and artqt_rav &lt;= 0">
                   <span class="enrepture">Non disponible</span>
              </xsl:if>
            
              <xsl:if test="artqt_dispo &lt;= 0 and artqt_rav &gt; 0">
                   <span class=" enrepture"> En arrivage</span>
              </xsl:if>
            
          </div>
        </xsl:for-each>   
        <!--Couleur-->
        <xsl:if test="clr_code!='null'">
            <div class="descom">
                <strong><xsl:value-of select="clr_code" /></strong>
            </div>
        </xsl:if>
 
      
        
        <!--Ajouter au panier-->
        <xsl:if test="$current_cli_type_code!='AUTRE'"> 
          <div id="qteadd">   
            <input name="form-{art_code}-colisage" id="form-{art_code}-colisage" value="{art_colisage}" type="hidden"/>
            <input name="form-{art_code}-art_sous_colisage" id="form-{art_code}-art_sous_colisage" value="{art_sous_colisage}" type="hidden"/>
            <input name="form-{art_code}-artqt_rav" id="form-{art_code}-artqt_rav" value="{article_qte_liste/article_qte/artqt_rav}" type="hidden"/>
            <input name="form-{art_code}-artqt_rsv_local" id="form-{art_code}-artqt_rsv_local" value="{article_qte_liste/article_qte/artqt_rsv_local}" type="hidden"/>
            <input name="form-{art_code}-artqt_arrivage" id="form-{art_code}-artqt_arrivage" value="{article_qte_liste/article_qte/artqt_arrivage}" type="hidden"/>
            <input name="form-{art_code}-artqt_dispo" id="form-{art_code}-artqt_dispo" value="{article_qte_liste/article_qte/artqt_dispo}" type="hidden"/>
            <input type="hidden" value="{art_code}" name="form-{art_code}-article_code" id="form-{art_code}-article_code" />
            <input type="hidden" value="{$current_user_web_code}" name="user_web_code" id="user_web_code" />
            <input type="hidden" value="{article_image_liste/article_image/artimg_libelle}" name="form-{art_code}-artImage" id="form-{art_code}-artImage" />
            <input type="hidden" value="{arttr_libelle}" name="form-{art_code}-artLibelle" id="form-{art_code}-artLibelle" />
            <input type="hidden" value="/Web/?alias=detail.art&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={art_lien_fam_code}&amp;sfa_code={art_lien_sfa_code}&amp;art_code={art_code}&amp;art_racine={art_racine}" name="page_alias" id="page_alias" />
            
            
            
            <!--la quantite par defaut d'article-->
            <xsl:variable name="defaultQte"> 
              <xsl:if test="art_sous_colisage &lt;=0 and $current_art_qte=''">
                  <xsl:value-of select="art_colisage" />
               </xsl:if>
              <xsl:if test="art_sous_colisage &gt;0 and $current_art_qte=''">
                  <xsl:value-of select="art_sous_colisage" />
               </xsl:if>
              
                <xsl:if test="$current_art_qte!=''">
                    <xsl:value-of select="$current_art_qte" />
               </xsl:if>
            </xsl:variable>
            
            
            
            <!--===============M informer de la dispo du prdt================-->
            
            
            <!--===============Ajouter au panier================-->
            
            <xsl:if test="article_qte_liste/article_qte/artqt_dispo &gt; 0 or  article_qte_liste/article_qte/artqt_rav &gt; 0">
                  Quantité : 
                  <input type="number" name="form-{$artcode}-article_qte" id="form-{$artcode}-article_qte" value="1" min="1" max="{$defaultQte}" data-highlight="true" data-mini="true" class="ui-input-text ui-body-c ui-corner-all ui-shadow-inset ui-mini ui-slider-input" onKeyUp="positiveNumber('form-{$artcode}');"/>                
            </xsl:if>
            

          </div>
        </xsl:if>
        <br clear="all" />
        
      </div>
      
      
        <xsl:if test="$current_cli_type_code!='AUTRE'"> 
              <xsl:if test="article_qte_liste/article_qte/artqt_dispo &gt; 0 or  article_qte_liste/article_qte/artqt_rav &gt; 0">
                  
                  <a href="#" data-role="button" data-inline="true" data-mini="true" data-theme="b"  onClick="ajoutArticle( 'form-{$artcode}' );" data-icon="plus">
                        Ajouter au panier
                  </a>
              </xsl:if>
              <xsl:if test="article_qte_liste/article_qte/artqt_dispo &lt;= 0 and article_qte_liste/article_qte/artqt_rav &lt;= 0">
                        <input type="button" value="M'informer de la disponibilité future" onClick="sendmailclt('form-{$artcode}');"  id="butadd"  name="butadd"/>
              </xsl:if>
         </xsl:if>    
         
         <br /><br />
         
         
          <p align="left"> Descriptif <strong><xsl:value-of select="arttr_libelle" /></strong></p>
    	  <p align="left">
              <div class="descom">
                  <strong><xsl:value-of select="arttr_description" /></strong>
              </div>
          </p>
  

</xsl:template>
  



<!--============================================================Liste des articles associés==========================================================-->   
  
<xsl:template match="/root" mode="artocleAssocier"> 
   
 
<xsl:if test="article_associe_list!=''">
<div class="pink_title">  Autres produits susceptibles de vous intéresser  :</div>
    <div class="mm_coll">
    
        <xsl:for-each select="article_associe_list/article_associe">
           
            <div class="asso_art">   
               
               <div class="bloc_imgs">
                  <a href="/Web/pages/WPage.jsp?alias=detail.art&amp;grpfam_code={$current_grp_fam_code}&amp;art_code={art_code}&amp;fam_code={art_lien_fam_code}&amp;sfa_code={art_lien_sfa_code}&amp;art_racine={art_racine}" >
                  <img src="../../images/images1_mini/{artimg_libelle}"  border="0" class="listing_thumbnails2" width="60" height="60"/>
                  </a>
               </div>
            
            
            
               <div class="info_mm_coll">
                                                                           
                                    <div class="title_mm_coll">
                                        <a href="/Web/pages/WPage.jsp?alias=detail.art&amp;grpfam_code={$current_grp_fam_code}&amp;art_code={art_code}&amp;fam_code={art_lien_fam_code}&amp;sfa_code={art_lien_sfa_code}&amp;art_racine={art_racine}" class="lib_artass">
                                            <xsl:value-of  select="arttr_libelle"/>
                                         </a>
                                    </div><br />
                                    
                                    <span class="price_listing">
                                           <xsl:if test="$current_cli_type_code!='AUTRE'">
                                               <xsl:if test="arttar_promo_prix_ht != 0">
                                                   <span class="promoprice">
                                                        <xsl:value-of select="format-number(arttar_prix_ht,'#0.00')"/> &#128;
                                                    </span> &#160;
                                                    
                                                     <br/>
                                                     <xsl:value-of select="format-number(arttar_promo_prix_ht,'#0.00')"/> &#128;
                                                     <br />
                                                
                                               </xsl:if>
            
                                            
                                               <xsl:if test="arttar_promo_prix_ht =0">
                                                
                                                     <xsl:value-of select="format-number(arttar_prix_ht,'#0.00')"/> &#128; 
                                
                                               </xsl:if>
                                           </xsl:if>    
                                      </span>
                                      <br />
                                    
                                    <xsl:if test="art_qte_dispo &gt; 0">
                                       <span class="infostock">En stock</span>
                                     </xsl:if>
                                       
                                     <xsl:if test="art_qte_dispo &lt;= 0 and  art_qte_rav &gt; 0">
                                        <span class="enrepture">En arrivage</span>
                                     </xsl:if> <br />
                </div>                      
                     
                
            </div>
       
        
        </xsl:for-each> 
        
    </div>   
 <br clear="all" />
</xsl:if>



</xsl:template>

</xsl:stylesheet>