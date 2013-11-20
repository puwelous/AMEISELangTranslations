use AMEISE;

update query set statement = 
'select distinct "MANUAL" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MANUAL" as description,
greatest((
select max(s_entity.value) as value from
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
    z_attribute.name = "HANDBUCH_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;'
where qid=2839;

update query set statement = 
'select distinct "MAN REV" as description, max(s_entity.value) as date
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
    z_attribute.name = "HREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MAN REV" as description,
greatest((
select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
    spaid_needs_zt.spaidid = specific_aid.spaidid AND
    spaid_needs_zt.zid = zarmstype.zid AND
    zarmstype.eorr = "E" AND
    zarmstype.z_type = "REVIEWLOGBUCH" AND
    zarmstype.zid = z_entity.zid AND
    z_entity.description = "Reviewlog" AND
    z_entity.zeid = comprises.zeid AND
    comprises.zaid = z_attribute.zaid AND
    z_attribute.name = "HREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;'
where qid=2840;



update query set statement = 
'select distinct "MAN COR" as description, max(s_entity.value) as date
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
    z_attribute.name = "HREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MAN COR" as description,
greatest((
select max(s_entity.value) as value
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
    z_attribute.name = "HREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 ),(
SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Manual" OR document = "Manuals")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as value;'
where qid=2841;




update query set statement = 
'select distinct "SPEC" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "SPEC" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2846;


update query set statement = 
'select distinct "SPEC REV" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "SPEC REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    z_attribute.name = "SREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2847;



update query set statement = 
'select distinct "SPEC COR" as description, least(
(select max(s_entity.value) as value
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1),
(SELECT REPLACE(min(s_relation.starting_date),"-","/") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid= %game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date)) as date
union
select distinct "SPEC COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Spezifikation" OR document = "Specification")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path,\"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    z_attribute.name = "SREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2848;


update query set statement = 
'select distinct "DESIGN" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DESIGN" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2849;


update query set statement = 
'select distinct "DES REV" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DES REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
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
    z_attribute.name = "EREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2850;

update query set statement =
'select distinct "DES COR" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "DES COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Systemdesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select
max(s_entity.value) as value
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
    z_attribute.name = "EREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2851;



update query set statement =
'select distinct "MSPEC" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2859;


update query set statement =
'select distinct "MSPEC REV" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    z_attribute.name = "MREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2860;


update query set statement =
'select distinct "MSPEC COR" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MSPEC COR" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Moduldesign" OR document = "Moduledesign")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    z_attribute.name = "MREVIEW_K_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2861;


update query set statement =
'select distinct "CODE" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "CODE" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="PRODUZIERT"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2862;


update query set statement =
'select distinct "CODE REV" as description, max(s_entity.value) as date
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
    z_attribute.name = "CREVIEW_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "CODE REV" as description,
greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="BEGUTACHTET"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),(
select max(s_entity.value) as value from
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
    z_attribute.name = "CREVIEW_ENDE" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 )) as value;'
where qid=2863;

update query set statement =
'select distinct "CODE COR" as description, least(
(select max(s_entity.value) as date
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
    z_attribute.name = "CREVIEW_K_BEGINN" AND
    comprises.compid = s_entity.compid AND
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1),
(SELECT REPLACE(min(s_relation.starting_date),"-","/") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Code" OR document = "Code")) AND s_relation.gid= %game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1 )) as date
union
select distinct "CODE COR" as description, greatest(
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00") as value FROM s_relation, zarmstype, game
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="KORRIGIERT"
AND (document = "Code")) AND s_relation.gid=%game AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1
ORDER BY s_relation.starting_date),
(select max(s_entity.value) as value from
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
z_attribute.name = "CREVIEW_K_ENDE" AND
comprises.compid = s_entity.compid AND
s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
)) as value;'
where qid=2864;


update query set statement =
'select distinct "MTEST" as description, max(s_entity.value) as date
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1
union
select distinct "MTEST" as description, greatest(
(select max(s_entity.value)
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
    s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path,\"%path\")=1),
(SELECT IFNULL(REPLACE(max(s_relation.completion_date),"-","/"),"0000/00/00")
FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND (zarmstype.z_type="TESTET_MODULE") AND s_relation.gid=%game
AND s_relation.success=1 AND LOCATE(s_relation.path, \"%path\")=1 ORDER BY s_relation.starting_date));'
where qid=2710;




--
-- a2ppt Project
--




update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4038;

update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) as value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4039;

update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4040;


update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4041;

update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4042;


update query set statement =
'SELECT DISTINCT CONCAT_WS(" ",s_relation.person, IF(success=1,"(OK)","(NOK)")) AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "KORRIGIERT"
AND document = "Spezifikation"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4043;

update query set statement =
'SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 0 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4047;

update query set statement =
' SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 1 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4048;

update query set statement =
' SELECT DISTINCT IF(s_relation.customer=1,"OK","X") AS value
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND s_relation.starting_date = (
SELECT DISTINCT s_relation.starting_date
FROM s_relation, zarmstype, game
WHERE game.gid = s_relation.gid
AND zarmstype.zid = s_relation.zid
AND z_type = "BEGUTACHTET"
AND document = "Specification"
AND eorr = "R"
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1
GROUP BY starting_date, person
LIMIT 2 , 1 )
AND game.gid =%game
AND LOCATE( s_relation.path, "%path" ) =1 '
where qid=4049;
