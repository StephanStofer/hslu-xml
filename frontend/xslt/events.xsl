<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    <xsl:include href="page.xsl" />
    <xsl:template match="events">
        <section>
            <div class="container">
                <h1 class="text-center">Main design to be defined</h1>
            </div>
            <div class="container">
                <div class="card-deck mb-3">
                    <xsl:apply-templates select="event"/>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="event">
        <div class="card mb-4 shadow-sm text-center">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">
                    <xsl:value-of select="name"/>
                </h4>
            </div>
            <div class="card-body">
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="settings/image/@path"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="settings/image/@alt"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>card-img-top</xsl:text>
                    </xsl:attribute>
                </img>
                <p>
                    <xsl:value-of select="description"/>
                </p>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>
                        <xsl:value-of select="name"/>
                    </li>
                </ul>
                <button type="button" class="btn btn-primary" alt="Anmeldung" style="margin-right: 4px;">Anmeldung</button>
                <button type="button" class="btn btn-primary" alt="Forum">Forum</button>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>