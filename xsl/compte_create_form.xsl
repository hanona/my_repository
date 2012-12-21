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
           <title>IMAGIN</title>
  
          
           
      </head>
     <body class="ui-mobile-viewport">


<div data-role="page">
    
    <div data-role="header" class="ui-header ui-bar-a" role="banner">
        <h1 class="ui-title" tabindex="0" role="heading" aria-level="1">Acme Corporation</h1>
    </div>
    
    <div data-role="content" class="ui-content" role="main">
        
        <form id="frmLogin" class="validate">
          
            <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
                <label for="email" class="ui-input-text"><em>* </em> Email : </label>
                <input type="text" id="email" name="email" class="required email ui-input-text ui-body-c ui-corner-all ui-shadow-inset error"/>
            </div>
            
            <div data-role="fieldcontain" class="ui-field-contain ui-body ui-br">
                <label for="password" class="ui-input-text"><em>* </em>Password: </label>
                <input type="password" id="password" name="password" class="required ui-input-text ui-body-c ui-corner-all ui-shadow-inset valid"/>
            </div>
            
            <div class="ui-body ui-body-b">
                <button class="btnLogin ui-btn-hidden" type="submit" data-theme="a" aria-disabled="false">Login</button>
            </div>
        </form>
        
    </div>
    
</div>

<script type="text/javascript">//<![CDATA[ 
$(function(){
$("#frmLogin").validate({
    submitHandler: function(form) {
        console.log("Call Login Action");
    }
});
});//]]>  

</script>
</body>

    </html>

  </xsl:template>
  


</xsl:stylesheet>