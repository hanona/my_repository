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

                  <xsl:copy-of select="$alertmessage" />  


	 
 <!--liste des groupes familles-->
 <div data-role="page" id="page">
	<div data-role="header" data-position="fixed" class="ui-bar">
		      <xsl:copy-of select="$headerApp" />  
	</div>
	<div data-role="content" data-theme="c">	
    
    <ul data-role="listview" data-inset="true" >
 			<li> <img src="/images/catalog.png" width="60" height="60" class="icon_ui"/> <a href="/Web/?alias=mobile"><h1>Catégories</h1></a></li>
   <xsl:choose>
        <xsl:when test="$logged='true'">
            <li> <img src="/images/profile.png" width="60" height="60" class="icon_ui"/> <a href="/Web/?alias=compte.accueil"><h1>Mon compte</h1></a></li>
         </xsl:when>
         <xsl:otherwise>
            <li> <img src="/images/profile.png" width="60" height="60" class="icon_ui"/> <a href="/Web/?alias=identification"><h1>Mon compte</h1></a></li>
         </xsl:otherwise>
  </xsl:choose>          
            
            
         </ul> 
    
  	
        
					<!-- start carousel widget html --> 
<div align="center" style="margin:0 auto; border:1px solid #666; width:600px; height:300px;">

<!--<img src="/images/3.jpg" width="600" height="300" />
 start carousel widget html --> 
 
						<div style="height:300px;width:600px;">
							<div  id="carousel" class="carousel carousel-theme">							
								<div id="carousel_scrollpane" class="carousel-content">
									<div id="carousel_content" class="carousel-content-scroller" style="left:0px"> 
                                    	
                                        <div id="carousel_item_0" style="z-index: 1;  display: inline; float: left;  ">
                                            <div class="carousel-item">
                                                <div style="font-size:1.5em;padding-bottom:0px;"></div>
                                                <div id="carousel_item_0">
                                                    <div style="float:left;width:100%"><img src="/images/1.jpg"/></div>				      								
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div id="carousel_item_1" style="z-index: 1;display: inline; float: left; ">
                                            <div class="carousel-item">
                                                <div style="font-size:1.5em;padding-bottom:0px;"></div>
                                                <div id="carousel_item_1">
                                                    <div style="float:left;width:100%"><img src="/images/2.jpg" /></div>				      								
                                                </div>
                                            </div>
                                        </div>
                                       <div id="carousel_item_2" style="z-index: 1;  display: inline; float: left; ">
                                            <div class="carousel-item">
                                            <div style="font-size:1.5em;padding-bottom:0px;"></div>
                                                <div id="carousel_item_2">
                                                    <div style="float:left;width:100%"><img src="/images/3.jpg" /></div>				      								
                                                </div>
                                            </div>
                                        </div>
                                        
                                     </div>
								</div>
								<div id="carousel_nav" class="carousel-nav">
									<div id="carousel_mid" class="carousel-mid" style="width: 150px; ">
                                    	<!--	<div id="0" class="carousel-id carousel-id-theme">1</div>
                                            <div id="1" class="carousel-id carousel-id-theme">2</div>
                                            <div id="2" class="carousel-id carousel-id-theme">3</div>-->
                                    </div>
								</div>
							</div>
						</div>
                      
                        <!-- end carousel widget html -->
                    						
				</div>
        
    
		
	</div>
	 <div data-role="footer" data-id="foo1" data-position="fixed">
        <!-- Footer -->
		<xsl:copy-of select="$footerCommun" />
         <!--FOOTER-->
	</div>
    
