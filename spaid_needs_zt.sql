/* spaid_needs_zt.sql - Skript

 Description:
  This table is used to add relations from specific_aids (HMKs) to
  zarmstypes. If a HMK (identified by spaidid) uses one or more
  particular zarmstypes (identified by zid) -> insert the relation
 (spaid,zid) in the spaid_needs_zt table.

  This is of course necessary, if you use this join within the query statement
  (table query within the DB):

  spaid_needs_zt.spaidid = specific_aid.spaidid AND
  spaid_needs_zt.zid = zarmstype.zid AND
*/

/* Changelog: 05.6.2007, (dp), move all spaid_needs_zt inserts to this file
                               from queries.sql,
                               add missing spaid_needs_zt inserts
                               for visual-components.sql
*/





/*** Check ****/

/*
select distinct specific_aid.spaidid
from specific_aid, aid_instance, query
where specific_aid.spaidid = aid_instance.spaidid and
aid_instance.qid = query.qid and query.statement like "%IST_EINGESTELLT%";
*/



/* spaid_needs_zt Inserts, sorted by zid*/


/*
* zid= 1; PROJEKTZUSTAND
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (4,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (36,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3112,1);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3113,1);

/*
* zid= 2; PROJEKTLOGBUCH
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3119,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3133,2);

/*
* zid=3; TESTLOGBUCH
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (25,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (26,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (27,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (28,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3111,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3131,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3134,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,3);


/*
* zid=4; REVIEWLOGBUCH
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (20,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (21,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (22,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (23,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (24,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3133,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3234,4);


/*
* zid=5; ENTWICKLER
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (600,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (605,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (606,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (609,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (614,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (615,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (616,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (617,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (618,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (619,5);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (620,5);

/*
* zid=6; SPEZIFIKATION
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (13,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (14,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (15,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (17,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (20,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (29,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (31,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (37,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3109,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3117,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3118,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3119,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3132,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3234,6);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3800,6);


/*
* zid=7; SYSTEMENTWURF
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (13,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (14,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (16,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (21,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (30,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (35,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3109,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3117,7);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,7);

/*
* zid=8; MODULSPEZIFIKATION
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (13,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (14,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (17,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (31,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (36,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3109,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3117,8);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,8);


/*
* zid=9; CODE
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (5,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (6,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (7,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (8,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (13,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (14,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (18,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (23,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (32,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (34,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (47,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (48,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (60,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3004,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3109,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3112,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3117,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3119,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3130,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3132,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3137,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3140,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3234,9);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3800,9);


/*
* zid=10; HANDBUCH
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (9,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (10,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (11,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (12,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (13,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (14,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (19,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (24,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (33,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (40,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (61,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (609,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (615,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3100,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3109,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3112,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3117,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3118,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3119,10);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,10);


/*
* zid=11; SPEZIFIKATIONSREVIEWBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (20,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (29,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,11);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,11);


/*
* zid=12; SYSTEMENTWURFSREVIEWBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (21,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (30,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,12);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,12);


/*
* zid=13; MODULSPEZREVIEWBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (22,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (31,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (28,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,13);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,13);

/*
* zid=14; CODEREVIEWBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (23,14);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (32,14);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,14);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,14);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,14);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,14);


/*
* zid=15; HANDBUCHREVIEWBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (24,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (33,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (38,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3110,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3114,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,15);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,15);


/*
* zid=16; MODULTESTBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (25,16);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (34,16);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (39,16);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3111,16);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3116,16);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,16);



/*
* zid=17; INTEGRATIONSTESTBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (26,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (27,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (36,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (39,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3111,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3115,17);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,17);

/*
* zid=18; SYSTEMTESTBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (27,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (26,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (35,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (39,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3111,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3115,18);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,18);

/*
* zid=19; ABNAHMETESTBERICHT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (28,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (37,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (39,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3111,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3115,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,19);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3137,19);


/*
* zid=20; PRODUZIERT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (41,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (42,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (43,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (44,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (45,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (46,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (47,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (48,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (49,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (50,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3132,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3133,20);

/*
* zid=21; INTEGRIERT
*
* niergends in Verwendung
*/


/*
* zid=22; KORRIGIERT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3132,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3133,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3234,22);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3800,22);



/*
* zid=23; TESTET_MODULE
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,23);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,23);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,23);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3137,23);

/*
* zid=24; TESTET_SYSTEM
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,24);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,24);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3137,24);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,24);


/*
* zid=25; BEGUTACHTET
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3001,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3108,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3121,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3132,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3133,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3140,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3800,25);


/*
* zid=26; NIMMT_AB
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,26);

/*
* zid=27; REVIEW_MIT_KUNDE_FINDET_STATT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3106,27);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3107,27);

/*
* zid=28; KORRIGIERT_ALLES
*
* niergends in Verwendung
*/

/*
* zid=29; SPRICHT_MIT_KUNDE
*
* niergends in Verwendung
*/

/*
* zid=30; TESTET_INTEGRATION
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3126,30);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3127,30);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3137,30);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3139,30);


/*
* zid=31; IST_EINGESTELLT
*/
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (3128,31);




