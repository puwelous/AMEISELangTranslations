/**********************************/
/*  Review Information   */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(500,"Review Information",NULL,1,1);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(2000,"Review Information","en",500);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(2001,"Review Information","de",500);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(2002,"Inform·cie o posudzovanÌ","sk",500);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3800,"Review Information",0,"T",NULL,500);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (962,"Review Information","
Description:
This table shows which employees reviewed and corrected which document and if the customer participated in these activities.

Explanation/Recommendations:
Not available yet.
","",null,null,"en",3800);
/* TODO: daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (963,"Review Information","
Description:
This table shows which employees reviewed and corrected which document and if the customer participated in these activities.

Explanation/Recommendations:
Not available yet.
","",null,null,"de",3800);
/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (9063,"Inform·cie o posudzovanÌ","
Popis:
T·to tabuæka ukazuje, ktorÌ zamestnanci sa podieæali na posudzovanÌ a korekcii t˝ch-ktor˝ch dokumentov a taktieû Ëi s·m z·kaznÌk sa z˙Ëastnil t˝chto aktivÌt.

Vysvetlenie/Odpor˙Ëania:
éiadne.
","",null,null,"sk",3800);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (6000,"root",NULL,3800,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44000,"root",null,"en",6000);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144000,"root",null,"de",6000);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144001,"root",null,"sk",6000);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (6001,"",6000,3800,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44001,"","Phases","en",6001);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144002,"","Phases","de",6001);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144003,"","Phases","sk",6001);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (6002,"Team",6001,3800,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44002,"Team","","en",6002);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144004,"Team","","de",6002);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144005,"Team","","sk",6002);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (6003,"Date",6001,3800,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44100,"Date","","en",6003);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144006,"Date","","de",6003);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144007,"Date","","sk",6003);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (6004,"Customer",6001,3800,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44200,"Customer","","en",6004);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144008,"Customer","","de",6004);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144009,"Customer","","sk",6004);

/* zeilen einf¸gen f¸r Manual, Moduldesign etc.*/

/*** Specification ***/


/**** PERSON - review */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4000," ",
'SELECT s_relation.person as value FROM s_relation, zarmstype,game WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid and
z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/** PERSON - korrektur */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4001," ",
'SELECT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid
and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/* Datum - review */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4002," ",
'SELECT s_relation.starting_date as value FROM s_relation, zarmstype,game WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid and
z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/* Datum - korrektur */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4003," ",
'SELECT s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid
and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/* CUSTOMER - Begutachtet */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4004," ",
'SELECT distinct s_relation.customer as value FROM s_relation, zarmstype,game WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid and
z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/* CUSTOMER - Korrigiert */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4005," ",
'SELECT distinct s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE game.gid = s_relation.gid and zarmstype.zid = s_relation.zid
and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R" and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/***** Systemdesign ****/

/*** Begutachtet ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4006," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4007," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4008," ",
'SELECT distinct s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/*** Korrigiert ***/

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4009," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4010," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4011," ",
'SELECT distinct s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/*** MODUL design ****/

/*** begutachtet ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4012," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4013," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4014," ",
'SELECT DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);



/*** korrigiert ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4015," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4016," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4017," ",
'SELECT DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/*** CODE design ****/

/*** begutachtet ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4018," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4019," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4020," ",
'SELECT DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);


/*** korrigiert ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4021," ",
'SELECT  s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4022," ",
'SELECT  s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4023," ",
'SELECT DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/*** CODE design ****/

/*** begutachtet ***/
INSERT INTO query(qid,attribute,statement,z_path) VALUES (4024," ",
'SELECT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4025," ",
'SELECT s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4026," ",
'SELECT  DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

/*** korrigiert ***/

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4027," ",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4028," ",
'SELECT DISTINCT s_relation.starting_date as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (4029," ",
'SELECT DISTINCT s_relation.customer as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 group by starting_date, person;',null);



/**** ZEILE REVIEW Specification ****/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5000,"SP Review",6002,3800,4000,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44003,"SP Review","","en",5000);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144010,"SP Review","","de",5000);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144011,"SP Review","","sk",5000);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5002,"SP Review",6003,3800,4002,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44005,"SP Review","","en",5002);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144012,"SP Review","","de",5002);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144013,"SP Review","","sk",5002);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5004,"SP Review",6004,3800,4004,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44007,"SP Review","","en",5004);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144014,"SP Review","","de",5004);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144015,"SP Review","","sk",5004);

/**** Zeile KOrrektur Spezification ***/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5001,"SP Correction",5000,3800,4001,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44004,"SP Correction","","en",5001);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144016,"SP Correction","","de",5001);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144017,"SP Correction","","sk",5001);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5003,"SP Correction",5002,3800,4003,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44006,"SP Correction","","en",5003);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144018,"SP Correction","","de",5003);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144019,"SP Correction","","sk",5003);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5005,"SP Correction",5004,3800,4005,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44008,"SP Correction","","en",5005);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144020,"SP Correction","","de",5005);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144021,"SP Correction","","sk",5005);

/**** Zeile Reveiw Systemdesign ***/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5006,"SD Review",5001,3800,4006,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44009,"SD Review","","en",5006);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144022,"SD Review","","de",5006);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144023,"SD Review","","sk",5006);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5007,"SD Review",5003,3800,4007,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44010,"SD Review","","en",5007);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144024,"SD Review","","de",5007);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144025,"SD Review","","sk",5007);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5008,"SD Review",5005,3800,4008,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44011,"SD Review","","en",5008);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144026,"SD Review","","de",5008);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144027,"SD Review","","sk",5008);

/**** Zeile Korrektur Systemdesign ***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5009,"SD Correction",5006,3800,4009,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44012,"SD Correction","","en",5009);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144028,"SD Correction","","de",5009);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144029,"SD Correction","","sk",5009);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5010,"SD Correction",5007,3800,4010,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44013,"SD Correction","","en",5010);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144030,"SD Correction","","de",5010);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144031,"SD Correction","","sk",5010);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5011,"SD Correction",5008,3800,4011,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44014,"SD Correction","","en",5011);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144032,"SD Correction","","de",5011);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144033,"SD Correction","","sk",5011);

/**** Zeile Reveiw Moduldesign ***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5012,"MD Review",5009,3800,4012,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44015,"MD Review","","en",5012);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144034,"MD Review","","de",5012);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144035,"MD Review","","sk",5012);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5013,"MD Review",5010,3800,4013,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44016,"MD Review","","en",5013);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144036,"MD Review","","de",5013);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144037,"MD Review","","sk",5013);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5014,"MD Review",5011,3800,4014,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44017,"MD Review","","en",5014);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144038,"MD Review","","de",5014);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144039,"MD Review","","sk",5014);

/**** Zeile Korrektur Moduldesign ***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5015,"MD Correctur",5012,3800,4015,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44018,"MD Correctur","","en",5015);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144040,"MD Correctur","","de",5015);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144041,"MD Correctur","","sk",5015);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5016,"MD Correctur",5013,3800,4016,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44019,"MD Correctur","","en",5016);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144042,"MD Correctur","","de",5016);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144043,"MD Correctur","","sk",5016);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5017,"MD Correctur",5014,3800,4017,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44020,"MD Correctur","","en",5017);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144044,"MD Correctur","","de",5017);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144045,"MD Correctur","","sk",5017);

/**** Zeile Reveiw Code***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5018,"Code Review",5015,3800,4018,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44021,"Code Review","","en",5018);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144046,"Code Review","","de",5018);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144047,"Code Review","","sk",5018);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5019,"Code Review",5016,3800,4019,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44022,"Code Review","","en",5019);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144048,"Code Review","","de",5019);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144049,"Code Review","","sk",5019);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5020,"Code Review",5017,3800,4020,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44023,"Code Review","","en",5020);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144050,"Code Review","","de",5020);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144051,"Code Review","","sk",5020);


/**** Zeile Korrektur Code***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5021,"Code Correction",5018,3800,4021,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44024,"Code Correction","","en",5021);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144052,"Code Correction","","de",5021);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144053,"Code Correction","","sk",5021);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5022,"Code Correction",5019,3800,4022,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44025,"Code Correction","","en",5022);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144054,"Code Correction","","de",5022);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144055,"Code Correction","","sk",5022);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5023,"Code Correction",5020,3800,4023,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44026,"Code Correction","","en",5023);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144056,"Code Correction","","de",5023);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144057,"Code Correction","","sk",5023);

/**** Zeile Reveiw Manuals ***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5024,"Manual Review",5021,3800,4024,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44027,"Manual Review","","en",5024);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144058,"Manual Review","","de",5024);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144059,"Manual Review","","sk",5024);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5025,"Manual Review",5022,3800,4025,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44028,"Manual Review","","en",5025);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144060,"Manual Review","","de",5025);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144061,"Manual Review","","sk",5025);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5026,"Manual Review",5023,3800,4026,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44029,"Manual Review","","en",5026);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144062,"Manual Review","","de",5026);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144063,"Manual Review","","sk",5026);

/** Zeile korrektur manual ***/

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5027,"Manual Correction",5024,3800,4027,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44030,"Manual Correction","","en",5027);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144064,"Manual Correction","","de",5027);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144065,"Manual Correction","","sk",5027);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5028,"Manual Correction",5025,3800,4028,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44031,"Manual Correction","","en",5028);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144066,"Manual Correction","","de",5028);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144067,"Manual Correction","","sk",5028);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (5029,"Manual Correction",5026,3800,4029,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (44032,"Manual Correction","","en",5029);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144068,"Manual Correction","","de",5029);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (144069,"Manual Correction","","sk",5029);



/**********************************/
/*    PERFORMANCE       */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (400,"Performance",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (1200,"Performance","en",400);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (1201,"Performanz","de",400);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5201,"Naplnenie","sk",400);


INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid)
VALUES (3100,"Performance",1,'V',400);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (800,"Performance","Performance","Description:
This diagram summarizes the goal achievement (days and AFPs) in respect to the original project objectives. The 100 percent line represents the exact goals. The x-axis shows the project duration, the intermediate, and final documents. The y-axis prints the values relative to the project goals. Values higher than 100% indicate better performance, values lower than 100% indicate a loss in performance. (Values: *)

Explaination/Recommendations:
Typically the quality of documents decreases from document to document. Thus, the better the quality of the system specification, the easier it might be to keep the quality of the suceeding documents. An increase in quality between the module design document and the code indicates that a lot of effort has been spent on testing activities. The exact values of the AFPs can be found in Section 7 (Completeness of documents).",
"en","%","Performance",3100);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (801,"Performanz","Performanz","Beschreibung:
Dieses Diagramm fasst die Zielerreichung (in Tagen bzw. AFPs) bez¸glich der urspr¸nglichen Projektziele zusammen. Die 100%-Marke repr‰sentiert das Erreichen der exakten Zielvorgabe. Die X-Achse zeigt die Projektdauer und die Zwischen- und Enddokumente. Die Y-Achse weist die Werte im Verh‰ltnis zu den Projektzielen aus. Werte ¸ber 100% deuten auf eine bessere Performanz hin, Werte darunter einen Verlust an Performanz. (Werte: *)

Erkl‰rung/Empfehlungen:
Typischerweise verringert sich die Qualit‰t von Dokumenten von Dokument zu Dokument. Je besser daher die Qualit‰t der Systemspezifikation schon ist, desto leichter f‰llt es, eine gewisse Qualit‰t der nachfolgenden Dokumente zu gew‰hrleisten. Eine Erhˆhung der Qualit‰t zwischen dem Moduldesign und der Implementierung weisen daraufhin, daﬂ viel Aufwand f¸r das Testen betrieben wurde. Die exakten AFP-Werte finden sich im Abschnitt 7 (Vollst‰ndigkeit der Dokumente).",
"de","%","Performanz",3100);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (8001,"Naplnenie","Naplnenie","Popis:
Tento diagram sumarizuje dosiahnutie cieæov (dni a AFPs) s ohæadom na pÙvodnÈ z·mery projektu. 100%-n· Ëiara reprezentuje exaktnÈ ciele. X-ov· os ukazuje trvanie projektu, predhodnÈ a fin·lne dokumenty. Y-ov· os zobrazuje hodnoty vzùahuj˙ce sa na ciele projektu. Hodnoty vyööie neû 100% indikuj˙ lepöie naplnenie, hodnoty menöie neû 100% indikuj˙ menöie naplnenie. (Hodnoty: *)

Vysvetlenie/Odpor˙Ëania:
Typicky sa kvalita dokumentov zniûuje od dokumentu k dokumentu. Preto, ËÌm je vyööia kvalita systÈmovej öpecifik·cie, t˝m jednoduchöie mÙûe byù udrûanie kvality dokumentov, ktorÈ nasleduj˙. Zv˝öenie kvality medzi n·vrhom modulov a kÛdom indikuje, ûe veæa ˙silia bolo vynaloûenÈho na testovanie. PresnÈ hodnoty AFPs mÙûete n·jsù v sekcii 7 (⁄plnosù dokumentov).",
"sk","%","Naplnenie",3100);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2800,'project length',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_DAUER_ZV" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTZUSTAND*Projectstatus*PROZENT_DAUER_ZV");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3100,"Project length",null,3100,2800,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42000,"Project length","PL","en",3100);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42001,"Projekt Dauer","PD","de",3100);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142001,"Trvanie projektu","TP","sk",3100);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2801,'specification compl.',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*PROZENT_AFP_100");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3101,"Specification completeness",3100,3100,2801,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42002,"Specification completeness","SC","en",3101);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42003,"Specification completeness","SC","de",3101);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142002,"⁄plnosù öpecifik·cie","⁄ä","sk",3101);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2802,'system design compl.',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*PROZENT_AFP_100");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3102,"System design completeness",3101,3100,2802,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (41999,"System design completeness","SD","en",3102);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42004,"System design completeness","SD","de",3102);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142003,"⁄plnosù n·vrhu systÈmu","⁄NS","sk",3102);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2803,'module design compl.',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*PROZENT_AFP_100");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3103,"Module design completeness",3102,3100,2803,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42005,"Module design completeness","MDC","en",3103);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42006,"Module design completeness","MDC","de",3103);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142004,"⁄plnosù n·vrhu modulov","⁄NM","sk",3103);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2804,'code compl.',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*PROZENT_AFP_100");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3104,"Code completeness",3103,3100,2804,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42007,"Code completeness","CC","en",3104);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42008,"Code completeness","CC","de",3104);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142005,"⁄plnosù kÛdu","⁄K","sk",3104);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2805,'manual compl.',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*PROZENT_AFP_100");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3105,"Manual completeness",3104,3100,2805,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42009,"Manual completeness","MC","en",3105);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42010,"Manual completeness","MC","de",3105);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142005,"⁄plnosù manu·lov","⁄M","sk",3105);

insert into query (qid, attribute, statement)
values(3256, 'Legend line', 100);

insert into aid_instance(instid, description,spaidid,qid,flag)
values (3799, 'Legend line', 3100, 3256, 'HL');



/**********************************/
/*    MANUAL PREPARATION       */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(406,"Manual preparation",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1212,"Manual preparation","en",406);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1213,"Manual preparation","de",406);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5213,"PrÌprava manu·lov","sk",406);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3106,"Manual preparation",1,"G",NULL,406);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (812,"Manual preparation","
Legend:
MN ... manual/documentation creation (begin-end, author(s)), MNRev ... review of manuals (begin-end, author(s)), MNCorr ... corrections of manuals (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the author(s) of manuals and the member(s) of the review/correction team(s).

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts.
","Manual preparation","Date","Phase","en",3106);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (813,"Manual preparation","Legende:
MN ... Handbuch-/Dokumentationserstellung (Anfang-Ende, Autor(en)), MNRev ... Handbuchreview (Anfang-Ende, Autor(en)), MNCorr ... Handbuchkorrekturen (Anfang-Ende, Autor(en)). Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt den/die Autor(en) der Handb¸cher und die Mitglieder der Review-/Korrekturteams.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"Manual preparation",null,null,"de",3106);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8012,"PrÌprava manu·lov","
Legenda:
MN ... vytvorenie manu·lu/dokument·cie (zaËiatok-koniec, autor(i)), MNRev ... posudky pre manu·ly (zaËiatok-koniec, autor(i)), MNCorr ... opravy manu·lov (zaËiatok-koniec, autor(i)).
Rozhodnutia a prÌkazy manaûÈra projektu, ktorÈ neviedli ku ûiadnej aktivite s˙ oznaËenÈ Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje autora/autorov manu·lov a Ëlenov posudzuj˙cich/opravuj˙cich tÌmov.

Vysvetlenie/Odpor˙Ëania:
»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.
","PrÌprava manu·lov",null,null,"sk",3106);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3142,"root",NULL,3106,null,NULL);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2839,'Manual',
'select distinct "MANUAL" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HANDBUCH_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MANUAL" as description,
greatest((
select max(s_entity.value) as value from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HANDBUCH_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2840,"Manual review",
'select distinct "MAN REV" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MAN REV" as description,
greatest((
select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2841,"Manual corr",
'select distinct "MAN COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MAN COR" as description,
greatest((
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2845,"Review with client",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="REVIEW_MIT_KUNDE_FINDET_STATT"
AND (document = "Manuals" OR document = "Manual")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2842,"Manuals",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND document = "Manual") AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2843,"Manuals review",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Manuals" OR document = "Manual")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2844,"Manuals corrections",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Manuals" OR document = "Manual")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3143,"Manuals",3142,3106,2839,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3144,"Manuals review",3142,3106,2840,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3145,"Manuals corrections",3142,3106,2841,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3149,"Review with client",3142,3106,2845,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42073,"Manuals","MN","en",3143);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42074,"Manuals review","MNRev","en",3144);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42075,"Manuals corrections","MNCorr","en",3145);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42079,"Review with Client","RevCl","en",3149);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43000,"Manuals","MN","de",3143);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43001,"Manuals review","MNRev","de",3144);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43002,"Manuals corrections","MNCorr","de",3145);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43003,"Review with Client","RevCl","de",3149);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143000,"Manuals","MN","sk",3143);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143001,"Manuals review","MNRev","sk",3144);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143002,"Manuals corrections","MNCorr","sk",3145);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143003,"Review with Client","RevCl","sk",3149);
/* */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3146,"Manuals",3143,3106,2842,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3147,"Manuals review",3144,3106,2843,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3148,"Manuals corrections",3145,3106,2844,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42076,"Manuals","MN","en",3146);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42077,"Manuals review","MNRev","en",3147);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42078,"Manuals corrections","MNCorr","en",3148);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43004,"Manuals","MN","de",3146);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43005,"Manuals review","MNRev","de",3147);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43006,"Manuals corrections","MNCorr","de",3148);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143004,"Manuals","MN","sk",3146);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143005,"Manuals review","MNRev","sk",3147);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143006,"Manuals corrections","MNCorr","sk",3148);
/* */

/**********************************/
/* specification and system design   */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(407,"Specification and system design",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1214,"Specification and system design","en",407);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1215,"Specification and system design","de",407);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5215,"äpecifik·cia a n·vrh systÈmu","sk",407);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3107,"Specification and system design",1,"G",NULL,407);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (814,"Specification and system design","
Legend:
SP ... specification phase (begin-end, author(s)), SPRev ... specification review (begin-end, author(s)), SPCorr ... specification correction (begin-end, author(s)), SD ... system design (begin-end, author(s)), SDRev ... system design review (begin-end, author(s)), SDCorr ... system design correction (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the author(s) of documents and the member(s) of the review/correction team(s) used in the specification and system design phase.

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts.","Specification and design","Date","Phase","en",3107);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (815,"Specification and system design","Legende:
SP ... Spezifikationsphase (Anfang-Ende, Autor(en)), SPRev ... Spezifikationsreview (Anfang-Ende, Autor(en)), SPCorr ... Spezifikationskorrektur (Anfang-Ende, Autor(en)), SD ... Systemdesign (Anfang-Ende, Autor(en)), SDRev ... Systemdesignreview (Anfang-Ende, Autor(en)), SDCorr ... Systemdesignkorrektur (Anfang-Ende, Autor(en)).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt den/die Autor(en) von Dokumenten und die Mitglieder der Review-/Korrekturteams, die w‰hrend der Spezifikations- bzw. Systemdesignphase zum Einsatz kamen.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber auch zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"Specification and design","Date","Phase","de",3107);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8015,"äpecifik·cia a n·vrh systÈmu","
Legenda:
SP ... f·za öpecifik·cie (zaËiatok-koniec, author(i)), SPRev ... posudzovanie öpecifik·cie (zaËiatok-koniec, author(i)), SPCorr ... opravy öpecifik·cie (zaËiatok-koniec, author(i)), SD ... n·vrh systÈmu (zaËiatok-koniec, author(i)), SDRev ... posudzovanie n·vrhu systÈmu (zaËiatok-koniec, author(i)), SDCorr ... opravy n·vrhu systÈmu (zaËiatok-koniec, author(i)).

Rozhodnutia a prÌkazy manaûÈra projektu, ktorÈ neviedli ku ûiadnej aktivite s˙ oznaËenÈ Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje autorov dokumentov a Ëlenov posudzuj˙cich/opravuj˙cich tÈmov nasaden˝ch v öt·diu öpecifik·cie a n·vrhu systÈmu.

Vysvetlenie/Odpor˙Ëania:
»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.","Specification and design","Date","Phase","sk",3107);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3150,"root",NULL,3107,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2846,"Specification",
'select distinct "SPEC" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SPEZIFIKATION_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "SPEC" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SPEZIFIKATION_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2847,"Spec review",
'select distinct "SPEC REV" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "SPEC REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2848,"Spec corr",
'select distinct "SPEC COR" as description, least(
(select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1),
(SELECT REPLACE(min(s_relation.starting_date),"-","/") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid= %game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as date
union
select distinct "SPEC COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path,\"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2849,"Design",
'select distinct "DESIGN" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ENTWURF_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DESIGN" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ENTWURF_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2850,"Design review",
'select distinct "DES REV" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DES REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2851,"Design corr",
'select distinct "DES COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DES COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2852,"Review with client",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="REVIEW_MIT_KUNDE_FINDET_STATT"
AND (document = "Specification" OR document = "Spezifikation")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2853,"Specification",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2854,"Spec rev",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2855,"Spec corr",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2856,"Design",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2857,"Design rev",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2858,"Design corr",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3151,"Rev. spec. with Client",3150,3107,2852,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3152,"System design corrections",3150,3107,2851,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3153,"System design review",3150,3107,2850,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3154,"System design",3150,3107,2849,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3155,"Specification corrections",3150,3107,2848,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3156,"Specification review",3150,3107,2847,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3157,"Specification",3150,3107,2846,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42080,"Rev. spec. with Client","CusRv","en",3151);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42081,"System design corrections","SDCorr","en",3152);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42082,"System design review","SDRev","en",3153);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42083,"System design","SD","en",3154);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42084,"Specification corrections","SPCorr","en",3155);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42085,"Specification review","SPRev","en",3156);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42086,"Specification","SP","en",3157);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43007,"Rev. spec. with Client","CusRv","de",3151);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43008,"System design corrections","SDCorr","de",3152);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43009,"System design review","SDRev","de",3153);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43010,"System design","SD","de",3154);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43011,"Specification corrections","SPCorr","de",3155);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43012,"Specification review","SPRev","de",3156);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43013,"Specification","SP","de",3157);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143007,"Rev. spec. with Client","CusRv","sk",3151);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143008,"System design corrections","SDCorr","sk",3152);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143009,"System design review","SDRev","sk",3153);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143010,"System design","SD","sk",3154);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143011,"Specification corrections","SPCorr","sk",3155);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143012,"Specification review","SPRev","sk",3156);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143013,"Specification","SP","sk",3157);
/* */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3158,"Specification",3157,3107,2853,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3159,"Specification review",3156,3107,2854,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3160,"Specification corrections",3155,3107,2855,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3161,"System design",3154,3107,2856,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3162,"System design review",3153,3107,2857,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3163,"System design corrections",3152,3107,2858,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42087,"Specification","SP","en",3158);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42088,"Specification review","SPRev","en",3159);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42089,"Specification corrections","SPCorr","en",3160);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42090,"System design","SD","en",3161);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42091,"System design review","SDRev","en",3162);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42092,"System design corrections","SDCorr","en",3163);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43014,"Specification","SP","de",3158);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43015,"Specification review","SPRev","de",3159);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43016,"Specification corrections","SPCorr","de",3160);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43017,"System design","SD","de",3161);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43018,"System design review","SDRev","de",3162);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43019,"System design corrections","SDCorr","de",3163);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143014,"Specification","SP","sk",3158);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143015,"Specification review","SPRev","sk",3159);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143016,"Specification corrections","SPCorr","sk",3160);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143017,"System design","SD","sk",3161);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143018,"System design review","SDRev","sk",3162);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143019,"System design corrections","SDCorr","sk",3163);
/* */

/**********************************/
/*  Module design and Coding */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(408,"Module design and coding",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1216,"Module design and coding","en",408);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1217,"Module design and coding","de",408);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5217,"Module design and coding","sk",408);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3108,"Module design and coding",1,"G",NULL,408);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (816,"Module design and coding","
Legend:
MD ... module design (begin-end, author(s)), MDRev ... module design review (begin-end, author(s)), MDCorr ... module design correction (begin-end, author(s)).
CD ... coding (begin-end, author(s)),  CDRev ... code review (begin-end,author(s)), CDCorr ... code correction (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the author(s) of documents and the member(s) of the module design/coding team(s).

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts.","Specification and design","Date","Phase","en",3108);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (817,"Module design and coding","Legende:
MD ... Moduldesignsphase (Anfang-Ende, Autor(en)), MDRev ... Moduldesignreview (Anfang-Ende, Autor(en)), MDCorr ... Moduldesignkorrektur (Anfang-Ende, Autor(en)), CD ... Implementierung (Anfang-Ende, Autor(en)), CDRev ... Codereview (Anfang-Ende, Autor(en)), CDCorr ... Codekorrektur (Anfang-Ende, Autor(en)).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt den/die Autor(en) von Dokumenten und die Mitglieder der Moduldesign-/Implementierungsteams.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber auch zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"Specification and design","Date","Phase","de",3108);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8016,"Module design and coding","
Legenda:
MD ... n·vrh modulov (zaËiatok-koniec, autor(i)), MDRev ... posudzovanie n·vrhu modulov (zaËiatok-koniec, autor(i)), MDCorr ... opravy n·vrhu modulov (zaËiatok-koniec, autor(i)).
CD ... implement·cia (zaËiatok-koniec, autor(i)),  CDRev ... posudzovanie kÛdu (zaËiatok-koniec, autor(i)), CDCorr ... opravy kÛdu (zaËiatok-koniec, autor(i)).
Rozhodnutia a prÌkazy manaûÈra projektu, ktorÈ neviedli ku ûiadnej aktivite s˙ oznaËenÈ Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje autorov dokumentov a Ëlenov tÌmu vykon·vaj˙cich n·vrh alebo implement·ciu modulov.

Vysvetlenie/Odpor˙Ëania:
»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.",
"Specification and design","Date","Phase","sk",3108);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3164,"root",NULL,3108,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2859,"MSpecification",
'select distinct "MSPEC" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MODSPEZ_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MODSPEZ_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2860,"MSpec review",
'select distinct "MSPEC REV" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2861,"MSpec corr",
'select distinct "MSPEC COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2862,"Code",
'select distinct "CODE" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CODE_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "CODE" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CODE_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2863,"Code review",
'select distinct "CODE REV" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "CODE REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2864,"Code corr",
'select distinct "CODE COR" as description, least(
(select max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1),
(SELECT REPLACE(min(s_relation.starting_date),"-","/") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Code" OR document = "Code")) AND s_relation.gid= %game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1 )) as date
union
select distinct "CODE COR" as description, greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),
(select max(s_entity.value) as value from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
spaid_needs_zt.spaidid = specific_aid.spaidid AND
spaid_needs_zt.zid = zarmstype.zid AND
zarmstype.eorr = "E" AND
zarmstype.z_type = "REVIEWLOGBUCH" AND
zarmstype.zid = z_entity.zid AND
z_entity.description = "Reviewlog" AND
z_entity.zeid = comprises.zeid AND
comprises.zaid = z_attribute.zaid AND
z_attribute.name = "CREVIEW_K_ENDE" AND
comprises.compid = s_entity.compid AND
s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2865,"MSpecification",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2866,"MSpec rev",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2867,"MSpec corr",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2868,"Code",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Code")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2869,"Code rev",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Code")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2870,"Code corr",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Code")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3165,"Code corrections",3164,3108,2864,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3166,"Code review",3164,3108,2863,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3167,"Code",3164,3108,2862,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3168,"Module design corrections",3164,3108,2861,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3169,"Module design review",3164,3108,2860,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3170,"Module design",3164,3108,2859,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42093,"Code corrections","CDCorr","en",3165);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42094,"Code review","CDRev","en",3166);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42095,"Code","CD","en",3167);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42096,"Module design corrections","MDCorr","en",3168);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42097,"Module design review","MDRev","en",3169);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42098,"Module design","MD","en",3170);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43020,"Code corrections","CDCorr","de",3165);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43021,"Code review","CDRev","de",3166);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43022,"Code","CD","de",3167);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43023,"Module design corrections","MDCorr","de",3168);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43024,"Module design review","MDRev","de",3169);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43025,"Module design","MD","de",3170);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143020,"Code corrections","CDCorr","sk",3165);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143021,"Code review","CDRev","sk",3166);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143022,"Code","CD","sk",3167);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143023,"Module design corrections","MDCorr","sk",3168);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143024,"Module design review","MDRev","sk",3169);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143025,"Module design","MD","sk",3170);
/* */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3171,"Code corrections",3165,3108,2870,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3172,"Code review",3166,3108,2869,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3173,"Code",3167,3108,2868,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3174,"Module design corrections",3168,3108,2867,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3175,"Module design review",3169,3108,2866,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3176,"Module design",3170,3108,2865,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42099,"Code corrections","MD","en",3171);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42100,"Code review","MDRev","en",3172);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42101,"Code","MDCorr","en",3173);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42102,"Module design corrections","CD","en",3174);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42103,"Module design review","CDRev","en",3175);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42104,"Module design","CDCorr","en",3176);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43026,"Code corrections","MD","de",3171);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43027,"Code review","MDRev","de",3172);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43028,"Code","MDCorr","de",3173);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43029,"Module design corrections","CD","de",3174);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43030,"Module design review","CDRev","de",3175);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43031,"Module design","CDCorr","de",3176);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143026,"Code corrections","MD","sk",3171);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143027,"Code review","MDRev","sk",3172);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143028,"Code","MDCorr","sk",3173);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143029,"Module design corrections","CD","sk",3174);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143030,"Module design review","CDRev","sk",3175);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143031,"Module design","CDCorr","sk",3176);
/* */

/**********************************/
/*  MONITORING   */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(409,"Monitoring",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1218,"Monitoring","en",409);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1219,"Monitoring","de",409);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5219,"Monitoring","sk",409);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3004,"Monitoring",1,"G",NULL,409);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (765,"Monitoring","
Legend:
AI ... monitoring activity (date). Project manager decisions and commands that led to no result are marked by a small black triangle.

Description:
This chart visualizes all monitoring activities during the project.

Explanation/Recommendations:
Monitoring activities are vital for good project management. However, too many monitoring activities might also be interpreted as a loss in control over the project.","Inspection","Date","Type","en",3004);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (766,"Monitoring","Legende:
AI ... Kontrollaktivit‰t (Datum). Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Ergebnissen f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt alle Kontrollaktivit‰ten w‰hrend des Projekts.

Erkl‰rung/Empfehlungen:
Kontrolle ist eine wesentliche Aktivit‰t in einem guten Projektmanagement. Zu viele gesetzte Kontrollaktivit‰ten kˆnnen aber auch als Verlust der Kontrolle ¸ber den Projektverlauf interpretiert werden.",
"Inspection","Date","Type","de",3004);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (7065,"Monitoring","
Legenda:
AI ... monitorovanie (d·tum). Rozhodnutia projektovho manaûÈra a prÌkazy neved˙ce k v˝sledkom s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje vöetky monitorovacie aktivity poËas projektu.

Vysvetlenie/Odpor˙Ëania:
Monitorovacie aktivity s˙ ûivotne dÙleûitÈ pre dobr˝ manaûment projektu. Akokoævek, prÌliö veæa monitorovania mÙûe byù tieû vnÌmanÈ ako strata kontroly nad projektom.",
"Inspection","Date","Type","sk",3004);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3033,"root",NULL,3004,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2723,"Specification insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz specifikaciu" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2724,"Design insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz navrh systemu" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2725,"Module design insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz navrh modulov" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2726,"Code insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz kod" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2727,"Documentation insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz dokumentaciu" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2728,"Activity insp.",
'SELECT t.date, t.command FROM turn t where t.gid=%game and t.command like "ukaz aktivitu%" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3131,"Resource insp.",
'SELECT t.date, "show me spent resources" as command FROM turn t where t.gid=%game and t.command like "informuj o pouzitych zdrojoch" and LOCATE(t.path ,\"%path\")=1;',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3034,"Specification",3033,3004,2723,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3035,"Design",3033,3004,2724,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3036,"Module design",3033,3004,2725,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3037,"Code",3033,3004,2726,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3038,"Documentation",3033,3004,2727,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3039,"Activity",3033,3004,2728,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3495,"Resources",3033,3004,3131,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41100,"Specification","SP","en",3034);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41101,"Design","DS","en",3035);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41102,"Module design","MD","en",3036);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41103,"Code","CD","en",3037);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41104,"Documentation","DC","en",3038);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41105,"Activity","AI","en",3039);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42615,"Resources","RI","en",3495);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43032,"Specification","SP","de",3034);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43033,"Design","DS","de",3035);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43034,"Module design","MD","de",3036);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43035,"Code","CD","de",3037);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43036,"Documentation","DC","de",3038);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43037,"Activity","AI","de",3039);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43038,"Resources","RI","de",3495);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143032,"Specification","SP","sk",3034);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143033,"Design","DS","sk",3035);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143034,"Module design","MD","sk",3036);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143035,"Code","CD","sk",3037);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143036,"Documentation","DC","sk",3038);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143037,"Activity","AI","sk",3039);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143038,"Resources","RI","sk",3495);
/* */

/**********************************/
/*  Number of errors per AFP     */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(410,"Number of Errors per AFP",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1220,"Number of Errors per AFP","en",410);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1221,"Number of Errors per AFP","de",410);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5221,"PoËet ch˝b na AFP","sk",410);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3109,"Number of Errors per AFP",1,"V",NULL,410);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (818,"Number of Errors per AFP","
Legend:
S ... errors in the specification (per AFP), SD ... errors in the system design (per AFP), MD ... errors in the module design (per AFP), C ... errors in the code (per AFP), M ... errors in the manuals/documentation (per AFP).

Description:
This diagram summarizes the remaining errors relative to the AFPs in the document. (Values: *)

Explanation/Recommendations:
Not available.","Documents quality","Docs","Errors/AFP","en",3109);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (819,"Number of Errors per AFP","Legende:
S ... Fehler in der Spezifikation (pro AFP), SD ... Fehler im Systemdesign (pro AFP), MD ... Fehler im Moduldesign (pro AFP), C ... Fehler im Code (pro AFP), M ... Fehler in den Handb¸chern/Dokumentation (pro AFP).

Beschreibung:
Dieses Diagramm faﬂt die Restfehler im Dokument im Verh‰ltnis zu den AFPs zusammen. (Werte: *)

Erkl‰rung/Empfehlungen:
Nicht vorhanden.",
"Documents quality","Docs","Errors/AFP","de",3109);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8018,"PoËet ch˝b na AFP","
Legenda:
S ... chyby v öpecifik·cii (na AFP), SD ... chyby v n·vrhu systÈmu (na AFP), MD ... chyby v n·vrhu modulov (na AFP), C ... chyby v kÛde (na AFP), M ... chyby v manu·loch/dokument·cii (na AFP).

