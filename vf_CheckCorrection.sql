/************************************/
/************************************/
/******** check correction  ********/
/************************************/
/************************************/





/* vF6: Vorgängerphase sollte korrigiert werden, */
/*      bevor mit nächster Phase begonnen wird   */
/* vF6a: Spezifikation/Entwurf                   */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (123,"check correction of S before starting SD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (246,"*","en",123);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (447,"*","fr",123);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (247,"*","de",123);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2523,"check correction of S before starting SD",
123);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (546,"You should correct the document of the previous project phase (specification)!",
"en",2523);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (656,"Vous devez corriger le document de la phase précédente du projet (spécification)!",
"fr",2523);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (547,"Sie haben das Dokument der Vorgängerphase (Spezifikation) noch nicht korrigiert!",
"de",2523);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2556,"*",null,2523,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30112,"*","*","en",2556);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20108,"*","*","fr",2556);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30113,"*","*","de",2556);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2557,"*",2556,2523,2018,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30114,"*","*","en",2557);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20109,"*","*","fr",2557);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30115,"*","*","de",2557);
/* ENDE RIETA TOOL */



/* vF6b: Systemdesign/Moduldesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (124,"check correction of SD before starting MD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (248,"*","en",124);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (448,"*","fr",124);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (249,"*","de",124);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2524,"check correction of SD before starting MD",
124);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (548,"You should correct the document of the previous project phase (system design)!",
"en",2524);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (657,"Vous devez corriger le document de la phase précédente du projet (conception du système)!",
"fr",2524);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (549,"Sie haben das Dokument der Vorgängerphase (Systemdesign) noch nicht korrigiert!",
"de",2524);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2558,"*",null,2524,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30116,"*","*","en",2558);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20110,"*","*","fr",2558);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30117,"*","*","de",2558);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2559,"*",2558,2524,2019,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30118,"*","*","en",2559);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20111,"*","*","fr",2559);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30119,"*","*","de",2559);
/* ENDE RIETA TOOL */


/* vF6c: Moduldesign/Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (125,"check correction of MD before starting C",
3,1);

/* RIETA TOOL benötigt folgendes*/

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (250,"*","en",125);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (449,"*","fr",125);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (251,"*","de",125);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2525,"check correction of MD before starting C",
125);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (550,"You should correct the document of the previous project phase (module design)!",
"en",2525);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (675,"Vous devez corriger le document de la phase précédente du projet (conception des modules)!",
"fr",2525);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (551,"Sie haben das Dokument der Vorgängerphase (Moduldesign) noch nicht korrigiert!",
"de",2525);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2560,"*",null,2525,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30120,"*","*","en",2560);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20112,"*","*","fr",2560);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30121,"*","*","de",2560);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2561,"*",2560,2525,2020,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30122,"*","*","en",2561);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20113,"*","*","fr",2561);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30123,"*","*","de",2561);
/* ENDE RIETA TOOL */

