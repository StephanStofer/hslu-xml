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
                    <h1 class="display-4">Sportzentrum Willisau</h1>
                    <p class="lead"><span>Das herrlich über dem Städtli Willisau gelegene Sportzentrum ist fast einmalig in seiner Art. Im Umkreis von nur 300 m präsentiert sich eine einzigartige Sport-Infrastruktur, welche sich hervorragend eignet für Kurse, Lager und Wettkämpfe. 9 Turnhallen, 5 Rasenfelder, Leichtathletik-Anlagen mit 400m-Bahn, 2 Hartplätze, 4 Beachfelder, Kraftraum, Gymnastikraum, Ringer- und Schwingerhallen, Hallenbad, Freibad, Finnenbahn, Vitaparcours, NordicWalking-Park, Bikegelände, Unterkünfte für 300 Personen, Küchen, Ess-, Theorie- und Aufenthaltsräume, Spielplätze lassen (fast) keine Wünsche offen.  <br/>
                        Das freundliche, aufgestellte und dienstleistungsfreudige Sportzentrum-Team freut sich auf ihren Besuch.
                    </span></p>
                </div>
            </div>
            <h2 class="mb-3 mt-3">Aktuelle Sportangebote</h2>
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
                        <xsl:text>card-img-top mb-5</xsl:text>
                    </xsl:attribute>
                </img>
				<a href="singleevent.php?eventid={@id}" class="btn btn-outline-primary">Details</a>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>