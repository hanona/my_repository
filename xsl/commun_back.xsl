<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html"/>
  
  <!--appel fichier javascript header commun back  -->
    <xsl:variable name="headerCommun" >

        		<!--<link rel="stylesheet" href="/css/css_index.css" />-->
       			<link rel="shortcut icon" type="image/png" href="/images/favicon.png" />

   				<script src="/js/gdAlert.js" language="javascript" type="text/javascript" ></script>
				<script src="/js/cms_site.js" language="javascript" type="text/javascript"></script>
                <script src="/js/cms_login.js" language="javascript" type="text/javascript"></script>                            
				<script src="/js/prototype-1.6.0.3.js" language="javascript" type="text/javascript"></script>
                <script src="/js/scriptaculous.js" language="javascript" type="text/javascript"></script>
               
				<link href="/css/gdAlert.css" rel="stylesheet" type="text/css" media="all" />
                <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
                        
				 <script src="/js/ajoutArticle.js" language="javascript" type="text/javascript" ></script>
                 <script src="/js/cs_cdeSetModeLivraison.js" language="javascript" type="text/javascript"></script>
                 <script src="/js/cde_confirmation.js" language="javascript" type="text/javascript" ></script>
                 <script language="javascript" src="/js/cs_adresseChange.js"></script>  
                  
                 
                 <script src="/js/phonegap.js" type="text/javascript"></script>
                 <script src="/js/load_page.js" type="text/javascript"></script> 
                 
                    <!--Jquery mobile-->
                <link href="/css/jquery.mobile-1.0a3.min.css" rel="stylesheet" type="text/css"/>
                 <script src="/js/jquery-1.4.4.min.js"></script>				
                 
                 <script type="text/javascript" >

					$(document).bind("mobileinit", function(){
						  $.mobile.metaViewportContent = "width=device-width, height=device-height, minimum-scale=1, maximum-scale=5, initial-scale=0.5";
					});
					
					</script>


                 <script src="/js/jquery.mobile-1.0a3.min.js" type="text/javascript"></script>
                 
                <!--Verification des champs des formulaire-->
                <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
                  
                <script src="/js/jcarousellite.js" language="javascript" type="text/javascript"></script> 
               <!--script zoom-->
               <script src="/js/jquery.touch-gallery-1.0.0.js" ></script>
 </xsl:variable>