</div>

    
    
     <script>
				    //<![CDATA[	

			var carousel = new $.widgets.Carousel( {
			 	uuid : "carousel",
				args : { "scrollInterval" : 600,"itemWidth":600
				},
				  	value : [
							{ "title" : "Tron.Legacy",
					  	      "image" : "/images/1.jpg"
					  	    },
					  	    { "title" : "Yogi Bear",
					  	      "image" : "/images/2.jpg"
					  	    },
					  	    { "title" : "The Chronicles of Narnia: The Voyage of the Dawn Treader",
					  	      "image" : "/images/3.jpg"
					  	    }
					]
				});		
					   // ]]>			  
		</script>   
        
                              <!--Informations-->       
                                <div data-role="page" id="info">
                                    <div data-role="header" data-position="fixed">
                                          <xsl:copy-of select="$headerApp" />  
                                    </div>
                                    <div data-role="content" data-theme="c">	
                                       <div class="coordusr">
                                                	 <h2 class="category_title">Coordonnées</h2>
                                                   
                                                  
                                                    <br /><span class="nameusr" id="data_fix" >Prénom et Nom : </span>
                                                          <xsl:value-of select="root/user_web_info/usrweb_prenom"/>&#160;
                                                          <xsl:value-of select="root/user_web_info/usrweb_nom"/> 
                                                    <br /><span class="naisusr" id="data_fix" >Date de naissance : </span>
                                                         
                                                         
                                                         
  							         <xsl:variable name="date_nais">
                                       <xsl:value-of select="root/user_web_info/usrweb_date_nais" />
                                     </xsl:variable>		
											
                        			 <xsl:variable name="anneea">
                                      		<xsl:value-of select="substring-before($date_nais,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="aa">
                                       		<xsl:value-of select="substring-after($date_nais,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="daya">
                                      		<xsl:value-of select="substring-after($aa,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="moisa">
                                       		<xsl:value-of select="substring-before($aa,'-')" />
                                     </xsl:variable>
                                    	 
                                     <xsl:value-of select="$daya" />/<xsl:value-of select="$moisa" />/<xsl:value-of select="$anneea" />
                                     <br /><span class="mailusr" id="data_fix" >Email : </span><xsl:value-of select="root/user_web_info/usrweb_code"/> 
                                     <br /><span class="telusr" id="data_fix" > Téléphone : </span>
                                                  <xsl:for-each select="root/adresse_info/adresse[position()=1]">
                                                        <!--<xsl:if test="cliadr_lien_tad_code=2"></xsl:if>-->
                                                            <xsl:value-of select="cliadr_tel"/> 
                                                        
                                                  </xsl:for-each>
                                     <br /><span class="gsmusr" id="data_fix" > GSM : </span>
                                                  <xsl:for-each select="root/adresse_info/adresse">
                                                        <xsl:if test="cliadr_lien_tad_code=2">
                                                            <xsl:value-of select="cliadr_fax"/> 
                                                        </xsl:if>
                                                  </xsl:for-each>
                                     <br /><span class="pwdusr" id="data_fix" > Mon mot de passe : </span><xsl:value-of select="root/user_web_info/usrweb_password"/> 
									 <br />
                                              
        <xsl:variable name="nletter_actif">
           <xsl:value-of select="/root/user_web-from-newsletter/compte_info_newsletter/nletter_actif" />
        </xsl:variable> 
          
          
                                        
                                                </div>
                                    </div>
                                     <div data-role="footer" data-id="foo1" data-position="fixed">
                                        <!-- Footer -->
                                        <xsl:copy-of select="$footerCommun" />
                                         <!--FOOTER-->
                                    </div>
                                </div>
                               
                               <!--Adresses-->       
                                <div data-role="page" id="adr">
                                    <div data-role="header" data-position="fixed">
                                          <xsl:copy-of select="$headerApp" />  
                                    </div>
                                    <div data-role="content" data-theme="c">	
                                       <div class="coordusr">
                                                    
													<xsl:for-each select="/root/adresse_info/adresse">
                                                    	<xsl:if test="cliadr_lien_tad_code=1">
                                                   
                                                   <h2 class="category_title">Adresse de Facturation
                                                     <a href="/Web/?alias=edit.adress&amp;adr_compteur={cliadr_compteur}&amp;wconf_id={cliadr_lien_wconf_id}">
                                                     	<img src="http://88.190.22.228/images/modif.jpg"  width="20" align="absmiddle" title="Modifier votre adresse de facturation" border="0"/>
                                                     </a>   
                                                    </h2>
                                                    
                                                    
                                                    <ul class="adressdetail">

                                                        <li><span id="data_fix">Nom &amp; Prénom : </span>
                                                            <xsl:value-of select="cliadr_raison"/>&#160;
                                                             
                                                        </li>
                                                    
                                                        <li><span id="data_fix">Adresse : </span>
                                                            &#160;  <xsl:value-of select="cliadr_adresse1"/>
                                                        </li>
                                                        <li><span id="data_fix">Complément d'adresse : </span>
                                                            &#160;  <xsl:value-of select="cliadr_adresse2"/>
                                                        </li>
                                                        
                                                        <li><span id="data_fix">Code postal : </span>
                                                            &#160;  <xsl:value-of select="cliadr_cp"/>
                                                        </li>
                                                        <li><span id="data_fix">Ville : </span>
                                                            &#160;  <xsl:value-of select="cliadr_ville"/>
                                                        </li>
                                                        <li><span id="data_fix">Téléphone : </span>
                                                            &#160;  <xsl:value-of select="cliadr_tel"/>
                                                        </li>
                                                     
                                                        <li><span id="data_fix">Email : </span>
                                                            &#160;  <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                                        </li>
                                                        
                                                   </ul>
                                                   
                                                        </xsl:if>
                                                    </xsl:for-each>	
                                                    
                                                    
													<xsl:for-each select="/root/adresse_info/adresse">
                                                    	<xsl:if test="cliadr_lien_tad_code=2">
                                                         <h2 class="category_title">Adresse de livraison
                                                         <a href="/Web/?alias=edit.adress&amp;adr_compteur={cliadr_compteur}&amp;wconf_id={cliadr_lien_wconf_id}">
                                                     	<img src="http://88.190.22.228/images/modif.jpg"  width="20" align="absmiddle" title="Modifier votre adresse de livraison" border="0"/>
                                                     </a> 
                                                        </h2>	
                                                        
                                                        <ul class="adressdetail">
                                                   
                                                    
                                                        <li><span id="data_fix">Nom &amp; Prénom : </span>
                                                            <xsl:value-of select="cliadr_raison"/>&#160;
                                                        </li>
                                                    
                                                        <li><span id="data_fix">Adresse : </span>
                                                            &#160;  <xsl:value-of select="cliadr_adresse1"/>
                                                        </li>
                                                        <li><span id="data_fix">Complément d'adresse : </span>
                                                            &#160;  <xsl:value-of select="cliadr_adresse2"/>
                                                        </li>
                                                        
                                                        <li><span id="data_fix">Code postal : </span>
                                                            &#160;  <xsl:value-of select="cliadr_cp"/>
                                                        </li>
                                                        <li><span id="data_fix">Ville : </span>
                                                            &#160;  <xsl:value-of select="cliadr_ville"/>
                                                        </li>
                                                        <li><span id="data_fix">Téléphone : </span>
                                                            &#160;  <xsl:value-of select="cliadr_tel"/>
                                                        </li>
                                                       
                                                        <li><span id="data_fix">Email : </span>
                                                            &#160;  <xsl:value-of select="/root/user_web_info/usrweb_code"/>
                                                        </li>
                                                         
                                                     <div align="center">
                                                    
                                                    
<!--<input type="button" class="btn_buttom_input_blue" onclick="self.location.href='/Web/?alias=compte.adresse.create&amp;page=adrliv&amp;page_origine=comptadr'" value="Créer une nouvelle adresse de livraison" />-->
                            
                            
                        </div><br />



                        
                        
                                                   </ul>
                                                        </xsl:if>
                                                    </xsl:for-each>	
 	
                                                 </div>
                                    </div>
                                     <div data-role="footer" data-id="foo1" data-position="fixed">
                                        <!-- Footer -->
                                        <xsl:copy-of select="$footerCommun" />
                                         <!--FOOTER-->
                                    </div>
                                </div>
                                
                               <!--Historiques des cmds-->       
                                <div data-role="page" id="histo">
                                    <div data-role="header" data-position="fixed">
                                          <xsl:copy-of select="$headerApp" />  
                                    </div>
                                    <div data-role="content" data-theme="c">	
                                        <xsl:apply-templates select="/root/liste_commandes"/>	
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