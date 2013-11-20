/* erwtables.sql - Skript */
/* Beschreibung: legt die Tabellen an */

/* Version 2.4 (Datenmodell V2) */ 
/* Autor: Sabine Hipfl, 26.07.2003*/
/* Datum: 15.3.2004 */
/* Changelog: 11.5.2004, (ab), Adaption of innodb-indices */
/* Geaendert von: Elke Hochmüller, 14.9.2004 */
/* Changelog: 8.8.2005, (nz), Hinzufuegen von Blob-Feldern fuer Entities und Feedback*/
/* Changelog: 18.8.2005, (eh), HMK-Turnier Zuordnungen*/
/* Changelog: 23.8.2005, (nz), Zarms_Logic an Modell gebunden */
/* Changelog: 11.10.2005, (nz), Pfad zu Primary Key der Tabelle S_Relation hinzugefuegt */
/* Changelog: 02.08.2006, (nz), Turn-ID zu Primary Key der Tabelle S_Relation hinzugefuegt */
/* Anlegen der Tabellen*/
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */
/* Changelog: 30.05.2007 (mk), Entfernen kind_of_aid Ratgeber */

# set FOREIGN_KEY_CHECKS=0;
# drop database AMEISE;
# create database AMEISE;
# use AMEISE;
 
create table person (
	pid int not null auto_increment, 
	username varchar(20) not null unique,
	password varchar(20) not null,
	forename varchar(40) not null ,
	surname varchar(40) not null,
	email varchar(40),
	matr_nr varchar(10), /* EH, 18.8.2005: unique entfernt */
	nickname varchar(15),
	language varchar(2),
	primary key (pid)
   
);

create table role (
	rid int not null auto_increment,
	description varchar(50) not null,
	primary key (rid)
);

create table p_acquires_r (
	pid int not null,
	rid int not null,
	applied date not null,
	until date,
	index p_acquires_pid (pid),
	foreign key (pid) references person(pid) on delete cascade,
	index p_acquires_rid (rid),
	foreign key (rid) references role(rid) on delete cascade,
	primary key (pid, rid)
);

create table instructor (
	pid int not null,
	index instructor_pid (pid),
	foreign key (pid) references person(pid) on delete cascade,
	primary key (pid)
);

create table organization (
	oid int not null auto_increment,
	name varchar(100) not null unique,
	address varchar(200),
	description varchar(100),
	host varchar(50) not null,
	mailsrv varchar(50) not null,
	port integer(4) not null,
	primary key (oid)
);

create table course (
	cid int not null auto_increment,
	c_nr varchar(10) not null,
	description varchar(100),
	brief_desc varchar(10),
	current_sem varchar(4),
	curriculum_sem integer(2),
	default_language varchar(2),
	oid int,
	index course_oid (oid),
	foreign key (oid) references organization (oid) on delete cascade,
	primary key (cid),
   unique (c_nr, current_sem)
);

create table pl_attends_c (
	cid int not null,
	pid int not null,
	index pl_attends_cid (cid),
	foreign key (cid) references course (cid) on delete cascade,
	index pl_attends_pid (pid),
	foreign key (pid) references person (pid) on delete cascade,
	primary key (cid, pid)
);

create table i_leads_c (
	pid int not null,
	cid int not null,
	index i_leads_c_pid (pid),
	foreign key (pid) references person (pid) on delete cascade,
	index i_leads_c_cid (cid),
	foreign key (cid) references course (cid) on delete cascade,
	primary key (cid, pid)
);

create table model (
	mid int not null auto_increment,
	name varchar(50) not null unique,
	description varchar(100),
	resources mediumblob,
	primary key (mid)
);

create table AMEISEDBInfo (
	dbid int not null auto_increment,
	DBVersion varchar(10) not null unique, 	/* Die Versionsnummer des impl. Schemas */
	Rel varchar(10) not null unique, 	/* Die Versionsnummer des SQL Scripts */
	Startup date,				/* Datum/Uhrzeit der DB Initialisierung */
	Author varchar(20),			/* Autor des SQL Scripts */
	Description varchar(60),		/* Metatextliche Beschreibung der Version */
	primary key (dbid)
);

