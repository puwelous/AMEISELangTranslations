
/**********************/
/**********************/
/******** Workload ****/
/**********************/
/**********************/


/* vF12: Mitarbeiterbeschäftigung/-auslastung beobachten */
/*       Meldung: wenn Mitarbeiter seit 3 Tagen untätig  */

/* Axel */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (164,"workload - Axel",3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (314,"*","en",164);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (481,"*","fr",164);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (315,"*","de",164);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2564,
"workload - Axel",
164);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (919,"Axel is idle for three days!",
"en",2564);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (920,"Axel est inactif depuis trois jours",
"fr",2564);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (921,"Axel ist bereits seit drei Tagen untätig!",
"de",2564);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2636,"*",null,2564,2094,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30244,"*","*","en",2636);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20175,"*","*","fr",2636);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30245,"*","*","de",2636);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2094,"ist eingestellt - Axel",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Axel" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Axel*IST_EINGESTELLT");

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (24,'T','==',null,"true");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2637,"*",2636,2564,2032,22);


/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30246,"*","*","en",2637);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20176,"*","*","fr",2637);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30247,"*","*","de",2637);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2638,"*",2637,2564,2101,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30248,"*","*","en",2638);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20177,"*","*","fr",2638);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30249,"*","*","de",2638);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2101,"max-completion_date - Axel",
'select max(s_relation.completion_date)
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
VALUES (25,'T','<=',null,"SYSTEM_DATE - 3");


/* Bernd */
INSERT INTO aid_description(aiddid,description,kaidid,mid)
VALUES (165,"workload - Bernd",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (316,"*","en",165);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (482,"*","fr",165);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (317,"*","de",165);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2565,
"workload - Bernd",
165);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (922,"Bernd is idle for three days!",
"en",2565);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (923,"Bernd est inactif depuis trois jours!",
"fr",2565);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (924,"Bernd ist bereits seit drei Tagen untätig!",
"de",2565);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2639,"*",null,2565,2095,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30250,"*","*","en",2639);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20178,"*","*","fr",2639);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30251,"*","*","de",2639);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2095,"ist eingestellt - Bernd",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Bernd" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Bernd*IST_EINGESTELLT");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2640,"*",2639,2565,2034,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30252,"*","*","en",2640);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20179,"*","*","fr",2640);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30253,"*","*","de",2640);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2641,"*",2640,2565,2102,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30254,"*","*","en",2641);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20180,"*","*","fr",2641);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30255,"*","*","de",2641);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2102,"max-completion_date - Bernd",
'select max(s_relation.completion_date)
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
VALUES (166,"workload - Christine",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (318,"*","en",166);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (483,"*","fr",166);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (319,"*","de",166);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2566,
"workload - Christine",
166);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (925,"Christine is idle for three days!",
"en",2566);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (926,"Christine is idle for three days!",
"fr",2566);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (927,"Christine ist bereits seit drei Tagen untätig!",
"de",2566);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2642,"*",null,2566,2096,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30256,"*","*","en",2642);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20181,"*","*","fr",2642);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30257,"*","*","de",2642);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2096,"ist eingestellt - Christine",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Christine" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Christine*IST_EINGESTELLT");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2643,"*",2642,2566,2036,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30258,"*","*","en",2643);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20182,"*","*","fr",2643);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30259,"*","*","de",2643);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2644,"*",2643,2566,2103,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30260,"*","*","en",2644);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20183,"*","*","fr",2644);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30261,"*","*","de",2644);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2103,"max-completion_date - Christine",
'select max(s_relation.completion_date)
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
VALUES (167,"workload - Diana",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (320,"*","en",167);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (484,"*","fr",167);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (321,"*","de",167);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2567,
"workload - Diana",
167);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (928,"Diana is idle for three days!",
"en",2567);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (929,"Diana n'est plus active depuis trois jours!",
"fr",2567);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (930,"Diana ist bereits seit drei Tagen untätig!",
"de",2567);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2645,"*",null,2567,2097,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30262,"*","*","en",2645);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20184,"*","*","fr",2645);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30263,"*","*","de",2645);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2097,"ist eingestellt - Diana",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Diana" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Diana*IST_EINGESTELLT");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2646,"*",2645,2567,2038,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30264,"*","*","en",2646);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20185,"*","*","fr",2646);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30265,"*","*","de",2646);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2647,"*",2646,2567,2104,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30266,"*","*","en",2647);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20186,"*","*","fr",2647);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30267,"*","*","de",2647);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2104,"max-completion_date - Diana",
'select max(s_relation.completion_date)
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
VALUES (168,"workload - Richard",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (322,"*","en",168);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (485,"*","fr",168);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (323,"*","de",168);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2568,
"workload - Richard",
168);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (931,"Richard is idle for three days!",
"en",2568);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (932,"Richard n'est plus actif depuis trois jours!",
"fr",2568);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (933,"Richard ist bereits seit drei Tagen untätig!",
"de",2568);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2648,"*",null,2568,2098,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30268,"*","*","en",2648);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20187,"*","*","fr",2648);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30269,"*","*","de",2648);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2098,"ist eingestellt - Richard",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Richard" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Richard*IST_EINGESTELLT");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2649,"*",2648,2568,2044,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30270,"*","*","en",2649);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20188,"*","*","fr",2649);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30271,"*","*","de",2649);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2650,"*",2649,2568,2105,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30272,"*","*","en",2650);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20189,"*","*","fr",2650);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30273,"*","*","de",2650);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2105,"max-completion_date - Richard",
'select max(s_relation.completion_date)
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
VALUES (169,"workload - Stefanie",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (324,"*","en",169);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (486,"*","fr",169);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (325,"*","de",169);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2569,
"workload - Stefanie",
169);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (934,"Stefanie is idle for three days!",
"en",2569);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (935,"Stefanie n'est plus active depuis trois jours!",
"fr",2569);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (936,"Stefanie ist bereits seit drei Tagen untätig!",
"de",2569);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2651,"*",null,2569,2099,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30274,"*","*","en",2651);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20190,"*","*","fr",2651);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30275,"*","*","de",2651);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2099,"ist eingestellt - Stefanie",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Stefanie" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Stefanie*IST_EINGESTELLT");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2652,"*",2651,2569,2044,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30276,"*","*","en",2652);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20191,"*","*","fr",2652);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30277,"*","*","de",2652);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2653,"*",2652,2569,2106,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30278,"*","*","en",2653);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20192,"*","*","fr",2653);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30279,"*","*","de",2653);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2106,"max-completion_date - Stefanie",
'select max(s_relation.completion_date)
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
VALUES (170,"workload - Thomas",
3,1);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (326,"*","en",170);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (487,"*","fr",170);


INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (327,"*","de",170);
/* ENDE RIETA TOOL */

INSERT INTO specific_aid(spaidid,description,aiddid)
VALUES (2570,
"workload - Thomas",
170);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (937,"Thomas is idle for three days!",
"en",2570);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (938,"Thomas n'est plus actif depuis trois jours!",
"fr",2570);

INSERT INTO spec_aid_lang(said,text,language,spaidid)
VALUES (939,"Thomas ist bereits seit drei Tagen untätig!",
"de",2570);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2654,"*",null,2570,2100,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30280,"*","*","en",2654);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20193,"*","*","fr",2654);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30281,"*","*","de",2654);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2100,"ist eingestellt - Thomas",
'select distinct s_entity.value
from
zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
	spaid_needs_zt.spaidid = specific_aid.spaidid AND
	spaid_needs_zt.zid = zarmstype.zid AND
	zarmstype.eorr = "E" AND
        zarmstype.z_type = "ENTWICKLER" AND
        zarmstype.zid = z_entity.zid AND
        z_entity.description = "Thomas" AND
        z_entity.zeid = comprises.zeid AND
        comprises.zaid = z_attribute.zaid AND
        z_attribute.name = "IST_EINGESTELLT" AND
        comprises.compid = s_entity.compid AND
        s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ENTWICKLER*Thomas*IST_EINGESTELLT");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2655,"*",2654,2570,2044,22);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30282,"*","*","en",2655);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20194,"*","*","fr",2655);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30283,"*","*","de",2655);
/* ENDE RIETA TOOL */

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (2656,"*",2655,2570,2107,24);

/* RIETA TOOL benötigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30284,"*","*","en",2656);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30285,"*","*","de",2656);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20195,"*","*","fr",2656);
/* ENDE RIETA TOOL */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2107,"max-completion_date - Thomas",
'select max(s_relation.completion_date)
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


