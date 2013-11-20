/*******************************/
/*******************************/
/**** autor made correction ****/
/*******************************/
/*******************************/



/* vF2: Autor sollte seine Dokumente selbst korrigieren  */
/*      (für jedes Dokument)                             */
/* vF2a: Spezifikation                                   */


INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2004,NULL,'NOT IN',null,null);


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (105,"autor made the correction (S)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (210,"*","en",105);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (429,"*","fr",105);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (211,"*","de",105);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2505,"autor made the correction (S)",
105);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (510,"You should appoint the author of the document to do the correction of the specification!",
"en",2505);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (660,"Vous devez charger l'auteur du manuel pour effectuer la correction des spécifications!",
"fr",2505);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (511,"Sie sollten den Autor der Spezifikation für die Korrektur des Dokuments einsetzen!",
"de",2505);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2515,"*",null,2505,2018,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30030,"*","*","en",2515);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20067,"*","*","fr",2515);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30031,"*","*","de",2515);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2516,"*",2515,2505,2055,2004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30032,"*","*","en",2516);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20068,"*","*","fr",2516);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30033,"*","*","de",2516);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2517,"*",2516,2505,2060,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30034,"*","*","en",2517);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20069,"*","*","fr",2517);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30035,"*","*","de",2517);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2060,"Korrektur der Spezifikation",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "KORRIGIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Spezifikation" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*document=Specification");


/* vF2b: Systemdesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (106,"autor made the correction (SD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (212,"*","en",106);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (430,"*","fr",106);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (213,"*","de",106);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2506,"autor made the correction (SD)",
106);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (512,"You should appoint the author of the document to do the correction of the system design!",
"en",2506);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (661,"Vous devez charger l'auteur de la conception du système pour effectuer la correction du document!",
"fr",2506);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (513,"Sie sollten den Autor des Systemdesigns für die Korrektur des Dokuments einsetzen!",
"de",2506);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2518,"*",null,2506,2019,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30036,"*","*","en",2518);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20070,"*","*","fr",2518);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30037,"*","*","de",2518);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2519,"*",2518,2506,2056,2004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30038,"*","*","en",2519);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20071,"*","*","fr",2519);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30039,"*","*","de",2519);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2520,"*",2519,2506,2061,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30040,"*","*","en",2520);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20072,"*","*","fr",2520);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30041,"*","*","de",2520);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2061,"Korrektur des Systemdesigns",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "KORRIGIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Systemdesign" AND
	s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*document=Systemdesign");


/* vF2c: Moduldesign  */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (107,"autor made the correction (MD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (214,"*","en",107);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (215,"*","de",107);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (431,"*","fr",107);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2507,"autor made the correction (MD)",
107);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (514,"You should appoint the author of the document to do the correction of the module design!",
"en",2507);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (662,"Vous devez charger l'auteur de la conception des modules pour effectuer la correction du document!",
"fr",2507);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (515,"Sie sollten den Autor des Moduldesigns für die Korrektur des Dokuments einsetzen!",
"de",2507);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2521,"*",null,2507,2020,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30042,"*","*","en",2521);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20073,"*","*","fr",2521);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30043,"*","*","de",2521);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2522,"*",2521,2507,2057,2004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30044,"*","*","en",2522);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20074,"*","*","fr",2522);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30045,"*","*","de",2522);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2523,"*",2522,2507,2062,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30046,"*","*","en",2523);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20075,"*","*","fr",2523);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30047,"*","*","de",2523);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2062,"Korrektur des Moduldesigns",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "KORRIGIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Moduldesign" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*document=Moduledesign");


/* vF2d: Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (108,"autor made the correction (C)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (216,"*","en",108);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (432,"*","fr",108);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (217,"*","de",108);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2508,"autor made the correction (C)",
108);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (516,"You should appoint the author of the document to do the correction of the code!",
"en",2508);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (663,"Vous devez charger l'auteur du code système pour effectuer la correction du document!",
"fr",2508);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (517,"Sie sollten den Autor des Codes für die Korrektur des Dokuments einsetzen!",
"de",2508);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2524,"*",null,2508,2026,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30048,"*","*","en",2524);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20076,"*","*","fr",2524);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30049,"*","*","de",2524);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2026,"Beginn der Codereviewkorrekturphase",
'select distinct s_entity.value
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
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*CREVIEW_K_BEGINN");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2525,"*",2524,2508,2058,2004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30050,"*","*","en",2525);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20077,"*","*","fr",2525);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30051,"*","*","de",2525);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2526,"*",2525,2508,2063,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30052,"*","*","en",2526);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20078,"*","*","fr",2526);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30053,"*","*","de",2526);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2063,"Korrektur des Codes",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "KORRIGIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Code" AND
	s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*document=Code");


/* vF2e: Handbuch */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (109,"autor made the correction (M)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (218,"*","en",109);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (433,"*","fr",109);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (219,"*","de",109);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2509,"autor made the correction (M)",
109);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (518,"You should appoint the author of the document to do the correction of the manuals!",
"en",2509);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (664,"Vous devez charger l'auteur du manuel pour effectuer la correction du document!",
"fr",2509);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (519,"Sie sollten den Autor des Handbuchs für die Korrektur des Dokuments einsetzen!",
"de",2509);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2527,"*",null,2509,2027,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30054,"*","*","en",2527);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20079,"*","*","fr",2527);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30055,"*","*","de",2527);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2027,"Beginn des Handbuchreviewkorrekturphase",
'select distinct s_entity.value
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
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*HREVIEW_K_BEGINN");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2528,"*",2527,2509,2059,2004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30056,"*","*","en",2528);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20080,"*","*","fr",2528);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30057,"*","*","de",2528);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2529,"*",2528,2509,2064,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30058,"*","*","en",2529);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20081,"*","*","fr",2529);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30059,"*","*","de",2529);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2064,"Korrektur des Handbuch",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "KORRIGIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Manuals" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*document=Manuals");