create table dictionary (
	dicid int not null auto_increment,
	description mediumblob not null,
        dict_filename varchar(50) not null,
	language varchar(2) not null,
	mid int not null,
	fullsyntaxcheck char(1) not null,
	freeparameterselection char(1) not null,
	commandtooltips char(1) not null,
	index dictionary_mid (mid),
	batch_filename longtext not null,
	foreign key (mid) references model (mid) on delete cascade,
	primary key (dicid)
);

create table explanation (
	explid int not null auto_increment,
	description text not null,
	language varchar(2) not null,
	mid int not null,
	index explanation_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	primary key (explid)
);

create table client_mapping(
	clid int not null auto_increment,
	domain varchar(50) not null,
	value varchar(50) not null,
	mid int not null,
	index clmap_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	primary key (clid)
);

create table model_instance (
	minstid int not null auto_increment,
        name varchar(50) not null,
	initial_state mediumblob not null,
	is_filename varchar(50) not null,
        initial_prot mediumblob not null,
	prot_filename varchar(50) not null,
	start_date date not null,
	completion_date date not null,
	exercise text not null,
	mid int not null,
	entities mediumblob,
	feedback mediumblob,
	relations mediumblob,
	index model_instance_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	primary key (minstid)
);

create table model_rule (
	mrid int not null auto_increment,
	rule mediumblob not null,
        rule_filename varchar(50) not null,
	minstid int not null,
	index model_rule_minstid (minstid),
	foreign key (minstid) references model_instance (minstid) on delete cascade,
	primary key (mrid)
);

create table execution_model (
	exmid int not null auto_increment,
	rule mediumblob not null,
        rule_filename varchar(50) not null,
	minstid int not null,
	index execution_mode_minstid (minstid),
	foreign key (minstid) references model_instance (minstid) on delete cascade,
	primary key (exmid)
);

create table temp (
	tmpid int not null auto_increment,
	file longtext not null,
	primary key (tmpid)
);

create table registered_component(
	regid int not null auto_increment,
	type char(1) not null,
	socket varchar(20) not null,
	description varchar(50) not null,
	mid int not null,
	index registered_component_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	primary key (regid)
);

create table tournament(
	tid int not null auto_increment,
	description varchar(50) not null,
	t_counter integer(3) not null,
	cid int not null,
	minstid int not null,
	index tournament_cid (cid),
	foreign key (cid) references course (cid) on delete cascade,
	index tournament_minstid (minstid),
	foreign key (minstid) references model_instance (minstid) on delete cascade,
	primary key (tid)
);

create table rnd(
	rndid int not null auto_increment,
	r_counter int(3) not null,
	tid int not null,
	index rnd_tid (tid),
	foreign key (tid) references tournament (tid) on delete cascade,
	primary key (rndid)
);

create table game(
	gid int not null auto_increment,
	progress char(1) not null,
	self_played varchar(30),
	pid int not null,
	act_turn int,
	act_date date default '0001-01-01' not null,
	rndid int not null,
	index game_act_turn (act_turn),
	index game_pid (pid),
	foreign key (pid) references person (pid) on delete cascade,
	index game_rndid (rndid),
	foreign key (rndid) references rnd (rndid) on delete cascade,
	primary key (gid)
);

create table turn(
	tnid int not null auto_increment,
	name varchar(100),
	date date not null,
	command varchar(100) not null,
	feedback blob,
	autosave tinyint(1) default '0' not null,
	usersave tinyint(1) default '0' not null,
	milestone tinyint(1) default '0' not null,
	path varchar(100) not null,
	act_sit mediumblob,
        act_prot mediumblob,
	gid int not null,
	predecessor int,
	index turn_gid (gid),
	foreign key (gid) references game (gid) on delete cascade,
	index turn_predecessor (predecessor),
	foreign key (predecessor) references turn (tnid) on delete cascade,
	primary key (tnid)
);

alter table game add
	foreign key (act_turn) references turn (tnid) on delete cascade; 

