<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type = 'main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
            </head>

            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>

                    <div class="container-fluid">
                        <div class="card">
                            <div class="card-header">
                                <h1>
                                    <xsl:value-of select="$doc_title"/>
                                </h1>
                            </div>
                            <div class="card-body">
                                <xsl:apply-templates select=".//tei:body"/>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:p">
        <p class="align-left" id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:title[@type = 'main']">
        <h1 class="align-left">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h3 class="align-left">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

    <xsl:template match="tei:div">
        <div id="{generate-id()}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'italics']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'bold']">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    <xsl:template match="tei:graphic[@type='cover']">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>cover</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </img>
    </xsl:template>
    
    <xsl:template match="tei:graphic[@type='funding']">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="@url"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>funding</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </img>
    </xsl:template>
    
</xsl:stylesheet>
