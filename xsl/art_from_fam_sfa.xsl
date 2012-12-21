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
 							
        
                <h2 class="category_title round5t">
                   <span class="UniversCondensedBold">
                          <xsl:for-each select="/root/grpfam_fiche_detaillee/grpfam_fiche">
                                <xsl:value-of select="grpfam_libelle" /> 
                          </xsl:for-each>
                    </span>
                    
                    <div style="float:right;">
                    <xsl:if test="$orderway!='icon'">     
                    <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={$current_fam_code}&amp;sfa_code={$current_sfa_code}&amp;orderway=icon"><img src="../../../images/btn-thumbnails.png" />
                    </a>
                    </xsl:if>
               		<xsl:if test="$orderway='icon'">     
                    <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={$current_fam_code}&amp;sfa_code={$current_sfa_code}"><img src="../../../images/btn-list.png" />
                    </a>
                </xsl:if>
                    </div>
                </h2>
        
            <div class="category_title_grp">  
                      <xsl:for-each select="/root/sfa_of_fam_liste_detaillee/sous_famille">
                            <xsl:if test="sfa_code=$current_sfa_code">
                            
                                <xsl:value-of select="sfa_libelle" /> 
                             
                            </xsl:if> 
                      </xsl:for-each>
             </div>
<!--data-inset="true" data-filter="true"-->

             <xsl:variable name="classlist"><xsl:if test="$orderway='icon'">listart</xsl:if><xsl:if test="$orderway!='icon'"></xsl:if></xsl:variable>
             
             <ul data-role="listview"  data-inset="true" class="{$classlist}">
                <xsl:for-each select="/root/article_liste/article">  
                <xsl:sort select="art_code" order="ascending" data-type="number"/>
                <li >
		 
			<a  href="/Web/?alias=detail.art&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={art_lien_fam_code}&amp;sfa_code={art_lien_sfa_code}&amp;art_code={art_code}" class="ui-link-inherit">
				<img src="http://88.190.22.228/images/images1_mini/{artimg_libelle}" border="0" class="ui-li-thumb"/>
                  
                
                 <p class="ui-li-desc"> 
                 <span class="ui-title_ref">Réf : <xsl:value-of select="art_code" /></span> <br />
                 <xsl:value-of select="arttr_libelle" /></p>
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