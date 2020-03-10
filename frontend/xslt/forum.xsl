<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xml>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param name="eventid" select="default"/>
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    <xsl:include href="page.xsl"/>
    <xsl:variable name="event" select="document('../../database/events.xml')/events/event[@id=$eventid]"/>

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
            <div class="card-body">
                <!--all Questions-->
                <xsl:for-each select="event[@id=$eventid]/question">
                    <xsl:sort select="position()" data-type="number" order="descending"/>
                    <xsl:variable name="questionid" select="@id"/>
                    <div class="row justify-content-center">
                        <div style="width:600px;margin:0 auto" class="shadow p-3 mb-5 bg-white rounded">
                            <div class="card-header">
                                <div align="left" class="border-bottom">
                                    Von:
                                    <span style="margin-left: 24px">
                                        <xsl:value-of select="firstName"/>
                                    </span>
                                    <span class="float-right">
                                        <xsl:value-of select="time"/>
                                    </span>
                                </div>
                                <div align="left">
                                    Frage:
                                    <span style="margin-left: 10px">
                                        <xsl:value-of select="content"/>
                                    </span>
                                </div>
                            </div>
                            <!--all Answers-->
                            <xsl:for-each select="answer">
                                <xsl:sort select="position()" data-type="number" order="descending"/>
                                <xsl:if test="position() = 1">
                                    <div class="mt-1 ml-4 card px-2 py-2 ">
                                        <div align="left" class="border-bottom">
                                            Von:
                                            <span style="margin-left: 40px">
                                                <xsl:value-of select="firstName"/>
                                            </span>
                                            <span class="float-right">
                                                <xsl:value-of select="time"/>
                                            </span>
                                        </div>
                                        <div align="left">
                                            Antwort:
                                            <span style="margin-left: 10px">
                                                <xsl:value-of select="content"/>
                                            </span>
                                        </div>
                                    </div>
                                </xsl:if>
                                <xsl:if test="position() > 1">
                                    <div class="{$questionid}" style="display: none">
                                        <div class="mt-1 ml-4 card px-2 py-2 ">
                                            <div align="left" class="border-bottom">
                                                Von:
                                                <span style="margin-left: 40px">
                                                    <xsl:value-of select="firstName"/>
                                                </span>
                                            </div>
                                            <div align="left">
                                                Antwort:
                                                <span style="margin-left: 10px">
                                                    <xsl:value-of select="content"/>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </xsl:if>
                            </xsl:for-each>
                            <!--add Answer-->
                            <div class="{@id}" style="display: none">
                                <div class="mt-4">
                                    <form class="form needs-validation " action="frontend/php/insertAnswer.php"
                                          method="POST" accept-charset="UTF-8">
                                        <input type="hidden" name="eventid" value="{$eventid}"/>
                                        <input type="hidden" name="questionid" value="{@id}"/>
                                        <div class="form-row justify-content-center">
                                            <div class="form-group col-md-10">
                                                <input type="text" class="form-control" id="firstNameA"
                                                       name="firstNameA" placeholder="Vorname" maxlength="20"
                                                       required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-row justify-content-center">
                                            <div class="form-group col-md-10">
                                                <textarea class="form-control" id="answer" name="answer" maxlength="200"
                                                          placeholder="Antwort" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-row justify-content-center mt-2">
                                            <button type="submit" name="sendAnswer" value="submit"
                                                    class="btn btn-primary">
                                                Antworten
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="{$questionid}button" style="display: block">
                                <button onclick="showAnswer('{@id}')" class="mt-2 btn btn-primary">Alle Antworten
                                </button>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
                <!--add Questions-->
                <div class="row ">
                    <div style="width:600px;margin:0 auto" class="shadow p-3 mb-5 bg-white rounded">
                        <h4>Frage Stellen</h4>
                        <form class="form needs-validation mt-4 mb-4" action="frontend/php/insertQuestion.php"
                              method="POST" accept-charset="UTF-8">
                            <input type="hidden" name="eventid" value="{$eventid}"/>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-10">
                                    <input type="text" class="form-control" maxlength="20" id="firstName"
                                           name="firstName" placeholder="Vorname" required="true"/>
                                </div>
                            </div>
                            <div class="form-row justify-content-center">
                                <div class="form-group col-md-10">
                                    <textarea class="form-control" maxlength="200" id="question" name="question"
                                              placeholder="Frage" required="true"/>
                                </div>
                            </div>
                            <div class="form-row justify-content-center mt-4">
                                <button type="submit" name="sendQuestion" value="submit" class="btn btn-primary">Fragen
                                </button>
                            </div>
                        </form>
                        <a href="singleEvent.php?eventid={$eventid}" class="btn btn-outline-primary">Zum Event</a>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>