Popis:
Tento diagram sumarizuje ost·vaj˙ce chyby vo vzùahu k AFPs v dokuumente/dokumentoch. (Hodnoty: *)

Vysvetlenie/Odpor˙Ëania:
éiadne.","Documents quality","Docs","Errors/AFP","sk",3109);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2871,"Specification err.",
'select distinct "SPEC ERR" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SPEZIFIKATION" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Specification" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER_PRO_AFP" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2872,"Design err.",
'select distinct "DES ERR" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SYSTEMENTWURF" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Systemdesign" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER_PRO_AFP" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2873,"Module design err.",
'select distinct "MDES ERR" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "MODULSPEZIFIKATION" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Moduledesign" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER_PRO_AFP" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2874,"Code err.",
'select distinct "CODE ERR" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "CODE" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Code" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER_PRO_AFP" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2875,"Documentation err.",
'select distinct "MAN ERR" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "HANDBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Manuals" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER_PRO_AFP" AND
    comprises.compid = s_entity.compid AND
    game.gid=s_entity.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3177,"Specification",null,3109,2871,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3178,"Design",3177,3109,2872,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3179,"Module design",3178,3109,2873,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3180,"Code",3179,3109,2874,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3181,"Documentation",3180,3109,2875,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42105,"Specification","S","en",3177);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42106,"Design","SD","en",3178);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42107,"Module design","MD","en",3179);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42108,"Code","C","en",3180);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42109,"Documentation","M","en",3181);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42110,"Spezifikation","S","de",3177);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42111,"Design","SD","de",3178);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42112,"Moduldesign","MD","de",3179);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42113,"Code","C","de",3180);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42114,"Dokumentation","M","de",3181);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (142110,"Spezifikation","S","sk",3177);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (142111,"Design","SD","sk",3178);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (142112,"Moduldesign","MD","sk",3179);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (142113,"Code","C","sk",3180);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (142114,"Dokumentation","M","sk",3181);

/**********************************/
/*   Review efficiency    */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(411,"Review efficiency",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1222,"Review efficiency","en",411);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1223,"Review efficiency","de",411);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1223,"Efektivita posudzovania","sk",411);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3110,"Review efficiency",1,"V",NULL,411);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (820,"Review efficiency","Description:
This chart visualizes the effort (in hours) needed to write, review, and correct different types of documents. (Values: *)

Explanation/Recommendation:
Not available.","Review efficiency","Phase","Effort","en",3110);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (821,"Review efficiency","Beschreibung:
Diese Graphik zeigt den Aufwand (in Stunden) zum Schreiben, Reviewen und Korrigieren unterschiedlicher Dokumente. (Werte: *)

Erkl‰rung/Empfehlung:
Nicht vorhanden.","Review efficiency","Phase","Effort","de",3110);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8020,"Efektivita posudzovania","Popis:
Tento diagram predstavuje snahu (v hodin·ch) potrebnp na napÌsanie, pos˙denie a opravuj rÙznych druhov dokumentov. (Hodnoty: *)

Vysvetlenie/Odpor˙Ëania:
éiadne.","Efektivita posudzovania","Phase","Effort","sk",3110);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2876,"Specification",
'select distinct "spec aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2877,"Specification corr.",
'select distinct "speccor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SREVIEW_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2878,"Specification errors",
'select distinct "spec err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Specificationreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2879,"System design",
'select distinct "des aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2880,"System design corr.",
'select distinct "descor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "EREVIEW_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2881,"System design errors",
'
select distinct "des err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Systemdesignreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2882,"Module design",
'select distinct "mspec aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2883,"Module design corr.",
'select distinct "mspeccor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MREVIEW_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2884,"Module design errors",
'select distinct "mspec err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Moduledesignreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2885,"Code",
'select distinct "code aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CREVIEW_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2886,"Code corrections",
'select distinct "code aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CREVIEW_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2887,"Code errors",
'select distinct "code err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "CODE" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Code" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2888,"Manual",
'select distinct "man aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2889,"Manual corrections",
'select distinct "mancor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2890,"Manual errors",
'
select distinct "man err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Manualsreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3182,"Specification",null,3110,2876,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3183,"Specification corrections",3182,3110,2877,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3184,"Specification errors",3183,3110,2878,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3185,"Design",3184,3110,2879,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3186,"Design corrections",3185,3110,2880,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3187,"Design errors",3186,3110,2881,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3188,"Module specification",3187,3110,2882,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3189,"Mspec. corrections",3188,3110,2883,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3190,"Mspec. errors",3189,3110,2884,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3191,"Code",3190,3110,2885,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3192,"Code corrections",3191,3110,2886,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3193,"Code errors",3192,3110,2887,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3194,"Manual",3193,3110,2888,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3195,"Manual corrections",3194,3110,2889,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3196,"Manual errors",3195,3110,2890,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52110,"Spec","SP","en",3182);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52111,"Spec. corr.","SC","en",3183);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52112,"Spec. err.","SE","en",3184);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52113,"Design","SD","en",3185);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52114,"Des. corr.","DC","en",3186);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52115,"Des. err.","DE","en",3187);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52116,"MSpec","MD","en",3188);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52117,"MSpec. corr.","MC","en",3189);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52118,"MSpec. err.","ME","en",3190);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52119,"Code","CD","en",3191);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52120,"Code corr.","CC","en",3192);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52121,"Code err.","CE","en",3193);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52122,"Manual","MN","en",3194);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52123,"Man. corr.","MC","en",3195);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52124,"Man. err.","ME","en",3196);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52210,"Spez","SP","de",3182);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52211,"Spez. Korr.","SK","de",3183);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52212,"Spez. Feh.","SF","de",3184);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52213,"Design","D","de",3185);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52214,"Des. Korr.","DK","de",3186);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52215,"Des. Feh.","DF","de",3187);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52216,"MSpez","MD","de",3188);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52217,"MSpez. Korr.","MK","de",3189);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52218,"MSpez. Feh.","MF","de",3190);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52219,"Code","CD","de",3191);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52220,"Code Korr.","CK","de",3192);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52221,"Code Feh.","CF","de",3193);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52222,"Manual","MN","de",3194);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52223,"Man. Korr.","MK","de",3195);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52224,"Man. Feh.","MF","de",3196);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52210,"Spez","SP","sk",3182);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52211,"Spez. Korr.","SK","sk",3183);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52212,"Spez. Feh.","SF","sk",3184);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52213,"Design","D","sk",3185);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52214,"Des. Korr.","DK","sk",3186);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52215,"Des. Feh.","DF","sk",3187);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52216,"MSpez","MD","sk",3188);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52217,"MSpez. Korr.","MK","sk",3189);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52218,"MSpez. Feh.","MF","sk",3190);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52219,"Code","CD","sk",3191);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52220,"Code Korr.","CK","sk",3192);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52221,"Code Feh.","CF","sk",3193);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52222,"Manual","MN","sk",3194);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52223,"Man. Korr.","MK","sk",3195);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (52224,"Man. Feh.","MF","sk",3196);

/**********************************/
/*  Test efficiency    */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(412,"Test efficiency",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1224,"Test efficiency","en",412);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1225,"Test efficiency","de",412);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5225,"Efektivita testovania","sk",412);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3111,"Test efficiency",1,"V",NULL,412);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (822,"Test efficiency","Description:
This chart visualizes the effort (in hours) needed to test and correct the code. (Values: *)

Explanation/Recommendation:
Not available.",
"Test efficiency","Phase","Effort","en",3111);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (823,"Test efficiency","Beschreibung:
Diese Graphik zeigt den Aufwand (in Stunden) zum Testen und Korrigieren des Codes. (Werte: *)

Erkl‰rung/Empfehlung:
Nicht vorhanden.",
"Test efficiency","Phase","Effort","de",3111);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8022,"Efektivita testovania","Popis:
Tento diagram vizualizuje snahu (v hodin·ch) potrebn˙ na otestovanie a opravu kÛdu. (Hodnoty: *)

Vysvetlenie/Odpor˙Ëania:
éiadne.",
"Efektivita testovania","Phase","Effort","sk",3111);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2891,"Module test",
'
select distinct "mtests aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2892,"Module test corr.",
'select distinct "mtestcor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2893,"Module test errors",
'select distinct "mtest err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "MODULTESTBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Moduletestreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2894,"Integration test",
'select distinct "itest aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2895,"Integration test corr.",
'select distinct "itestcor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2896,"Integration test errors",
'select distinct "itest err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Integrationtestreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2897,"System test",
'select distinct "stests aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2898,"System test corr.",
'select distinct "mspeccor aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2899,"System test errors",
'select distinct "stest err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SYSTEMTESTBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Systemtestreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2900,"Acceptance test",
'select distinct "atest aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2901,"Acceptance test corr.",
'select distinct "atestcorr aufwand" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_K_AUFWAND" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2902,"Acceptance test errors",
'select distinct "atest err" as description, s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "ABNAHMETESTBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Acceptancetestreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "FEHLER" AND
    s_entity.gid = game.gid AND
    comprises.compid = s_entity.compid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',"****");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3197,"Module tests",null,3111,2891,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3198,"Mtests corr.",3197,3111,2892,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3199,"Mtests errors",3198,3111,2893,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3200,"Integration tests",3199,3111,2894,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3201,"Itests corr.",3200,3111,2895,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3202,"Itests errors",3201,3111,2896,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3203,"System tests",3202,3111,2897,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3204,"Stests corrections",3203,3111,2898,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3205,"Stests errors",3204,3111,2899,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3206,"Acceptance tests",3205,3111,2900,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3207,"Atests corrections",3206,3111,2901,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3208,"Atests errors",3207,3111,2902,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42125,"Module tests","MT","en",3197);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42126,"Mtests corr.","MC","en",3198);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42127,"Mtests err.","ME","en",3199);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42128,"Integration tests","IT","en",3200);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42129,"tests corr.","IC","en",3201);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42130,"Itests err.","IE","en",3202);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42131,"System tests","ST","en",3203);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42132,"Stests corr.","SC","en",3204);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42133,"Stests err.","SE","en",3205);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42134,"Acceptance tests","AT","en",3206);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42135,"Atests corr.","AC","en",3207);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42136,"Atests err.","AE","en",3208);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62125,"Modultests","MT","de",3197);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62126,"Mtest Korr.","MK","de",3198);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62127,"Mtest Feh.","MF","de",3199);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62128,"Integrationstest","IT","de",3200);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62129,"Itest Korr.","IK","de",3201);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62130,"Itest Feh.","IF","de",3202);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62131,"Systemtest","ST","de",3203);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62132,"Stest Korr.","SK","de",3204);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62133,"Stest Feh.","SF","de",3205);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62134,"Akzeptanztest","AT","de",3206);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62135,"Atest Korr.","AK","de",3207);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62136,"Atest Feh.","AF","de",3208);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62125,"Modultests","MT","sk",3197);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62126,"Mtest Korr.","MK","sk",3198);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62127,"Mtest Feh.","MF","sk",3199);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62128,"Integrationstest","IT","sk",3200);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62129,"Itest Korr.","IK","sk",3201);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62130,"Itest Feh.","IF","sk",3202);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62131,"Systemtest","ST","sk",3203);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62132,"Stest Korr.","SK","sk",3204);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62133,"Stest Feh.","SF","sk",3205);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62134,"Akzeptanztest","AT","sk",3206);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62135,"Atest Korr.","AK","sk",3207);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (62136,"Atest Feh.","AF","sk",3208);


/**********************************/
/*  Phases and milestones   */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(420,"Phases and Milestones",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1240,"Phases and Milestones",'en',420);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1241,"Phases and Milestones",'de',420);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5241,"F·zy a mÌæniky",'sk',420);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3119,"Phases and Milestones",1,"G",NULL,420);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (838,"Phases and Milestones","
Legend:
SP ... specification phase (begin-end), SD ... system design phase (begin-end), MD ... module design phase (begin-end), CD ... coding phase (begin-end), MN ... manual and documentation preparation (begin-end), IN ... integration phase (begin-end).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This Gantt chart visualizes the sequence of main phases in the project. Please note that test and review activities are not listed in this diagram.

Explanation/Recommendations:
The more the project is following the Waterfall model, the more likely succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that you need more effort to ensure consistency between the different artifacts.","","Date","Phase",'en',3119);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (839,"Phases and Milestones","Legende:
SP ... Spezifikationsphase (Anfang-Ende), SD ... Systemdesignphase (Anfang-Ende), MD ... Moduldesignphase (Anfang-Ende), CD ... Implementierungsphase (Anfang-Ende), MN ... Handbuch- und Dokumentationserstellung (Anfang-Ende), IN ... Integrationsphase (Anfang-Ende).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Dieses Gantt-Diagramm zeigt den Ablauf der Hauptphasen im Projekt. Man beachte, daﬂ in diesem Diagramm Test- und Reviewaktivit‰ten fehlen.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber auch zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"","Date","Phase",'de',3119);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8039,"F·zy a mÌæniky","
Legenda:
SP ... f·za öpecifik·cie (zaËiatok-koniec), SD ... f·za n·vrhu systÈmu (zaËiatok-koniec), MD ...f·za n·vrhu modulov (zaËiatok-koniec), CD ... f·za programovania (zaËiatok-koniec), MN ... prÌprava manu·lov a dokument·cie (zaËiatok-koniec), IN ... f·za integr·cie (zaËiatok-koniec).

Rozhodnutia projektovÈho manaûÈra a prÌkazy neved˙ce k aktivit·m s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento Gantt diagram vizualizuje sekvenciu hlavn˝ch f·z projektu. Vöimnite si, prosÌm, ûe testy a posudzovania nie s˙ zahrnutÈ v tomto diagrame.

Vysvetlenie/Odpor˙Ëania:
»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.",
"","Date","Phase",'sk',3119);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3411,"root",NULL,3119,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42528,"root",null,'en',3411);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43039,"root",null,'de',3411);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143039,"root",null,'sk',3411);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3062,"Specification",
'select distinct "SPECIFICATION" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SPEZIFIKATION_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "SPECIFICATION" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "SPEZIFIKATION_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3063,"Design",
'select distinct "DESIGN" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ENTWURF_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DESIGN" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ENTWURF_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3064,"MSpecification",
'select distinct "MSPECIFICATION" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MODSPEZ_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPECIFICATION" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MODSPEZ_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3065,"Code",
'select distinct "CODE" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CODE_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "CODE" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "CODE_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3066,"Manual",
'select distinct "MANUAL" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HANDBUCH_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MANUAL" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HANDBUCH_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3187,"Integration",
'select distinct "INTEGRATION" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "INTEGRATION_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "INTEGRATION" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "PROJEKTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Projectlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "INTEGRATION_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3413,"Integration",3411,3119,3187,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3414,"Manual",3411,3119,3066,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3415,"Code",3411,3119,3065,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3416,"Module design",3411,3119,3064,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3561,"Specification",3411,3119,3062,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3417,"System design",3411,3119,3063,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42530,"Integration","IN",'en',3413);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42531,"Manual","MN",'en',3414);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42532,"Code","CD",'en',3415);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42534,"Module design","MD",'en',3416);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42698,"Specification","SP",'en',3561);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42535,"System design","SD",'en',3417);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43040,"Integration","IN",'de',3413);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43041,"Manual","MN",'de',3414);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43042,"Code","CD",'de',3415);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43043,"Module design","MD",'de',3416);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43044,"Specification","SP",'de',3561);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43045,"System design","SD",'de',3417);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143040,"Integration","IN",'sk',3413);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143041,"Manual","MN",'sk',3414);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143042,"Code","CD",'sk',3415);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143043,"Module design","MD",'sk',3416);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143044,"Specification","SP",'sk',3561);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143045,"System design","SD",'sk',3417);




/**********************************/
/*  Employment time   */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(429,"Employee diagram",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1258,"Employee diagram",'en',429);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1259,"Employee diagram","de",429);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5259,"Diagram zamestnancov","sk",429);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3128,"Employee diagram",1,"G",NULL,429);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (856,"Employee diagram","
Legend:
Employed ... Time the employee is on the payroll of the project (begin-end), Busy ... Time the employee is working/contributing on/to the project (begin-end).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This Gantt chart shows when developers were hired and laid off and when the employees were occupied.

Explanation/Recommendations:
The deployment of employees (developers) is crucial for the success of the project. A good project manager ensures that every employee has tasks to fulfill and that there are not too many idle-times. Small gaps (idle-times) are normal, but too many of them increase the average costs of a person month.","","Date","Person",'en',3128);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (857,"Employee diagram","Legende:
Employed ... Zeitraum, in dem der Angestellte auf der Lohnliste des Projekts steht (Anfang-Ende), Busy ... Zeitraum, in dem der Angestellte f¸r das Projekt arbeitet (Anfang-Ende).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Dieses Gantt-Diagramm zeigt, wann Entwickler angestellt bzw. entlassen wurden und wann die Angestellten besch‰ftigt waren.

Erkl‰rung/Empfehlungen:
Der richtige Einsatz der Angestellten (Entwickler) ist ausschlaggebend f¸r den Projekterfolg. Ein guter Projektmanager stellt sicher, daﬂ jeder Angestellte Aufgaben zu erf¸llen hat und daﬂ es nicht zu viele Leerzeiten gibt. Kleine L¸cken (Leerzeiten) sind normal, aber zu viele f¸hren zu einem Ansteigen der durchschnittlichen Kosten eines Personenmonats.",
"","Date","Person","de",3128);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8057,"Diagram zamestnancov","
Legenda:
Employed/Zamestnan˝ ... »as, keÔ je zamestnanec na v˝platnej p·ske projektu (zaËiatok-koniec), Busy/Zanepr·zdnen˝ ... »as, keÔ zamestnanec pracuje  na projekte / prispieva k projektu (zaËiatok-koniec).
Rozhodnutia manaûÈra projektu a prÌkazy, ktorÈ neviedli k ûiadnej aktivite s˙ oznaËenÈ mal˝m Ëiern˝m trojuholnÌkom.

Popis:
Tento Gantt diagram ukazuje, kedy v˝voj·ri boli najmutÌ alebo doËasne prepusten˝ a keÔ boli zamestnan˝.

Vysvetlenie/Odpor˙Ëania:
Nasadenie zamestnancov je kæ˙ËovÈ k dosiahnutiu ˙spechu projektu. Dobr˝ projektov˝ manaûÈr sa uisùuje, ûe kaûd˝ zamestnanec m· ˙lohy, ktorÈ plnÌ a nie veæa Ëasu na fl·kanie. Menöie medzery s˙ v poriadku, ale ak ich je prÌliö mnoho, zvyöuj˙ sa priemernÈ n·klady (Ëlovekomesiac).",
"","Date","Person","sk",3128);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3170,"Employee diagram",
"SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND zarmstype.z_type like'IST_EINGESTELLT'
AND s_relation.gid=%game ORDER BY s_relation.starting_date ",null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3540,"root",NULL,3128,3170,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42675,"Employee diagram","ED","en",3540);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43046,"Employee diagram","ED","de",3540);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143046,"Diagram zamestnancov","ED","sk",3540);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3171,"Activity",
"SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND zarmstype.z_type!='IST_EINGESTELLT' AND s_relation.gid=%game ORDER BY s_relation.starting_date",null);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3541,"Activity",3540,3128,3171,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42676,"Activity","A","en",3541);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42677,"Activity","A","de",3541);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142677,"Aktivita","A","sk",3541);


/**********************************/
/*  TEST PHASES   */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(432,"Test Phases",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1263,"Test Phases",'en',432);
/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1275,"Test Phases",'de',432);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5275,"F·zy testovania",'sk',432);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3131,"Test Phases",1,"G",NULL,432);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (861,"Test Phases","
Legend:
MT... module test phase (begin-end), IT ... integration test phase (begin-end), ST ... system test phase (begin-end), AT ... acceptance test (begin-end).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This Gantt chart visualizes the sequence of testing activities in the project.

Explanation/Recommendations:
Overlapping tests might indicate that tests are based on erroneous artifacts or that at least effort is needed to keep them consistent. Missing tests are the main reason for poor quality of succeeding (and dependent) artifacts.","","Date","Phase",'en',3131);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (862,"Test Phases","Legende:
MT ... Modultestphase (Anfang-Ende), IT ... Integrationstestphase (Anfang-Ende), ST ... Systemtestphase (Anfang-Ende), AT ... Abnahmetest (Anfang-Ende). Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Gantt-Diagramm zeigt den Ablauf von Testaktivit‰ten im Projekt.

Erkl‰rung/Empfehlungen:
‹berlappende Tests kˆnnen darauf hinweisen, daﬂ die Tests auf fehlerhaften Zwischenprodukten basieren oder daﬂ zumindest ein Aufwand betrieben werden muss, um diese konsistent zu halten. Fehlende Tests sind der Hauptgrund f¸r schlechte Qualit‰t bei nachfolgenden (und abh‰ngigen) Zwischenprodukten.",
"","Date","Phase",'de',3131);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8061,"Test Phases","
Legenda:
MT... f·za testovania modulov (zaËiatok-koniec), IT ... f·za testovania integr·cie (zaËiatok-koniec), ST ... f·za testovania systÈmu (zaËiatok-koniec), AT ... akceptaËnÈ testovanie (zaËiatok-koniec).
Rozhodnutia projektovÈho manaûÈra a prÌkazy neved˙ce k aktivit·m s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento Gantt diagram vizualizuje sekvenciu aktivÌt testovania poËas projektu.

Vysvetlenie/Odpor˙Ëania:
Prekr˝vaj˙ce sa testy mÙûu indikovaù, ûe testy vych·dzaj˙ z chybn˝ch artefaktov alebo, ûe aspoÚ nejak· snaha je potrebn· na ich udrûanie v konzistentnom stave. Ch˝baj˙ce testy s˙ hlavn˝m dÙvodom nÌzkej kvality artefaktov, ktorÈ nasleduj˙ (a nadv‰zuj˙).",
"","Date","Phase",'sk',3131);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3581,"root",NULL,3131,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42718,"root",null,'en',3581);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43047,"root",null,'de',3581);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143047,"root",null,'sk',3581);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2710,"Module tests",
'select distinct "MTEST" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MTEST" as description, greatest(
(select max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path,\"%path\")=1),
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00")
FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE") AND s_relation.gid=%game
AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1 ORDER BY s_relation.starting_date));',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2711,"Module tests",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE" ) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2712,"Integration tests",
'select distinct "ITEST" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "ITEST" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2713,"Integration tests",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_INTEGRATION" ) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2714,"System tests",
'select distinct "STEST" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "STEST" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2715,"System tests",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_SYSTEM" ) AND s_relation.gid=%game
AND LOCATE(s_relation.path, \"%path\")=1 ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2716,"Acceptance tests",
'select distinct "ATEST" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "ATEST" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2717,"Acceptance tests",
'SELECT s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="NIMMT_AB" ) AND s_relation.gid=%game
AND LOCATE(s_relation.path, \"%path\")=1 ORDER BY s_relation.starting_date;',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3582,"Acceptance test",3581,3131,2716,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3583,"System test",3581,3131,2714,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3584,"Integration test",3581,3131,2712,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3585,"Module test",3581,3131,2710,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42719,"Acceptance test","AT",'en',3582);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42720,"System test","ST",'en',3583);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42721,"Integration test","IT",'en',3584);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42722,"Module test","MT",'en',3585);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43048,"Acceptance test","AT",'de',3582);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43049,"System test","ST",'de',3583);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43050,"Integration test","IT",'de',3584);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43051,"Module test","MT",'de',3585);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143048,"Acceptance test","AT",'sk',3582);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143049,"System test","ST",'sk',3583);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143050,"Integration test","IT",'sk',3584);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143051,"Module test","MT",'sk',3585);


/**********************************/
/*   Goal achievement    */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(413,"Goal achievement",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1226,"Goal achievement","en",413);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1227,"Goal achievement","de",413);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5227,"Dosiahnutie cieæov","sk",413);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3112,"Goal achievement",0,"T",NULL,413);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (824,"Goal achievement","
Legend:
Duration ... length of project (in days), Costs ... project costs (in EUR), C(%) ... AFPs contained in the code (in percent), #E/KLOC ... number of errors (per 1000 lines of code), Man(%) ... AFPs contained in the user's documentation (in percent), #E/Page ... number of errors (per page in the user's documentation).

Description:
This table summarizes the goal achievement (GA) of the simulation run. The line 'Results' summarizes the actual results, the line 'Goals' summarizes the values as demanded by the customer.

Explanation/Recommendations:
Goal achievement is a must for every project manager. However, in some situations minor deviations might be acceptable by the customer. You should take a look at Section 8 where the customer's feedback tells you whether s/he accepts the final product or not.","",null,null,"en",3112);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (825,"Goal achievement","
Legende:
Duration ... Projektdauer (in Tagen), Costs ... Projektkosten (in EUR), C(%) ... AFPs enthalten im Code (in Prozent), #E/KLOC ... Anzahl Fehler (pro 1000 Zeilen Code), Man(%) ... AFPs enthalten in der Benutzerdokumentation (in Prozent), #E/Page ... Anzahl Fehler (pro Seite in der Benutzerdokumentation).

Beschreibung:
Diese Tabelle faﬂt die Zielerreichung (GA) des Simulationslaufs zusammen. Die Zeile 'Results' faﬂt die
tats‰chlichen Ergebnisse, die Zeile 'Goals' die Werte, die vom Kunden gefordert waren,
zusammen.

Erkl‰rung/Empfehlungen:
Zielerreichung ist ein Muss f¸r jeden Projektmanager. Jedoch kˆnnen in einigen Situationen kleine Abweichungen durch den Kunden annehmbar sein. In Abschnitt 8 ist feststellbar, ob aufgrund des Kundenfeedback der Kunde das Endprodukt schlieﬂlich annimmt oder nicht.","",null,null,"de",3112);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8024,"Dosiahnutie cieæov","
Legenda:
Duration ... trvanie projektu (v dÚoch), Costs ... n·klady na projekt (v EUR), C(%) ... AFPs zahrnut˝ch v kÛde (v percent·ch), #E/KLOC ... poËet ch˝b (na 1000 riadkov kÛdu), Man(%) ... AFPs zahrnut˝ch v pouûÌvateæsk˝ch prÌruËkach (v percent·ch), #E/Page ... poËet ch˝b (na jednu stranu pouûÌvateæskej prÌruËky).

Popis:
T·to tabuæka sumarizuje dosiahnutie cieæov (GA) jednej simul·cie. Riadok 'Results' sumarizuje aktu·lne v˝sledky, riadok 'Goals' sumarizuje hodnoty, ktorÈ poûaduje z·kaznÌk.

Vysvetlenie/Odpor˙Ëania:
Dosiahnutie cieæov je nevyhnutnosùou pre kaûdÈho projektovÈho manaûÈra. Akokoævek, v niektor˝ch situ·ci·ch mÙûu byù menöie odch˝lky z·kaznÌkom akceptovanÈ. Mali by ste sa pozrieù na sekciu 8, kde V·m z·kaznÌkova sp‰tn· v‰zba povie, Ëi je v˝sledn˝ produkt akceptovan˝ alebo nie.",
"",null,null,"sk",3112);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3209,"root",NULL,3112,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42137,"root",null,"en",3209);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43052,"root",null,"de",3209);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143052,"root",null,"sk",3209);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3210,"",3209,3112,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42138,"","GA","en",3210);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43053,"","GA","de",3210);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143053,"","GA","sk",3210);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3211,"Duration",3210,3112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3212,"Costs",3210,3112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3213,"C(%)",3210,3112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3214,"#E/KLOC",3210,3112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3215,"Man(%)",3210,3112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3216,"#E/Page",3210,3112,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42319,"Duration","LE","en",3211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42320,"Costs","CO","en",3212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42321,"C(%)","AFPC","en",3213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42322,"#E/KLOC","FC","en",3214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42323,"Man(%)","AFPM","en",3215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42324,"#E/Page","FM","en",3216);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43054,"Duration","LE","de",3211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43055,"Costs","CO","de",3212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43056,"C(%)","AFPC","de",3213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43057,"#E/KLOC","FC","de",3214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43058,"Man(%)","AFPM","de",3215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43059,"#E/Page","FM","de",3216);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143054,"Duration","LE","sk",3211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143055,"Costs","CO","sk",3212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143056,"C(%)","AFPC","sk",3213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143057,"#E/KLOC","FC","sk",3214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143058,"Man(%)","AFPM","sk",3215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143059,"#E/Page","FM","sk",3216);

/* 21.08.07 turn? */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (2903," ",
'select distinct datediff(
(SELECT turn.date
FROM game, turn
WHERE game.gid = %game
AND game.act_turn = turn.tnid),
(select distinct model_instance.start_date
from model,model_instance,tournament,rnd,game,turn where
model_instance.mid = model.mid AND
model_instance.minstid = tournament.minstid AND
tournament.tid = rnd.tid AND rnd.rndid = game.rndid
AND game.gid = %game)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2904," ",
'select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**PROJEKTZUSTAND*Projectstatus*KOSTEN");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2905," ",
'select  max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODE*Code*PROZENT_AFP_100");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2906," ",
'select  s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_KLOC" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*FEHLER_PRO_KLOC");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2907," ",
'select  max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCH*Manuals*PROZENT_AFP_100");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2908," ",
'select  s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_SEITE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**HANDBUCH*Manuals*FEHLER_PRO_SEITE");

INSERT INTO query(qid,attribute,statement) VALUES (3176, '', 'select 270 as value');
INSERT INTO query(qid,attribute,statement) VALUES (3177, '', 'select 225000 as value');
INSERT INTO query(qid,attribute,statement) VALUES (3178, '', 'select 95.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (3179, '', 'select 12.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (3180, '', 'select 95.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (3181, '', 'select 0.5 as value');

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3217,"Results",3211,3112,2903,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3218,"Results",3212,3112,2904,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3219,"Results",3213,3112,2905,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3220,"Results",3214,3112,2906,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3221,"Results",3215,3112,2907,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3222,"Results",3216,3112,2908,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42325,"Results","","en",3217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42326,"Results","PO","en",3218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42327,"Results","PO","en",3219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42328,"Results","PO","en",3220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42329,"Results","PO","en",3221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42330,"Results","PO","en",3222);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43060,"Results","","de",3217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43061,"Results","PO","de",3218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43062,"Results","PO","de",3219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43063,"Results","PO","de",3220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43064,"Results","PO","de",3221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43065,"Results","PO","de",3222);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143060,"Results","","sk",3217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143061,"Results","PO","sk",3218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143062,"Results","PO","sk",3219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143063,"Results","PO","sk",3220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143064,"Results","PO","sk",3221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143065,"Results","PO","sk",3222);
/* */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3544,"Goals",3217,3112,3176,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3545,"Goals",3218,3112,3177,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3546,"Goals",3219,3112,3178,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3547,"Goals",3220,3112,3179,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3548,"Goals",3221,3112,3180,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3549,"Goals",3222,3112,3181,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42681,"Goals","OBJ","en",3544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42682,"Goals","OBJ","en",3545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42683,"Goals","OBJ","en",3546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42684,"Goals","OBJ","en",3547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42685,"Goals","OBJ","en",3548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42686,"Goals","OBJ","en",3549);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43066,"Goals","OBJ","de",3544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43067,"Goals","OBJ","de",3545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43068,"Goals","OBJ","de",3546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43069,"Goals","OBJ","de",3547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43070,"Goals","OBJ","de",3548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43071,"Goals","OBJ","de",3549);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143066,"Goals","OBJ","sk",3544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143067,"Goals","OBJ","sk",3545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143068,"Goals","OBJ","sk",3546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143069,"Goals","OBJ","sk",3547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143070,"Goals","OBJ","sk",3548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143071,"Goals","OBJ","sk",3549);
/* */


/**********************************/
/*   TOTAL COSTS         */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(414,"Total costs",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1228,"Total costs","en",414);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1229,"Total costs","de",414);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5229,"CelkovÈ n·klady","sk",414);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3113,"Total costs",0,"T",NULL,414);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (826,"Total costs","
Legend:
Total costs ... costs of the project (in EUR), Total effort ... working effort (in person months), Costs per PM ... average cost of one person month in the project (in EUR).

Description:
The average costs per person month are calculated by taking just the non-idle time into account (total effort). The total costs divided by the total effort then leads to the average value for the costs of one person month in the project.

Explanation/Recommendations:
For a small/medium sized project of this type values near to (or below) 10.000 EUR indicate a rather good use of working power. Values greater than 10.000 EUR indicate that there have been too much periods of idle-time. For a detailed analysis you should take a closer look at Section 4 (Deployment time).
","",null,null,"en",3113);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (827,"Total costs","Legende:
Total costs ... Projektkosten (in EUR), Total effort ... Arbeitsaufwand (in Personenmonaten), Costs per PM ... durchschnittliche Kosten eines Personenmonats im Projekt (in EUR).

Beschreibung:
Die durchschnittlichen Kosten pro Personenmonat werden errechnet, indem man nur die Produktivzeit in Betracht zieht (Gesamtaufwand). Die Gesamtkosten dividiert durch den Gesamtaufwand ergibt den durchschnittlichen Wert f¸r die Kosten eines Personenmonats im Projekt.

Erkl‰rung/Empfehlungen:
F¸r ein kleines/mittelgroﬂes Projekt dieser Art weisen Werte nahe (oder unter) 10.000 EUR auf einen ziemlich guten Einsatz der Arbeitskraft hin. Werte grˆsser als 10.000 EUR zeigen an, daﬂ es zu viel Leerzeiten gegeben hat. F¸r eine ausf¸hrliche Analyse betrachte man Abschnitt 4 (Personaleinsatzzeit) genauer.",
"",null,null,"de",3113);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8026,"CelkovÈ n·klady","
Legenda:
Total costs ... n·klady na projekt (v EUR), Total effort ... pracovnÈ ˙silie (v Ëlovekomesiacoch), Costs per PM ... priemern˝ n·klad na 1 Ëlovekomesiac pre projekt (v EUR).

Popis:
PriemernÈ n·klady na Ëlovekomesiac s˙ vypoËÌtanÈ len na z·klade Ëasu, kedy s˙ zamestnanci ËinnÌ (celkovÈ ˙silie). CelkovÈ n·klady podelenÈ celkov˝m ˙silÌm potom vedie k priemernej hodnote n·kladov na jeden Ëlovekomesiac pre projekt.

