/*******************************/
/*******************************/
/**** finished prev. phase  ****/
/*******************************/
/*******************************/
/*** start Handbuch frueh ******/
/*******************************/



/* vF10: Handbuch soll in Anfangsphase beginnen */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (132,"start writing Manuals as early as possible",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (264,"*","en",132);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (456,"*","fr",132);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (265,"*","de",132);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2532,"start writing Manuals as early as possible",
132);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (564,"You should start writing the documentation as early as possible!",
"en",2532);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (668,"Vous deverz commencer la rédaction de la documentation le plus tôt possible!",
"fr",2532);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (565,"Sie sollten mit dem Handbuch in den frühen Phasen des Projekts beginnen!",
"de",2532);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2577,"*",null,2532,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30154,"*","*","en",2577);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30155,"*","*","de",2577);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20130,"*","*","fr",2577);
/* ENDE RIETA TOOL */


INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2578,"*",2577,2532,2030,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30156,"*","*","en",2578);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20131,"*","*","fr",2578);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30157,"*","*","de",2578);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2030,"Beginn Handbuch",
'select distinct s_entity.value
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
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*HANDBUCH_BEGINN");





/* vF4: Vorgängerphasen sollten beendet werden, */
/*      bevor mit nächster Phase begonnen wird  */
/* vF4a: Spezifikation/Entwurf                  */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (113,"finished prev.phase (S/D)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (226,"*","en",113);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (437,"*","fr",113);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (227,"*","de",113);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2513,"finished prev.phase (S/D)",
113);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (526,"You shouldn't begin to do the system design until you haven't completed the specification!",
"en",2513);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (669,"Vous ne devez pas commencer la conception avant de terminer la spécification!",
"fr",2513);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (527,"Sie sollten noch nicht mit dem Entwurf beginnen, denn Sie haben die Vorgängerphase (Spezifikation) noch nicht beendet!",
"de",2513);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2536,"*",null,2513,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30072,"*","*","en",2536);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20088,"*","*","fr",2536);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30073,"*","*","de",2536);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2537,"*",2536,2513,2004,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30074,"*","*","en",2537);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20089,"*","*","fr",2537);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30075,"*","*","de",2537);
/* ENDE RIETA TOOL */


/* vF4b: Systemdesign/Moduldesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (114,"finished prev.phase  (SD/MD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (228,"*","en",114);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (438,"*","fr",114);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (229,"*","de",114);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2514,"finished prev.phase (SD/MD)",
114);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (528,"You shouldn't begin to do the module design until you haven't completed the system design!",
"en",2514);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (670,"Vous ne devez pas commencer la conception des modules avant de terminer la conception du système!",
"fr",2514);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (529,"Sie sollten noch nicht mit dem Moduldesign beginnen, denn Sie haben die Vorgängerphase (Systemdesign) noch nicht beendet!",
"de",2514);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2538,"*",null,2514,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30076,"*","*","en",2538);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20090,"*","*","fr",2538);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30077,"*","*","de",2538);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2539,"*",2538,2514,2005,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30078,"*","*","en",2539);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20091,"*","*","fr",2539);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30079,"*","*","de",2539);
/* ENDE RIETA TOOL */


/* vF4c: Moduldesign/Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (115,"finished prev.phase (MD/C)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (230,"*","en",115);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (439,"*","fr",115);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (231,"*","de",115);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2515,"finished prev.phase (MD/C)",
115);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (530,"You shouldn't begin to do the code until you haven't completed the module design!",
"en",2515);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (671,"Vous ne devez pas commencer l'implémentation avant de terminer la conception des modules!",
"fr",2515);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (531,"Sie sollten noch nicht mit der Codierung beginnen, denn Sie haben die Vorgängerphase (Moduldesign) noch nicht beendet!",
"de",2515);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2540,"*",null,2515,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30080,"*","*","en",2540);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20092,"*","*","fr",2540);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30081,"*","*","de",2540);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2541,"*",2540,2515,2006,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30082,"*","*","en",2541);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20093,"*","*","fr",2541);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30083,"*","*","de",2541);
/* ENDE RIETA TOOL */


