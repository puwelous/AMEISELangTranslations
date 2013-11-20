/* modelladenEURO.sql - Skript */
/* Beschreibung: Lädt das AMEISE-QS-EURO-Modell */
/* passendes Modell: QA-EURO-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */

/* 10.08.2004 Erweitert um ZIP/BLOB von speed */

/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

delete from temp;
LOAD DATA INFILE '../AmeiseSRC/old/batch.xml' INTO TABLE temp LINES TERMINATED BY '~' (file);
SELECT @batch:=file from temp where tmpid=1;

INSERT INTO model(mid,name) VALUES (1,'QA-EURO-Modell');
INSERT INTO model_instance set 
	minstid=1,
	name = 'QA-200-EURO-Modell',
	initial_state = 'empty', 
	is_filename = 'unknown', 
	initial_prot = 'empty',
	prot_filename = 'unknown',
	start_date='2003/12/01/08:00',
	completion_date='2004/08/27/08:00',
	exercise="Exercise", 
	mid=1;
UPDATE model_instance SET initial_state=LOAD_FILE("../AmeiseSRC/old/initial-ameise200-V3.sit.gz") WHERE minstid=1;
UPDATE model_instance SET initial_prot=LOAD_FILE("../AmeiseSRC/old/initial.sit.prot.gz") WHERE minstid=1;

INSERT INTO execution_model set 
	exmid = 1,
	rule = 'empty',
	rule_filename = 'unknown', 
	minstid = 1;
UPDATE execution_model SET rule=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs-exp-ameise200-V3.b2.gz") WHERE exmid=1;

INSERT INTO dictionary SET 
	dicid=1, 
	description='empty',
	dict_filename='unknown',
	mid=1, 
	language='en', 
	fullsyntaxcheck='y', 
	freeparameterselection='n', 
	commandtooltips='n', 
	batch_filename=@batch;
UPDATE dictionary SET description=LOAD_FILE("../AmeiseSRC/old/model-ameise200-V3.dib-nostem.gz") WHERE dicid=1;