Vysvetlenie/Odpor˙Ëania:
V prÌpade mal˝ch/stredn˝ch projektov tohoto typu s˙ hodnoty blÌzke (alebo niûöie neû) 10.000 EUR znakom celkom dobrej pracovnej sily. Hodnoty vyööie neû 10.000 EUR indikuj˙, ûe bolo prÌtomn˝ch prÌliö veæa obdobÌ bez pr·ce. Pre detailnejöiu anal˝zu by ste sa mali pozrieù na sekciu 4 (»as nasadenia).
","",null,null,"sk",3113);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3223,"root",NULL,3113,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42331,"root",null,"en",3223);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43072,"root",null,"de",3223);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143072,"root",null,"sk",3223);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3224,"Costs",3223,3113,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42332,"Costs","TC","en",3224);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43073,"Costs","TC","de",3224);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143073,"Costs","TC","sk",3224);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3225,"Total costs",3224,3113,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3226,"Total effort",3224,3113,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3227,"Costs per PM",3224,3113,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42333,"Total costs","TC","en",3225);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42334,"Total effort","TE","en",3226);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42335,"Costs per PM","CPMM","en",3227);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43074,"Total costs","TC","de",3225);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43075,"Total effort","TE","de",3226);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43076,"Costs per PM","CPMM","de",3227);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143074,"Total costs","TC","sk",3225);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143075,"Total effort","TE","sk",3226);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143076,"Costs per PM","CPMM","sk",3227);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2909," ",
'select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**PROJEKTZUSTAND*Projectstatus*KOSTEN");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2910," ",
'select distinct
(select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1)/
(select distinct cast(s_entity.value as signed)
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN_PRO_MM" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1) as value
 from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2911," ",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN_PRO_MM" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1',"**PROJEKTZUSTAND*Projectstatus*KOSTEN_PRO_MM");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3228," ",3225,3113,2909,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3229," ",3226,3113,2910,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3230," ",3227,3113,2911,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42336," ","TC","en",3228);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42337," ","TC","en",3229);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42338," ","TC","en",3230);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43077," ","TC","de",3228);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43078," ","TC","de",3229);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43079," ","TC","de",3230);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143077," ","TC","sk",3228);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143078," ","TC","sk",3229);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143079," ","TC","sk",3230);



/**********************************/
/*  Errors found during reviews      */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(415,"Errors found during reviews",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1230,"Errors found during reviews","en",415);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1231,"Errors found during reviews","de",415);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5231,"Errors found during reviews","sk",415);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3114,"Errors found during reviews",0,"T",NULL,415);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (828,"Errors found during reviews","Legend:
Phase ... Different phases in the project, Rev. 1 ... Number of errors found during the first review, Rev. 2 ... Number of errors found during the second review, Rev. 3 ... Number of errors found in the third review, Total ... Total number of errors found in different reviews.

Description:
This table summarizes the efficiency (in terms of numbers of errors found) of several review sessions and in respect to the different documents.

Explanation/Recommendations:
Depending on the qualification of the review team and the number of reviews conducted more errors can be detected (and later on corrected). Typically, during a second review process less errors are found.","",null,null,"en",3114);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (829,"Errors found during reviews","Legende:
Phase ... Unterschiedliche Phasen im Projekt, Rev. 1 ... gefundene Fehler w‰hrend des ersten Reviews, Rev. 2 ... gefundene Fehler w‰hrend des zweiten Reviews, Rev. 3 ... gefundene Fehler w‰hrend des dritten Reviews, Total ... Gesamtanzahl gefundender Fehler in den verschiedenen Reviews.

Beschreibung:
Diese Tabelle faﬂt die Effizienz (ausgedr¸ckt in der Anzahl gefundener Fehler) mehrerer Reviewsitzungen und hinsichtlich der unterschiedlichen Dokumente zusammen.

Erkl‰rung/Empfehlungen:
Abh‰ngig von der Qualifikation des Reviewteams und der Anzahl angesetzter Reviews kˆnnen mehr Fehler gefunden (und sp‰ter korrigiert) werden. Typischerweise werden w‰hrend eines zweiten Reviews weniger Fehler gefunden.",
"",null,null,"de",3114);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8028,"Errors found during reviews","Legend:
Phase ... rÙzne f·zy projektu, Rev. 1 ... poËet ch˝b n·jden˝ch poËas prvÈho posudzovania, Rev. 2 ... poËet ch˝b n·jden˝ch poËas druhÈho posudzovania, Rev. 3 ... poËet ch˝b n·jden˝ch poËas tretieho posudzovania, Total ... Celkov˝ poËet ch˝b n·jden˝ch poËas rÙznych posudkoch.

Popis:
T·to tabuæka sumarizuje efektivitu (v zmysle poËtu n·jden˝ch ch˝b) niekoæk˝ch posudk·rskych sedenÌ s ohæadom na rÙzne dokumenty.

Vysvetlenie/Odpor˙Ëania:
V z·vislosti od kvalifik·cie posudzuj˙ceho tÌmu a poËtu vykonan˝ch posudkov v‰ËöÌ poËet ch˝b je odhalen˝ (a neskÙr opraven˝ch). Typicky, poËas druhÈho posudzovania je objaven˝ch menej ch˝b.",
"",null,null,"sk",3114);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3231,"root",NULL,3114,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42339,"root",null,"en",3231);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43080,"root",null,"de",3231);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143080,"root",null,"sk",3231);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3232,"Errors found",3231,3114,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42340,"Errors found","Phase","en",3232);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43081,"Errors found","Phase","de",3232);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143081,"Errors found","Phase","sk",3232);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3233,"Rev. 1",3232,3114,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3234,"Rev. 2",3232,3114,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3235,"Rev. 3",3232,3114,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3237,"Total",3232,3114,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42341,"Rev. 1","E1","en",3233);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42342,"Rev. 2","E2","en",3234);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42343,"Rev. 3","E3","en",3235);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42345,"Total","TE","en",3237);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43082,"Rev. 1","E1","de",3233);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43083,"Rev. 2","E2","de",3234);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43084,"Rev. 3","E3","de",3235);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43085,"Total","TE","de",3237);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143082,"Rev. 1","E1","sk",3233);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143083,"Rev. 2","E2","sk",3234);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143084,"Rev. 3","E3","sk",3235);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143085,"Total","TE","sk",3237);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2912," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2913," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2914," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2916," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*FEHLER");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2917," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2918," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2919," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2921," ",
'select sum(value) as value from
(select z_attribute.name, max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND  game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2922," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2923," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2924," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2926," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2927," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2928," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2929," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2931," ",
'select sum(value) as value from
(select z_attribute.name, max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND  game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2932," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2933," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2934," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2936," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2937," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2938," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2939," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2941," ",
'select sum(value) as value from
(select z_attribute.name, max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND  game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2942," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2943," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2944," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2946," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2947," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2948," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2949," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2951," ",
'select sum(value) as value from
(select z_attribute.name, max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND  game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2952," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2953," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2954," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2956," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2957," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2958," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2959," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2961," ",
'select sum(value) as value from
(select z_attribute.name, max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND  game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);



INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3238,"Spec. rev.",3233,3114,2912,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3239,"Spec. rev.",3234,3114,2913,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3240,"Spec. rev.",3235,3114,2914,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3242,"Spec. rev.",3237,3114,2916,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42346,"Spec. rev.","TC","en",3238);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42347,"Spec. rev.","TC","en",3239);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42348,"Spec. rev.","TC","en",3240);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42350,"Spec. rev.","TC","en",3242);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43086,"Spec. rev.","TC","de",3238);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43087,"Spec. rev.","TC","de",3239);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43088,"Spec. rev.","TC","de",3240);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43089,"Spec. rev.","TC","de",3242);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143086,"Spec. rev.","TC","sk",3238);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143087,"Spec. rev.","TC","sk",3239);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143088,"Spec. rev.","TC","sk",3240);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143089,"Spec. rev.","TC","sk",3242);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3243,"Spec. cor.",3238,3114,2917,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3244,"Spec. cor.",3239,3114,2918,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3245,"Spec. cor.",3240,3114,2919,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3247,"Spec. cor.",3242,3114,2921,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42351,"Spec. cor.","TC","en",3243);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42352,"Spec. cor.","TC","en",3244);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42353,"Spec. cor.","TC","en",3245);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42355,"Spec. cor.","TC","en",3247);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43090,"Spec. cor.","TC","de",3243);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43091,"Spec. cor.","TC","de",3244);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43092,"Spec. cor.","TC","de",3245);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43093,"Spec. cor.","TC","de",3247);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143090,"Spec. cor.","TC","sk",3243);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143091,"Spec. cor.","TC","sk",3244);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143092,"Spec. cor.","TC","sk",3245);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143093,"Spec. cor.","TC","sk",3247);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3248,"SD rev.",3243,3114,2922,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3249,"SD rev.",3244,3114,2923,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3250,"SD rev.",3245,3114,2924,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3252,"SD rev.",3247,3114,2926,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42356,"SD rev.","TC","en",3248);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42357,"SD rev.","TC","en",3249);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42358,"SD rev.","TC","en",3250);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42360,"SD rev.","TC","en",3252);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43094,"SD rev.","TC","de",3248);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43095,"SD rev.","TC","de",3249);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43096,"SD rev.","TC","de",3250);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43097,"SD rev.","TC","de",3252);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143094,"SD rev.","TC","sk",3248);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143095,"SD rev.","TC","sk",3249);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143096,"SD rev.","TC","sk",3250);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143097,"SD rev.","TC","sk",3252);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3253,"SD corr.",3248,3114,2927,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3254,"SD corr.",3249,3114,2928,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3255,"SD corr.",3250,3114,2929,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3257,"SD corr.",3252,3114,2931,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42361,"SD corr.","TC","en",3253);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42362,"SD corr.","TC","en",3254);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42363,"SD corr.","TC","en",3255);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42365,"SD corr.","TC","en",3257);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43098,"SD corr.","TC","de",3253);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43099,"SD corr.","TC","de",3254);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43100,"SD corr.","TC","de",3255);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43101,"SD corr.","TC","de",3257);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143098,"SD corr.","TC","sk",3253);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143099,"SD corr.","TC","sk",3254);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143100,"SD corr.","TC","sk",3255);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143101,"SD corr.","TC","sk",3257);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3258,"MD rev.",3253,3114,2932,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3259,"MD rev.",3254,3114,2933,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3260,"MD rev.",3255,3114,2934,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3262,"MD rev.",3257,3114,2936,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42366,"MD rev.","TC","en",3258);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42367,"MD rev.","TC","en",3259);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42368,"MD rev.","TC","en",3260);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42370,"MD rev.","TC","en",3262);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43102,"MD rev.","TC","de",3258);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43103,"MD rev.","TC","de",3259);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43104,"MD rev.","TC","de",3260);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43105,"MD rev.","TC","de",3262);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143102,"MD rev.","TC","sk",3258);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143103,"MD rev.","TC","sk",3259);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143104,"MD rev.","TC","sk",3260);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143105,"MD rev.","TC","sk",3262);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3263,"MD corr.",3258,3114,2937,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3264,"MD corr.",3259,3114,2938,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3265,"MD corr.",3260,3114,2939,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3267,"MD corr.",3262,3114,2941,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42371,"MD corr.","TC","en",3263);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42372,"MD corr.","TC","en",3264);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42373,"MD corr.","TC","en",3265);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42375,"MD corr.","TC","en",3267);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43106,"MD corr.","TC","de",3263);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43107,"MD corr.","TC","de",3264);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43108,"MD corr.","TC","de",3265);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43109,"MD corr.","TC","de",3267);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143106,"MD corr.","TC","sk",3263);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143107,"MD corr.","TC","sk",3264);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143108,"MD corr.","TC","sk",3265);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143109,"MD corr.","TC","sk",3267);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3268,"Code rev.",3263,3114,2942,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3269,"Code rev.",3264,3114,2943,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3270,"Code rev.",3265,3114,2944,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3272,"Code rev.",3267,3114,2946,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42376,"Code rev.","TC","en",3268);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42377,"Code rev.","TC","en",3269);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42378,"Code rev.","TC","en",3270);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42380,"Code rev.","TC","en",3272);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43110,"Code rev.","TC","de",3268);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43111,"Code rev.","TC","de",3269);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43112,"Code rev.","TC","de",3270);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43113,"Code rev.","TC","de",3272);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143110,"Code rev.","TC","sk",3268);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143111,"Code rev.","TC","sk",3269);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143112,"Code rev.","TC","sk",3270);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143113,"Code rev.","TC","sk",3272);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3273,"Code corr.",3268,3114,2947,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3274,"Code corr.",3269,3114,2948,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3275,"Code corr.",3270,3114,2949,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3277,"Code corr.",3272,3114,2951,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42381,"Code corr.","TC","en",3273);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42382,"Code corr.","TC","en",3274);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42383,"Code corr.","TC","en",3275);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42385,"Code corr.","TC","en",3277);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43114,"Code corr.","TC","de",3273);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43115,"Code corr.","TC","de",3274);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43116,"Code corr.","TC","de",3275);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43117,"Code corr.","TC","de",3277);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143114,"Code corr.","TC","sk",3273);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143115,"Code corr.","TC","sk",3274);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143116,"Code corr.","TC","sk",3275);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143117,"Code corr.","TC","sk",3277);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3278,"MN rev.",3273,3114,2952,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3279,"MN rev.",3274,3114,2953,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3280,"MN rev.",3275,3114,2954,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3282,"MN rev.",3277,3114,2956,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42386,"MN rev.","TC","en",3278);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42387,"MN rev.","TC","en",3279);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42388,"MN rev.","TC","en",3280);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42390,"MN rev.","TC","en",3282);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43118,"MN rev.","TC","de",3278);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43119,"MN rev.","TC","de",3279);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43120,"MN rev.","TC","de",3280);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43121,"MN rev.","TC","de",3282);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143118,"MN rev.","TC","sk",3278);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143119,"MN rev.","TC","sk",3279);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143120,"MN rev.","TC","sk",3280);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143121,"MN rev.","TC","sk",3282);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3283,"MN corr.",3278,3114,2957,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3284,"MN corr.",3279,3114,2958,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3285,"MN corr.",3280,3114,2959,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3287,"MN corr.",3282,3114,2961,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42391,"MN corr.","TC","en",3283);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42392,"MN corr.","TC","en",3284);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42393,"MN corr.","TC","en",3285);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42395,"MN corr.","TC","en",3287);

/* maier, fixed by daÚo: en->de */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43122,"MN corr.","TC","de",3283);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43123,"MN corr.","TC","de",3284);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43124,"MN corr.","TC","de",3285);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43125,"MN corr.","TC","de",3287);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143122,"MN corr.","TC","sk",3283);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143123,"MN corr.","TC","sk",3284);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143124,"MN corr.","TC","sk",3285);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143125,"MN corr.","TC","sk",3287);



/**********************************/
/*   Errors found during tests           */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(416,"Errors found during tests",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1232,"Errors found during tests","en",416);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1233,"Errors found during tests","de",416);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5233,"Chyby n·jdenÈ poËas testovania","sk",416);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3115,"Errors found during tests",0,"T",NULL,416);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (830,"Errors found during tests","Legend:
Phase ... Different phases in the project (MT - Module Test, IT - Integration Test, ST - System Test, AT - Acceptance Test ), Test 1 ... Number of errors found during the first test run, Test 2 ... Number of errors found during the second test run, Test 3 ... Number of errors found in the third test run, Total ... Total number of errors found in different test runs.

Description:
This table summarizes the efficiency (in terms of numbers of errors found) of the tests in respect to the different documents.

Explanation/Recommendations:
Depending on the qualification of the test team and the number of tests conducted more errors can be detected (and later on corrected).","",null,null,"en",3115);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (831,"Errors found during tests","Legende:
Phase ... Unterschiedliche Phasen im Projekt (MT - Modultest, IT - Integrationstest, ST - Systemtest, AT - Abnahmetest ), Test 1 ... gefundene Fehler w‰hrend des ersten Testlaufs, Test 2 ... gefundene Fehler w‰hrend des zweiten Testlaufs, Test 3 ... gefundene Fehler w‰hrend des dritten Testlaufs, Total ... Gesamtanzahl gefundender Fehler in den verschiedenen Testl‰ufen.

Description:
Diese Tabelle faﬂt die Effizienz (ausgedr¸ckt in der Anzahl gefundener Fehler) von Tests hinsichtlich der unterschiedlichen Dokumente zusammen.

Erkl‰rung/Empfehlungen:
Abh‰ngig von der Qualifikation des Testteams und der Anzahl angesetzter Tests kˆnnen mehr Fehler gefunden (und sp‰ter korrigiert) werden.",
"",null,null,"de",3115);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8030,"Chyby n·jdenÈ poËas testovania","Legenda:
Phase ... rÙzne f·zy projektu (MT - test modulov, IT - integraËn˝ test, ST - test systÈmu, AT - akceptaËn˝ test ), Test 1 ... PoËet ch˝b n·jden˝ch pomocou prvÈho spustenia testov, Test 2 ... PoËet ch˝b n·jden˝ch pomocou druhÈho spustenia testov, Test 3 ... PoËet ch˝b n·jden˝ch pomocou tretieho spustenia testov, Total ... Celkov˝ poËet ch˝b n·jden˝ch rÙznymi spusteniami testov.

Popis:
T·to tabuæka sumarizuje efektivitu (v zmysle poËtu n·jden˝ch ch˝b) testov s ohæadom na rÙzne dokumenty.

Vysvetlenie/Odpor˙Ëania:
V z·vislosti na kvalifik·cii testuj˙ceho tÌmu a poËte vykonan˝ch testov viac ch˝b mÙûe byù odhalen˝ch (a neskÙr opraven˝ch).",
"",null,null,"sk",3115);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3288,"root",NULL,3115,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42396,"root",null,"en",3288);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43126,"root",null,"de",3288);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143126,"root",null,"sk",3288);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3289,"Errors found",3288,3115,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42397,"Errors found","Phase","en",3289);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43127,"Errors found","Phase","de",3289);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143127,"Errors found","Phase","sk",3289);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3290,"Test 1",3289,3115,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3291,"Test 2",3289,3115,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3292,"Test 3",3289,3115,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3294,"Total",3289,3115,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42398,"Test 1","E1","en",3290);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42399,"Test 2","E2","en",3291);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42400,"Test 3","E3","en",3292);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42402,"Total","TE","en",3294);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43128,"Test 1","E1","de",3290);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43129,"Test 2","E2","de",3291);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43130,"Test 3","E3","de",3292);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43131,"Total","TE","de",3294);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143128,"Test 1","E1","sk",3290);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143129,"Test 2","E2","sk",3291);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143130,"Test 3","E3","sk",3292);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143131,"Total","TE","sk",3294);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2962," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2963," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2964," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_3_PRF");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2966," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*FEHLER");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2967," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2968," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2969," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_3_PRF");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2971," ",
'select sum(value) as value from
(select max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2972," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2973," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2974," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_3_PRF");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2976," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2977," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2978," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2979," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_3_PRF");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2981," ",
'select sum(value) as value from
(select max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2982," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2983," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2984," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2986," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2987," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_1_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2988," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2989," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_3_PRF");



INSERT INTO query(qid,attribute,statement,z_path) VALUES (2991," ",
'select sum(value) as value from
(select max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2992," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2993," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2994," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2996," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*FEHLER");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2997," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_1_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_1_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2998," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_2_PRF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2999," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_3_PRF");


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3001," ",
'select sum(value) as value from
(select max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name like "ANZ_KORR_FEHLER_%" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 group by z_attribute.name) t;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3295,"MT",3290,3115,2962,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3296,"MT",3291,3115,2963,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3297,"MT",3292,3115,2964,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3299,"Mtests",3294,3115,2966,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42403,"MT","TC","en",3299);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42404,"MT","TC","en",3295);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42405,"MT","TC","en",3296);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42406,"MT","TC","en",3297);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3300,"MT corr.",3295,3115,2967,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3301,"MT corr.",3296,3115,2968,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3302,"MT corr.",3297,3115,2969,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3304,"MT corr.",3299,3115,2971,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42408,"MT corr.","TC","en",3304);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42409,"MT corr.","TC","en",3300);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42410,"MT corr.","TC","en",3301);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42411,"MT corr.","TC","en",3302);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3305,"IT",3300,3115,2972,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3306,"IT",3301,3115,2973,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3307,"IT",3302,3115,2974,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3309,"IT",3304,3115,2976,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42413,"IT","TC","en",3309);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42414,"IT","TC","en",3305);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42415,"IT","TC","en",3306);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42416,"IT","TC","en",3307);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3310,"IT corr.",3305,3115,2977,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3311,"IT corr.",3306,3115,2978,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3312,"IT corr.",3307,3115,2979,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3314,"IT corr.",3309,3115,2981,NULL);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42418,"IT corr.","TC","en",3314);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42419,"IT corr.","TC","en",3310);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42420,"IT corr.","TC","en",3311);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42421,"IT corr.","TC","en",3312);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3315,"ST",3310,3115,2982,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3316,"ST",3311,3115,2983,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3317,"ST",3312,3115,2984,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3319,"ST",3314,3115,2986,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42432,"ST","TC","en",3319);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42433,"ST","TC","en",3315);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42434,"ST","TC","en",3316);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42435,"ST","TC","en",3317);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3320,"ST corr.",3315,3115,2987,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3321,"ST corr.",3316,3115,2988,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3322,"ST corr.",3317,3115,2989,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3324,"ST corr.",3319,3115,2991,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42437,"ST corr.","TC","en",3324);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42438,"ST corr.","TC","en",3320);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42439,"ST corr.","TC","en",3321);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42440,"ST corr.","TC","en",3322);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3325,"AT",3320,3115,2992,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3326,"AT",3321,3115,2993,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3327,"AT",3322,3115,2994,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3329,"AT",3324,3115,2996,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42442,"AT","TC","en",3329);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42443,"AT","TC","en",3325);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42444,"AT","TC","en",3326);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42445,"AT","TC","en",3327);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3330,"AT corr.",3325,3115,2997,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3331,"AT corr.",3326,3115,2998,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3332,"AT corr.",3327,3115,2999,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3334,"AT corr.",3329,3115,3001,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42447,"AT corr.","TC","en",3334);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42448,"AT corr.","TC","en",3330);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42449,"AT corr.","TC","en",3331);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42450,"AT corr.","TC","en",3332);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43132,"MT","TC","de",3299);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43133,"MT","TC","de",3295);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43134,"MT","TC","de",3296);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43135,"MT","TC","de",3297);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43136,"MT corr.","TC","de",3304);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43137,"MT corr.","TC","de",3300);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43138,"MT corr.","TC","de",3301);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43139,"MT corr.","TC","de",3302);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43140,"IT","TC","de",3309);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43141,"IT","TC","de",3305);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43142,"IT","TC","de",3306);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43143,"IT","TC","de",3307);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43144,"IT corr.","TC","de",3314);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43145,"IT corr.","TC","de",3310);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43146,"IT corr.","TC","de",3311);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43147,"IT corr.","TC","de",3312);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43148,"ST","TC","de",3319);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43149,"ST","TC","de",3315);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43150,"ST","TC","de",3316);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43151,"ST","TC","de",3317);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43152,"ST corr.","TC","de",3324);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43153,"ST corr.","TC","de",3320);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43154,"ST corr.","TC","de",3321);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43155,"ST corr.","TC","de",3322);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43156,"AT","TC","de",3329);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43157,"AT","TC","de",3325);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43158,"AT","TC","de",3326);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43159,"AT","TC","de",3327);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43160,"AT corr.","TC","de",3334);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43161,"AT corr.","TC","de",3330);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43162,"AT corr.","TC","de",3331);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43163,"AT corr.","TC","de",3332);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143132,"MT","TC","sk",3299);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143133,"MT","TC","sk",3295);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143134,"MT","TC","sk",3296);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143135,"MT","TC","sk",3297);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143136,"MT corr.","TC","sk",3304);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143137,"MT corr.","TC","sk",3300);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143138,"MT corr.","TC","sk",3301);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143139,"MT corr.","TC","sk",3302);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143140,"IT","TC","sk",3309);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143141,"IT","TC","sk",3305);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143142,"IT","TC","sk",3306);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143143,"IT","TC","sk",3307);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143144,"IT corr.","TC","sk",3314);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143145,"IT corr.","TC","sk",3310);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143146,"IT corr.","TC","sk",3311);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143147,"IT corr.","TC","sk",3312);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143148,"ST","TC","sk",3319);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143149,"ST","TC","sk",3315);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143150,"ST","TC","sk",3316);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143151,"ST","TC","sk",3317);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143152,"ST corr.","TC","sk",3324);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143153,"ST corr.","TC","sk",3320);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143154,"ST corr.","TC","sk",3321);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143155,"ST corr.","TC","sk",3322);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143156,"AT","TC","sk",3329);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143157,"AT","TC","sk",3325);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143158,"AT","TC","sk",3326);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143159,"AT","TC","sk",3327);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143160,"AT corr.","TC","sk",3334);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143161,"AT corr.","TC","sk",3330);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143162,"AT corr.","TC","sk",3331);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143163,"AT corr.","TC","sk",3332);

/**********************************/
/*   Efficiency of Reviews           */
/**********************************/
INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(417,"Efficiency of Reviews",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1234,"Efficiency of Reviews","en",417);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1235,"Efficiency of Reviews","de",417);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5235,"Efektivita posudzovania","sk",417);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3116,"Efficiency of Reviews",0,"T",NULL,417);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (832,"Efficiency of Reviews","Legend:
Phase ... Different phases in the project, Rev.effort ... hours needed for review activities, Corr.error ... hours needed for correction activities, #Err ... Number of errors found and corrected in that phase.

Description:
This table summarizes the efficiency (in terms of numbers of errors found) of the correction process.

Explanation/Recommendations:
Not available.","",null,null,"en",3116);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (833,"Efficiency of Reviews","Legende:
Phase ... Unterschiedliche Phasen im Projekt, Rev.effort ... benˆtigte Stunden f¸r Reviews, Corr.error ... benˆtigte Stunden f¸r Korrekturen, #Err ... Anzahl gefundener und korrigierter Fehler in dieser Phase.

Beschreibung:
Diese Tabelle faﬂt die Effizienz (ausgedr¸ckt in der Anzahl gefundener Fehler) des Korrekturprozesses zusammen.

Erkl‰rung/Empfehlungen:
Nicht vorhanden.",
"",null,null,"de",3116);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8032,"Efektivita posudzovania","Legenda:
Phase ... RÙzne f·zy projektu, Rev.effort ... Hdiny potrebnÈ na vykonanie posudzovacÌch aktivÌt, Corr.error ... Hodiny potrebnÈ na vykonanie opr·v, #Err ... PoËet ch˝b n·jden˝ch a opraven˝ch v danej f·ze.

Popis:
T·to tabuæka sumarizuje efektivitu (v zmysle poËtu n·jden˝ch ch˝b) v procese vykon·vania opr·v.

Vysvetlenie/Odpor˙Ëania:
éiadne.","",null,null,"sk",3116);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3335,"root",NULL,3116,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42452,"root",null,"en",3335);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43164,"root",null,"de",3335);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143164,"root",null,"sk",3335);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3336,"Effort and Errors",3335,3116,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42453,"Effort and Errors","Phase","en",3336);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43165,"Effort and Errors","Phase","de",3336);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143165,"Snaha a chyby","Phase","sk",3336);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3337,"Rev.effort (h)",3336,3116,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3338,"Corr.effort (h)",3336,3116,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3339,"#Err. detected",3336,3116,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42454,"Rev.effort (h)","E1","en",3337);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42455,"Corr.effort (h)","E2","en",3338);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42456,"#Err","E3","en",3339);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43166,"Rev.effort (h)","E1","de",3337);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43167,"Corr.effort (h)","E2","de",3338);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43168,"#Err","E3","de",3339);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143166,"Rev.effort (h)","E1","sk",3337);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143167,"Corr.effort (h)","E2","sk",3338);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143168,"#Err","E3","sk",3339);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3002," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*SREVIEW_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3003," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*SREVIEW_K_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3004," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3005," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*EREVIEW_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3006," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*EREVIEW_K_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3007," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3008," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*MREVIEW_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3009," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*MREVIEW_K_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3010," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3011," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*CREVIEW_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3012," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*CREVIEW_K_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3013," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODEREVIEWBERICHT*Codereviewreport*FEHLER");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3014," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*HREVIEW_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3015," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**REVIEWLOGBUCH*Reviewlog*HREVIEW_K_AUFWAND");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3016," ",
'select distinct max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*FEHLER");



INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3340,"Specification",3337,3116,3002,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3341,"Specification",3338,3116,3003,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3342,"Specification",3339,3116,3004,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42457,"Specification","TC","en",3340);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42458,"Specification","TC","en",3341);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42459,"Specification","TC","en",3342);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3343,"System design",3340,3116,3005,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3344,"System design",3341,3116,3006,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3345,"System design",3342,3116,3007,NULL);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42460,"System design","TC","en",3343);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42461,"System design","TC","en",3344);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42462,"System design","TC","en",3345);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3346,"Module design",3343,3116,3008,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3347,"Module design",3344,3116,3009,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3348,"Module design",3345,3116,3010,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42463,"Module design","TC","en",3346);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42464,"Module design","TC","en",3347);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42465,"Module design","TC","en",3348);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3349,"Code",3346,3116,3011,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3350,"Code",3347,3116,3012,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3351,"Code",3348,3116,3013,NULL);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42466,"Code","TC","en",3349);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42467,"Code","TC","en",3350);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42468,"Code","TC","en",3351);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3352,"Manual",3349,3116,3014,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3353,"Manual",3350,3116,3015,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3354,"Manual",3351,3116,3016,NULL);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42469,"Manual","TC","en",3352);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42470,"Manual","TC","en",3353);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42471,"Manual","TC","en",3354);

/* maier */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43169,"Specification","TC","de",3340);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43170,"Specification","TC","de",3341);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43171,"Specification","TC","de",3342);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43172,"System design","TC","de",3343);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43173,"System design","TC","de",3344);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43174,"System design","TC","de",3345);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43175,"Module design","TC","de",3346);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43176,"Module design","TC","de",3347);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43177,"Module design","TC","de",3348);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43178,"Code","TC","de",3349);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43179,"Code","TC","de",3350);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43180,"Code","TC","de",3351);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43181,"Manual","TC","de",3352);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43182,"Manual","TC","de",3353);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43183,"Manual","TC","de",3354);


/* daÚo */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143169,"Specification","TC","sk",3340);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143170,"Specification","TC","sk",3341);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143171,"Specification","TC","sk",3342);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143172,"System design","TC","sk",3343);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143173,"System design","TC","sk",3344);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143174,"System design","TC","sk",3345);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143175,"Module design","TC","sk",3346);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143176,"Module design","TC","sk",3347);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143177,"Module design","TC","sk",3348);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143178,"Code","TC","sk",3349);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143179,"Code","TC","sk",3350);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143180,"Code","TC","sk",3351);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143181,"Manual","TC","sk",3352);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143182,"Manual","TC","sk",3353);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143183,"Manual","TC","sk",3354);


/**********************************/
/*   Milestones                     */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(419,"Milestones",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1238,"Milestones","en",419);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1239,"Milestones","de",419);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5239,"MedznÌky","sk",419);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3118,"Milestones",0,"T",NULL,419);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (836,"Milestones","Legend:
Phase ... different Resource and Phase Milestones during the project run, Begin date ... date of first activity related to that phase, End date ... date of last activity related to that phase, Duration ... number of days spent for that phase.

Description:
This table summarizes the most important key-dates concerning the project. It illustrated when a phase startes or ended, and provides feedback concerning the budget-consumption.

Explanation/Recommendations:
Not available.","",null,null,"en",3118);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (837,"Milestones","Legende:
Phase ... unterschiedliche Ressourcen- und Phasen-Meilenstein w‰hrend des Projekts, Begin date ... Datum der ersten Aktivit‰t in dieser Phase, End date ... Datum der letzten Aktivit‰t in dieser Phase, Duration ... verbrachte Tage in dieser Phase.

Beschreibung:
Diese Tabelle faﬂt die wichtigsten Meilensteine bez¸glich des Projekts zusammen. Sie zeigt, wannPhasen beginnen und enden, und gibt R¸ckschl¸sse bez¸glich des Budgetverbrauchs.

Erkl‰rung/Empfehlungen:
Nicht vorhanden.",
"",null,null,"de",3118);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8036,"MedznÌky","Legenda:
Phase ... RÙzne mÌæniky s ohæadom na zdroje a f·zy poËas behu projektu, Begin date ... D·tum prvej aktivity t˝kaj˙cej sa danej f·zy, End date ... D·tum poslednej aktivity t˝kaj˙cej sa danej f·zy, Duration ... poËet dnÌ str·ven˝ch v danej f·ze.

Popis:
T·to tabuæka sumarizuje najpodstatnejöie kæ˙ËovÈ d·tumy t˝kaj˙ce sa projektu. Ilustruje, kedy sa f·za zaËÌna a konËÌ a pon˙ka aj sp‰tn˙ v‰zbu ber˙c do ˙vahy spotrebu rozpoËtu.

