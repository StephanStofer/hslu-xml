<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:param name="personId" select="default"/>
    <xsl:param name="eventId" select="default"/>

    <xsl:template match="events">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="order_confirmation" page-height="29.7cm" page-width="21cm"
                                       margin-top="1cm"
                                       margin-bottom="1cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="order_confirmation">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="right" font-size="8pt">
                        Anmeldebestätigung / Seite
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after" text-align="right" font-size="8pt">
                    <fo:block>
                        Sportzentrum Willisau
                    </fo:block>
                    <fo:block>
                        Schlossfeldstrasse 10
                    </fo:block>
                    <fo:block>
                        6130 Willisau
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="19pt" font-family="sans-serif" line-height="24pt" space-after.optimum="20pt"
                              text-align="center" padding-top="5pt"
                              padding-bottom="5pt">Anmeldebestätigung
                    </fo:block>
                    <fo:block>

                    </fo:block>
                    <xsl:apply-templates select="event[@id=$eventId]"/>
                    <!--                    <xsl:apply-templates select="event"/>-->
                    <!--<xsl:call-template name="event">
                        <xsl:with-param name="personId" select="default"/>
                    </xsl:call-template>-->
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="event">
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@firstName"/>
        </fo:block>
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@lastName"/>
        </fo:block>
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@address"/>
        </fo:block>
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@postCode"/>
            <xsl:value-of select="participants/person[@id=$personId]/@city"/>
        </fo:block>
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@email"/>
        </fo:block>
        <fo:block>
            <xsl:value-of select="participants/person[@id=$personId]/@phone"/>
        </fo:block>
        <xsl:if test="participants/person[@id = $personId]">
            <fo:table space-before.optimum="20pt" space-after.optimum="20pt" font-size="11pt">
                <fo:table-header border-style="solid" border-width="0.5pt" padding-top="2mm" margin="5mm"
                                 font-size="12pt">
                    <fo:table-row>
                        <fo:table-cell number-columns-spanned="3">
                            <fo:block>Bezeichnung</fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>Preis in CHF</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-footer border-style="solid" border-width="0.5pt" padding-top="10mm" margin="5mm"
                                 font-style="bold"
                                 font-size="12pt">
                    <fo:table-row>
                        <fo:table-cell number-columns-spanned="3">
                            <fo:block text-transform="uppercase">
                                Total
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:value-of select="sum(//event/@price)"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-footer>
                <fo:table-body border-style="solid" border-width="0.5pt" padding-top="5mm" margin="5mm">
                    <fo:table-row>
                        <fo:table-cell number-columns-spanned="3">
                            <fo:block text-align="left">
                                <xsl:value-of select="name"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:value-of select="//event/@price"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <xsl:if test="participants/person[@id=$personId]/@op1 or participants/person[@id=$personId]/@op2 or participants/person[@id=$personId]/@op3">
                        <fo:table-row>
                            <fo:table-cell number-columns-spanned="4" margin-left="15mm">
                                <fo:block font-weight="700" font-size="10pt">
                                    Gewählte Optionen:
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="participants/person[@id=$personId]/@op1">
                        <fo:table-row>
                            <fo:table-cell margin-left="15mm" number-columns-spanned="3">
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='1']/@title"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='1']/@price"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="participants/person[@id=$personId]/@op2">
                        <fo:table-row>
                            <fo:table-cell margin-left="15mm" number-columns-spanned="3">
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='2']/@title"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='2']/@price"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="participants/person[@id=$personId]/@op3">
                        <fo:table-row>
                            <fo:table-cell margin-left="15mm" number-columns-spanned="3">
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='3']/@title"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>
                                    <xsl:value-of select="additionalServices/service[@id='3']/@price"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                </fo:table-body>
            </fo:table>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
