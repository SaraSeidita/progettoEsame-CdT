# Codifica di testi 2021-22 
CdL Informatica Umanistica, Università di Pisa 
_Corso di Codifica di Testi_
Anno accademico 2021/22

# Progetto esame 
Il progetto del corso consiste nella codifica XML-TEI di un manoscritto di Ferdinand de Saussure, nella realizzazione di una edizione image-based e nel creare un foglio di stile XSL. 
Pubblicare il file.xml, il file.xsl, l'output.html e i file a corredo (css, javascript, le immagini delle pagine codificate, etc.)

## Per effettuare la verifica della codifica.xml con Xerces
> java -cp "./Xerces-J-bin.2.12.1/xerces-2_12_1/*" dom.Counter -v "./codifica.xml"  

### Output della verifica
> 452;43;0 ms (400 elems, 1049 attrs, 5891 spaces, 19714 chars)


## Per usare Saxon (Foglio di stile xsl > output HTML)
> java -jar ./SaxonHE10-3J/saxon-he-10.3.jar -s:./codifica.xml -xsl:./template.xsl -o:./index.html


# Esercizi
[Cliccare qua per gli esercizi del corso di Codifica di Testi](https://github.com/Rosmerade/Codifica-di-Testi-2021-22)

# TEI - struttura documento
<img src="/img/tei.PNG" width="209" height="390">

# TEI/text - gerarchia
<img src="/img/tei-text.PNG" width="635" height="252">
