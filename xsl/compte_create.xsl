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
     <body>  


 	<div data-role="page" id="page">
         <div data-role="header" data-position="fixed">
                <xsl:copy-of select="$headerApp" />  
          </div>
          <div data-role="content" data-theme="c">	
 

 <!--Body-->
                   
     	<div class="content-primary">
         
   <!--****************************************************************Créer un compte**************************************************************-->   
             <xsl:if test="$current_page_alias='compte.create'">  
			 
	 		  <script src="/js/cs_compteCreate.js" language="javascript" type="text/javascript" ></script>	
              
              <form class="formular" id="compte-create-form" name="compte_create_form" action="" method="POST">
              
                <input type="hidden" id="pagealias" value="comptecreate" />
                
                <input id="cli_raison_1" name="cli_raison_1"  type="hidden" value=" " />
 
                <input id="cli_raison_2" name="cli_raison_2"  type="hidden" value=" " />
                
                <input type="hidden" id="cliadr_adresse1_0" name="cliadr_adresse1_0"  value=" "/>
            
                <input type="hidden" id="cliadr_adresse2_0" name="cliadr_adresse2_0" value=""/>
           
                <input type="hidden" id="cliadr_cp_0" name="cliadr_cp_0" value=""/>
            
                <input type="hidden" id="cliadr_ville_0" name="cliadr_ville_0" value=""/>
                
                <input type="hidden" id="cliadr_lien_pay_code_0" name="cliadr_lien_pay_code_0" value="FR" />

                <input type="hidden" id="usrweb_actif" name="usrweb_actif" value="1" />
                                
                <input type="hidden" id="countCmd" name="countCmd" value="{/root/commande_apercu/commande/detail_ligne_count}" />
                
                <input type="hidden" id="cliadr_adresse1_2" name="cliadr_adresse1_2" value=""/>
                <input type="hidden" id="cliadr_adresse2_2" name="cliadr_adresse2_2" value=""/>
                <input type="hidden" id="cliadr_cp_2" name="cliadr_cp_2" value=""/>
                <input type="hidden" id="cliadr_ville_2" name="cliadr_ville_2" value=""/>
                <input type="hidden" id="cliadr_lien_pay_code_2" name="cliadr_lien_pay_code_2" value=""/>
                	 
                <input  name="nletter_actif" id="nletter_actif" value="0" type="hidden"/>
        
                
       	<ul data-role="listview">         
            <li>
               <div data-role="fieldcontain"> 
                     <label for="email"><em>* </em> Civilité: </label><br />
                     <select name="usrweb_civilite" id="usrweb_civilite" data-mini="true"  >
                            <option value="M">M</option>
                            <option value="Mlle">Mlle</option>
                            <option value="Mme">Mme</option>
                      </select>
                </div>
           </li> 
           <li>
              <div data-role="fieldcontain"> 
                 <label for="prenom"><em>* </em> Prénom: </label>
                 <input value="" class="required" name="usrweb_nom" id="usrweb_nom" type="text" onchange="RemplirAdrFacLiv();" style="text-transform: uppercase;"   data-mini="true"/>
                </div>
           </li>
           <li>  
          		     <div data-role="fieldcontain"> 
                     <label for="nom"><em>* </em> Nom: </label>
                    <input value="" class="required" name="usrweb_prenom" id="usrweb_prenom" type="text" onchange="RemplirAdrFacLiv();" style="text-transform: uppercase;"   data-mini="true"/>
                </div>
           </li>
            <li>
                <div data-role="fieldcontain"> 
                     <label for="dateNais"><em>* </em>  Date de naissance  : (format JJ-MM-AAAA) </label>
                     <input value="" class="required date" name="usrweb_date_nais" id="usrweb_date_nais" type="text" onchange="RemplirAdrFacLiv();" style="text-transform: uppercase;"   data-mini="true"/>
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                        <label for="email"><em>* </em> Email : </label>
                        <input type="text" id="usrweb_code" name="usrweb_code" 
                            class="required email" onchange="RemplirAdrFacLiv();"  data-mini="true" />
                </div>
            </li>
             <li>    
                 <div data-role="fieldcontain">
                        <label for="tel"><em>* </em> Téléphone: </label>
                        <input type="text" id="cliadr_tel" name="cliadr_tel" 
                            class="required" onchange="RemplirAdrFacLiv();"  data-mini="true" />
                </div>
             </li>
              <li>
                <div data-role="fieldcontain">
                        <label for="gsm"> Portable - GSM : </label>
                        <input type="text" id="cliadr_tel_mobile" name="cliadr_tel_mobile" 
                            class="optional" onchange="RemplirAdrFacLiv();"  data-mini="true" />
                </div>
             </li>
             <li>
                <div data-role="fieldcontain">
                        <label for="password"><em>* </em>Mot de passe : </label>
                        <input type="password" id="usrweb_password" name="usrweb_password"
                            class="required" />
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                        <label for="password"><em>* </em>Confirmation du mot de passe : </label>
                        <input type="password" id="usrweb_password_2" name="usrweb_password_2"
                            class="required equalTo" />
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                    <label for="question"><em>* </em>Comment nous avez-vous connu ? : </label><br />
                    <select name="cli_form_question" id="cli_form_question" class="required" data-mini="true">
                            <option value="">Sélectionner</option>
                            <option value="Relation de longue date">Relation de longue date</option>
                            <option value="Sur un salon">Sur un salon</option>
                            <option value="Un de nos commerciaux">Un de nos commerciaux</option>
                            <option value="Un de nos clients">Un de nos clients</option>
                            <option value="Un de nos partenaires">Un de nos partenaires (centrale,…)</option>
                            <option value="Sur internet">Sur internet</option>
                            <option value="Autre">Autre</option>
                  </select>
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                    <label for="activite_typecom"><em>* </em>Activité - Type de commerce : </label><br />
                    <select name="cli_type_code" id="cli_type_code" class="required" data-mini="true">
                           <option value="" >Choisir parmi la liste</option>
                           <xsl:for-each select="/root/type_client_list/type_client" >
                           <option value="{typcl_code}"><xsl:value-of select="typcl_lib" /></option>
                       </xsl:for-each>
                    </select>
                 </div>
             </li>
              <li>
                <div data-role="fieldcontain">
                    <label for="siret"><em>* </em> SIRET : </label>
                    <input type="text" id="cli_siret" name="cli_siret" 
                        class="required" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                    <label for="name_societe"><em>* </em> Nom de la société : </label>
                    <input type="text" id="cli_raison_1" name="cli_raison_1" 
                        class="required" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
            <li>    
                <div data-role="fieldcontain">
                    <label for="enseigne"> Enseigne : </label>
                    <input type="text" id="cli_enseigne_1" name="cli_enseigne_1" 
                        class="optional" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
            <li>
                <div data-role="fieldcontain">
                    <label for="num_tva"> N° TVA : </label>
                    <input type="text" id="cli_num_tva" name="cli_num_tva" 
                        class="optional" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>    
             <li>
                <div data-role="fieldcontain">
                    <label for="siren"> SIREN : </label>
                    <input type="text" id="cli_siren" name="cli_siren" 
                        class="optional" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
             <li>
                <div data-role="fieldcontain">
                    <label for="adresse"><em>* </em> Adresse: </label>
                    <input type="text" id="cliadr_adresse1_1" name="cliadr_adresse1_1" 
                        class="required" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
             <li>    
                <div data-role="fieldcontain">
                    <label for="adresse2"> Complément d'adresse : </label>
                    <input type="text" id="cliadr_adresse2_1" name="cliadr_adresse2_1" 
                        class="optional" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
             </li>
             <li>   
                <div data-role="fieldcontain">
                    <label for="code_p"><em>* </em> Code postal: </label>
                    <input type="text" id="cliadr_cp_1" name="cliadr_cp_1" 
                        class="required" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
             </li>
            <li>   
                <div data-role="fieldcontain">
                    <label for="ville"><em>* </em> Ville : </label>
                    <input type="text" id="cliadr_ville_1" name="cliadr_ville_1" 
                        class="required" onchange="RemplirAdrFacLiv();" data-mini="true" />
                </div>
            </li>
             <li>    
                <div data-role="fieldcontain">
                    <label for="pays"><em>* </em> Pays: </label><br />
                    <select name="cliadr_lien_pay_code_1" id="cliadr_lien_pay_code_1" class="obligatoire" onchange="RemplirAdrFacLiv();" data-mini="true" >
                        <option value="FR">France</option>
                    </select>
                </div>
             </li>
              <li>   
                   <button  type="submit"  data-theme="e" data-mini="true">Valider</button>
              </li>
         </ul>    
           
        </form>
    
        <script type="text/javascript">//<![CDATA[ 
				$(function(){
					$("#compte-create-form").validate({
						submitHandler: function(form) {
							console.log("Call Login Action");
							sendCompteCreate();
						}
					});
				});//]]>  
		</script>
             </xsl:if>
             
        
      <!--**************************************************************MON COMPTE************************************************************-->
             <xsl:if test="$current_page_alias='compte.accueil'"> 
             
                           <xsl:variable name="current_page_adr" >
                                        <xsl:for-each select="root/page_param_list/page_param">
                                          <xsl:if test="param_name='page'">
                                                <xsl:value-of select="param_value"/>
                                          </xsl:if>
                                        </xsl:for-each>
                            </xsl:variable>
			  		
              <xsl:choose>
                                <xsl:when test="$logged='true'">
                           
                                       <ul data-role="listview">
                                            <li><a href="#info">Mes informations </a></li>
                                            <li><a href="#adr">Mes adresses</a></li>
                                            <li><a href="#histo">Historique des commandes</a></li>
                                            <li><a href="#" onclick="stopLogin()">Se déconnecter</a></li>
                                        </ul>
                                        
                                        <input type="hidden" id="page" value="{$current_page_adr}"  />
                                        <input type="hidden" id="currentalias" value="{$currentAlias}"  />
                                </xsl:when>
                                <xsl:otherwise>
                                
									 <script language="javascript"  >
                                        document.location.href=("/Web/?alias=identification");
                                     </script>
                                     
                                </xsl:otherwise>
                            </xsl:choose>
                            
             </xsl:if>
             
    <!--************************************************************Modifier une adresse***********************************************************-->
             <xsl:if test="$current_page_alias='edit.adress'"> 
                            <xsl:variable name="current_page_adr" >
                                        <xsl:for-each select="root/page_param_list/page_param">
                                          <xsl:if test="param_name='page'">
                                                <xsl:value-of select="param_value"/>
                                          </xsl:if>
                                        </xsl:for-each>
                            </xsl:variable>
                            
                   <xsl:for-each select="/root/adresse_info/adresse">
                   <xsl:if test="cliadr_id=$adr_id">
                           
                           

