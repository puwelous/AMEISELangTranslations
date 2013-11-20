/* ratgeber.sql - Skript */
/* Beschreibung: Bewertungskriterien für den Ratgeber  (Sprachkonzept)*/
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */

/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
SELECT *
FROM kind_of_aid
WHERE description = "adviser";
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */


/* R1: Auf Vorgängerphasen sollte nicht vergessen werden */
/* R1a: Spezifikation/Entwurf (neg.)                     */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (250,
"Did I forget the previous project phase (specification)?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (110,"Did I forget the previous project phase (specification)?","en",250);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (111,"Nicht auf die Vorgängerphase vergessen - Spezifikation/Entwurf","de",250);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (400,"Est-ce que j'ai oublié la phase précédente (Spécification)","fr",250);



/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2000,"previous project phase (S) - not completed",
250);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (201,"previous project phase (S) - not completed","Attention! You haven't completed the previous project phase (specification)!","en",2000);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (202,"Vorgängerphase (S) - nicht durchgeführt","Achtung! Sie haben die Vorgängerphase (Spezifikation) noch nicht durchgeführt!","de",2000);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (400,"Phase précédente du projet (S) - inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (spécification)!","fr",2000);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2000,"*",null,2000,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10000,"*","*","en",2000);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10001,"*","*","de",2000);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1001,"*","*","fr",2000);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2000,'T','!=',null,'1901/01/01/00:00');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2000,'Beginn der Entwurfsphase',
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
    z_attribute.name = "ENTWURF_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*ENTWURF_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2001,"*",2000,2000,2001,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10002,"*","*","en",2001);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10003,"*","*","de",2001);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1002,"*","*","fr",2001);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2001,'T','==',null,'1901/01/01/00:00');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2001,"Beginn der Spezifikationsphase",
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
    z_attribute.name = "SPEZIFIKATION_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_BEGINN");



/* R1a: Spezifikation/Entwurf (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2001,"previous project phase (S) - not forgotten",
250);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (203,"previous project phase (S) - not forgotten","Very good! You did not forget the previous project phase (specification)!",
"en",2001);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (204,"Vorgängerphase (S) nicht vergessen ","Sehr gut! Sie haben nicht auf die Vorgängerphase (Spezifikation) vergessen!",
"de",2001);


INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (401,"Phase précédente du projet (S) - exécutée","très bien! Vous n'avez pas oublié la phase précédente du projet (spécification)!",
"fr",2001);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2002,"*",null,2001,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10004,"*","*","en",2002);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10005,"*","*","de",2002);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1003,"*","*","fr",2002);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2003,"*",2002,2001,2001,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10006,"*","*","en",2003);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10007,"*","*","de",2003);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1004,"*","*","fr",2003);
/* ENDE RIETA TOOL */


/* R1aa: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2101,"previous project phase (S/D) - forgotten / both not started yet",
250);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (205,"previous project phase (S/D) - forgotten / both not started yet","Sorry, I can't give you an advice, because you have neither started the specification phase nor the design phase.",
"en",2101);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (206,"auf Vorgängerphase (S/D) vergessen - beide noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie weder die Spezifikationsphase noch die Entwurfsphase begonnen haben.",
"de",2101);


INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (402,"Phases précédentes du projet (S/C) - oubliées / Les
deux sont non encore commencées","Désolé, je ne peux vous
conseiller, car vous n'avez débuté ni la phase de spécification ni
celle de la conception.", "fr",2101);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2102,"*",null,2101,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10008,"*","*","en",2102);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10009,"*","*","de",2102);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1005,"*","*","fr",2102);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2103,"*",2102,2101,2001,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10010,"*","*","en",2103);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10011,"*","*","de",2103);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1006,"*","*","fr",2103);
/* ENDE RIETA TOOL */

/* R1ab: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2201,"previous project phase (S/D) - forgotten / D not started",
250);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (207,"previous project phase (S/D) - forgotten / D not started","Sorry, I can't give you an advice, because you did not start the subsequent project phase (system design).",
"en",2201);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (208,"auf Vorgängerphase vergessen (S/D) - D noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie noch nicht mit der Nachfolgephase (Entwurf) begonnen haben.",
"de",2201);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (403,"Phase précédente du projet (CS) - oubliée / CS non
encore commencée","Désolé, je ne peux vous conseiller, car vous
n'avez pas débuté la phase de la conception du
sytème.","fr",2201);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2202,"*",null,2201,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10012,"*","*","en",2202);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10013,"*","*","de",2202);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1007,"*","*","fr",2202);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2203,"*",2202,2201,2001,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10014,"*","*","en",2203);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10015,"*","*","de",2203);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1008,"*","*","fr",2203);
/* ENDE RIETA TOOL */

/* R1b: Systemdesign/Moduldesign (neg.)  */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (251,
"Did I forget the previous project phase (system design)?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (112,"Did I forget the previous project phase (system design)?","en",251);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (113,"Nicht auf die Vorgängerphase vergessen - Systemdesign/Moduldesign","de",251);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (401,"Est-ce-que j'ai oublié la phase précédente du projet (conception du système)?","fr",251);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2003,"previous project phase (SD/MD) - forgotten / SD not finished",
251);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (209,"previous project phase (SD/MD) - forgotten / SD not finished","Attention! You haven't completed the previous project phase (system design)!",
"en",2003);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (210,"auf Vorgängerphase vergessen (SD/MD) - SD noch nicht beendet","Achtung! Sie haben die Vorgängerphase (Systemdesign) noch nicht durchgeführt!",
"de",2003);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (404,"Phase précédente du projet (CS/CM) - oubliée / CS inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (conception du système)!",
"fr",2003);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2004,"*",null,2003,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10016,"*","*","en",2004);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10017,"*","*","de",2004);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1009,"*","*","fr",2004);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2002,"Beginn der Moduldesignsphase",
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
    z_attribute.name = "MODSPEZ_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*MODSPEZ_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2005,"*",2004,2003,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10018,"*","*","en",2005);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10019,"*","*","de",2005);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1010,"*","*","fr",2005);
/* ENDE RIETA TOOL */

/* R1b: Systemdesign/Moduldesign (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2004,"nicht auf Vorgängerphase vergessen (SD/MD) (positiv)",
251);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (211,"previous project phase (SD/MD) - not forgotten","Very good! You did not forget the previous project phase (system design)!",
"en",2004);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (212,"auf Vorgängerphase (SD) nicht vergessen","Sehr gut! Sie haben nicht auf die Vorgängerphase (Systemdesign) vergessen!",
"de",2004);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (405,"Phase précédente du projet (CS/CM) - achevée","Très bien! Vous avez terminé la phase précédente du projet (conception du système)!",
"fr",2004);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2006,"*",null,2004,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10020,"*","*","en",2006);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10021,"*","*","de",2006);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1011,"*","*","fr",2006);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2007,"*",2006,2004,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10022,"*","*","en",2007);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10023,"*","*","de",2007);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1012,"*","*","fr",2007);
/* ENDE RIETA TOOL */

/* R1ba: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2104,"nicht auf Vorgängerphase vergessen (SD/MD) (a)",
251);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (213,"previous project phase (SD/MD) - forgotten / SD/MD design not started","Sorry, I can't give you an advice, because you have neither started the specification phase nor the design phase.",
"en",2104);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (214,"auf Vorgängerphase (SD/MD) vergessen - weder SD noch MD begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie weder die Systemdesignphase noch die Moduldesignphase begonnen haben.",
"de",2104);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (406,"Phases précédentes du projet (CS/CM) - oubliées /
CS/CM non encore commencées","Désolé, je ne peux vous conseiller,
car vous n'avez pas débuté ni la phase de spécification ni celle
de la conception.", "fr",2104);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2106,"*",null,2104,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10024,"*","*","en",2106);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10025,"*","*","de",2106);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1013,"*","*","fr",2106);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2107,"*",2106,2104,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10026,"*","*","en",2107);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10027,"*","*","de",2107);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1014,"*","*","fr",2107);
/* ENDE RIETA TOOL */

/* R1bb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2204,"previous project phase (SD/MD) - forgotten / MD not yet started",
251);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (215,"previous project phase (SD/MD) - forgotten / MD not yet started","Sorry, I can't give you an advice, because you did not start the subsequent project phase (module design).",
"en",2204);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (216,"auf Vorgängerphase (SD/MD) vergessen / MD noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie noch nicht mit der Nachfolgephase (Moduldesign) begonnen haben.",
"de",2204);


INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (407,"Phase précédente du projet (CS/CM) - oubliée / CM non
encore commencée","Désolé, je ne peux vous conseiller, car vous
n'avez pas débuté la phase de la conception des modules.",
"fr",2204);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2206,"*",null,2204,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10028,"*","*","en",2206);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10029,"*","*","de",2206);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1015,"*","*","fr",2206);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2207,"*",2206,2204,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10030,"*","*","en",2207);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10031,"*","*","de",2207);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1016,"*","*","fr",2207);
/* ENDE RIETA TOOL */

/* R1c: Moduldesign/Code (neg.) */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (252,"Did I forget the previous project phase (module design)?",2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (114,"Did I forget the previous project phase (module design)?","en",252);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (115,"Nicht auf die Vorgängerphase vergessen - Moduldesign/Code","de",252);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (402,"Est-ce-que j'ai oublié la phase précédente du projet (conception des modules)?","fr",252);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2005,"previous project phase (MD/C) - forgotten / MD not yet started",
252);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (217,"previous project phase (MD/C) - forgotten / MD not yet started","Attention! You haven't completed the previous project phase (module design)!",
"en",2005);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (218,"auf Vorgängerphase vergessen (MD/C) / MD noch nicht durchgeführt","Achtung! Sie haben die Vorgängerphase (Moduldesign) noch nicht durchgeführt!",
"de",2005);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (408,"Phase précédente du projet (CM/I) - oubliée / CM pas encore commencée","Attention! Vous n'avez pas terminé la phase précédente du projet (conception des modules)!","fr",2005);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2008,"*",null,2005,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10032,"*","*","en",2008);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10033,"*","*","de",2008);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1017,"*","*","fr",2008);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2003,"Beginn der Codierungsphase",
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
    z_attribute.name = "CODE_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*CODE_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2009,"*",2008,2005,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10034,"*","*","en",2009);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10035,"*","*","de",2009);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1018,"*","*","fr",2009);
/* ENDE RIETA TOOL */

/* R1c: Moduldesign/Code (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2006,"previous project phase (MD/C) - forgotten",
252);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (219,"previous project phase (MD/C) - not forgotten ","Very good! You did not forget about the previous project phase (module design).",
"en",2006);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (220,"auf Vorgängerphase (MD/C) nicht vergessen","Sehr gut! Sie haben nicht auf die Vorgängerphase (Moduldesign) vergessen.",
"de",2006);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (409,"Phase précédente du projet - achevée","Très bien! Vous n'avez pas oublié la phase précédente du projet (conception des modules)!",
"fr",2006);


/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2010,"*",null,2006,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10036,"*","*","en",2010);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10037,"*","*","de",2010);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1019,"*","*","de",2010);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2011,"*",2010,2006,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10038,"*","*","en",2011);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10039,"*","*","de",2011);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1020,"*","*","fr",2011);
/* ENDE RIETA TOOL */

/* R1ca: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2106,"previous project phase (MD/C) - forgotten / both MD/C not yet started",
252);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (221,"previous project phase (MD/C) - forgotten / both MD/C not yet started","Sorry, I can't give you an advice, because you have neither started the module design phase nor the coding phase.",
"en",2106);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (222,"auf Vorgängerphase (MD/C) vergessen / beide MD/C noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie weder die Moduldesignphase noch die Codierungsphase begonnen haben.",
"de",2106);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (410,"Phases précédentes du projet (CM/I) - oubliées / Les
deux pahses CM/I pas encore commencées","Désolé, je ne peux vous
conseiller, car vous n'avez débuté ni la phase de la conception
des modules ni celle de l'implémentation.","fr",2106);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2110,"*",null,2106,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10040,"*","*","en",2110);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10041,"*","*","de",2110);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1021,"*","*","fr",2110);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2111,"*",2110,2106,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10042,"*","*","en",2111);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10043,"*","*","de",2111);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1022,"*","*","fr",2111);
/* ENDE RIETA TOOL */

/* R1cb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2206,"previous project phase (MD/C) - forgotten / C not yet started",
252);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (223,"previous project phase (MD/C) - forgotten / C not yet started","Sorry, I can't give you an advice, because you did not start the subsequent project phase (coding).",
"en",2206);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (224,"auf Vorgängerphase (MD/C) vergessen / C noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie noch nicht mit der Nachfolgephase (Codierung) begonnen haben.",
"de",2206);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (411,"Phase précédente du projet (CM/I)- oubliée / I pas
encore commencée","Désolé, je ne peux vous conseiller, car vous
n'avez pas commencé l'implémentation.","fr",2206);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2210,"*",null,2206,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10044,"*","*","en",2210);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10045,"*","*","de",2210);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1023,"*","*","fr",2210);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2211,"*",2210,2206,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10046,"*","*","en",2211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10047,"*","*","de",2211);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1024,"*","*","fr",2211);
/* ENDE RIETA TOOL */

/* R2: Vorgängerphasen sollten beendet werden, */
/*     bevor mit nächster Phase begonnen wird  */
/* R2a: Spezifikation/Entwurf (neg.)           */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (253,"Did I finish the specification before I started to do the system design?",2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (116,"Did I finish the specification before I started to do the system design?","en",253);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (117,"Vorgängerphase vor Phasenwechsel beenden - Spezifikation/Entwurf","de",253);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(403,"Est-ce-que j'ai terminé la spécification avant de commencer
la conception du système?","fr",253);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2007,"previous project phase (S/D) - not completed",
253);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (225,"previous project phase (S/D) - not completed","Attention! You haven't finished the previous project phase (specification)!",
"en",2007);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (226,"Vorgängerphase (S/D) noch nicht beendet","Achtung! Sie haben die Vorgängerphase (Spezifikation) noch nicht beendet!",
"de",2007);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (412,"Phase précédente du projet (S/C)- inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (spécification)!","fr",2007);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2012,"*",null,2007,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10048,"*","*","en",2012);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10049,"*","*","de",2012);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1025,"*","*","fr",2012);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2013,"*",2012,2007,2004,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10050,"*","*","en",2013);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10051,"*","*","de",2013);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1026,"*","*","fr",2013);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2004,"Ende der Spezifikationsphase",
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
    z_attribute.name = "SPEZIFIKATION_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE");


