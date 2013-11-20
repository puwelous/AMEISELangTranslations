

/*********************************/
/*********************************/
/******** Finished Correction ****/
/*********************************/
/*********************************/


/* vF7: erneuter Review ist erst nach erfolgreicher Korrektur */
/*      des zuvor durchgefürhten Reviews möglich              */

/* Axel */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (157,"finished correction successfully - Axel",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (300,"*","en",157);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (474,"*","fr",157);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (301,"*","de",157);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2557,
"finished correction successfully - Axel",
157);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (696,"You have commissioned Axel to abort his activity. Axel was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2557);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (697,"Vous avez demandé à Axel d'arrêter son activité. Il travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2557);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (698,"Sie haben Axel angewiesen seine Tätigkeit sofort abzubrechen.
Axel war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2557);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2622,"*",null,2557,2080,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30216,"*","*","en",2622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20161,"*","*","fr",2622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30217,"*","*","de",2622);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2080,"Tätigkeit abbrechen - Axel",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Axel" OR
       turn.command like "abort Axel") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2623,"*",2613,2557,2087,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30218,"*","*","en",2623);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20162,"*","*","fr",2623);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30219,"*","*","de",2623);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2087,"Korrektur Axel",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Axel" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Axel*finished=0*success=1");

/* Bernd */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (158,"finished correction successfully - Bernd",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (302,"*","en",158);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (475,"*","fr",158);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (303,"*","de",158);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2558,
"finished correction successfully - Bernd",
158);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (699,"You have commissioned Bernd to abort his activity. Bernd was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2558);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (902,"Vous avez demandé à Bernd d'arrêter son activité. Il travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2558);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (901,"Sie haben Bernd angewiesen seine Tätigkeit sofort abzubrechen.
Bernd war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2558);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2624,"*",null,2558,2081,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30220,"*","*","en",2624);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20163,"*","*","fr",2624);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30221,"*","*","de",2624);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2081,"Tätigkeit abbrechen - Bernd",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Bernd" OR
       turn.command like "abort Bernd") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2625,"*",2624,2558,2088,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30222,"*","*","en",2625);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20164,"*","*","fr",2625);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30223,"*","*","de",2625);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2088,"Korrektur Bernd",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Bernd" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Bernd*finished=0*success=1");

/* Christine */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (159,"finished correction successfully - Christine",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (304,"*","en",159);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (476,"*","fr",159);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (305,"*","de",159);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2559,
"finished correction successfully - Christine",
159);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (905,"You have commissioned Christine to abort her activity. Christine was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2559);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (904,"Vous avez demandé à Christine d'arrêter son activité. Elle travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2559);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (906,"Sie haben Christine angewiesen ihre Tätigkeit sofort abzubrechen.
Christine war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2559);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2626,"*",null,2559,2082,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30224,"*","*","en",2626);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20165,"*","*","fr",2626);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30225,"*","*","de",2626);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2082,"Tätigkeit abbrechen - Christine",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Christine" OR
       turn.command like "abort Christine") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2627,"*",2626,2559,2089,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30226,"*","*","en",2627);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20166,"*","*","fr",2627);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30227,"*","*","de",2627);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2089,"Korrektur Christine",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Christine" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Christine*finished=0*success=1");

/* Diana */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (160,"finished correction successfully - Diana",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (306,"*","en",160);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (477,"*","fr",160);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (307,"*","de",160);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2560,
"finished correction successfully - Diana",
160);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (907,"You have commissioned Diana to abort her activity. Diana was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2560);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (908,"Vous avez demandé à Diana d'arrêter son activité. Elle travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2560);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (909,"Sie haben Diana angewiesen ihre Tätigkeit sofort abzubrechen.
Diana war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2560);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2628,"*",null,2560,2083,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30228,"*","*","en",2628);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20167,"*","*","fr",2628);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30229,"*","*","de",2628);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2083,"Tätigkeit abbrechen - Diana",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Diana" OR
       turn.command like "abort Diana") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2629,"*",2628,2560,2090,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30230,"*","*","en",2629);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20168,"*","*","fr",2629);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30231,"*","*","de",2629);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2090,"Korrektur Diana",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Diana" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Diana*finished=0*success=1");