<div class="border_grey">
<div class="pink_title">Modifier votre adresse :</div>
 
<form id="adresse-change-form" name="compte_create_form" action="" method="POST" >
                            		
                                    <input type="hidden" id="pagealias" value="adresschange" />
                   				 	<input type="hidden" name="page_adr" id="page_adr" value="{$current_page_adr}" />
                                    
                                    <fieldset>
                                      <table cellspacing="5" class="adresse-change">
                                        <tbody>
												<tr>
                                                    <td width="170" valign="top">Nom &amp; Prénom :<span class="info-obligatoire">*</span> : </td>
                                                    <td colspan="2">
                                                    
                                                    <input type="text" name="cliadr_raison" id="cliadr_raison" value="{cliadr_raison}" />
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="170" valign="top">Adresse 1<span class="info-obligatoire">*</span> : </td>
                                                    <td colspan="2">
                                                    
                                                    <textarea name="cliadr_adresse1" id="cliadr_adresse1" rows="3" cols="30" style="text-transform: uppercase;" >
                                                    		<xsl:value-of select="cliadr_adresse1" />
                                                    </textarea>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Complément d'adresse  :</td>
                                                    <td colspan="2">
                                                        <input type="text" name="cliadr_adresse2" value="{cliadr_adresse2}" max="40"  style="text-transform: uppercase;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Code postal<span class="info-obligatoire">*</span> : </td>
                                                    <td colspan="2">
                                                          <input value="{cliadr_cp}" name="cliadr_cp" id="cliadr_cp" type="text" max="10"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ville<span class="info-obligatoire">*</span> : </td>
                                                    <td colspan="2">
                                                        <input value="{cliadr_ville}" name="cliadr_ville" id="cliadr_ville" type="text" style="text-transform: uppercase;"/>
                                                        <input type="hidden" name="cliadr_lien_pay_code" value="{cliadr_lien_pay_code}" max="40"  style="text-transform: uppercase;"/>
                                                    </td>
                                                </tr>                
                                                     
                                                <tr>
                                                    <td>Téléphone<span class="info-optionelle">*</span> : </td>
                                                    <td colspan="2">
                                                      <input value="{cliadr_tel}" name="cliadr_tel" id="cliadr_tel" type="text" maxlength="10" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                  <td height="53"></td>
                                                  <td width="197" align="right">
                                                   
                                                                     <a href="#" data-role="button" data-icon="delete" data-rel="back">Annuler</a>
                                                            
                                                  </td>
                                                  <td width="" align="right">
                                                                <input class="btn_buttom_input_purple" type="button" value="Valider" onclick="sendAdresseChange();"/>
                                                  </td>
                                                </tr>
                                        </tbody>
                                      </table>

                            <input type="hidden" name="cliadr_compteur" value="{cliadr_compteur}" />
                                        <input type="hidden" name="cliadr_lien_wconf_id" value="{cliadr_lien_wconf_id}" />
