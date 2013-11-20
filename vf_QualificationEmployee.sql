/************************************/
/************************************/
/******** Qualification Employee ****/
/************************************/
/************************************/



/* vF16: Mitarbeiter sollten ihren Fähigkeiten */
/*       entsprechend eingesetzt werden        */
/* 	   Spezifikation                         */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (133,"consider the qualifications of employees (S)",
3,1);

/* RIETA TOOL benötigt folgendes*/
 INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (266,"*","en",133);

 INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (457,"*","fr",133);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (267,"*","de",133);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2533,
"consider the qualifications of employees (S)",
133);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (566,"Richard is the best qualified employee for writing the specification.
You have chosen a less qualified person.!",
"en",2533);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (680,"Richard est la personne la plus qualifiée pour rédiger la spécification.
Votre choix est très raisonable!",
"fr",2533);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (567,"Sie haben nicht den qualifiziertesten Mitarbeiter für die Spezifikation eingesetzt. Am geeignetsten wäre Richard gewesen.",
"de",2533);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2579,"*",null,2533,2001,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30158,"*","*","en",2579);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20132,"*","*","fr",2579);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30159,"*","*","de",2579);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2580,"*",2579,2533,93,12);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30160,"*","*","en",2580);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20133,"*","*","fr",2580);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30161,"*","*","de",2580);
/* ENDE RIETA TOOL */

/* Systemdesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (134,"consider the qualifications of employees  (SD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (268,"*","en",134);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (458,"*","fr",134);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (269,"*","de",134);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2534,
"consider the qualifications of employees (SD)",
134);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (568,"Richard and Christine are the best qualified employees for writing the system design.
You have chosen a less qualified person!",
"en",2534);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (681,"Richard et Christine sont les personnes les plus qualifiées pour la rédaction du document de la conception du système!",
"fr",2534);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (569,"Sie haben nicht den qualifiziertesten Mitarbeiter für das Systemdesign eingesetzt. Am geeignetsten wäre Christine oder Richard gewesen.",
"de",2534);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2581,"*",null,2534,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30162,"*","*","en",2581);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20134,"*","*","fr",2581);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30163,"*","*","de",2581);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2582,"*",2581,2534,94,14);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30164,"*","*","en",2582);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20135,"*","*","fr",2582);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30165,"*","*","de",2582);
/* ENDE RIETA TOOL */


/* Moduldesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (135,"consider the qualifications of employees  (MD)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (270,"*","en",135);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (459,"*","fr",135);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (271,"*","de",135);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2535,
"consider the qualifications of employees (MD)",
135);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (570,"Richard and Christine are the best qualified employees for writing the module design.
You have chosen a less qualified person!",
"en",2535);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (682,"Richard et Christine sont les personnes les plus qualifiées pour la rédaction du document de la conception des modules!",
"fr",2535);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (571,"Sie haben nicht den(die) qualifiziertesten Mitarbeiter für das Moduledesign eingesetzt. Am geeignetsten wäre Christine oder Richard gewesen.",
"de",2535);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2583,"*",null,2535,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30166,"*","*","en",2583);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20136,"*","*","fr",2583);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30167,"*","*","de",2583);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2584,"*",2583,2535,95,14);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30168,"*","*","en",2584);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20137,"*","*","fr",2584);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30169,"*","*","de",2584);
/* ENDE RIETA TOOL */


/* Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (136,"consider the qualifications of employees (C)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (272,"*","en",136);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (460,"*","fr",136);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (273,"*","de",136);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2536,
"consider the qualifications of employees (C)",
136);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (572,"Diana is not the best qualified employee for writing the code.
You have chosen a less qualified person!",
"en",2536);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (683,"Diana n'est pas la plus qualifiée pour écrire le code. Vous n'avez pas fait le bon choix!",
"fr",2536);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (573,"Sie haben nicht den qualifiziertesten Mitarbeiter für die Codierung eingesetzt. Am geeignetsten wäre Diana gewesen.",
"de",2536);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2585,"*",null,2536,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30170,"*","*","en",2585);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20138,"*","*","fr",2585);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30171,"*","*","de",2585);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2586,"*",2585,2536,96,16);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30172,"*","*","en",2586);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20139,"*","*","fr",2586);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30173,"*","*","de",2586);
/* ENDE RIETA TOOL */


/* Handbuch */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (137,"consider the qualifications of employees (M)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (274,"*","en",137);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (461,"*","fr",137);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (275,"*","de",137);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2537,
"consider the qualifications of employees (M)",
137);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (574,"Bernd is the best qualified employee for writing the documentation.
You have chosen a less qualified person!",
"en",2537);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (684,"Bernd n'est pas le plus qualifié pour rédiger la documentation. Vous n'avez pas fait le bon choix!",
"fr",2537);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (575,"Sie haben nicht den qualifiziertesten Mitarbeiter für die Handbucherstellung eingesetzt. Am geeignetsten wäre Bernd gewesen.",
"de",2537);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2587,"*",null,2537,2030,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30174,"*","*","en",2587);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20140,"*","*","fr",2587);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30175,"*","*","de",2587);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2588,"*",2587,2537,97,18);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30176,"*","*","en",2588);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20141,"*","*","fr",2588);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30177,"*","*","de",2588);
/* ENDE RIETA TOOL */