/* R2a: Spezifikation/Entwurf (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2008,"previous project phase (S/D) - completed",
253);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (227,"previous project phase (S/D) - completed","Very good! You have completed the previous project phase (specification)!",
"en",2008);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (228,"Vorgängerphase (S/D) bereits beendet","Sehr gut! Sie haben die Vorgängerphase (Spezifikation) zuvor beendet!",
"de",2008);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (413,"Phase précédente du projet (S/C)- achevée","Très bien! Vous avez terminé la phase précédente du projet (spécification)!",
"fr",2008);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2014,"*",null,2008,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10052,"*","*","en",2014);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10053,"*","*","de",2014);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1027,"*","*","fr",2014);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2015,"*",2014,2008,2004,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10054,"*","*","en",2015);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10055,"*","*","de",2015);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1028,"*","*","fr",2015);
/* ENDE RIETA TOOL */

/* R2aa: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2108,"previous project phase (S/D) - completed / not yet started D",
253);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (229,"previous project phase (S/D) - completed / not yet started D","You did not start the design phase.",
"en",2108);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (230,"Vorgängerphase (S/D) beendet / D noch nicht begonnen","Achtung! Sie haben noch nicht mit der Entwurfsphase begonnen!",
"de",2108);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (414,"Phase précédente du projet (S/C) - achevée / C n'est pas encore commencée","Vous n'avez pas encore commencé la conception.",
"fr",2108);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2114,"*",null,2108,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10056,"*","*","en",2114);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10057,"*","*","de",2114);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1029,"*","*","fr",2114);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2115,"*",2114,2108,2004,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10058,"*","*","en",2115);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10059,"*","*","de",2115);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1030,"*","*","fr",2115);
/* ENDE RIETA TOOL */

/* R2ab: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2208,"previous project phase (S/D) - completed / not yet started D",
253);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (231,"previous project phase (S/D) - completed / not yet started D","You have finished the specification phase, but not yet started the design phase.",
"en",2208);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (232,"Vorgängerphase (S/D) beendet / D noch nicht begonnen","Achtung! Sie haben zwar die Spezifikationsphase beendet, aber noch nicht mit der Entwurfsphase begonnen!",
"de",2208);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (415,"Phase précédente du projet (S/C) - achevée / C n'est
pas encore commencée","Vous avez terminé la phase de
spécification, alors que vous n'avez pas encore commencé la phase
de la conception.", "fr",2208);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2214,"*",null,2208,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10060,"*","*","en",2214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10061,"*","*","de",2214);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1031,"*","*","fr",2214);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2215,"*",2214,2208,2004,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10062,"*","*","en",2215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10063,"*","*","de",2215);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1032,"*","*","fr",2215);
/* ENDE RIETA TOOL */


/* R2b: Systemdesign/Moduldesign (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (254,
"Did I finish the system design before I started to do the module design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (118,"Did I finish the system design before I started to do the module design?","en",254);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (119,"Vorgängerphase vor Phasenwechsel beenden - Systemdesign/Moduldesign","de",254);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (404,"Est-ce-que j'ai terminé la conception du système avant de commencer la conception des modules?","fr",254);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2009,"previous project phase (SD/MD) - not completed",
254);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (233,"previous project phase (SD/MD) - not completed","Attention! You haven't finished the previous project phase (system design)!",
"en",2009);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (234,"Vorgängerphase (SD/MD) noch nicht beendet","Achtung! Sie haben die Vorgängerphase (Systemdesign) noch nicht beendet!",
"de",2009);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (416,"Phase précédente du projet (CS/CM) - inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (conception du système)!",
"fr",2009);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2016,"*",null,2009,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10064,"*","*","en",2016);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10065,"*","*","de",2016);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1033,"*","*","fr",2016);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2017,"*",2016,2009,2005,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10066,"*","*","en",2017);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10067,"*","*","de",2017);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1034,"*","*","fr",2017);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2005,"Ende der Systemdesignphase",
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
    z_attribute.name = "ENTWURF_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*ENTWURF_EMDE");


/* R2b: Systemdesign/Moduldesign (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2010,"previous project phase (SD/MD) - completed",
254);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (235,"previous project phase (SD/MD) - completed","Very good! You finished the previous project phase (system design) before you started to do the module design!",
"en",2010);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (236,"Vorgängerphase (SD/MD) beendet","Sehr gut! Sie haben die Vorgängerphase (Systemdesign) zuvor beendet!",
"de",2010);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (417,"Phase précédente du projet (CS/CM) - achevée","Très bien! Vous avez terminé la phase précédente du projet (conception du système)!avant de commencer la conception des modules!",
"fr",2010);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2018,"*",null,2010,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10068,"*","*","en",2018);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10069,"*","*","de",2018);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1035,"*","*","fr",2018);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2019,"*",2018,2010,2005,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10070,"*","*","en",2019);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10071,"*","*","de",2019);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1036,"*","*","fr",2019);
/* ENDE RIETA TOOL */

/* R2ba: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2110,"previous project phase (SD/MD) - completed / MD not started",
254);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (237,"previous project phase (SD/MD) - completed / MD not started","You did not start to do the module design phase.",
"en",2110);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (238,"Vorgängerphase (SD/MD) beendet","Achtung! Sie haben noch nicht mit der Moduldesignphase begonnen!",
"de",2110);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (418,"Phase précédente du projet (CS/CM) - achevée / CM non
encore commencée","Vous n'avez pas commencé la phase de la
conception des modules.", "fr",2110); /*
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2118,"*",null,2110,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10072,"*","*","en",2118);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10073,"*","*","de",2118);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1037,"*","*","fr",2118);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2119,"*",2118,2110,2005,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10074,"*","*","en",2119);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10075,"*","*","de",2119);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1038,"*","*","fr",2119);
/* ENDE RIETA TOOL */


/* R2bb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2210,"previous project phase (SD/MD) - completed / MD finished, SD not started",
254);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (239,"previous project phase (SD/MD) - completed / MD finished, SD not started","Sorry, I can't give you an advice, because you have finished the module design phase, but not yet started the system design phase.",
"en",2210);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (240,"Vorgängerphase (SD/MD) beendet / MD beendet, SD noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar die Moduldesignphase beendet, aber noch nicht mit der Systemdesignphase begonnen!",
"de",2210);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (419,"Phase précédente du projet (CS/CM) - achevée / CM
terminée, CM non encore commencée","Désolé, je ne peux vous
conseiller, car vous avez terminé la phase de la conception des
modules, mais vous n'avez pas encore commencé la phase de la
conception du sytème.", "fr",2210); /*
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2218,"*",null,2210,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10076,"*","*","en",2218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10077,"*","*","de",2218);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1039,"*","*","fr",2218);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2219,"*",2218,2210,2005,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10078,"*","*","en",2219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10079,"*","*","de",2219);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1040,"*","*","fr",2219);
/* ENDE RIETA TOOL */


/* R2c: Moduldesign/Code (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (255,
"Did I finish the module design before I started to do the implementation.",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (120,"Did I finish the module design before I started to do the implementation.","en",255);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (121,"Vorgängerphase vor Phasenwechsel beenden - Moduldesign/Code","de",255);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (405,"Est-ce-que j'ai terminé la conception des modules avant de commencer l'implémentation.","fr",255);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2011,"previous project phase (MD/C) - not completed",
255);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (241,"previous project phase (MD/C) - not completed","Attention! You haven't finished the previous project phase (module design)!",
"en",2011);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (242,"Vorgängerphase (MD/C) nicht beendet","Achtung! Sie haben die Vorgängerphase (Moduldesign) noch nicht beendet!",
"de",2011);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (420,"Phase précédente du projet (CM/I) - inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (conception des modules)! ",
"fr",2011);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2020,"*",null,2011,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10080,"*","*","en",2020);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10081,"*","*","de",2020);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1041,"*","*","fr",2020);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2021,"*",2020,2011,2006,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10082,"*","*","en",2021);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10083,"*","*","de",2021);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1042,"*","*","fr",2021);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4000,'T','==',null,'1901/01/01/00:00');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2006,"Ende der Moduldesignphase",
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
    z_attribute.name = "MODSPEZ_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE");


/* R2c: Moduldesign/Code (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2012,"previous project phase (MD/C) - completed",
255);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (243,"previous project phase (MD/C) - completed","Very good! You finished the previous project phase (module design)!",
"en",2012);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (244,"Vorgängerphase (MD/C) beendet","Sehr gut! Sie haben die Vorgängerphase (Moduldesign) zuvor beendet!",
"de",2012);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (421,"Phase précédente du projet (CM/I) - achevée ","Très bien! Vous avez terminé la phase précédente du projet (conception des modules)!",
"fr",2012);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2022,"*",null,2012,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10084,"*","*","en",2022);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10085,"*","*","de",2022);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1043,"*","*","fr",2022);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2023,"*",2022,2012,2006,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10086,"*","*","en",2023);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10087,"*","*","de",2023);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1044,"*","*","fr",2023);
/* ENDE RIETA TOOL */

/* R2ca: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2112,"previous project phase (MD/C) - completed /C not started",
255);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (245,"previous project phase (MD/C) - completed /C not started","You did not start to do the implementation.",
"en",2112);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (246,"Vorgängerphase (MD/C) beendet / C not started","Achtung! Sie haben noch nicht mit der Codierungsphase begonnen!",
"de",2112);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (422,"Phase précédente du projet (CM/I) - achevée / I non encore commencée","Vous n'avez pas commencé l'implémentation.",
"fr",2112);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2122,"*",null,2112,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10088,"*","*","en",2122);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10089,"*","*","de",2122);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1045,"*","*","fr",2122);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2123,"*",2122,2112,2006,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10090,"*","*","en",2123);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10091,"*","*","de",2123);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1046,"*","*","fr",2123);
/* ENDE RIETA TOOL */

/* R2cb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2212,"previous project phase (MD/C) - completed /MD finished, C not started",
255);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (247,"previous project phase (MD/C) - completed /MD finished, C not started","You have finished the module design phase, but not started to do the implementation.",
"en",2212);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (248,"Vorgängerphase (MD/C) beendet / MD beendet, C noch nicht begonnen","Achtung! Sie haben zwar die Moduldesignphase beendet, aber noch nicht mit der Codierungsphase begonnen!",
"de",2212);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (423,"Phase précédente du projet (CM/I) - achevée / CM
terminée, I non encore commencée","Vous avez terminé la phase de
la conception des modules, mais vous n'avez pas encore commencé
l'implémentation.", "fr",2212); /*
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2222,"*",null,2212,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10092,"*","*","en",2222);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10093,"*","*","de",2222);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1047,"*","*","fr",2222);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2223,"*",2222,2212,2006,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10094,"*","*","en",2223);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10095,"*","*","de",2223);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1048,"*","*","fr",2223);
/* ENDE RIETA TOOL */


/* R2d: Code/Modultest (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (256,
"Did I finish the code before I started to do the module test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (122,"Did I finish the code before I started to do the module test?","en",256);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (123,"Vorgängerphase vor Phasenwechsel beenden - Code/Modultest","de",256);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (406,"Est-ce-que j'ai terminé l'implémentation du code avant de commencer le test des modules?","fr",256);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2013,"previous project phase (C/MT) - completed /C not finished",
256);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (249,"previous project phase (C/MT) - completed /C not finished","Attention! You haven't completed the previous project phase (specification)!",
"en",2013);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (250,"Vorgängerphase (C/MT) noch nicht beendet","Achtung! Sie haben die Vorgängerphase (Codierung) noch nicht beendet!",
"de",2013);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (424,"Phase précédente du projet (I/TM) - achevée /I inachevée","Attention! Vous n'avez pas terminé la phase précédente du projet (spécification)!",
"fr",2013);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2024,"*",null,2013,2008,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10096,"*","*","en",2024);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10097,"*","*","de",2024);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1049,"*","*","fr",2024);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2008,"Beginn der Modultestsphase",
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
    z_attribute.name = "MTEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*MTEST_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2025,"*",2024,2013,2007,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10098,"*","*","en",2025);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10099,"*","*","de",2025);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1050,"*","*","fr",2025);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2007,"Ende der Codierungsphase",
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
    z_attribute.name = "CODE_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**PROJEKTLOGBUCH*Projectlog*CODE_ENDE");


/* R2d: Code/Modultest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2014,"previous project phase (C/MT) - completed",
256);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (251,"previous project phase (C/MT) - completed","Very good! You finished the previous project phase (coding) before you started the next phase!",
"en",2014);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (252,"Vorgängerphase (C/MT) beendet","Sehr gut! Sie haben die Vorgängerphase (Codierung) zuvor beendet!",
"de",2014);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (425,"Phase précédente du projet (I/TM) - achevée","Très bien! Vous avez terminé la phase précédente du projet (implémentation)!avant de commencer la prochaine phase!",
"fr",2014);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2026,"*",null,2014,2008,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10100,"*","*","en",2026);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10101,"*","*","de",2026);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1051,"*","*","fr",2026);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2027,"*",2026,2014,2007,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10102,"*","*","en",2027);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10103,"*","*","de",2027);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1052,"*","*","fr",2027);
/* ENDE RIETA TOOL */

/* R2da: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2114,"previous project phase (C/MT) - completed / MT not started",
256);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (253,"previous project phase (C/MT) - completed / MT not started","You didn't yet start the module test.",
"en",2114);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (254,"Vorgängerphase (C/MT) beendet / MT noch nicht begonnen","Achtung! Sie haben noch nicht mit dem Modultest begonnen!",
"de",2114);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (426,"Phase précédente du projet (I/TM) - achevée / TM non encore commencée","Vous n'avez pas encore commencé le test des modules.",
"fr",2114);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2126,"*",null,2114,2008,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10104,"*","*","en",2126);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10105,"*","*","de",2126);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1053,"*","*","fr",2126);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2127,"*",2126,2114,2007,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10106,"*","*","en",2127);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10107,"*","*","de",2127);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1054,"*","*","fr",2127);
/* ENDE RIETA TOOL */

