<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <xsl:call-template name="header"/>
                <title>Sport für Menschen mit Beeinträchtigungen</title>
            </head>
            <body>
                <header>
                    <xsl:call-template name="navbar"/>
                </header>
                <main>
                    <xsl:apply-templates select="/*" />
                    <xsl:call-template name="footer"/>
                </main>
                <xsl:call-template name="scripts"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="header">
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <link rel="stylesheet" href="../frontend/css/bootstrap.min.css" integrity="sha384a-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    </xsl:template>
    <xsl:template name="navbar">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#">Navbar</a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="events.php">Events</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="forum.php">Forum</a>
                    </li>
                </ul>
            </div>
        </nav>
    </xsl:template>
    <xsl:template name="scripts">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </xsl:template>
    <xsl:template name="footer">
        <footer class="text-center py-5">
            <div class="container">
                <div class="row text-center">
                    <div class="col-12 col-md-4 mb-4 mb-md-0 ">
                        <div class="shop-info text">
                            <i class="fas fa-clock fa-3x mb-3"></i>
                            <h3 class="mb-4">Öffnungszeiten</h3>
                            <!-- To Do -->
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4 mb-md-0">
                        <div class="shop-info text">
                            <i class="fas fa-map-marked-alt fa-3x mb-3"></i>
                            <h3 class="mb-4">Standort</h3>
                            <address>
                                <!-- To Do -->
                            </address>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 mb-4 mb-md-0">
                        <div class="shop-info text">
                            <i class="fas fa-mobile-alt fa-3x mb-3"></i>
                            <h3 class="mb-4">Kontakt</h3>
                            <!-- To Do -->
                        </div>
                    </div>
                </div>
                <hr class="mt-5"/>
            </div>
            <p>© Maestros 2020</p>
        </footer>
    </xsl:template>
</xsl:stylesheet>