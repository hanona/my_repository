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
          <xsl:value-of select="root/cpage/page_titre"/>
        </title>
 
 <xsl:copy-of select="$headerCommun" />

      <!--/*  import header commun index (fichier javascript)*/-->
     
        
        
      </head>
     <body>

<!--/*  debut body de la page /-->
 <div id="main">
 <div id="back-left"></div>
 <div id="back-right"></div>
 
 	 
      
      <!--HEADER-->
      	<xsl:copy-of select="$siteHeader" />
       <!--HEADER-->
       
       <!--CONTENT PAGE-->
        <div id="container_1">
        
          
                  
              
	 				
                     
              <div class="processdiv" align="center"></div>
              <xsl:apply-templates select="/root/commande_of_stocde" />
                   
                    
                     
     
        
            
           
          
        </div>  
       <!--CONTENT PAGE-->
        
        
        <!--FOOTER-->
        
     
      <xsl:copy-of select="$footerCommun" />
    
        <!--FOOTER-->
        
   
        
     
      
 </div>              
      </body>

    </html>

  </xsl:template>
  
  <xsl:template match="/root/commande_of_stocde" name="tpl_commande_detail">
     <div class="processdiv" align="center"></div>
        <div id="contenu-detail">
            <div id="commande-detail_p">
                <h2 style="color:green">PAIEMENT ENREGISTRE</h2>
               
                <div id="paiement-cb">
                	
                    <xsl:if test="$currentAlias='cde.reg.cb.ok'">
                        <p>Votre paiement par carte bancaire a bien été enregistré.</p>
                        <br />
                        <p>Après validation de celui-ci par la banque, votre commande sera traitée dans les meilleurs délais.</p>
                    </xsl:if>
                    
                	<xsl:if test="$currentAlias='cde.reg.pp.ok'">
                    
                        <p>Votre paiement par PayPal a bien été enregistré.</p>
                        <br />
                        <p>Après validation de celui-ci par PayPal, votre commande sera traitée dans les meilleurs délais.</p>
				
                    </xsl:if>
                
               
                
					<button class="butnl" onclick="self.location.href='/ColCMS/pages/WPage.jsp?alias=cde.resume&amp;stocde_code={$currentstocde_code_old}';" >Voir le résumé de la commande</button>
                    &#160;
					<button class="butnl" onclick="self.location.href='/ColCMS/accueil.html';" >Retourner à la page d'accueil</button>
                </div>

            </div>
            </div>
    </xsl:template>


</xsl:stylesheet>