Vysvetlenie/Odpor˙Ëania:
éiadne.","",null,null,"sk",3118);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3387,"root",NULL,3118,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42504,"root",null,"en",3387);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43184,"root",null,"de",3387);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143184,"root",null,"sk",3387);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3388,"Milestones",3387,3118,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42505,"Milestones and phases","Phase","en",3388);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43185,"Milestones and phases","Phase","de",3388);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143185,"Milestones and phases","Phase","sk",3388);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3389,"Begin date",3388,3118,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3390,"End date",3388,3118,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3550,"Duration (d)",3388,3118,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42506,"Begin date","","en",3389);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42507,"End date","","en",3390);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42687,"Duration","","en",3550);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43186,"Begin date","","de",3389);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43187,"End date","","de",3390);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43188,"Duration","","de",3550);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143186,"Begin date","","sk",3389);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143187,"End date","","sk",3390);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143188,"Duration","","sk",3550);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3042," ",
'select min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Spezifikation"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3043," ",
'select max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Spezifikation"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3182," ",
'select distinct datediff(
(select distinct max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Spezifikation"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1),
(select distinct min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Spezifikation"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1)
) as value;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3044," ",
'select min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Systemdesign"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3045," ",
'select max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Systemdesign"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3183," ",
'select distinct datediff(
(select distinct max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Systemdesign"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1),
(select distinct min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Systemdesign"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1)
) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3046," ",
'select min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Modulspez"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3047," ",
'select max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Modulspez"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3184," ",
'select distinct datediff(
(select distinct max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Modulspez"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1),(
select distinct min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Modulspez"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1)
) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3048," ",
'select min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Codierung"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3049," ",
'select max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Codierung"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3185," ",
'select distinct datediff(
(select distinct max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Codierung"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1),
(select distinct min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Codierung"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1)
) as value;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3050," ",
'select min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Handbuch"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3051," ",
'select max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Handbuch"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3186," ",
'select distinct datediff(
(select distinct max(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Ende Handbuch"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1),
(select distinct min(t.date) as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "Beginn Handbuch"
and l.language = "en" and t.gid = %game and LOCATE(t.path ,\"%path\")=1)
) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3052," ",
'select t.date as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "20% Ressourcen"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3054," ",
'select t.date as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "40% Ressourcen"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3056," ",
'select t.date as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "50% Ressourcen"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3058," ",
'select t.date as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "75% Ressourcen"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3060," ",
'select t.date as value from turn t, ms_info mi, milestone m, aid_desc_lang l,aid_description a
where
t.tnid = mi.tnid and mi.msid = m.msid and l.aiddid = a.aiddid
and a.aiddid = m.aiddid and a.description = "100% Ressourcen"
and l.language = "en" and t.gid = %game and LOCATE(t.path, \"%path\");',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3053," ",
'select " " as value from turn t where t.gid = %game',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3055," ",
'select " " as value from turn t where t.gid = %game',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3057," ",
'select " " as value from turn t where t.gid = %game',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3059," ",
'select " " as value from turn t where t.gid = %game',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3061," ",
'select " " as value from turn t where t.gid = %game',null);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3391,"Specification",3389,3118,3042,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3392,"Specification",3390,3118,3043,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3551,"Specification",3550,3118,3182,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42508,"Specification","SP","en",3391);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42509,"Specification","SP","en",3392);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42688,"Specification","SP","en",3551);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3393,"System design",3391,3118,3044,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3394,"System design",3392,3118,3045,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3552,"System design",3551,3118,3183,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42510,"System design","DE","en",3393);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42511,"System design","DE","en",3394);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42689,"System design","DE","en",3552);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3395,"Module design",3393,3118,3046,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3396,"Module design",3394,3118,3047,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3553,"Module design",3552,3118,3184,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42512,"Module design","","en",3395);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42513,"Module design","","en",3396);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42690,"Module design","","en",3553);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3397,"Code",3395,3118,3048,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3398,"Code",3396,3118,3049,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3554,"Code",3553,3118,3185,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42514,"Code","","en",3397);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42515,"Code","","en",3398);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42691,"Code","","en",3554);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3399,"Manual",3397,3118,3050,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3400,"Manual",3398,3118,3051,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3555,"Manual",3554,3118,3186,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42516,"Manual","","en",3399);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42517,"Manual","","en",3400);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42692,"Manual","","en",3555);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3401,"20% Resources",3399,3118,3052,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3402,"20% Resources",3400,3118,3053,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3556,"20% Resources",3555,3118,3053,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42518,"20% Resources","","en",3401);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42519,"20% Resources","","en",3402);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42693,"20% Resources","","en",3556);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3403,"40% Resources",3401,3118,3054,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3404,"40% Resources",3402,3118,3055,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3557,"40% Resources",3556,3118,3055,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42520,"40% Resources","","en",3403);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42521,"40% Resources","","en",3404);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42694,"40% Resources","","en",3557);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3405,"50% Resources",3403,3118,3056,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3406,"50% Resources",3404,3118,3057,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3558,"50% Resources",3557,3118,3057,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42522,"50% Resources","","en",3405);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42523,"50% Resources","","en",3406);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42695,"50% Resources","","en",3558);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3407,"75% Resources",3405,3118,3058,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3408,"75% Resources",3406,3118,3059,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3559,"75% Resources",3558,3118,3059,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42524,"75% Resources","","en",3407);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42525,"75% Resources","","en",3408);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42696,"75% Resources","","en",3559);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3409,"100% Resources",3407,3118,3060,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3410,"100% Resources",3408,3118,3061,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3560,"100% Resources",3559,3118,3061,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42526,"100% Resources","","en",3409);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42527,"100% Resources","","en",3410);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42697,"100% Resources","","en",3560);

/* maier */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43189,"Specification","SP","de",3391);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43190,"Specification","SP","de",3392);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43191,"Specification","SP","de",3551);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43192,"System design","DE","de",3393);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43193,"System design","DE","de",3394);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43194,"System design","DE","de",3552);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43195,"Module design","","de",3395);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43196,"Module design","","de",3396);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43197,"Module design","","de",3553);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43198,"Code","","de",3397);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43199,"Code","","de",3398);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43200,"Code","","de",3554);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43201,"Manual","","de",3399);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43202,"Manual","","de",3400);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43203,"Manual","","de",3555);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43204,"20% Resources","","de",3401);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43205,"20% Resources","","de",3402);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43206,"20% Resources","","de",3556);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43207,"40% Resources","","de",3403);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43208,"40% Resources","","de",3404);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43209,"40% Resources","","de",3557);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43210,"50% Resources","","de",3405);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43211,"50% Resources","","de",3406);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43212,"50% Resources","","de",3558);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43213,"75% Resources","","de",3407);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43214,"75% Resources","","de",3408);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43215,"75% Resources","","de",3559);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43216,"100% Resources","","de",3409);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43217,"100% Resources","","de",3410);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43218,"100% Resources","","de",3560);


/* daÚo */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143189,"Specification","SP","sk",3391);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143190,"Specification","SP","sk",3392);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143191,"Specification","SP","sk",3551);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143192,"System design","DE","sk",3393);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143193,"System design","DE","sk",3394);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143194,"System design","DE","sk",3552);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143195,"Module design","","sk",3395);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143196,"Module design","","sk",3396);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143197,"Module design","","sk",3553);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143198,"Code","","sk",3397);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143199,"Code","","sk",3398);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143200,"Code","","sk",3554);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143201,"Manual","","sk",3399);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143202,"Manual","","sk",3400);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143203,"Manual","","sk",3555);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143204,"20% Resources","","sk",3401);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143205,"20% Resources","","sk",3402);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143206,"20% Resources","","sk",3556);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143207,"40% Resources","","sk",3403);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143208,"40% Resources","","sk",3404);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143209,"40% Resources","","sk",3557);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143210,"50% Resources","","sk",3405);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143211,"50% Resources","","sk",3406);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143212,"50% Resources","","sk",3558);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143213,"75% Resources","","sk",3407);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143214,"75% Resources","","sk",3408);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143215,"75% Resources","","sk",3559);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143216,"100% Resources","","sk",3409);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143217,"100% Resources","","sk",3410);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143218,"100% Resources","","sk",3560);


/**********************************/
/*   Customer participation         */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(425,"Customer",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1250,"Customer","en",425);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1251,"Customer","de",425);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5251,"Customer","sk",425);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3124,"Customer",0,"T",NULL,425);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (848,"Customer","
Legend:
Analysis ... Employee visits the customer and talks about analysis document (yes/no, number of times), Spec. rev. ... customer participates in specification review (yes/no, number of times), Doc. rev. ... customer participates in review of documentation/manuals (yes/no, number of times), Acc. rev. ... customer conducts an acceptance test (yes/no, number of times).

Description:
This table summarizes the involvement and the activities of the customer during the project.

Explanation/Recommendations:
Especially at early phases the customer can provide valid feedback. It is a good idea to involve him/her in review activities.","","","",'en',3124);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (849,"Customer","Legende:
Analysis ... Angestellte besucht den Kunden und bespricht Analysedokumente (ja/ein, wie oft), Spec. rev. ... Kunde nimmt am Spezifikationsreview teil (ja/nein, wie oft), Doc. rev. ... Kunde nimmt am Dokumentatations-/handbuchreview teil (ja/nein, wie oft), Acc. rev. ... Kunde f¸hrt einen Abnahmetest durch (ja/nein, wie oft).

Beschreibung:
Diese Tabelle faﬂt die Kundeneinbindung und -aktivit‰ten w‰hrend des Projekts zusammen.

Erkl‰rung/Empfehlungen:
Speziell in fr¸hen Phasen bringt eine Kundeneinbindung brauchbares Feedback. Die Einbeziehung des Kunden in Reviews ist eine gute Idee.",
"","","","de",3124);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8048,"Z·kaznÌk","
Legenda:
Analysis ... Zamestnanec navötevuje z·kaznÌka a rozober· anal˝zu dokuemtnu (·no/nie, koæko kr·t), Spec. rev. ... Z·kaznÌk sa podieæa na posudzovanÌ öpecifik·cie (·no/nie, koæko kr·t), Doc. rev. ... Z·kaznÌk sa podieæa na posudzovanÌ dokument·cie/manu·lov (·no/nie, koæko kr·t), Acc. rev. ... Z·kaznÌk vykon·va akceptaËn˝ test (·no/nie, koæko kr·t).

Popis:
T·to tabuæka sumarizuje zaËlenenie a aktivity z·kaznÌka do projektu.

Vysvetlenie/Odpor˙Ëania:
Najm‰ v skor˝ch f·zach projektu vie z·kaznÌk zabezpeËiù opodstatnen˙ sp‰tn˙ v‰zbu. Jeho zaËlenenie do posudzovanie je dobr˝m n·padom.",
"","","","sk",3124);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3481,"root",NULL,3124,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42599,"root",null,'en',3481);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43219,"root",null,'de',3481);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143219,"root",null,'sk',3481);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3121,"Analysis",
'select ifnull((select distinct "true" as value from turn where gid = %game and command like "%poziadaj%hovor%zakaznikom%" and LOCATE(path,"%path")=1),"false") as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3122,"Analysis",
'select count(*) as value from turn where command like "%poziadaj%hovor%zakaznikom%" and gid = %game and LOCATE(path,"%path")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3123,"Spec. rev.",
'select ifnull((select distinct "true" as value from turn where gid = %game and (command like "%posud%" or command like "%prehodnoten%") and command like "%specifikacie%" and LOCATE(path,"%path")=1),"false") as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3124,"Spec. rev.",
'select count(*) as value from turn where (command like "%posudz%specifikacie%" or command like "%prehodnoten%specifikacie%" or command like "%posud%dokumentu%Specification%") and gid = %game and LOCATE(path,"%path")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3125,"Doc. rev.",
'select ifnull((select distinct "true" as value from turn where gid = %game and (command like "%posud%" or command like "%prehodnoten%") and command like "%dokumentacie%" and LOCATE(path,"%path")=1),"false") as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3126,"Doc. rev.",
'select count(*) as value from turn where (command like "%posud%" or command like "%prehodnoten%") and command like "%dokumentacie%" and gid = %game and LOCATE(path,"%path")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3127,"Acc. test",
'select ifnull((select distinct "true" as value from turn where gid = %game and command like "%vykon%akcept%test%" and LOCATE(path,"%path")=1),"false") as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3128,"Acc. test",
'select count(*) as value from turn where command like "%vykon%akcept%test%" and gid = %game and LOCATE(path,"%path")=1;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3492,"Customer participation",3481,3124,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42610,"Customer participation","",'en',3492);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3482,"Took place?",3492,3124,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3483,"Number",3492,3124,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42600,"Took place?","",'en',3482);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42601,"Number","",'en',3483);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3484,"Analysis",3482,3124,3121,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3485,"Analysis",3483,3124,3122,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42602,"Analysis","",'en',3484);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42603,"Analysis","",'en',3485);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3486,"Spec. rev.",3484,3124,3123,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3487,"Spec. rev.",3485,3124,3124,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42604,"Spec. rev.","",'en',3486);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42605,"Spec. rev.","",'en',3487);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3488,"Doc. rev.",3486,3124,3125,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3489,"Doc. rev.",3487,3124,3126,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42606,"Doc. rev.","",'en',3488);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42607,"Doc. rev.","",'en',3489);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3490,"Acc. test",3488,3124,3127,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3491,"Acc. test",3489,3124,3128,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42608,"Acc. test","",'en',3490);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42609,"Acc. test","",'en',3491);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43220,"Customer participation","",'de',3492);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43221,"Took place?","",'de',3482);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43222,"Number","",'de',3483);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43223,"Analysis","",'de',3484);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43224,"Analysis","",'de',3485);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43225,"Spec. rev.","",'de',3486);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43226,"Spec. rev.","",'de',3487);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43227,"Doc. rev.","",'de',3488);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43228,"Doc. rev.","",'de',3489);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43229,"Acc. test","",'de',3490);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43230,"Acc. test","",'de',3491);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143220,"Customer participation","",'sk',3492);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143221,"Took place?","",'sk',3482);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143222,"Number","",'sk',3483);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143223,"Analysis","",'sk',3484);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143224,"Analysis","",'sk',3485);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143225,"Spec. rev.","",'sk',3486);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143226,"Spec. rev.","",'sk',3487);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143227,"Doc. rev.","",'sk',3488);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143228,"Doc. rev.","",'sk',3489);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143229,"Acc. test","",'sk',3490);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143230,"Acc. test","",'sk',3491);

/**********************************/
/*   Test information                     */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(427,"Tests info",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1254,"Tests info",'en',427);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1255,"Tests info","de",427);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5255,"Info o testoch","sk",427);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3126,"Tests info",0,"T",NULL,427);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (852,"Tests info","
Legend:
Length ... duration of activity (in days), Effort ... effort of activity (in hours), Corr ... effort of correction (in hours), Det. errors ... number of errors detected (total), Err. in docs ... remaining errors in documents, Reviews ... number of reviews of the document (total), Test ... number of test activities (total).

Description:
This table summarizes the effort spent on testing activities.

Explanation/Recommendation:
Tests are essential for preserving the quality of the product. Be sure that all four type of tests were conducted.",
"","","",'en',3126);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (853,"Tests info","Legende:
Length ... Dauer der Aktivit‰t (in Tagen), Effort ... Aufwand f¸r Aktivit‰t (in Stunden), Corr ... Aufwand f¸r Korrektur (in Stunden), Det. errors ... gefundene Fehler (Gesamtanzahl), Err. in docs ... in Dokumenten verbleibende Fehler, Reviews ... Anzahl Reviews in einem Dokument (Gesamtanzahl), Test ... Anzahl Testaktivit‰ten (Gesamtanzahl).

Beschreibung:
Diese Tabelle faﬂt den Aufwand zusammen, der f¸r Testaktivit‰ten erbracht wurde.

Erkl‰rung/Empfehlungen:
Tests sind f¸r die Aufrechterhaltung der Qualit‰t des Produkts entscheidend. Stelle sicher, daﬂ alle vier Testarten durchgef¸hrt wurden.",
"","","","de",3126);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8052,"Info o testoch","
Legenda:
Length ... Trvanie aktivity (v dÚoch), Effort ... ⁄silie (v hodin·ch), Corr ... Snahy o korekciu (v hodin·ch), Det. errors ... PoËet odhalen˝ch ch˝b (celkovo), Err. in docs ... Ost·vaj˙ce chyby v dokumentoch, Reviews ... poËet posudzovanÌ dokumentu (celkovo), Test ... PoËet testovacÌch aktivÌt (celkovo).

Popis:
T·to tabuæka sumarizuje ˙silie vynaloûenÈ na testovacie aktivity.

Vysvetlenie/Odpor˙Ëania:
Testy s˙ z·kladom pre zachovanie kvality produktu. Uistite sa, ûe vöetky ötyri typy testov boli vykonanÈ.",
"","","","sk",3126);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3505,"root",NULL,3126,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42634,"root",null,'en',3505);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43231,"root",null,'de',3505);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143231,"root",null,'sk',3505);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3506,"Test information",3505,3126,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42635,"Test information","","en",3506);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43232,"Test information","","de",3506);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143232,"Test information","","sk",3506);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3507,"Mod. tests",3506,3126,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3508,"Sys. tests",3506,3126,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3509,"Int. tests",3506,3126,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3510,"Acc. tests",3506,3126,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42636,"Mod. tests","MT","en",3507);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42637,"Sys. tests","ST","en",3508);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42638,"Int. tests","IT","en",3509);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42639,"Acc. tests","AT","en",3510);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43233,"Mod. tests","MT","de",3507);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43234,"Sys. tests","ST","de",3508);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43235,"Int. tests","IT","de",3509);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43236,"Acc. tests","AT","de",3510);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143233,"Mod. tests","MT","sk",3507);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143234,"Sys. tests","ST","sk",3508);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143235,"Int. tests","IT","sk",3509);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143236,"Acc. tests","AT","sk",3510);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3141,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3142,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3143,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3144,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3145,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3146,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3147,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3148,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3149,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3150,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3151,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3152,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3153,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3154,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3155,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3156,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3231,"test num",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE"
AND (document = "code")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE"
AND (document = "code")) AND s_relation.gid=%game and success = 1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3232,"test num",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_SYSTEM"
AND (document = "code")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_SYSTEM"
AND (document = "code")) AND s_relation.gid=%game and success = 1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3233,"test num",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_INTEGRATION"
AND (document = "code")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_INTEGRATION"
AND (document = "code")) AND s_relation.gid=%game and success = 1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3234,"test num",
'select count(*) as value from (select distinct date from turn where gid = %game and command like "%akceptacny test%" and LOCATE(path, "%path")=1) a;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3511,"Duration (d)",3507,3126,3141,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3512,"Duration (d)",3508,3126,3142,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3513,"Duration (d)",3509,3126,3143,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3514,"Duration (d)",3510,3126,3144,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42640,"Length","LE","en",3511);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42641,"Length","LE","en",3512);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42642,"Length","LE","en",3513);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42643,"Length","LE","en",3514);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3515,"Effort (h)",3511,3126,3145,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3516,"Effort (h)",3512,3126,3146,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3517,"Effort (h)",3513,3126,3147,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3518,"Effort (h)",3514,3126,3148,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42661,"Effort","EF","en",3515);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42662,"Effort","EF","en",3516);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42663,"Effort","EF","en",3517);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42644,"Effort","EF","en",3518);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3519,"Corr. effort (h)",3515,3126,3149,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3520,"Corr. effort (h)",3516,3126,3150,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3521,"Corr. effort (h)",3517,3126,3151,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3522,"Corr. effort (h)",3518,3126,3152,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42645,"Corr. effort","CE","en",3519);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42646,"Corr. effort","CE","en",3520);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42647,"Corr. effort","CE","en",3521);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42648,"Corr. effort","CE","en",3522);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3523,"Det. errors",3519,3126,3153,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3524,"Det. errors",3520,3126,3154,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3525,"Det. errors",3521,3126,3155,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3526,"Det. errors",3522,3126,3156,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42649,"Det. errors","DE","en",3523);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42650,"Det. errors","DE","en",3524);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42651,"Det. errors","DE","en",3525);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42652,"Det. errors","DE","en",3526);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3687,"Tests",3523,3126,3231,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3688,"Tests",3524,3126,3232,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3689,"Tests",3525,3126,3233,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3690,"Tests",3526,3126,3234,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42813,"Tests","DE","en",3687);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42814,"Tests","DE","en",3688);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42815,"Tests","DE","en",3689);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42816,"Tests","DE","en",3690);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43237,"Length","LE","de",3511);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43238,"Length","LE","de",3512);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43239,"Length","LE","de",3513);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43240,"Length","LE","de",3514);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43241,"Effort","EF","de",3515);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43242,"Effort","EF","de",3516);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43243,"Effort","EF","de",3517);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43244,"Effort","EF","de",3518);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43245,"Corr. effort","CE","de",3519);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43246,"Corr. effort","CE","de",3520);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43247,"Corr. effort","CE","de",3521);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43248,"Corr. effort","CE","de",3522);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43249,"Det. errors","DE","de",3523);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43250,"Det. errors","DE","de",3524);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43251,"Det. errors","DE","de",3525);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43252,"Det. errors","DE","de",3526);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43253,"Tests","DE","de",3687);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43254,"Tests","DE","de",3688);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43255,"Tests","DE","de",3689);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43256,"Tests","DE","de",3690);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143237,"Length","LE","sk",3511);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143238,"Length","LE","sk",3512);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143239,"Length","LE","sk",3513);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143240,"Length","LE","sk",3514);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143241,"Effort","EF","sk",3515);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143242,"Effort","EF","sk",3516);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143243,"Effort","EF","sk",3517);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143244,"Effort","EF","sk",3518);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143245,"Corr. effort","CE","sk",3519);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143246,"Corr. effort","CE","sk",3520);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143247,"Corr. effort","CE","sk",3521);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143248,"Corr. effort","CE","sk",3522);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143249,"Det. errors","DE","sk",3523);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143250,"Det. errors","DE","sk",3524);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143251,"Det. errors","DE","sk",3525);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143252,"Det. errors","DE","sk",3526);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143253,"Tests","DE","sk",3687);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143254,"Tests","DE","sk",3688);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143255,"Tests","DE","sk",3689);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143256,"Tests","DE","sk",3690);

/**********************************/
/*   Monitoring                     */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(431,"Monitoring",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1262,"Monitoring",'en',431);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1274,"Monitoring",'de',431);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5274,"Monitorovanie",'sk',431);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3130,"Monitoring",0,"T",NULL,431);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (876,"Monitoring","Legend:
Status investigation ... monitoring activities concerning a specific product or document (\"Activity\" refers to monitoring the work load of developers), Number of activities ... total number of activities.

Description:
This table summarizes how often the project manager asked for the status of documents or activites of developers.

Explanation/Recommendations:
Not available.","","","",'en',3130);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (877,"Monitoring","Legende:
Status investigation ... Kontrollaktivit‰ten bez¸glich eines speziellen Produkts bzw. Dokuments (\"Activity\" bezieht sich auf die Kontrolle der Arbeit der Entwickler), Number of activities ... Anzahl Aktivit‰ten.

Beschreibung:
Diese Tabelle faﬂt zusammen, wie oft der Projektmanager sich ¸ber den Status eines Dokuments oder einer Aktivit‰t der Entwickler informierte.

Erkl‰rung/Empfehlungen:
Nicht vorhanden."
,"","","",'de',3130);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8076,"Monitorovanie","Legenda:
Status investigation ... Monitorovacie aktivity s ohæadom na öpecifick˝ produkt alebo dokument (\"Aktivita\" tu sl˙ûi na vyjadrenie monitorovania pracovnej z·ùaûe v˝voj·rov), Number of activities ... PoËet vöetk˝ch aktivÌt.

Popis:
T·to tabuæka sumarizuje, ako Ëasto sa projektov˝ manaûÈr zaujÌmal o stav dokumentov alebo aktivity v˝voj·rov.

Vysvetlenie/Odpor˙Ëania:
éiadne.","","","",'sk',3130);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3580,"root",NULL,3130,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42699,"root",null,'en',3580);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43257,"root",null,'de',3580);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143257,"root",null,'sk',3580);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3562,"Monitoring",3580,3130,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42700,"Monitoring","Status investigation","en",3562);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43258,"Monitoring","Status investigation","de",3562);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143258,"Monitoring","Status investigation","sk",3562);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3563,"Number of activities",3562,3130,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42701,"Number of activities","","en",3563);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43259,"Number of activities","","de",3563);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143259,"Number of activities","","sk",3563);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2806,'specification inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%specifikaciu" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2807,'system design inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%navrh systemu" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2808,'module design inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%navrh modulov" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2809,'code inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%kod" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(2810,'documentation inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%dokumentaciu" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3129,'Activity inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%aktivitu%" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3130,'Resource inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "informuj% o pouzitych zdrojoch" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3132,'Specification report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Specificationreviewreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3133,'Design report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Systemdesignreviewreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3134,'Module design report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Moduledesignreviewreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3135,'Code report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Codereviewreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3136,'Manual report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Manualsreviewreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3137,'Mtest report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Moduletestreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3138,'Stest report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Systemtestreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3139,'Itest report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Integrationtestreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3140,'Atest report inspections',
'select count(*) as value from turn s_entity, game where game.gid = s_entity.gid and
command like "ukaz%report posudku%Acceptancetestreport" and game.gid=%game and LOCATE(s_entity.path, \"%path\")=1;',
'***');


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3564,"Specification report",3563,3130,3132,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3565,"System design report",3564,3130,3133,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3566,"Module design report",3565,3130,3134,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3567,"Code report",3566,3130,3135,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3568,"Manual report",3567,3130,3136,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3569,"Module test report",3568,3130,3137,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3570,"System test report",3569,3130,3138,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3571,"Integration test report",3570,3130,3139,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3572,"Acceptance test report",3571,3130,3140,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3573,"Specification",3572,3130,2806,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3574,"System design",3573,3130,2807,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3575,"Module design",3574,3130,2808,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3576,"Code",3575,3130,2809,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3577,"Manual",3576,3130,2810,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3578,"Activity",3577,3130,3129,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3579,"Resources",3578,3130,3130,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42702,"Specification report","","en",3564);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42703,"System design report","","en",3565);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42704,"Module design report","","en",3566);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42705,"Code report","","en",3567);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42706,"Manual report","","en",3568);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42707,"Module test report","","en",3569);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42708,"System test report","","en",3570);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42709,"Integration test report","","en",3571);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42710,"Acceptance report","","en",3572);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42711,"Specification","","en",3573);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42712,"System design","","en",3574);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42713,"Module design","","en",3575);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42714,"Code","","en",3576);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42715,"Manual","","en",3577);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42716,"Activity","","en",3578);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42717,"Resources","","en",3579);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43260,"Specification report","","de",3564);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43261,"System design report","","de",3565);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43262,"Module design report","","de",3566);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43263,"Code report","","de",3567);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43264,"Manual report","","de",3568);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43265,"Module test report","","de",3569);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43266,"System test report","","de",3570);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43267,"Integration test report","","de",3571);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43268,"Acceptance report","","de",3572);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43269,"Specification","","de",3573);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43270,"System design","","de",3574);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43271,"Module design","","de",3575);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43272,"Code","","de",3576);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43273,"Manual","","de",3577);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43274,"Activity","","de",3578);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43275,"Resources","","de",3579);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143260,"Specification report","","sk",3564);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143261,"System design report","","sk",3565);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143262,"Module design report","","sk",3566);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143263,"Code report","","sk",3567);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143264,"Manual report","","sk",3568);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143265,"Module test report","","sk",3569);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143266,"System test report","","sk",3570);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143267,"Integration test report","","sk",3571);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143268,"Acceptance report","","sk",3572);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143269,"Specification","","sk",3573);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143270,"System design","","sk",3574);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143271,"Module design","","sk",3575);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143272,"Code","","sk",3576);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143273,"Manual","","sk",3577);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143274,"Activity","","sk",3578);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143275,"Resources","","sk",3579);


/**********************************/
/*   Task assignment                        */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(433,"Tasks assignment",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1264,"Tasks assignment",'en',433);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1276,"Tasks assignment",'de',433);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5276,"Priradenie ˙loh",'sk',433);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3132,"Tasks assignment",0,"T",NULL,433);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (865,"Tasks assignment","
Legend:
Phase ... Major phases during the project, Employees names ... names of employees that are assigned to tasks related to the specific phase, Number of employees ... number of employees assigned to tasks related to the specific phase (total sum).

Description:
This table summarizes the employees (developers) assigned to specific phases in the project.","","","",'en',3132);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (866,"Tasks assignment","Legende:
Phase ... Hauptphasen w‰hrend des Projekts, Employees names ... Namen der Angestellten, die Aufgaben bez¸glich einer bestimmten Phase zugeteilt wurden, Number of employees ... Anzahl Angestellter, die Aufgaben bez¸glich einer bestimmten Phase zugeteilt wurden (Gesamtsumme).

Beschreibung:
Diese Tabelle faﬂt die Angestellten (Entwickler), denen Aufgaben bez¸glich einer bestimmten Phase zugeteilt wurden, zusammen.",
"","","",'de',3132);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8065,"Priradenie ˙loh","
Legenda:
Phase ... HlavnÈ f·zy projektu, Employees names ... men· zamestnancov, ktorÌ s˙ priradenÌ ˙lohe v danej (öpecifickej) f·ze, Number of employees ... poËet zamestnancov priraden˝ch ˙loh·m s ohæadom na öpecifick˙ f·zu (celkov˝ poËet).