<!--déclaration des variables utilisé dans l'ensemble du site une fois l'utilisatateur connecté -->

     <xsl:variable name="mag_code" >
        <xsl:for-each select="root/page_param_list/page_param">
             <xsl:if test="param_name='mag_code'">
                <xsl:value-of select="param_value"/>
              </xsl:if>  
        </xsl:for-each>
      </xsl:variable>
      
       <xsl:variable name="orderway" >
        <xsl:for-each select="root/page_param_list/page_param">
             <xsl:if test="param_name='orderway'">
                <xsl:value-of select="param_value"/>
              </xsl:if>  
        </xsl:for-each>
      </xsl:variable>

       <xsl:variable name="mode_liv">
                 	<xsl:for-each select="root/page_param_list/page_param">
                          <xsl:if test="param_name='mode_liv'">
                            <xsl:value-of select="param_value"/>
                          </xsl:if>
                    </xsl:for-each>
      </xsl:variable>	 
     
      <xsl:variable name="CodePostal">
                 	<xsl:for-each select="root/page_param_list/page_param">
                          <xsl:if test="param_name='CodePostal'">
                            <xsl:value-of select="param_value"/>
                          </xsl:if>
                    </xsl:for-each>
      </xsl:variable>	
     
	   <xsl:variable name="current_page_title" >
            <xsl:value-of select="root/cpage/page_titre" />
      </xsl:variable>
      
       <xsl:variable name="current_language" >
            <xsl:for-each select="root/session_param_list/session_param">
              <xsl:if test="param_name='current_language'">
               <xsl:value-of select="param_value"/>
              </xsl:if>
            </xsl:for-each>
       </xsl:variable>
       
       <xsl:variable name="current_cli_type_code" >
            <xsl:for-each select="root/session_param_list/session_param">
              <xsl:if test="param_name='cli_type_code'">
               <xsl:value-of select="param_value"/>
              </xsl:if>
            </xsl:for-each>
       </xsl:variable>
        
       <xsl:variable name="current_artlst_code">
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='artlst_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
       </xsl:variable>   
   
       <xsl:variable name="current_art_code_value">
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='art_code_value'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
       </xsl:variable>  
   
       <xsl:variable name="current_art_theme_value">
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='art_theme_value'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
       </xsl:variable>         
   
       <xsl:variable name="logged" >
        <xsl:for-each select="/root/session_param_list/session_param/param_name[text()='user_logged']">
          <xsl:value-of select="../param_value" />
        </xsl:for-each>
     </xsl:variable>
 	    <!--Affichage du mode de livraison choisie par le client-->
    
      <xsl:variable name="mode_livraison">
        <xsl:for-each select="/root/session_param_list/session_param">
          <xsl:if test="param_name='stocde_lien_modliv_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
       </xsl:variable>  
       
       <xsl:variable name="current_grp_fam_code" >
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='grpfam_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
   	  </xsl:variable>
 
       <xsl:variable name="current_ges_compte" >
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='ges'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
  	  </xsl:variable>
  
       <xsl:variable name="current_cli_code">
        <xsl:for-each select="root/session_param_list/session_param">
          <xsl:if test="param_name='cli_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable> 
 
       <xsl:variable name="current_tarif_general">
           <xsl:for-each select="root/session_param_list/session_param">
              <xsl:if test="param_name='tarif_general'">
                <xsl:value-of select="param_value"/>
              </xsl:if>
            </xsl:for-each>
    </xsl:variable> 
     
       <xsl:variable name="current_user_web_code">
       <xsl:for-each select="root/session_param_list/session_param">
          <xsl:if test="param_name='user_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
       </xsl:for-each>
    </xsl:variable> 
    
       <xsl:variable name="current_cli_cp_livraison">
       <xsl:for-each select="root/session_param_list/session_param">
          <xsl:if test="param_name='cli_cp_livraison'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
       </xsl:for-each>
    </xsl:variable> 
 
       <xsl:variable name="current_session_id">
        <xsl:for-each select="root/session_param_list/session_param">
          <xsl:if test="param_name='session_id'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
       <xsl:variable name="current_etat_art">
        <xsl:for-each select="root/page_param_list/page_param">
        </xsl:for-each>
    </xsl:variable> 
 
          <xsl:if test="param_name='etat'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
    </xsl:variable> 
 
  <xsl:variable name="current_sfa_code" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='sfa_code'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="current_coll_code" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='coll_code'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

  <xsl:variable name="current_art_code" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='art_code'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable> 

  <xsl:variable name="current_art_racine">
	 <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='art_racine'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
    </xsl:for-each>
 </xsl:variable>   
 
 <xsl:variable name="current_art_qte">
	 <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='art_qte'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
    </xsl:for-each>
 </xsl:variable>  
   
 <xsl:variable name="current_frais">
	 <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='frais'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
    </xsl:for-each>
 </xsl:variable>    
 
   <xsl:variable name="currentAlias" >
    <xsl:value-of select="root/cpage/page_alias" />
  </xsl:variable>
  <xsl:variable name="current_sfa_code_alt" >
    <xsl:value-of select="root/art_detail_from_art_code/article_detail/art_lien_sfa_code"/>
  </xsl:variable>

 <xsl:variable name="current_fam_code" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='fam_code'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

 <xsl:variable name="current_fam_code_alt" >
    <xsl:value-of select="root/art_detail_from_art_code/article_detail/art_lien_fam_code"/>
 </xsl:variable>

 <xsl:variable name="current_page_alias" >
    <xsl:value-of select="root/cpage/page_alias" />
 </xsl:variable>
  
 <xsl:variable name="current_stocde_code" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='stocde_code'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  
 <xsl:variable name="currentstocde_code_old">
        <xsl:for-each select="root/session_param_list/session_param">
          <xsl:if test="param_name='stocde_code'">
            <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
 </xsl:variable> 
 
 <xsl:variable name="pagemembre" >
    <xsl:for-each select="root/page_param_list/page_param">
      <xsl:if test="param_name='page'">
        <xsl:value-of select="param_value"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>

 <xsl:variable name="file_lg" >
   
        <xsl:value-of  select="concat('../xsl/',$current_language,'.xml')"/>

 </xsl:variable>
  
     <xsl:variable name="current_prix_min" >
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='prix_min'">
                <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      
      <xsl:variable name="current_prix_max" >
        <xsl:for-each select="root/page_param_list/page_param">
          <xsl:if test="param_name='prix_max'">
                <xsl:value-of select="param_value"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
