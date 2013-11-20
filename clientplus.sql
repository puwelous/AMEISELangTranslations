/* clientplus.sql - Skript */
/* Beschreibung: setzt den Client */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: FH */
/* Datum: 15.3.2004 */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

/* setzen der Atrribute guienabled='j' und tuienabled='j' bei allen Eintraegen der Tabelle game */

update game set guienabled='j', tuienabled='j';

/* nachtragen der ev. fehlenden Atrribute des Dictionary */

update dictionary set language='en', fullsyntaxcheck='y', freeparameterselection='n', commandtooltips='n' where dicid=1;