Popis:
T·to tabuæka sumarizuje zamestnancov (v˝voj·rov) priraden˝ch öpecifick˝m f·zam projektu.","","","",'sk',3132);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3586,"root",NULL,3132,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42723,"root",null,'en',3586);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43276,"root",null,'de',3586);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143276,"root",null,'sk',3586);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3587,"Task assignment",3586,3132,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42724,"Task assignment","Phase","en",3587);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43277,"Task assignment","Phase","de",3587);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143277,"Task assignment","Phase","sk",3587);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3588,"Employees names",3587,3132,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3589,"Number of employees",3587,3132,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3188," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid = %game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3189,"Specification",
'select count(*) as value from
(
select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Spezifikation" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3190,"System design",
'select count(*) as value from
(
select DISTINCT s_relation.person as value
from zarmstype,s_relation,specific_aid,spaid_needs_zt,game
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Systemdesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game  AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3191,"Module design",
'select count(*) as value from
(
select DISTINCT s_relation.person as value
from zarmstype,s_relation,specific_aid,spaid_needs_zt,game
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Moduldesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3192,"Code",
'select count(*) as value from
(
select DISTINCT s_relation.person as value
from zarmstype,s_relation,specific_aid,spaid_needs_zt,game
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Code" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3193,"Manual",
'select count(*) as value from
(
select DISTINCT s_relation.person as value
from zarmstype,s_relation,specific_aid,spaid_needs_zt,game
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Manual" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3194,"Specification review",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3195,"System design review",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3196,"Module design review",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3197,"Code review",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3198,"Manual review",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3199,"Revisors",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3200,"Revisors",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3201,"Revisors",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3202,"Revisors",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3203,"Revisors",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3204,"Specification",
'select count(*) as value from
(select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Spezifikation" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3205,"Design",
'select count(*) as value from
(select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Systemdesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3206,"MSpecification",
'select count(*) as value from
(select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Moduldesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3207,"Code",
'select count(*) as value from
(select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Code" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3208,"Manual",
'select count(*) as value from
(select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Manual" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3157,"Testers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_MODULE" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game and LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3158,"Testers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_SYSTEM" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game and LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3159,"Testers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_INTEGRATION" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game and LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3160,"Testers",
'select distinct "Customer" as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3161,"Revisors",
'select SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Moduletestreport%" and LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3162,"Revisors",
'select SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Systemtestreport%" and LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3163,"Revisors",
'select SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Integrationtestreport%" and LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3164,"Revisors",
'select SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Acceptancetestreport%" and LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3209,"Testers",
'select count(*) as value from (SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_MODULE" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3210,"Testers",
'select count(*) as value from (SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_SYSTEM" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3211,"Testers",
'select count(*) as value from (SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_INTEGRATION" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 ) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3212,"Testers",
'select 0 as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3213,"Revisors",
'select count(*) as value from
(select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Moduletestreport%" and LOCATE(path, \"%path\")=1) a;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3214,"Revisors",
'select count(*) as value from
(select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Systemtestreport%" and LOCATE(path, \"%path\")=1) a;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3215,"Revisors",
'select count(*) as value from
(select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Integrationtestreport%" and LOCATE(path, \"%path\")=1) a;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3216,"Revisors",
'select count(*) as value from
(select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Acceptancetestreport%" and LOCATE(path, \"%path\")=1) a;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3217,"Module test",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_MODULE" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Moduletestreport%" and LOCATE(path, \"%path\")=1)  as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3218,"System test",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_SYSTEM" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Systemtestreport%" and LOCATE(path, \"%path\")=1) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3219,"Integration test",
'select count(*) as value from
(SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "TESTET_INTEGRATION" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1
union
select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Integrationtestreport%" and LOCATE(path, "%path")=1) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3220,"Acceptance test",
'select count(*) as value from
(select distinct SUBSTRING_INDEX(command," ",1) as value from turn where gid = %game and command like "%oprav%podla%Acceptancetestreport%" and LOCATE(path, "%path")=1) as value;',"****");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3094,"Team",
'select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Spezifikation" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3095,"Team",
'select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Systemdesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3096,"Team",
'select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Moduldesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3097,"Team",
'select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Code" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3098,"Team",
'select DISTINCT s_relation.person as value
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Manual" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3099,"Reviewers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Specification" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3100,"Reviewers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3101,"Reviewers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Moduledesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3102,"Reviewers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3103,"Reviewers",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "BEGUTACHTET" and document = "Manuals" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3104,"Revisors",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Spezifikation" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3105,"Revisors",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Systemdesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3106,"Revisors",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Moduldesign" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3107,"Revisors",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Code" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3108,"Revisors",
'SELECT DISTINCT s_relation.person as value
FROM s_relation, zarmstype,game
WHERE
game.gid = s_relation.gid and zarmstype.zid = s_relation.zid  and z_type = "KORRIGIERT" and document = "Manual" and eorr = "R"
and success = 1 AND game.gid=%game AND LOCATE(s_relation.path, \"%path\")=1;',null);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42725,"Employees names","","en",3588);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42726,"Number of employees","","en",3589);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3590,"Specification",3588,3132,3094,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3591,"Specification review",3590,3132,3099,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3592,"Specification corr.",3591,3132,3104,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3593,"Total (SP)",3592,3132,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42727,"Specification","","en",3590);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42728,"Specification review","","en",3591);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42729,"Specification corr.","","en",3592);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42730,"Total (SP)","","en",3593);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3610,"Specification",3589,3132,3189,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3611,"Specification review",3610,3132,3194,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3612,"Specification corr.",3611,3132,3199,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3613,"Total (SP)",3612,3132,3204,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42747,"Specification","","en",3610);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42748,"Specification review","","en",3611);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42749,"Specification corr.","","en",3612);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42750,"Total (SP)","","en",3613);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3594,"System design",3593,3132,3095,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3595,"System design review",3594,3132,3100,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3596,"System design corr.",3595,3132,3105,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3597,"Total (SD)",3596,3132,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42731,"System design","","en",3594);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42732,"System design review","","en",3595);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42733,"System design corr.","","en",3596);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42734,"Total (SD)","","en",3597);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3614,"System design",3613,3132,3190,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3615,"System design review",3614,3132,3195,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3616,"System design corr.",3615,3132,3200,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3617,"Total (SD)",3616,3132,3205,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42751,"System design","","en",3614);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42752,"System design review","","en",3615);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42753,"System design corr.","","en",3616);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42754,"Total (SD)","","en",3617);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3598,"Module design",3597,3132,3096,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3599,"Module design review",3598,3132,3101,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3600,"Module design corr.",3599,3132,3106,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3601,"Total (MD)",3600,3132,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42735,"Module design","","en",3598);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42736,"Module design review","","en",3599);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42737,"Module design corr.","","en",3600);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42738,"Total (MD)","","en",3601);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3618,"Module design",3617,3132,3191,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3619,"Module design review",3618,3132,3196,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3620,"Module design corr.",3619,3132,3201,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3621,"Total (MD)",3620,3132,3206,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42755,"Module design","","en",3618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42756,"Module design review","","en",3619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42757,"Module design corr.","","en",3620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42758,"Total (MD)","","en",3621);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3602,"Code",3601,3132,3097,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3603,"Code review",3602,3132,3102,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3604,"Code corr.",3603,3132,3107,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3605,"Total (CD)",3604,3132,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42739,"Code","","en",3602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42740,"Code review","","en",3603);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42741,"Code corr.","","en",3604);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42742,"Total (CD)","","en",3605);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3622,"Code",3621,3132,3192,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3623,"Code review",3622,3132,3197,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3624,"Code corr.",3623,3132,3202,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3625,"Total (CD)",3624,3132,3207,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42759,"Code","","en",3622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42760,"Code review","","en",3623);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42761,"Code corr.","","en",3624);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42762,"Total (CD)","","en",3625);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3606,"Manual",3605,3132,3098,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3607,"Manual review",3606,3132,3103,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3608,"Manual corr.",3607,3132,3108,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3609,"Total (MN)",3608,3132,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42743,"Manual","","en",3606);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42744,"Manual review","","en",3607);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42745,"Manual corr.","","en",3608);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42746,"Total (MN)","","en",3609);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3626,"Manual",3625,3132,3193,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3627,"Manual review",3626,3132,3198,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3628,"Manual corr.",3627,3132,3203,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3629,"Total (MN)",3628,3132,3208,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42763,"Manual","","en",3626);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42764,"Manual review","","en",3627);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42765,"Manual corr.","","en",3628);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42766,"Total (MN)","","en",3629);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43278,"Employees names","","de",3588);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43279,"Number of employees","","de",3589);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43280,"Specification","","de",3590);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43281,"Specification review","","de",3591);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43282,"Specification corr.","","de",3592);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43283,"Total (SP)","","de",3593);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43284,"Specification","","de",3610);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43285,"Specification review","","de",3611);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43286,"Specification corr.","","de",3612);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43287,"Total (SP)","","de",3613);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43288,"System design","","de",3594);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43289,"System design review","","de",3595);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43290,"System design corr.","","de",3596);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43291,"Total (SD)","","de",3597);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43292,"System design","","de",3614);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43293,"System design review","","de",3615);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43294,"System design corr.","","de",3616);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43295,"Total (SD)","","de",3617);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43296,"Module design","","de",3598);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43297,"Module design review","","de",3599);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43298,"Module design corr.","","de",3600);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43299,"Total (MD)","","de",3601);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43300,"Module design","","de",3618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43301,"Module design review","","de",3619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43302,"Module design corr.","","de",3620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43303,"Total (MD)","","de",3621);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43304,"Code","","de",3602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43305,"Code review","","de",3603);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43306,"Code corr.","","de",3604);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43307,"Total (CD)","","de",3605);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43308,"Code","","de",3622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43309,"Code review","","de",3623);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43310,"Code corr.","","de",3624);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43311,"Total (CD)","","de",3625);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43312,"Manual","","de",3606);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43313,"Manual review","","de",3607);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43314,"Manual corr.","","de",3608);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43315,"Total (MN)","","de",3609);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43316,"Manual","","de",3626);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43317,"Manual review","","de",3627);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43318,"Manual corr.","","de",3628);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43319,"Total (MN)","","de",3629);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143278,"Employees names","","sk",3588);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143279,"Number of employees","","sk",3589);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143280,"Specification","","sk",3590);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143281,"Specification review","","sk",3591);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143282,"Specification corr.","","sk",3592);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143283,"Total (SP)","","sk",3593);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143284,"Specification","","sk",3610);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143285,"Specification review","","sk",3611);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143286,"Specification corr.","","sk",3612);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143287,"Total (SP)","","sk",3613);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143288,"System design","","sk",3594);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143289,"System design review","","sk",3595);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143290,"System design corr.","","sk",3596);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143291,"Total (SD)","","sk",3597);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143292,"System design","","sk",3614);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143293,"System design review","","sk",3615);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143294,"System design corr.","","sk",3616);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143295,"Total (SD)","","sk",3617);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143296,"Module design","","sk",3598);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143297,"Module design review","","sk",3599);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143298,"Module design corr.","","sk",3600);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143299,"Total (MD)","","sk",3601);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143300,"Module design","","sk",3618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143301,"Module design review","","sk",3619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143302,"Module design corr.","","sk",3620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143303,"Total (MD)","","sk",3621);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143304,"Code","","sk",3602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143305,"Code review","","sk",3603);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143306,"Code corr.","","sk",3604);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143307,"Total (CD)","","sk",3605);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143308,"Code","","sk",3622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143309,"Code review","","sk",3623);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143310,"Code corr.","","sk",3624);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143311,"Total (CD)","","sk",3625);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143312,"Manual","","sk",3606);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143313,"Manual review","","sk",3607);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143314,"Manual corr.","","sk",3608);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143315,"Total (MN)","","sk",3609);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143316,"Manual","","sk",3626);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143317,"Manual review","","sk",3627);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143318,"Manual corr.","","sk",3628);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143319,"Total (MN)","","sk",3629);


/**********************************/
/*   Task assignment - tests          */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(438,"Tasks assignment",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1269,"Tasks assignment",'en',438);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1270,"Tasks assignment",'de',438);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5270,"Priradenie ˙loh",'sk',438);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3137,"Tasks assignment - Test Phases",0,"T",NULL,438);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (867,"Tasks assignment - Test Phases","
Legend:
Phase ... Major phases during the project, Employees names ... names of employees that are assigned to tasks related to the specific phase, Number of employees ... number of employees assigned to tasks related to the specific phase (total sum).

Description:
This table summarizes the employees (developers) assigned to specific testing phases in the project.","","","",'en',3137);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (868,"Tasks assignment - Test Phases","Legend:
Phase ... Major phases during the project, Employees names ... names of employees that are assigned to tasks related to the specific phase, Number of employees ... number of employees assigned to tasks related to the specific phase (total sum).

Description:
This table summarizes the employees (developers) assigned to specific testing phases in the project.",
"","","",'de',3137);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8067,"Priradenie ˙loh - Testovacie f·zy","
Legenda:
Phase ... HlavnÈ f·zy projektu, Employees names ... men· zamestnancov, ktorÌ s˙ priradenÌ s ohæadom na öpecifick˙ f·zu, Number of employees ... poËet zamestnancov priraden˝ch ˙loh·m s ohæadom na öpecifick˙ f·zu (celkov˝ poËet).

Popis:
T·to tabuæka sumarizuje zamestnancov (v˝voj·rov) priraden˝ch öpecifick˝m testovacÌm f·zam projektu.","","","",'sk',3137);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3757,"root",NULL,3137,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42882,"root",null,'en',3757);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43320,"root",null,'de',3757);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143320,"root",null,'sk',3757);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3758,"Tasks assignment - Test Phases",3757,3137,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42883,"Tasks assignment - Test Phases","Phase","en",3758);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43321,"Tasks assignment - Test Phases","Phase","de",3758);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143321,"Priradenie ˙loh - Testovacie f·zy","Phase","sk",3758);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3759,"Employees names",3758,3137,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3760,"Number of employees",3758,3137,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42908,"Employees names","","en",3759);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42909,"Number of employees","","en",3760);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3761,"Module test",3759,3137,3157,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3762,"Module test corr.",3761,3137,3161,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3763,"Total (MT)",3762,3137,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42884,"Module test","","en",3761);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42885,"Module test corr.","","en",3762);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42886,"Total (MT)","","en",3763);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3764,"Module test",3760,3137,3209,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3765,"Module test corr.",3764,3137,3213,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3766,"Total (MT)",3765,3137,3217,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42887,"Module test","","en",3764);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42888,"Module test corr.","","en",3765);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42889,"Total (MT)","","en",3766);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3767,"System test",3763,3137,3158,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3768,"System test corr.",3767,3137,3162,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3769,"Total (ST)",3768,3137,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42890,"System test","","en",3767);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42891,"System test corr.","","en",3768);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42892,"Total (ST)","","en",3769);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3770,"System test",3766,3137,3210,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3771,"System test corr.",3770,3137,3214,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3772,"Total (ST)",3771,3137,3218,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42893,"System test","","en",3770);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42894,"System test corr.","","en",3771);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42895,"Total (ST)","","en",3772);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3773,"Integration test",3769,3137,3159,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3774,"Integration test corr.",3773,3137,3163,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3775,"Total (IT)",3774,3137,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42896,"Integration test","","en",3773);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42897,"Integration test corr.","","en",3774);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42898,"Total (IT)","","en",3775);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3776,"Integration test",3772,3137,3211,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3777,"Integration test corr.",3776,3137,3215,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3778,"Total (IT)",3777,3137,3219,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42899,"Integration test","","en",3776);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42900,"Integration test corr.","","en",3777);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42901,"Total (IT)","","en",3778);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3779,"Acceptance test",3775,3137,3160,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3780,"Acceptance test corr.",3779,3137,3164,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3781,"Total (AT)",3780,3137,3188,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42902,"Acceptance test","","en",3779);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42903,"Acceptance test corr.","","en",3780);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42904,"Total (AT)","","en",3781);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3782,"Acceptance test",3778,3137,3212,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3783,"Acceptance test corr.",3782,3137,3216,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3784,"Total (AT)",3783,3137,3220,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42905,"Acceptance test","","en",3782);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42906,"Acceptance test corr.","","en",3783);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42907,"Total (AT)","","en",3784);

/* maier */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43322,"Employees names","","de",3759);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43323,"Number of employees","","de",3760);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43324,"Module test","","de",3761);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43325,"Module test corr.","","de",3762);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43326,"Total (MT)","","de",3763);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43327,"Module test","","de",3764);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43328,"Module test corr.","","de",3765);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43329,"Total (MT)","","de",3766);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43330,"System test","","de",3767);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43331,"System test corr.","","de",3768);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43332,"Total (ST)","","de",3769);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43333,"System test","","de",3770);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43334,"System test corr.","","de",3771);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43335,"Total (ST)","","de",3772);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43336,"Integration test","","de",3773);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43337,"Integration test corr.","","de",3774);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43338,"Total (IT)","","de",3775);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43339,"Integration test","","de",3776);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43340,"Integration test corr.","","de",3777);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43341,"Total (IT)","","de",3778);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43342,"Acceptance test","","de",3779);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43343,"Acceptance test corr.","","de",3780);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43344,"Total (AT)","","de",3781);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43345,"Acceptance test","","de",3782);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43346,"Acceptance test corr.","","de",3783);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43347,"Total (AT)","","de",3784);

/* daÚo */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143322,"Employees names","","sk",3759);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143323,"Number of employees","","sk",3760);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143324,"Module test","","sk",3761);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143325,"Module test corr.","","sk",3762);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143326,"Total (MT)","","sk",3763);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143327,"Module test","","sk",3764);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143328,"Module test corr.","","sk",3765);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143329,"Total (MT)","","sk",3766);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143330,"System test","","sk",3767);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143331,"System test corr.","","sk",3768);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143332,"Total (ST)","","sk",3769);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143333,"System test","","sk",3770);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143334,"System test corr.","","sk",3771);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143335,"Total (ST)","","sk",3772);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143336,"Integration test","","sk",3773);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143337,"Integration test corr.","","sk",3774);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143338,"Total (IT)","","sk",3775);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143339,"Integration test","","sk",3776);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143340,"Integration test corr.","","sk",3777);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143341,"Total (IT)","","sk",3778);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143342,"Acceptance test","","sk",3779);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143343,"Acceptance test corr.","","sk",3780);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143344,"Total (AT)","","sk",3781);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143345,"Acceptance test","","sk",3782);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143346,"Acceptance test corr.","","sk",3783);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143347,"Total (AT)","","sk",3784);

/**********************************/
/*    Employees per phase                */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(428,"Employees per phase",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1256,"Employees per phase",'en',428);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1257,"Employees per phase","de",428);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1257,"Zamestnanci na f·zu","sk",428);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3127,"Employees per phase",1,"V",NULL,428);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (854,"Employees per phase","
Legend:
SP ... specification phase, SD ... system design phase, MD ... module design phase, CD ... coding phase, MN ... manual/documentation preparation, MT ... module test phase, ST ... system test phase, IT ... integration test phase, AT ... acceptance test.

Description:
This chart visualizes how many persons were involved in the related phases (excluding review activities).

Explanation/Recommendations:
For this type of project it is sufficient to start with 1-2 persons (due to the communication overhead) in the specification phase, and to deploy 2-3 employees during design and coding phases.","Employees per phase","Phase","Number",'en',3127);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (855,"Employees pro phase","Legende:
SP ... Specifikationsphase, SD ... Systemdesignphase, MD ... Moduledesignphase, CD ... Implementierungsphase, MN ... Handbuch-/Dokumentationserstellung, MT ... Moduletestphase, ST ... Systemtestphase, IT ... Integrationstestphase, AT ... Abnahmetest.

Beschreibung:
Diese Graphik zeigt, wieviele Personen in der jeweiligen Phase involviert waren (ausgenommen in Reviewaktivit‰ten).

Erkl‰rung/Empfehlungen:
F¸r diese Art von Projekt ist es ausreichend, mit 1-2 Personen (wegen des Kommunikations-Overheads) in der Spezifikationsphase zu beginnen, und 2-3 Angestellte w‰hrend der Design- und Kodierungsphase einzusetzen.",
"Employees pro phase","Phase","Number","de",3127);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8054,"Zamestnanci na f·zu","
Legenda:
SP ... f·za öpecifik·cie, SD ... f·za n·vrhu systÈmu, MD ... f·za n·vrhu modulov, CD ... f·za implement·cie, MN ... prÌprava manu·lov/dokument·cie, MT ... f·za testovania modulov, ST ... f·za testovania systÈmu, IT ... f·za testovania integr·cie, AT ... akceptaËnÈ testovanie.

Popis:
Tento diagram vizualizuje, koæko osÙb bolo zapojen˝ch do v˝voja v prÌsluön˝ch f·zach (okrem aktivÌt posudzovania).

Vysvetlenie/Odpor˙Ëania:
Pre tento typ projektu je postaËuj˙ce zaËaù s 1-2 osobami (kvÙli komunikaËnej rÈûii) vo f·ze öpecifik·cie, 2-3 zamestnancami poËas n·vrhu a implement·cie.","Employees per phase","Phase","Number","sk",3127);



INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3535,"Specification",null,3127,3189,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42671,"Specification","SP","en",3535);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42672,"Specification","SP","de",3535);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142672,"Specification","SP","sk",3535);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3536,"System design",3535,3127,3190,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42673,"System design","SD","en",3536);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42664,"System design","SD","de",3536);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142664,"System design","SD","sk",3536);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3537,"Module design",3536,3127,3191,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42665,"Module design","MD","en",3537);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42666,"Module design","MD","de",3537);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142666,"Module design","MD","sk",3537);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3538,"Code",3537,3127,3192,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42667,"Code","CD","en",3538);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42668,"Code","CD","de",3538);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142668,"Code","CD","sk",3538);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3539,"Manual",3538,3127,3193,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42669,"Manual","MN","en",3539);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42670,"Manual","MN","de",3539);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142670,"Manual","MN","sk",3539);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3654,"MT",3539,3127,3217,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42791,"Module test","MT","en",3654);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72791,"Modultest","MT","de",3654);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172791,"Modultest","MT","sk",3654);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3655,"ST",3654,3127,3218,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42792,"System test","ST","en",3655);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72792,"Systemtest","ST","de",3655);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172792,"Systemtest","ST","sk",3655);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3656,"IT",3655,3127,3219,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42793,"Integration test","IT","en",3656);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72793,"Integrationstest","IT","de",3656);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172793,"Integrationstest","IT","sk",3656);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3657,"AT",3656,3127,3220,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42794,"Acceptance test","AT","en",3657);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72794,"Akzeptanztest","AT","de",3657);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172794,"Acceptance test","AT","sk",3657);

/**********************************/
/*   Employees per review phase         */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(441,"Employees per review phase",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1272,"Employees per review phase",'en',441);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1273,"Employees per review phase","de",441);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5273,"Zamestnanci pripadaj˙ci na f·zu posudzovania","sk",441);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3140,"Employees per review phase",1,"V",NULL,441);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (870,"Employees per review phase","
Legend:
SP ... specification review phase, SD ... system design review phase, MD ... module design review phase, CD ...coding review, MN ... manual/documentation review.

Description:
This chart visualizes how many persons were involved in the review of the specific documents (excluding the customer).

Explanation/Recommendations:
Typically, the author of a document should not be part of the review team.","Employees per review phase","Phase","Number",'en',3140);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (871,"Employees pro Review-Phase","Legende:
SP ... Spezifikationsreviewphase, SD ... Systemdesignreviewphase, MD ... Moduldesignreviewphase, CD ... Codereview, MN ... Handbuch-/Dokumentationsreview.

Beschreibung:
Diese Graphik zeigt, wieviele Personen beim Review des jeweiligen Dokuments beteiligt waren (ausgenommen der Kunde).

Erkl‰rung/Empfehlungen:
Typischerweise sollte der Autor des jeweiligen Dokuments nicht Teil des Reviewteams sein.
","Employees pro Review-Phase","Phase","Anzahl",'de',3140);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8070,"Zamestnanci pripadaj˙ci na f·zu posudzovania","
Legenda:
SP ... f·za posudzovania öpecifik·cie, SD ... f·za posudzovania n·vrhu systÈmu, MD ... f·za posudzovania n·vrhu modulov, CD ... posudzovanie kÛdu, MN ... posudzovanie manu·lov/dokument·cie.

Popis:
Tento diagram vizualizuje, koæko osÙb bolo zaËlenen˝ch do posudzovania öpecifick˝ch dokumentov (okrem z·kaznÌka).

Vysvetlenie/Odpor˙Ëania:
Typicky, autor dokumentu by nemal byù s˙Ëasùou posudzuj˙ceho tÌmu.",
"Zamestnanci pripadaj˙ci na f·zu posudzovania","F·za","»Ìslo",'sk',3140);


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3801,"Specification rev.",null,3140,3194,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42923,"Specification rev.","SP","en",3801);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72923,"Spezificationsrev.","SP","de",3801);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172923,"Posudz. öpecifik·cie","Pä","sk",3801);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3802,"System design rev.",3801,3140,3195,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42924,"System design rev.","SD","en",3802);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72924,"Systemdesignrev.","SD","de",3802);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172924,"Posudz. n·vrhu syst.","PNS","sk",3802);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3803,"Module design",3802,3140,3196,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42925,"Module design","MD","en",3803);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72925,"Moduldesign","MD","de",3803);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172925,"Posudz. n·vrhu mod.","PNM","sk",3803);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3804,"Code",3803,3140,3197,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42926,"Code","CD","en",3804);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72926,"Code","CD","de",3804);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172926,"Posudz. kÛdu","PK","sk",3804);

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (3805,"Manual",3804,3140,3198,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42927,"Manual","MN","en",3805);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72927,"Manual","MN","de",3805);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (172927,"Manu·ly/PrÌruËky","M/P","sk",3805);

/**********************************/
/*   System and module design          */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(434,"System and module design",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1265,"System and module design","en",434);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1277,"System and module design","de",434);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5277,"N·vrh systÈmu a modulov","sk",434);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3133,"System and module design",1,"G",NULL,434);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (863,"System and module design","Legend:
SD ... system design (begin-end, author(s)), SDRev ... system design review (begin-end, author(s)), SDCorr ... system design correction (begin-end, author(s)).
MD ... module design phase (begin-end, author(s)), MDRev ... module design review (begin-end, author(s)), MDCorr ... module design correction (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the author(s) of documents and the member(s) of the review/correction team(s) used in the system and module design phase.

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts.","System and module design","Date","Phase","en",3133);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (864,"System and module design","Legende:
SD ... Systemdesign (Anfang-Ende, Autor(en)), SDRev ... Systemdesignreview (Anfang-Ende, Autor(en)), SDCorr ... Systemdesignkorrektur (Anfang-Ende, Autor(en)), MD ... Moduldesignphase (Anfang-Ende, Autor(en)), MDRev ... Moduldesignreview (Anfang-Ende, Autor(en)), MDCorr ... Moduldesignkorrektur (Anfang-Ende, Autor(en)).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt den/die Autor(en) von Dokumenten und die Mitglieder der Review-/Korrekturteams, die in der System- und Moduldesignphase eingesetzt wurden.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber auch zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"System and module design","Date","Phase","de",3133);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8064,"N·vrh systÈmu a modulov","Legenda:
SD ... n·vrh systÈmu (zaËiatok-koniec, author(i)), SDRev ... posudzovanie n·vrhu systÈmu (zaËiatok-koniec, author(i)), SDCorr ... oprava n·vrhu systÈmu (zaËiatok-koniec, author(i)).
MD ... f·za n·vrhu modulov (zaËiatok-koniec, author(i)), MDRev ... posudzovanie n·vrhu modulov (zaËiatok-koniec, author(i)), MDCorr ... oprava n·vrhu modulov (zaËiatok-koniec, author(i)).
Rozhodnutia projektovho manaûÈra a prÌkazy neved˙ce k aktivite s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje autora/autorov dokumentov a Ëlena/Ëlenov posudzuj˙ceho/opravuj˙ceho tÌmu/tÌmov vo f·ze n·vrhu modulov.

Vysvetlenie/Odpor˙Ëania:
»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.",
"System and module design","Date","Phase","sk",3133);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3658,"root",NULL,3133,null,NULL);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3659,"Module design corrections",3658,3133,2861,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3660,"Module design review",3658,3133,2860,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3661,"Module design",3658,3133,2859,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3662,"System design corrections",3658,3133,2851,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3663,"System design review",3658,3133,2850,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3664,"System design",3658,3133,2849,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42795,"System design corrections","SDCor","en",3662);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42796,"System design review","SDRev","en",3663);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42797,"System design","SD","en",3664);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42798,"Module design corrections","MDCor","en",3659);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42799,"Module design review","MDRev","en",3660);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42800,"Module design","MD","en",3661);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43348,"System design corrections","SDCor","de",3662);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43349,"System design review","SDRev","de",3663);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43350,"System design","SD","de",3664);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43351,"Module design corrections","MDCor","de",3659);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43352,"Module design review","MDRev","de",3660);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43353,"Module design","MD","de",3661);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143348,"System design corrections","SDCor","sk",3662);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143349,"System design review","SDRev","sk",3663);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143350,"System design","SD","sk",3664);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143351,"Module design corrections","MDCor","sk",3659);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143352,"Module design review","MDRev","sk",3660);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143353,"Module design","MD","sk",3661);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3665,"System design",3664,3133,2856,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3666,"System design review",3663,3133,2857,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3667,"System design corrections",3662,3133,2858,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3668,"Module design corrections",3659,3133,2867,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3669,"Module design review",3660,3133,2866,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3670,"Module design",3661,3133,2865,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42801,"System design","SD","en",3665);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42802,"System design review","SDRev","en",3666);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42803,"System design corrections","SDCor","en",3667);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42804,"Module design corrections","MDCer","en",3668);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42805,"Module design review","MDRev","en",3669);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42806,"Module design","MD","en",3670);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43354,"System design","SD","de",3665);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43355,"System design review","SDRev","de",3666);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43356,"System design corrections","SDCor","de",3667);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43357,"Module design corrections","MDCer","de",3668);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43358,"Module design review","MDRev","de",3669);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43359,"Module design","MD","de",3670);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143354,"System design","SD","sk",3665);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143355,"System design review","SDRev","sk",3666);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143356,"System design corrections","SDCor","sk",3667);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143357,"Module design corrections","MDCer","sk",3668);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143358,"Module design review","MDRev","sk",3669);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143359,"Module design","MD","sk",3670);



/**********************************/
/*    Coding and testing phase           */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(361,"Coding and Testing",NULL,1,1);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES (1120,"Coding and Testing","en",361);

/* maier */
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES (1121,"Coding and Testing","de",361);*/

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3001,"Coding and Testing",1,"G",NULL,361);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (757,"Coding and Testing","
Legend:
CD ... coding (begin-end, author(s)), CDRev ... code review (begin-end, author(s)), CDCorr ... code correction (begin-end, author(s)).
MT ... module test (begin-end, author(s)), MTCorr ... corrections (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the author(s) of the code and the member(s) of the review/correction team(s) used in the coding and testing phase.

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts. ","Testing activity","Date","Phase","en",3001);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (758,"Coding and Testing phase","Legende:
CD ... Implementierung (Anfang-Ende, Autor(en)), CDRev ... Codereview (Anfang-Ende, Autor(en)), CDCorr ... Codekorrektur (Anfang-Ende, Autor(en)). MT ... Modultest (Anfang-Ende, Autor(en)), MTCorr ... Korrekturen (Anfang-Ende, Autor(en)). Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt den/die Autor(en) des Codes und die Mitglieder der Review-/Korrekturteams, die w‰hrend der Implementierungs- bzw. Testphase zum Einsatz kamen.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"Testing activity","Date","Phase","de",3001);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (7057,"Implement·cia a testovanie","
Legenda:
CD ... implement·cia (zaËiatok-koniec, author(i)), CDRev ... posudzovanie kÛdu (zaËiatok-koniec, author(i)), CDCorr ... korekcia kÛdu (zaËiatok-koniec, author(i)).
MT ... testovanie modulov (zaËiatok-koniec, author(i)), MTCorr ... opravy (zaËiatok-koniec, author(i)).

Rozhodnutia projektovÈho manaûÈra a prÌkazy neved˙ce k aktivit·m s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje autora/autorov kÛdu a Ëlena/Ëlenov posudzuj˙ceho/opravuj˙ceho tÌmu/tÌmov pouûitÈho/pouûit˝ch v implementaËnej a testovacej f·ze.

Vysvetlenie/Odpor˙Ëania:

»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.",
"Testing activity","Date","Phase","sk",3001);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3022,"root",NULL,3001,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2831,"Mtests corrections",
'select distinct "MTEST COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MTEST COR" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2835,"Mtests corrections",
'SELECT command, s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success
FROM s_relation, zarmstype, turn
WHERE zarmstype.zid = s_relation.zid AND turn.tnid = s_relation.tnid
AND (zarmstype.z_type="KORRIGIERT" AND document = "Code") AND s_relation.gid=%game
AND
s_relation.starting_date >= (select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
AND DATE_ADD(s_relation.completion_date, INTERVAL -2 DAY) <=
(select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "MTEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1)
ORDER BY s_relation.starting_date',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2832,"Itests corrections",
'select distinct "ITEST COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "ITEST COR" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2836,"Itests corrections",
'SELECT command, s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success
FROM s_relation, zarmstype, turn
WHERE zarmstype.zid = s_relation.zid AND turn.tnid = s_relation.tnid
AND (zarmstype.z_type="KORRIGIERT" AND document = "Code") AND s_relation.gid=%game
AND
s_relation.starting_date >= (select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
AND DATE_ADD(s_relation.completion_date, INTERVAL -2 DAY) <=
(select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ITEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2833,"Stests corrections",
'select distinct "STEST COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "STEST COR" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (2837,"Stests corrections",
'SELECT command, s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success
FROM s_relation, zarmstype, turn
WHERE zarmstype.zid = s_relation.zid AND turn.tnid = s_relation.tnid
AND (zarmstype.z_type="KORRIGIERT" AND document = "Code") AND s_relation.gid=%game
AND
s_relation.starting_date >= (select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
AND DATE_ADD(s_relation.completion_date, INTERVAL -2 DAY) <=
(select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "STEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
ORDER BY s_relation.starting_date;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2834,"Atests corrections",
'select distinct "ATEST COR" as description, max(s_entity.value) as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "ATEST COR" as description, max(s_entity.value)
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (2838,"Atests corrections",
'SELECT command, s_relation.tnid, zarmstype.z_type, s_relation.person, s_relation.document,
s_relation.reference_doc, s_relation.starting_date,
s_relation.completion_date, s_relation.success
FROM s_relation, zarmstype, turn
WHERE zarmstype.zid = s_relation.zid AND turn.tnid = s_relation.tnid
AND (zarmstype.z_type="KORRIGIERT" AND document = "Code") AND s_relation.gid=%game
AND
s_relation.starting_date >= (select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
AND DATE_ADD(s_relation.completion_date, INTERVAL -2 DAY) <=
(select distinct DATE_FORMAT(max(s_entity.value), "%Y-%m-%d") as date
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "TESTLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Testlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "ATEST_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )
ORDER BY s_relation.starting_date;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3671,"Code corrections",3022,3001,2864,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3673,"Code review",3022,3001,2863,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3674,"Code",3022,3001,2862,NULL);
/*INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3136,"Module test corrections",3022,3001,2831,NULL);*/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3137,"Module test",3022,3001,2710,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41018,"Module test","MT","en",3137);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42065,"Module test corrections","MTCorr","en",3136);*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42807,"Code corrections","CDCorr","en",3671);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42809,"Code review","CDrev","en",3673);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42810,"Code","CD","en",3674);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43360,"Module test","MT","de",3137);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43361,"Module test corrections","MTCorr","de",3136);*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43362,"Code corrections","CDCorr","de",3671);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43363,"Code review","CDrev","de",3673);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43364,"Code","CD","de",3674);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143360,"Module test","MT","sk",3137);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143361,"Module test corrections","MTCorr","sk",3136);*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143362,"Code corrections","CDCorr","sk",3671);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143363,"Code review","CDrev","sk",3673);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143364,"Code","CD","sk",3674);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3672,"Code corrections",3671,3001,2870,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3675,"Code review",3673,3001,2869,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3676,"Code",3674,3001,2868,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3023,"Module test",3137,3001,2711,NULL);
/*INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3138,"Module test corrections",3136,3001,2835,NULL);*/

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42808,"Code","CDCorr","en",3672);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42811,"Code review","CDRev","en",3675);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42812,"Code","CD","en",3676);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41022,"Module test","MT","en",3023);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42069,"Module test corrections","MT","en",3138);*/

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43365,"Code","CDCorr","de",3672);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43366,"Code review","CDRev","de",3675);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43367,"Code","CD","de",3676);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43368,"Module test","MT","de",3023);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43369,"Module test corrections","MT","de",3138);*/

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143365,"Code","CDCorr","sk",3672);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143366,"Code review","CDRev","sk",3675);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143367,"Code","CD","sk",3676);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143368,"Module test","MT","sk",3023);
/*INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43369,"Module test corrections","MT","sk",3138);*/


/**********************************/
/*    Test phase                        */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(440,"Testing phases",NULL,1,1);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1271,"Testing phases","en",440);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1278,"Testing phases","de",440);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5278,"Testovacia f·za","sk",440);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3139,"Testing phases",1,"G",NULL,440);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (872,"Testing phases","
Legend:
ST ... system test phase (begin-end, author(s)), STCorr ... correction (begin-end, author(s)), AT ... acceptance test (begin-end, author(s)), ATCorr ... corrections (begin-end, author(s)).
Project manager decisions and commands that led to zero activities are marked by a small black triangle.

Description:
This chart visualizes the member(s) of the review/correction team(s) used in the test and correction phase.

Explanation/Recommendation:
The more the project is following the Waterfall model, the more likely it is that succeeding phases are based on tested and finalized artifacts of previous phases. However, in order to save time it is possible to overlap the phases, which then means that one needs more effort to ensure consistency between the different artifacts.","Testing activity","Date","Phase","en",3139);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (873,"Testing phase","Legende:
ST ... Systemtestphase (Anfang-Ende, Autor(en)), STCorr ... Korrektur (Anfang-Ende, Autor(en)), AT ... Abnahmetest (Anfang-Ende, Autor(en)), ATCorr ... Korrektur (Anfang-Ende, Autor(en)).
Entscheidungen und Anweisungen des Projektmanagers, die zu keinen Aktivit‰ten f¸hrten, sind durch kleine schwarze Dreiecke gekennzeichnet.

Beschreibung:
Diese Graphik zeigt die Mitglieder der Review-/Korrekturteams, die in der Test- und Korrekturphase eingesetzt wurden.

Erkl‰rung/Empfehlungen:
Je mehr das Projekt dem Wasserfallmodell folgt, desto eher basieren nachfolgende Phasen auf getesteten und finalisierten Zwischenprodukten fr¸herer Phasen. Das ‹berlappen von Phasen spart Zeit, was aber auch zu mehr Aufwand f¸hrt, um die Konsistenz zwischen den verschiedenen Zwischenprodukten sicherzustellen.",
"Testing activity","Date","Phase","de",3139);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8072,"Testovacia f·za","
Legenda:
ST ... f·za testovania systÈmu (zaËiatok-koniec, author(i)), STCorr ... korekcia systÈmu(zaËiatok-koniec, author(i)), AT ... akceptaËn˝ test (zaËiatok-koniec, author(i)), ATCorr ... korekcia pre potreby akcept·cie (zaËiatok-koniec, author(i)).
Rozhodnutia projektovÈho manaûÈra a prÌkazy neved˙ce k aktivit·m s˙ oznaËenÈ mal˝m Ëiernym trojuholnÌkom.

Popis:
Tento diagram vizualizuje Ëlena/Ëlenov posudzuj˙ceho/opravuj˙ceho tÌmu/tÌmov nasadenÈho/nasaden˝ch vo f·ze testovania a opr·v.

Vysvetlenie/Odpor˙Ëania:

»Ìm viac sa projekt drûÌ vodop·dovÈho modelu, t˝m viac je cÌtiù, ûe f·zy, ktorÈ nasleduj˙, s˙ zaloûenÈ na otestovan˝ch a sfinalizovan˝ch artefaktoch predch·dzaj˙cich f·z. Akokoævek, s cieæom uöetriù Ëas je moûnÈ prekr˝vaù f·zy, Ëo znamen·, ûe je potrebnÈ ˙silie na zaistenie konzistencie medzi artefaktmi.",
"Testing activity","Date","Phase","sk",3139);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3798,"root",NULL,3139,null,NULL);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3018,"Atests corrections",3798,3139,2834,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3019,"Acceptance tests",3798,3139,2716,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3020,"Stests corrections",3798,3139,2833,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3021,"System tests",3798,3139,2714,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3134,"Itests corrections",3798,3139,2832,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3135,"Integration tests",3798,3139,2712,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41019,"Integration tests","IT","en",3135);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41020,"System tests","ST","en",3021);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41021,"Acceptance tests","AT","en",3019);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42066,"Itests corrections","ITCorr","en",3134);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42067,"Stests corrections","STCorr","en",3020);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42068,"Atests corrections","ATCorr","en",3018);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43370,"Integration tests","IT","de",3135);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43371,"System tests","ST","de",3021);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43372,"Acceptance tests","AT","de",3019);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43373,"Itests corrections","ITCorr","de",3134);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43374,"Stests corrections","STCorr","de",3020);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43375,"Atests corrections","ATCorr","de",3018);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143370,"Integration tests","IT","sk",3135);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143371,"System tests","ST","sk",3021);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143372,"Acceptance tests","AT","sk",3019);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143373,"Itests corrections","ITCorr","sk",3134);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143374,"Stests corrections","STCorr","sk",3020);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143375,"Atests corrections","ATCorr","sk",3018);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3024,"Integration tests",3135,3139,2713,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3025,"System tests",3021,3139,2715,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3026,"Acceptance tests",3019,3139,2717,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3139,"Itests corrections",3134,3139,2836,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3140,"Stests corrections",3020,3139,2837,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3141,"Atests corrections",3018,3139,2838,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41023,"Integration tests","IT","en",3024);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41024,"System tests","ST","en",3025);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (41025,"Acceptance tests","AT","en",3026);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42070,"Itests corrections","ITCorr","en",3139);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42071,"Stests corrections","STCorr","en",3140);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42072,"Atests corrections","ATCorr","en",3141);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43376,"Integration tests","IT","de",3024);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43377,"System tests","ST","de",3025);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43378,"Acceptance tests","AT","de",3026);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43379,"Itests corrections","ITCorr","de",3139);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43380,"Stests corrections","STCorr","de",3140);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43381,"Atests corrections","ATCorr","de",3141);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143376,"Integration tests","IT","sk",3024);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143377,"System tests","ST","sk",3025);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143378,"Acceptance tests","AT","sk",3026);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143379,"Itests corrections","ITCorr","sk",3139);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143380,"Stests corrections","STCorr","sk",3140);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143381,"Atests corrections","ATCorr","sk",3141);


