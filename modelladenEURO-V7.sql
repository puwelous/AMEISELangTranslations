/* modelladenEURO.sql - Skript */
/* Beschreibung: Lädt das AMEISE-QS-EURO-Modell */
/* passendes Modell: QA-EURO-Modell */

/* Version 2.6 (Datenmodell V7) */
/* Autor: Susanne Jäger */
/* Datum: 28.3.2013 */
/* Changelog: 10.08.2004 (nz), Erweitert um ZIP/BLOB von speed */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */
/* Changelog: 10.06.2007 (ab), Update auf Modell Mai 2007 */
/* Changelog: 13.03.2012 (ab), Changed Start and Completion date */
/* Changelog: 28.03.2013 (ab), Changed Start and Completion date */

delete from temp;
LOAD DATA INFILE 'C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/batch.xml' INTO TABLE temp LINES TERMINATED BY '~' (file);
SELECT @batch:=file from temp where tmpid=1;

INSERT INTO model(mid,name) VALUES (1,'QA-200-Model');
UPDATE model SET resources=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/resources.zip") WHERE mid=1;
/*UPDATE model SET resources=LOAD_FILE("./../AmeiseSRC/qs200enV7/resources.zip") WHERE mid=1; */

INSERT INTO model_instance set 
	minstid=1,
	name = 'QA-200-Model',
	initial_state = 'empty', 
	is_filename = 'unknown', 
	initial_prot = 'empty',
	prot_filename = 'unknown',
	start_date='2013/09/30/08:00',
	completion_date='2014/06/30/08:00',
	exercise="Exercise", 
	mid=1;
UPDATE model_instance SET initial_state=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/initial-ameise200-V7.sit.zip") WHERE minstid=1;
UPDATE model_instance SET initial_prot=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/initial-ameise200-V7.sit.prot.zip") WHERE minstid=1;

INSERT INTO execution_model set 
	exmid = 1,
	rule = 'empty',
	rule_filename = 'unknown', 
	minstid = 1;
UPDATE execution_model SET rule=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/qsmodell_200_v7.b2.zip") WHERE exmid=1;

INSERT INTO dictionary SET 
	dicid=1, 
	description='empty',
	dict_filename='unknown',
	mid=1, 
	language='en', 
	fullsyntaxcheck='y', 
	freeparameterselection='n', 
	commandtooltips='y', 
	batch_filename=@batch;
UPDATE dictionary SET description=LOAD_FILE("C:/Ameise/AmeiseDB/AmeiseSRC/qs200enV7/qsmodell_200_v7.dib.zip") WHERE dicid=1;
