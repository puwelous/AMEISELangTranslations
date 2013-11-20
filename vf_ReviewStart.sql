/******************************************/
/******************************************/
/******** Review Start + customer  ********/
/******************************************/
/******************************************/





/* vF5: Vorgängerphase sollte überprüft werden, */
/*      bevor mit nächster Phase begonnen wird  */
/* vF5a: Spezifikation/Entwurf                  */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (120,"review S before starting SD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (240,"*","en",120);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (444,"*","fr",120);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (241,"*","de",120);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2520,"review S before starting SD",
120);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (540,"You should review the specification before you begin to do the system design!",
"en",2520);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (653,"Vous devez effectuer la révision des spécifications avant de commencer la conception du système!",
"fr",2520);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (541,"Sie haben das Dokument der Vorgängerphase (Spezifikation) noch nicht geprüft!",
"de",2520);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2550,"*",null,2520,2000,2000);

 /* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30100,"*","*","en",2550);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20102,"*","*","fr",2550);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30101,"*","*","de",2550);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2551,"*",2550,2520,2015,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30102,"*","*","en",2551);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20103,"*","*","fr",2551);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30103,"*","*","de",2551);
/* ENDE RIETA TOOL */



/* vF5b: Systemdesign/Moduldesign */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (121,"review SD before starting MD",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (242,"*","en",121);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (445,"*","fr",121);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (243,"*","de",121);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2521,"review SD before starting MD",
121);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (542,"You should review the systsem design before you begin to do the module design!",
"en",2521);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (654,"Vous devez effectuer la révision de la spécification du système avant de commencer la conception des modules!",
"fr",2521);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (543,"Sie haben das Dokument der Vorgängerphase (Systemdesign) noch nicht geprüft!",
"de",2521);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2552,"*",null,2521,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30104,"*","*","en",2552);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20104,"*","*","fr",2552);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30105,"*","*","de",2552);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2553,"*",2552,2521,2016,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30106,"*","*","en",2553);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20105,"*","*","fr",2553);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30107,"*","*","de",2553);
/* ENDE RIETA TOOL */


/* vF5c: Moduldesign/Code */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (122,"review MD before starting C",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (244,"*","en",122);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (446,"*","fr",122);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (245,"*","de",122);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2522,"review MD before starting C",
122);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (544,"You should review the module design before you begin to encode!",
"en",2522);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (655,"Vous devez effectuer la révision de la conception des modules avant de commencer l'implémentation!",
"fr",2522);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (545,"Sie haben das Dokument der Vorgängerphase (Moduldesign) noch nicht geprüft!",
"de",2522);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2554,"*",null,2522,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30108,"*","*","en",2554);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20106,"*","*","fr",2554);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30109,"*","*","de",2554);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2555,"*",2554,2522,2017,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30110,"*","*","en",2555);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20107,"*","*","fr",2555);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30111,"*","*","de",2555);
/* ENDE RIETA TOOL */


/***************************/
/***************************/
/******** customer  ********/
/***************************/
/***************************/



/* vF9: Kunde sollte an Spezifikations-/Handbuchreviews teilnehmen */
/* vF9a: Spezifikation                                             */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (130,"customer participate in reviews (S)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (260,"*","en",130);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (454,"*","fr",130);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (261,"*","de",130);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2530,"customer participate in reviews (S)",
130);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (560,"The customer should participate in a review of the specification!",
"en",2530);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (658,"Le client doit participer dans la révision d la spécification!",
"fr",2530);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (561,"Sie haben den Kunden nicht zum Spezifikationsreview eingeladen!",
"de",2530);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2573,"*",null,2530,2015,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30146,"*","*","en",2573);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20126,"*","*","fr",2573);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30147,"*","*","de",2573);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2574,"*",2573,2530,2065,2003);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30148,"*","*","en",2574);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20127,"*","*","fr",2574);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30149,"*","*","de",2574);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2003,'Z','!=',1,null);

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2065,"Kunde am Spezifikationsreview beteiligt",
'select distinct s_relation.customer
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



/* vF9b: Handbuch */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (131,"customer participate in reviews (M)",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (262,"*","en",131);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (455,"*","fr",131);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (263,"*","de",131);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2531,"customer participate in reviews (M)",
131);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (562,"The customer should participate in a review of the documentation!",
"en",2531);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (563,"Le client doit participer dans la révision de la documentation",
"fr",2531);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (659,"Sie haben den Kunden nicht zum Handbuchreview eingeladen!",
"de",2531);


/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2575,"*",null,2531,2025,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30150,"*","*","en",2575);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20128,"*","*","fr",2575);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30151,"*","*","de",2575);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2576,"*",2575,2531,2066,2003);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30152,"*","*","en",2576);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20129,"*","*","fr",2576);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30153,"*","*","de",2576);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2066,"Kunde am Handbuchreview beteiligt",
'select distinct s_relation.customer
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





