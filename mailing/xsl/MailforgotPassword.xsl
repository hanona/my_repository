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

<xsl:template match="/root/w_user_web">
 <html>
      <head>
      </head>
  <body>


Bonjour <xsl:value-of select="usrweb_prenom" />&#160;<xsl:value-of select="usrweb_nom" />,<br /><br />



Conformément à votre demande, voici vos indentifiants de connexion :<br />
<br />


Identifiant - Email : <xsl:value-of select="usrweb_code" /><br />
Mot de passe : <xsl:value-of select="usrweb_password" /><br /><br />

<br />
Nous vous recommandons de conserver cet e-mail. 

<br />
<br />
Pour accéder à votre profil, cliquez sur ce lien : <a href="http://www.imagin-loisirs.com/ColCMS/identification.html" target="_blank">http://www.imagin-loisirs.com</a><br />

<br />

Merci de votre confiance, 
<br />
<br />
<br />
Cordialement,<br />
L'équipe IMAGIN
<br />
<br />
Conformément à la loi Informatique et Libertés du 6 janvier 1978, vous possédez un droit de rectification ou de suppression des données personnelles vous concernant.

</body></html>

    </xsl:template>


</xsl:stylesheet>