<xsl:variable name="adr_lien_cli_code">
            <xsl:for-each select="/root/session_param_list/session_param/param_name[text()='cli_code']">
                <xsl:value-of select="../param_value" />
            </xsl:for-each>
</xsl:variable>

<xsl:variable name="adr_compteur">
            <xsl:for-each select="/root/page_param_list/page_param/param_name[text()='adr_compteur']">
                <xsl:value-of select="../param_value" />
            </xsl:for-each>
</xsl:variable>

<xsl:variable name="adr_lien_wonf_id">
            <xsl:for-each select="/root/page_param_list/page_param/param_name[text()='wconf_id']">
                <xsl:value-of select="../param_value" />
            </xsl:for-each>
</xsl:variable>


<xsl:variable name="module_bloc_carte">


  <!--DIV RIGHT-->  
   
 <div class="column" id="right_column">


<!-- MODULE Block cart -->
<div class="block exclusive round5" id="cart_block">

	      <h4 class="round5t UniversCondensedBold">
		      <a href="/Web/?alias=grpfam">Nos produits</a>
				<span class="hidden" id="block_cart_expand">&#160;</span>
		        <span id="block_cart_collapse">&#160;</span>
			</h4>
	<div class="block_content">
    		<ul class="categoryitems">
               <!--list des group famille-->
 				<xsl:for-each select="root/grpfam_simple_liste/groupe_famille">
                       <xsl:sort select="grpfam_code" order="descending" />
                		<li>
                          <xsl:if test="$current_grp_fam_code=grpfam_code">
                            <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}" class="grfamactive"><xsl:value-of select="grpfam_libelle" /></a>
                         </xsl:if>
                         <xsl:if test="$current_grp_fam_code!=grpfam_code">
                            <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}" class="grfamnonactive"><xsl:value-of select="grpfam_libelle" /></a>
                         </xsl:if>
                         
                        		 <xsl:variable name="grpfam_code" select="grpfam_code" />
                                 
                                <ul style="display:none" id="{grpfam_code}">
                                		<!--list des familles liées a ce groupe-->
                                		<xsl:for-each select="/root/fam_and_sfa_liste/famille">
                                                <xsl:sort select="fam_code" order="ascending" />
                                        			<xsl:if test="$grpfam_code=fam_lien_grpfam_code">
                                                    		<li class="famback">
                                                                 <xsl:if test="$current_fam_code=fam_code">
                                                            		  <a href="/Web/?alias=sfa&amp;grpfam_code={$grpfam_code}&amp;fam_code={fam_code}" class="famcodeactive"><xsl:value-of select="fam_libelle" /></a>
                                                                  </xsl:if>
                                                                  <xsl:if test="$current_fam_code!=fam_code">
                                                            		  <a href="/Web/?alias=sfa&amp;grpfam_code={$grpfam_code}&amp;fam_code={fam_code}" class="famcodenoactive"><xsl:value-of select="fam_libelle" /></a>
                                                                  </xsl:if>
                                                                    <ul>
                                                                         <!--list des sous familles liées aux familles-->
                                                                  		  <xsl:for-each select="sfa_liste/sous_famille">
                                                                          		 <li>
                                                                                 <xsl:if test="$current_sfa_code=sfa_code">
                                                                                      <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={sfa_lien_fam_code}&amp;sfa_code={sfa_code}" class="sfacodeactive">
                                                                                 		  - <xsl:value-of select="sfa_libelle" />
                                                                                     </a>
                                                                                    </xsl:if> 
                                                                                    <xsl:if test="$current_sfa_code!=sfa_code">
                                                                                      <a href="/Web/?alias=grpfam.sfa&amp;grpfam_code={$current_grp_fam_code}&amp;fam_code={sfa_lien_fam_code}&amp;sfa_code={sfa_code}" class="sfacodenoactive" >
                                                                                 		   - <xsl:value-of select="sfa_libelle" />
                                                                                     </a>
                                                                                    </xsl:if> 
                                                                                        
                                                                                 </li>
                                                                          </xsl:for-each>
                                                                    </ul>
                                                            </li>
                                                    </xsl:if>
                                        </xsl:for-each>
                                </ul>
                        
                        </li>
                        
                </xsl:for-each>
             </ul>   
     </div>
