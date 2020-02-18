<?xml version="1.0"  encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <!-- set output to XHTML -->
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                indent="yes" />

    <xsl:variable name="posts" select="document('../../database/forum.xml')/forum"/>


    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../css/bootstrap.min.css"/>
                <link rel="stylesheet" href="../css/bootstrap-grid.min.css"/>
                <link rel="stylesheet" href="../css/bootstrap-reboot.min.css"/>
            </head>
            <body>
                <div class="navi">
                    <h1>Navi</h1>
                </div>

                <div class="event mt-4">
                    <h2>Event Beschrieb aus XML....</h2>
                </div>

                <div class="forum">
                    <div class="container">
                        <xsl:apply-templates select="$posts/posts"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="posts">
        <xsl:if test="post/@isQuestion='true'">
            <xsl:variable name="questionId" select="post/@id"/>
            <div class="question">
                <div class="row">
                    <xsl:value-of select="post/name"/>
                </div>
                <div class="row">
                    <xsl:value-of select="post/content"/>
                </div>
            </div>
            <xsl:for-each select="post">
                <xsl:if test="@isQuestion='false' and $questionId!=@qId">
                    <xsl:value-of select="$questionId"/>
                    <xsl:value-of select="@qId"/>
                    <div class="answer">
                        <div class="row">
                            <xsl:value-of select="name"/>
                        </div>
                        <div class="row">
                            <xsl:value-of select="content"/>
                        </div>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>