/* Richard */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (161,"finished correction successfully - Richard",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (308,"*","en",161);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (478,"*","fr",161);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (309,"*","de",161);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2561,
"finished correction successfully - Richard",
161);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (910,"You have commissioned Richard to abort his activity. Richard was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2561);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (911,"Vous avez demandé à Richard d'arrêter son activité. Il travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2561);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (912,"Sie haben Richard angewiesen seine Tätigkeit sofort abzubrechen.
Richard war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2561);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2630,"*",null,2561,2086,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30232,"*","*","en",2630);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20169,"*","*","fr",2630);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30233,"*","*","de",2630);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2086,"Tätigkeit abbrechen - Richard",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Richard" OR
       turn.command like "abort Richard") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2631,"*",2630,2561,2093,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30234,"*","*","en",2631);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20170,"*","*","fr",2631);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30235,"*","*","de",2631);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2093,"Korrektur Richard",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Richard" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Richard*finished=0*success=1");


/* Stefanie */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (162,"finished correction successfully - Stefanie",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (310,"*","en",162);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (479,"*","fr",162);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (311,"*","de",162);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2562,
"finished correction successfully - Stefanie",
162);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (913,"You have commissioned Stefanie to abort her activity. Stefanie was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2562);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (914,"Vous avez demandé à Stefanie d'arrêter son activité. Elle travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2562);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (915,"Sie haben Stefanie angewiesen ihre Tätigkeit sofort abzubrechen.
Stefanie war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2562);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2632,"*",null,2562,2084,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30236,"*","*","en",2632);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20171,"*","*","fr",2632);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30237,"*","*","de",2632);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2084,"Tätigkeit abbrechen - Stefanie",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Stefanie" OR
       turn.command like "abort Stefanie") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2633,"*",2632,2562,2091,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30238,"*","*","en",2633);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20172,"*","*","fr",2633);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30239,"*","*","de",2633);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2091,"Korrektur Stefanie",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Stefanie" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Stefanie*finished=0*success=1");


/* Thomas*/
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (163,"finished correction successfully - Thomas",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (312,"*","en",163);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (480,"*","fr",163);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (313,"*","de",163);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2563,
"finished correction successfully - Thomas",
163);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (916,"You have commissioned Thomas to abort his activity. Thomas was just working on the correction of a document.
You ought to consider that you cannot start another review until somebody has finished the correction of the document according to the last review.",
"en",2563);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (917,"Vous avez demandé à Thomas d'arrêter son activité. Il travaillait sur la correction d'un document. Vous ne devez pas commencer une autre révision tant que la correction n'est pas terminée.",
"fr",2563);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (918,"Sie haben Thomas angewiesen seine Tätigkeit sofort abzubrechen.
Thomas war jedoch gerade mit der Korrektur eines Dokuments beschäftigt.
Bitte bedenken Sie, dass Sie erst nach erfolgreicher Beendigung der Korrektur einen weiteren Review für dieses Dokuments durchführen können.
Weisen Sie darum einen anderen Mitarbeiter an die begonnene Korrekur fertig zu stellen.",
"de",2563);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2634,"*",null,2563,2085,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30240,"*","*","en",2634);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20173,"*","*","fr",2634);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30241,"*","*","de",2634);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2085,"Tätigkeit abbrechen - Thomas",
'select count(turn.command)
from turn,game
where
      (turn.command like "quit Thomas" OR
       turn.command like "abort Thomas") AND
      turn.gid = game.gid AND game.gid = %game AND LOCATE(turn.path, \"%path\")=1;',"***");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2635,"*",2634,2563,2092,20);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30242,"*","*","en",2635);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20174,"*","*","fr",2635);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30243,"*","*","de",2635);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2092,"Korrektur Thomas",
'select count(s_relation.document)
from
zarmstype,s_relation,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "R" AND
        zarmstype.zid = s_relation.zid AND
        zarmstype.z_type = "KORRIGIERT" AND
        s_relation.person = "Thomas" AND
        s_relation.finished = 0 AND
        s_relation.success = 1 AND
        s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*KORRIGIERT*person=Thomas*finished=0*success=1");

