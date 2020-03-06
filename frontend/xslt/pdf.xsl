<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:param name="eventid" select="default"/>

    <xsl:template match="events">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="order_confirmation" page-height="29.7cm" page-width="21cm"
                                       margin-top="1cm"
                                       margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="2cm"/>
                    <fo:region-after extent="3cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="order_confirmation">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="left" font-size="8pt">
                        Bestellbestätigung / Page
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="19pt" font-family="sans-serif" line-height="24pt" space-after.optimum="20pt"
                              background-color="blue" color="white" text-align="center" padding-top="5pt"
                              padding-bottom="5pt">Bestellbestätigung
                    </fo:block><!-- For each event ...  -->
                    <xsl:apply-templates select="event"/>
<!--                    <xsl:call-template name="event">-->
<!--                        <xsl:with-param name="personId" select="default"/>-->
<!--                    </xsl:call-template>-->
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="event">
<!--        <xsl:param name="personId"/>-->
        <xsl:if test="participants/person[@id = $personId]">
<!--        <xsl:if test="participants/person">-->
            <fo:table space-after.optimum="20pt" width="13cm" font-size="11pt">
                <fo:table-header background-color="#122334">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>Bezeichnung</fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>Optionen</fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>Preis</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-footer>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block number-columns-spanned="2">
                                Total
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
<!--                                <xsl:value-of select="sum(event/participants/person/service/@price)"/>-->
                                                                <xsl:value-of select="sum(event/participants/person[@id = $personId]/service/@price)"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-footer>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-size="16pt" color="blue" font-weight="900" text-align="left">
                                <xsl:value-of select="event/name"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding-top="8pt" number-columns-spanned="2" padding-bottom="10pt">
                            <fo:block>
<!--                                <xsl:value-of select="event/participants/person/service"/>-->
                                <xsl:value-of select="event/participants/person[@id = $personId]/service"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
<!--                                <xsl:value-of select="event/participants/person/service/@price"/>-->
                                <xsl:value-of select="event/participants/person[@id = $personId]/service/@price"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