/* R2db: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2214,"previous project phase (C/MT) - completed / MT not started",
256);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (255,"previous project phase (C/MT) - completed / MT not started","You already finished the implementation, but didn't yet start the module test.",
"en",2214);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (256,"Vorgängerphase (C/MT) beendet / MT noch nicht begonnen","Achtung! Sie haben zwar die Codierungsphase beendet, aber noch nicht mit dem Modultest begonnen!",
"de",2214);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (427,"Phase précédente du projet (I/TM) - achevée / TM non encore commencée","Vous avez déja terminé l'implémentation, mais vous n'avez pas encore commencé le test des modules.",
"fr",2214);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2226,"*",null,2214,2008,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10108,"*","*","en",2226);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10109,"*","*","de",2226);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1055,"*","*","fr",2226);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2227,"*",2226,2214,2007,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10110,"*","*","en",2227);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10111,"*","*","de",2227);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1056,"*","*","fr",2227);
/* ENDE RIETA TOOL */


/* R2e: Modultest/Integrationstest (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (257,
"Did I finish the module test before I started the integration test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (124,"Did I finish the module test before I started the integration test?","en",257);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (125,"Vorgängerphase vor Phasenwechsel beenden - Modultest/Integrationstest","de",257);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (407,"Est-ce-que j'ai terminé le test du code avant de commencer le test d'intégration?","fr",257);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2015,"previous project phase (MT/IT) - not completed",
257);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (257,"previous project phase (MT/IT) - not completed","Attention! You haven't finished the previous module test before you started the integration test!",
"en",2015);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (258,"Vorgängerphase (MT/IT) noch nicht beendet","Achtung! Sie haben die Vorgängerphase (Modultest) noch nicht beendet!",
"de",2015);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (428,"Phase précédente du projet (TM/TI) -
inachevée","Attention! Vous n'avez pas terminé la phase précédente
du test des modules avant de commencer le test d'intégration!",
"fr",2015); /* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT
INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2028,"*",null,2015,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10112,"*","*","en",2028);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10113,"*","*","de",2028);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1057,"*","*","fr",2028);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2009,"Beginn der Integrationstestsphase",
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
    z_attribute.name = "ITEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*ITEST_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2029,"*",2028,2015,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10114,"*","*","en",2029);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10115,"*","*","de",2029);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1058,"*","*","fr",2029);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2010,"Ende der Modultestphase",
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
    z_attribute.name = "MTEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*MTEST_ENDE");


/* R2e: Modultest/Integrationstest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2016,"previous project phase (MT/IT) - completed",
257);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (259,"previous project phase (MT/IT) - completed","Very good! You have finished the module test before you started the integration test!",
"en",2016);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (260,"Vorgängerphase (MT/IT) beendet","Sehr gut! Sie haben die Vorgängerphase (Modultest) zuvor beendet!",
"de",2016);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (429,"Phase précédente du projet (TM/TI) - achevée","Très bien! Vous avez terminé le test des modules avant de commencer le test d'intégration!",
"fr",2016);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2030,"*",null,2016,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10116,"*","*","en",2030);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10117,"*","*","de",2030);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1059,"*","*","fr",2030);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2031,"*",2030,2016,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10118,"*","*","en",2031);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10119,"*","*","de",2031);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1060,"*","*","fr",2031);
/* ENDE RIETA TOOL */

/* R2ea: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2116,"previous project phase (MT/IT) - completed / IT not started",
257);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (261,"previous project phase (MT/IT) - completed / IT not started","You didn't yet start to do the integration test.",
"en",2116);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (262,"Vorgängerphase (MT/IT) beendet /IT noch nicht begonnen","Achtung! Sie haben noch nicht mit dem Integrationtest begonnen!",
"de",2116);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (430,"Phase précédente du projet (TM/TI) - achevée / TI non encore commencée","Vous n'avez pas encore commencé le test d'intégration.",
"fr",2116);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2130,"*",null,2116,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10120,"*","*","en",2130);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10121,"*","*","de",2130);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1061,"*","*","fr",2130);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2131,"*",2130,2116,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10122,"*","*","en",2131);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10123,"*","*","de",2131);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1062,"*","*","fr",2131);
/* ENDE RIETA TOOL */

/* R2eb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2216,"previous project phase (MT/IT) - completed / IT not started",
257);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (263,"previous project phase (MT/IT) - completed / IT not started","You have already finished the module test, but didn't yet start the integration test.",
"en",2216);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (264,"Vorgängerphase (MT/IT) beendet / noch nicht mit IT begonnen","Achtung! Sie haben zwar den Modultest beendet, aber noch nicht mit dem Integrationstest begonnen!",
"de",2216);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (431,"Phase précédente du projet (TM/TI) - achevée / TI non
commencée","Vous avez déjà terminé le test des modules, mais vous
n'avez pas encore commencé le test d'intégration.", "fr",2216); /*
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2230,"*",null,2216,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10124,"*","*","en",2230);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10125,"*","*","de",2230);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1063,"*","*","fr",2230);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2231,"*",2230,2216,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10126,"*","*","en",2231);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10127,"*","*","de",2231);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1064,"*","*","fr",2231);
/* ENDE RIETA TOOL */


/* R2f: Integrationstest/Systemtest (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (258,
"Did I finish the integration test before I started the system test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (126,"Did I finish the integration test before I started the system test?","en",258);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (127,"Vorgängerphase vor Phasenwechsel beenden - Integrationstest/Systemtest","de",258);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (408,"Est-ce-que j'ai terminé le test d'intégration avant de commencer le test du système?","fr",258);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2017,"previous project phase (IT/ST) - not completed",
258);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (265,"previous project phase (IT/ST) - not completed","Attention! You haven't finished the integration test!",
"en",2017);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (266,"Vorgängerphase (IT/ST) nicht beendet","Achtung! Sie haben die Vorgängerphase (Integrationstest) noch nicht beendet!",
"de",2017);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (432,"Phase précédente du projet (TI/TS) - inachevée","Attention! Vous n'avez pas terminé le test d'intégration!",
"fr",2017);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2032,"*",null,2017,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10128,"*","*","en",2032);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10129,"*","*","de",2032);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1065,"*","*","fr",2032);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2011,"Beginn der Systemstestsphase",
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
    z_attribute.name = "STEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*STEST_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2033,"*",2032,2017,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10130,"*","*","en",2033);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10131,"*","*","de",2033);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1066,"*","*","fr",2033);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2012,"Ende der Integrationstestphase",
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
    z_attribute.name = "ITEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*ITEST_ENDE");


/* R2f: Integrationstest/Systemtest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2018,"previous project phase (IT/ST) - completed",
258);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (267,"previous project phase (IT/ST) - completed","Very good! You finished the integration test before you started the system test!",
"en",2018);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (268,"Vorgängerphase (IT/ST) beendet","Sehr gut! Sie haben die Vorgängerphase (Integrationstest) zuvor beendet!",
"de",2018);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (433,"Phase précédente du projet (TI/TS) - achevée","Très bien! Vous avez terminé le test d'intégration avant de commencer le test du système!",
"fr",2018);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2034,"*",null,2018,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10132,"*","*","en",2034);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10133,"*","*","de",2034);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1067,"*","*","fr",2034);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2035,"*",2034,2018,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10134,"*","*","en",2035);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10135,"*","*","de",2035);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1068,"*","*","fr",2035);
/* ENDE RIETA TOOL */


/* R2fa: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2118,"previous project phase (IT/ST) - completed /SD not yet started",
258);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (269,"previous project phase (IT/ST) - completed /SD not yet started","You didn't yet start the system test.",
"en",2118);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (270,"Vorgängerphase (IT/ST) ST nicht begonnen","Achtung! Sie haben noch nicht mit dem Systemtest begonnen!",
"de",2118);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (434,"Phase précédente du projet (TI/TS) - achevée /CS non encore commencée","Vous n'avez pas encore commencé le test du système.",
"fr",2118);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2134,"*",null,2118,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10136,"*","*","en",2134);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10137,"*","*","de",2134);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1069,"*","*","fr",2134);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2135,"*",2134,2118,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10138,"*","*","en",2135);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10139,"*","*","de",2135);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1070,"*","*","fr",2135);
/* ENDE RIETA TOOL */

/* R2fb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2218,"previous project phase (IT/ST) - completed /SD not yet started",
258);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (271,"previous project phase (IT/ST) - completed /SD not yet started","Sorry, I can't give you an advice, because you already finished the integration test, but you didn't start the system test.",
"en",2218);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (272,"Vorgängerphase (IT/ST) beendet / SD noch nicht begonnen","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar den Integrationstest beendet, aber noch nicht mit dem Systemtest begonnen!",
"de",2218);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (435,"Phase précédente du projet (TI/TS) - achevée /CS non encore commencée","Désolé, je ne peux vous conseiller, car vous avez déjà terminé le test d'intégration; mais Vous n'avez pas commencé le test du système.",
"fr",2218);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2234,"*",null,2218,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10140,"*","*","en",2234);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10141,"*","*","de",2234);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1071,"*","*","fr",2234);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2235,"*",2234,2218,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10142,"*","*","en",2235);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10143,"*","*","de",2235);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1072,"*","*","fr",2235);
/* ENDE RIETA TOOL */


/* R2g: Systemtest/Abnahmetest (neg.) */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (259,
"Did I finish the system test before I asked the customer to do the acceptance test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (128,"Did I finish the system test before I asked the customer to do the acceptance test?","en",259);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (129,"Vorgängerphase vor Phasenwechsel beenden - Systemtest/Abnahmetest","de",259);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(409,"Est-ce-que j'ai terminé le test du système avant de demander
au client de faire le test d'acceptance?","fr",259);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2019,"previous project phase (ST/AT) - not completed",
259);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (273,"previous project phase (ST/AT) - not completed","Attention! You haven't finished the system test!",
"en",2019);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (274,"Vorgängerphase (ST/AT) nicht beendet","Achtung! Sie haben den Systemtest noch nicht beendet!","de",2019);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (436,"Phase précédente du projet (TS/TA) -
inachevée","Attention! Vous n'avez pas terminé le test du
système!", "fr",2019);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
*/ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2036,"*",null,2019,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10144,"*","*","en",2036);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10145,"*","*","de",2036);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1073,"*","*","fr",2036);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2014,"Beginn der Abnahmetestsphase",
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
    z_attribute.name = "ATEST_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*ATEST_BEGINN");

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2037,"*",2036,2019,2024,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10146,"*","*","en",2037);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10147,"*","*","de",2037);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1074,"*","*","fr",2037);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2013,"Ende der Systemtestphase",
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
    z_attribute.name = "STEST_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*STEST_ENDE");


/* R2g: Systemtest/Abnahmetest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2020,"forgotten previous project phase (ST/AT) (positive)",
259);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (275,"Vorgängerphase vergessen (ST/AT) (positive)","Sehr gut! Sie haben die Vorgängerphase (Systemtest) zuvor beendet!",
"de",2020);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (276,"forgotten previous project phase (ST/AT) (positive)","Very good! You finished the system test before you asked the customer to do the acceptance test.",
"en",2020);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (437,"Phase précédente du projet oubliée (TS/TA)
(positif)","Très bien! Vous avez terminé le test du système avant
de demander au client de faire le test d'acceptance.", "fr",2020);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2038,"*",null,2020,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10148,"*","*","en",2038);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10149,"*","*","de",2038);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1075,"*","*","fr",2038);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2039,"*",2038,2020,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10150,"*","*","en",2039);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10151,"*","*","de",2039);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1076,"*","*","fr",2039);
/* ENDE RIETA TOOL */

/* R2ga: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2120,"forgotten previous project phase (ST/AT) (a)",
259);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (277,"forgotten previous project phase (ST/AT) (a)","Sorry, I can't give you an advice, because you didn't ask the customer to do the acceptance test.",
"en",2120);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (278,"Vorgängerphase vergessen (ST/AT) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie noch nicht mit dem Abnahmetest begonnen haben!",
"de",2120);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (438,"Phase précédente du projet oubliée (TS/TA)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez pas
demandé au client de faire le test d'acceptance.", "fr",2120);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2138,"*",null,2120,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10152,"*","*","en",2138);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10153,"*","*","de",2138);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1077,"*","*","fr",2138);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2139,"*",2138,2120,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10154,"*","*","en",2139);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10155,"*","*","de",2139);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1078,"*","*","fr",2139);
/* ENDE RIETA TOOL */

/* R2gb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2220,"forgotten previous project phase (ST/AT) (b)",
259);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (279,"forgotten previous project phase (ST/AT) (b)","Sorry, I can't give you an advice, because you have already finished the system test, but you didn't ask the customer to do the acceptance test.",
"en",2220);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (280,"Vorgängerphase vergessen (ST/AT) (b)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar den Systemtest beendet, aber noch keinen Abnahmetest angeordnet!",
"de",2220);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (439,"Phase précédente du projet oubliée (TS/TA)
(b)","Désolé, je ne peux vous conseiller, car vous avez déjà
terminé le test du système, mais vous n'avez pas demandé au client
de faire le test d'acceptance.", "fr",2220);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2238,"*",null,2220,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10156,"*","*","en",2238);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10157,"*","*","de",2238);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1079,"*","*","fr",2238);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2239,"*",2238,2220,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10158,"*","*","en",2239);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10159,"*","*","de",2239);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1080,"*","*","fr",2239);
/* ENDE RIETA TOOL */


/* R3: Vorgängerphase sollte überprüft werden, */
/*     bevor mit nächster Phase begonnen wird  */
/* R3a: Spezifikation/Entwurf (neg.)           */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (260,
"Did I forget the review of the specification before I started the system design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (130,"Did I forget the review of the specification before I started the system design?","en",260);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (131,"Referenzdokument vor Phasenwechsel überprüfen - Spezifikation/Entwurf","de",260);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(410,"Est-ce-que j'ai oublié de faire la révision de la
spécification  avant de commencer la conception du
système?","fr",260);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2021,"check previous project phase (S/D) (negative)",
260);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (281,"check previous project phase (S/D) (negative)","Attention! You haven't reviewed the document of the previous project phase (specification)!",
"en",2021);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (282,"Vorgängerphase prüfen (S/D) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Spezifikation) noch nicht überprüft!",
"de",2021);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (440,"controller la phase précédente du projet (S/C)
(négatif)","Attention! Vous n'avez pas fait la révision du
document de la phase précédente du projet (spécification)!",
"fr",2021);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2040,"*",null,2021,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10160,"*","*","en",2040);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10161,"*","*","de",2040);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1081,"*","*","fr",2040);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2041,"*",2040,2021,2015,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10162,"*","*","en",2041);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10163,"*","*","de",2041);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1082,"*","*","fr",2041);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2015,"Beginn der Spezifikationsreviewphase",
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
    z_attribute.name = "SREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_BEGINN");