create table kind_of_aid(
	kaidid int not null auto_increment,
	description varchar(100) not null,
	primary key (kaidid)
);

create table aid_description(
	aiddid int not null auto_increment,
	description varchar(180) not null,
	type char(1),
	detail int,
	kaidid int not null,
	mid int not null,
	index aid_description_mid (mid),
	foreign key (mid) references model (mid) on delete cascade, 
	index aid_description_kaidid (kaidid),
	foreign key (kaidid) references kind_of_aid (kaidid) on delete cascade, 
	index aid_description_detail (detail),
	foreign key (detail) references aid_description (aiddid) on delete cascade, 
	primary key (aiddid)
);

/* neue Tabelle */
create table aid_desc_lang(
	did int not null auto_increment,
        description varchar(180),
        language varchar(2),     /* neu – legt Sprache für Bezeichnung fest*/       
	aiddid int not null,
	index aid_desc_lang_aiddid (aiddid),
 	foreign key (aiddid) references aid_description (aiddid) on delete cascade,
	primary key (did)
); 


create table related(
	parent int not null,
	child int not null,
	weight int not null,
	primary key (parent, child),
	index related_parent (parent),
	foreign key (parent) references aid_description(aiddid) on delete cascade, 
	index related_child (child),
	foreign key (child) references aid_description(aiddid) on delete cascade
);

create table query(
	qid int not null auto_increment,
	attribute varchar(50) not null,
	statement text not null,
	z_path varchar(200),	
	primary key (qid)
);

create table rule(
	rlid int not null auto_increment,
        zort char(1),
	basic_op varchar(10) not null,
	value_ref_point double,
	text_ref_point varchar(30),
	expression text,  /* Angabe von Berechnungsformeln*/
	primary key (rlid)
);

create table specific_aid(
	spaidid int not null auto_increment,
	description varchar(180) not null,
      	diagram tinyint(1) default '0' not null,
        layout char(1),
        qualification char(1),	
	aiddid int,
	index specific_aid_aiddid (aiddid),
	foreign key (aiddid) references aid_description (aiddid) on delete cascade,
	primary key (spaidid)
);

create table spec_aid_lang(
	said int not null auto_increment,
	description varchar(180) default '' not null,
	title varchar(60) default '' not null,
	text text not null,	
	xaxis varchar(30),	
       	yaxis varchar(30), 	
        language varchar(2),    
        spaidid int not null,
	index spec_aid_lang_spaidid (spaidid),
	foreign key (spaidid) references specific_aid (spaidid) on delete cascade,
	primary key (said)
);

create table aid_instance(
	instid int not null auto_increment,
        description varchar(50) default '' not null,
        predecessor int,
        spaidid int not null,
 	qid int,
	rlid int,
	flag varchar(4),
	index aid_instance_qid (qid),
	foreign key (qid) references query (qid) on delete cascade,
	index aid_instance_rlid (rlid),
	foreign key (rlid) references rule (rlid) on delete cascade,
	index aid_instance_predecessor (predecessor),
        foreign key (predecessor) references aid_instance (instid) on delete cascade,
	index aid_instance_spaidid (spaidid),
	foreign key (spaidid) references specific_aid (spaidid) on delete cascade,
	primary key (instid)
);

create table aid_inst_lang(
	aiid int not null auto_increment,
        description varchar(50) default '' not null,
        abbreviation varchar(20),
      	language varchar(2),     
        instid int not null,
	index aid_inst_lang_instid (instid),
 	foreign key (instid) references aid_instance (instid) on delete cascade,
	primary key (aiid)
);


create table archive_data (
	gid int not null,
	aiddid int not null,
	value double,
        qualification char(1),
	important tinyint(1) default '0',
	index archive_data_gid (gid),
	foreign key (gid) references game (gid) on delete cascade,
	index archive_data_aiddid (aiddid),
	foreign key (aiddid) references aid_description (aiddid) on delete cascade,
	primary key (gid, aiddid)
);

