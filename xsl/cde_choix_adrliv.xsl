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
              <!--/*  import header commun index (fichier javascript)*/-->
      <script src="/js/cde_choix.js" language="javascript" type="text/javascript"></script>
      </head>
     <body id="index">
     
     
     
      <div data-role="page" id="page">
                    <div data-role="header" data-position="fixed">
                          <xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	      
                    
                   <xsl:variable name="adrChosen">
                        <xsl:for-each select="/root/adresse_liv_from_stocde/adresse">
                            <xsl:value-of select="cliadr_adresse1"/>
                        </xsl:for-each>
                     </xsl:variable>
                     
          
                  
        	 <div id="mondiv2" style="min-height:849px !important">
          <xsl:choose>
                         <xsl:when test="$logged='true'">
                <div id="contenu-detail" align="center">
		
		
                    <div align="center" class="processdiv">
                    	<img src="../../images/process2.jpg" />
                    </div>
                </div>
                                            <div class="adresse-commande" >
         
                                        		 <xsl:for-each select="/root/adresse_liv_from_stocde/adresse">
                                         
                                                <xsl:if test="$adrChosen=cliadr_adresse1">
                                                   <div class="pink_title"> 
                                        <img width="4" hspace="5" height="6" src="../../images/arrow_2.png" style="padding-left:35px;" />
                                        Sélectionner une adresse de livraison :
                                        </div>
                                                  <div class="bloc_adresse_de_livraison-2">
                                                  <span id="data_fix"><strong>Nom &amp; Prénom :</strong></span>
                                                            <xsl:value-of select="cliadr_raison"/><br />
                                                            <br />
                                                    <span id="data_fix"><strong>Adresse : </strong></span><xsl:value-of select="cliadr_adresse1"/>
                                                          <br />
                                                          <br />
                                                   <span id="data_fix"><strong>Complément d'adresse :</strong></span> <xsl:value-of select="cliadr_adresse2"/>
                                                          <br />
                                                          <br />
                                                    <span id="data_fix"><strong>Code postal : </strong></span><xsl:value-of select="cliadr_cp"/>
                                                          <br />
                                                          <br />
                                                    <span id="data_fix"><strong>Ville :</strong></span> <xsl:value-of select="cliadr_ville"/>
                                                          <br />
                                                          <br />
                                                   <span id="data_fix"><strong>Téléphone :</strong></span> <xsl:value-of select="cliadr_tel"/>
                                                          <br />
                                                          <br />
                                                    <span id="data_fix"><strong>Fax : </strong></span><xsl:value-of select="cliadr_fax"/>
                                                          <br />
                                                          <br />
                                               <span id="data_fix"><strong>Email :</strong></span> <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                                     <br /><br />      
                                                   
                                                   <div align="center"> 
                                                    
                                                    
                                                        <div class="btn_left_grey"></div>
                                                        <div class="btn_buttom_grey">
                                                           <input type="button" value="Conserver cette adresse" class="btn_buttom_input_grey" onclick="self.location.href='/Web/pages/WPage.jsp?alias=cde.adrchoix';"/> 
                                                        </div>
                                                        <div class="btn_right_grey"></div>
                                                  <br />
<br />

                                                   <br clear="all" />
                                                 
                                                   
                                                   
                                                   </div>
  												  </div>
                                                </xsl:if>
                                                
                                         </xsl:for-each>
         
         								   </div>
                               			
                                      <div class="adresse-commande">
                                       
                                        <xsl:for-each select="/root/adresse_from_cli_code/adresse">
                                            <xsl:if test="$adrChosen!=cliadr_adresse1">
                                                
                                            <div class="bloc_adresse_de_livraison">  
                                           
                 
                   <span id="data_fix"><strong>Nom &amp; Prénom : </strong></span>
                        <xsl:value-of select="cliadr_raison"/>
                   <br /><br />
                   <span id="data_fix"><strong>Adresse : </strong></span>
                        <xsl:value-of select="cliadr_adresse1"/>
                   <br /><br />
                   <span id="data_fix"><strong>Complément d'adresse : </strong></span>
                        <xsl:value-of select="cliadr_adresse2"/>
                    
                 <br /><br />
                   <span id="data_fix"><strong>Code postal : </strong></span>
                        <xsl:value-of select="cliadr_cp"/>
                    <br /><br />
                   <span id="data_fix"><strong>Ville : </strong></span>
                        <xsl:value-of select="cliadr_ville"/>
                    <br /><br />
                   <span id="data_fix"><strong>Téléphone : </strong></span>
                        <xsl:value-of select="cliadr_tel"/>
                   <br /><br />
                   <span id="data_fix"><strong>Fax : </strong></span>
                        <xsl:value-of select="cliadr_fax"/>
                    
                   <span id="data_fix"><br />
                   <br />
                   <strong>Email : </strong></span>
                        <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                                                     
                     <br /><br />  
                      <div align="center">
                         <div class="btn_left_blue"></div>
                                <div class="btn_buttom_blue">
                                    <input type="button" width="180" height="34" value="Choisir cette adresse" class="btn_buttom_input_blue" onclick="cdeSetAdrLivraison('{cliadr_compteur}','{cliadr_lien_wconf_id}');" />
                                </div>
                                <div class="btn_right_blue"></div>
                            </div>
                       		<br />
                     
                     
                       
                <br />

                      <br clear="all" />
                                                
                                           
                                                
                                              </div>
                                                
                                            </xsl:if>
                                        </xsl:for-each>
                                    </div>
                                    
                                    
                        </xsl:when>
                         <xsl:otherwise>
			 <script language="javascript"  >
                                document.location=("/Web/pages/WPage.jsp?alias=identification");
                          </script>
                        </xsl:otherwise>
  				   </xsl:choose>
                   
         
                       <br clear="all"/>
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
  



</xsl:stylesheet>