</div>

 </div> 
    
   <!--DIV RIGHT--> 
	

</xsl:variable>



<xsl:variable name="adr_id" select="concat($adr_lien_cli_code,'#',$adr_compteur,'#',$adr_lien_wonf_id)"></xsl:variable>     
      
<!--FIN déclaration des variables utilisé dans l'ensemble du site une fois l'utilisatateur connecté -->


 <xsl:variable name="headerApp">
      <!-- <a href="/Web/?alias=main" data-mini="true" data-role="button" data-icon="home" data-iconpos="notext" data-inline="true">Accueil</a> 
      <a href="#" data-mini="true" data-role="button" data-icon="arrow-l" data-inline="true" data-rel="back">Retour</a>--> 
       <h1><img src="/images/logo.png" alt="Colinternet Mobile" /></h1>
       
 	   
        <xsl:if  test="$logged='true'">
            <span class="ui-btn-right">
               <a href="/Web/?alias=cde.detail" id="" class="top_cart">
                        <span id="ctl00_ctrlHeader_lbBasketProductNumber">
                            <xsl:if  test="/root/commande_apercu/commande/detail_ligne_count!=0" >
                             	<xsl:value-of select="/root/commande_apercu/commande/detail_ligne_count" />
                            </xsl:if>
                        </span>
                </a>
          <!--  Bienvenue, 
               
            
            <xsl:value-of select="/root/user_web_info/usrweb_civilite" />.&#160;<xsl:value-of select="/root/user_web_info/usrweb_prenom" />&#160;<xsl:value-of select="/root/user_web_info/usrweb_nom" />--> &#160;
                <a href="#" onclick="stopLogin();" data-role="button" data-icon="delete" data-iconpos="notext" title="Déconnexion"> déconnexion</a>          
          </span>
        </xsl:if>
        <xsl:if  test="$logged='false'">
          <span class="ui-btn-right">
                 <a href="/Web/?alias=cde.detail" id="" class="top_cart" >
                        <span id="ctl00_ctrlHeader_lbBasketProductNumber">
                            <xsl:if  test="/root/commande_apercu/commande/detail_ligne_count!=0" >
                             	<xsl:value-of select="/root/commande_apercu/commande/detail_ligne_count" />
                            </xsl:if>
                        </span>
                </a>&#160;
         		   <a href="/Web/?alias=identification" data-role="button"  data-theme="d"  data-iconpos="notext" data-icon="info"  title="Identifiez-vous"> Identifiez-vous</a>
            </span>       
         </xsl:if>
         
 </xsl:variable> 
 

<xsl:variable name="siteHeader" >
  	   <div id="top"><a href="/Web/?alias=accueil" title="COLINTERNET MOBILE"><img class="logohead" src="http://88.190.22.228/images/logo_COLINTERNET MOBILEe.png" /></a>
       
	 		<div id="header">
                          
                            <!-- Block user information module HEADER -->
