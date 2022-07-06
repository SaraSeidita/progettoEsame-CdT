<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0"
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Progetto di Codifica di Testi</title>
                <link href="style.css" rel="stylesheet" type="text/css"/>
                <script type="text/javascript" src="script.js"/>
                <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&amp;display=swap" rel="stylesheet"/>
                <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&amp;display=swap" rel="stylesheet"/>
            </head>

            <body>
                <!-- blocco header -->
                <header>
                <h1 id="titolo"><xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/></h1>
                <h2 id="subtitle"><xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/></h2>
                </header>

                <!-- menu -->
                <div class="menu">
                <!-- fonte: https://www.w3schools.com/howto/howto_js_tabs.asp -->
                    <button class="menuClick" onclick="openMenu(event, 'Info')">Edizione digitale</button>
                    <button class="menuClick" onclick="openMenu(event, 'Source')">Manoscritto</button>
                    <button class="menuClick" onclick="openMenu(event, 'FdS')">Ferdinand De Saussure</button>
                    <button class="menuClick" onclick="openMenu(event, 'Gin')">Biblioteca di Ginevra</button>
                    <button class="menuClick" onclick="openMenu(event, 'Pagine')">Pagine 6-7</button>
                    <button class="menuClick" onclick="openMenu(event, 'Zone')">Zone</button>       
                </div>

                <div id="Info" class="contenuto"> 
                    <h3 id="info"><xsl:value-of select="//tei:editionStmt/tei:edition/tei:title"/></h3>

                    <div class="resp">
                    <h2 id="resp"><xsl:for-each select="//tei:editionStmt/tei:respStmt[@xml:id='codifica']/tei:resp">
                    <xsl:value-of select="."/>
                    <br/>
                    <xsl:text>&#32;</xsl:text> 
                        <p id="respName">
                            <xsl:for-each select="//tei:respStmt[@xml:id='codifica']/tei:name">
                                <xsl:value-of select="."/>
                                <xsl:text>&#32;</xsl:text> 
                                </xsl:for-each>
                        </p>
                    </xsl:for-each></h2>
                    </div> 

                    <div class="resp">
                    <h2 id="resp"><xsl:for-each select="//tei:editionStmt/tei:respStmt[@xml:id='coordinazione']/tei:resp">
                    <xsl:value-of select="."/>
                    <br/>
                    <xsl:text>&#32;</xsl:text> 
                        <p id="respName">
                            <xsl:for-each select="//tei:respStmt[@xml:id='coordinazione']/tei:name">
                                <xsl:value-of select="."/>
                                <xsl:text>&#32;</xsl:text> 
                                </xsl:for-each>
                        </p>
                    </xsl:for-each></h2>
                    </div> 

                    <div class="resp">
                    <h2 id="resp"><xsl:for-each select="//tei:editionStmt/tei:respStmt[@xml:id='traduzioneItaliana']/tei:resp">
                    <xsl:value-of select="."/>
                    <br/>
                    <xsl:text>&#32;</xsl:text> 
                        <p id="respName">
                            <xsl:for-each select="//tei:respStmt[@xml:id='traduzioneItaliana']/tei:name">
                                <xsl:value-of select="."/>
                                <xsl:text>&#32;</xsl:text> 
                                </xsl:for-each>
                        </p>
                    </xsl:for-each></h2>
                    </div> 

                    <div class="resp">
                    <h2 id="resp"><xsl:for-each select="//tei:editionStmt/tei:respStmt[@xml:id='trascrizione']/tei:resp">
                    <xsl:value-of select="."/>
                    <br/>
                    <xsl:text>&#32;</xsl:text> 
                        <p id="respName">
                            <xsl:for-each select="//tei:respStmt[@xml:id='trascrizione']/tei:name">
                                <xsl:value-of select="."/>
                                <br/>
                                <xsl:text>&#32;</xsl:text> 
                                </xsl:for-each>
                        </p>
                    </xsl:for-each></h2>
                    </div> 

                    <div class="pubblicazione">
                        <h2 id="publisher">Pubblicazione</h2>
                        <p class="publisher">
                        <xsl:for-each select="//tei:publicationStmt">
                            <xsl:value-of select="tei:publisher"/>
                            <br/>
                            <xsl:value-of select="tei:distributor"/>
                            <br/>
                            <xsl:value-of select="tei:date"/>
                        </xsl:for-each>
                        </p>
                    </div>
                </div>

                <div id="Source" class="contenuto">

                    <div id="bibl">
                        <h2>Bibliografia del manoscritto</h2>
                        <p>
                            <xsl:for-each select="//tei:sourceDesc/tei:bibl">
                                Titolo: <xsl:value-of select="tei:title"/>
                                <br/>
                                Data: <xsl:value-of select="tei:date"/>
                                <br/>
                                Autore: <xsl:value-of select="tei:author"/>
                            </xsl:for-each>
                        </p>
                    </div>

                    <div id="descrizione">
                        <h2>Descrizione del manoscritto</h2>
                        <p>
                            <xsl:for-each select="//tei:sourceDesc/tei:msDesc">
                                Nazione: <xsl:value-of select="//tei:country"/>
                                <br/>
                                Città: <xsl:value-of select="//tei:settlement"/>
                                <br/>
                                Istituto: <xsl:value-of select="//tei:institution"/>
                                <br/>
                                Collezione: <xsl:value-of select="//tei:collection"/>
                                <br/>
                                Codice: <xsl:value-of select="//tei:idno"/>
                                <br/>
                            </xsl:for-each>
                        </p>
                    </div>

                    <div id="sommario">
                        <h2>Sommario</h2>
                        <p>
                            <xsl:value-of select="//tei:sourceDesc//tei:summary"/>
                        </p>
                    </div>

                    <div id="desc">
                        <h2>Descrizione fisica del manoscritto</h2>
                        <p>
                            <xsl:for-each select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc">
                                Tipo di oggetto: <xsl:value-of select="//tei:objectType"/>
                                <br/>
                                Supporto: <xsl:value-of select="//tei:material"/>
                                <br/>
                                <br/>
                                Quantità di pagine:
                                <xsl:text>&#32;</xsl:text>
                                <br/>
                                    <xsl:for-each select="//tei:measureGrp/tei:measure">
                                        <xsl:value-of select="."/>
                                        <xsl:text>&#32;</xsl:text>
                                        <br/>
                                    </xsl:for-each>
                                <br/>
                                Condizione: <xsl:value-of select="//tei:condition"/>
                                <br/>
                                Colonne: <xsl:value-of select="//tei:layout"/>
                            </xsl:for-each>
                        </p>
                    </div>

                    <div id="history">
                        <h2>Date</h2>
                        <p>
                        <xsl:for-each select="//tei:history/tei:origin/tei:p">
                            <xsl:value-of select="."/>
                            <xsl:text>&#32;</xsl:text>
                            <br/>
                        </xsl:for-each>
                        </p>
                        <p>
                            <xsl:for-each select="//tei:history/tei:origin/tei:origDate">
                                <xsl:value-of select="."/>
                                <xsl:text>&#32;</xsl:text>
                                <br/>
                            </xsl:for-each>
                        </p>
                    </div>
                </div>

                <div id="FdS" class="contenuto">
                    <h3 id="FdS"><xsl:value-of select="//tei:standOff//tei:persName/tei:name[@ref='FdS']"/></h3>
                    <p id="dates">
                        <b>Data di nascita:<xsl:value-of select="//tei:listPerson/tei:person/tei:birth/@when"/>
                        <br/>
                        Data di morte:<xsl:value-of select="//tei:listPerson/tei:person/tei:death/@when"/>
                        </b>
                    </p>
                    <div id="txtFds">
                        <div id="imgFdS">
                            <img src="img/fds.png" alt="fds" style="width 228px;height:200px;"/>      
                        </div>
                    <div id="note">       
                        <xsl:for-each select="//tei:listPerson/tei:person/tei:noteGrp/tei:note">                       
                            <p id="notes"><xsl:value-of select="."/>
                            <br/>
                            </p>
                        </xsl:for-each>
                    </div>      
                    </div>
                </div>

                <div id="Gin" class="contenuto">
                    <h3 id="BdG"><xsl:value-of select="//tei:listOrg/tei:org/tei:orgName"/></h3>
                    <h2 id="BdGHead"><xsl:value-of select="//tei:listOrg/tei:head"/></h2>
                    <div id="imgBdG">
                        <img src="img/archivio.jpg" alt="BdG" class="imgArc"/>
                    </div>
                    <div id="note">
                    <xsl:for-each select="//tei:listOrg//tei:noteGrp/tei:note">
                        <div>
                            <p id="notesArc"><xsl:value-of select="."/></p>                
                        </div>
                    </xsl:for-each>
                    </div>
                    <div class="info">
                        <p><b>Luogo</b>: <xsl:value-of select="//tei:listOrg/tei:org/tei:placeName"/>
                        <br />
                        <b>Per visitare l'archivio</b>: <a href="https://archives.bge-geneve.ch/">
                        <br/>
                        <br/><img src="img/bdg.png" alt="archivio" class="imgBdG"/></a></p>
                    </div>

                </div>

                <div id="Pagine" class="contenuto">
                    <h3 id="pagTitle">Pagine codificate</h3>
                    <div id="pag6img">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:graphic">
                        <img class="img" src="{./@url}"/>
                        </xsl:for-each>
                    </div>
                    <div id="txt6">
                        <h2 id="pagTitle"><xsl:value-of select="//tei:text/tei:group/tei:group/tei:head[@xml:id='txtFr']"/></h2>
                        <p id="pag"><xsl:value-of select="//tei:text/tei:body/tei:div[@xml:id='p6']"/><br /></p>
                        <p id="pag"><xsl:value-of select="//tei:text/tei:body/tei:div[@xml:id='p7']"/><br /></p>
                    </div>
                    <div id="txt7">
                        <h2 id="pagTitle"><xsl:value-of select="//tei:text/tei:group/tei:group/tei:head[@xml:id='txtIt']"/></h2>
                        <p id="pag">6. <xsl:value-of select="//tei:text/tei:body/tei:div[@xml:id='page6ita']"/><br /></p>
                        <p id="pag">7. 
                        <xsl:value-of select="//tei:text/tei:body/tei:div[@xml:id='page7ita']"/><br /></p>
                    </div>
                </div>

                <div id="Zone" class="contenuto">
                    <h3 id="zone">Zone</h3>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='numero6']//tei:graphic">
                        <img class="imgZone" src="{./@url}"/>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='numero6']/tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per1']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per1']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per2']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per2']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per3']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per3']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per4']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per4']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per5a']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per5a']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per5b']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per5b']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per6']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per6']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per7']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per7']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                    <div id="Zona">
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per8a']//tei:graphic">
                        <img class="imgZone2" src="{./@url}"/>
                        <xsl:text>&#32;</xsl:text>
                        </xsl:for-each>
                        <xsl:for-each select="//tei:facsimile/tei:surface/tei:zone[@xml:id='per8a']//tei:figure">
                            <h2 class="zone"><xsl:value-of select="tei:head"/></h2>
                            <p class="zone"><xsl:value-of select="tei:figDesc"/></p>
                        </xsl:for-each>
                    </div>

                </div>
                
            </body>
    
        </html>
    </xsl:template>

</xsl:stylesheet>