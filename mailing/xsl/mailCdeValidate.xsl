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
−
<wuserWeb>
<usrweb_code>louzani@gmail.com</usrweb_code>
<usrweb_nom>ismail</usrweb_nom>
<usrweb_prenom>monsif</usrweb_prenom>
<usrweb_civilite>M</usrweb_civilite>
<usrweb_email>louzani@gmail.com</usrweb_email>
</wuserWeb>
−
<wclient>
<cli_code>1110002</cli_code>
<cli_enseigne>monsif</cli_enseigne>
<cli_raison>monsif</cli_raison>
<cli_siret>1234</cli_siret>
<cli_num_tva/>
<cli_franco_mt_ht>1000.0</cli_franco_mt_ht>
</wclient>
−
<listeAdresses>
+
<wclientAdresse>
<cliadr_index>1110002#0</cliadr_index>
<cliadr_lien_tad_code>0</cliadr_lien_tad_code>
<cliadr_enseigne>monsif</cliadr_enseigne>
<cliadr_raison>monsif</cliadr_raison>
<cliadr_adresse1>bb cc dd </cliadr_adresse1>
<cliadr_adresse2/>
<cliadr_adresse3/>
<cliadr_cp>20000</cliadr_cp>
<cliadr_ville>casa</cliadr_ville>
<cliadr_province/>
<cliadr_lien_pay_code>MA</cliadr_lien_pay_code>
<cliadr_tel/>
<cliadr_fax/>
<cliadr_email/>
<cliadr_id>1110002#174#ARTI_WEB</cliadr_id>
</wclientAdresse>
+
<wclientAdresse>
<cliadr_index>1110002#1</cliadr_index>
<cliadr_lien_tad_code>1</cliadr_lien_tad_code>
<cliadr_enseigne>monsif</cliadr_enseigne>
<cliadr_raison>monsif</cliadr_raison>
<cliadr_adresse1>bb cc dd </cliadr_adresse1>
<cliadr_adresse2/>
<cliadr_adresse3/>
<cliadr_cp>20000</cliadr_cp>
<cliadr_ville>casa</cliadr_ville>
<cliadr_province/>
<cliadr_lien_pay_code>MA</cliadr_lien_pay_code>
<cliadr_tel/>
<cliadr_fax/>
<cliadr_email/>
<cliadr_id>1110002#175#ARTI_WEB</cliadr_id>
</wclientAdresse>
+
<wclientAdresse>
<cliadr_index>1110002#2</cliadr_index>
<cliadr_lien_tad_code>2</cliadr_lien_tad_code>
<cliadr_enseigne>monsif</cliadr_enseigne>
<cliadr_raison>monsif</cliadr_raison>
<cliadr_adresse1>bb cc dd </cliadr_adresse1>
<cliadr_adresse2/>
<cliadr_adresse3/>
<cliadr_cp>20000</cliadr_cp>
<cliadr_ville>casa</cliadr_ville>
<cliadr_province/>
<cliadr_lien_pay_code>MA</cliadr_lien_pay_code>
<cliadr_tel/>
<cliadr_fax/>
<cliadr_email/>
<cliadr_id>1110002#176#ARTI_WEB</cliadr_id>
</wclientAdresse>
</listeAdresses>
+
<wstorecommandeentete>
<stocde_code>SCC095627</stocde_code>
<stocde_lien_modliv_code>INDEFINI</stocde_lien_modliv_code>
<stocde_lien_modreg_code>TR</stocde_lien_modreg_code>
<stocde_montant_article_remise_ht>1186.0</stocde_montant_article_remise_ht>
<stocde_montant_article_net_ht>1186.0</stocde_montant_article_net_ht>
<stocde_montant_financier_net_ht>1186.0</stocde_montant_financier_net_ht>
<stocde_montant_total_ht>1186.0</stocde_montant_total_ht>
<stocde_montant_total_tpf>0.0</stocde_montant_total_tpf>
<stocde_montant_total_contribution_ttc>0.0</stocde_montant_total_contribution_ttc>
<stocde_montant_total_tva>232.4</stocde_montant_total_tva>
<stocde_montant_total_ttc>1418.4</stocde_montant_total_ttc>
<stocde_montant_franco_ht>0.0</stocde_montant_franco_ht>
<stocde_montant_port_ht>0.0</stocde_montant_port_ht>
<stocde_montant_port_tva>0.0</stocde_montant_port_tva>
<stocde_montant_port_ttc>0.0</stocde_montant_port_ttc>
<stocde_remise_globale>0.0</stocde_remise_globale>
<stocde_date_creation>2010-12-28</stocde_date_creation>
<stocde_date_livraison>1899-12-31</stocde_date_livraison>
<stocde_montant_a_regler_ttc>1418.4</stocde_montant_a_regler_ttc>
<stocde_remarque_client/>
</wstorecommandeentete>
−
<liste_w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>72024</stocdd_lien_art_code>
<stocdd_qte_piece>2</stocdd_qte_piece>
<stocdd_piece_montant_tva>0.57</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>3.47</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>5.8</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>1.14</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>6.94</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>0.14</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>TIKA EMBRASSE OVALE</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>2.9</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>0.57</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>3.47</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>40</stocdd_colisage>
</w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>79320</stocdd_lien_art_code>
<stocdd_qte_piece>5</stocdd_qte_piece>
<stocdd_piece_montant_tva>0.9</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>5.5</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>23.0</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>4.5</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>27.5</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>0.35000000000000003</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>TIKA EMBRASSE RONDE</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>4.6</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>0.9</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>5.5</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>40</stocdd_colisage>
</w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>79337</stocdd_lien_art_code>
<stocdd_qte_piece>100</stocdd_qte_piece>
<stocdd_piece_montant_tva>0.9</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>5.5</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>459.99999999999994</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>90.0</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>550.0</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>7.000000000000001</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>TIKA EMBRASSE RONDE</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>4.6</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>0.9</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>5.5</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>40</stocdd_colisage>
</w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>86625</stocdd_lien_art_code>
<stocdd_qte_piece>10</stocdd_qte_piece>
<stocdd_piece_montant_tva>3.02</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>18.42</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>154.0</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>30.2</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>184.20000000000002</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>3.5</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>BOBO Nappe carré</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>15.4</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>3.02</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>18.42</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>20</stocdd_colisage>
</w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>86724</stocdd_lien_art_code>
<stocdd_qte_piece>18</stocdd_qte_piece>
<stocdd_piece_montant_tva>3.02</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>18.42</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>277.2</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>54.36</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>331.56000000000006</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>6.3</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>BOBO Nappe carré</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>15.4</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>3.02</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>18.42</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>20</stocdd_colisage>
</w_store_commande_detail>
+
<w_store_commande_detail>
<stocdd_lien_stocde_code>SCC095627</stocdd_lien_stocde_code>
<stocdd_lien_art_code>88216</stocdd_lien_art_code>
<stocdd_qte_piece>20</stocdd_qte_piece>
<stocdd_piece_montant_tva>2.61</stocdd_piece_montant_tva>
<stocdd_piece_prix_ttc>15.91</stocdd_piece_prix_ttc>
<stocdd_ligne_montant_ht>266.0</stocdd_ligne_montant_ht>
<stocdd_ligne_montant_tva>52.199999999999996</stocdd_ligne_montant_tva>
<stocdd_ligne_montant_ttc>318.2</stocdd_ligne_montant_ttc>
<stocdd_remise_ligne_1>0.0</stocdd_remise_ligne_1>
<stocdd_remise_ligne_2>0.0</stocdd_remise_ligne_2>
<stocdd_prix_net>0</stocdd_prix_net>
<stocdd_ligne_poids>17.0</stocdd_ligne_poids>
<stocdd_ligne_volume>0.0</stocdd_ligne_volume>
<stocdd_libelle>BOETIE Nappe rectangle</stocdd_libelle>
<stocdd_piece_tarif_prix_ht>13.3</stocdd_piece_tarif_prix_ht>
<stocdd_piece_tarif_montant_tva>2.61</stocdd_piece_tarif_montant_tva>
<stocdd_piece_tarif_prix_ttc>15.91</stocdd_piece_tarif_prix_ttc>
<stocdd_colisage>10</stocdd_colisage>
</w_store_commande_detail>
</liste_w_store_commande_detail>
</root>
</root>
        
        
        
        
        
        -->
    
    <xsl:output method="html"
    encoding="utf-8"  
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    doctype-public="-//W3C//DTD HTML 4.01//EN" />