/**********************************/
/*    Review information                */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(422,"Review info",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1244,"Review info",'en',422);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1245,"Review info","de",422);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5245,"Review info","sk",422);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3121,"Review info",0,"T",NULL,422);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (842,"Review info","
Legend:
Length ... duration for activity (in days), Effort ... effort for activity (in hours), Corr ... effort to correct (in hours), Det. errors ... number of errors detected (total), Err. in docs ... remaining errors in documents, Reviews ... number of reviews of the document (total), Corr.total number ... number of correction activities (total).

Description:
This table summarizes the effort spent on the review activities for several documents.

Explanation/Recommendation:
Reviews are essential for preserving the quality of the documents. The more time one invests in the quality of the basic documents (specification, design) the better the quality of the succeeding documents. ","","","",'en',3121);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (843,"Review info","Legende:
Length ... Dauer der Aktivit‰t (in Tagen), Effort ... Aufwand f¸r Aktivit‰t (in Stunden), Corr ... Aufwand f¸r Korrektur (in Stunden), Det. errors ... gefundene Fehler (Gesamtanzahl), Err. in docs ... in Dokumenten verbleibende Fehler, Reviews ... Anzahl Reviews in einem Dokument (Gesamtanzahl), Corr. total number ... Anzahl Korrekturaktivit‰ten (Gesamtanzahl).

Beschreibung:
Diese Tabelle faﬂt den Aufwand zusammen, der f¸r Reviewaktivit‰ten f¸r mehrere Dokumente erbracht wurde.

Erkl‰rung/Empfehlungen:
Reviews sind f¸r die Aufrechterhaltung der Qualit‰t der Dokumente entscheidend. Je mehr Zeit in die Qualit‰t der Basisdokumente (Spezifikation, Design) investiert wird, desto besser wird die Qualit‰t der nachfolgenden Dokumente.",
"","","","de",3121);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8042,"Info ohæadom posudzovania","
Legenda:
Length ... trvanie aktivity (v dÚoch), Effort ... ˙silie vynaloûenÈ na aktivitu (v dÚoch), Corr ... ˙silie vynaloûenÈ na opravy (v hodin·ch), Det. errors ... poËet odhalen˝ch ch˝b (dokopy), Err. in docs ... ost·vaj˙ce chyby v dokumentoch, Reviews ... poËet posudkov dokumentu (dokopy), Corr.total number ... poËet aktivÌt spojen˝ch s opravami (dokopy).

Popis:
T·to tabuæka sumarizuje ˙silie vynaloûenÈ na posudzovacie aktivity niekoæk˝ch dokumentov.

Vysvetlenie/Odpor˙Ëania:
Posudky s˙ z·kladom pre udrûanie kvality dokumentov. »Ìm viac Ëasu sa investuje do kvality z·kladn˝ch dokumentov (öpecifik·cia, dizajn), t˝m je lepöia kvalita dokumentov, ktorÈ nasleduj˙. ","","","","sk",3121);



INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3420,"root",NULL,3121,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42538,"root",null,'en',3420);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43382,"root",null,'de',3420);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143382,"root",null,'sk',3420);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3421,"Review information",3420,3121,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42539,"Review information","","en",3421);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43383,"Review information","","de",3421);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143383,"Review information","","sk",3421);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3422,"Spec.",3421,3121,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3423,"Sys.Design",3421,3121,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3424,"Mod.Design",3421,3121,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3425,"Code",3421,3121,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3426,"Manual",3421,3121,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42540,"Spec.","SP","en",3422);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42541,"Sys.Design","DE","en",3423);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42542,"Mod.Design","MS","en",3424);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42543,"Code","CD","en",3425);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42544,"Manual","MA","en",3426);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43384,"Spec.","SP","de",3422);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43385,"Sys.Design","DE","de",3423);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43386,"Mod.Design","MS","de",3424);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43387,"Code","CD","de",3425);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43388,"Manual","MA","de",3426);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143384,"Spec.","SP","sk",3422);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143385,"Sys.Design","DE","sk",3423);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143386,"Mod.Design","MS","sk",3424);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143387,"Code","CD","sk",3425);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143388,"Manual","MA","sk",3426);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3069,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SPEZIFIKATION_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SPEZIFIKATION_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3070,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ENTWURF_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ENTWURF_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3071,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MODSPEZ_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MODSPEZ_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3072,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CODE_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CODE_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3073,"Length",
'select distinct datediff(
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HANDBUCH_ENDE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),
(select distinct max(date_format(s_entity.value, "%y-%m-%d"))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HANDBUCH_BEGINN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value from s_entity;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3074,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3075,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3076,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3077,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3078,"Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3079,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3080,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3081,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3082,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3083,"Corr. Effort",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3084,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3085,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3086,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3087,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3088,"Det. Errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3089,"Errors in docs",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3090,"Errors in docs",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3091,"Errors in docs",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3092,"Errors in docs",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3093,"Errors in docs",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',null);


INSERT INTO query(qid,attribute,statement,z_path) VALUES (3221,"rev number",
'select DISTINCT (s_entity.value)-1 as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Specificationreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "NUMMER" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid =  %game AND LOCATE(s_entity.path, \"%path\")=1
order by s_entity.tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3222,"rev number",
'select DISTINCT (s_entity.value)-1 as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Systemdesignreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "NUMMER" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid =  %game AND LOCATE(s_entity.path, \"%path\")=1
order by s_entity.tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3223,"rev number",
'select DISTINCT (s_entity.value)-1 as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Moduledesignreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "NUMMER" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid =  %game AND LOCATE(s_entity.path, \"%path\")=1
order by s_entity.tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3224,"rev number",
'select DISTINCT (s_entity.value)-1 as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "CODEREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Codereviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "NUMMER" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid =  %game AND LOCATE(s_entity.path, \"%path\")=1
order by s_entity.tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3225,"rev number",
'select DISTINCT (s_entity.value)-1 as value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Manualsreviewreport" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "NUMMER" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid =  %game AND LOCATE(s_entity.path, \"%path\")=1
order by s_entity.tnid desc limit 1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3226,"cor number",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "spezifikation")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "spezifikation")) AND s_relation.gid=%game and success = 1 AND LOCATE(s_relation.path, \"%path\")=1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3227,"cor number",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "systemdesign")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "systemdesign")) AND s_relation.gid=%game and success = 1 AND LOCATE(s_relation.path, \"%path\")=1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3228,"cor number",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "moduldesign")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "moduldesign")) AND s_relation.gid=%game and success = 1 AND LOCATE(s_relation.path, \"%path\")=1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3229,"cor number",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "code")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "code")) AND s_relation.gid=%game and success = 1 AND LOCATE(s_relation.path, \"%path\")=1)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3230,"cor number",
'select count(*) as value from
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "manual")) AND s_relation.gid=%game and success = 1
and date_add(s_relation.starting_date, interval 1 day)
AND LOCATE(s_relation.path, \"%path\")=1
not in
(SELECT distinct s_relation.starting_date FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "manual")) AND s_relation.gid=%game and success = 1 AND LOCATE(s_relation.path, \"%path\")=1)) as value;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3427,"Duration (d)",3422,3121,3069,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3428,"Duration (d)",3423,3121,3070,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3429,"Duration (d)",3424,3121,3071,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3430,"Duration (d)",3425,3121,3072,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3431,"Duration (d)",3426,3121,3073,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42545,"Length (d)","LE","en",3427);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42546,"Length (d)","LE","en",3428);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42547,"Length (d)","LE","en",3429);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42548,"Length (d)","LE","en",3430);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42549,"Length (d)","LE","en",3431);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3432,"Effort (h)",3427,3121,3074,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3433,"Effort (h)",3428,3121,3075,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3434,"Effort (h)",3429,3121,3076,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3435,"Effort (h)",3430,3121,3077,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3436,"Effort (h)",3431,3121,3078,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42550,"Effort (h)","EF","en",3432);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42551,"Effort (h)","EF","en",3433);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42552,"Effort (h)","EF","en",3434);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42553,"Effort (h)","EF","en",3435);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42554,"Effort (h)","EF","en",3436);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3437,"Corr.eff.(h)",3432,3121,3079,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3438,"Corr.eff.(h)",3433,3121,3080,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3439,"Corr.eff.(h)",3434,3121,3081,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3440,"Corr.eff.(h)",3435,3121,3082,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3441,"Corr.eff.(h)",3436,3121,3083,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42555,"Corr. (h)","CE","en",3437);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42556,"Corr. (h)","CE","en",3438);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42557,"Corr. (h)","CE","en",3439);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42558,"Corr. (h)","CE","en",3440);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42559,"Corr. (h)","CE","en",3441);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3442,"Det. errors",3437,3121,3084,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3443,"Det. errors",3438,3121,3085,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3444,"Det. errors",3439,3121,3086,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3445,"Det. errors",3440,3121,3087,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3446,"Det. errors",3441,3121,3088,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42560,"Det. errors","DE","en",3442);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42561,"Det. errors","DE","en",3443);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42562,"Det. errors","DE","en",3444);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42563,"Det. errors","DE","en",3445);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42564,"Det. errors","DE","en",3446);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3447,"Err. in docs",3442,3121,3089,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3448,"Err. in docs",3443,3121,3090,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3449,"Err. in docs",3444,3121,3091,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3450,"Err. in docs",3445,3121,3092,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3451,"Err. in docs",3446,3121,3093,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42565,"Err. in docs","ED","en",3447);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42566,"Err. in docs","ED","en",3448);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42567,"Err. in docs","ED","en",3449);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42568,"Err. in docs","ED","en",3450);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42569,"Err. in docs","ED","en",3451);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3677,"Reviews",3447,3121,3221,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3678,"Reviews",3448,3121,3222,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3679,"Reviews",3449,3121,3223,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3680,"Reviews",3450,3121,3224,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3681,"Reviews",3451,3121,3225,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42570,"Reviews","","en",3677);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42571,"Reviews","","en",3678);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42572,"Reviews","","en",3679);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42573,"Reviews","","en",3680);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42574,"Reviews","","en",3681);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3682,"Corr. total",3677,3121,3226,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3683,"Corr. total",3678,3121,3227,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3684,"Corr. total",3679,3121,3228,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3685,"Corr. total",3680,3121,3229,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3686,"Corr. total",3681,3121,3230,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42575,"Corr.total","","en",3682);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42576,"Corr.total","","en",3683);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42577,"Corr.total","","en",3684);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42578,"Corr.total","","en",3685);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42579,"Corr.total","","en",3686);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43389,"Length (d)","LE","de",3427);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43390,"Length (d)","LE","de",3428);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43391,"Length (d)","LE","de",3429);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43392,"Length (d)","LE","de",3430);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43393,"Length (d)","LE","de",3431);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43394,"Effort (h)","EF","de",3432);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43395,"Effort (h)","EF","de",3433);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43396,"Effort (h)","EF","de",3434);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43397,"Effort (h)","EF","de",3435);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43398,"Effort (h)","EF","de",3436);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43399,"Corr. (h)","CE","de",3437);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43400,"Corr. (h)","CE","de",3438);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43401,"Corr. (h)","CE","de",3439);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43402,"Corr. (h)","CE","de",3440);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43403,"Corr. (h)","CE","de",3441);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43404,"Det. errors","DE","de",3442);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43405,"Det. errors","DE","de",3443);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43406,"Det. errors","DE","de",3444);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43407,"Det. errors","DE","de",3445);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43408,"Det. errors","DE","de",3446);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43409,"Err. in docs","ED","de",3447);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43410,"Err. in docs","ED","de",3448);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43411,"Err. in docs","ED","de",3449);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43412,"Err. in docs","ED","de",3450);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43413,"Err. in docs","ED","de",3451);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43414,"Reviews","","de",3677);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43415,"Reviews","","de",3678);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43416,"Reviews","","de",3679);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43417,"Reviews","","de",3680);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43418,"Reviews","","de",3681);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43419,"Corr.total","","de",3682);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43420,"Corr.total","","de",3683);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43421,"Corr.total","","de",3684);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43422,"Corr.total","","de",3685);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43423,"Corr.total","","de",3686);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143389,"Length (d)","LE","sk",3427);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143390,"Length (d)","LE","sk",3428);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143391,"Length (d)","LE","sk",3429);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143392,"Length (d)","LE","sk",3430);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143393,"Length (d)","LE","sk",3431);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143394,"Effort (h)","EF","sk",3432);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143395,"Effort (h)","EF","sk",3433);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143396,"Effort (h)","EF","sk",3434);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143397,"Effort (h)","EF","sk",3435);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143398,"Effort (h)","EF","sk",3436);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143399,"Corr. (h)","CE","sk",3437);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143400,"Corr. (h)","CE","sk",3438);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143401,"Corr. (h)","CE","sk",3439);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143402,"Corr. (h)","CE","sk",3440);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143403,"Corr. (h)","CE","sk",3441);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143404,"Det. errors","DE","sk",3442);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143405,"Det. errors","DE","sk",3443);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143406,"Det. errors","DE","sk",3444);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143407,"Det. errors","DE","sk",3445);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143408,"Det. errors","DE","sk",3446);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143409,"Err. in docs","ED","sk",3447);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143410,"Err. in docs","ED","sk",3448);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143411,"Err. in docs","ED","sk",3449);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143412,"Err. in docs","ED","sk",3450);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143413,"Err. in docs","ED","sk",3451);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143414,"Reviews","","sk",3677);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143415,"Reviews","","sk",3678);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143416,"Reviews","","sk",3679);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143417,"Reviews","","sk",3680);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143418,"Reviews","","sk",3681);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143419,"Corr.total","","sk",3682);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143420,"Corr.total","","sk",3683);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143421,"Corr.total","","sk",3684);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143422,"Corr.total","","sk",3685);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143423,"Corr.total","","sk",3686);


/**********************************/
/*Corrections of all documents       */
/**********************************/
INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(435,"Preserving consistency I",NULL,1,1);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1266,"Preserving consistency I","en",435);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1267,"Preserving consistency I","de",435);

/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1267,"Zachov·vanie konzistencie I","sk",435);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3134,"Preserving consistency I",1,"G",NULL,435);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (874,"Preserving consistency I","
Description:
This chart vizualizes all correction activities related to the documents in the project. Activities containing the suffix all are activities that also correct all preceeding documents.

Explanation/Recommendations:
Every time errors are identified and changes are made to documents, all preceeding documents have to be corrected, too.","",null,null,"en",3134);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (875,"Preserving consistency I","Beschreibung:
Dieses Diagramm zeigt alle Korrekturaktivit‰ten bez¸glich der Dokumente im Projekt. Aktivit‰ten, die das Suffix ALL enthalten, sind Aktivit‰ten, die auch alle vorangehenden Dokumente korrigieren.

Erkl‰rung/Empfehlungen:
Jedesmal wenn Fehler gefunden werden und daher ein Dokument zu korrigieren ist, m¸ssen auch alle vorangehenden Dokumente korrigiert werden.",
"",null,null,"de",3134);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8074,"Zachov·vanie konzistencie I","
Popis:
This chart vizualizes all correction activities related to the documents in the project. Activities containing the suffix all are activities that also correct all preceeding documents.

Vysvetlenie/Odpor˙Ëania:
St·le, keÔ sa n·jdu chyby a vykonaj˙ sa zmeny v dokumentoch, musia byù zmenenÈ aj dokumenty, ktorÈ od predch·dzajpcich z·visia.",
"",null,null,"sk",3134);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3691,"root",NULL,3134,null,NULL);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3235,'MNCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Manualsreviewreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3236,'CDCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Codereviewreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3237,'MDCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Moduledesignreviewreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3238,'SDCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Systemdesignreviewreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3239,'SPCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Specificationreviewreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3240,'MTCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Moduletestreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3241,'ITCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Integrationtestreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3242,'STCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Systemtestreport%" AND LOCATE(path, \"%path\")=1;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(3243,'ATCA',
'select date,"inspect" as command from turn where gid = %game and command like "%oprav%vsetky%dokument%" and command like "%Acceptancetestreport%" AND LOCATE(path, "%path")=1;',null);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3692,"Atest all corrections",3691,3134,3243,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3693,"atest corrections",3691,3134,2834,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3694,"stest all corrections",3691,3134,3242,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3695,"stest corrections",3691,3134,2833,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3696,"itest all corrections",3691,3134,3241,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3697,"itest corrections",3691,3134,2832,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3698,"mtest all corrections",3691,3134,3240,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3699,"mtest corrections",3691,3134,2831,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42817,"AT Correct all","ATCA","en",3692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42818,"ST Correct all","STCA","en",3694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42819,"IT Correct all","ITCA","en",3696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42820,"MT Correct all","MTCA","en",3698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42826,"Acceptance test corr.","ATCorr","en",3693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42827,"System test corr.","STCorr","en",3695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42828,"Integration test corr.","ITCorr","en",3697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42829,"Module test corr.","MTCorr","en",3699);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43424,"AT Correct all","ATCA","de",3692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43425,"ST Correct all","STCA","de",3694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43426,"IT Correct all","ITCA","de",3696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43427,"MT Correct all","MTCA","de",3698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43433,"Acceptance test corr.","ATCorr","de",3693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43434,"System test corr.","STCorr","de",3695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43435,"Integration test corr.","ITCorr","de",3697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43436,"Module test corr.","MTCorr","de",3699);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143424,"AT Correct all","ATCA","sk",3692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143425,"ST Correct all","STCA","sk",3694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143426,"IT Correct all","ITCA","sk",3696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143427,"MT Correct all","MTCA","sk",3698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143433,"Acceptance test corr.","ATCorr","sk",3693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143434,"System test corr.","STCorr","sk",3695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143435,"Integration test corr.","ITCorr","sk",3697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143436,"Module test corr.","MTCorr","sk",3699);


/**********************************/
/*Corrections of all documents II      */
/**********************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(535,"Preserving consistency II",NULL,1,1);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(2266,"Preserving consistency II","en",535);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(2267,"Preserving consistency II","de",535);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5267,"Zaistenie konzistencie II","sk",535);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3234,"Preserving consistency II",1,"G",NULL,535);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (964,"Preserving consistency II","
Description:
This chart vizualizes all correction activities related to the documents in the project. Activities containing the suffix all are activities that also correct all preceeding documents.

Explanation/Recommendations:
Every time errors are identified and changes are made to documents, all preceeding documents have to be corrected, too.","Preserving consistency II",null,null,"en",3234);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (965,"Preserving consistency II","
Description:
This chart vizualizes all correction activities related to the documents in the project. Activities containing the suffix all are activities that also correct all preceeding documents.

Explanation/Recommendations:
Every time errors are identified and changes are made to documents, all preceeding documents have to be corrected, too.","Preserving consistency II",null,null,"de",3234);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (9064,"Zaistenie konzistencie II","
Popis:
Tento diagram vizualizuje vöetky aktivity t˝kaj˙ce sa korekciÌ s ohæadom na projektovÈ dokumenty. Aktivity so sufixom s˙ aktivity, ktorÈ taltieû napr·vajp vöetky predoölÈ dokumenty.

Vysvetlenie/Odpor˙Ëania:

St·le, keÔ sa n·jdu chyby a vykonaj˙ sa zmeny v dokumentoch, musia byù zmenenÈ aj dokumenty, ktorÈ od predch·dzajpcich z·visia.",
"Preserving consistency II",null,null,"sk",3234);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7691,"root",NULL,3234,null,NULL);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7692,"Manuals all corrections",7691,3234,3235,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7693,"Manuals corrections",7691,3234,2841,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7694,"Code all corrections",7691,3234,3236,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7695,"Code corrections",7691,3234,2864,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7696,"MD all corrections",7691,3234,3237,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7697,"MD corrections",7691,3234,2861,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7698,"SD all corrections",7691,3234,3238,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7699,"SD corrections",7691,3234,2851,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7700,"Spec all corrections",7691,3234,3239,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (7701,"Spec corrections",7691,3234,2848,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42821,"MN Correct all","MNCA","en",7692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42822,"CD Correct all","CDCA","en",7694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42823,"MD Correct all","MDCA","en",7696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42824,"SD Correct all","SDCA","en",7698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42825,"SP Correct all","SPCA","en",7700);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42830,"Manual corr.","MNCorr","en",7693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42831,"Code corr.","CDCorr","en",7695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42832,"Module design corr.","MDCorr","en",7697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42833,"System design corr.","SDCorr","en",7699);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42834,"Specification corr.","SPCorr","en",7701);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43428,"MN Correct all","MNCA","de",7692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43429,"CD Correct all","CDCA","de",7694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43430,"MD Correct all","MDCA","de",7696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43431,"SD Correct all","SDCA","de",7698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43432,"SP Correct all","SPCA","de",7700);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43437,"Manual corr.","MNCorr","de",7693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43438,"Code corr.","CDCorr","de",7695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43439,"Module design corr.","MDCorr","de",7697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43440,"System design corr.","SDCorr","de",7699);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43441,"Specification corr.","SPCorr","de",7701);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143428,"MN Correct all","MNCA","sk",7692);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143429,"CD Correct all","CDCA","sk",7694);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143430,"MD Correct all","MDCA","sk",7696);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143431,"SD Correct all","SDCA","sk",7698);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143432,"SP Correct all","SPCA","sk",7700);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143437,"Manual corr.","MNCorr","sk",7693);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143438,"Code corr.","CDCorr","sk",7695);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143439,"Module design corr.","MDCorr","sk",7697);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143440,"System design corr.","SDCorr","sk",7699);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143441,"Specification corr.","SPCorr","sk",7701);

/**********************************/
/*  Errors remaining in documents      */
/**********************************/


INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(418,"Errors remaining in documents",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1236,"Errors remaining in documents","en",418);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1237,"Errors remaining in documents","de",418);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5237,"Zost·vaj˙ce chyby v dokumentoch","sk",418);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (3117,"Errors remaining in documents",0,"T",NULL,418);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (834,"Errors remaining in documents","Legend:
Document ... contains the different types of errors for the specification, system and module design document, code, and the manual.

Description:
This table summarizes the different types of errors for all documents. The specification contains only analysis errors, the system design document contains errors from analysis AND system design errors, and so on.

Explanation/Recommendations:
Errors propagate in the life cycle of documents. Every time a new document is created new errors turn up. As reviews identify different types of errors, not only the reviewed document should be corrected, but also the preceeding documents.",
"",null,null,"en",3117);

INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (835,"Errors remaining in the documents","Legende:
Document ... enth‰lt die verschiedenen Fehlerarten f¸r die Spezifikation, das System- und Moduldesigndokument, den Code und das Handbuch.

Beschreibung:
Diese Tabelle faﬂt die verschiedenen Fehlerarten f¸r alle Dokumente zusammen. Die Spezifikation enth‰lt nur Analysefehler, das Systemdesigndokument Analyse- UND Systemdesignfehler, usw.

Erkl‰rung/Empfehlungen:
Fehler vermehren sich im Life-Cycle von Dokumenten. Jedesmal wenn ein neues Dokument entsteht, tauchen auch neue Fehler auf. Durch Reviews werden verschiedene Fehlerarten identifiziert. Daher sollte nicht nur das begutachtete Dokument korrigiert werden, sondern auch dessen vorangegangenen Dokumente.",
"",null,null,"de",3117);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (8034,"Zost·vaj˙ce chyby v dokumentoch","Legenda:
Document ... obsahuje rozliËnÈ typy ch˝b öpecifik·cie, systÈmovÈho n·vrhu a n·vrhu modulov, kÛdu a prÌruËiek.

Popis:
T·to tabuæka sumarizuje rÙzne typy ch˝b vöetk˝ch dokumentov. äpecifik·cia obsahuje len chyby ana˝zy, dokument n·vrhu systÈmu obsahuje chyby z anal˝zy a chyby n·vrhu systÈmu, a tak Ôalej.

Vysvetlenie/Odpor˙Ëania:
Chyby sa öÌria v ûivotn˝ch cykloch dokumentov. Zakaûd˝m, keÔ sa vytvorÈ nov˝ dokument, objavia sa novÈ chyby. S t˝m, ako posudky identifikuj˙ rÙzne typy ch˝b, nie len posudzovanÈ dokumenty by mali byù opravenÈ, ale aj predch·dzaj˙ce.",
"",null,null,"sk",3117);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3355,"root",NULL,3117,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42472,"root",null,"en",3355);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43480,"root",null,"de",3355);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143480,"root",null,"sk",3355);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3356,"Type of errors",3355,3117,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42473,"Type of errors","Document","en",3356);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43442,"Type of errors","Document","de",3356);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143442,"Type of errors","Document","sk",3356);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3357,"Analysis",3356,3117,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3358,"Sys.Des.",3356,3117,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3359,"Mod.Des.",3356,3117,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3360,"Code",3356,3117,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3361,"Manual",3356,3117,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3711,"Total",3356,3117,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42474,"Analysis","E1","en",3357);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42475,"Sys.Des.","E2","en",3358);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42476,"Mod.Des.","E3","en",3359);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42477,"Code","E4","en",3360);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42478,"Manual","TE","en",3361);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42835,"Total","TE","en",3711);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43443,"Analysis","E1","de",3357);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43444,"Sys.Des.","E2","de",3358);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43445,"Mod.Des.","E3","de",3359);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43446,"Code","E4","de",3360);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43447,"Manual","TE","de",3361);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43448,"Total","TE","de",3711);


/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143443,"Analysis","E1","sk",3357);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143444,"Sys.Des.","E2","sk",3358);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143445,"Mod.Des.","E3","sk",3359);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143446,"Code","E4","sk",3360);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143447,"Manual","TE","sk",3361);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143448,"Total","TE","sk",3711);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3017," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**SPEZIFIKATION*Specification*ANZ_AF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3018," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3019," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3020," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3021," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3022," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**SYSTEMENTWURF*Systemdesign*ANZ_AF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3023," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**SYSTEMENTWURF*Systemdesign*ANZ_GF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3024," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3025," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3026," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3027," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**MODULSPEZIFIKATION*Moduledesign*ANZ_AF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3028," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**MODULSPEZIFIKATION*Moduledesign*ANZ_GF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3029," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**MODULSPEZIFIKATION*Moduledesign*ANZ_FF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3030," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3031," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid=%game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3032," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*ANZ_AF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3033," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*ANZ_GF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3034," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*ANZ_FF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3035," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_IF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*ANZ_IF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3036," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid = %game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3037," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**HANDBUCH*Manuals*ANZ_AF");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3038," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid = %game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3039," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid = %game;',null);
INSERT INTO query(qid,attribute,statement,z_path) VALUES (3040," ",
'select distinct " " as value from game,s_entity where s_entity.gid=game.gid and game.gid = %game;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (3041," ",
'select distinct s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_HF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**HANDBUCH*Manuals*ANZ_HF");



INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3362,"Spec.",3357,3117,3017,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3363,"Spec.",3358,3117,3018,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3364,"Spec.",3359,3117,3019,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3365,"Spec.",3360,3117,3020,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3366,"Spec.",3361,3117,3021,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3712,"Spec.",3711,3117,3089,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42479,"Spec.","TC","en",3362);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42480,"Spec.","TC","en",3363);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42481,"Spec.","TC","en",3364);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42482,"Spec.","TC","en",3365);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42483,"Spec.","TC","en",3366);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42836,"Spec.","TC","en",3712);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3367,"Sys.Des.",3362,3117,3022,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3368,"Sys.Des.",3363,3117,3023,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3369,"Sys.Des.",3364,3117,3024,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3370,"Sys.Des.",3365,3117,3025,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3371,"Sys.Des.",3366,3117,3026,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3713,"Sys.Des.",3712,3117,3090,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42484,"Sys.Des.","TC","en",3367);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42485,"Sys.Des.","TC","en",3368);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42486,"Sys.Des.","TC","en",3369);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42487,"Sys.Des.","TC","en",3370);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42488,"Sys.Des.","TC","en",3371);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42837,"Sys.Des.","TC","en",3713);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3372,"Mod.Des.",3367,3117,3027,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3373,"Mod.Des.",3368,3117,3028,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3374,"Mod.Des.",3369,3117,3029,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3375,"Mod.Des.",3370,3117,3030,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3376,"Mod.Des.",3371,3117,3031,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3714,"Mod.Des.",3713,3117,3091,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42489,"Mod.Des.","TC","en",3372);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42490,"Mod.Des.","TC","en",3373);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42491,"Mod.Des.","TC","en",3374);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42492,"Mod.Des.","TC","en",3375);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42493,"Mod.Des.","TC","en",3376);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42838,"Mod.Des.","TC","en",3714);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3377,"Code",3372,3117,3032,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3378,"Code",3373,3117,3033,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3379,"Code",3374,3117,3034,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3380,"Code",3375,3117,3035,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3381,"Code",3376,3117,3036,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3715,"Code",3714,3117,3092,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42494,"Code","TC","en",3377);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42495,"Code","TC","en",3378);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42496,"Code","TC","en",3379);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42497,"Code","TC","en",3380);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42498,"Code","TC","en",3381);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42839,"Code","TC","en",3715);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3382,"Manual",3377,3117,3037,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3383,"Manual",3378,3117,3038,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3384,"Manual",3379,3117,3039,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3385,"Manual",3380,3117,3040,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3386,"Manual",3381,3117,3041,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (3716,"Manual",3715,3117,3093,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42499,"Manual","TC","en",3382);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42500,"Manual","TC","en",3383);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42501,"Manual","TC","en",3384);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42502,"Manual","TC","en",3385);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42503,"Manual","TC","en",3386);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (42840,"Manual","TC","en",3716);

/* maier */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43449,"Spec.","TC","de",3362);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43450,"Spec.","TC","de",3363);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43451,"Spec.","TC","de",3364);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43452,"Spec.","TC","de",3365);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43453,"Spec.","TC","de",3366);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43455,"Spec.","TC","de",3712);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43456,"Sys.Des.","TC","de",3367);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43457,"Sys.Des.","TC","de",3368);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43458,"Sys.Des.","TC","de",3369);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43459,"Sys.Des.","TC","de",3370);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43460,"Sys.Des.","TC","de",3371);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43461,"Sys.Des.","TC","de",3713);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43462,"Mod.Des.","TC","de",3372);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43463,"Mod.Des.","TC","de",3373);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43464,"Mod.Des.","TC","de",3374);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43465,"Mod.Des.","TC","de",3375);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43466,"Mod.Des.","TC","de",3376);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43467,"Mod.Des.","TC","de",3714);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43468,"Code","TC","de",3377);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43469,"Code","TC","de",3378);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43470,"Code","TC","de",3379);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43471,"Code","TC","de",3380);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43472,"Code","TC","de",3381);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43473,"Code","TC","de",3715);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43474,"Manual","TC","de",3382);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43475,"Manual","TC","de",3383);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43476,"Manual","TC","de",3384);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43477,"Manual","TC","de",3385);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43478,"Manual","TC","de",3386);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (43479,"Manual","TC","de",3716);

/* daÚo */

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143449,"Spec.","TC","sk",3362);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143450,"Spec.","TC","sk",3363);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143451,"Spec.","TC","sk",3364);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143452,"Spec.","TC","sk",3365);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143453,"Spec.","TC","sk",3366);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143455,"Spec.","TC","sk",3712);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143456,"Sys.Des.","TC","sk",3367);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143457,"Sys.Des.","TC","sk",3368);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143458,"Sys.Des.","TC","sk",3369);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143459,"Sys.Des.","TC","sk",3370);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143460,"Sys.Des.","TC","sk",3371);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143461,"Sys.Des.","TC","sk",3713);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143462,"Mod.Des.","TC","sk",3372);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143463,"Mod.Des.","TC","sk",3373);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143464,"Mod.Des.","TC","sk",3374);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143465,"Mod.Des.","TC","sk",3375);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143466,"Mod.Des.","TC","sk",3376);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143467,"Mod.Des.","TC","sk",3714);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143468,"Code","TC","sk",3377);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143469,"Code","TC","sk",3378);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143470,"Code","TC","sk",3379);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143471,"Code","TC","sk",3380);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143472,"Code","TC","sk",3381);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143473,"Code","TC","sk",3715);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143474,"Manual","TC","sk",3382);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143475,"Manual","TC","sk",3383);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143476,"Manual","TC","sk",3384);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143477,"Manual","TC","sk",3385);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143478,"Manual","TC","sk",3386);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (143479,"Manual","TC","sk",3716);

/**********************************/
/* CLIENT FEEDBACK   */
/**********************************/


insert into query (qid, attribute, statement)
values(3244,"","select feedback as explanation, -1 as points from turn where gid = %gid% and feedback like '%Zakaznik%otestoval system%'");


/**********************************/
/*  LEGEND LINES  */
/**********************************/

insert into query (qid, attribute, statement)
values(3257, 'Legend line', 190);
insert into aid_instance(instid, description,spaidid,qid,flag)
values (3800, 'Legend line', 13, 3257, 'HL');


/**********************************/
/*  EXPLANATION RULES  */
/**********************************/


/* GOAL ACHIEVEMENTS */

insert into query (qid, attribute,statement) values (3246,'rule',"SELECT CASE
WHEN (%3217%<=270) THEN 'Really well done, you have finished your project in %3217% days! '
WHEN (%3217%>270 and %3217%<=280) THEN 'Good! '
WHEN (%3217%>280) THEN 'Not so bad.'
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3217%<=270) THEN 5
WHEN (%3217%>270 and %3217%<=280) THEN 4
WHEN (%3217%>280) THEN 3
ELSE 2
END AS points");

insert into query (qid, attribute,statement) values (3247,'rule',"SELECT CASE
WHEN (%3218%<=225000) THEN 'Really well done, you spent only %3218%, so you did not exceed the limit! '
WHEN (%3218%>225000 and %3218%<=230000) THEN concat('Good!!! You have exceeded the cost limit, but only by ',(%3218%-225000),' EURO. ')
WHEN (%3218%>230000) THEN concat('You should be careful next time! You have exceeded the cost limit by ',(%3218%-225000),' EURO. ')
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3218%<=225000) THEN 5
WHEN (%3218%>225000 and %3218%<=230000) THEN 4
WHEN (%3218%>230000) THEN 3
ELSE 2
END AS points;");

insert into query (qid, attribute,statement) values (3248,'rule',"SELECT CASE
WHEN (%3219%>=95) THEN 'You have achieved %3219% percent of AFP in code! That means you achieved this objective. '
WHEN (%3219%>90 and %3219%<=95) THEN 'TEST TEST'
WHEN (%3219%<90) THEN 't'
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3219%>=95) THEN 5
WHEN (%3219%>90 and %3219%<=95) THEN 4
WHEN (%3219%<90) THEN 3
ELSE 2
END AS points;");

insert into query (qid, attribute,statement) values (3249,'rule',"SELECT CASE
WHEN (%3220%<=8) THEN 'You made only %3220% errors per KLOC. '
WHEN (%3220%>8 and %3220%<=12) THEN 'Good, you didnt exceed the limit of 12 errors per KLOC. '
WHEN (%3220%>12) THEN 'test '
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3220%<=8) THEN 5
WHEN (%3220%>8 and %3220%<=12) THEN 4
WHEN (%3220%>12) THEN 3
ELSE 2
END AS points;");

insert into query (qid, attribute,statement) values (3250,'rule',"SELECT CASE
WHEN (%3221%>=95) THEN 'You have achieved %3221% percent of AFP in manual! That means you achieved this objective. '
WHEN (%3221%>90 and %3221%<=95) THEN 'TEST TEST'
WHEN (%3221%<90) THEN 't'
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3221%>=95) THEN 5
WHEN (%3221%>90 and %3221%<=95) THEN 4
WHEN (%3221%<90) THEN 3
ELSE 2
END AS points;");

