<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:import href="./params.xsl"/>
    <xsl:template match="/" name="nav_bar">
        <div class="sticky-top">
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <!--<a href="index.html" class="navbar-brand custom-logo-link" rel="home"
                        itemprop="url">
                        <img src="{$project_logo}" class="img-fluid" title="{$project_short_title}"
                            alt="{$project_short_title}" itemprop="logo"/>
                    </a>-->
                    <!--<a class="navbar-brand site-title-with-logo" rel="home" href="index.html" title="{$project_short_title}" itemprop="url"><xsl:value-of select="$project_short_title"/></a>-->
                    <!--<span class="badge bg-light text-dark">in development</span>-->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"/>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end"
                        id="navbarSupportedContent">
                        <div class="nav-title-box">
                            <strong>Periodische Listen</strong></br>in historischen Zeitungen und Intelligenzblättern, 1600-1850
                        </div>
                        <div class="nav-dropdown-container">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle custom-dropdown-link" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Index der Listen</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item custom-dropdown-link"
                                            href="toc-alle.html">Zugang über Tabelle</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item custom-dropdown-link" href="map.html">Zugang über Karte</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item custom-dropdown-link"
                                            href="https://github.com/nrastinger/listen-in-historischen-zeitungen">Daten auf
                                            GitHub</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle custom-dropdown-link" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false"
                                    >Dokumentation</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item custom-dropdown-link"
                                            href="about.html">Über das Projekt</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item custom-dropdown-link"
                                            href="list-types.html">Überblick über Listentypen</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </xsl:template>
</xsl:stylesheet>