<xsl:template match="/root">
 <html>
      <head>
     		<style type="text/css">
				body{ font-size:9px; font-family:Arial, Helvetica, sans-serif;}
			</style>
      </head>
  <body>


<table class="table_confirmationdecommande" width="768" border="0" cellpadding="0" cellspacing="0" style="font-size:11px; font-weight: bold;">
<tbody>
<tr>
	<td colspan="2">Cher/Chère,  <xsl:value-of select="wuserWeb/usrweb_nom" />&#160;<xsl:value-of select="wuserWeb/usrweb_prenom" />,<br />
	  <br />
	  Merci  de votre commande sur notre site. Celle-ci a été enregistrée sous  le numéro : <xsl:value-of select="wstorecommandeentete/stocde_code" /> ; Elle est désormais en cours de traitement.<br />
Un e-mail vous sera envoyé le jour de son expédition de nos entrepôts.<br />
	  <br />
	  <br />
	  <strong>Récapitulatif de votre commande :</strong><br />
	

	  <br />
	   Valeurs  exprimées en euros :<br /></td>
</tr>
<tr>
<td colspan="2" height="33">
    <table width="100%" border="1" cellpadding="0" cellspacing="0" id="table-commande-detail" style="border:1px solid #E1E1E1; font-size:11px" bordercolor="#E1E1E1">
    
        <tr>
            <th width="146" height="28" class="tab_reference" style="color: #9F0684;"> Référence</th>
            <th width="170" class="tab_libelle" style=" color: #9F0684;" > Article(s)</th>
            <th width="123" class="tab_nb_piece" style=" color: #9F0684;" >Quantité</th>
            <th width="144" class="tab_prix_uht" style="color: #9F0684;" >Prix unitaire</th>
            <th width="158" class="tab_montant" style="color: #9F0684;" >Total HT</th>
        </tr>
        
        
        <xsl:for-each select="liste_w_store_commande_detail/w_store_commande_detail">
        <tr class="ligne-commande-detail">
            <td height="23" align="center" valign="middle" class="tab_ref"  ><xsl:value-of select="stocdd_lien_art_code"/></td>
            <td align="center" valign="middle" class="lib"  ><xsl:value-of select="stocdd_libelle"/></td>
            <td align="center" valign="middle" class="nb_pce"  ><xsl:value-of select="stocdd_qte_piece"/></td>
            <td valign="middle" class="prh" align="center"><xsl:value-of select="format-number((stocdd_piece_prix_ht),'#0.00')"/> €</td>
            <td align="center" valign="middle" class="prt"  ><xsl:value-of select="format-number((stocdd_ligne_montant_ht),'#0.00')"/> €</td>
        </tr>
        </xsl:for-each>
    </table>
