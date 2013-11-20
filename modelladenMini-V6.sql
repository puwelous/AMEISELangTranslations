/* modelladenMini.sql - Skript */
/* Beschreibung: Lädt das AMEISE-QS-Mini-Modell */
/* passendes Modell: QA-Mini-Modell */

/* Version 2.4.1 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */
/* Changelog: 10.5.2004, (ab), altered tempid as innodb increases id despite of deleting table */

/* 10.08.2004 Erweitert um ZIP/BLOB von speed */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */
/* Changelog: 10.06.2007 (ab), Update auf Modell Mai 2007 */

delete from temp;
LOAD DATA INFILE 'C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/batch.xml' INTO TABLE temp LINES TERMINATED BY '~' (file);
SELECT @batch:=file from temp where tmpid=2;

INSERT INTO model(mid,name) VALUES (2,'QA-60-Model');
UPDATE model SET resources=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/resources.zip") WHERE mid=2;

INSERT INTO model_instance set 
	minstid=2,
	name = 'QA-60-Model',
	initial_state = 'empty', 
	is_filename = 'unknown', 
	initial_prot = 'empty',
	prot_filename = 'unknown',
	start_date='2012/10/01/08:00',
	completion_date='2013/01/28/08:00',
	exercise="Exercise", 
	mid=2;
UPDATE model_instance SET initial_state=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/initial-ameise60-V6.sit.zip") WHERE minstid=2;
UPDATE model_instance SET initial_prot=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/initial-ameise60-V6.sit.prot.zip") WHERE minstid=2;

INSERT INTO execution_model set 
	exmid=2,
	rule = 'empty',
	rule_filename = 'unknown',  
	minstid=2;
UPDATE execution_model SET rule=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/qsmodell_60_v6.b2.zip") WHERE exmid=2;

insert into dictionary set 
	dicid=2, 
	mid=2, 
	description='empty',
	dict_filename='unknown',
	language='en', 
	fullsyntaxcheck='y', 
	freeparameterselection='n', 
	commandtooltips='y', 
	batch_filename=@batch;
UPDATE dictionary SET description=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs60enV6/qsmodell_60_v6.dib.zip") WHERE dicid=2;

