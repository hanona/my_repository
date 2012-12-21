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
            <div data-role="header" data-position="fixed">
                      <xsl:copy-of select="$headerApp" />  
            </div>
            <div data-role="content" data-theme="c">	
        
                <xsl:if test="$logged='false'">
                
                         <script language="javascript" >
                            document.location=("/Web/pages/WPage.jsp?alias=identification");
                        </script>
        
                </xsl:if>
        
                <div id="content">
                
                            <div id="axo_breadcrumb">
                                <div class="breadcrumb">
                                     <a title="retour à Accueil" href="/Web/?alias=main">Accueil</a>
                                     
                                      <span class="navigation-pipe">&gt;</span><span class="navigation_page">Detail historique commande</span>
                               
                                    
                                 </div>
                            </div>
        
            
                <div id="mondiv2">
                  
                          <xsl:apply-templates select="/root/commande"/>
                </div>
            
                </div>
        
             </div>
             <div data-role="footer" data-id="foo1" data-position="fixed">
                <!-- Footer -->
                <xsl:copy-of select="$footerCommun" />
                 <!--FOOTER-->
             </div>
  </div>
 <!--Body-->

       
               
      </body>

    </html>

  </xsl:template>


</xsl:stylesheet>