</td>
</tr>
<tr>
<td colspan="2" align="right" height="32">
<br />



            <table width="500" class="tabledta" align="right">
                        <tr>
                          <td height="30" align="center" class="blutd" style="font-size:12px; color:#9F0684; background-color:#AED1E6"><strong>Sous-total HT</strong></td>
                            <td width="317" align="center" class="blutd" style="font-size:12px; color:#9F0684; background-color:#AED1E6">
                            <strong><xsl:value-of select="format-number(wstorecommandeentete/stocde_montant_article_remise_ht,'#0.00')" />  €</strong>
                            </td>
                        </tr>
                      
                   
                      <tr>
                      
                        <td height="31" align="center" class="blutd" style="font-size:12px; color:#9F0684; background-color:#AED1E6">
                        	<strong>Frais de transport</strong>
                        	
                        </td>
                        <td class="blutd" align="center" style="font-size:12px; color:#9F0684; background-color:#AED1E6">
                         
						 <strong> <xsl:value-of select="format-number(wstorecommandeentete/stocde_montant_port_ht,'0.00')"/>  €</strong>
							 
                        </td>
                      </tr>
                    
                    
                       <tr>
                         <td height="31" align="center" class="blutd" style="font-size:12px; color:#9F0684; background-color:#AED1E6"><span class="blutd" style="font-size:12px; color:#9F0684"><strong>Total HT</strong></span></td>
                         <td align="center" style="font-size:12px; color:#9F0684; background-color:#AED1E6"><strong><xsl:value-of select="format-number(wstorecommandeentete/stocde_montant_total_ht,'#0.00')"/> €</strong></td>
                       </tr> 
                       <tr>
                         <td height="31" align="center" class="blutd" style="font-size:12px; color:#9F0684; background-color:#AED1E6"><span class="blutd" style="font-size:12px; color:#9F0684"><strong>Total TTC</strong></span></td>
                         <td align="center" style="font-size:12px; color:#9F0684; background-color:#AED1E6"><strong><xsl:value-of select="format-number(wstorecommandeentete/stocde_montant_total_ttc,'#0.00')"/> €</strong></td>
                       </tr>
                     
                                    </table>
            <br />
            <br />
            <br />