/* EH, 18.8.2005, reaktiviert, Erlaubte Hilfsmittel pro Turnier (lt. Besprechung 050705 Uni Klu) */
create table t_allows_aiddesc(
	tid int not null,
	aiddid int not null,
	index t_allows_aiddesc_tid (tid),
	foreign key (tid) references tournament (tid) on delete cascade,
	index t_allows_aiddesc_aiddid (aiddid),
	foreign key (aiddid) references aid_description (aiddid) on delete cascade,
	primary key (tid, aiddid)
);
/* NEU EH, 19.9.2004; Erlaubte Hilfmittelarten pro Turnier (TUI, GUI, Ratgeber, friendly peer, ...)*/
/* GELÖSCHT, EH, 18.8.2005, wird durch Erlaubte Hilfsmittel ersetzt (lt. Besprechung 050705 Uni Klu) */
/* create table t_allows_kaid(
	tid int not null,
	kaidid int not null,
	index t_allows_kaid_tid (tid),
	foreign key (tid) references tournament (tid) on delete cascade,
	index t_allows_kaid_kaidid (kaidid),
	foreign key (kaidid) references aid_description (kaidid) on delete cascade,
	primary key (tid, kaidid)
);
*/

create table milestone(
      	msid int not null auto_increment,
	aiddid int not null,
	mid int not null,
	p_or_r char(1) not null,
	type_of_ms varchar(40) not null,
	z_path varchar(200) not null,
	command varchar(100),
       	phase_end_ms varchar(50),
	kind varchar(20),
	value integer,	
        action varchar(200),
	index milestone_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	index milestone_aiddid (aiddid),
	foreign key (aiddid) references aid_description (aiddid) on delete cascade,
	primary key (msid)
);


create table ms_lang(
	mslangid int not null,
	type_of_ms varchar(40),
	text varchar(40) not null,
	language varchar(2) not null,
	msid int not null,
	foreign key (msid) references milestone (msid) on delete cascade,
	primary key (mslangid)	
);


create table zarms_logic(
	zlid int not null auto_increment,
	source char(1) not null,
	datatype char(1) not null,
	l_path varchar(200) not null,
	ameise_path varchar(200) not null,
	position integer,
	EorR char(1) not null,
	action char(1) not null,
	mid int not null,
	foreign key (mid) references model(mid),
	primary key (zlid)
);

create table zarmstype(
	zid int not null auto_increment,
	z_type varchar(30) not null,
	eorr char(1) not null,
	mid int not null,
	index zarmstype_mid (mid),
	foreign key (mid) references model (mid) on delete cascade,
	primary key (zid)
);

create table spaid_needs_zt(
	spaidid int not null,
	zid int not null,
	index spaid_needs_zt_spaidid (spaidid),
	foreign key (spaidid) references specific_aid (spaidid) on delete cascade,
	index spaid_needs_zt_zid (zid),
	foreign key (zid) references zarmstype (zid) on delete cascade,
	primary key (spaidid, zid)
);

create table z_entity(
	zeid int not null auto_increment,
	description varchar(30) not null,
	zid int not null,
	index z_entity_zid (zid),
	foreign key (zid) references zarmstype (zid) on delete cascade,
	primary key (zeid)
);

create table z_attribute(
	zaid int not null auto_increment,
	name varchar(30) not null,
	primary key (zaid)
);

create table comprises (
	compid int not null auto_increment,
	zeid int not null,
	zaid int not null,
	index comprises_zeid (zeid),
	foreign key (zeid) references z_entity (zeid) on delete cascade,
	index comprises_zaid (zaid),
	foreign key (zaid) references z_attribute (zaid) on delete cascade,
	primary key (compid)
);

create table s_entity (
	gid int not null,
	path varchar(100) not null,
	value varchar(30),
        compid int not null,
	tnid int not null,
	index s_entitiy_compid (compid),
	foreign key (compid) references comprises (compid) on delete cascade,
	foreign key (tnid) references turn (tnid) on delete cascade,
	index s_entity_tnid (tnid),
	foreign key (gid) references game (gid) on delete cascade,	
	primary key (compid, gid, path, tnid)
);