insert into query (qid, attribute,statement) values (3251,'rule',"SELECT CASE
WHEN (%3222%<=0.25) THEN 'You made only %3222% errors per page in manual. '
WHEN (%3222%>0.25 and %3222%<=0.5) THEN 'test '
WHEN (%3222%>0.5) THEN 'test'
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3222%<=0.25) THEN 5
WHEN (%3222%>0.25 and %3220%<=0.5) THEN 4
WHEN (%3222%>0.5) THEN 3
ELSE 2
END AS points;");

/* PERFORMANCE */

insert into query (qid, attribute,statement) values (3252,'rule',"SELECT CASE
WHEN (%3101%>=100 and %3102%>=100 and %3103%>=100 and %3104%>=100 and %3105%>=100)
THEN 'Well done, all your documents are fully complete! '
WHEN (%3101%<100 and %3102%<100 and %3103%<100 and %3104%<100 and %3105%<100 and
%3101%>=90 and %3102%>=90 and %3103%>=90 and %3104%>=90 and %3105%>=90
) THEN 'Good. In all phases you have reached at least 90 percent of AFP. '
ELSE 'Really bad.'
END AS explanation,
CASE
WHEN (%3101%>=100 and %3102%>=100 and %3103%>=100 and %3104%>=100 and %3105%>=100)
THEN 5
WHEN (%3101%<100 and %3102%<100 and %3103%<100 and %3104%<100 and %3105%<100 and
%3101%>=90 and %3102%>=90 and %3103%>=90 and %3104%>=90 and %3105%>=90
) THEN 4
ELSE 2
END AS points");

/*  MONITORING */

insert into query (qid, attribute,statement) values (3254,'rule',"SELECT CASE
WHEN (%3569%=0 and %3570%=0 and %3571%=0 and %3572%=0)
THEN 'You didnt inspect any of the reports from tests. You should be aware of the fact that is important to be familiar with the results of tests. '
ELSE 'ok'
END AS explanation,
CASE
WHEN (%3569%=0 and %3570%=0 and %3571%=0 and %3572%=0)
THEN 3
ELSE 5
END AS points;");

insert into query (qid, attribute,statement) values (3253,'rule',"SELECT CASE
WHEN (%3578%=0 )
THEN 'You didnt inspect activity of any employee. '
WHEN (%3578%>10 )
THEN 'You did a lot of inspections of employees activity. It might mean that you werent sure what they are currently doing. Did you plan your project properly before start? '
ELSE 'ok'
END AS explanation,
CASE
WHEN (%3578%=0 )
THEN 1
WHEN (%3578%>10 )
THEN 3
ELSE 5
END AS points;");

insert into query (qid, attribute,statement) values (3255,'rule',"SELECT CASE
WHEN (%3573%=0 and %3574%=0 and %3575%=0 and %3576%=0 and %3577%=0 )
THEN 'You didnt inspect any of the project phases. '
ELSE 'ok'
END AS explanation,
CASE
WHEN (%3573%=0 and %3574%=0 and %3575%=0 and %3576%=0 and %3577%=0)
THEN 3
ELSE 5
END AS points;");



/* t_allows_aiddesc */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,400);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,406);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,407);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,408);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,409);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,410);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,411);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,412);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,420);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,429);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,432);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,413);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,414);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,415);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,416);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,417);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,419);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,425);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,427);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,431);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,433);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,438);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,428);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,441);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,434);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,361);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,440);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,422);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,418);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,435);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,436);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,437);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,535);

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,400);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,406);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,407);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,408);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,409);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,410);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,411);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,412);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,420);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,429);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,432);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,413);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,414);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,415);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,416);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,417);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,419);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,425);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,427);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,431);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,433);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,438);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,428);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,441);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,434);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,361);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,440);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,422);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,418);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,435);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,436);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,437);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,535);


/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1215,"Specification and system design","de",407);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1217,"Module design and coding","de",408);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1219,"Monitoring","de",409);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1241,"Phases and Milestones",'de',420);*/


/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1280,"Test Phases",'de',432);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1281,"Goal achievement","de",413);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1282,"Monitoring",'de',431);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1283,"Tasks assignment",'de',433);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1284,"Tasks assignment",'de',438);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1285,"System and module design","de",434);*/
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1286,"Coding and testing","de",361);
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1287,"Testing phase","de",440);*/
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1288,"All documents corrections","de",435);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1289,"Efficiency",'de',436);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1290,"Test efficiency",'de',437);


/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1215,"Specification and system design","sk",407);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1217,"Module design and coding","sk",408);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1219,"Monitoring","sk",409);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1241,"Phases and Milestones",'sk',420);*/


/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1280,"Test Phases",'sk',432);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1281,"Goal achievement","sk",413);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1282,"Monitoring",'sk',431);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1283,"Tasks assignment",'sk',433);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1284,"Tasks assignment",'sk',438);*/
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1285,"System and module design","sk",434);*/
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5286,"Coding and testing","sk",361);
/*INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(1287,"Testing phase","sk",440);*/
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5288,"All documents corrections","sk",435);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5289,"Efficiency",'sk',436);
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(5290,"Test efficiency",'sk',437);

-- 3901: Table title: Quality per Phase
-- author: Zofia DomaÒska, Mai 2008 (A2PPT project)
-- Table: rows are related to simulations. The columns are as follows:
-- ï	Number of AFPs in specification
-- ï	Number of AFPs in code
-- ï	Number of person months spent on specification
-- ï	Cost of specification
-- ï	Number of person months spent on testing
-- ï	Cost of testing.
-- summary of the costs



--
-- Table `query` (1)
--

INSERT INTO `query` (`qid`, `attribute`, `statement`, `z_path`) VALUES
(4031, 'specification', 'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATION" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specification" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_AFP" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND s_entity.path = \"%path\" order by s_entity.tnid desc;', '**SPEZIFIKATION*Specification*ANZ_AFP'),
(4032, 'code', 'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "CODE" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Code" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_AFP" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND s_entity.path = \"%path\" order by s_entity.tnid desc;', '**CODE*Code*ANZ_AFP'),
(4033, 'specification', 'SELECT(SELECT max( cast( s_entity.value AS signed ) ) AS value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "KOSTEN"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
)
/
(
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "KOSTEN_PRO_MM"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
ORDER BY tnid DESC
LIMIT 1
)
*
(
SELECT 0.01*max( s_entity.value ) AS value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "AUFWANDSVERTEILUNG_SPEZI"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
)
as VALUE', '**SYSTEMSPEZIFIKATION*Spezifikation*KOSTEN_MM_SPEC'),
(4034, 'specification', 'select distinct(

select 0.01*max(s_entity.value)
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "AUFWANDSVERTEILUNG_SPEZI" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1

)
*
(

  	select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "KOSTEN" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)
as value', '**SYSTEMSPEZIFIKATION*Spezifikation*KOSTEN_SPEC'),
(4035, 'tests', 'SELECT (
SELECT max( cast( s_entity.value AS signed ) ) AS value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "KOSTEN"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
)
/
(
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "KOSTEN_PRO_MM"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
ORDER BY tnid DESC
LIMIT 1
)
*
(
SELECT 0.01*max( s_entity.value ) AS value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTZUSTAND"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectstatus"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "AUFWANDSVERTEILUNG_TEST"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE( s_entity.path, "%path" ) =1
)
as VALUE', '**TESTS*Tests*KOSTEN_MM_TESTS'),
(4036, 'tests', 'select distinct(

select 0.01*max(s_entity.value)
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "AUFWANDSVERTEILUNG_TEST" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1

)
*
(

  	select  max(cast(s_entity.value as signed))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "KOSTEN" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)
