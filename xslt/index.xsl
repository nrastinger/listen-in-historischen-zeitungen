<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select='"Liste der Listen"'/>
        </xsl:variable>

        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container fragment-background">
                        <div class="row intro">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="intro_left">
                                    <h1 class="uppercase">Periodische Listen in historischen Zeitungen und Intelligenzblättern, 1600-1850</h1>
                                    <button class="btn btn-secondary button"
                                        onclick="window.location.href='about.html'">Über das
                                        Projekt</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row wrapper img_bottom">
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <a href="toc-alle.html" class="index-link">
                                    <div class="card index-card d-flex flex-column">
                                        <div class="card-body item-center">
                                            <img src="images/open-magazine.png"
                                                title="open-magazine.png"
                                                alt="Flaticon" class="smaller-img"
                                            />
                                        </div>
                                        <div class="card-header">
                                            <h5>Überschrift 1</h5>
                                            <p>Details<br/>zur Überschrift</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <a href="bibliographie.html" class="index-link">
                                    <div class="card index-card d-flex flex-column">
                                        <div class="card-body item-center">
                                            <img src="images/search.png"
                                                title="search.png"
                                                alt="Flaticon" class="smaller-img"
                                            />
                                        </div>
                                        <div class="card-header">
                                            <h5>Überschrift 2</h5>
                                            <p>Details<br/>zur Überschrift</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
