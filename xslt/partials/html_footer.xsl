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
                        <div class="footer-widget col-sm-12 col-md-6 col-lg-3">
                            <div class="textwidget custom-html-widget py-2">
                                <p class="py-2">
                                    Nina C. Rastinger<br/>
                                    <a href="mailto:ninaclaudia.rastinger@oeaw.ac.at">ninaclaudia.rastinger@oeaw.ac.at</a>
                                </p>
                            </div>
                        </div>

                        <!-- ACDH-CH logo column -->
                        <div class="footer-widget col-sm-12 col-md-6 col-lg-3 text-center">
                            <div class="textwidget custom-html-widget py-2">
                                <a href="https://www.oeaw.ac.at/acdh">
                                    <img src="images/acdh_logo.svg" class="image w-100 h-auto" alt="ACDH Logo"/>
                                </a>
                            </div>
                        </div>

                        <!-- Project Funding column -->
                        <div class="footer-widget col-sm-12 col-md-6 col-lg-3">
                            <div class="textwidget custom-html-widget">
                                <h6 class="font-weight-bold">PROJECT FUNDING</h6>
                                <a href="https://www.oeaw.ac.at/en/">
                                    <img class="card-img-right flex-auto d-md-block h-auto align-middle mt-2"
                                         src="images/oeaw_doc_logo.png"
                                         alt="ÖAW DOC Logo"
                                         style="max-width: 250px;" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Imprint bar -->
            <div class="footer-imprint-bar hide-reading text-light text-center py-1 px-0" id="wrapper-footer-secondary">
                <span>© Nina C. Rastinger 2025</span> |
                <a href="imprint.html" class="text-light">Impressum/Imprint</a>
            </div>

            <!-- Footer Scripts -->
            <script src="js/navScrollHide.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                    integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                    crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                    integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
                    crossorigin="anonymous"></script>
            <script src="js/listStopProp.js"></script>
            <script src="js/navScroll.js"></script>
        </footer>
    </xsl:template>
</xsl:stylesheet>