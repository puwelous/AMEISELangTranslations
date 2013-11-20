/* modelladenMini.sql - Skript */
/* Beschreibung: Lädt das AMEISE-QS-Mini-Modell */
/* passendes Modell: QA-Mini-Modell */

/* Version 2.4.1 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */
/* Changelog: 10.5.2004, (ab), altered tempid as innodb increases id despite of deleting table */

/* 10.08.2004 Erweitert um ZIP/BLOB von speed */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

delete from temp;
LOAD DATA INFILE '../AmeiseSRC/qs60enV3/batch.xml' INTO TABLE temp LINES TERMINATED BY '~' (file);
SELECT @batch:=file from temp where tmpid=2;

INSERT INTO model(mid,name) VALUES (2,'Mini-QA-Modell');
INSERT INTO model_instance set 
	minstid=2,
	name = 'Mini-QA-200-Modell',
	initial_state = 'empty', 
	is_filename = 'unknown', 
	initial_prot = 'empty',
	prot_filename = 'unknown',
	start_date='2003/11/03/08:00',
	completion_date='2004/03/01/08:00',
	exercise="Exercise", 
	mid=2;
UPDATE model_instance SET initial_state=LOAD_FILE("../AmeiseSRC/qs60enV3/initial-exp-60-pms-V2.sit.gz") WHERE minstid=2;
UPDATE model_instance SET initial_prot=LOAD_FILE("../AmeiseSRC/qs60enV3/initial.sit.prot.gz") WHERE minstid=2;

INSERT INTO execution_model set 
	exmid=2,
	rule = 'empty',
	rule_filename = 'unknown',  
	minstid=2;
UPDATE execution_model SET rule=LOAD_FILE("../AmeiseSRC/qs60enV3/qs_exp_60_pms_V2.b2.gz") WHERE exmid=2;

insert into dictionary set 
	dicid=2, 
	mid=2, 
	description='empty',
	dict_filename='unknown',
	language='en', 
	fullsyntaxcheck='y', 
	freeparameterselection='n', 
	commandtooltips='n', 
	batch_filename=@batch;
UPDATE dictionary SET description=LOAD_FILE("../AmeiseSRC/qs60enV3/model-nostem.dib.gz") WHERE dicid=2;