/* R3a: Spezifikation/Entwurf (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2022,"check previous project phase (S/D) (positive)",
260);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (283,"check previous project phase (S/D) (positive)","Very good! You did a review of the specification!",
"en",2022);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (284,"Vorgängerphase prüfen (S/D) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Spezifikation) zuvor überprüft!",
"de",2022);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (441,"controller la phase précédente du projet (S/C)
(positif)","Très bien! Vous avez fait la révision de la
spécification!", "fr",2022);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2042,"*",null,2022,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10164,"*","*","en",2042);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10165,"*","*","de",2042);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1083,"*","*","fr",2042);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2043,"*",2042,2022,2015,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10166,"*","*","en",2043);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10167,"*","*","de",2043);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1084,"*","*","fr",2043);
/* ENDE RIETA TOOL */


/* R3aa: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2122,"check previous project phase (S/D) (a)",
260);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (285,"check previous project phase (S/D) (a)","Sorry, I can't give you an advice, because you have started neither the system design phase nor a review of the specification.",
"en",2122);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (286,"Vorgängerphase prüfen (S/D) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie weder die Systemdesignphase begonnen haben noch einen Spezifikationsreview veranlasst haben.",
"de",2122);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (442,"controller la phase précédente du projet (S/C)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez commencé
ni la phase de la conception du système ni celle de la révision de
spécification.", "fr",2122);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2142,"*",null,2122,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10168,"*","*","en",2142);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10169,"*","*","de",2142);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1085,"*","*","fr",2142);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2143,"*",2142,2122,2015,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10170,"*","*","en",2143);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10171,"*","*","de",2143);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1086,"*","*","fr",2143);
/* ENDE RIETA TOOL */

/* R3ab: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2222,"check previous project phase (S/D) (b)",
260);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (287,"check previous project phase (S/D) (b)","Sorry, I can't give you an advice, because you have reviewed the specification, but you didn't start the system design phase.",
"en",2222);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (288,"Vorgängerphase prüfen (S/D) (b)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar einen Spezifikationsreview veranlasst, aber noch nicht mit der Systemdesignphase begonnen.",
"de",2222);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (443,"controller la phase précédente du projet (S/C)
(b)","Désolé, je ne peux vous conseiller, car vous avez fait la
révision de spécification, mais Vous n'avez pas commencé la phase
de la conception du système.", "fr",2222);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2242,"*",null,2222,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10172,"*","*","en",2242);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10173,"*","*","de",2242);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1087,"*","*","fr",2242);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2243,"*",2242,2222,2015,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10174,"*","*","en",2243);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10175,"*","*","de",2243);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1088,"*","*","fr",2243);
/* ENDE RIETA TOOL */

/* R3b: Systemdesign/Moduldesign (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (261,
"Did I forget the review of the system design before I started to do the module design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (132,"Did I forget the review of the system design before I started to do the module design?","en",261);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (133,"Referenzdokument vor Phasenwechsel überprüfen - Systemdesign/Moduldesign","de",261);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(411,"Est-ce-que j'ai oublié de faire la révision de la conception
du système avant de commencer la conception des
modules?","fr",261);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2023,"check previous project phase (SD/MD) (negative)",
261);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (289,"check previous project phase (SD/MD) (negative)","Attention! You haven't reviewed the document of the previous project phase (system design)!",
"en",2023);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (290,"Vorgängerphase prüfen (SD/MD) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Systemdesign) noch nicht überprüft!",
"de",2023);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (444,"controller la phase précédente du projet (CS/CM)
(négatif)","Attention! Vous n'avez pas fait la révision du
document de la phase précédente du projet (conception du
système)!", "fr",2023);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2044,"*",null,2023,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10176,"*","*","en",2044);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10177,"*","*","de",2044);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1089,"*","*","fr",2044);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2045,"*",2044,2023,2016,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10178,"*","*","en",2045);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10179,"*","*","de",2045);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1090,"*","*","fr",2045);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2016,"Beginn der Systemdesignreviewphase",
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
    z_attribute.name = "EREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_BEGINN");


/* R3b: Systemdesign/Moduldesign (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2024,"check previous project phase (SD/MD) (positive)",
261);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (291,"check previous project phase (SD/MD) (positive)","Very good! You reviewed the document of the previous project phase (system design) before you started to do the module design!",
"en",2024);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (292,"Vorgängerphase prüfen (SD/MD) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Systemdesign) zuvor überprüft!",
"de",2024);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (445,"controller la phase précédente du projet (CS/CM)
(positif)","Très bien! Vous avez fait la révision du document de
la phase précédente du projet (conception du système) avant de
commencer la conception des modules!", "fr",2024);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2046,"*",null,2024,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10180,"*","*","en",2046);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10181,"*","*","de",2046);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1091,"*","*","fr",2046);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2047,"*",2046,2024,2016,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10182,"*","*","en",2047);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10183,"*","*","de",2047);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1092,"*","*","fr",2047);
/* ENDE RIETA TOOL */

/* R3ba: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2124,"check previous project phase (SD/MD) (a)",
261);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (293,"check previous project phase (SD/MD) (a)","Sorry, I can't give you an advice, because you have started neither the module design nor a review of the system design.",
"en",2124);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (294,"Vorgängerphase prüfen (SD/MD) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben weder mit der Moduldesignphase begonnen noch haben sie die Durchführung eines Systemdesignreview veranlasst.",
"de",2124);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (446,"controller la phase précédente du projet (CS/CM)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez commencé
ni la conception des modules ni la révision de la conception du
système.", "fr",2124);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2146,"*",null,2124,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10184,"*","*","en",2146);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10185,"*","*","de",2146);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1093,"*","*","fr",2146);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2147,"*",2146,2124,2016,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10186,"*","*","en",2147);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10187,"*","*","de",2147);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1094,"*","*","fr",2147);
/* ENDE RIETA TOOL */

/* R3bb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2224,"check previous project phase (SD/MD) (b)",
261);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (295,"check previous project phase (SD/MD) (b)","Sorry, I can't give you an advice, because you have already initiated a review of the specification, but you did not start to do the module design.",
"en",2224);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (296,"Vorgängerphase prüfen (SD/MD) (b)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar einen Systemdesignreview veranlasst, aber noch nicht mit der Moduldesignphase begonnen.",
"de",2224);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (447,"controller la phase précédente du projet (CS/CM)
(b)","Désolé, je ne peux vous conseiller, car vous avez déjà
débuté la révision de spécification, mais Vous n'avez pas commencé
la conception des modules.", "fr",2224);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2246,"*",null,2224,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10188,"*","*","en",2246);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10189,"*","*","de",2246);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1095,"*","*","fr",2246);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2247,"*",2246,2224,2016,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10190,"*","*","en",2247);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10191,"*","*","de",2247);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1096,"*","*","fr",2247);
/* ENDE RIETA TOOL */


/* R3c: Moduldesign/Code (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (262,
"Did I forget the review of the module design before I started to do the implementation?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (134,"Did I forget the review of the module design before I started to do the implementation?","en",262);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (135,"Referenzdokument vor Phasenwechsel überprüfen - Moduldesign/Code","de",262);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(412,"Est-ce-que j'ai oublié de faire la révision de la conception
des modules avant de commencer l'implémentation?","fr",262);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2025,"check previous project phase (MD/C) (negative)",
262);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (297,"check previous project phase (MD/C) (negative)","Attention! You haven't reviewed the document of the previous project phase (module design)!",
"en",2025);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (298,"Vorgängerphase prüfen (MD/C) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Moduldesign) noch nicht überprüft!",
"de",2025);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (448,"controller la phase précédente du projet (CM/I)
(négatif)","Attention! Vous n'avez pas fait la révision du
document de la phase précédente du projet (conception des
modules)!", "fr",2025);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2048,"*",null,2025,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10192,"*","*","en",2048);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10193,"*","*","de",2048);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1097,"*","*","fr",2048);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2049,"*",2048,2025,2017,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10194,"*","*","en",2049);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10195,"*","*","de",2049);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1098,"*","*","fr",2049);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2017,"Beginn der Moduldesignreviewphase",
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
    z_attribute.name = "MREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_BEGINN");


/* R3c: Moduldesign/Code (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2026,"check previous project phase (MD/C) (positive)",
262);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (299,"check previous project phase (MD/C) (positive)","Very good! You have reviewed the module design before you started writing the code!",
"en",2026);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (300,"Vorgängerphase prüfen (MD/C) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Moduldesign) zuvor überprüft!",
"de",2026);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (449,"controller la phase précédente du projet (CM/I)
(positif)","Très bien! Vous avez fait la révision de la conception
des modules avant de commencer l'implémentation!", "fr",2026);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2050,"*",null,2026,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10196,"*","*","en",2050);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10197,"*","*","de",2050);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1099,"*","*","fr",2050);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2051,"*",null,2026,2017,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10198,"*","*","en",2051);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10199,"*","*","de",2051);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1100,"*","*","fr",2051);
/* ENDE RIETA TOOL */

/* R3ca: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2126,"check previous project phase (MD/C) (a)",
262);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (301,"check previous project phase (MD/C) (a)","Sorry, I can't give you an advice, because you have started neither the implementation nor have you initiated a review of the module design.",
"en",2126);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (302,"Vorgängerphase prüfen (MD/C) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben weder die Codierungsphase begonnen noch haben sie die Durchführung eines Moduldesignreview veranlasst.",
"de",2126);


INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (450,"controller la phase précédente du projet (CM/I)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez commencé
ni l'implémentation ni la révision de la conception des modules.",
"fr",2126);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2150,"*",null,2126,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10200,"*","*","en",2150);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10201,"*","*","de",2150);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1101,"*","*","fr",2150);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2151,"*",null,2126,2017,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10202,"*","*","en",2151);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10203,"*","*","de",2151);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1102,"*","*","fr",2151);
/* ENDE RIETA TOOL */

/* R3cb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2226,"check previous project phase (MD/C) (b)",
262);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (303,"check previous project phase (MD/C) (b)","Sorry, I can't give you an advice, because you have already initiated review of the module design, but you didn't start to do the implementation.",
"en",2226);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (304,"Vorgängerphase prüfen (MD/C) (b)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar einen Moduldesignreview veranlasst, aber noch nicht mit der Codierungsphase begonnen.",
"de",2226);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (451,"controller la phase précédente du projet (CM/I)
(b)","Désolé, je ne peux vous conseiller, car vous avez déjà
débuté la révision de la conception des modules, mais vous n'avez
pas commencé l'implémentation.", "fr",2226);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2250,"*",null,2226,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10204,"*","*","en",2250);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10205,"*","*","de",2250);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1103,"*","*","fr",2250);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2251,"*",null,2226,2017,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10206,"*","*","en",2251);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10207,"*","*","de",2251);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1104,"*","*","fr",2251);
/* ENDE RIETA TOOL */


/* R4: Vorgängerphase sollte korrigiert werden, */
/*     bevor mit nächster Phase begonnen wird   */
/* R4a: Spezifikation/Entwurf (neg.)            */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (263,
"Did I forget the correction of the specification before I started to do the system design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (136,"Did I forget the correction of the specification before I started to do the system design?","en",263);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (137,"Referenzdokument vor Phasenwechsel korrigieren - Spezifikation/Entwurf","de",263);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(413,"Est-ce-que j'ai oublié de faire la correction de la
spécification  avant de commencer la conception du
système?","fr",263);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2027,"forgotten previous project phase (S/D) (negative)",
263);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (305,"forgotten previous project phase (S/D) (negative)","Attention! You haven't corrected the document of the previous project phase (specification)!",
"en",2027);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (306,"Vorgängerphase vergessen (S/D) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Spezifikation) noch nicht korrigiert!",
"de",2027);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (452,"Phase précédente du projet oubliée (S/C)
(négatif)","Attention! Vous n'avez pas corrigé le document de la
phase précédente du projet (spécification)!", "fr",2027);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2052,"*",null,2027,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10208,"*","*","en",2052);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10209,"*","*","de",2052);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1105,"*","*","fr",2052);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2053,"*",2052,2027,2018,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10210,"*","*","en",2053);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10211,"*","*","de",2053);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1106,"*","*","fr",2053);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2018,"Beginn der Spezifikationskorrekturphase",
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
    z_attribute.name = "SREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_K_BEGINN");


/* R4a: Spezifikation/Entwurf (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2028,"forgotten previous project phase (S/D) (positive)",
263);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (307,"forgotten previous project phase (S/D) (positive)","Very good! You have corrected the document of the previous project phase (specification)!",
"en",2028);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (308,"Vorgängerphase vergessen (S/D) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Spezifikation) zuvor korrigiert!",
"de",2028);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (453,"Phase précédente du projet oubliée (S/C)
(positif)","Très bien! Vous avez corrigé le document de la phase
précédente du projet (spécification)!", "fr",2028);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2054,"*",null,2028,2000,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10212,"*","*","en",2054);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10213,"*","*","de",2054);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1107,"*","*","fr",2054);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2055,"*",2054,2028,2018,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10214,"*","*","en",2055);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10215,"*","*","de",2055);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1108,"*","*","fr",2055);
/* ENDE RIETA TOOL */

/* R4aa: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2128,"forgotten previous project phase (S/D) (a)",
263);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (309,"forgotten previous project phase (S/D) (a)","Sorry, I can't give you an advice, because you have started neither with the system design nor with the correction of the specification.",
"en",2128);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (310,"Vorgängerphase vergessen (S/D) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben weder mit der Entwurfsphase begonnen noch haben sie eine Korrektur der Spezifikation vorgenommen.",
"de",2128);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (454,"Phase précédente du projet oubliée (S/C) (a)","Désolé, je ne peux vous conseiller, car vous n'avez commencé ni avec la conception du système ni avec celle de la correction de spécification.",
"fr",2128);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2154,"*",null,2128,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10216,"*","*","en",2154);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10217,"*","*","de",2154);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1109,"*","*","fr",2154);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2155,"*",2154,2128,2018,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10218,"*","*","en",2155);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10219,"*","*","de",2155);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1110,"*","*","fr",2155);
/* ENDE RIETA TOOL */

