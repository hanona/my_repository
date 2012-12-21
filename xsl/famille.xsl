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

 
<div data-role="page" id="{$current_grp_fam_code}">
 
	<div data-role="header" data-position="fixed">
		  <xsl:copy-of select="$headerApp" />  
	</div>
	<div data-role="content" data-theme="c">	
       <ul  id="nav" data-role="listview" data-inset="true" data-filter="true">
  			<xsl:for-each select="/root/famille_liste/famille">
            	<xsl:if test="fam_lien_grpfam_code=$current_grp_fam_code">
 						<li>
                        	<a href="/Web/?alias=sfa&amp;grpfam_code={fam_lien_grpfam_code}&amp;fam_code={fam_code}">
                              <img src="http://88.190.22.228/images/interne/images_fam_mini/{fam_image}" border="0" class="picture_grp_fam2" />

                            	<xsl:value-of select="fam_libelle " />
                            </a>
                                
                         </li>
                </xsl:if>
          </xsl:for-each>
         </ul> 
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