as value
', '**TESTS*Tests*KOSTEN_TESTS'),
(4037, 'specification, tests', '-- Summ: Specification Ä + Tests Ä --- (Effort for spec X Total Ä) + (Effort test X Total Ä) ---
select distinct(

(
(select 0.01*max(s_entity.value)
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "AUFWANDSVERTEILUNG_SPEZI" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1

)
*
(

  	select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "KOSTEN" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)
)
+
(
(

select 0.01*max(s_entity.value)
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "AUFWANDSVERTEILUNG_TEST" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1

)
*
(

  	select  max(cast(s_entity.value as signed))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "PROJEKTZUSTAND" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Projectstatus" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "KOSTEN" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)
)
)
as value
', '**SYSTEMSPEZIFIKATION UND TESTS*Spezifikation und Tests*KOSTEN_SPEC_TEST');


--
-- Table `aid_description` (2)
--

INSERT INTO `aid_description` (`aiddid`, `description`, `type`, `detail`, `kaidid`, `mid`) VALUES
(5534, 'Quality per phase', NULL, NULL, 1, 1);

--
-- Table `specific_aid` (3)
--

INSERT INTO `specific_aid` (`spaidid`, `description`, `diagram`, `layout`, `qualification`, `aiddid`) VALUES
(3901, 'Quality per phase', 0, 'T', NULL, 5534);

--
-- Table `aid_instance` (4)
--
INSERT INTO `aid_instance` (`instid`, `description`, `predecessor`, `spaidid`, `qid`, `rlid`, `flag`) VALUES
(7702, 'root', NULL, 3901, NULL, NULL, NULL),
(7703, 'Quality per phase', 7702, 3901, NULL, NULL, NULL),
(7704, 'S(AFP)', 7703, 3901, NULL, NULL, NULL),
(7705, 'Code(AFP)', 7703, 3901, NULL, NULL, NULL),
(7706, 'S(PM)', 7703, 3901, NULL, NULL, NULL),
(7707, 'S(EUR)', 7703, 3901, NULL, NULL, NULL),
(7708, 'Tests(PM)', 7703, 3901, NULL, NULL, NULL),
(7709, 'Tests(EUR)', 7703, 3901, NULL, NULL, NULL),
(7710, 'Sum(EUR)', 7703, 3901, NULL, NULL, NULL),
(7711, ' ', 7704, 3901, 4031, NULL, NULL),
(7712, ' ', 7705, 3901, 4032, NULL, NULL),
(7713, ' ', 7706, 3901, 4033, NULL, NULL),
(7714, ' ', 7707, 3901, 4034, NULL, NULL),
(7715, ' ', 7708, 3901, 4035, NULL, NULL),
(7716, ' ', 7709, 3901, 4036, NULL, NULL),
(7717, ' ', 7710, 3901, 4037, NULL, NULL);

--
-- Table `spec_aid_lang` (5)
--

INSERT INTO `spec_aid_lang` (`said`, `description`, `title`, `text`, `xaxis`, `yaxis`, `language`, `spaidid`) VALUES
(969, 'Quality per phase', "", 'Legend:
.. AFP in Specification, ... AFP in Code, ... PM of Specification, ... cost of Specification (in Ä), ... PM of Tests, ... cost of Tests (in Ä), ... summ of Specification and Tests costs (in Ä).



Description:
This table summarizes the goal achievement the quality of Specification, Code and Tests

Explanation/Recommendations:
-.', NULL, NULL, 'en', 3901),
(970, 'Quality per phase', "", 'Legend:
.. AFP in Spezifikation, ... AFP in Kode, ... PM of Spezifikation, ... Kosten von Spezifikation (in Ä), ... PM von Tests, ... Kosten von Tests (in Ä), ... Summe von Spezifikationkosten und Testskosten (in Ä).



Beschreibung:
Diese Tabelle fa?t die Qualit‰t-Resultaten von Spezifikation, Kodierung und Tests des Simulationslaufs zusammen.

Erkl?rung/Empfehlungen:
-.', NULL, NULL, 'de', 3901),
(7270, 'Quality per phase', "", 'Legenda:
.. AFP v öpecifik·cii, ... AFP in Code, ... PM öpecifik·cie ... n·klady na öpecifik·ciu (v Ä), ... PM testov, ... n·klady na testy (v Ä), ... suma n·kladov na öpecifik·ciu a testy (v Ä).



Popis:
T·to tabuæka sumarizuje dosiahnutie cieæov kvality öpecifik·cie, kÛdu a testov

Explanation/Recommendations:
-.', NULL, NULL, 'sk', 3901);
/* daÚo ID for "sk" entry set to 7270 according to numbering rules we defined in QUERIES.SQL, "en"'s 700 is "sk"'s 7000. "en"'s 970 is "sk"'s 7270 */
--
-- Table `spaid_needs_zt` (6)
--

INSERT INTO `spaid_needs_zt` (`spaidid`, `zid`) VALUES
(3901, 3),
(3901, 6),
(3901, 9);



--
-- Table `aid_desc_lang` (7)
--

INSERT INTO `aid_desc_lang` (`did`, `description`, `language`, `aiddid`) VALUES
(2268, 'Quality per phase', 'en', 5534),
(2269, 'Quality per phase', 'de', 5534),
(5269, 'Quality per phase', 'sk', 5534);


--
-- Table `t_allows_aiddesc` (8)
--

-- INSERT INTO `t_allows_aiddesc` (`tid`, `aiddid`) VALUES
-- (4, 5532),
-- (4, 5533);


--
-- Table `aid_inst_lang` (9)
--

INSERT INTO `aid_inst_lang` (`aiid`, `description`, `abbreviation`, `language`, `instid`) VALUES
(72928, 'root', NULL, 'en', 7702),
(72929, 'root', NULL, 'de', 7702),
(172929, 'root', NULL, 'sk', 7702),
(72932, 'S(AFP)', 'S(AFP)', 'en', 7704),
(72933, 'S(AFP)', 'S(AFP)', 'de', 7704),
(172933, 'S(AFP)', 'S(AFP)', 'sk', 7704),
(72934, 'Code(AFP)', 'Code(AFP)', 'en', 7705),
(72935, 'Code(AFP)', 'Code(AFP)', 'de', 7705),
(172935, 'Code(AFP)', 'Code(AFP)', 'sk', 7705),
(72936, 'S(PM)', 'S(PM)', 'en', 7706),
(72937, 'S(PM)', 'S(PM)', 'de', 7706),
(172937, 'S(PM)', 'S(PM)', 'sk', 7706),
(72938, 'S(EUR)', 'S(EUR)', 'en', 7707),
(72939, 'S(EUR)', 'S(EUR)', 'de', 7707),
(172939, 'S(EUR)', 'S(EUR)', 'sk', 7707),
(72940, 'Tests(PM)', 'Tests(PM)', 'en', 7708),
(72941, 'Tests(PM)', 'Tests(PM)', 'de', 7708),
(172941, 'Tests(PM)', 'Tests(PM)', 'sk', 7708),
(72942, 'Tests(EUR)', 'Tests(EUR)', 'en', 7709),
(72943, 'Tests(EUR)', 'Tests(EUR)', 'de', 7709),
(172943, 'Tests(EUR)', 'Tests(EUR)', 'sk', 7709),
(72944, 'Sum(EUR)', 'Sum(EUR)', 'en', 7710),
(72945, 'Sum(EUR)', 'Sum(EUR)', 'de', 7710),
(172945, 'Sum(EUR)', 'Sum(EUR)', 'sk', 7710),
(72946, ' ', 'S(AFP)', 'en', 7711),
(72947, '  ', 'S(AFP)', 'de', 7711),
(172947, '  ', 'S(AFP)', 'sk', 7711),
(72948, ' ', 'Code(AFP)', 'en', 7712),
(72949, ' ', 'Code(AFP)', 'de', 7712),
(172949, ' ', 'Code(AFP)', 'sk', 7712),
(72950, ' ', 'S(PM)', 'en', 7713),
(72951, ' ', 'S(PM)', 'de', 7713),
(172951, ' ', 'S(PM)', 'sk', 7713),
(72952, ' ', 'S(EUR)', 'en', 7714),
(72953, '', 'S(EUR)', 'de', 7714),
(172953, '', 'S(EUR)', 'sk', 7714),
(72954, ' ', 'Tests(PM)', 'en', 7715),
(72955, ' ', 'Tests(PM)', 'de', 7715),
(172955, ' ', 'Tests(PM)', 'sk', 7715),
(72956, ' ', 'Tests(EUR)', 'en', 7716),
(72957, ' ', 'Tests(EUR)', 'de', 7716),
(172957, ' ', 'Tests(EUR)', 'sk', 7716),
(72958, ' ', 'Sum(EUR)', 'en', 7717),
(72959, ' ', 'Sum(EUR)', 'de', 7717),
(172959, ' ', 'Sum(EUR)', 'sk', 7717),
(72960, 'Quality per phase', 'Quality', 'en', 7703),
(72961, 'Quality per phase', 'Quality', 'de', 7703),
(172961, 'Quality per phase', 'Quality', 'sk', 7703);



-- 3902: Table title : Influence of review teams on the number of faults
-- author: Zofia DomaÒska, June 2008 (A2PPT project)
-- Table per one simulation
-- Each row is one specification review
-- The data are derived from:
-- ï	list of the authors of the specification
-- ï	number of errors found in the specification - EMPTY - WITHOUT ANY QUERY
-- ï	list of the specification reviewers
-- ï	number of errors found in the review process
-- ï	list of the specification correctors
-- ï	number of errors corrected
-- ï	number of errors remaining
-- ï	Does the client took part in the review?

INSERT INTO `query` (`qid`, `attribute`, `statement`, `z_path`) VALUES
(4038, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*person*review1'),
(4039, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) as value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*PERSON*review2'),
(4040, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*PERSON*review3'),
(4041, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*Specificationreviewreport*review1'),
(4042, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*Specificationreviewreport*review2'),
(4043, '', 'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*Specificationreviewreport*review3'),
(4044, '', 'SELECT
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATION" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specification" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_FEHLER_GES" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(
select distinct max(cast(s_entity.value as signed))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specificationreviewreport" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1
)
+
(
select distinct max(cast(s_entity.value as signed))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specificationreviewreport" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_KORR_FEHLER_2_PRF" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1
)
AS value', '**RESTFEHLER*review1'),
(4045, '', 'SELECT
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATION" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specification" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_FEHLER_GES" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(
select distinct max(cast(s_entity.value as signed))
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Specificationreviewreport" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "ANZ_KORR_FEHLER_3_PRF" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1
)

AS value
', '**RESTFEHLER*review2'),
(4046, '', 'SELECT description AS value FROM aid_instance WHERE instid=1', '***STAR'),
(4047, '', ' SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*CUSTOMER*review1'),
(4048, '', ' SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*CUSTOMER*review2'),
(4049, '', ' SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 ', '**SPEZIFIKATIONSKORRECTIONBERICHT*CUSTOMER*review3');

--
-- Table `aid_description` (2)
--

INSERT INTO `aid_description` (`aiddid`, `description`, `type`, `detail`, `kaidid`, `mid`) VALUES
(5535, 'Influence of review teams on the number of faults', NULL, NULL, 1, 1);

--
-- Table `specific_aid` (3)
--

INSERT INTO `specific_aid` (`spaidid`, `description`, `diagram`, `layout`, `qualification`, `aiddid`) VALUES
(3902, 'Influence of review teams on the number of faults', 0, 'T', NULL, 5535);


--
-- Table `aid_instance` (4)
--

INSERT INTO `aid_instance` (`instid`, `description`, `predecessor`, `spaidid`, `qid`, `rlid`, `flag`) VALUES
(7718, 'root', NULL, 3902, NULL, NULL, NULL),
(7719, 'Influence of review teams on the number of faults', 7718, 3902, NULL, NULL, NULL),
(7721, 'Authors', 7719, 3902, NULL, NULL, NULL),
(7722, '# Errors', 7719, 3902, NULL, NULL, NULL),
(7723, 'Reviewers', 7719, 3902, NULL, NULL, NULL),
(7724, '# Errors found', 7719, 3902, NULL, NULL, NULL),
(7725, 'Correctors', 7719, 3902, NULL, NULL, NULL),
(7726, '# Errors corrected', 7719, 3902, NULL, NULL, NULL),
(7727, '# Erros remained', 7719, 3902, NULL, NULL, NULL),
(7728, 'Cust.', 7719, 3902, NULL, NULL, NULL),
(7729, 'Rev. 1', 7721, 3902, 3094, NULL, NULL),
(7730, 'Rev. 1', 7722, 3902, 4046, NULL, NULL),
(7731, 'Rev. 1', 7723, 3902, 4038, NULL, NULL),
(7732, 'Rev. 1', 7724, 3902, 2912, NULL, NULL),
(7733, 'Rev. 1', 7725, 3902, 4041, NULL, NULL),
(7734, 'Rev. 1', 7726, 3902, 2917, NULL, NULL),
(7735, 'Rev. 1', 7727, 3902, 4044, NULL, NULL),
(7736, 'Rev. 2', 7729, 3902, 3094, NULL, NULL),
(7737, 'Rev. 2', 7730, 3902, 4046, NULL, NULL),
(7738, 'Rev. 2', 7731, 3902, 4039, NULL, NULL),
(7739, 'Rev. 2', 7732, 3902, 2913, NULL, NULL),
(7740, 'Rev. 2', 7733, 3902, 4042, NULL, NULL),
(7741, 'Rev. 2', 7734, 3902, 2918, NULL, NULL),
(7742, 'Rev. 2', 7735, 3902, 4045, NULL, NULL),
(7743, 'Rev. 3', 7736, 3902, 3094, NULL, NULL),
(7744, 'Rev. 3', 7737, 3902, 4046, NULL, NULL),
(7745, 'Rev. 3', 7738, 3902, 4040, NULL, NULL),
(7746, 'Rev. 3', 7739, 3902, 2914, NULL, NULL),
(7747, 'Rev. 3', 7740, 3902, 4043, NULL, NULL),
(7748, 'Rev. 3', 7741, 3902, 2919, NULL, NULL),
(7749, 'Rev. 3', 7742, 3902, 3089, NULL, NULL),
(7752, 'Rev. 1', 7728, 3902, 4047, NULL, NULL),
(7753, 'Rev. 2', 7752, 3902, 4048, NULL, NULL),
(7754, 'Rev. 3', 7753, 3902, 4049, NULL, NULL);

--
-- Table `spec_aid_lang` (5)
--

INSERT INTO `spec_aid_lang` (`said`, `description`, `title`, `text`, `xaxis`, `yaxis`, `language`, `spaidid`) VALUES
(971, 'Influence of review teams on the number of faults', '""', 'Legend:
.. Authors, ... Errors in specification, ... Reviewers, ... Number of Errors found, ... Correctors, ... Number of errors corrected, Number of errors remained


Description:
This table summarizes the influence of the review teams on the number of faults in the specification

Explanation/Recommendations:', NULL, NULL, 'en', 3902),
(972, 'Influence of review teams on the number of faults', '""', 'Legend:
.. Autoren, ... Anzahl der Fehler, ... Reviewers, ... Anzahl der gefundenen Fehler, ... Korrektoren, ... Anzahl der korrigierten Fehler, Rest Fehler



Beschreibung:
Diese Tabelle fa?t der Einfluss von Spezifikation Revision-Teams.

Erkl?rung/Empfehlungen:', NULL, NULL, 'de', 3902),
(7271, 'Influence of review teams on the number of faults', '""', 'Legenda:
.. Authors, ... chyby v öpecifik·cii, ... Reviewers, ... poËet n·jden˝ch ch˝b, ... Correctors, ... poËet opraven˝ch ch˝b, ost·vaj˙ce chyby


Popis:
T·to tabuæka sumarizuje vplyv posudzuj˙ceho/posudzuj˙cich tÌmu/tÌmov na poËet z·vad v öpecifik·cii

Vysvetlenie/Odpor˙Ëania:', NULL, NULL, 'sk', 3902);

--
-- Table `spaid_needs_zt` (6)
--

INSERT INTO `spaid_needs_zt` (`spaidid`, `zid`) VALUES
(3902, 6);

--
-- Table `aid_desc_lang` (7)
--

INSERT INTO `aid_desc_lang` (`did`, `description`, `language`, `aiddid`) VALUES
(2270, 'Influence of review teams on the number of faults', 'en', 5535),
(2271, 'Influence of review teams on the number of faults', 'de', 5535),
(5271, 'Influence of review teams on the number of faults', 'sk', 5535);

--
-- Table `aid_inst_lang` (8)
--

INSERT INTO `aid_inst_lang` (`aiid`, `description`, `abbreviation`, `language`, `instid`) VALUES
(72965, 'root', NULL, 'en', 7718),
(72966, 'root', NULL, 'de', 7718),
(172966, 'root', NULL, 'sk', 7718),
(72971, 'Authors', 'Authors', 'en', 7721),
(72972, 'Authors', 'Authors', 'de', 7721),
(172972, 'Authors', 'Authors', 'sk', 7721),
(72973, '# Errors', '# Errors', 'en', 7722),
(72974, '# Errors', '# Errors', 'de', 7722),
(172974, '# Errors', '# Errors', 'sk', 7722),
(72975, 'Reviewers', 'Reviewers', 'en', 7723),
(72976, 'Reviewers', 'Reviewers', 'de', 7723),
(172976, 'Reviewers', 'Reviewers', 'sk', 7723),
(72977, '#Err. found', '#Err. found', 'en', 7724),
(72978, '#Err. found', '#Err. found', 'de', 7724),
(172978, '#Err. found', '#Err. found', 'sk', 7724),
(72979, 'Correctors', 'Correctors', 'en', 7725),
(72980, 'Correctors', 'Correctors', 'de', 7725),
(172980, 'Correctors', 'Correctors', 'sk', 7725),
(72981, '#Err. correct.', '#Err. correct.', 'en', 7726),
(72982, '#Err. correct.', '#Err. correct.', 'de', 7726),
(172982, '#Err. correct.', '#Err. correct.', 'sk', 7726),
(72983, '#Err. remained', '#Err. remained', 'en', 7727),
(72984, '#Err. remained', '#Err. remained', 'de', 7727),
(172984, '#Err. remained', '#Err. remained', 'sk', 7727),
(72987, 'Rev. 1', 'Authors', 'en', 7729),
(72988, 'Rev. 1', 'Authors', 'de', 7729),
(172988, 'Rev. 1', 'Authors', 'sk', 7729),
(72989, 'Rev. 1', '# Errors', 'en', 7730),
(72990, 'Rev. 1', '# Errors', 'de', 7730),
(172990, 'Rev. 1', '# Errors', 'sk', 7730),
(72991, 'Rev. 1', 'Reviewers', 'en', 7731),
(72992, 'Rev. 1', 'Reviewers', 'de', 7731),
(172992, 'Rev. 1', 'Reviewers', 'sk', 7731),
(72993, 'Rev. 1', '#Err. found', 'en', 7732),
(72994, 'Rev. 1', '#Err. found', 'de', 7732),
(172994, 'Rev. 1', '#Err. found', 'sk', 7732),
(72995, 'Rev. 1', 'Correctors', 'en', 7733),
(72996, 'Rev. 1', 'Correctors', 'de', 7733),
(172996, 'Rev. 1', 'Correctors', 'sk', 7733),
(72997, 'Rev. 1', '#Err. correct.', 'en', 7734),
(72998, 'Rev. 1', '#Err. correct.', 'de', 7734),
(172998, 'Rev. 1', '#Err. correct.', 'sk', 7734),
(72999, 'Rev. 1', '#Err. remained', 'en', 7735),
(73000, 'Rev. 1', '#Err. remained', 'de', 7735),
(173000, 'Rev. 1', '#Err. remained', 'sk', 7735),
(73001, 'Influence of review teams on the number of faults', 'Rev.', 'en', 7719),
(73002, 'Influence of review teams on the number of faults', 'Rev.', 'de', 7719),
(173002, 'Influence of review teams on the number of faults', 'Rev.', 'sk', 7719),
(73003, 'Rev. 2', 'Authors', 'en', 7736),
(73004, 'Rev. 2', 'Authors', 'de', 7736),
(173004, 'Rev. 2', 'Authors', 'sk', 7736),
(73005, 'Rev. 2', '# Errors', 'en', 7737),
(73006, 'Rev. 2', '# Errors', 'de', 7737),
(173006, 'Rev. 2', '# Errors', 'sk', 7737),
(73007, 'Rev. 2', 'Reviewers', 'en', 7738),
(73008, 'Rev. 2', 'Reviewers', 'de', 7738),
(173008, 'Rev. 2', 'Reviewers', 'sk', 7738),
(73009, 'Rev. 2', '#Err. found', 'en', 7739),
(73010, 'Rev. 2', '#Err. found', 'de', 7739),
(173010, 'Rev. 2', '#Err. found', 'sk', 7739),
(73011, 'Rev. 2', 'Correctors', 'en', 7740),
(73012, 'Rev. 2', 'Correctors', 'de', 7740),
(173012, 'Rev. 2', 'Correctors', 'sk', 7740),
(73013, 'Rev. 2', '#Err. correct.', 'en', 7741),
(73014, 'Rev. 2', '#Err. correct.', 'de', 7741),
(173014, 'Rev. 2', '#Err. correct.', 'sk', 7741),
(73015, 'Rev. 2', '#Err. remained', 'en', 7742),
(73016, 'Rev. 2', '#Err. remained', 'de', 7742),
(173016, 'Rev. 2', '#Err. remained', 'sk', 7742),
(73017, 'Rev. 3', 'Authors', 'en', 7743),
(73018, 'Rev. 3', 'Authors', 'de', 7743),
(173018, 'Rev. 3', 'Authors', 'sk', 7743),
(73019, 'Rev. 3', '# Errors', 'en', 7744),
(73020, 'Rev. 3', '# Errors', 'de', 7744),
(173020, 'Rev. 3', '# Errors', 'sk', 7744),
(73021, 'Rev. 3', 'Reviewers', 'en', 7745),
(73022, 'Rev. 3', 'Reviewers', 'de', 7745),
(173022, 'Rev. 3', 'Reviewers', 'sk', 7745),
(73023, 'Rev. 3', '#Err. found', 'en', 7746),
(73024, 'Rev. 3', '#Err. found', 'de', 7746),
(173024, 'Rev. 3', '#Err. found', 'sk', 7746),
(73025, 'Rev. 3', 'Correctors', 'en', 7747),
(73026, 'Rev. 3', 'Correctors', 'de', 7747),
(173026, 'Rev. 3', 'Correctors', 'sk', 7747),
(73027, 'Rev. 3', '#Err. correct.', 'en', 7748),
(73028, 'Rev. 3', '#Err. correct.', 'de', 7748),
(173028, 'Rev. 3', '#Err. correct.', 'sk', 7748),
(73029, 'Rev. 3', '#Err. remained', 'en', 7749),
(73030, 'Rev. 3', '#Err. remained', 'de', 7749),
(173030, 'Rev. 3', '#Err. remained', 'sk', 7749),
(73031, 'Cust.', 'Cust.', 'en', 7728),
(73032, 'Cust.', 'Cust.', 'de', 7728),
(173032, 'Cust.', 'Cust.', 'sk', 7728),
(73033, 'Rev. 1', 'Cust.', 'en', 7752),
(73034, 'Rev. 1', 'Cust.', 'de', 7752),
(173034, 'Rev. 1', 'Cust.', 'sk', 7752),
(73035, 'Rev. 2', 'Cust.', 'en', 7753),
(73036, 'Rev. 2', 'Cust.', 'de', 7753),
(173036, 'Rev. 2', 'Cust.', 'sk', 7753),
(73037, 'Rev. 3', 'Cust.', 'en', 7754),
(73038, 'Rev. 3', 'Cust.', 'de', 7754),
(173038, 'Rev. 3', 'Cust.', 'sk', 7754);

-- 3903: Table title : Effot of project phases in hours
-- author: Zofia DomaÒska, July 2008 (A2PPT project)
-- Table per one simulation
-- One row, two columns
-- The data are derived from:
-- Time spent on writing/reviewing/corrections of the specification;
-- Time spent on  writing/reviewing/corrections of the design documents
-- Time spent on  writing/reviewing/corrections of the code;
-- Time spent on  writing/corrections of the tests;
-- Time spent on  writing/reviewing/corrections of the manual;

INSERT INTO `query` (`qid`, `attribute`, `statement`, `z_path`) VALUES
(4052, 'Specificationphase in hours (exact values)', 'SELECT
 ((
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "SPEZIFIKATION_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "SREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(

select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "SREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
))
AS VALUE', NULL),
(4053, 'Designphase in hours total (exact values)', 'SELECT
 (
 (
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "ENTWURF_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
 (
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "MODSPEZ_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "EREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(

select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "EREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "MREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(

select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "MREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)

)
AS VALUE', NULL),
(4054, 'Codephase effort in hours (exact value)', 'SELECT
 ((
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "CODE_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "CREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(

select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "CREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
))
AS VALUE', NULL),
(4055, 'Handbookphase effort in hours (exact value)', 'SELECT
 ((
 SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "PROJEKTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Projectlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "HANDBUCH_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "HREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
)
+
(

select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
     spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "HREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, "%path")=1 order by tnid desc limit 1
))
AS VALUE', NULL),
(4056, 'Test phase effort in hours (total)', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "MTEST_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "MTEST_K_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+
(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "ITEST_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "ITEST_K_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )

+(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "STEST_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "STEST_K_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )

+(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "ATEST_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
+(
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid
AND spaid_needs_zt.zid = zarmstype.zid
AND zarmstype.eorr = "E"
AND zarmstype.z_type = "TESTLOGBUCH"
AND zarmstype.zid = z_entity.zid
AND z_entity.description = "Testlog"
AND z_entity.zeid = comprises.zeid
AND comprises.zaid = z_attribute.zaid
AND z_attribute.name = "ATEST_K_AUFWAND"
AND comprises.compid = s_entity.compid
AND s_entity.gid = game.gid
AND game.gid =%game
AND LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL);

--
-- Table `aid_description` (2)
--

INSERT INTO `aid_description` (`aiddid`, `description`, `type`, `detail`, `kaidid`, `mid`) VALUES
(5536, 'Effort of project phases in hours', NULL, NULL, 1, 1);

--
-- Table `specific_aid` (3)
--

INSERT INTO `specific_aid` (
`spaidid` ,
`description` ,
`diagram` ,
`layout` ,
`qualification` ,
`aiddid`
)
VALUES (
3903 , 'Effort of project phases in hours', 0, 'T', NULL , 5536
);

--
-- Table `aid_instance` (4)
--
INSERT INTO `aid_instance` (`instid`, `description`, `predecessor`, `spaidid`, `qid`, `rlid`, `flag`) VALUES
(7755, 'root', NULL, 3903, NULL, NULL, NULL),
(7756, 'Effort of project phases in hours', 7755, 3903, NULL, NULL, NULL),
(7757, 'S(h)', 7756, 3903, NULL, NULL, NULL),
(7758, 'SD(h)+MD(h)', 7756, 3903, NULL, NULL, NULL),
(7759, 'C(h)', 7756, 3903, NULL, NULL, NULL),
(7760, 'T(h)', 7756, 3903, NULL, NULL, NULL),
(7762, ' ', 7757, 3903, 4052, NULL, NULL),
(7763, ' ', 7758, 3903, 4053, NULL, NULL),
(7764, ' ', 7759, 3903, 4054, NULL, NULL),
(7765, ' ', 7760, 3903, 4056, NULL, NULL),
(7766, 'HB(h)', 7756, 3903, NULL, NULL, NULL),
(7767, ' ', 7766, 3903, 4055, NULL, NULL);


--
-- Table `spec_aid_lang` (5)
--
INSERT INTO `spec_aid_lang` (`said`, `description`, `title`, `text`, `xaxis`, `yaxis`, `language`, `spaidid`) VALUES
(973, 'Effort of project phases in hours', ' ', 'something', NULL, NULL, 'en', 3903),
(974, 'Effort of project phases in hours', ' ', 'etwas', NULL, NULL, 'de', 3903),
(7274, 'Effort of project phases in hours', ' ', 'nieËo', NULL, NULL, 'sk', 3903);


--
-- Table `spaid_needs_zt` (6)
--

INSERT INTO `spaid_needs_zt` (`spaidid`, `zid`) VALUES
(3903, 6),
(3903, 9);

--
-- Table `aid_desc_lang` (7)
--

INSERT INTO `aid_desc_lang` (`did`, `description`, `language`, `aiddid`) VALUES
(2272, 'Effort of project phases in hours', 'en', 5536),
(2273, 'Effort of project phases in hours', 'de', 5536),
(5273, 'Effort of project phases in hours', 'sk', 5536);

--
-- Table `aid_inst_lang` (8)
--

INSERT INTO `aid_inst_lang` (`aiid`, `description`, `abbreviation`, `language`, `instid`) VALUES
(73039, 'root', NULL, 'en', 7755),
(73040, 'root', NULL, 'de', 7755),
(173040, 'root', NULL, 'sk', 7755),
(73041, 'Effort of project phases in hours', 'Time', 'en', 7756),
(73042, 'Effort of project phases in hours', 'Time', 'de', 7756),
(173042, 'Effort of project phases in hours', 'Time', 'sk', 7756),
(73043, 'S(h)', 'S(h)', 'en', 7757),
(73044, 'S(h)', 'S(h)', 'de', 7757),
(173044, 'S(h)', 'S(h)', 'sk', 7757),
(73045, 'SD(h)+MD(h)', 'SD(h)+MD(h)', 'en', 7758),
(73046, 'SD(h)+MD(h)', 'SD(h)+MD(h)', 'de', 7758),
(173046, 'SD(h)+MD(h)', 'SD(h)+MD(h)', 'sk', 7758),
(73047, 'C(h)', 'C(h)', 'en', 7759),
(73048, 'C(h)', 'C(h)', 'de', 7759),
(173048, 'C(h)', 'C(h)', 'sk', 7759),
(73049, 'T(h)', 'T(h)', 'en', 7760),
(73050, 'T(h)', 'T(h)', 'de', 7760),
(173050, 'T(h)', 'T(h)', 'sk', 7760),
(73053, ' ', 'S(h)', 'en', 7762),
(73054, ' ', 'S(h)', 'de', 7762),
(173054, ' ', 'S(h)', 'sk', 7762),
(73055, ' ', 'SD(h)+MD(h)', 'en', 7763),
(73056, ' ', 'SD(h)+MD(h)', 'de', 7763),
(173056, ' ', 'SD(h)+MD(h)', 'sk', 7763),
(73057, ' ', 'C(h)', 'en', 7764),
(73058, ' ', 'C(h)', 'de', 7764),
(173058, ' ', 'C(h)', 'sk', 7764),
(73059, ' ', 'T(h)', 'en', 7765),
(73060, ' ', 'T(h)', 'de', 7765),
(173060, ' ', 'T(h)', 'sk', 7765),
(73061, 'HB(h)', 'HB(h)', 'en', 7766),
(73062, 'HB(h)', 'T(h)', 'de', 7766),
(173062, 'HB(h)', 'T(h)', 'sk', 7766),
(73063, ' ', 'HB(h)', 'en', 7767),
(73064, ' ', 'HB(h)', 'de', 7767),
(173064, ' ', 'HB(h)', 'sk', 7767);


-- 3904: Table title : Effot of project activities in hours
-- author: Andreas Bollin, April 2009 (A2PPT project)
-- Table per one simulation
-- One row, two columns
-- The data are derived from:
-- Time spent on  writing    the specification;
-- Time spent on  reviewing  the specification;
-- Time spent on  correcting the specification;
-- Time spent on  writing    the system design;
-- Time spent on  reviewing  the system design;
-- Time spent on  correcting the system design;
-- Time spent on  writing    the module design;
-- Time spent on  reviewing  the module design;
-- Time spent on  correcting the module design;
-- Time spent on  writing    the code;
-- Time spent on  reviewing  the code;
-- Time spent on  correcting the code;
-- Time spent on  writing    the manual;
-- Time spent on  reviewing  the manual;
-- Time spent on  correcting the manual;
-- Time spent on  writing    the module tests;
-- Time spent on  correcting the module tests;
-- Time spent on  writing    the integration tests;
-- Time spent on  correcting the integration tests;
-- Time spent on  writing    the system tests;
-- Time spent on  correcting the system tests;
-- Time spent on  writing    the acceptance tests;
-- Time spent on  correcting the acceptance tests;

INSERT INTO `query` (`qid`, `attribute`, `statement`, `z_path`) VALUES
--
-- Specification / Writing
--
(4060, 'Specification in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "PROJEKTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Projectlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "SPEZIFIKATION_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- Specification / Review
--
(4061, 'Specification review in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "SREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid = %game AND 
     LOCATE(s_entity.path, "%path")=1 
ORDER BY tnid DESC 
LIMIT 1
))
AS VALUE', NULL),
--
-- Specification / Correction
--
(4062, 'Specification correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where spaid_needs_zt.spaidid = specific_aid.spaidid AND
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "SREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid = %game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC 
LIMIT 1
))
AS VALUE', NULL),
--
-- System Design / Writing
--
(4063, 'System design in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "PROJEKTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Projectlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "ENTWURF_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- System Design / Review
--
(4064, 'System design review in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "EREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- System Design / Correction
--
(4065, 'System design correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "EREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- Module Design / Writing
--
(4066, 'Module design in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "PROJEKTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Projectlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "MODSPEZ_AUFWAND" AND 
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- Module Design / Review
--
(4067, 'Module design review in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "MREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- Module Design / Correction
--
(4068, 'Module design correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "MREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 
))
AS VALUE', NULL),
--
-- Code / Writing
--
(4069, 'Coding effort in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "PROJEKTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Projectlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "CODE_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Code / Review 
--
(4070, 'Code review in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "CREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Code / Correction
--
(4071, 'Code correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "CREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Manuals / Writing
--
(4072, 'Manual writing in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "PROJEKTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Projectlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "HANDBUCH_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Manuals / Review
--
(4073, 'Manual review in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "HREVIEW_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Manuals / Correction
--
(4074, 'Manual correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND
     zarmstype.eorr = "E" AND
     zarmstype.z_type = "REVIEWLOGBUCH" AND
     zarmstype.zid = z_entity.zid AND
     z_entity.description = "Reviewlog" AND
     z_entity.zeid  = comprises.zeid AND
     comprises.zaid = z_attribute.zaid AND
     z_attribute.name = "HREVIEW_K_AUFWAND" AND
     comprises.compid = s_entity.compid AND
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Module Test
--
(4075, 'Module test in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "MTEST_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Module Test correction
--
(4076, 'Module test correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "MTEST_K_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Integration Test
--
(4077, 'Integration test effort in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "ITEST_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Integration Test Correction
--
(4078, 'Integration test correction', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "ITEST_K_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / System Test
--
(4079, 'System Test in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "STEST_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / System Test Correction
--
(4080, 'System test correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "STEST_K_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Writing
--
(4081, 'Acceptance test in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "ATEST_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL),
--
-- Tests / Acceptance Test Correction
--
(4082, 'Acceptance test correction in hours', 'SELECT
((
SELECT DISTINCT s_entity.value
FROM zarmstype, z_entity, z_attribute, comprises, s_entity, game, spaid_needs_zt, specific_aid
WHERE spaid_needs_zt.spaidid = specific_aid.spaidid AND 
     spaid_needs_zt.zid = zarmstype.zid AND 
     zarmstype.eorr = "E" AND 
     zarmstype.z_type = "TESTLOGBUCH" AND 
     zarmstype.zid = z_entity.zid AND 
     z_entity.description = "Testlog" AND 
     z_entity.zeid = comprises.zeid AND 
     comprises.zaid = z_attribute.zaid AND 
     z_attribute.name = "ATEST_K_AUFWAND" AND 
     comprises.compid = s_entity.compid AND 
     s_entity.gid = game.gid AND 
     game.gid =%game AND 
     LOCATE(s_entity.path, "%path")=1
ORDER BY tnid DESC
LIMIT 1 )
)
AS VALUE', NULL);

--
-- Table `aid_description` (2)
--

INSERT INTO `aid_description` (`aiddid`, `description`, `type`, `detail`, `kaidid`, `mid`) VALUES
(5537, 'Effort of project activities in hours', NULL, NULL, 1, 1);

--
-- Table `specific_aid` (3)
--

INSERT INTO `specific_aid` (`spaidid`, `description`, `diagram`, `layout`, `qualification`, `aiddid` ) VALUES (
3904 , 'Effort of project activities in hours', 0, 'T', NULL , 5537
);

-- Table `aid_instance` (4)
--
INSERT INTO `aid_instance` (`instid`, `description`, `predecessor`, `spaidid`, `qid`, `rlid`, `flag`) VALUES
(7768, 'root', NULL, 3904, NULL, NULL, NULL),
(7769, 'Effort of project phases in hours', 7768, 3904, NULL, NULL, NULL),
(7770, 'S(h)', 7769, 3904, NULL, NULL, NULL),
(7771, ' ', 7770, 3904, 4060, NULL, NULL),
(7772, 'SR(h)', 7769, 3904, NULL, NULL, NULL),
(7773, ' ', 7772, 3904, 4061, NULL, NULL),
(7774, 'SC(h)', 7769, 3904, NULL, NULL, NULL),
(7775, ' ', 7774, 3904, 4062, NULL, NULL),
(7776, 'SD(h)', 7769, 3904, NULL, NULL, NULL),
(7777, ' ', 7776, 3904, 4063, NULL, NULL),
(7778, 'SDR(h)', 7769, 3904, NULL, NULL, NULL),
(7779, ' ', 7778, 3904, 4064, NULL, NULL),
(7780, 'SDC(h)', 7769, 3904, NULL, NULL, NULL),
(7781, ' ', 7780, 3904, 4065, NULL, NULL),
(7782, 'MD(h)', 7769, 3904, NULL, NULL, NULL),
(7783, ' ', 7782, 3904, 4066, NULL, NULL),
(7784, 'MDR(h)', 7769, 3904, NULL, NULL, NULL),
(7785, ' ', 7784, 3904, 4067, NULL, NULL),
(7786, 'MDC(h)', 7769, 3904, NULL, NULL, NULL),
(7787, ' ', 7786, 3904, 4068, NULL, NULL),
(7788, 'C(h)', 7769, 3904, NULL, NULL, NULL),
(7789, ' ', 7788, 3904, 4069, NULL, NULL),
(7790, 'CR(h)', 7769, 3904, NULL, NULL, NULL),
(7791, ' ', 7790, 3904, 4070, NULL, NULL),
(7792, 'CRC(h)', 7769, 3904, NULL, NULL, NULL),
(7793, ' ', 7792, 3904, 4071, NULL, NULL),
(7794, 'M(h)', 7769, 3904, NULL, NULL, NULL),
(7795, ' ', 7794, 3904, 4072, NULL, NULL),
(7796, 'MR(h)', 7769, 3904, NULL, NULL, NULL),
(7797, ' ', 7796, 3904, 4073, NULL, NULL),
(7798, 'MRC(h)', 7769, 3904, NULL, NULL, NULL),
(7799, ' ', 7798, 3904, 4074, NULL, NULL),
(7800, 'MT(h)', 7769, 3904, NULL, NULL, NULL),
(7801, ' ', 7800, 3904, 4075, NULL, NULL),
(7802, 'MTC(h)', 7769, 3904, NULL, NULL, NULL),
(7803, ' ', 7802, 3904, 4076, NULL, NULL),
(7804, 'IT(h)', 7769, 3904, NULL, NULL, NULL),
(7805, ' ', 7804, 3904, 4077, NULL, NULL),
(7806, 'ITC(h)', 7769, 3904, NULL, NULL, NULL),
(7807, ' ', 7806, 3904, 4078, NULL, NULL),
(7808, 'ST(h)', 7769, 3904, NULL, NULL, NULL),
(7809, ' ', 7808, 3904, 4079, NULL, NULL),
(7810, 'STC(h)', 7769, 3904, NULL, NULL, NULL),
(7811, ' ', 7810, 3904, 4080, NULL, NULL),
(7812, 'AT(h)', 7769, 3904, NULL, NULL, NULL),
(7813, ' ', 7812, 3904, 4081, NULL, NULL),
(7814, 'ATC(h)', 7769, 3904, NULL, NULL, NULL),
(7815, ' ', 7814, 3904, 4082, NULL, NULL);

--
-- Table `spec_aid_lang` (5)
--
INSERT INTO `spec_aid_lang` (`said`, `description`, `title`, `text`, `xaxis`, `yaxis`, `language`, `spaidid`) VALUES
(975, 'Effort of project activities in hours', 'Effort', 'Effort for all project activities', NULL, NULL, 'en', 3904),
(976, 'Aufwand von Aktivitaeten in Stunden', 'Aufwand', 'Aufwand von Projektativitaeten', NULL, NULL, 'de', 3904),
(7276, '⁄silie aktivÌt spojen˝ch s projektom v hodin·ch', '⁄silie', '⁄silie vöetk˝ch aktivÌt spojen˝ch s projektom', NULL, NULL, 'sk', 3904);


--
-- Table `spaid_needs_zt` (6)
--

INSERT INTO `spaid_needs_zt` (`spaidid`, `zid`) VALUES
(3904, 6),
(3904, 9);

--
-- Table `aid_desc_lang` (7)
--

INSERT INTO `aid_desc_lang` (`did`, `description`, `language`, `aiddid`) VALUES
(2274, 'Effort of project phases in hours', 'en', 5537),
(2275, 'Effort of project phases in hours', 'de', 5537),
(5275, '⁄silie vynaloû. na jedn. f·zy projektu v hod.', 'sk', 5537);

--
-- Table `aid_inst_lang` (8)
--

INSERT INTO `aid_inst_lang` (`aiid`, `description`, `abbreviation`, `language`, `instid`) VALUES
(73065, 'root', NULL, 'en', 7768),
(73066, 'root', NULL, 'de', 7768),
(173066, 'root', NULL, 'sk', 7768),
(73067, 'Effort of project activities in hours', 'Time', 'en', 7769),
(73068, 'Effort of project activities in hours', 'Time', 'de', 7769),
(173068, '⁄silie vynaloû. na aktivity projektu v hodin·ch', '»as', 'sk', 7769),
--
(73069, 'Specification in hours',   'S(h)', 'en', 7770),
(73070, 'Spezifikation in Stunden', 'S(h)', 'de', 7770),
(173070, 'äpecifik·cia v hodin·ch', 'ä(h)', 'sk', 7770),
(73071, ' ', 'S(h)', 'en', 7771),
(73072, ' ', 'S(h)', 'de', 7771),
(173072, ' ', 'ä(h)', 'sk', 7771),
--
(73073, 'Specification review in hours',   'SR(h)', 'en', 7772),
(73074, 'Spezifikationsreview in Stunden', 'SR(h)', 'de', 7772),
(173074, 'Posudzovanie öpecifi. v hodin·ch', 'Pä(h)', 'sk', 7772),
(73075, ' ', 'SR(h)', 'en', 7773),
(73076, ' ', 'SR(h)', 'de', 7773),
(173076, ' ', 'Pä(h)', 'sk', 7773),
--
(73077, 'Specification correction in hours',   'SC(h)', 'en', 7774),
(73078, 'Spezifikationskorrektur in Stunden',  'SC(h)', 'de', 7774),
(173078, 'Opravy öpecifik·cie v hodin·ch',  'Oä(h)', 'sk', 7774),
(73079, ' ', 'SC(h)', 'en', 7775),
(73080, ' ', 'SC(h)', 'de', 7775),
(173080, ' ', 'Oä(h)', 'sk', 7775),
--
(73081, 'System design in hours',   'SD(h)', 'en', 7776),
(73082, 'Systemdesign in Stunden',  'SD(h)', 'de', 7776),
(173082, 'N·vrh systÈmu v hodin·ch',  'NS(h)', 'sk', 7776),
(73083, ' ', 'SD(h)', 'en', 7777),
(73084, ' ', 'SD(h)', 'de', 7777),
(173084, ' ', 'NS(h)', 'sk', 7777),
--
(73085, 'System design review in hours',  'SDR(h)', 'en', 7778),
(73086, 'Systemdesignreview in Stunden',  'SDR(h)', 'de', 7778),
(173086, 'Posudzovanie n·vrhu systÈmu v hodin·ch',  'PNS(h)', 'sk', 7778),
(73087, ' ', 'SDR(h)', 'en', 7779),
(73088, ' ', 'SDR(h)', 'de', 7779),
(173088, ' ', 'PNS(h)', 'sk', 7779),
--
(73089, 'System design correction in hours',  'SDC(h)', 'en', 7780),
(73090, 'Systemdesign Korrektur in Stunden',  'SDC(h)', 'de', 7780),
(173090, 'Opravy n·vrhu systÈmu v hodin·ch',  'ONS(h)', 'sk', 7780),
(73091, ' ', 'SDC(h)', 'en', 7781),
(73092, ' ', 'SDC(h)', 'de', 7781),
(173092, ' ', 'ONS(h)', 'sk', 7781),
--
(73093, 'Module design in hours',  'MD(h)', 'en', 7782),
(73094, 'Moduldesign in Stunden',  'MD(h)', 'de', 7782),
(173094, 'N·vrh modulov v hodin·ch',  'NM(h)', 'sk', 7782),
(73095, ' ', 'MD(h)', 'en', 7783),
(73096, ' ', 'MD(h)', 'de', 7783),
(173096, ' ', 'NM(h)', 'sk', 7783),
--
(73097, 'Module design review in hours',  'MDR(h)', 'en', 7784),
(73098, 'Moduldesignreview in Stunden',  'MDR(h)', 'de', 7784),
(173098, 'Posudzovanie n·vrhu modulov v hodin·ch',  'PNM(h)', 'sk', 7784),
(73099, ' ', 'MDR(h)', 'en', 7785),
(73100, ' ', 'MDR(h)', 'de', 7785),
(173100, ' ', 'PNM(h)', 'sk', 7785),
--
(73101, 'Module design correction in hours',  'MDC(h)', 'en', 7786),
(73102, 'Moduldesign Korrektur in Stunden',  'MDC(h)', 'de', 7786),
(173102, 'Opravy n·vrhu modulov v hodin·ch',  'ONM(h)', 'sk', 7786),
(73103, ' ', 'MDC(h)', 'en', 7787),
(73104, ' ', 'MDC(h)', 'de', 7787),
(173104, ' ', 'ONM(h)', 'sk', 7787),
--
(73105, 'Coding in hours',  'C(h)', 'en', 7788),
(73106, 'Kodierung in Stunden',  'C(h)', 'de', 7788),
(173106, 'Implement·cia v hodin·ch',  'I(h)', 'sk', 7788),
(73107, ' ', 'C(h)', 'en', 7789),
(73108, ' ', 'C(h)', 'de', 7789),
(173108, ' ', 'I(h)', 'sk', 7789),
--
(73109, 'Code review in hours',  'CR(h)', 'en', 7790),
(73110, 'Codereview in Stunden',  'CR(h)', 'de', 7790),
(173110, 'Posudzovanie kÛdu v hodin·ch',  'PK(h)', 'sk', 7790),
(73111, ' ', 'CR(h)', 'en', 7791),
(73112, ' ', 'CR(h)', 'de', 7791),
(173112, ' ', 'PK(h)', 'sk', 7791),
--
(73113, 'Code correction in hours',  'CRC(h)', 'en', 7792),
(73114, 'Code Korrektur in Stunden',  'CRC(h)', 'de', 7792),
(173114, 'Opravy kÛdu v hodin·ch',  'OK(h)', 'sk', 7792),
(73115, ' ', 'CRC(h)', 'en', 7793),
(73116, ' ', 'CRC(h)', 'de', 7793),
(173116, ' ', 'OK(h)', 'sk', 7793),
--
(73117, 'Manual in hours',  'M(h)', 'en', 7794),
(73118, 'Handbuch in Stunden',  'M(h)', 'de', 7794),
(173118, 'PrÌruËky v hodin·ch',  'P(h)', 'sk', 7794),
(73119, ' ', 'M(h)', 'en', 7795),
(73120, ' ', 'M(h)', 'de', 7795),
(173120, ' ', 'P(h)', 'sk', 7795),
--
(73121, 'Manual review in hours',  'MR(h)', 'en', 7796),
(73122, 'Handbuch Review in Stunden',  'MR(h)', 'de', 7796),
(173122, 'Posudzovanie prÌruËiek v hodin·ch',  'PP(h)', 'sk', 7796),
(73123, ' ', 'MR(h)', 'en', 7797),
(73124, ' ', 'MR(h)', 'de', 7797),
(173124, ' ', 'PP(h)', 'sk', 7797),
--
(73125, 'Manual correction in hours',  'MRC(h)', 'en', 7798),
(73126, 'Handbuch Korrektur in Stunden',  'MRC(h)', 'de', 7798),
(173126, 'Opravy prÌruËiek v hodin·ch',  'OP(h)', 'sk', 7798),
(73127, ' ', 'MRC(h)', 'en', 7799),
(73128, ' ', 'MRC(h)', 'de', 7799),
(173128, ' ', 'OP(h)', 'sk', 7799),
--
(73129, 'Module test in hours',  'MT(h)', 'en', 7800),
(73130, 'Modultest in Stunden',  'MT(h)', 'de', 7800),
(173130, 'Testovanie modulov v hodin·ch',  'TM(h)', 'sk', 7800),
(73131, ' ', 'MT(h)', 'en', 7801),
(73132, ' ', 'MT(h)', 'de', 7801),
(173132, ' ', 'TM(h)', 'sk', 7801),
--
(73133, 'Module test correction in hours',  'MTC(h)', 'en', 7802),
(73134, 'Modultest Korrektur in Stunden',  'MTC(h)', 'de', 7802),
(173134, 'Opravy modulov v hodin·ch',  'OM(h)', 'sk', 7802),
(73135, ' ', 'MTC(h)', 'en', 7803),
(73136, ' ', 'MTC(h)', 'de', 7803),
(173136, ' ', 'OM(h)', 'sk', 7803),
--
(73137, 'Integration test in hours',  'IT(h)', 'en', 7804),
(73138, 'Integrationstest in Stunden',  'IT(h)', 'de', 7804),
(173138, 'Testovanie integr·cie v hodin·ch',  'TI(h)', 'sk', 7804),
(73139, ' ', 'IT(h)', 'en', 7805),
(73140, ' ', 'IT(h)', 'de', 7805),
(173140, ' ', 'TI(h)', 'sk', 7805),
--
(73141, 'Integration test correction in hours',  'ITC(h)', 'en', 7806),
(73142, 'Integrationstest Korrektur in Stunden',  'ITC(h)', 'de', 7806),
(173142, 'Opravy pre potreby integr·cie v hodin·ch',  'OPPI(h)', 'sk', 7806),
(73143, ' ', 'ITC(h)', 'en', 7807),
(73144, ' ', 'ITC(h)', 'de', 7807),
(173144, ' ', 'OPPI(h)', 'sk', 7807),
--
(73145, 'System test in hours',  'ST(h)', 'en', 7808),
(73146, 'Systemtest in Stunden',  'ST(h)', 'de', 7808),
(173146, 'Testovanie systÈmu v hodin·ch',  'TS(h)', 'sk', 7808),
(73147, ' ', 'ST(h)', 'en', 7809),
(73148, ' ', 'ST(h)', 'de', 7809),
(173148, ' ', 'TS(h)', 'sk', 7809),
--
(73149, 'System test correction in hours',  'STC(h)', 'en', 7810),
(73150, 'Systemtest Korrektur in Stunden',  'STC(h)', 'de', 7810),
(173150, 'Opravy z testovanie systÈmu v hodin·ch',  'OzTS(h)', 'sk', 7810),
(73151, ' ', 'STC(h)', 'en', 7811),
(73152, ' ', 'STC(h)', 'de', 7811),
(173152, ' ', 'OzTS(h)', 'sk', 7811),
--
(73153, 'Acceptance test in hours',  'AT(h)', 'en', 7812),
(73154, 'Akzeptanztest in Stunden',  'AT(h)', 'de', 7812),
(173154, 'AkceptaËn˝ test v hodin·ch',  'AT(h)', 'sk', 7812),
(73155, ' ', 'AT(h)', 'en', 7813),
(73156, ' ', 'AT(h)', 'de', 7813),
(173156, ' ', 'AT(h)', 'sk', 7813),
--
(73157, 'Acceptance test correction in hours',  'ATC(h)', 'en', 7814),
(73158, 'Akzeptanztest Korrektur in Stunden',  'ATC(h)', 'de', 7814),
(173158, 'Opravy z akceptaËnÈho testovania v hodin·ch',  'OzAT(h)', 'sk', 7814),
(73159, ' ', 'ATC(h)', 'en', 7815),
(73160, ' ', 'ATC(h)', 'de', 7815),
(173160, ' ', 'OzAT(h)', 'sk', 7815);



/****************************************************/
/*   Goal achievement (Daniela Pohl AORTA Bugfix)   */
/****************************************************/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) VALUES(9413,"Goal achievement",NULL,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(91226,"Goal achievement","en",9413);

/* maier */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(91227,"Goal achievement","de",9413);
/* daÚo */
INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES(191227,"Goal achievement","sk",9413);

INSERT INTO specific_aid(spaidid,description,diagram,layout,qualification,aiddid) VALUES (93112,"Goal achievement",0,"T",NULL,9413);
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (9824,"Goal achievement","
Legend:
Duration ... length of project (in days), Costs ... project costs (in EUR), C(%) ... AFPs contained in the code (in percent), #E/KLOC ... number of errors (per 1000 lines of code), Man(%) ... AFPs contained in the user's documentation (in percent), #E/Page ... number of errors (per page in the user's documentation).

Description:
This table summarizes the goal achievement (GA) of the simulation run. The line 'Results' summarizes the actual results, the line 'Goals' summarizes the values as demanded by the customer.

Explanation/Recommendations:
Goal achievement is a must for every project manager. However, in some situations minor deviations might be acceptable by the customer. You should take a look at Section 8 where the customer's feedback tells you whether s/he accepts the final product or not.","",null,null,"en",93112);

/* maier */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (9825,"Goal achievement","
Legende:
Duration ... Projektdauer (in Tagen), Costs ... Projektkosten (in EUR), C(%) ... AFPs enthalten im Code (in Prozent), #E/KLOC ... Anzahl Fehler (pro 1000 Zeilen Code), Man(%) ... AFPs enthalten in der Benutzerdokumentation (in Prozent), #E/Page ... Anzahl Fehler (pro Seite in der Benutzerdokumentation).

Beschreibung:
Diese Tabelle faﬂt die Zielerreichung (GA) des Simulationslaufs zusammen. Die Zeile 'Results' faﬂt die
tats‰chlichen Ergebnisse, die Zeile 'Goals' die Werte, die vom Kunden gefordert waren,
zusammen.

Erkl‰rung/Empfehlungen:
Zielerreichung ist ein Muss f¸r jeden Projektmanager. Jedoch kˆnnen in einigen Situationen kleine Abweichungen durch den Kunden annehmbar sein. In Abschnitt 8 ist feststellbar, ob aufgrund des Kundenfeedback der Kunde das Endprodukt schlieﬂlich annimmt oder nicht.","",null,null,"de",93112);

/* daÚo */
INSERT INTO spec_aid_lang(said,description,text,title,xaxis,yaxis,language,spaidid) VALUES (19825,"Dosiahnutie cieæov","
Legenda:
Duration ... dÂûka projektu (v dÚoch), Costs ... n·klady na projekt (v EUR), C(%) ... AFPs zahrnutÈ v kÛde (v percent·ch), #E/KLOC ... poËet ch˝b (pripadaj˙cich na 1000 riadkov kÛdu), Man(%) ... AFPs zahrnutÈ dokument·cii pre pouûÌvateæa (v percent·ch), #E/Page ... poËet ch˝b (pripadaj˙cich na stranu dokument·cie pre pouûÌvateæa).

Popis:
T·to tabuæka sumarizuje dosiahnutie cieæov (GA) spustenia simul·cie. Riadok 'Results' sumarizuje aktu·lne v˝sledky, riadok 'Goals' sumarizuje hodnoty tak, ako ich poûaduje z·kaznÌk.

Vysvetlenie/Odpor˙Ëania:
Dosiahnutie cieæov je nevyhnutnosùou pre kaûdÈho projektovÈho manaûÈra. Akokoævek, v niektor˝ch situ·ci·ch mÙûu byù menöie odch˝lky z·kaznÌkom akceptovanÈ. Mali by ste sa pozrieù na sekciu 8, kde V·m z·kaznÌkova sp‰tn· v‰zba povie, Ëi je v˝sledn˝ produkt akceptovan˝ alebo nie.",
"",null,null,"sk",93112);


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93209,"root",NULL,93112,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942137,"root",null,"en",93209);
/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943052,"root",null,"de",93209);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943052,"root",null,"sk",93209);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93210,"",93209,93112,null,NULL);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942138,"","GA","en",93210);
/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943053,"","GA","de",93210);
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943053,"","GA","sk",93210);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (999999,"Team",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93211,"Duration",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93212,"Costs",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93213,"C(%)",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93214,"#E/KLOC",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93215,"Man(%)",93210,93112,null,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93216,"#E/Page",93210,93112,null,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (9999991,"Team","TE","en",999999);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942319,"Duration","LE","en",93211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942320,"Costs","CO","en",93212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942321,"C(%)","AFPC","en",93213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942322,"#E/KLOC","FC","en",93214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942323,"Man(%)","AFPM","en",93215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942324,"#E/Page","FM","en",93216);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (9999992,"Team","TE","de",999999);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943054,"Duration","LE","de",93211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943055,"Costs","CO","de",93212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943056,"C(%)","AFPC","de",93213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943057,"#E/KLOC","FC","de",93214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943058,"Man(%)","AFPM","de",3215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943059,"#E/Page","FM","de",93216);

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (19999992,"Team","TE","sk",999999);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943054,"Duration","LE","sk",93211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943055,"Costs","CO","sk",93212);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943056,"C(%)","AFPC","sk",93213);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943057,"#E/KLOC","FC","sk",93214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943058,"Man(%)","AFPM","sk",3215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943059,"#E/Page","FM","sk",93216);

/* 21.08.07 turn? */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (92903," ",
'select distinct datediff(
(SELECT turn.date
FROM game, turn
WHERE game.gid = %game
AND game.act_turn = turn.tnid),
(select distinct model_instance.start_date
from model,model_instance,tournament,rnd,game,turn where
model_instance.mid = model.mid AND
model_instance.minstid = tournament.minstid AND
tournament.tid = rnd.tid AND rnd.rndid = game.rndid
AND game.gid = %game)) as value;',null);

INSERT INTO query(qid,attribute,statement,z_path) VALUES (92904," ",
'select  max(cast(s_entity.value as signed)) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**PROJEKTZUSTAND*Projectstatus*KOSTEN");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (92905," ",
'select  max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**CODE*Code*PROZENT_AFP_100");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (92906," ",
'select  s_entity.value as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_KLOC" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**CODE*Code*FEHLER_PRO_KLOC");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (92907," ",
'select  max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',"**HANDBUCH*Manuals*PROZENT_AFP_100");

INSERT INTO query(qid,attribute,statement,z_path) VALUES (92908," ",
'select  s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_SEITE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by tnid desc limit 1;',"**HANDBUCH*Manuals*FEHLER_PRO_SEITE");

INSERT INTO query(qid,attribute,statement) VALUES (93176, '', 'select 270 as value');
INSERT INTO query(qid,attribute,statement) VALUES (93177, '', 'select 225000 as value');
INSERT INTO query(qid,attribute,statement) VALUES (93178, '', 'select 95.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (93179, '', 'select 12.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (93180, '', 'select 95.0 as value');
INSERT INTO query(qid,attribute,statement) VALUES (93181, '', 'select 0.5 as value');

/* query to get team name */
INSERT INTO query(qid,attribute,statement,z_path) VALUES (999999, '', '
select CONCAT(A.forename, \" \", A.surname) as value FROM person A, game B where B.pid = A.pid and B.gid = %game ;' , '');


/* INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (99999933,"Results",93211,93112,999999,NULL); ohne 33*/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (99999933,"Results",999999,93112,999999,NULL);
/*INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93217,"Results",99999933,93112,92903,NULL);*/
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93217,"Results",93211,93112,92903,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93218,"Results",93212,93112,92904,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93219,"Results",93213,93112,92905,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93220,"Results",93214,93112,92906,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93221,"Results",93215,93112,92907,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93222,"Results",93216,93112,92908,NULL);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (999991,"Results","","en",99999933);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942325,"Results","","en",93217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942326,"Results","PO","en",93218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942327,"Results","PO","en",93219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942328,"Results","PO","en",93220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942329,"Results","PO","en",93221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942330,"Results","PO","en",93222);

/* maier */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (999992,"Results","","de",99999933);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943060,"Results","","de",93217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943061,"Results","PO","de",93218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943062,"Results","PO","de",93219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943063,"Results","PO","de",93220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943064,"Results","PO","de",93221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943065,"Results","PO","de",93222);
/* */
/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1999992,"Results","","sk",99999933);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943060,"Results","","sk",93217);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943061,"Results","PO","sk",93218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943062,"Results","PO","sk",93219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943063,"Results","PO","sk",93220);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943064,"Results","PO","sk",93221);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943065,"Results","PO","sk",93222);

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (999888,"Goals",99999933,93112,999999,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93544,"Goals",93217,93112,93176,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93545,"Goals",93218,93112,93177,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93546,"Goals",93219,93112,93178,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93547,"Goals",93220,93112,93179,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93548,"Goals",93221,93112,93180,NULL);
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid) VALUES (93549,"Goals",93222,93112,93181,NULL);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (999881,"Goals","OBJ","en",999888);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942681,"Goals","OBJ","en",93544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942682,"Goals","OBJ","en",93545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942683,"Goals","OBJ","en",93546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942684,"Goals","OBJ","en",93547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942685,"Goals","OBJ","en",93548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (942686,"Goals","OBJ","en",93549);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (999882,"Goals","OBJ","de",999888);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943066,"Goals","OBJ","de",93544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943067,"Goals","OBJ","de",93545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943068,"Goals","OBJ","de",93546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943069,"Goals","OBJ","de",93547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943070,"Goals","OBJ","de",93548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (943071,"Goals","OBJ","de",93549);
/* */

/* daÚo */
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1999882,"Goals","OBJ","sk",999888);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943066,"Goals","OBJ","sk",93544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943067,"Goals","OBJ","sk",93545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943068,"Goals","OBJ","sk",93546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943069,"Goals","OBJ","sk",93547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943070,"Goals","OBJ","sk",93548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid) VALUES (1943071,"Goals","OBJ","sk",93549);
/* */