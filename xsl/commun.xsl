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

    <html><head>
        <meta http-equiv="MSThemeCompatible" content="No"/>
        <title>
          COLINTERNET MOBILE
        </title>
        
  	
</head>
     <body>
 <div data-role="page" id="page">
                  <div data-role="header" data-position="fixed">
                          <xsl:copy-of select="$headerApp" />  
                    </div>
                    <div data-role="content" data-theme="c">	    

				 
       			
                <xsl:if test="$currentAlias='contact'">  
							
                                <div id="center_column" class="round5">
                                    <h2 class="round5t category_title_grp">Contactez-nous</h2>
                                    <p class="bold">Pour des questions &#224; propos d'une commande ou des informations sur nos produits.</p>

                                <form class="std" method="post"> <input id="pagealias" type="hidden" value="contact" /> 
                                  <fieldset>
                                    <h3>Envoyez un message</h3>
                                    <p class="select"><label for="id_contact">Objet</label> 
                                    <select id="id_contact" class="validate[required]" name="id_contact"> 
                                       <!-- <option >Choisir</option> -->
                                       <option value="Service client">Service client</option> 
                                    </select>
                                    </p>
                                    <p id="desc_contact2" class="desc_contact" align="center">Pour toute question ou r&#233;clamation sur une commande</p>
                                    <p class="text"><label for="email">Votre adresse e-mail</label> 
                                    
                                    <xsl:if test="$logged='true'">
                                    <input id="email" class="validate[required,custom[email]]" name="from" type="text" value="{$current_user_web_code}" />
                                    </xsl:if>
                                   
                                   <xsl:if test="$logged='false'">
                                   <input id="email" class="validate[required,custom[email]]" name="from" type="text" value="" />
									</xsl:if>
                                    
                                    </p>
                                    <p class="textarea"><!--validate[required] -->
                                        <label for="message">Message</label> 
                                        <textarea id="message" cols="35" rows="7" name="message" class="widgEditor"></textarea>
                                    </p>
                                    <p class="submit"><input id="submitMessage" class="button_large" name="submitMessage" type="submit" value="Envoyer" /></p>
                                  </fieldset>
                               </form>
                              </div>
             </xsl:if>	
             
             	<xsl:if test="$currentAlias='identification'">
                	<div id="center_column" class="round5" style="width:634px">
						<h2 class="round5t UniversCondensedBold">Identifiez-vous</h2>
 
                <div id="authentication"><!-- /Steps --> 
                <form id="create-account_form" class="std" method="post"> 
                 
                            <h3>Cr&#233;ez votre compte</h3>
                            <h4>Entrez votre adresse e-mail pour cr&#233;er votre compte.</h4>
                            <p class="text">
                                    Adresse e-mail  <span><input id="email_create" name="userweb_code" type="text"  data-mini="true"/></span>
                             </p>
                            <p class="submit">
                                    <a href ="/Web/?alias=compte.create"  data-role="button" data-inline="true" data-theme="e" data-icon="info" data-mini="true">Créez votre compte</a>
                             </p>
                </form>
                <form id="login_form" class="std" method="post"> 
                            <h3>Déjà enregistré ?</h3>
                            <p class="text">    <input type="hidden" id="countCmd" name="countCmd" value="{/root/commande_apercu/commande/detail_ligne_count}" />
                                Adresse e-mail <span><input id="userweb_code2"  name="userweb_code2" type="text" data-mini="true" /></span>
                             </p>
                             <p class="text">
                                Mot de passe  <span><input id="user_password"  onclick="this.value='';" onkeypress="if (event.keyCode == 13) startLogin();" name="user_password" type="password" data-mini="true" /></span>
                            </p>
                            <p class="submit">
                                    <a href ="#"  data-role="button" data-inline="true" data-theme="b" data-icon="star" onclick="startLogin();" data-mini="true">Identifiez-vous</a>
                                    <!--<input id="SubmitLogin" class="button" onclick="startLogin();" name="SubmitLogin" type="button" value="Identifiez-vous" />-->
                            </p>
                            <p class="lost_password"><a href="/Web/?alias=forget.pwd">Mot de passe oublié ?</a></p>
                     
                </form>
                    <div style="clear: both">
                             <p style="text-align: center">Pour accéder à toutes les informations du site, merci de créer votre compte ou de renseigner vos paramètres de connexion</p>
                    </div>
                </div>
                </div>
       </xsl:if>
       
            <xsl:if test="$currentAlias!='identification'"> 
                  <xsl:copy-of select="root/cpage/page_contenu"/>
            </xsl:if>
            
            <!--Lien Plus-->
            <xsl:if test="$currentAlias='rubrique'">
           		 <ul data-role="listview" data-inset="true" >
 					<li><a href="/Web/?alias=mentionslegales">Mention Légales</a></li>
                    <li><a href="/Web/?alias=cond.gen">Coditions générales du vente</a></li>
                    <li><a href="/Web/?alias=contact">Contact</a></li>
                 </ul>   
            </xsl:if>
            
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