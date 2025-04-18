<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto pt-3 bg hide-reading">
            <div class="wrapper" id="wrapper-footer-full">
                <div class="container" id="footer-full-content" tabindex="-1">
                    <div class="footer-separator">CONTACT</div>
                    <div class="row">
                        <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6 ml-auto text-center">
                            <div class="textwidget custom-html-widget py-2">
                                <a href="https://www.oeaw.ac.at/">
                                    <img src="images/oeaw_doc_logo.png" class="image w-100 h-auto" alt="OEAW DOC Logo"/>
                                </a>
                            </div>
                        </div>
                        <div class="footer-widget col-lg-4 col-md-3 col-sm-3">
                            <div class="textwidget custom-html-widget">
                                <p class="py-2">
                                    Nina C. Rastinger<br/>
                                    <a href="mailto:ninaclaudia.rastinger@oeaw.ac.at">ninaclaudia.rastinger@oeaw.ac.at</a>
                                </p>
                                <div class="textwidget custom-html-widget">
                                    <a title="CC-BY 4.0" target="_blank" href="https://creativecommons.org/licenses/by/4.0">
                                        <img class="w-50 mt-2" alt="CC-BY 4.0 Free Cultural Approved" src="images/by.png"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="footer-widget col-lg-4 col-md-3 col-sm-4">
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center">
                                            <h6 class="font-weight-bold">PROJECT FUNDING</h6>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 py-2">
                                        <div class="flex-md-row mb-4 align-items-center mb-1">
                                            <a href="https://www.oeaw.ac.at/">
                                                <img class="card-img-right flex-auto d-md-block h-auto mt-2 align-middle" src="images/oeaw_doc_logo.png" alt="OEAW DOC Logo" style="max-width: 250px;" title="OEAW DOC"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-imprint-bar hide-reading text-light text-center py-1 px-0" id="wrapper-footer-secondary">
                <span>© Copyright OEAW</span> | <a href="imprint.html" class="text-light">Impressum/Imprint</a>
            </div>
            <div id="cookie-overlay">
                <div class="container">
                    <div class="cookie-message">This website uses cookies to ensure you get the best experience on our website. <a href="imprint.html">More info</a><br/></div>
                    <div class="cookie-buttons">
                        <div class="cookie-accept-btn">Accept All Cookies (functional and tracking)</div>
                        <div class="cookie-accept-necessary-btn">Accept Necessary Cookies Only</div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/navScrollHide.js"></script>
    </xsl:template>
</xsl:stylesheet>
