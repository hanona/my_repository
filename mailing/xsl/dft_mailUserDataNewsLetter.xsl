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
            <>
                <nletter_index>code de la newsletter</nletter_index>
                <nletter_user_web_code>code de l'utilisateur</nletter_user_web_code>
                <nletter_email>l'adresse mail</nletter_email>
                <nletter_actif>etat de la newsletter</nletter_actif>
            </NewsLetter>
        </root>
        -->
    
    <xsl:output method="html"
    encoding="utf-8"  
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN" />

<xsl:template match="/root/NewsLetter">
 <html>
      <head>
      </head>
  <body>


Bonjour, <br />

Nous avons le plaisir de vous confirmer votre inscription à notre newsletter. Nous vous enverrons régulièrement 
nos offres ainsi que nos dernières nouveautés pour que vous soyez toujours les premiers informés. <br />

Accédez directement au site  <a href="http://www.imagin-loisirs.com/Web/?alias=accueil" target="_blank">Cliquez ici.</a><br /><br />

A très bientôt,<br />
Le service Clients IMAGIN <br />




</body></html>
</xsl:template>


</xsl:stylesheet>
