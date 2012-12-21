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
	<div data-role="header" data-position="fixed">
		      <xsl:copy-of select="$headerApp" />  
	</div>
	<div data-role="content" data-theme="c">	
  		
    
		<ul data-role="listview" data-inset="true" data-filter="true" data-split-theme="a">
        
         <xsl:for-each select="/root/grpfam_simple_liste/groupe_famille">
			<li> 
            <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}"> 
                 <img src="http://88.190.22.228/images/interne/images_gfam_mini/{grpfam_image}" border="0" class="picture_grp_fam2" />
                 <h3><xsl:value-of select="grpfam_libelle " /></h3>
             </a>
           
           </li>
         </xsl:for-each>   
		</ul>		
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