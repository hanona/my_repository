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
            <wArticleEntreeInfo>
                <artent_index>code de la WArticleEntreeInfo</artent_index>
                <artent_lien_code_article>code de l'article</artent_lien_code_article>
                <artent_lien_code_client>code client</artent_lien_code_client>
                <artent_lien_code_usrweb>code utilisateur web</artent_lien_code_usrweb>
            </wArticleEntreeInfo>
        </root>
        -->
    
    <xsl:output method="html"
    encoding="utf-8"  
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN" />

<xsl:template match="/root/wArticleEntreeInfo">
 <html>
      <head>
      </head>
  <body>


Bonjour ,<br /><br />

J'ai le plaisir de vous informer que l'article que vous désirez est maintenant disponible.<br />

<br />
<a href="/ColCMS/pages/WPage.jsp?alias=detail.art&amp;art_code={artent_lien_code_article}">Voir le produit maintenant.</a> <br /><br />

IMAGIN.<br />



</body>

</html>

</xsl:template>


</xsl:stylesheet>
