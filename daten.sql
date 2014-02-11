/* daten.sql - Startskript */
/* Metaskript - führt alle anderen Skripten aus */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */
/* Changelog: 10.5.2004, (ab), adapded to innodb engine */
/*             8.8.2005, (nz), Einspielen des Zarms-Logic-Skripts */
/*             2.3.2006, (ab), modelladen und queries.sql Fehler ausg. */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */
/* Changelog: 30.5.2007, (mk), added focus-tables, and inserts */
/* Changelog: 10.6.2007, (ab), Update to QS Version Mai 2007 */
/* Changelog: 07.8.2008 a2ppt - AORTA tables 3901, 3902, 3903 added */

set FOREIGN_KEY_CHECKS=0;
drop database if exists AMEISE;
set FOREIGN_KEY_CHECKS=1;   
create database AMEISE;
use AMEISE;

source tables-4.0.sql;
source modelladenEURO-V7.sql;
/*source modelladenEURO-sk.sql;*/
source modelladenMini-V7.sql;
set FOREIGN_KEY_CHECKS=0;
source insertV2.sql;
source zarmsdatenEURO.sql; 
source zarmsdatenMini.sql;
source queries.sql;
source visual-components.sql;
/*source visual-components-sk.sql;*/
source spaid_needs_zt.sql;
source vfreund.sql;
source zarms_logic.sql;
source milestone.sql;
source hmk_components.sql;
/* focus*/
source tabellen_csAssessment.sql;
source analysecandidates.sql;
source evalRules.sql;
source relRules.sql;
source fokus.sql;
set FOREIGN_KEY_CHECKS=1;