/* R4ab: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2228,"forgotten previous project phase (S/D) (a)",
263);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (311,"forgotten previous project phase (S/D) (a)","Sorry, I can't give you an advice, because you have already corrected the specification, but you did not start writing the system design.",
"en",2228);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (312,"Vorgängerphase vergessen (S/D) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar die Korrektur der Spezifikation vorgenommen, jedoch noch nicht mit der Entwurfsphase begonnen.",
"de",2228);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (455,"Phase précédente du projet oubliée (S/C) (a)","Désolé, je ne peux vous conseiller, car vous avez déjà corrigé la spécification, mais Vous n'avez pas réalisé la conception du système.",
"fr",2228);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2254,"*",null,2228,2000,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10220,"*","*","en",2254);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10221,"*","*","de",2254);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1111,"*","*","fr",2254);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2255,"*",2254,2228,2018,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10222,"*","*","en",2255);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10223,"*","*","de",2255);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1112,"*","*","fr",2255);
/* ENDE RIETA TOOL */

/* R4b: Systemdesign/Moduldesign (neg.) */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (264,
"Did I forget the correction of the system design before I started to do the module design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (138,"Did I forget the correction of the system design before I started to do the module design?","en",264);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (139,"Referenzdokument vor Phasenwechsel korrigieren - Systemdesign/Moduldesign","de",264);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (414,"Est-ce-que j'ai oublié la correction de la conception du système avant de commencer la conception des modules?","fr",264);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2029,"forgotten previous project phase (SD/MD) (negative)",
264);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (313,"forgotten previous project phase (SD/MD) (negative)","Attention! You haven't corrected the document of the previous project phase (system design)!",
"en",2029);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (314,"Vorgängerphase vergessen (SD/MD) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Systemdesign) noch nicht korrigiert!",
"de",2029);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (456,"Phase précédente du projet oubliée (CS/CM)
(négatif)","Attention! Vous n'avez pas corrigé le document de la
phase précédente du projet (conception du système)!", "fr",2029);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2056,"*",null,2029,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10224,"*","*","en",2056);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10225,"*","*","de",2056);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1113,"*","*","fr",2056);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2057,"*",2056,2029,2019,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10226,"*","*","en",2057);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10227,"*","*","de",2057);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1114,"*","*","fr",2057);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2019,"Beginn der Systemdesignkorrekturphase",
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
    z_attribute.name = "EREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_K_BEGINN");


/* R4b: Systemdesign/Moduldesign (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2030,"forgotten previous project phase (SD/MD) (positive)",
264);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (315,"forgotten previous project phase (SD/MD) (positive)","Very good! You have corrected the document of the previous project phase (system design)!",
"en",2030);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (316,"Vorgängerphase vergessen (SD/MD) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Systemdesign) bereits korrigiert!",
"de",2030);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (457,"Phase précédente du projet oubliée (CS/CM)
(positif)","Très bien! Vous avez corrigé le document de la phase
précédente du projet (conception du système)!", "fr",2030);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2058,"*",null,2030,2002,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10228,"*","*","en",2058);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10229,"*","*","de",2058);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1115,"*","*","fr",2058);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2059,"*",2058,2030,2019,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10230,"*","*","en",2059);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10231,"*","*","de",2059);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1116,"*","*","fr",2059);
/* ENDE RIETA TOOL */


/* R4ba: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2130,"forgotten previous project phase (SD/MD) (a)",
264);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (317,"forgotten previous project phase (SD/MD) (a)","Sorry, I can't give you an advice, because you have started neither the module design nor a correction of the system design.",
"en",2130);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (318,"Vorgängerphase vergessen (SD/MD) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben weder mit dem Moduldesign begonnen noch haben sie eine Korrektur des Systemdesigns vorgenommen.",
"de",2130);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (458,"Phase précédente du projet oubliée (CS/CM)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez commencé
ni la conception des modules ni la correction de la conception du
système.", "fr",2130);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2158,"*",null,2130,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10232,"*","*","en",2158);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10233,"*","*","de",2158);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1117,"*","*","fr",2158);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2159,"*",2158,2130,2019,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10234,"*","*","en",2159);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10235,"*","*","de",2159);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1118,"*","*","fr",2159);
/* ENDE RIETA TOOL */

/* R4bb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2230,"forgotten previous project phase (SD/MD) (b)",
264);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (319,"forgotten previous project phase (SD/MD) (b)","Sorry, I can't give you an advice, because you have corrected the system design, but you did not start to do the module design.",
"en",2230);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (320,"Vorgängerphase vergessen (SD/MD) (b)", "Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar die Korrektur des Systemdesigns vorgenommen, jedoch noch nicht mit dem Moduldesign begonnen.",
"de",2230);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (459,"Phase précédente du projet oubliée (CS/CM) (b)","Désolé, je ne peux vous conseiller, car vous avez corrigé la conception du système, mais vous n'avez pas commencé la conception des modules.",
"fr",2230);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2258,"*",null,2230,2002,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10236,"*","*","en",2258);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10237,"*","*","de",2258);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1119,"*","*","fr",2258);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2259,"*",2258,2230,2019,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10238,"*","*","en",2259);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10239,"*","*","de",2259);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1120,"*","*","fr",2259);
/* ENDE RIETA TOOL */

/* R4c: Moduldesign/Code (neg.) */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (265,
"Did I forget the correction of the module design before I started to do the implementation?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (140,"Did I forget the correction of the module design before I started to do the implementation?","en",265);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (141,"Referenzdokument vor Phasenwechsel korrigieren - Moduldesign/Code","de",265);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (415,"Est-ce-que j'ai oublié de faire la correction de la conception des modules avant de commencer l'implémentation?","fr",265);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2031,"forgotten previous project phase (MD/C) (negative)",
265);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (321,"forgotten previous project phase (MD/C) (negative)","Attention! You haven't corrected the document of the previous project phase (module design)!",
"en",2031);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (322,"Vorgängerphase vergessen (MD/C) (negativ)","Achtung! Sie haben das Dokument der Vorgängerphase (Moduldesign) noch nicht korrigiert!",
"de",2031);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (460,"Phase précédente du projet oubliée (CM/I)
(négatif)","Attention! Vous n'avez pas corrigé le document de la
phase précédente du projet (conception des modules)!", "fr",2031);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2060,"*",null,2031,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10240,"*","*","en",2060);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10241,"*","*","de",2060);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1121,"*","*","fr",2060);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2061,"*",2060,2031,2020,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10242,"*","*","en",2061);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10243,"*","*","de",2061);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1122,"*","*","fr",2061);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2020,"Beginn der Moduldesignkorrekturphase",
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
    z_attribute.name = "MREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_K_BEGINN");


/* R4c: Moduldesign/Code (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2032,"forgotten previous project phase (MD/C) (positive)",
265);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (323,"forgotten previous project phase (MD/C) (positive)","Very good! You have corrected the document of the previous project phase (module design) before you started writing the implementation!",
"en",2032);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (324,"Vorgängerphase vergessen (MD/C) (positiv)","Sehr gut! Sie haben das Dokument der Vorgängerphase (Moduldesign) zuvor korrigiert!",
"de",2032);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (461,"Phase précédente du projet oubliée (CM/I)
(positif)","Très bien! Vous avez corrigé le document de la phase
précédente du projet (conception des modules) avant de commencer
l'implémentation!", "fr",2032);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2062,"*",null,2032,2003,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10244,"*","*","en",2062);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10245,"*","*","de",2062);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1123,"*","*","fr",2062);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2063,"*",2062,2032,2020,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10246,"*","*","en",2063);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10247,"*","*","de",2063);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1124,"*","*","fr",2063);
/* ENDE RIETA TOOL */

/* R4ca: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2132,"forgotten previous project phase (MD/C) (a)",
265);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (325,"forgotten previous project phase (MD/C) (a)","Sorry, I can't give you an advice, because you did not start neither the implementation nor a correction of the module design.",
"en",2132);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (326,"Vorgängerphase vergessen (MD/C) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben weder mit der Codierungsphase begonnen noch haben sie eine Korrektur des Moduldesigns vorgenommen.",
"de",2132);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (462,"Phase précédente du projet oubliée (CM/I) (a)","Désolé, je ne peux vous conseiller, car vous n'avez ni commencé l'implémentation ni corrigé la conception des modules.",
"fr",2132);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2162,"*",null,2132,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10248,"*","*","en",2162);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10249,"*","*","de",2162);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1125,"*","*","fr",2162);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2163,"*",2162,2132,2020,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10250,"*","*","en",2163);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10251,"*","*","de",2163);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1126,"*","*","fr",2163);
/* ENDE RIETA TOOL */


/* R4cb: sonstige Fälle */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2232,"forgotten previous project phase (MD/C) (b)",
265);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (327,"forgotten previous project phase (MD/C) (b)","Sorry, I can't give you an advice, because you just started to do the correction of the module design, but you haven't yet started to do the implementation.",
"en",2232);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (328,"Vorgängerphase vergessen (MD/C) (b)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden. Sie haben zwar die Korrektur des Moduldesigns vorgenommen, jedoch noch nicht mit der Codierungsphase begonnen.",
"de",2232);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (463,"Phase précédente du projet oubliée (CM/I) (b)","Désolé, je ne peux vous conseiller, car vous venez juste de commencer la correction de la conception des modules, mais vous n'avez pas encore commencé l'implémentation.",
"fr",2232);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2262,"*",null,2232,2003,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10252,"*","*","en",2262);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10253,"*","*","de",2262);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1127,"*","*","fr",2262);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2263,"*",2262,2232,2020,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10254,"*","*","en",2263);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10255,"*","*","de",2263);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1128,"*","*","fr",2263);
/* ENDE RIETA TOOL */

/* R5: nach Tests nicht auf Korrektur vergessen */
/* R5a: Modultest/Integrationstest (neg.)       */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (266,
"Did I forget the correction of the code after the module test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (142,"Did I forget the correction of the code after the module test?","en",266);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (143,"nach Tests nicht auf Korrektur vergessen - Modultest/Integrationstest","de",266);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (416,"Est-ce-que j'ai oublié de faire la correction de l'implémentation après le test des modules?","fr",266);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2033,"forgotten previous project phase (MT/IT) (negative)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (329,"forgotten previous project phase (MT/IT) (negative)","Attention! You haven't corrected the code according to the module test report before you started the integration test!",
"en",2033);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (330,"Vorgängerphase vergessen (MT/IT) (negativ)","Achtung! Sie haben die Vorgängerphase (Modultest) noch nicht korrigiert!",
"de",2033);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (464,"Phase précédente du projet oubliée (TM/TI) (négatif)","Attention! Vous n'avez pas corrigé l'implémentation selon le contre rendu du test des modules avant de commencer le test d'intégration!",
"fr",2033);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2064,"*",null,2033,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10256,"*","*","en",2064);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10257,"*","*","de",2064);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1129,"*","*","fr",2064);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2065,"*",2064,2033,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10258,"*","*","en",2065);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10259,"*","*","de",2065);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1130,"*","*","fr",2065);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2066,"*",2065,2033,2021,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10260,"*","*","en",2066);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10261,"*","*","de",2066);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1131,"*","*","fr",2066);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2021,"Beginn der Modultestkorrekturphase",
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
    z_attribute.name = "MTEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*MTEST_K_BEGINN");


/* R5a: Modultest/Integrationstest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2034,"forgotten previous project phase (MT/IT) (positive)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (331,"forgotten previous project phase (MT/IT) (positive)","Very good! You have corrected the code according to the module test report before you started the integration test.",
"en",2034);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (332,"Vorgängerphase vergessen (MT/IT) (positiv)","Sehr gut! Sie haben die Vorgängerphase (Modultest) zuvor korrigiert!",
"de",2034);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (465,"Phase précédente du projet oubliée (TM/TI) (positif)","Très bien! Vous avez corrigé l'implémentation selon le contre rendu du test des modules avant de commencer le test d'intégration.",
"fr",2034);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2067,"*",null,2034,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10262,"*","*","en",2067);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10263,"*","*","de",2067);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1132,"*","*","fr",2067);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2068,"*",2067,2034,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10264,"*","*","en",2068);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10265,"*","*","de",2068);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1133,"*","*","fr",2068);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2069,"*",2068,2034,2021,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10266,"*","*","en",2069);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10267,"*","*","de",2069);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1134,"*","*","fr",2069);
/* ENDE RIETA TOOL */

/* R5aa: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2134,"forgotten previous project phase - module test/integration test (a)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (333,"forgotten previous project phase - module test/integration test (a)","Sorry, I can't give you an advice, because you haven't finished the module test and you haven't made a correction of the code according to the module test report.",
"en",2134);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (334,"Vorgängerphase vergessen (MT/IT) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie den Modultest noch nicht beendet und noch keine Korrektur des Codes aufgrund des Modultests vorgenommen haben.",
"de",2134);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (466,"Phase précédente du projet oubliée - test des
modules/test d'intégration (a)","Désolé, je ne peux vous
conseiller, car vous n'avez pas terminé le test des modules et
vous n'avez pas fait la correction de l'implémentation selon le
contre rendu du test des modules.", "fr",2134);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2167,"*",null,2134,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10268,"*","*","en",2167);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10269,"*","*","de",2167);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1135,"*","*","fr",2167);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2168,"*",2167,2134,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10270,"*","*","en",2168);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10271,"*","*","de",2168);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1136,"*","*","fr",2168);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2169,"*",2168,2134,2021,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10272,"*","*","en",2169);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10273,"*","*","de",2169);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1137,"*","*","fr",2169);
/* ENDE RIETA TOOL */

/* R5ab: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2234,"forgotten previous project phase (MT/IT) (b)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (335,"forgotten previous project phase (MT/IT) (b)","Attention! You started the integration test before you have finished and corrected the module test. It would be better to finish the correction of the code according to the module test before you start to do the integration test.
This helps eliminating a lot of errors in the code.",
"en",2234);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (336,"Vorgängerphase vergessen (MT/IT) (b)","Achtung! Sie haben den Modultest noch nicht fertiggestellt, aber bereits mit der Korrektur begonnen.
Außerdem haben sie bereits mit dem Integrationstest begonnen. Es wäre besser, wenn sie zuerst auf die Fertigstellung der Korrektur des Modultests warten würden, dann werden nicht so viele Fehler in die nächste Phase übernommen.",
"de",2234);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (467,"Phase précédente du projet oubliée (TM/TI) (b)","Attention! vous avez commencé le test d'intégration avant de finir et de corriger le test des modules. Il faut mieux de finir la correction de l'implémentation selon le contre rendu du test des modules avant de commencer le test d'intégration.
Cela permet d'éliminer beaucoup d'erreurs dans le code.",
"fr",2234);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2267,"*",null,2234,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10274,"*","*","en",2267);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10275,"*","*","de",2267);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1138,"*","*","fr",2267);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2268,"*",2267,2234,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10276,"*","*","en",2268);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10277,"*","*","de",2268);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1139,"*","*","fr",2268);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2269,"*",2268,2234,2021,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10278,"*","*","en",2269);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10279,"*","*","de",2269);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1140,"*","*","fr",2269);
/* ENDE RIETA TOOL */


