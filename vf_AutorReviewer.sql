/***************************/
/***************************/
/**** autor != reviewer ****/
/***************************/
/***************************/


/* vF1: Autor nicht als Gutachter einsetzen  */
/*      (für jedes Dokument)                 */
/* vF1a: Spezifikation                       */

delete from aid_description where kaidid=3;


/* REST */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (100,
"autor != reviewer (S)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (200,"*","en",100);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (201,"*","de",100);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (424,"*","fr",100);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2500,"autor != reviewer (S)",
100);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (500,"The author of the specification shouldn't be appointed to do the review!",
"en",2500);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (501,"Sie sollten den Autor der Spezifikation nicht auch als Prüfer einsetzen!",
"de",2500);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (646,"L'auteur de la spécification ne doit pas en faire la révision!",
"fr",2500);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2500,"*",null,2500,2015,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30000,"*","*","en",2500);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20052,"*","*","fr",2500);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30001,"*","*","de",2500);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2501,"*",2500,2500,2050,2002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30002,"*","*","en",2501);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30003,"*","*","de",2501);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20053,"*","*","fr",2501);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2002,null,'IN',null,null);

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2050,"Gutachter der Spezifikation",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "BEGUTACHTET" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Specification" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*BEGUTACHTET*document=Specification");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2502,"*",2501,2500,2055,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30004,"*","*","en",2502);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20054,"*","*","fr",2502);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30005,"*","*","de",2502);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2055,"Autoren der Spezifikation",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Spezifikation" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Specification");


/* vF1b: Systemdesign */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (101,"autor != reviewer (SD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (202,"*","en",101);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (425,"*","fr",101);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (203,"*","de",101);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2501,"autor != reviewer (SD)",
101);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (502,"The author of the system design shouldn't be appointed to do the review!",
"en",2501);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (647,"L'auteur de la conception du système ne doit pas en faire la révision!",
"fr",2501);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (503,"Sie sollten den Autor des Systemdesigns nicht auch als Prüfer einsetzen!",
"de",2501);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2503,"*",null,2501,2016,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30006,"*","*","en",2503);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20055,"*","*","fr",2503);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30007,"*","*","de",2503);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2504,"*",2503,2501,2051,2002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30008,"*","*","en",2504);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20056,"*","*","fr",2504);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30009,"*","*","de",2504);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2051,"Gutachter des Systementwurfs",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "BEGUTACHTET" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Systemdesign" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*BEGUTACHTET*document=Specification");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2505,"*",2504,2501,2056,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30010,"*","*","en",2505);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20057,"*","*","fr",2505);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30011,"*","*","de",2505);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2056,"Autoren des Systemdesigns",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Systemdesign" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Systemdesign");


/* vF1c: Moduledesign */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (102,"autor != reviewer (MD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (204,"*","en",102);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (426,"*","fr",102);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (205,"*","de",102);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2502,"autor != reviewer (MD)",
102);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (504,"The author of the module design shouldn't be appointed to do the review!",
"en",2502);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (648,"The de la conception des modules ne doit pas en faire la révision!",
"fr",2502);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (505,"Sie sollten den Autor des Moduledesigns nicht auch als Prüfer einsetzen!",
"de",2502);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2506,"*",null,2502,2017,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30012,"*","*","en",2506);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20058,"*","*","fr",2506);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30013,"*","*","de",2506);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2507,"*",2506,2502,2052,2002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30014,"*","*","en",2507);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20059,"*","*","fr",2507);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30015,"*","*","de",2507);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2052,"Gutachter des Moduldesigns",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "BEGUTACHTET" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Moduledesign" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*BEGUTACHTET*document=Moduledesign");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2508,"*",2507,2502,2057,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30016,"*","*","en",2508);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20060,"*","*","fr",2508);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30017,"*","*","de",2508);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2057,"Autoren des Moduldesigns",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Moduldesign" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Moduledesign");


/* vF1d: Code */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (103,"autor != reviewer (C)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (206,"*","en",103);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (427,"*","fr",103);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (207,"*","de",103);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2503,"autor != reviewer (C)",
103);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (506,"The author of the code shouldn't be appointed to do the review!",
"en",2503);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (649,"L'auteur du code doit pas en faire la révision!",
"fr",2503);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (507,"Sie sollten den Autor des Codes nicht auch als Prüfer einsetzen!",
"de",2503);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2509,"*",null,2503,2024,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30018,"*","*","en",2509);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20061,"*","*","fr",2509);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30019,"*","*","de",2509);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2024,"Beginn der Codereviewphase",
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
        z_attribute.name = "CREVIEW_BEGINN" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*CREVIEW_BEGINN");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2510,"*",2509,2503,2053,2002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30020,"*","*","en",2510);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (2062,"*","*","fr",2510);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30021,"*","*","de",2510);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2053,"Gutachter des Codes",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "BEGUTACHTET" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Code" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*BEGUTACHTET*document=Code");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2511,"*",2510,2503,2058,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30022,"*","*","en",2511);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20063,"*","*","fr",2511);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30023,"*","*","de",2511);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2058,"Autoren des Codes",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Code" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Code");


/* vF1e: Handbuch */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (104,"autor != reviewer(M)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (208,"*","en",104);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (428,"*","fr",104);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (209,"*","de",104);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2504,"autor != reviewer (M)",
104);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (508,"The author of the manuals shouldn't be appointed to do the review!",
"en",2504);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (650,"L'auteur du manuel ne doit pas en faire la révision!",
"fr",2504);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (509,"Sie sollten den Autor des Handbuchs nicht auch als Prüfer einsetzen!",
"de",2504);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2512,"*",null,2504,2025,2000);

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2025,"Beginn der Manualeviewphase",
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
        z_attribute.name = "HREVIEW_BEGINN" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_BEGINN");

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30024,"*","*","en",2512);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30025,"*","*","de",2512);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20064,"*","*","fr",2512);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2513,"*",2512,2504,2054,2002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30026,"*","*","en",2513);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20065,"*","*","fr",2513);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30027,"*","*","de",2513);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2054,"Gutachter des Handbuchs",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
     	zarmstype.z_type = "BEGUTACHTET" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Manuals" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*BEGUTACHTET*document=Manuals");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2514,"*",2513,2504,2059,null);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30028,"*","*","en",2514);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20066,"*","*","fr",2514);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30029,"*","*","de",2514);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2059,"Autoren des Handbuchs",
'select distinct s_relation.person
from zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Manual" AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Manuals");





