<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : fmx_main.xsl
    Created on : 31 janvier 2009, 18:25
    Author     : Max
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

        <!-- Exemple de la structure du fichier XML manipulé pour l'envoi des identifiants
        <root>
            <w_user_web>
                <usrweb_code>code d'accès de l'utilisateur</usrweb_code>
                <usrweb_nom>nom de l'utilisateur</usrweb_nom>
                <usrweb_prenom>prénom de l'utilisateur</usrweb_prenom>
                <usrweb_password>mot de passe</usrweb_password>
                <usrweb_email>email de l'utisateur</usrweb_email>
            </w_user_web>
        </root>
        -->
    
    <xsl:output method="html"
    encoding="utf-8"  
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN" />

<xsl:template match="/root">
 <html>
      <head>
      </head>
  <body>
Madame, Monsieur,<br /><br />

<!--<xsl:value-of select="mail_source" /> <br /><br />-->
        <xsl:value-of select="nom_prenom_source" /> vous invite à découvrir notre boutique : <br /><br />
        
        <xsl:value-of select="mail_message" />
	<br />
	<a href="http://www.ladecodelea.com/ColCMS/{translate(alias,';','&amp;') }"><u>Découvrir maintenant</u> </a>
         
          <br /><br />
       

 Cordialement, <br /><br />
 L'équipe de Léa

</body>
</html>

    </xsl:template>

</xsl:stylesheet>
