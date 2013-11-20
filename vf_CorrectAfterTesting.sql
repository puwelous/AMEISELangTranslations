/************************************/
/************************************/
/******** correct after testing *****/
/************************************/
/************************************/





/* vF8: Nach der Durchführung von Test  */
/*      nicht auf Korrektur vergessen   */
/* vF8a: Modultest                      */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (126,"correct after testing (MT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (252,"*","en",126);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (450,"*","fr",126);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (253,"*","de",126);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2526,"correct after testing (MT)",
126);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (552,"You should correct the code based on the module test report!",
"en",2526);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (676,"Vous devez corriger le code en se basant sur le rapport du test de modules!",
"fr",2526);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (553,"Sie haben den Code noch nicht aufgrund des Modultestberichts korrigiert!",
"de",2526);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2562,"*",null,2526,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30124,"*","*","en",2562);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20114,"*","*","fr",2562);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30125,"*","*","de",2562);
/* ENDE RIETA TOOL */


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2563,"*",2562,2526,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30126,"*","*","en",2563);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20115,"*","*","fr",2563);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30127,"*","*","de",2563);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2564,"*",2563,2526,2021,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30128,"*","*","en",2564);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20116,"*","*","fr",2564);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30129,"*","*","de",2564);
/* ENDE RIETA TOOL */



/* vF8b: Integrationstest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (127,"correct after testing (IT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (254,"*","en",127);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (451,"*","fr",127);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (255,"*","de",127);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2527,"correct after testing (IT)",
127);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (554,"You should correct the code based on the integration test report!",
"en",2527);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (678,"Vous devez corriger le code en se basant sur le rapport du test d'intégration!",
"fr",2527);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (555,"Sie haben den Code noch nicht aufgrund des Integrationstestberichts korrigiert!",
"de",2527);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2565,"*",null,2527,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30130,"*","*","en",2565);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20117,"*","*","fr",2565);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30131,"*","*","de",2565);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2566,"*",2565,2527,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30132,"*","*","en",2566);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20118,"*","*","fr",2566);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30133,"*","*","de",2566);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2567,"*",2566,2527,2022,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30134,"*","*","en",2567);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20119,"*","*","fr",2567);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30135,"*","*","de",2567);
/* ENDE RIETA TOOL */



/* vF8c: Systemtest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (128,"correct after testing (ST)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (256,"*","en",128);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (452,"*","fr",128);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (257,"*","de",128);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2528,"correct after testing (ST)",
128);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (556,"You should correct the code based on the system test report!",
"en",2528);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (677,"Vous devez corriger le code en se basant sur le rapport du test de système!",
"fr",2528);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (557,"Sie haben den Code noch nicht aufgrund des Systemtestberichts korrigiert!",
"de",2528);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2568,"*",null,2528,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30136,"*","*","en",2568);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20120,"*","*","fr",2568);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30137,"*","*","de",2568);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2569,"*",2568,2528,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30138,"*","*","en",2569);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20122,"*","*","fr",2569);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30139,"*","*","de",2569);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2570,"*",2569,2528,2023,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30140,"*","*","en",2570);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20123,"*","*","fr",2570);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30141,"*","*","de",2570);
/* ENDE RIETA TOOL */



/* vF8d: Abnahmetest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (129,"correct after testing (AT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (258,"*","en",129);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (453,"*","fr",129);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (259,"*","de",129);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2529,"correct after testing (AT)",
129);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (558,"You should correct the code based on the acceptance test report!",
"en",2529);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (679,"Vous devez corriger le code en se basant sur le rapport du test d'acceptance!",
"fr",2529);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (559,"Sie haben den Code noch nicht aufgrund des Abnahmetestberichts korrigiert!",
"de",2529);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2571,"*",null,2529,2028,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30142,"*","*","en",2571);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20124,"*","*","fr",2571);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30143,"*","*","de",2571);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2028,"Ende der Abnahmetestphase",
'select distinct s_entity.value
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
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ATEST_ENDE");

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2572,"*",2571,2529,2029,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30144,"*","*","en",2572);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20125,"*","*","fr",2572);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30145,"*","*","de",2572);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2029,"Beginn der Abnahmetestkorrekturphase",
'select distinct s_entity.value
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
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ATEST_K_BEGINN");