<div id="header_user">
    <div id="header_user_wrapper">
        <ul id="header_nav">
            <li id="shopping_cart" onclick="document.location='/Web/?alias=cde.detail'">
                <a href="/Web/?alias=cde.detail" title="Ma sélection">Ma sélection</a>
            
            <xsl:choose>
            <xsl:when test="/root/commande_apercu/commande/detail_ligne_count!=0" >
               <br /><br />
                <span class="ajax_cart_quantity"><xsl:value-of select="/root/commande_apercu/commande/detail_ligne_count" /> Produit(s) </span><br />
                 <span class="ajax_cart_quantity">TOTAL :   </span>
                 <span class="ajax_cart_quantity"><xsl:value-of select="format-number((/root/commande_apercu/commande/stocde_montant_total_ht) - (/root/commande_apercu/commande/stocde_montant_port_ht),'#.00')" /> 
                  &#128; HT
                  </span>
            </xsl:when>
            <xsl:otherwise>    
                <br /><br />
                <span class="ajax_cart_quantity">(vide)</span>
            </xsl:otherwise>
            </xsl:choose> 
                
            </li>
        </ul>
        
              <xsl:choose>
                <xsl:when test="$logged='false'">
                
                <p id="header_user_info">
		            <a href="/Web/?alias=identification"> Bienvenue, identifiez-vous</a>
		        </p>
                
                </xsl:when>
                <xsl:otherwise>
                
        <p id="header_user_info">
		            <a href="/Web/?alias=compte.accueil"> Bienvenue, <xsl:value-of select="/root/user_web_info/usrweb_civilite" />.&#160;<xsl:value-of select="/root/user_web_info/usrweb_prenom" />&#160;<xsl:value-of select="/root/user_web_info/usrweb_nom" /></a>
		        </p>
       
       <p id="your_account2">
            <a href="#" onclick="stopLogin();"> (déconnexion)</a>
        </p>
        
        </xsl:otherwise>
        </xsl:choose>
        <p id="your_account">
            <a href="/Web/?alias=compte.accueil" title="Your Account">Votre compte</a>
        </p>
        
    </div>
     
</div>
<!-- /Block user information module HEADER --><!-- Block search module TOP -->
<div id="search_block_top">
    <div id="search_block_top_wrapper">
	<p>
		<input type="text" id="search_query" name="search_query" value="Recherche"  onclick="this.value=''" onkeypress="if (event.keyCode == 13) startRecherche_lr();" />
		<input type="button" name="submit_search" value="Search" class="button"  onclick="startRecherche_lr();" />
	</p>

    </div>
</div>
	

<div id="newsletter_block_left" class="block">
    <div id="newsletter_block_left_wrapper">
    
	<!--<h4 class="UniversCondensed">Inscription Newsletter</h4>-->
	
    <div class="block_content">
	
			<!--<p>
            <input id="usrweb_code_nl" type="hidden" value="{$current_user_web_code}" name="usrweb_code_nl" />
              
               <input class="newsletter" type="text" id="nltxt" name="nltxt" size="18" value="Votre e-mail" onfocus="javascript:if(this.value=='Votre e-mail')this.value='';" onblur="javascript:if(this.value=='')this.value='Votre e-mail';" />
                           
                  <input type="button" value="ok" class="button_mini" onclick="NewsletterCreate();" />
                        </p>-->
			<!--p>
				<select name="action">
					<option value="0" selected="selected">Subscribe</option>
					<option value="1">Unsubscribe</option>
				</select>
			</p-->

	</div>
    </div>
</div>

<!-- /Block Newsletter module--><!-- Block links module -->
<div id="menu_principal">
	<ul id="menu_supp">
			<li><a href="/Web/?alias=qui_sommes_nous" class="UniversCondensedBold">Qui sommes-nous</a></li>
			<li><a href="/Web/?alias=grpfam" class="UniversCondensedBold">Nos produits</a></li>
			<li><a  href="/Web/?alias=catalog" class="UniversCondensedBold">Téléchargements catalogues</a></li>
			<li><a href="/Web/?alias=cde.direct" class="UniversCondensedBold">Commander par référence</a></li>
			<!--<li><a href="/Web/?alias=actualites" class="UniversCondensedBold">Actualités</a></li>-->
			<li class="last_item"><a href="/Web/?alias=contact" class="UniversCondensedBold">Contact</a></li>
		</ul>
