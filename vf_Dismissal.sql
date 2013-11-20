/***********************/
/***********************/
/******** Dismissal ****/
/***********************/
/**********************/


/* vF15: Entlassung von Mitarbeitern sollte    */
/*       überdacht werden                      */

/* Axel */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (138,"dismissal of Axel should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (276,"*","en",138);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (462,"*","fr",138);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (277,"*","de",138);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2538,
"dismissal of Axel should be well-considered",
138);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (576,"You have fired Axel! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2538);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (685,"Vous avez renvoyé Axel. Vous devriez réaliser que cet employé n'est pas disponible pendant 60 jours.",
"fr",2538);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (577,"Sie haben Axel entlassen. Sie sollten dabei bedenken, dass dieser Mitarbeiter im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2538);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2589,"*",null,2538,2031,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30178,"*","*","en",2589);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20142,"*","*","fr",2589);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30179,"*","*","de",2589);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2031,"fire Axel",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Axel" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2590,"*",2589,2538,2032,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30180,"*","*","en",2590);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20143,"*","*","fr",2590);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30181,"*","*","de",2590);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2032,"Tätigkeit Axel",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Axel" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (22,'Z','==',0,null);


/* Bernd */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (139,"dismissal of Bernd should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (278,"*","en",139);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (463,"*","fr",139);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (279,"*","de",139);
/* ENDE RIETA TOOL */


INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2539,
"dismissal of Bernd should be well-considered",
139);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (578,"You have fired Bernd! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2539);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (686,"Vous avez renvoyé Bernd. Vous devriez réaliser que cet employé n'est pas disponible pendant 60 jours.",
"fr",2539);


INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (579,"Sie haben Bernd entlassen. Sie sollten dabei bedenken, dass dieser Mitarbeiter im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2539);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2591,"*",null,2539,2033,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30182,"*","*","en",2591);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20144,"*","*","fr",2591);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30183,"*","*","de",2591);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2033,"fire Bernd",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Bernd" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2592,"*",2591,2539,2034,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30184,"*","*","en",2592);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20145,"*","*","fr",2592);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30185,"*","*","de",2592);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2034,"Tätigkeit Bernd",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Bernd" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


/* Christine */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (140,"dismissal of Christine should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (280,"*","en",140);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (464,"*","fr",140);
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (281,"*","de",140);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2540,
"dismissal of Christine should be well-considered",
140);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (580,"You have fired Christine! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2540);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (687,"Vous avez renvoyé Christine. Vous devriez réaliser que cette employée n'est pas disponible pendant 60 jours.",
"fr",2540);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (581,"Sie haben Christine entlassen. Sie sollten dabei bedenken, dass diese Mitarbeiterin im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2540);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2593,"*",null,2540,2035,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30186,"*","*","en",2593);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20146,"*","*","fr",2593);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30187,"*","*","de",2593);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2035,"fire Christine",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Christine" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2594,"*",2593,2540,2036,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30188,"*","*","en",2594);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20147,"*","*","fr",2594);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30189,"*","*","de",2594);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2036,"Tätigkeit Christine",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Christine" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


/* Diana */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (141,"dismissal of Diana should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (282,"*","en",141);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (465,"*","fr",141);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (283,"*","de",141);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2541,
"dismissal of Diana should be well-considered",
141);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (582,"You have fired Diana! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2541);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (688,"Vous avez renvoyé Diana. Vous devriez réaliser que cette employée n'est pas disponible pendant 60 jours.

",
"fr",2541);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (583,"Sie haben Diana entlassen. Sie sollten dabei bedenken, dass diese Mitarbeiterin im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2541);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2595,"*",null,2541,2037,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30190,"*","*","en",2595);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20148,"*","*","fr",2595);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30191,"*","*","de",2595);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2037,"fire Diana",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Diana" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2596,"*",2595,2541,2038,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30192,"*","*","en",2596);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20149,"*","*","fr",2596);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30193,"*","*","de",2596);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2038,"Tätigkeit Diana",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Diana" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


/* Richard */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (142,"dismissal of Richard should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (284,"*","en",142);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (466,"*","fr",142);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (285,"*","de",142);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2542,
"dismissal of Richard should be well-considered",
142);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (584,"You have fired Richard! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2542);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (689,"Vous avez renvoyé Richard. Vous devriez réaliser que cet employé n'est pas disponible pendant 60 jours.",
"fr",2542);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (585,"Sie haben Richard entlassen. Sie sollten dabei bedenken, dass dieser Mitarbeiter im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2542);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2597,"*",null,2542,2043,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30194,"*","*","en",2597);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20150,"*","*","fr",2597);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30195,"*","*","de",2597);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2043,"fire Richard",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Richard" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2598,"*",2597,2542,2044,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30196,"*","*","en",2598);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20151,"*","*","fr",2598);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30197,"*","*","de",2598);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2044,"Tätigkeit Richard",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Richard" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


/* Stefanie */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (143,"dismissal of Stefanie should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (286,"*","en",143);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (467,"*","fr",143);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (287,"*","de",143);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2543,
"dismissal of Stefanie should be well-considered",
143);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (586,"You have fired Stefanie! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2543);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (690,"Vous avez renvoyé Stefanie. Vous devriez réaliser que cette employée n'est pas disponible pendant 60 jours.",
"fr",2543);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (587,"Sie haben Stefanie entlassen. Sie sollten dabei bedenken, dass diese Mitarbeiterin im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2543);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2599,"*",null,2543,2039,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30198,"*","*","en",2599);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20152,"*","*","fr",2599);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30199,"*","*","de",2599);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2039,"fire Stefanie",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Stefanie" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2600,"*",2599,2543,2040,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30200,"*","*","en",2600);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20153,"*","*","fr",2600);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30201,"*","*","de",2600);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2040,"Tätigkeit Stefanie",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Stefanie" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


/* Thomas */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (144,"dismissal of Thomas should be well-considered",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (288,"*","en",144);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (468,"*","fr",144);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (289,"*","de",144);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2544,
"dismissal of Thomas should be well-considered",
144);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (588,"You have fired Thomas! You ought to consider that this employee is at worst 60 days unavailable.",
"en",2544);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (672,"Vous avez renvoyé Thomas. Vous devriez réaliser que cet employé n'est pas disponible pendant 60 jours.",
"fr",2544);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (589,"Sie haben Thomas entlassen. Sie sollten dabei bedenken, dass dieser Mitarbeiter im schlimmsten Fall 60 Tage nicht verfügbar sein wird.",
"de",2544);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2601,"*",null,2544,2041,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30202,"*","*","en",2601);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20154,"*","*","fr",2601);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30203,"*","*","de",2601);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2041,"fire Thomas",
'select count(turn.command)
from turn,game
where
      turn.command like "fire Thomas" AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2602,"*",2601,2544,2042,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30204,"*","*","en",2602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20155,"*","*","fr",2602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30205,"*","*","de",2602);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2042,"Tätigkeit Thomas",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        s_relation.person = "Thomas" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',"***");


