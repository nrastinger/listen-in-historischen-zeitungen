<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">

    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto pt-3 bg hide-reading">
            <div class="wrapper" id="wrapper-footer-full">
                <div class="container" id="footer-full-content" tabindex="-1">
                    <div class="footer-separator">CONTACT</div>
                    <div class="row">

                        <!-- Contact column -->
                        <div class="footer-widget col-lg-3 col-md-4 col-sm-4 textwidget custom-html-widget">
                            <p class="py-2">
                                Nina C. Rastinger<br/>
                                <a href="mailto:ninaclaudia.rastinger@oeaw.ac.at">ninaclaudia.rastinger@oeaw.ac.at</a>
                            </p>
                        </div>

                        <!-- ACDH-CH column -->
                        <div class="footer-widget col-lg-4 col-md-4 col-sm-4 textwidget custom-html-widget">
                            <a href="https://www.oeaw.ac.at/acdh">
                                <img src="images/acdh_logo.svg" class="image w-100 h-auto" alt="ACDH Logo"/>
                            </a>
                            <p class="py-2">
                                ACDH-CH OEAW<br/>
                                Austrian Centre for Digital Humanities and Cultural Heritage<br/>
                                Austrian Academy of Sciences
                            </p>
                            <p class="py-2">
                                Bäckerstraße 13<br/>
                                1010 Vienna
                            </p>
                        </div>

                        <!-- Project Funding column -->
                        <div class="footer-widget col-lg-4 col-md-4 col-sm-4 textwidget custom-html-widget">
                            <h6 class="font-weight-bold py-2">PROJECT FUNDING</h6>
                            <img class="card-img-right flex-auto d-md-block h-auto align-middle"
                                src="images/oeaw_doc_logo.png"
                                alt="ÖAW DOC Logo"
                                style="max-width: 250px;"
                                title="ÖAW DOC" />
                            <div class="textwidget custom-html-widget">
                                <a title="CC-BY 4.0" target="_blank"
                                    href="https://creativecommons.org/licenses/by/4.0">
                                    <img class="w-50 mt-2"
                                        alt="CC-BY 4.0 Free Cultural Approved"
                                        src="images/by.png"/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Imprint bar -->
            <div class="footer-imprint-bar hide-reading text-light text-center py-1 px-0"
                id="wrapper-footer-secondary">
                <span>© Copyright OEAW</span> |
                <a href="imprint.html" class="text-light">Impressum/Imprint</a>
            </div>
        </footer>
        <script src="js/navScrollHide.js"></script>
    </xsl:template>
</xsl:stylesheet>