</div>
<div id="submenu2">
     <ul>
		 <xsl:for-each select="root/grpfam_simple_liste/groupe_famille">
                       <xsl:sort select="grpfam_code" order="descending" />
                		<li>
                              <xsl:if test="$current_grp_fam_code=grpfam_code">
                              	    <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}" class="grfamnonactive"> <xsl:value-of select="grpfam_libelle" /></a>
                              </xsl:if>	
							  <xsl:if test="$current_grp_fam_code!=grpfam_code">
                              	    <a href="/Web/?alias=sfa.fam&amp;grpfam_code={grpfam_code}" class="grfamactive"> <xsl:value-of select="grpfam_libelle" /></a>
                              </xsl:if>                         </li>
           </xsl:for-each>              
        </ul>
 </div>

<!-- /Block links module -->
			</div>
		</div>
     <br clear="all" />
</xsl:variable>
 

<!-- insertion footer de la page-->
<xsl:variable name="footerCommun">



	<div data-role="navbar" data-iconpos="top">
		<ul>
            <li><a href="#" data-icon="home"  onclick="self.location.href='/Web/?alias=main';"> Accueil</a></li>
            <li><a href="/Web/?alias=mobile" data-icon="grid"> Shopping</a></li>
			<li><a href="/Web/?alias=cde.detail" data-icon="gear">Panier</a></li>
            
			   <xsl:choose>
                    <xsl:when test="$logged='true'">
                        <li><a href="/Web/?alias=compte.accueil" data-icon="info">Mon compte</a></li>
                     </xsl:when>
                     <xsl:otherwise>
                        <li><a href="/Web/?alias=identification" data-icon="info">Mon compte</a></li>
                     </xsl:otherwise>
              </xsl:choose>          
			<li><a href="/Web/?alias=rubrique" data-icon="plus" >Plus</a></li>
		</ul>
	</div><!-- /navbar -->
<!-- /footer -->

	 
</xsl:variable>

    
  <xsl:variable name="alertmessage" >
       
      
                    <form name="frm">
            
                           <div id="alert_message" style="display: none">
                                
                                <input value="" onclick="gdAlert.close()" type="button" class="btn_ok"  />
                            </div>
                            <span id="message2"> <input style="width: 400px;" name="alertmessage" id="message" value="" type="hidden" /></span>
                   </form>
       			
  </xsl:variable>
  


<xsl:template match="/root/commande_apercu" name="tpl_site_visuel">
		  <!--<div id="title_panier">MON PANIER</div>-->
         
          <div id="texte_panier">
          
       	    <xsl:choose>
            <xsl:when test="/root/commande_apercu/commande/detail_ligne_count!=0" >
           
               <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0" class="tablemonpanier">
               
                  <tr>
                    <td colspan="2" align="left" valign="bottom" class="productsaccount" rowspan="2" width="27%">
                         <div id="image_panier">
                            <a href="/Web/?alias=cde.detail"><img src="http://88.190.22.228/images/paniers/small/shopping-basket.png" width="78" height="78" border="0" /></a>
                         </div>
                    </td>
                    <td width="73%" height="54" align="left" valign="bottom" class="productsaccount">
                    	<span class="blue big"> <xsl:value-of select="/root/commande_apercu/commande/detail_ligne_count" /></span> 
                       <xsl:choose>
                        <xsl:when test="/root/commande_apercu/commande/detail_ligne_count=1" > Article</xsl:when>
                        <xsl:otherwise> Articles</xsl:otherwise></xsl:choose>
                         
                    </td>
             </tr>
                  <tr>
                    <td align="left" valign="top" class="monpaniertotal">TOTAL :
                     <span class="blue big"><xsl:value-of select="format-number((/root/commande_apercu/commande/stocde_montant_total_ht) - (/root/commande_apercu/commande/stocde_montant_port_ht),'#0.00')" />  &#128; </span><span class="blue">HT</span>                   </td>
                  </tr>
 </table>
          
          
            </xsl:when>
            <xsl:otherwise>
<table width="100%" border="0" class="tablemonpanier" cellspacing="0" cellpadding="0">
                      <tr>
                          <td colspan="2" align="left" valign="bottom" class="productsaccount" rowspan="2">
                             <div id="image_panier">
                             	<a href="/Web/?alias=cde.detail"><img src="http://88.190.22.228/images/paniers/small/shopping-basket.png" width="78" height="78" border="0" /></a>
                             </div>
                        </td>
                          <td width="73%" align="left" valign="middle" class="paniervide">
                            <br />
                            <br />
                          <span class="purple">Votre panier est vide</span> </td>
                      </tr>
              </table>
            </xsl:otherwise>
            </xsl:choose>
            
          </div>
      
     </xsl:template> 
     
