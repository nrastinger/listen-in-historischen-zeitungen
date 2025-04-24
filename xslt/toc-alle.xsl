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
        <xsl:variable name="doc_title" select="'Liste der Listen'"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>

                <!-- Custom sort arrow styles for tocTable only -->
                <style>
                table.dataTable thead th {
                    position: relative;
                    cursor: pointer;
                }

                table.dataTable thead th.sorting::after,
                table.dataTable thead th.sorting_asc::after,
                table.dataTable thead th.sorting_desc::after {
                    font-size: 0.8em;
                    content: "▲▼";
                    color: #ccc;
                    position: absolute;
                    right: 8px;
                    top: 50%;
                    transform: translateY(-50%);
                }

                table.dataTable thead th.sorting_asc::after {
                    content: "▲▼";
                    color: #333;
                }

                table.dataTable thead th.sorting_desc::after {
                    content: "▲▼";
                    color: #333;
                }
                </style>
                <!--end of addition for sorting-->
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-striped display" id="tocTable"
                                    style="width:100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Listentitel</th>
                                            <th scope="col">Listentypus</th>
                                            <th scope="col">Periodikum</th>
                                            <th scope="col">Frühester Nachweis</th>
                                            <th scope="col">Spätester Nachweis</th>
                                            <th scope="col">Publikationsort</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each
                                            select="document('../data/lists/tei_output.xml')//*:listBibl/*:bibl">
                                            <tr>
                                                <td style="font-style: italic;">
                                                    <a href="{@xml:id}.html">
                                                        <xsl:value-of select="tei:title[@type='main']"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="tei:note[@type='listType']"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="tei:note[@type='source']/tei:bibl/tei:title"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="tei:date[@type='earliestFinding']"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="tei:date[@type='latestFinding']"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="tei:pubPlace/tei:placeName/tei:name"/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="html_footer"/>
                    <!--new version-->
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js"/>
                    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"/>
                    <script>
                    $(document).ready(function () {
                        if (!$.fn.DataTable.isDataTable('#tocTable')) {
                        $('#tocTable').DataTable({
                            pageLength: 50,
                            language: {
                                url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/de-DE.json'
                                }
                            });
                        }
                    });
                    </script>
                    <!--old version 
                    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"/>
                    <script type="text/javascript" src="js/dt.js"/>
                    <script>
                        $(document).ready(function () {
                        createDataTable('tocTable');
                        });
                    </script>--> 
                </div>
            </body>
        </html>
        <!--new: individual page for each list entry-->
        <xsl:for-each select="document('../data/lists/tei_output.xml')//*:listBibl/*:bibl">
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:variable name="title" select="normalize-space(tei:title[@type='main'])"/>
            <xsl:variable name="source" select="normalize-space(tei:note[@type='source']/tei:bibl/tei:title)"/>
            
            <xsl:result-document href="{$id}.html">
                <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <xsl:call-template name="html_head">
                            <xsl:with-param name="html_title" select="$title"/>
                        </xsl:call-template>
                    </head>
                    <body class="page">
                        <div class="hfeed site" id="page">
                            <xsl:call-template name="nav_bar"/>
                            <div class="container">
                                <div class="card">
                                    <div class="card-header">
                                        <h3><xsl:value-of select="$title"/> in <xsl:value-of select="$source"/></h3>
                                    </div>
                                    <div class="card-body list-details">
                                        <div class="card-body list-details">
                                            <div class="row">
                                                <!-- Metadata Table -->
                                                <div class="col-md-6">
                                                    <table class="table table-striped table-bordered metadata-table" style="width:100%">
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row">Listentitel</th>
                                                                <td><xsl:value-of select="tei:title[@type='main']"/></td>
                                                            </tr>
                                                                <tr>
                                                                    <th scope="row">Alternativer Titel</th>
                                                                    <td>
                                                                    <xsl:value-of select="tei:title[@type='alt']" separator="; "/>
                                                                    </td>
                                                                </tr>
                                                            <tr>
                                                                <th scope="row">Listentypus</th>
                                                                <td><xsl:value-of select="tei:note[@type='listType']"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Periodikum</th>
                                                                <td><xsl:value-of select="tei:note[@type='source']/tei:bibl/tei:title"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">ZDB-ID</th>
                                                                <td><xsl:value-of select="tei:note[@type='source']/tei:bibl/tei:idno[@type='zdb']"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Frühester Nachweis</th>
                                                                <td><xsl:value-of select="tei:date[@type='earliestFinding']"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Spätester Nachweis</th>
                                                                <td><xsl:value-of select="tei:date[@type='latestFinding']"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Publikationsort</th>
                                                                <td><xsl:value-of select="tei:pubPlace/tei:placeName/tei:name"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Wikidata-ID</th>
                                                                <td><xsl:value-of select="tei:pubPlace/tei:placeName/tei:idno[@type='wikidata']"/></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Koordinaten</th>
                                                                <td><xsl:value-of select="normalize-space(tei:pubPlace/tei:location/tei:geo)"/></td>
                                                            </tr>
                                                            <xsl:if test="tei:note[@type='digitalResource']/tei:ref">
                                                                <tr>
                                                                    <th scope="row">Digitale Ressource</th>
                                                                    <td>
                                                                        <a>
                                                                            <xsl:attribute name="href">
                                                                                <xsl:value-of select="tei:note[@type='digitalResource']/tei:ref/@target"/>
                                                                            </xsl:attribute>
                                                                            <xsl:value-of select="tei:note[@type='digitalResource']/tei:ref"/>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </xsl:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Optional Image Column -->
                                                <div class="col-md-6 text-center">
                                                    <xsl:if test="tei:graphic/@url">
                                                        <img>
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="tei:graphic/@url"/>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="alt">Bild zur Liste</xsl:attribute>
                                                            <xsl:attribute name="class">img-fluid shadow rounded</xsl:attribute>
                                                        </img>
                                                    </xsl:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <xsl:call-template name="html_footer"/>
                        </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
        <!--end of new addition-->
    </xsl:template>
</xsl:stylesheet>