/* R5ac: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2334,"forgotten previous project phase (MT/IT) (c)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (337,"forgotten previous project phase (MT/IT) (c)","Attention! You have forgotten about the module test!
You started the integration test without testing the modules before. You should abort the integration test and start testing the modules carefully.
Afterwards you should correct the code according to the module test report and then you can start to do the integration test.",
"en",2334);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (338,"Vorgängerphase vergessen (MT/IT) (c)","Achtung! Sie haben auf den Modultest vergessen!
Sie haben mit dem Integrationstest begonnen, bevor sie einen vollständigen Modultest durchgeführt haben. Sie sollten den Integrationstest abbrechen und zuerst den Modultest vornehmen/beenden.
Anschließend sollten sie den Code aufgrund des Modultestberichts korrigieren und erst dann mit dem Integrationstest beginnen.",
"de",2334);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (468,"Phase précédente du projet oubliée (TM/TI) (c)","Attention! vous avez oublié le test des modules!
vous avez commencé le test d'intégration sans avoir effectué le test des modules. Vous devez abondonner le test d'intégration et commencer le test des modules attentivement. Ensuite, vous devrez corriger le code selon le contre rendu du test des modules avant de faire le test d'intégration.",
"fr",2334);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2367,"*",null,2334,2009,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10280,"*","*","en",2367);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10281,"*","*","de",2367);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1141,"*","*","fr",2367);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2368,"*",2367,2334,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10282,"*","*","en",2368);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10283,"*","*","de",2368);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1142,"*","*","fr",2368);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2369,"*",2368,2334,2021,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10284,"*","*","en",2369);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10285,"*","*","de",2369);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1143,"*","*","fr",2369);
/* ENDE RIETA TOOL */

/* R5ad: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2434,"forgotten previous project phase (MT/IT) (d)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (339,"forgotten previous project phase (MT/IT) (d)","You have not yet started to do the integration test, but you have already finished the module test and the correction of the code according to the module test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2434);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (340,"Vorgängerphase vergessen (MT/IT) (d)","Sie haben noch nicht mit dem Integrationstest begonnen. Allerdings haben sie den Modultest bereits abgeschlossen und auch eine Korrektur des Codes aufgrund des Modultests veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2434);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (469,"Phase précédente du projet oubliée (TM/TI) (d)","Vous n'avez pas encore commencé le test d'intégration, mais vous avez déjà terminé le test des modules et la  correction du code selon le contre rendu du test des modules.
Vous êtes sur la bonne voix, mais essayez de corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2434);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2467,"*",null,2434,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10286,"*","*","en",2467);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10287,"*","*","de",2467);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1144,"*","*","fr",2467);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2468,"*",2467,2434,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10288,"*","*","en",2468);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10289,"*","*","de",2468);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1145,"*","*","fr",2468);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2469,"*",2468,2434,2021,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10290,"*","*","en",2469);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10291,"*","*","de",2469);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1146,"*","*","fr",2469);
/* ENDE RIETA TOOL */

/* R5ae: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2734,"forgotten previous project phase (MT/IT) (e)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (341,"forgotten previous project phase (MT/IT) (e)","You did not start the integration test, but you have finished the module test. You should initiate a correction of the code according to the module test report before you start the integration test.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2734);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (342,"Vorgängerphase vergessen (MT/IT) (e)","Sie haben noch nicht mit dem Integrationstest begonnen. Allerdings haben sie den Modultest bereits abgeschlossen. Sie sollten bevor sie mit dem Integrationstest beginnen eine Korrektur des Codes aufgrund des Modultests vornehmen.
Sie sind auf dem richtigen Weg. Achten sie darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2734);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (470,"Phase précédente du projet oubliée (TM/TI) (e)","Vous n'avez pas commencé le test d'intégration, mais vous avez terminé le test des modules. vous devrez initier la correction du code selon le contre rendu du test des modules avant de commencer le test d'intégration.
Vous êtes sur la bonne voix, mais essayez de corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2734);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2767,"*",null,2734,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10292,"*","*","en",2767);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10293,"*","*","de",2767);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1147,"*","*","fr",2767);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2768,"*",2767,2734,2010,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10294,"*","*","en",2768);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10295,"*","*","de",2768);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1148,"*","*","fr",2768);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2769,"*",2768,2734,2021,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10296,"*","*","en",2769);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10297,"*","*","de",2769);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1149,"*","*","fr",2769);
/* ENDE RIETA TOOL */

/* R5af: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2834,"forgotten previous project phase (MT/IT) (f)",
266);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (343,"forgotten previous project phase (MT/IT) (f)","You did not start to do the integration test and you haven't finished the module test, but you have initiated a correction of the code according to the module test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2834);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (344,"Vorgängerphase vergessen (MT/IT) (f)","Sie haben noch nicht mit dem Integrationstest begonnen. Der Modultest wurde noch nicht abgeschlossen. Sie haben aber bereits die Korrektur des Codes aufgrund des Modultests veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2834);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (471,"Phase précédente du projet oubliée (TM/TI) (f)","Vous n'avez pas commencé le test d'intégration et vous n'avez pas terminé le test des modules, mais vous avez initier la correction du code selon le contre rendu du test des modules.
Vous êtes sur la bonne voix, mais essayez de corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2834);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2867,"*",null,2834,2009,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10298,"*","*","en",2867);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10299,"*","*","de",2867);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1150,"*","*","fr",2867);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2868,"*",2867,2834,2010,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10300,"*","*","en",2868);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10301,"*","*","de",2868);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1151,"*","*","fr",2868);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2869,"*",2868,2834,2021,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10302,"*","*","en",2869);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10303,"*","*","de",2869);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1152,"*","*","fr",2869);
/* ENDE RIETA TOOL */


/* R5b: Integrationstest/Systemtest (neg.) */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (267,
"Did I forget the correction of the integration test before I started testing the system?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (144,"Did I forget the correction of the integration test before I started testing the system?","en",267);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (145,"nach Tests nicht auf Korrektur vergessen - Integrationstest/Systemtest","de",267);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (417,"Est-ce-que j'ai oublié de faire la correction du test d'intégration avant de commencer le test du système?","fr",267);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2035,"forgotten previous project phase (IT/ST) (negative)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (345,"forgotten previous project phase (IT/ST) (negative)","Attention! You haven't corrected the code according to the test report of the previous test (integration test)!",
"en",2035);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (346,"Vorgängerphase vergessen (IT/ST) (negativ)","Achtung! Sie haben die Vorgängerphase (Integrationstest) noch nicht korrigiert!",
"de",2035);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (472,"Phase précédente du projet oubliée (TI/TS) (négatif)","Attention! Vous n'avez pas corrigé le code selon le contre rendu du test précédent (test d'intégration)!",
"fr",2035);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2070,"*",null,2035,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10304,"*","*","en",2070);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10305,"*","*","de",2070);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1153,"*","*","fr",2070);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2071,"*",2070,2035,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10306,"*","*","en",2071);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10307,"*","*","de",2071);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1154,"*","*","fr",2071);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2072,"*",2071,2035,2022,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10308,"*","*","en",2072);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10309,"*","*","de",2072);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1155,"*","*","fr",2072);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2022,"Beginn der Integrationstestkorrekturphase",
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
    z_attribute.name = "ITEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*ITEST_K_BEGINN");


/* R5b: Integrationstest/Systemtest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2036,"forgotten previous project phase (IT/ST) (positive)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (347,"forgotten previous project phase (IT/ST) (positive)","Very good! You corrected the code according to the test report of the previous test (integration test)!",
"en",2036);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (348,"forgotten previous project phase (IT/ST) (positive)","Sehr gut! Sie haben die Vorgängerphase (Integrationstest) zuvor korrigiert!",
"de",2036);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (473,"Phase précédente du projet oubliée (TI/TS) (positif)","Très bien! Vous avez corrigé le code selon le contre rendu du test précédent (test d'intégration)!",
"fr",2036);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2073,"*",null,2036,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10310,"*","*","en",2073);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10311,"*","*","de",2073);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1156,"*","*","fr",2073);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2074,"*",2073,2036,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10312,"*","*","en",2074);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10313,"*","*","de",2074);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1157,"*","*","fr",2074);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2075,"*",2074,2036,2022,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10314,"*","*","en",2075);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10315,"*","*","de",2075);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1158,"*","*","fr",2075);
/* ENDE RIETA TOOL */

/* R5ba: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2136,"forgotten previous project phase (IT/ST) (a)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (349,"forgotten previous project phase (IT/ST) (a)","Sorry, I can't give you an advice, because you have neither started the integration test nor you have corrected the code according to the integration test report.",
"en",2136);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (350,"Vorgängerphase vergessen (IT/ST) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie den Integrationstest noch nicht beendet und noch keine Korrektur des Codes aufgrund des Integrationstests vorgenommen haben.",
"de",2136);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (474,"Phase précédente du projet oubliée (TI/TS)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez ni
commencé le test d'intégration ni corrigé le code selon le contre
rendu du test d'intégration.", "fr",2136);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2173,"*",null,2136,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10316,"*","*","en",2173);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10317,"*","*","de",2173);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1159,"*","*","fr",2173);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2174,"*",2173,2136,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10318,"*","*","en",2174);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10319,"*","*","de",2174);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1160,"*","*","fr",2174);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2175,"*",2174,2136,2022,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10320,"*","*","en",2175);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10321,"*","*","de",2175);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1161,"*","*","fr",2175);
/* ENDE RIETA TOOL */

/* R5bb: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2236,"forgotten previous project phase (IT/ST) (b)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (351,"forgotten previous project phase (IT/ST) (b)","Attention! You started the system test before you have finished and corrected the integration test. It would be better to finish the correction of the code according to the integration test before you start to do the system test.
This helps eliminating a lot of errors in the code.",
"en",2236);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (352,"Vorgängerphase vergessen (IT/ST) (b)","Achtung! Sie haben den Integrationstest noch nicht fertiggestellt, aber bereits mit der Korrektur begonnen.
Außerdem haben sie bereits mit dem Systemtest begonnen. Es wäre besser, wenn sie zuerst auf die Fertigstellung der Korrektur des Integrationstests warten würden, dann werden nicht so viele Fehler in die nächste Phase übernommen.",
"de",2236);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (475,"Phase précédente du projet oubliée (TI/TS) (b)","Attention! Vous avez commencé le test du système avant de finir et de corriger le test d'intégration. Il faut mieux finir la correction du code selon le contre rendu du test d'intégration avant de commencer le test du système.
Cela permet d'éliminer beaucoup d'erreurs dans le code.",
"fr",2236);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2273,"*",null,2236,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10322,"*","*","en",2273);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10323,"*","*","de",2273);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1162,"*","*","fr",2273);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2274,"*",2273,2236,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10324,"*","*","en",2274);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10325,"*","*","de",2274);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1163,"*","*","fr",2274);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2275,"*",2274,2236,2022,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10326,"*","*","en",2275);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10327,"*","*","de",2275);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1164,"*","*","fr",2275);
/* ENDE RIETA TOOL */

/* R5bc: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2336,"orgotten previous project phase (IT/ST)  (c)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (353,"forgotten previous project phase (IT/ST) (c)","Attention! You have forgotten the integration test!
You started the system test, without an integration test before. You should abort the system test and start to do the integration test.
Afterwards you should correct the code according to the integration test report and then you can start to do the system test.",
"en",2336);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (354,"Vorgängerphase vergessen (IT/ST) (c)","Achtung! Sie haben auf den Integrationstest vergessen!
Sie haben mit dem Systemtest begonnen, bevor sie einen Integrationstest durchgeführt haben. Sie sollten den Systemtest abbrechen und zuerst den Integrationstest vornehmen.
Anschließend sollten sie den Code aufgrund des Integrationstestberichts korrigieren und erst dann mit dem Systemtest beginnen.",
"de",2336);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (476,"Phase précédente du projet oubliée (TI/TS) (c)","Attention! vous avez oublié le test d'intégration!
vous avez commencé le test du système sans avoir effectué le test d'intégration. Vous devez abondonner le test du système et commencer le test d'intégration. Ensuite, vous devrez corriger le code selon le contre rendu du test d'intégration avant de commencer le test du système.",
"fr",2336);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2373,"*",null,2336,2011,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10328,"*","*","en",2373);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10329,"*","*","de",2373);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1165,"*","*","fr",2373);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2374,"*",2373,2336,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10330,"*","*","en",2374);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10331,"*","*","de",2374);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1166,"*","*","fr",2374);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2375,"*",2374,2336,2022,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10332,"*","*","en",2375);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10333,"*","*","de",2375);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1167,"*","*","fr",2375);
/* ENDE RIETA TOOL */

/* R5bd: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2436,"forgotten previous project phase (IT/ST) (d)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (355,"forgotten previous project phase (IT/ST) (d)","You did not start the system test, but you finished the integration test and initiated a correction of the code according to the integration test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2436);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (356,"Vorgängerphase vergessen (IT/ST) (d)","Sie haben noch nicht mit dem Systemtest begonnen. Allerdings haben sie den Integrationstest bereits abgeschlossen und auch eine Korrektur des Codes aufgrund des Integrationstestberichts veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2436);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (477,"Phase précédente du projet oubliée (TI/TS) (d)","Vous n'avez pas commencé le test du système, mais vous avez terminé le test d'intégration et initié la  correction du code selon le contre rendu du test d'intégration.
Vous êtes sur la bonne voix, mais essayez de corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2436);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2473,"*",null,2436,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10334,"*","*","en",2473);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10335,"*","*","de",2473);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1168,"*","*","fr",2473);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2474,"*",2473,2436,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10336,"*","*","en",2474);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10337,"*","*","de",2474);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1169,"*","*","fr",2474);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2475,"*",2474,2436,2022,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10338,"*","*","en",2475);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10339,"*","*","de",2475);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1170,"*","*","fr",2475);
/* ENDE RIETA TOOL */