</fieldset>
                                </form>

</div>
                
                            
                     </xsl:if>
                   </xsl:for-each>
          	 </xsl:if>	
             
  <!--*****************************************************MON COMPTE CREATION ADRESSE**************************************************-->
             <xsl:if test="$current_page_alias='compte.adresse.create'"> 
             
                          <script src="/js/cs_adresseCreate.js" language="javascript" type="text/javascript" ></script>
                           <xsl:variable name="current_page_liv">
                                <xsl:for-each select="root/page_param_list/page_param">
                                  <xsl:if test="param_name='page'">
                                    <xsl:value-of select="param_value"/>
                                  </xsl:if>
                                </xsl:for-each>
                          </xsl:variable> 
                          
                           <xsl:variable name="current_page_origine">
                                <xsl:for-each select="root/page_param_list/page_param">
                                  <xsl:if test="param_name='page_origine'">
                                    <xsl:value-of select="param_value"/>
                                  </xsl:if>
                                </xsl:for-each>
                          </xsl:variable> 
                          
                            <div class="processdiv" align="center">
                            
                                <img src="../../images/process2.jpg" />
                            
                            </div>     
                
<div class="border_grey">    

<div class="pink_title"><img width="4" hspace="5" height="6" src="../../images/arrow_2.png" />Créer une nouvelle adresse de livraison :</div>
             
                  <form id="adresse-create-form" name="compte_create_form" action="/Web/pages/WPage.jsp?alias=compte.accueil&amp;page=adr" method="POST" >
                  
                        
                            <fieldset>
                            
                            <input type="hidden" id="pagealias" value="adresscreate" />
                                <p id="adresse-create-form-error-message"></p>
                                <table cellspacing="8" class="adresse-create">
                                    <tbody>

                                       
                                     
                                        <tr>
                                            <td>Nom<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                               <input value="" class="validate[required,custom[onlyLetter],length[0,100],custom[noSpecialCaracters]] text-input" name="nom" id="nom" type="text" style="text-transform: uppercase;" />

                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Prénom<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                                <input value="" class="validate[required,custom[onlyLetter],length[0,100],custom[noSpecialCaracters]] text-input" name="prenom" id="prenom" type="text" style="text-transform: uppercase;"  />

                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td>Adresse<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                                 <textarea class="validate[required,length[2,300]] text-input,custom[noSpecialCaracters]]" name="cliadr_adresse1_2" id="cliadr_adresse1_2" rows="3" cols="30" style="text-transform: uppercase;" ></textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Complément d'adresse:</td>
                                            <td colspan="2">
                                                 <textarea class="validate[optional,length[2,300]] text-input,custom[noSpecialCaracters]]" name="cliadr_adresse2_2" id="cliadr_adresse2_2" rows="3" cols="30" style="text-transform: uppercase;"></textarea>
                  
                                            </td>
                                        </tr>
                                      
                                        <tr>
                                            <td>Code postal<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                            
                                             <input value="" class="validate[required],custom[onlyNumber,length[2,10]] text-input" name="cliadr_cp_2" id="cliadr_cp_2" type="text"/>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ville<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                            
                                             <input value="" class="validate[required] text-input,custom[noSpecialCaracters,length[2,50]]]" name="cliadr_ville_2" id="cliadr_ville_2" type="text" style="text-transform: uppercase;"/>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Pays<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                                <select name="cliadr_lien_pay_code_2" id="cliadr_lien_pay_code_2" class="obligatoire" >
                                                 	<option value="FR">France</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Téléphone<span class="info-obligatoire">*</span> : </td>
                                            <td colspan="2">
                                            <input value="" class="validate[required,custom[telephone]] text-input,custom[noSpecialCaracters]]" name="cliadr_tel" id="cliadr_tel" type="text" maxlength="10"/>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="info-optionelle"></span>Portable - GSM :
                                            </td>
                                            <td colspan="2">
                                             
                                             <input value="" class="validate[optional,custom[telephone]] text-input,custom[noSpecialCaracters]]" name="cliadr_fax" id="cliadr_fax" type="text" />
  
                                            </td>
                                        </tr>
                                        <tr>
                                          <td>
                                        
                                        

                                                                 <input type="hidden" name="page_adr" id="page_adr" value="{$current_page_origine}" />

                                          </td>
                                          <td width="182" align="right"> 
                                          
                                          
                                          
