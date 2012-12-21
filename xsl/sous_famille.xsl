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

      </head>
     <body id="index">

	  
                <div data-role="page" id="page">
                   <div data-role="header" data-position="fixed">
                              <xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	    
						  <div class="content-primary">	
 							
                               <ul data-role="listview" data-inset="true" data-filter="true">
              <xsl:for-each select="/root/sfa_of_fam_liste_detaillee/sous_famille">  
            
                 <li>
                     <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={sfa_lien_fam_code}&amp;sfa_code={sfa_code}" class="lib2">
                     <img src="http://88.190.22.228/images/interne/images_sfam_mini/{sfa_image}" border="0" class="picture_grp_fam2" />
                          <xsl:value-of select="sfa_libelle" />
                    </a>
				 </li>               
	      
              </xsl:for-each>   
                 
            </ul>
  
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