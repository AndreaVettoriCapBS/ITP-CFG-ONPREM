# BEP-CFG-ONPREM

Obiettivo: creazione di un sistema per consentire all’utente di codificare un nuovo articolo in base agli attributi dell’articolo stesso valorizzando i campi Nr. e Descrizione della tabella 27.
Dovranno essere valorizzati anche i campi Valore della tabella 27 e 7505 (Item Attribute Value Mapping).


1) Scelta sistema di rifornimento (Acquisto/Produzione) – prefiltro in page come da esempio
2) Nome campo
•	Nr se comporrà il codice
•	Descrizione se parteciperà alla composizione della descrizione dell’item
•	Valore – il valore selezionato non comporrà il codice nè la descrizione ma verrà direttamente scritto in T27 o 7505 (Item Attribute Value Mapping) al momento della creazione Item

        3) Nr carattere campo indica il nr del carattere che deve essere preso per la composizione (non valido per la descrizione che viene presa tutta)

       4)Progressivo: indica i caratteri progressivi presi da numeratore a setup (vedi setup conf articolo)
       5) Nr tabella relazionata: indica la tabella su cui fare relazione
       6) Carattere Nr: indica quale posizione occuperà il carattere scelto
       7) Inserisci Valore: indica se oltre a partecipare al codice deve essere anche scritto il campo in T27 o 7505 (Item Attribute Value Mapping) al momento della creazione Item


Lanciando la funzione Crea articolo si apre la maschera di inserimento degli attributi per l’inserimento del codice
Deve essere scelta la categoria e l’udm base dell’item

La relazione per scegliere l’attributo deve puntare alla tabella Item Attribute (50000) prefiltrata per attributo scelto.

Una volta inseriti i valori  l’utente confermerà la creazione tramite un tasto “GENERA ARTICOLO”. Il sistema creerà codice  e descrizione costruiti secondo le indicazioni della tabella “item Configurator” e popolerà i campi valorizzati nella page.


Nella tabella setup configuratore articolo sono gestiti i numeratori per la gestione dei progressivi che comporranno il codice 

