<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:output encoding="UTF-8" method="xhtml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Liste der Listen - Kartenansicht'"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="de">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
                <link rel="stylesheet" href="https://unpkg.com/tabulator-tables@5.5.2/dist/css/tabulator_bootstrap5.min.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css"/>
                <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css"/>
                <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
                <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container">
                        <div class="card">
                            <div class="card-body">
                                <div id="map" style="height: 600px; width: 100%; margin-bottom: 2em;"></div>
                                <table id="biblTable" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Titel</th>
                                            <th>Periodikum</th>
                                            <th>Frühester Nachweis</th>
                                            <th>Spätester Nachweis</th>
                                            <th>Lat</th>
                                            <th>Lng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select="//tei:bibl[tei:pubPlace/tei:location/tei:geo]">
                                        <xsl:variable name="bibl" select="."/>
                                        <xsl:for-each select="tei:pubPlace[tei:location/tei:geo]">
                                            <xsl:variable name="place" select="normalize-space(tei:placeName/tei:name)"/>
                                            <xsl:variable name="qid" select="normalize-space(tei:placeName/tei:idno[@type='wikidata'])"/>

                                            <!-- IMPORTANT: pick geo relative to this pubPlace -->
                                            <xsl:variable name="geo" select="normalize-space(tei:location/tei:geo)"/>
                                            <xsl:variable name="lat" select="replace(tokenize($geo, '\s+')[1], ',', '.')"/>
                                            <xsl:variable name="lon" select="replace(tokenize($geo, '\s+')[2], ',', '.')"/>

                                            <tr>
                                            <td>
                                                <xsl:value-of select="$bibl/tei:title[@type='main']"/>
                                                <xsl:if test="$place != ''">
                                                <xsl:text> — </xsl:text>
                                                <xsl:value-of select="$place"/>
                                                </xsl:if>
                                                <xsl:if test="$qid != ''">
                                                <xsl:text> (</xsl:text><xsl:value-of select="$qid"/><xsl:text>)</xsl:text>
                                                </xsl:if>
                                            </td>

                                            <td>
                                                <xsl:value-of select="$bibl/tei:relatedItem[@type='Periodikum']/tei:bibl/tei:title[@type='Unternehmen']"/>
                                            </td>

                                            <td><xsl:value-of select="$bibl/tei:date[@type='earliestFinding']"/></td>
                                            <td><xsl:value-of select="$bibl/tei:date[@type='latestFinding']"/></td>
                                            <td><xsl:value-of select="$lat"/></td>
                                            <td><xsl:value-of select="$lon"/></td>
                                            </tr>
                                        </xsl:for-each>
                                        </xsl:for-each>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                    <script src="js/map_table_cfg.js"></script>
                    <script src="js/make_map_and_table_bibl.js"></script>
                    <script>
                    const historicalMapLayer = L.tileLayer(
                        "https://wmts.oldmapsonline.org/maps/432e135b-b166-5bd5-a25e-5566e360d3a4/2019-08-19T13:34:32.410Z/{z}/{x}/{y}.png?key=7Omp1JJ2Ufb4qmEse3qh",
                        {
                        attribution: "© OldMapsOnline",
                        maxZoom: 18,
                        minZoom: 0
                        }
                    );

                    build_map_and_table(map_cfg, table_cfg, null, {
                        label: "Historical Map (1740) (© OldMapsOnline)",
                        layer: historicalMapLayer
                    });
                    </script>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
