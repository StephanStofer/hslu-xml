<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    <xsl:include href="page.xsl" />
    <xsl:template match="events">
        <div class="container">
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">Fluid jumbotron</h1>
                    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
                </div>
            </div>
            <div class="card-deck">
            <xsl:apply-templates select="event"/>
            </div>
            
        </div>

    </xsl:template>
    <xsl:template match="event">
        <div class="card mb-4 shadow-sm text-center">
            <div class="card-header">
                <h5 class="my-0 font-weight-normal">
                    <xsl:value-of select="name"/>
                </h5>
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
                <ul class="list-unstyled mt-3 mb-4">
                    <li>
                        <xsl:value-of select="name"/>
                    </li>
                </ul>
				<a href="singleevent.php?eventid={@id}" class="btn btn-outline-primary">Anmeldung</a>
            </div>
        </div>
    
    </xsl:template>
</xsl:stylesheet>