</td>
</tr>

<tr bgcolor="#CCCCCC">
    <td height="33" align="center" class="text_titre_blanc"><strong>Adresse de facturation </strong></td>
    <td width="396" align="center" class="text_titre_blanc" style="position: inherit; text-align: center;"><strong>Adresse de livraison </strong></td>
</tr>
<tr>
<td class="text_titre_blanc_text" valign="top" width="372" align="center" height="33">
<br />
  
    <table id="table_adresse_confirmation" width="238" border="0" cellpadding="0" cellspacing="3" style="border:1px solid #E1E1E1; font-size:11px">
    <tbody>
      
       <tr>
            <td width="234" align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_raison" /></td>
        </tr>
        <tr></tr>
       
        
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_adresse1" /></td>
        </tr>
        <tr>
             <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_adresse2" /></td>
        </tr>
        <tr>
             <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_adresse3" /></td>
        </tr>
      <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_cp" /></td>
        </tr>
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_ville" /></td>
        </tr>
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_tel" /></td>
        </tr>
        <tr></tr>
       
    </tbody>
    </table>
  
</td>

<td valign="top" align="center"><br />
<table id="table_adresse_confirmation" width="238" border="0" cellpadding="0" cellspacing="3" style="border:1px solid #E1E1E1; font-size:11px">
<tbody>
	
       <tr>
            <td width="234" align="center" class="tab_reference2"><xsl:value-of select="w_adresse_fact/cliadr_raison" /></td>
        </tr>
        <tr></tr>
       
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_adresse1" /></td>
        </tr>
        <tr>
             <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_adresse2" /></td>
        </tr>
        <tr>
             <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_adresse3" /></td>
        </tr>
      <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_cp" /></td>
        </tr>
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_ville" /></td>
        </tr>
        <tr>
            <td align="center" class="tab_reference2"><xsl:value-of select="w_adresse_liv/cliadr_tel" /></td>
        </tr>
        <tr></tr>
</tbody>
</table>

</td>
</tr>
    <tr>
        <td style="height: 47px;" colspan="2" height="144">  <br />
		Moyen de réglement choisi  :  <xsl:value-of select="w_mode_reglement_res/modregres_libelle" /><br />
		<br />
		<!--<strong>Informations concernant le débit de votre compte bancaire:</strong> <br />
		Commande réglée par Carte bancaire :<br /> 
		Il s'agit d'un paiement comptant, l'intégralité du montant de votre commande a été envoyé à votre banque pour un débit immédiat.<br /><br />
		Commande réglée par un financement Cetelem :<br /> 
		En fonction du choix de financement en 3 ou 4 x, vous avez été débité à la comamnde soit d'un 1/3 soit d'un 1/4 du montant total TTC de votre comamnde sur le compte associé à la carte bancaire enregistrée.<br />
		Les 2 ou 3 mensualités suivantes seront prélevées par Cetelem sur le compte associé au RIB communiqué.<br /> <br />-->
        </td>
    </tr>
    <tr>
    	<td></td>
    </tr>
    
    <tr>
        <td class="text_titre_blanc" colspan="2" align="left" height="25" style="border:1px solid #E1E1E1; padding:3px"><br />
          Pour toute question sur votre commande, notre service Clients se tient à votre disposition par email : <u><a href="mailto:imagin@imagin-jouets.com" target="_blank">imagin@imagin-jouets.com</a></u> et  par téléphone au : 04 71 66 12 12 <br />
 
          
          <br />
<br />
Merci encore de votre commande et à bientôt sur IMAGIN ! <br />
<br />
Cordialement, <br />
<br />
IMAGIN.
</td>
    </tr>

</tbody>

</table>
<p>&#160;</p>
<p>&#160;</p>
<p style="font-size:9px"></p>
  </body>
</html>

</xsl:template>

</xsl:stylesheet>
