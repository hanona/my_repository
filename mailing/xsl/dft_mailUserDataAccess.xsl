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

<xsl:if test="usrweb_actif='0'">

Nous avons le plaisir de vous compter parmi nous. Votre compte a bien été enregistré.<br /><br />

Pense-bête :
<br />


Votre login : <xsl:value-of select="usrweb_code" /><br />
Votre mot de passe : <xsl:value-of select="usrweb_password" /><br /><br />

A tout de suite sur notre site, <a href="http://www.imagin-loisirs.com/Web/?alias=accueil" target="_blank">accès direct</a><br />

<br />
Cordialement,<br />
Le service Clients IMAGIN.

</xsl:if>

<xsl:if test="usrweb_actif='2'">

Nous vous informons que votre compte client a été supprimé de notre base client.<br /><br />

Si vous souhaitez connaitre les raisons de cette suppression, envoyez-nous un email à <a href="mailto:imagin@imagin-jouets.com">imagin@imagin-jouets.com</a> <!--ou contactez-nous par téléphone au 01 30 66 08 90.-->
<br /><br />


Cordialement,

 

Le service Clients IMAGIN.<br />




</xsl:if>

<xsl:if test="usrweb_actif='1'">

Votre demande d'inscription sur notre site a bien été prise en compte, elle va être traitée rapidement par notre équipe commerciale.<br />


Dans cette attenten veuillez recevoir l'expression de nos sentiments, dévoués.

<br /><br />


 

L'équipe IMAGIN.<br />
</xsl:if>


</body></html>

    </xsl:template>


</xsl:stylesheet>
