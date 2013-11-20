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

source tables-4.0.sql;			/* checked */
source modelladenEURO-V7.sql;	/* loading models! This is point of interest of mine! */
source modelladenMini-V7.sql;	/* loading models! Purpose is the same as previous, but another model is used */
set FOREIGN_KEY_CHECKS=0;       /* --------------------------------------------------- */
source insertV2.sql;			/* inserting users and assigning them their roles */
source zarmsdatenEURO.sql; 		/* German expressions. ZARMS entities, their types, atributes and relations to real simulation entities. Not necessary to translate. */
source zarmsdatenMini.sql;		/* same issue */
source queries.sql;				/* translate! */
source visual-components.sql;	/* tanslate!  */
source spaid_needs_zt.sql;		/* not necessary, no translations */
source vfreund.sql;				/* CALLS FOR ANOTHER 'vf_' PREFIXED SQL SOURCE FILES */
source zarms_logic.sql;			/* ZARMS data and their (calculation) logic */
source milestone.sql;			/* calculation relations, so far DE and EN present, no FR ... Edit a dictionary as well? */
source hmk_components.sql;		/* enabled or disabled components, no need to modify */
/* focus*/						/* --------------------------------------------------- */
source tabellen_csAssessment.sql; /* ??? */
source analysecandidates.sql;	/* So far DE and EN present, no FR ... but needed to be translated */
source evalRules.sql;			/* no need to translate */
source relRules.sql;			/* no need to translate */
source fokus.sql;				/* So far DE and EN present, no FR ... but needed to be translated */
set FOREIGN_KEY_CHECKS=1;

