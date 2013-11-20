
/******************************/
/******************************/
/******** Watch Deployment ****/
/******************************/
/******************************/


/* vF14: Mitarbeiter sollten nicht vorzeitig aus einer Phase    */
/*       entlassen werden                                       */
/* kann nicht überprüft werden !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */



/* vF13: Personaleinsatz in Phasen beobachten   */
/* Spezifikation                                */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (152,"watch the deployment for S",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (290,"*","en",152);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (469,"*","fr",152);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (291,"*","de",152);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2552,
"watch the deployment for S",
152);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (590,"More than three employees are writing the specification. You ought to consider that the more employees are working on a document the higher is the communication effort, and the higher are the costs.",
"en",2552);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (691,"Plus de trois employés sont en train de rédiger la spécification. Ceci implique un coût élevé dû á l'effort de la collaboration entre eux.",
"fr",2552);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (591,"Sie haben mehr als drei Mitarbeiter in der Phase Spezifikation eingestellt. Sie sollten dabei bedenken, dass mit steigender Anzahl der beteiligten Mitarbeiter auch der Kommunikationsaufwand und damit auch die Kosten steigen.
Sie sollten deshalb nie mehr als drei Mitarbeiter gleichzeitig zur Erstellung eines Dokuments einsetzen.",
"de",2552);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2617,"*",null,2552,2045,23);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30206,"*","*","en",2617);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20156,"*","*","fr",2617);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30207,"*","*","de",2617);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2045,"Anzahl Mitarbeiter - Spezifikation",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Specification" AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Specification*success=1");

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (23,null,'>',3,null);

/* Systemdesign                                */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (153,"watch the deployment for SD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (292,"*","en",153);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (470,"*","fr",153);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (293,"*","de",153);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2553,
"watch the deployment for SD ",
153);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (592,"More than three employees are working on the system design. You ought to consider that the more employees are working on a document the higher is the communication effort, and the higher are the costs.",
"en",2553);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (692,"Plus de trois employés sont en train de travailler sur la conception du système. Ceci implique un coût élevé dû á la communication entre eux.",
"fr",2553);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (593,"Sie haben mehr als drei Mitarbeiter in der Phase Systemdesign eingestellt. Sie sollten dabei bedenken, dass mit steigender Anzahl der beteiligten Mitarbeiter auch der Kommunikationsaufwand und damit auch die Kosten steigen. Sie sollten deshalb nie mehr als drei Mitarbeiter gleichzeitig zur Erstellung eines Dokuments einsetzen.",
"de",2553);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2618,"*",null,2553,2046,23);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30208,"*","*","en",2618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20157,"*","*","fr",2618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30209,"*","*","de",2618);
/* ENDE RIETA TOOL */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2046,"Anzahl Mitarbeiter - Systemdesign",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Systemdesign" AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Systemdesign*success=1");

/* Moduldesign                             */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (154,"watch the deployment for MD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (294,"*","en",154);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (471,"*","fr",154);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (295,"*","de",154);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2554,
"watch the deployment for MD ",
154);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (594,"More than three employees are working on the module design. You ought to consider that the more employees are working on a document the higher is the communication effort, and the higher are the costs.",
"en",2554);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (693,"Plus de trois employés sont en train de travailler sur la conception des modules. Ceci implique un coût élevé dû á la communication entre eux.",
"fr",2554);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (595,"Sie haben mehr als drei Mitarbeiter in der Phase Moduldesign eingestellt. Sie sollten dabei bedenken, dass mit steigender Anzahl der beteiligten Mitarbeiter auch der Kommunikationsaufwand und damit auch die Kosten steigen. Sie sollten deshalb nie mehr als drei Mitarbeiter gleichzeitig zur Erstellung eines Dokuments einsetzen.",
"de",2554);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2619,"*",null,2554,2047,23);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30210,"*","*","en",2619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20158,"*","*","fr",2619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30211,"*","*","de",2619);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2047,"Anzahl Mitarbeiter - Moduldesign",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Moduldesign" AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Moduldesign*success=1");

/* Codierung                                */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (155,"watch the deployment for C",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (296,"*","en",155);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (472,"*","fr",155);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (297,"*","de",155);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2555,
"watch the deployment for C",
155);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (596,"More than three employees are working on the code. You ought to consider that the more employees are working on a document the higher is the communication effort, and the higher are the costs.",
"en",2555);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (694,"Plus de trois employés sont en train d'écrire le code. Ceci implique un coût élevé dû á la communication entre eux.",
"fr",2555);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (597,"Sie haben mehr als drei Mitarbeiter in der Phase Codierung eingestellt. Sie sollten dabei bedenken, dass mit steigender Anzahl der beteiligten Mitarbeiter auch der Kommunikationsaufwand und damit auch die Kosten steigen. Sie sollten deshalb nie mehr als drei Mitarbeiter gleichzeitig zur Erstellung eines Dokuments einsetzen.",
"de",2555);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2620,"*",null,2555,2048,23);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30212,"*","*","en",2620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20159,"*","*","fr",2620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30213,"*","*","de",2620);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2048,"Anzahl Mitarbeiter - Code",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Code" AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Code*success=1");


/* Handbucherstellung                              */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (156,"watch the deployment for M",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (298,"*","en",156);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (473,"*","fr",156);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (299,"*","de",156);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2556,
"watch the deployment for M ",
156);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (598,"More than three employees are writing the documentation. You ought to consider that the more employees are working on a document the higher is the communication effort, and the higher are the costs.",
"en",2556);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (695,"Plus de trois employés sont en train de rédiger la documentataion. Ceci implique un coût élevé dû á la communication entre eux.",
"fr",2556);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (599,"Sie haben mehr als drei Mitarbeiter in der Phase Handbucherstellung eingestellt. Sie sollten dabei bedenken, dass mit steigender Anzahl der beteiligten Mitarbeiter auch der Kommunikationsaufwand und damit auch die Kosten steigen. Sie sollten deshalb nie mehr als drei Mitarbeiter gleichzeitig zur Erstellung eines Dokuments einsetzen.",
"de",2556);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2621,"*",null,2556,2049,23);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30214,"*","*","en",2621);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20160,"*","*","fr",2621);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30215,"*","*","de",2621);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2049,"Anzahl Mitarbeiter - Handbuch",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.z_type = "PRODUZIERT" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.document = "Manuals" AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Manuals*success=1");
