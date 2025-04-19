<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="#all" version="2.0">

    <xsl:import href="html_navbar.xsl"/>

    <xsl:template name="html_head">
        <div class="custom-header">
            <img src="images/banner.png" alt="Banner" class="header-bg"/>
            <div class="header-overlay">
                <div class="title-box">
                    <h1>Periodische Listen</h1>
                    <h2>in Zeitungen und Intelligenzblättern, 1600–1850</h2>
                </div>
                <div class="nav-box">
                    <xsl:call-template name="nav_bar"/>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
