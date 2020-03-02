<?xml version="1.0"  encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param name="eventid" />
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />
    <xsl:include href="page.xsl" />
    <xsl:variable name="event" select="document('../../database/events.xml')/events/event[@id='3926c5a3-ffa1-4d90-8498-12fb65e86637']"/>

    <xsl:template match="forum">
            <xsl:apply-templates select="event[@id='3926c5a3-ffa1-4d90-8498-12fb65e86637']"/>
    </xsl:template>
    <xsl:template match="event">
        <div class="card mb-4 shadow-sm text-center">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal">
                    <xsl:value-of select="$event/name"/>
                </h2>
            </div>
            <div class="row justify-content-center">
                <img style=";border: 1px solid #ddd; border-radius: 4px;  max-width: 60%;  height: auto;">
                <xsl:attribute name="src">
                    <xsl:value-of select="$event/settings/image/@path"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="$event/settings/image/@alt"/>
                </xsl:attribute>
                </img>
            </div>
            <div class="row justify-content-center">
                <div class="mt-4 rounded" style=";max-width:80%;border: 1px solid #ddd;">
                    <p align="left" class="px-2">
                        <xsl:value-of select="$event/description"/>
                    </p>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>