/* vF4d: Code/Modultest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (116,"finished prev.phase  (C/MT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (232,"*","en",116);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (440,"*","fr",116);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (233,"*","de",116);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2516,"finished prev.phase (C/MD)",
116);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (532,"You shouldn't begin testing the modules until you haven't completed the encoding!",
"en",2516);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (673,"Vous ne devez pas commencer le test avant de terminer l'implémentation!",
"fr",2516);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (533,"Sie sollten noch nicht mit dem Modultest beginnen, denn Sie haben die Vorgängerphase (Codierung) noch nicht beendet!",
"de",2516);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2542,"*",null,2516,2008,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30084,"*","*","en",2542);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20094,"*","*","fr",2542);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30085,"*","*","de",2542);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2543,"*",2542,2516,2007,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30086,"*","*","en",2543);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20095,"*","*","fr",2543);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30087,"*","*","de",2543);
/* ENDE RIETA TOOL */


/* vF4e: Modultest/Integrationstest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (117,"finished prev.phase (MT/IT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (234,"*","en",117);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (441,"*","fr",117);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (235,"*","de",117);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2517,"finished prev.phase (MT/IT)",
117);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (534,"You shouldn't begin to do the integration test until you haven't completed testing the modules!",
"en",2517);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (674,"Vous ne devez pas commencer le test d'intégration avant de terminer le test des modules!",
"fr",2517);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (535,"Sie sollten noch nicht mit dem Integrationstest beginnen, denn Sie haben die Vorgängerphase (Modultest) noch nicht beendet!",
"de",2517);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2544,"*",null,2517,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30088,"*","*","en",2544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20096,"*","*","fr",2544);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30089,"*","*","de",2544);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2545,"*",2544,2517,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30090,"*","*","en",2545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20097,"*","*","fr",2545);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30091,"*","*","de",2545);
/* ENDE RIETA TOOL */



/* vF4f: Integrationstest/Systemtest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (118,"finished prev.phase (IT/ST)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (236,"*","en",118);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (442,"*","fr",118);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (237,"*","de",118);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2518,"finished prev.phase (IT/ST)",
118);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (536,"You shouldn't begin testing the system until you haven't completed the integration test!",
"en",2518);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (651,"Vous ne devez pas commencer le test du système avant de terminer le test d'intégration!",
"fr",2518);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (537,"Sie sollten noch nicht mit dem Systemtest beginnen, denn Sie haben die Vorgängerphase (Integrationstest) noch nicht beendet!",
"de",2518);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2546,"*",null,2518,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30092,"*","*","en",2546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20098,"*","*","fr",2546);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30093,"*","*","de",2546);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2547,"*",null,2518,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30094,"*","*","en",2547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20099,"*","*","fr",2547);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30095,"*","*","de",2547);
/* ENDE RIETA TOOL */



/* vF4g: Systemtest/Abnahmetest */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (119,"finished prev.phase (ST/AT)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (238,"*","en",119);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (443,"*","fr",119);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (239,"*","de",119);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2519,"finished prev.phase (ST/AT)",
119);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (538,"You shouldn't deliver the system to the customer for acceptance test until you haven't completed testing the system!",
"en",2519);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (652,"Vous ne devez pas délivrer le système au client avant d'effectuer le test d'acceptance!",
"fr",2519);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (539,"Sie sollten noch nicht den Abnahmetest einleiten, denn Sie haben die Vorgängerphase (Systemtest) noch nicht beendet!",
"de",2519);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2548,"*",null,2519,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30096,"*","*","en",2548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20100,"*","*","fr",2548);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30097,"*","*","de",2548);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2549,"*",2548,2519,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30098,"*","*","en",2549);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20101,"*","*","fr",2549);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30099,"*","*","de",2549);
/* ENDE RIETA TOOL */
