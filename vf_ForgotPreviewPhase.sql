/*******************************/
/*******************************/
/**** forgot preview phase  ****/
/*******************************/
/*******************************/


/* vF3: Auf Vorgängerphasen sollte nicht vergessen werden */
/* vF3a: Spezifikation/Entwurf                            */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (110,"forgotten prev.phase (S/D)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (220,"*","en",110);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (434,"*","fr",110);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (221,"*","de",110);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2510,"forgotten prev.phase (S/D)",
110);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (520,"You shouldn't begin to do the system design until you haven't completed the specification!",
"en",2510);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (665,"Vous ne devez pas commencer la conception du système avant de terminer la spécification!",
"fr",2510);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (521,"Sie sollten noch nicht mit der nächsten Phase beginnen, denn Sie haben die Vorgängerphase (Spezifikation) noch nicht durchgeführt!",
"de",2510);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2530,"*",null,2510,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30060,"*","*","en",2530);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20082,"*","*","fr",2530);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30061,"*","*","de",2530);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2531,"*",2530,2510,2001,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30062,"*","*","en",2531);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20083,"*","*","fr",2531);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30063,"*","*","de",2531);
/* ENDE RIETA TOOL */


/* vF3b: Systemdesign/Moduldesign */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (111,"forgotten prev.phase (SD/MD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (222,"*","en",111);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (435,"*","fr",111);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (223,"*","de",111);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2511,"forgotten prev.phase (SD/MD)",
111);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (522,"You shouldn't begin to do the module design until you haven't completed the system design!",
"en",2511);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (666,"Vous ne devez pas commencer la conception des modules avant de terminer la connception du système!",
"fr",2511);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (523,"Sie sollten noch nicht mit der nächsten Phase beginnen, denn Sie haben die Vorgängerphase (Systemdesign) noch nicht durchgeführt!",
"de",2511);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2532,"*",null,2511,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30064,"*","*","en",2532);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20084,"*","*","fr",2532);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30065,"*","*","de",2532);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2533,"*",2532,2511,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30066,"*","*","en",2533);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20085,"*","*","fr",2533);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30067,"*","*","de",2533);
/* ENDE RIETA TOOL */


/* vF3c: Moduldesign/Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (112,"forgotten prev.phase (MD/C)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (224,"*","en",112);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (436,"*","fr",112);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (225,"*","de",112);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2512,"forgotten prev.phase (MD/C)",
112);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (524,"You shouldn't begin to do the code until you haven't completed the module design!",
"en",2512);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (667,"Vous ne devez pas commencer l'implémentation avant de terminer la conception des modules!",
"fr",2512);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (525,"Sie sollten noch nicht mit der nächsten Phase beginnen, denn Sie haben die Vorgängerphase (Moduldesign) noch nicht durchgeführt!",
"de",2512);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2534,"*",null,2512,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30068,"*","*","en",2534);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20086,"*","*","fr",2534);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30069,"*","*","de",2534);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2535,"*",2534,2512,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30070,"*","*","en",2535);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20087,"*","*","fr",2535);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30071,"*","*","de",2535);
/* ENDE RIETA TOOL */