create table s_relation (
	gid int not null,
	zid int not null,
	document varchar(50) default '' not null,
	reference_doc varchar(50),
	person varchar(40) not null,
	starting_date date not null,
	completion_date date default '0001-01-01' not null,
	success tinyint(1) default '0' not null,
	customer tinyint(1) default '0' not null,
        finished tinyint(1) default '0' not null,
	path varchar(100) not null,
	tnid int not null,
	index s_relation_tnid (tnid),
	foreign key (gid) references game (gid) on delete cascade,
	foreign key (tnid) references turn (tnid) on delete cascade,
	index s_relation_zid (zid),
	foreign key (zid) references zarmstype (zid) on delete cascade,
	primary key (gid, zid, document, person, starting_date, completion_date, path, tnid)
);

create table ms_info (
	msinfoid int not null auto_increment,
	kind_of_ms varchar(50),
	tnid int not null,
        msid int not null,
	index ms_info_tnid (tnid),
	foreign key (tnid) references turn (tnid) on delete cascade,
	index ms_info_msid (msid),
	foreign key (msid) references milestone (msid) on delete cascade,
	primary key (msinfoid)
);

create table ms_predecessor (
	tnid int not null,
	description varchar(100),
	cmd_history text,
	index ms_predecessor_tnid (tnid),
	foreign key (tnid) references turn (tnid) on delete cascade,
	primary key (tnid)
);

create table domains (
   	domain varchar(25) not null,
	abbr varchar(20) not null,
	value varchar(50) not null,
	sort int,
	primary key(domain, abbr)
); 

create table domain_description(
	domain varchar(25) not null,
	description varchar(50) not null,
	primary key (domain)
);

/* table for FPeer - hmks to turn */
create table turn_has_hmk(
	tnid int not null,
	spaidid int not null,
	foreign key (tnid) references turn (tnid) on delete cascade,
	foreign key (spaidid) references specific_aid (spaidid) on delete cascade,
	primary key (tnid, spaidid)
);



insert into role (rid, description) values (1, 'Administrator');
insert into role (rid, description) values (2, 'LVLeiter');
insert into role (rid, description) values (3, 'Modellbauer');
insert into role (rid, description) values (4, 'Spieler');

/*Ein Defaultbenutzer mit der Rolle Administrator*/
insert into person (pid, username, password, forename, surname, language) values
(1, 'admin01', 'admin01', 'Admin', 'Admin', 'de');

insert into p_acquires_r (pid, rid, applied) values
(1, 1, sysdate());

/*Einfuegen in die Tabelle domain-description*/
/*Alle Domains, die über einen Meuepunkt im Admin Tool erweitert werden können (wie z.B. das Semester) müssen hier eingetragen werden */
/*Der domain in dieser Tabelle muss mit dem domain in der Tabelle domains übereinstimmen*/
insert into domain_description(domain, description)
values('LANG', 'Sprache');
insert into domain_description(domain, description)
values('SEM', 'Semester');
insert into domain_description(domain, description)
values('COMP', 'registrierte Komponenten');

