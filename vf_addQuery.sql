/* NEU */
INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2000,'T','!=',null,'1901/01/01/00:00');

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2001,'T','==',null,'1901/01/01/00:00');

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*ENTWURF_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*MODSPEZ_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*CODE_BEGINN");

/******************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE");
***********************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2004,"Ende der Spezifikationsphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date from s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid= %game AND 
LOCATE(s_relation.path, \"%path\")=1 ORDER BY s_relation.starting_date)) as completion_date;',
"**PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE");

/*********************************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*ENTWURF_EMDE");
********************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2005,"Ende der Systemdesignphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date from s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',
"**PROJEKTLOGBUCH*Projectlog*ENTWURF_EMDE");

/*********************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE");
*******************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2006,"Ende der Moduldesignphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date from s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND 
LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',
"**PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE");

/************************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTLOGBUCH*Projectlog*CODE_ENDE");
************************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2007,"Ende der Codierungsphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date from s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Code")) AND s_relation.gid=%game AND LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',"**PROJEKTLOGBUCH*Projectlog*CODE_ENDE");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*MTEST_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ITEST_BEGINN");

/*****************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*MTEST_ENDE");
************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2010,"Ende der Modultestphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date
from s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE") 
AND s_relation.gid= %game AND LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',
"**TESTLOGBUCH*Testlog*MTEST_ENDE");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*STEST_BEGINN");

/*****************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ITEST_ENDE");
************/

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2012,"Ende der Integrationstestphase",
'select distinct
greatest("1901/01/01/00:00",
(select REPLACE(max(s_relation.completion_date),"-","/") as completion_date
from s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_INTEGRATION") 
AND s_relation.gid= %game AND LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',
"**TESTLOGBUCH*Testlog*ITEST_ENDE");

/*********************
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*STEST_ENDE");
*****************/


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2013,"Ende der Systemtestphase",
'select distinct
greatest("1901/01/01/00:00",
(Select REPLACE(max(s_relation.completion_date),"-","/") as completion_date
from s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_SYSTEM") 
AND s_relation.gid= %game AND LOCATE(s_relation.path, \"%path\")=1 
ORDER BY s_relation.starting_date)) as completion_date;',
"**TESTLOGBUCH*Testlog*STEST_ENDE");


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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ATEST_BEGINN");



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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_BEGINN");


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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_K_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_K_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_K_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*MTEST_K_BEGINN");

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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ITEST_K_BEGINN");


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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*STEST_K_BEGINN");



INSERT INTO query(qid,attribute,statement,z_path)
VALUES (93,"Autor der Spezifikation",
'select DISTINCT s_relation.person
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Spe%ifi%ation" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Spezifikation*success=1");

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (94,"Autor Systemdesign", 	
'select DISTINCT s_relation.person
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Systemdesign" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Systemdesign*success=1");

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (95,"Autor Moduledesign", 	
'select DISTINCT s_relation.person
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Modu%design" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Moduledesign*success=1");

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (96,"Autor Code", 	
'select DISTINCT s_relation.person
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document = "Code" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Code*success=1");


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (97,"Autor Handbuch", 	
'select DISTINCT s_relation.person
from zarmstype,s_relation,game,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Manua%" AND
      s_relation.success = 1 AND
      s_relation.gid = game.gid AND game.gid = %game AND LOCATE(s_relation.path, \"%path\")=1;',
"*PRODUZIERT*document=Manuals*success=1");

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (12,'T','NOT IN',null,"Richard");


INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (14,'T','NOT IN',null,"Richard,Christine");


INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (16,'T','NOT IN',null,"Diana");

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (18,'T','NOT IN',null,"Bernd");