/* R5be: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2736,"forgotten previous project phase (IT/ST) (e)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (357,"forgotten previous project phase (IT/ST) (e)","You did not start the system test, but you have finished the integration test. You should initiate a correction of the code according to the integration test report before you start the system test.
Try to correct all errors before you initiate the next test.",
"en",2736);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (358,"Vorgängerphase vergessen (IT/ST) (e)","Sie haben noch nicht mit dem Systemtest begonnen. Allerdings haben sie den Integrationstest bereits abgeschlossen. Sie sollten bevor sie mit dem Integrationstest beginnen eine Korrektur des Codes aufgrund des Integrationstests vornehmen.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2736);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (478,"Phase précédente du projet oubliée (TI/TS) (e)","Vous
n'avez pas commencé le test du système, mais vous avez terminé le
test d'intégration. Vous devrez initier la correction du code
selon le contre rendu du test d'intégration avant de commencer le
test du système. Essayez de corriger toutes les erreurs avant
d'initier le test suivant.", "fr",2736);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2773,"*",null,2736,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10340,"*","*","en",2773);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10341,"*","*","de",2773);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1171,"*","*","fr",2773);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2774,"*",2773,2736,2012,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10342,"*","*","en",2774);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10343,"*","*","de",2774);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1172,"*","*","fr",2774);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2775,"*",2774,2736,2022,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10344,"*","*","en",2775);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10345,"*","*","de",2775);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1173,"*","*","fr",2775);
/* ENDE RIETA TOOL */

/* R5bf: zusätzlicher Fall*/

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2836,"forgotten previous project phase (IT/ST) (f)",
267);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (359,"forgotten previous project phase (IT/ST) (f)","You did not start to do the system test and you haven't finished the integration test, but you have initiated a correction of the code according to the integration test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2836);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (360,"Vorgängerphase vergessen (IT/ST) (f)","Sie haben noch nicht mit dem Systemtest begonnen. Der Integrationstest wurde noch nicht abgeschlossen. Sie haben aber bereits die Korrektur des Codes aufgrund des Integrationstestberichts veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2836);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (479,"Phase précédente du projet oubliée (TI/TS) (f)","Vous n'avez pas commencé le test du système et vous n'avez pas terminé le test d'intégration, mais vous avez initier la correction du code selon le contre rendu du test d'intégration.
Vous êtes sur la bonne voix, mais essayez de corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2836);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2873,"*",null,2836,2011,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10346,"*","*","en",2873);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10347,"*","*","de",2873);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1174,"*","*","fr",2873);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2874,"*",2873,2836,2012,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10348,"*","*","en",2874);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10349,"*","*","de",2874);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1175,"*","*","fr",2874);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2875,"*",2874,2836,2022,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10350,"*","*","en",2875);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10351,"*","*","de",2875);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1176,"*","*","fr",2875);
/* ENDE RIETA TOOL */

/* R5c: Systemtest/Abnahmetest (neg.) */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (268,
"Did I forget the correction of the code according to the system test report before I asked the customer to do the acceptance test?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (146,"Did I forget the correction of the code according to the system test report before I asked the customer to do the acceptance test?",
"en",268);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (147,"nach Tests nicht auf Korrektur vergessen - Systemtest/Abnahmetest","de",268);

INSERT INTO aid_desc_lang(did,description,language,aiddid) VALUES
(418,"Est-ce-que j'ai oublié de faire la correction du code selon le contre rendu du test du système avant de demander au client de faire le test d'acceptance?", "fr",268);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2037,"forgotten previous project phase (ST/AT) (negative)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (361,"forgotten previous project phase (ST/AT) (negative)","Attention! You haven't finished the previous test (system test)!",
"en",2037);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (362,"Vorgängerphase vergessen (ST/AT) (negativ)","Achtung! Sie haben die Vorgängerphase (Systemtest) noch nicht beendet!",
"de",2037);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (480,"Phase précédente du projet oubliée (TS/TA) (négatif)","Attention! Vous n'avez pas terminé le test précédent (test du système)!",
"fr",2037);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2076,"*",null,2037,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10352,"*","*","en",2076);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10353,"*","*","de",2076);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1177,"*","*","fr",2076);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2077,"*",2076,2037,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10354,"*","*","en",2077);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10355,"*","*","de",2077);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1178,"*","*","fr",2077);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2078,"*",2077,2037,2023,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10356,"*","*","en",2078);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10357,"*","*","de",2078);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1179,"*","*","fr",2078);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2023,"Beginn der Systemteskorrekturphase",
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
    z_attribute.name = "STEST_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND ',
"**TESTLOGBUCH*Testlog*STEST_K_BEGINN");


/* R5c: Systemtest/Abnahmetest (pos.) */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2038,"forgotten previous project phase (ST/AT) (positive)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (363,"forgotten previous project phase (ST/AT) (positive)","Very good! You finished the code according to the system test report before you asked the customer to do the acceptance test!",
"en",2038);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (364,"Vorgängerphase vergessen (ST/AT) (positiv)","Sehr gut! Sie haben die Vorgängerphase (Systemtest) zuvor beendet!",
"de",2038);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (481,"Phase précédente du projet oubliée (TS/TA)
(positif)","Très bien! Vous avez terminé le code selon le contre
rendu du test du système avant de demander au client de faire le
test d'acceptance!", "fr",2038);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2079,"*",null,2038,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10358,"*","*","en",2079);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10359,"*","*","de",2079);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1180,"*","*","fr",2079);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2080,"*",2079,2038,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10360,"*","*","en",2080);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10361,"*","*","de",2080);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1181,"*","*","fr",2080);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2081,"*",2080,2038,2023,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10362,"*","*","en",2081);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10363,"*","*","de",2081);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1182,"*","*","fr",2081);
/* ENDE RIETA TOOL */

/* R5ca: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2138,"forgotten previous project phase (ST/AT) (a)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (365,"forgotten previous project phase (ST/AT) (a)","Sorry, I can't give you an advice, because you have neither finished the system test nor initiated a correction of the code according to the acceptance test.",
"en",2138);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (366,"Vorgängerphase vergessen (ST/AT) (a)","Achtung! Auf diese Frage kann kein Ratschlag erteilt werden, da sie den Systemtest noch nicht beendet und noch keine Korrektur des Codes aufgrund des Abnahmetests vorgenommen haben.",
"de",2138);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (482,"Phase précédente du projet oubliée (TS/TA)
(a)","Désolé, je ne peux vous conseiller, car vous n'avez ni
terminé le test du système ni initier la correction du code selon
le contre rendu du test d'acceptance.", "fr",2138);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2179,"*",null,2138,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10364,"*","*","en",2179);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10365,"*","*","de",2179);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1183,"*","*","fr",2179);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2180,"*",2179,2138,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10366,"*","*","en",2180);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10367,"*","*","de",2180);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1184,"*","*","fr",2180);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2181,"*",2180,2138,2023,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10368,"*","*","en",2181);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10369,"*","*","de",2181);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1185,"*","*","fr",2181);
/* ENDE RIETA TOOL */

/* R5cb: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2238,"forgotten previous project phase (ST/AT) (b)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (367,"forgotten previous project phase (ST/AT) (b)","Attention! You have already asked the customer to do the acceptance test before you have finished and corrected the system test. It would be better to finish the correction of the code according to the system test before you start the acceptance test.
This helps eliminating a lot of errors in the code.",
"en",2238);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (368,"Vorgängerphase vergessen (ST/AT) (b)","Achtung! Sie haben den Systemtest noch nicht fertiggestellt, aber bereits mit der Korrektur begonnen.
Außerdem haben sie bereits den Kunden gebeten einen Abnahmetest vorzunehmen. Es wäre besser, wenn sie zuerst auf die Fertigstellung der Korrektur des Systemtests warten würden, dann werden nicht so viele Fehler in die nächste Phase übernommen.",
"de",2238);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (483,"Phase précédente du projet oubliée (TS/TA)
(b)","Attention! vous avez déjà demandé au client de faire le test
d'acceptance avant de finir et de corriger le test du système. Il
faut mieux finir la correction du code selon le contre rendu du
test du système avant de commencer le test d'acceptance. Cela
permet d'éliminer beaucoup d'erreurs dans le code.", "fr",2238);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2279,"*",null,2238,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10370,"*","*","en",2279);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10371,"*","*","de",2279);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1186,"*","*","fr",2279);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2280,"*",2279,2238,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10372,"*","*","en",2280);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10373,"*","*","de",2280);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1187,"*","*","fr",2280);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2281,"*",2280,2238,2023,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10374,"*","*","en",2281);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10375,"*","*","de",2281);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1188,"*","*","fr",2281);
/* ENDE RIETA TOOL */

/* R5cc: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2338,"forgotten previous project phase (ST/AT) (c)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (369,"forgotten previous project phase (ST/AT) (c)","Attention! You have forgotten the system test!
You have already asked the customer to do the acceptance test without testing the system before. You should abort the acceptance test and start testing the system.
Afterwards you should correct the code according to the system test report and then you can start to do the acceptance test.",
"en",2338);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (370,"Vorgängerphase vergessen (ST/AT) (c)","Achtung! Sie haben auf den Systemtest vergessen!
Sie haben bereits den Kunden gebeten den Abnahmetest vorzunehmen, bevor sie einen Systemtest durchgeführt haben. Sie sollten den Abnahmetest abbrechen und zuerst den Systemtest vornehmen.
Anschließend sollten sie den Code aufgrund des Systemtestberichts korrigieren und erst dann mit dem Abnahmetest beginnen.",
"de",2338);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (484,"Phase précédente du projet oubliée (TS/TA)
(c)","Attention! Vous avez oublié le test du système! Vous avez
déjà demandé au client de faire le test d'acceptance sans avoir
effectué le test du système. Vous devez abondonner le test
d'acceptance et commencer le test du système. Ensuite, vous devrez
corriger le code selon le contre rendu du test du système avant de
commencer le test d'acceptance.", "fr",2338);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2379,"*",null,2338,2014,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10376,"*","*","en",2379);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10377,"*","*","de",2379);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1189,"*","*","fr",2379);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2380,"*",2379,2338,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10378,"*","*","en",2380);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10379,"*","*","de",2380);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1190,"*","*","fr",2380);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2381,"*",2380,2338,2023,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10380,"*","*","en",2381);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10381,"*","*","de",2381);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1191,"*","*","fr",2381);
/* ENDE RIETA TOOL */

/* R5cd: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2438,"forgotten previous project phase - system test/acceptance test (d)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (371,"forgotten previous project phase - system test/acceptance test (d)","You haven't asked the customer to do the acceptance test, but you have finished the system test and you have initiate a correction of the code according to the system test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2438);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (372,"Vorgängerphase vergessen (ST/AT) (d)","Sie haben noch keinen Abnahmetest veranlasst. Allerdings haben sie den Systemtest bereits abgeschlossen und auch eine Korrektur des Codes aufgrund des Systemtestberichts veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2438);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (485,"Phase précédente du projet oubliée - test du
système/test d'acceptance (d)","Vous n'avez pas demandé au client
de faire le test d'acceptance, mais vous avez terminé le test du
système et initié la  correction du code selon le contre rendu du
test du système. Vous êtes sur la bonne voix, mais essayez de
corriger toutes les erreurs avant d'initier le test suivant.",
"fr",2438);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2479,"*",null,2438,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10382,"*","*","en",2479);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10383,"*","*","de",2479);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1192,"*","*","fr",2479);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2480,"*",2479,2438,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10384,"*","*","en",2480);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10385,"*","*","de",2480);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1193,"*","*","fr",2480);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2481,"*",2480,2438,2023,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10386,"*","*","en",2481);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10387,"*","*","de",2481);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1194,"*","*","fr",2481);
/* ENDE RIETA TOOL */

/* R5ce: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2738,"forgotten previous project phase (ST/AT) (e)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (373,"forgotten previous project phase (ST/AT) (e)","You haven't asked the customer to do the acceptance test, but you have finished the system test. You should initiate a correction of the code according to the system test report before you start the acceptance test.
Try to correct all errors before you initiate the next test.",
"en",2738);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (374,"Vorgängerphase vergessen (ST/AT) (e)","Sie haben noch keinen Abnahmetest veranlasst. Der Systemtest wurde noch nicht abgeschlossen. Sie haben aber bereits die Korrektur des Codes aufgrund des Systemtests veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2738);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (486,"Phase précédente du projet oubliée (TS/TA) (e)","Vous
n'avez pas demandé au client de faire le test d'acceptance, mais
vous avez terminé le test du système. Vous devrez initier la
correction du code selon le contre rendu du test du système avant
de commencer le test d'acceptance. Essayez de corriger toutes les
erreurs avant d'initier le test suivant.", "fr",2738);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */ INSERT INTO
aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2779,"*",null,2738,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10388,"*","*","en",2779);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10389,"*","*","de",2779);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1195,"*","*","fr",2779);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2780,"*",2779,2738,2013,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10390,"*","*","en",2780);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10391,"*","*","de",2780);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1196,"*","*","fr",2780);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2781,"*",2780,2738,2023,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10392,"*","*","en",2781);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10393,"*","*","de",2781);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1197,"*","*","fr",2781);
/* ENDE RIETA TOOL */

/* R5cf: zusätzlicher Fall */

INSERT INTO specific_aid (spaidid,description,aiddid)
VALUES (2838,"forgotten previous project phase (ST/AT) (f)",
268);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (375,"forgotten previous project phase (ST/AT) (f)","You haven't asked the customer to do the acceptance test and you haven't finished the system test, but you have initiated a correction of the code according to the system test report.
You are well on the way, but try to correct all errors before you initiate the next test.",
"en",2838);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (376,"Vorgängerphase vergessen (ST/AT) (f)","Sie haben noch keinen Abnahmetest veranlasst. Der Systemtest wurde noch nicht abgeschlossen. Sie haben aber bereits die Korrektur des Codes aufgrund des Systemtests veranlasst.
Sie sind auf dem richtigen Weg. Achten sie jedoch darauf, dass alle Fehler korrigiert wurden, bevor sie den nächsten Test anordnen.",
"de",2838);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (487,"Phase précédente du projet oubliée (TS/TA) (f)","Vous
n'avez pas demandé au client de faire le test d'acceptance et vous
n'avez pas terminé le test du système, mais vous avez initier la
correction du code selon le contre rendu du test du système. Vous
êtes sur la bonne voix, mais essayez de corriger toutes les
erreurs avant d'initier le test suivant.", "fr",2838);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2879,"*",null,2838,2014,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10394,"*","*","en",2879);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10395,"*","*","de",2879);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1198,"*","*","fr",2879);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2880,"*",2879,2838,2013,2001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10396,"*","*","en",2880);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10397,"*","*","de",2880);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1199,"*","*","fr",2880);
/* ENDE RIETA TOOL */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2881,"*",2880,2838,2023,2000);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10398,"*","*","en",2881);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10399,"*","*","de",2881);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1200,"*","*","fr",2881);
/* ENDE RIETA TOOL */