<xsl:if test="$current_page_origine='choixadr'">
      


 <div class="btn_style_right">
                                                             <div class="btn_left_grey"></div>
                                                             <div class="btn_buttom_grey">
                                                                <input type="button" class="btn_buttom_input_grey" onclick="self.location.href='/Web/pages/WPage.jsp?alias=cde.adrchoix'" value="Annuler" />
                                                             </div>
                                                             <div class="btn_right_grey"></div>
                                                          </div>      
      
</xsl:if>
                                        
                                        
                                        
<xsl:if test="$current_page_origine='comptadr'">

                                                                                           <div class="btn_style_right">
                                                             <div class="btn_left_grey"></div>
                                                             <div class="btn_buttom_grey">
                                                              <input type="button" class="btn_buttom_input_grey" onClick="self.location.href='/Web/pages/WPage.jsp?alias=compte.accueil&amp;page=adr'" value="Annuler" />   
                                                             </div>
                                                             <div class="btn_right_grey"></div>
                                                          </div>  



  
</xsl:if>
                                         </td>
                                         <td width="" align="right">
                                            <div class="btn_style_right">
                                                             <div class="btn_left_purple"></div>
                                                             <div class="btn_buttom_purple">
                                                                <input class="btn_buttom_input_purple" type="submit" value="Valider"/>
                                                             </div>
                                                             <div class="btn_right_purple"></div>
                                                          </div>

                                         </td>
                                        </tr>
                                    </tbody>
                                </table>
                             
                                
                                
                             
                    </fieldset>
                        </form>
 </div>                    
                        
             </xsl:if>
          
    	      </div>
    
    
 
 <!--Body-->

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