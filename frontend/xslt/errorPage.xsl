<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" />
    <xsl:include href="page.xsl" />
    <xsl:template match="*">
        <div class="row mt-5 py-5"></div>
        <div class="row my-5">
            <div class="col-3">
                <i class="fab fa-accessible-icon fa-9x"></i>
            </div>
            <div class="col-9 mt-3">
                <h1>Oops, da ist was schiefgelaufen...</h1>
                <p class="lead">Gerne helfen wir Ihnen telefonisch weiter.</p>
            </div>
        </div>
        <div class="row mb-5 py-5"></div>
    </xsl:template>
</xsl:stylesheet>