/* R6:  unvollständige Dokumente sollten erneut überarbeitet werden */
/* R6a: Spezifikation (neg.)       */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (269,"Should I review the specification?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (148,"Should I review the specification?","en",269);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (149,"unvollständige Dokumente erneut überarbeiten - Spezifikation","de",269);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (419,"Est-ce-que je dois réviser la spécification?","fr",269);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2039,"review document (S) - necessary",
269);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (377,"review document (S) - necessary","Attention! Your specification does not contain enough AFPs. If you use this specification as a reference document for the next project phase, a lot of errors will be introduced.
The earlier you correct the errors you found during the review, the lower are effort and costs for finding and correcting these errors in the subsequent project phases.
Therefore you should initiate additional reviews of this document.",
"en",2039);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (378,"erneute Überarbeitung (S) - notwendig","Ihre Spezifikation enthält noch zu wenige AFPs. Wenn sie dieses Dokument in der nächsten Phase einsetzen, werden viele Fehler übernommen.
Je früher Sie die Fehler verbessern, desto geringer sind Aufwand und Kosten.
Eine erneute Überarbeitung der Spezifikation wäre deshalb ratsam.",
"de",2039);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (488,"La révision est obligatoire","Attention! La spécification ne contient pas suffisemment de points de fonction adjustés (PFAs). Si vous utilisez cette spécification comme document de référence pour la prochaine phase du projet, un grand nombre d'erreurs peut s'introduire.
Le plus tôt vous corrigez les erreurs trouvées pendant la révision, le moins seraient l'effort et le coût pour corriger ces erreurs dans cette phase que dans les phases suivantes du projet. Donc, une révision de ce document paraît nécessaire.",
"fr",2039);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2082,"*",null,2039,2600,4001);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10400,"*","*","en",2082);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10401,"*","*","de",2082);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1201,"*","*","fr",2082);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4001,'Z','<',198,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2600,"ANZ_AFPs Spezifikation",
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
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND ',
"**SPEZIFIKATION*Specification*ANZ_AFP");


/* R6a: Spezifikation (pos.)       */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2040,"review document (S) - not necessary",
269);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (379,"review document (S) - not necessary","Very good! Your specification contains enough AFPs. This means, additional reviews of this document are not necessary!",
"en",2040);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (380,"erneute Überarbeitung (S) - nicht notwendig","Ihre Spezifikation enthält bereits genug AFPs. Eine erneute Überarbeitung ist nicht notwendig.",
"de",2040);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (489,"La révision n'est pas nécessaire (S)","Très bien! Votre spécification contient suffisemment de PFAs. Cela signifie que, des révisions supplémentaires ne sont pas nécessaires!",
"fr",2040);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2083,"*",null,2040,2600,4002);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10402,"*","*","en",2083);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10403,"*","*","de",2083);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1202,"*","*","fr",2083);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4002,'Z','>=',198,'');


/* R6b: Systemdesign (neg.)       */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (270,"Should I review the system design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (150,"Should I review the system design?","en",270);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (151,"unvollständige Dokumente erneut überarbeiten - Systemdesign","de",270);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (420,"Est-ce-que je dois réviser la conception du système?","fr",270);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2041,"review document (SD) - necessary",
270);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (381,"review document (SD) - necessary","Attention! Your system design does not contain enough AFPs. If you use the system design as a reference document for the next project phase, a lot of errors will be introduced.
The earlier you correct the errors you found during the review, the lower are effort and costs for finding and correcting these errors in the subsequent project phases.
Thus you should initiate additional reviews of this document.",
"en",2041);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (382,"erneute Überarbeitung (SD) - notwendig","Ihr Systemdesign enthält noch zu wenige AFPs. Wenn sie dieses Dokument in der nächsten Phase einsetzen, werden viele Fehler übernommen.
Je früher Sie die Fehler verbessern, desto geringer sind Aufwand und Kosten.
Eine erneute Überarbeitung des Systemdesigns wäre deshalb ratsam.",
"de",2041);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (490,"La révision est nécessaire (CS)","Attention! Votre conception du système ne contient pas suffisemment de PFAs. Si vous utilisez la conception du système comme document de référence pour la prochaine phase du projet, un grand nombre d'erreurs peut s'introduire.
Le plus tôt vous corrigez les erreurs trouvées pendant la révision, le moins seraient l'effort et le coût pour corriger ces erreurs dans cette phase que dans les phases suivantes du projet.
Donc,il faut effectuer des révisions supplémentaires.",
"fr",2041);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2084,"*",null,2041,2601,4003);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10404,"*","*","en",2084);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10405,"*","*","de",2084);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1203,"*","*","fr",2084);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4003,'Z','<',196,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2601,"ANZ_AFPs Systemdesign",
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
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND ',
"**SYSTEMENTWURF*Systemdesign*ANZ_AFP");

/* R6b: Systemdesign (pos.)       */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2042,"review document (SD) - not necessary",
270);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (383,"review document (SD) - not necessary","Very good! Your system design contains enough AFPs. This means, additional reviews of this document are not necessary!",
"en",2042);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (384,"erneute Überarbeitung (SD) - nicht notwendig","Ihr Systemdesign enthält bereits genug AFPs. Eine erneute Überarbeitung ist nicht notwendig.",
"de",2042);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (491,"La révision n'est pas nécessaire (CS)","Très bien! Votre conception du système contient suffisemment de PFAs. Cela signifie que, des révisions suplémentaires ne sont pas nécessaires!",
"fr",2042);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2085,"*",null,2042,2601,4004);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10406,"*","*","en",2085);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10407,"*","*","de",2085);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1204,"*","*","fr",2085);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4004,'Z','>=',196,'');


/* R6c: Moduldesign (neg.)       */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (271,
"Should I review the module design?",
2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (152,"Should I review the module design?","en",271);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (153,"unvollständige Dokumente erneut überarbeiten - Moduldesign","de",271);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (421,"Est-ce-que je dois réviser la conception des modules?","fr",271);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2043,"review document (MD) - necessary",
271);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (385,"review document (MD) - necessary","Attention!
Your module design does not contain enough AFPs. This means, additional reviews of this document are necessary.",
"en",2043);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (386,"erneute Überarbeitung (MD) - notwendig","Ihr Moduldesign enthält noch zu wenige AFPs. Wenn sie dieses Dokument in der nächsten Phase einsetzen, werden viele Fehler übernommen.
Eine erneute Überarbeitung des Moduldesigns wäre deshalb ratsam.",
"de",2043);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (492,"La révision est nécessaire (CM)","Attention! Votre conception des modules ne contient pas suffisemment de PFAs. Cela signifie que, des révisions suplémentaires sont nécessaires.",
"fr",2043);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2086,"*",null,2043,2602,4005);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10408,"*","*","en",2086);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10409,"*","*","de",2086);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1205,"*","*","fr",2086);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4005,'Z','<',191,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2602,"ANZ_AFPs Moduldesign",
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
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND ',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_AFP");

/* R6c: Moduldesign (pos.)       */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2044,"review document (MD) - not necessary",
271);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (387,"review document (MD) - not necessary","Very good! Your module design contains enough AFPs. This means, additional reviews of this document are not necessary!",
"en",2044);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (388,"erneute Überarbeitung (MD) - nicht notwendig","Ihr Moduldesign enthält bereits genug AFPs. Eine erneute Überarbeitung ist nicht notwendig.",
"de",2044);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (493,"La révision n'est pas nécessaire (CM)","Très bien! Votre conception des modules contient suffisemment de PFAs. Cela signifie que, des révisions suplémentaires ne sont pas nécessaires!",
"fr",2044);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2087,"*",null,2044,2602,4006);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10410,"*","*","en",2087);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10411,"*","*","de",2087);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1206,"*","*","fr",2087);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4006,'Z','>=',191,'');


/* R6d: Code (neg.)       */

INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (272,"Should I review/test the code?",2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (154,"Should I review/test the code?","en",272);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (155,"unvollständige Dokumente erneut überarbeiten - Code","de",272);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (422,"Est-ce-que je dois réviser le test du code?","fr",272);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2045,"review document (C) - necessary",
272);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (389,"review document (C) - necessary","Attention! Your code does not contain enough AFPs. This means, additional tests of the code are necessary!",
"en",2045);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (390,"erneute Überarbeitung (C) - notwendig","Ihr Code enthält noch zu wenige AFPs. Sie sollten versuchen mit Hilfe von Tests die Vollständigkeit des Codes zu erhöhen.",
"de",2045);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (494,"La révision est nécessaire (I)","Attention! Votre code ne contient pas suffisemment de PFAs. Cela signifie que, des tests suplémentaires du code sont nécessaires!",
"fr",2045);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2088,"*",null,2045,2603,4007);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10412,"*","*","en",2088);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10413,"*","*","de",2088);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1207,"*","*","fr",2088);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4007,'Z','<',192,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2603,"ANZ_AFPs Code",
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
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND ',
"**CODE*Code*ANZ_AFP");

/* R6d: Code (pos.)       */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2046,"review document (C) - not necessary",
272);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (391,"review document (C) - not necessary","Very good! Your code contains enough AFPs. This means, additional tests of the code are not necessary!",
"en",2046);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (392,"erneute Überarbeitung (C) - nicht notwendig","Ihr Code enthält bereits genug AFPs. Eine erneute Überarbeitung ist nicht notwendig.",
"de",2046);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (495,"La révision n'est pas nécessaire (I)","Très bien! Votre code contient suffisemment de PFAs. Cela signifie que, des tests suplémentaires du code ne sont pas nécessaires!",
"fr",2046);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2089,"*",null,2046,2603,4008);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10414,"*","*","en",2089);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10415,"*","*","de",2089);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1208,"*","*","fr",2089);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4008,'Z','>=',192,'');


/* R6e: Handbuch (neg.)       */


INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (273,"Should I review the documentation?",2,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (156,"Should I review the documentation?","en",273);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (157,"unvollständige Dokumente erneut überarbeiten - Handbuch","de",273);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (423,"Est-ce-que je dois réviser la documentation?","fr",273);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2047,"review document (M) - necessary",
273);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (393,"review document (M) - necessary","Attention! Your manuals do not describe the whole functionality. This means, a new revision of the documentation is necessary!",
"en",2047);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (394,"erneute Überarbeitung (M) - notwendig","Ihr Handbuch enthält noch zu wenige AFPs. Eine erneute Überarbeitung des Handbuchs wäre deshalb ratsam.",
"de",2047);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (496,"La révision est nécessaire (M)","Attention! Votre manuel ne décrit pas toutes les fonctionnalités demandées. Donc, une nouvelle révision de la documentation est nécessaire!",
"fr",2047);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2090,"*",null,2047,2604,4009);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10416,"*","*","en",2090);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10417,"*","*","de",2090);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1209,"*","*","fr",2090);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4009,'Z','<',190,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2604,"ANZ_AFPs Handbuch",
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
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND ',
"**HANDBUCH*Manuals*ANZ_AFP");

/* R6e: Handbuch (pos.)       */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2048,"review document (M) - not necessary",
273);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (395,"review document (M) - not necessary","Very good! Your manuals describe the whole functionality. This means, a new revision of the documentation is not necessary!",
"en",2048);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (396,"erneute Überarbeitung (M) - nicht notwendig","Ihr Handbuch enthält bereits genug AFPs. Eine erneute Überarbeitung ist nicht notwendig.",
"de",2048);

INSERT INTO spec_aid_lang(said,description,text,language,spaidid)
VALUES (497,"La révision n'est pas nécessaire (M)","Très bien! Votre manuel décrit toutes les fonctionnalités demandées. Donc, une nouvelle révision de la documentation n'est pas nécessaire!",
"fr",2048);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2091,"*",null,2048,2604,4010);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10418,"*","*","en",2091);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10419,"*","*","de",2091);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1210,"*","*","fr",2091);
/* ENDE RIETA TOOL */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4010,'Z','>=',190,'');




/* t_allows_aiddesc */
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,250);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,251);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,252);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,253);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,254);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,255);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,256);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,257);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,258);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,259);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,260);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,261);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,262);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,263);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,264);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,265);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,266);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,267);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,268);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,269);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,270);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,271);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,272);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,273);

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,250);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,251);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,252);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,253);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,254);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,255);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,256);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,257);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,258);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,259);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,260);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,261);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,262);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,263);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,264);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,265);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,266);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,267);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,268);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,269);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,270);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,271);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,272);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,273);

/* spaid_needs_zt */
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2000,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2001,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2101,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2201,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2003,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2004,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2104,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2204,2);


INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2005,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2006,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2106,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2206,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2007,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2008,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2108,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2208,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2009,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2010,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2110,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2210,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2011,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2012,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2112,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2212,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2013,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2013,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2014,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2014,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2114,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2114,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2214,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2214,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2015,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2016,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2116,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2216,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2017,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2018,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2118,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2218,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2019,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2020,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2120,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2220,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2021,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2021,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2022,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2022,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2122,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2122,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2222,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2222,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2023,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2023,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2024,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2024,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2124,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2124,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2224,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2224,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2025,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2025,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2026,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2026,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2126,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2126,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2226,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2226,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2027,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2027,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2028,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2028,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2128,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2128,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2228,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2228,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2029,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2029,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2030,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2030,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2130,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2130,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2230,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2230,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2031,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2031,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2032,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2032,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2132,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2132,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2232,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2232,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2033,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2034,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2134,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2234,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2334,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2434,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2734,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2834,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2035,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2036,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2136,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2236,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2336,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2436,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2736,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2836,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2037,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2038,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2138,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2238,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2338,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2438,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2738,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2838,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2039,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2040,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2041,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2042,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2043,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2044,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2045,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2046,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2047,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2048,10);