/* Einfuegen in die Domains-Tabelle */
/* EH, 18.8.2005, Semesterangaben ergänzt */
insert into domains(domain, abbr, value, sort) 
values('LANG','de', 'Deutsch', 1);
insert into domains(domain, abbr, value, sort) 
values('LANG','en', 'Englisch', 2);
insert into domains(domain, abbr, value, sort) 
values('LANG','fr', 'Französisch', 3);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS01', 'WS01', 1);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS02', 'SS02', 2);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS02', 'WS02', 3);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS03', 'SS03', 4);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS03', 'WS03', 5);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS04', 'SS04', 6);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS04', 'WS04', 7);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS05', 'SS05', 8);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS05', 'WS05', 9);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS06', 'SS06', 10);
insert into domains(domain, abbr, value, sort) 
values('SEM','WS06', 'WS06', 11);
insert into domains(domain, abbr, value, sort) 
values('SEM','SS07', 'SS07', 12);
insert into domains(domain, abbr, value, sort)
values('Z_ART','R','Relation', 1);
insert into domains(domain, abbr, value, sort)
values('Z_ART','E','Entity', 2); 
insert into domains(domain, abbr, value, sort)
values('WERTART','Z','Zahl', 1);
insert into domains(domain, abbr, value, sort)
values('WERTART','T','Text', 2); 
insert into domains(domain, abbr, value, sort)
values('MSART', 'R', 'Ressourcen', 1);
insert into domains(domain, abbr, value, sort)
values('MSART', 'P', 'Phasen', 2);
insert into domains(domain, abbr, value, sort)
values('COMP', 'W', 'Wrapper', 1);
insert into domains(domain, abbr, value, sort)
values('COMP', 'D', 'Datenbank', 2);
insert into domains(domain, abbr, value, sort)
values('COMP', 'L', 'LBM', 3);
insert into domains(domain, abbr, value, sort)
values('PROGRESS', 'I', 'Initial', 1);
insert into domains(domain, abbr, value, sort)
values('PROGRESS', 'P', 'Processing', 2);
insert into domains(domain, abbr, value, sort)
values('PROGRESS', 'F', 'Finished', 3);
insert into domains(domain, abbr, value, sort)
values('EBENE', 'LV', 'Lehrveranstaltung', 1);
insert into domains(domain, abbr, value, sort)
values('EBENE', 'T', 'Turnier', 2);
insert into domains(domain, abbr, value, sort)
values('EBENE', 'R', 'Runde', 3);
insert into domains(domain, abbr, value, sort)
values('DELETE', 'A', 'Account abgelaufen', 1);
insert into domains(domain, abbr, value, sort)
values('DELETE', 'O', 'Keine Zuordnung zu LVs', 2);
insert into domains(domain, abbr, value, sort)
values('DIAGRAM', 'H', 'Horizontal', 1);
insert into domains(domain, abbr, value, sort)
values('DIAGRAM', 'V', 'Vertikal', 1);
insert into domains(domain, abbr, value, sort)
values('DIAGRAM', 'X', 'Ueberlappend', 1);
insert into domains(domain, abbr, value, sort)
values('IMPEXP', 'I', 'Import', 1);
insert into domains(domain, abbr, value, sort)
values('IMPEXP', 'E', 'Export', 1);
insert into domains(domain, abbr, value, sort)
values('EBENE2', 'LV', 'Lehrveranstaltung', 1);
insert into domains(domain, abbr, value, sort)
values('EBENE2', 'T', 'Turnier', 2);
insert into domains(domain, abbr, value, sort)
values('EBENE2', 'R', 'Runde', 3);
insert into domains(domain, abbr, value, sort)
values('EBENE2', 'S', 'Spiel', 4);
insert into domains(domain, abbr, value, sort)
values('QUALIFIKATION', 'T', 'True', 1);
insert into domains(domain, abbr, value, sort)
values('QUALIFIKATION', 'F', 'False', 2);
insert into domains(domain, abbr, value, sort)
values('QUALIFIKATION', 'B', 'Between', 3);
insert into domains(domain, abbr, value, sort)
values('TYPE', 'O', 'Objective', 1);

/* Hilfsmittelarten festlegen: analysis, friendly peer, adviser, milestone,... */
INSERT INTO kind_of_aid(kaidid,description)
VALUES (1,"analysis");
INSERT INTO kind_of_aid (kaidid,description)
VALUES (3, "friendly peer");
INSERT INTO kind_of_aid(kaidid,description)
VALUES (4,"milestone");

/* EH, 18.8.2005, TUI u. GUI als Hilfsmittelart ergänzen */
/* DP -> eigene controllercomponenten 09.01.2006
INSERT INTO kind_of_aid (kaidid,description)
VALUES (5, "TUI enabled");
INSERT INTO kind_of_aid(kaidid,description)
VALUES (6,"GUI enabled");
*/

/* EH, 18.8.2005, ausstaendig: TUI u. GUI bei jedem Modell als Hilfsmittel einrichten (lt. Besprechung 050705 Uni-Klu) */


