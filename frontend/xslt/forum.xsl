<?xml version="1.0"  encoding="UTF-8"?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param name="eventid"/>
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes"/>
    <xsl:include href="page.xsl"/>
    <xsl:variable name="event"
                  select="document('../../database/events.xml')/events/event[@id='3926c5a3-ffa1-4d90-8498-12fb65e86637']"/>

    <xsl:template match="forum">
        <xsl:apply-templates select="forum"/>
    </xsl:template>
    <xsl:template match="forum">
        <div class="card mb-4 shadow-sm text-center">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal">
                    <xsl:value-of select="$event/name"/>
                </h2>
            </div>
            <div class="row justify-content-center mt-4">
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
            <div class="row justify-content-center">
                <div class="col-md-8 mt-4 rounded" style=";max-width:50%;border: 1px solid #ddd;">
                    <div align="left" class="border-bottom">
                        Von:  <span style="margin-left: 24px"> <xsl:value-of select="event/question/firstName"/></span>
                    </div>

                    <div align="left">
                        Frage: <span style="margin-left: 10px"> <xsl:value-of select="event/question/content"/></span>
                    </div>
                </div>
            </div>
            <form class="form needs-validation mt-4 mb-4" action="frontend/php/insertQuestion.php" method="POST"
                  accept-charset="UTF-8">
                <input type="hidden" name="eventid" value="{$eventid}"/>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-6">
                        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Vorname"
                               required="true"/>
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-6">
                        <textarea class="form-control" id="question" name="question" placeholder="Frage"
                                  required="true"/>
                    </div>
                </div>
                <div class="form-row justify-content-center mt-4">
                    <button type="submit" name="sendQuestion" value="submit" class="btn btn-primary">Post</button>
                </div>
            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>