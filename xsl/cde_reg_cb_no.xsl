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
    
     
    
  	<div id="contenu-detail">
            <div id="commande-detail_p">
                <h2 style="color:red">PAIEMENT ANNULE</h2>
                
                <div id="paiement-cb">
                
                	<xsl:if test="$currentAlias='cde.reg.cb.no'">
                    	<p>Le réglement par carte bancaire n'a pu être effectué.</p>
                    </xsl:if>
                    
                    <xsl:if test="$currentAlias='cde.reg.pp.no'">
                    	<p>Le réglement par paypal n'a pu être effectué.</p>
                    </xsl:if>
                    
                    <br/>
                    <p>Aucun paiement n'a été enregistré.</p>
					<button class="butnl" onclick="self.location.href='/Web/?alias=main';" >Revenir à l'accueil</button>
                    &#160;  &#160;
                    <a href="mailto:service.clients@imagin-jouet.fr"  class="ddbouton-navigation-back-contacter"  >Contacter le service commercial</a>
                </div>
               
            </div>
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