<!-- debut template affichage historique des commandes-->  

<xsl:template match="/root/liste_commandes" >

    

            <table class="table-style2" border="0" align="center">
                <thead class="theader">
                    <tr>
                        <td align="center" style="width:150px">N° de commande </td>
                        <td align="center" style="width:150px">Date de création</td>
                        <td align="center" style="width:150px">Montant Total TTC </td>
                        <td align="center" style="width:200px">Statut</td>
                        <td align="center"> </td>
                     </tr>
                </thead>
                <tbody>
                
                <xsl:for-each select="./commandes">
                	  <xsl:if test="stocde_etat!='100'">
                    <tr>  
                        <td>
                          <a href ="/Web/?alias=detail_his_cde&amp;cmd_num={stocde_code}" class="det_num_cmd"><xsl:value-of select="stocde_code" /> </a>
                        </td>
                        <td>
							         <xsl:variable name="datecrea">
                                       <xsl:value-of select="substring-before(stocde_date_creation,' ')" />
                                     </xsl:variable>		
											
                        			 <xsl:variable name="annee">
                                      		<xsl:value-of select="substring-before($datecrea,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="a">
                                       		<xsl:value-of select="substring-after($datecrea,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="day">
                                      		<xsl:value-of select="substring-after($a,'-')" />
                                     </xsl:variable>
                                     
                                     <xsl:variable name="mois">
                                       		<xsl:value-of select="substring-before($a,'-')" />
                                     </xsl:variable>
                                    	 
                                     <xsl:value-of select="$day" />/<xsl:value-of select="$mois" />/<xsl:value-of select="$annee" />
                         
                         
                         </td>
                         
                         <td>
                        		<xsl:value-of select="format-number(stocde_montant_total_ttc,'#0.00')" />
                        </td>
                        <td> 
                              
                            <xsl:if test="stocde_etat='0'">
                                 <a href="/Web/pages/WPage.jsp?alias=detail_his_cde&amp;cmd_num={stocde_code}">COMMANDE NON CONFIRMÉE</a>
                            </xsl:if>
                            <xsl:if test="stocde_etat='20'">
                                 <a href="/Web/pages/WPage.jsp?alias=detail_his_cde&amp;cmd_num={stocde_code}" class=""> COMMANDE CONFIRMÉE</a>
                            </xsl:if>
                             <xsl:if test="stocde_etat='15'">
                                 <a href="/Web/pages/WPage.jsp?alias=detail_his_cde&amp;cmd_num={stocde_code}" class=""> COMMANDE EN ATTENTE</a>
                            </xsl:if>
                            <xsl:if test="stocde_etat='35'">
                                 <a href="/Web/pages/WPage.jsp?alias=detail_his_cde&amp;cmd_num={stocde_code}" class=""> Commande dont le paiement non valide</a>
                            </xsl:if>
                            
                        </td>
                        <td align="left"> 
                          <xsl:if test="stocde_etat!='20'">
                            <a href="#" data-role="button" data-icon="delete" onclick="delCmdNoValidated('{stocde_code}');" data-iconpos="notext" data-theme="b"></a>
                          </xsl:if>
                          <xsl:if test="stocde_etat='20'">
					 
                               <a href="#" data-role="button" data-icon="delete" onclick="validCmdNoValidated('{stocde_code}');" data-iconpos="notext" ></a>
                          </xsl:if> 
                            
                        </td> 
                           
                    </tr>
                    </xsl:if>
                </xsl:for-each>
            
                 </tbody>
            </table>
            
		
   
</xsl:template>

<!-- fin template affichage historique des commandes--> 


<!-- template detail de la liste des commande effectuer -->
<xsl:template match="/root/commande" >


<br clear="all" />
 
