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
          IMAGIN
        </title>
        
  		<meta name="description" content="" />

        <!--/*  import header commun index (fichier javascript)*/-->
        <xsl:copy-of select="$headerCommun" />
        
      
            
      </head>
     <body id="index">
		<xsl:copy-of select="$alertmessage" />
<!--/*  debut body de la page /-->

 
      
      <!--HEADER-->
      <xsl:copy-of select="$siteHeader" />


 <!--Body-->
<div id="wrapper">

		<div id="content">
        
                    <div id="axo_breadcrumb">
                    	<div class="breadcrumb">
   							 <a title="retour à Accueil" href="/Web/?alias=accueil">Accueil</a>
                             
                              <span class="navigation-pipe">&gt;</span><span class="navigation_page">Nos produits</span>
                       
                            
   						 </div>
                    </div>

	  <!--DIV LEFT-->  
   
			<xsl:copy-of select="$module_bloc_carte" />
    
   	  <!--DIV LEFT--> 
   
   
        <div id="center_column">
        
        <div class="category_title_grp round5t">Nos produits </div>
        
           <ul class="grpfamlist">
              <xsl:for-each select="/root/grpfam_simple_liste/groupe_famille">  
              <xsl:sort select="grpfam_code" order="descending" />
                 <li class="detailgrpfam2">
                 	
                    <div class="">
                  <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}">
                
                    <img src="../../images/interne/images_gfam_mini/{grpfam_image}" border="0" class="picture_grp_fam2" />
                 
                    
                    </a>
                    </div>
                	<a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}" class="lib2">
                        <xsl:value-of select="grpfam_libelle" />
                    </a>

                    
           
				 </li>               
	      
               </xsl:for-each>   
                 
            </ul>
        </div>
         <!--<br clear="all" />-->
          
                    

	
		</div>
        
        
        
        
        
        
        
</div>
 <!--Body-->

        <!-- Footer -->
		<xsl:copy-of select="$footerCommun" />
         <!--FOOTER-->
        

    
    
        
        
     
      
               
      </body>

    </html>

  </xsl:template>
  



</xsl:stylesheet>