<table border="0"  class="table-style2"  width="100%" >
    <thead class="theader">
        <tr style="color:#518FBE">
            <th  style="width:110px">
                    <a href="#"  data-icon="check" data-role="button" data-theme="d" onclick="cocherTout();" >Tous cocher</a>
             </th>
            <th> Image Article</th>
            <th> Désignation</th>
            <th> Prix Unitaire TTC</th>
            <th> Quantité</th>
            <th> Montant TTC </th>
            <th> Recommander</th>
        </tr>
    </thead>

    <tbody>

<xsl:for-each select="./detaille">

<form class="article-commander" id="form-{stocdd_lien_art_code}" action="" target="" method="POST"  onsubmit="" >

   <input type="hidden" name ="handle_form" id="handle_form" value="form-{stocdd_lien_art_code}" />

   <tr>  
       	<td> 
          
   <input type="checkbox" name="checkbox_t" id="checkbox_t"  size="30"/>      
   <input id="form-{stocdd_lien_art_code}-dispo" name="form-{stocdd_lien_art_code}-dispo" class="article-qte" value="{artqt_dispo}" type="hidden" />  
      
 		</td>  
        <td>
        <div class="bloc_phot" align="center">
         <img  src="http://88.190.22.228/images/images1_mini/{artimg_libelle}" width="80" height="80"  />       
         </div>   
         <input id="form-{stocdd_lien_art_code}-article" name="form-{stocdd_lien_art_code}-article" class="article-code" value="{stocdd_lien_art_code}" type="hidden"/>
 		</td>  
 
        <td> <strong><xsl:value-of select="stocdd_lien_art_code" /></strong> <br /><br /><xsl:value-of select="stocdd_libelle" /></td>
 
        <td> <div class="small_pink_price"><xsl:value-of select="format-number(stocdd_piece_prix_ttc,'#0.00')" /></div></td>
        <td> <xsl:value-of select="stocdd_qte_piece" /> </td>
        <td> <div class="small_pink_price"><xsl:value-of select="format-number(stocdd_ligne_montant_ttc,'#0.00') " /></div> </td>
        <td align="center">
         <input id="form-{stocdd_lien_art_code}-marque" name="form-{stocdd_lien_art_code}-marque" class="article-code" value="{stocdd_soc}" type="hidden"/>
         <input type="hidden" id="form-{stocdd_lien_art_code}-clr_produit" name="form-{stocdd_lien_art_code}-clr_produit" style="text-transform:uppercase;" value="{stocdd_couleur_article}" />
   
   

	<xsl:choose>
    <xsl:when test="dispo_article=''">
        <div style="color:#F00">Article Non Disponible</div>
    </xsl:when>
    <xsl:otherwise>
	  <div class="qtee-3"><input id="form-{stocdd_lien_art_code}-qte" name="form-{stocdd_lien_art_code}-qte" class="artqte-3" value="{stocdd_qte_piece}" type="text" size="9" maxlength="9" /></div>
      
            <br />
   			<br />

</xsl:otherwise>
</xsl:choose>   
    </td>

    </tr>
 </form>
</xsl:for-each >

</tbody>

</table>       
<br />

<div align="left" class="dh"> 
<div align="left" class="text_num_cmd">NB: veuillez cocher un article au minimum </div>
<br />  
     
              
               <a href="#" data-role="button" data-theme="b" onclick="commander_selection();" id="bouton_compte">Commander la sélection</a>
              
                <a href="/Web/?alias=compte.accueil" data-role="button" data-icon="back">Retour à l'historique des commandes</a>
       
</div>

<br />  <br />  <br />  
<br />

<script language="javascript">

$(document).ready(function() {

	$("#bouton_compte").click(function(){
	
		if(verif_cmd_select())
		{
		    var n = $(" input:checked").length;
			var compt = new Number(900 * n);
			
			/*$.blockUI({ css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff',
			height : '25%' 
			
			} }); */
			
			
			setTimeout(function(){
				$.unblockUI;
				
			//	window.location.reload();
				
				self.location.href='/Web/?alias=main#/Web/?alias=cde.detail';
		   },compt);
		} 
		
	});
	
});

</script>
</xsl:template>   
</xsl:stylesheet>
 
