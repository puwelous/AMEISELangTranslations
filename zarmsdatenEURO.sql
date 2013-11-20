/* zarmsdatenEURO.sql - Skript */
/* Beschreibung: Befüllt die ZARMS-Daten für das AMEISE-QA-EURO-Modell */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */

/* Changelog: */
/* (nz) 09.02.2006 TESTET_INTEGRATION hinzugefuegt */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

/* INSERT DER ZARMS-TABELLEN */

/* ENTITÄTEN */

/* Projektzustand */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1,"PROJEKTZUSTAND","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(1,"Projectstatus",1);
INSERT INTO z_attribute(zaid,name) VALUES (1,"KOSTEN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1,1,1);
INSERT INTO z_attribute(zaid,name) VALUES (2,"KOSTEN_PRO_MM");
INSERT INTO comprises(compid,zeid,zaid) VALUES (2,1,2);
INSERT INTO z_attribute(zaid,name) VALUES (3,"PROJEKTBEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (3,1,3);
INSERT INTO z_attribute(zaid,name) VALUES (4,"PROJEKTENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (4,1,4);
INSERT INTO z_attribute(zaid,name) VALUES (5,"AUFWANDSVERTEILUNG_SPEZI");
INSERT INTO comprises(compid,zeid,zaid) VALUES (5,1,5);
INSERT INTO z_attribute(zaid,name) VALUES (6,"AUFWANDSVERTEILUNG_ENTWURF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (6,1,6);
INSERT INTO z_attribute(zaid,name) VALUES (7,"AUFWANDSVERTEILUNG_CODE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (7,1,7);
INSERT INTO z_attribute(zaid,name) VALUES (8,"AUFWANDSVERTEILUNG_TEST");
INSERT INTO comprises(compid,zeid,zaid) VALUES (8,1,8);
INSERT INTO z_attribute(zaid,name) VALUES (9,"AUFWANDSVERTEILUNG_HANDBUCH");
INSERT INTO comprises(compid,zeid,zaid) VALUES (9,1,9);
INSERT INTO z_attribute(zaid,name) VALUES (10,"AUFWAND_SPEZIFIKATIONSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10,1,10);
INSERT INTO z_attribute(zaid,name) VALUES (11,"AUFWAND_ENTWURFSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (11,1,11);
INSERT INTO z_attribute(zaid,name) VALUES (12,"AUFWAND_CODIERUNGSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (12,1,12);
INSERT INTO z_attribute(zaid,name) VALUES (13,"AUFWAND_TESTPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (13,1,13);
INSERT INTO z_attribute(zaid,name) VALUES (14,"AUFWAND_HANDBUCHERSTELLUNG");
INSERT INTO comprises(compid,zeid,zaid) VALUES (14,1,14);
INSERT INTO z_attribute(zaid,name) VALUES (15,"AUFWAND_REVIEWS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (15,1,15);
INSERT INTO z_attribute(zaid,name) VALUES (16,"AUFWAND_TESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (16,1,16);
INSERT INTO z_attribute(zaid,name) VALUES (17,"AUFWAND_KORREKTUR_REVIEWS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (17,1,17);
INSERT INTO z_attribute(zaid,name) VALUES (18,"AUFWAND_KORREKTUR_TESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (18,1,18);
INSERT INTO z_attribute(zaid,name) VALUES (19,"ANZAHL_ABNAHMETESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (19,1,19);

/* neu dazugekommen */
INSERT INTO z_attribute(zaid,name) VALUES (400,"PROJEKT_IST_BEENDET");
INSERT INTO comprises(compid,zeid,zaid) VALUES (500,1,400);
INSERT INTO z_attribute(zaid,name) VALUES (401,"PROZENT_DAUER_ZV");
INSERT INTO comprises(compid,zeid,zaid) VALUES (501,1,401);



/* Projektlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (2,"PROJEKTLOGBUCH","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(2,"Projectlog",2);
INSERT INTO z_attribute(zaid,name) VALUES (20,"SPEZIFIKATION_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (20,2,20);
INSERT INTO z_attribute(zaid,name) VALUES (21,"SPEZIFIKATION_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (21,2,21);
INSERT INTO z_attribute(zaid,name) VALUES (22,"ENTWURF_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (22,2,22);
INSERT INTO z_attribute(zaid,name) VALUES (23,"ENTWURF_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (23,2,23);
INSERT INTO z_attribute(zaid,name) VALUES (24,"MODSPEZ_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (24,2,24);
INSERT INTO z_attribute(zaid,name) VALUES (25,"MODSPEZ_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (25,2,25);
INSERT INTO z_attribute(zaid,name) VALUES (26,"CODE_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (26,2,26);
INSERT INTO z_attribute(zaid,name) VALUES (27,"CODE_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (27,2,27);
INSERT INTO z_attribute(zaid,name) VALUES (28,"INTEGRATION_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (28,2,28);
INSERT INTO z_attribute(zaid,name) VALUES (29,"INTEGRATION_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (29,2,29);
INSERT INTO z_attribute(zaid,name) VALUES (30,"HANDBUCH_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (30,2,30);
INSERT INTO z_attribute(zaid,name) VALUES (31,"HANDBUCH_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (31,2,31);

/* neu dazu gekommen */
INSERT INTO z_attribute(zaid,name) VALUES (402,"SPEZIFIKATION_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (502,2,402);
INSERT INTO z_attribute(zaid,name) VALUES (403,"ENTWURF_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (503,2,403);
INSERT INTO z_attribute(zaid,name) VALUES (404,"MODSPEZ_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (504,2,404);
INSERT INTO z_attribute(zaid,name) VALUES (405,"CODE_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (505,2,405);
INSERT INTO z_attribute(zaid,name) VALUES (406,"INTEGRATION_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (506,2,406);
INSERT INTO z_attribute(zaid,name) VALUES (407,"HANDBUCH_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (507,2,407);




/* Testlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (3,"TESTLOGBUCH","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES (3,"Testlog",3);
INSERT INTO z_attribute(zaid,name) VALUES (32,"MTEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (32,3,32);
INSERT INTO z_attribute(zaid,name) VALUES (33,"MTEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (33,3,33);
INSERT INTO z_attribute(zaid,name) VALUES (34,"MTEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (34,3,34);
INSERT INTO z_attribute(zaid,name) VALUES (35,"MTEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (35,3,35);
INSERT INTO z_attribute(zaid,name) VALUES (36,"MTEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (36,3,36);
INSERT INTO z_attribute(zaid,name) VALUES (37,"MTEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (37,3,37);
INSERT INTO z_attribute(zaid,name) VALUES (38,"ITEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (38,3,38);
INSERT INTO z_attribute(zaid,name) VALUES (39,"ITEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (39,3,39);
INSERT INTO z_attribute(zaid,name) VALUES (40,"ITEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (40,3,40);
INSERT INTO z_attribute(zaid,name) VALUES (41,"ITEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (41,3,41);
INSERT INTO z_attribute(zaid,name) VALUES (42,"ITEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (42,3,42);
INSERT INTO z_attribute(zaid,name) VALUES (43,"ITEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (43,3,43);
INSERT INTO z_attribute(zaid,name) VALUES (44,"STEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (44,3,44);
INSERT INTO z_attribute(zaid,name) VALUES (45,"STEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (45,3,45);
INSERT INTO z_attribute(zaid,name) VALUES (46,"STEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (46,3,46);
INSERT INTO z_attribute(zaid,name) VALUES (47,"STEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (47,3,47);
INSERT INTO z_attribute(zaid,name) VALUES (48,"STEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (48,3,48);
INSERT INTO z_attribute(zaid,name) VALUES (49,"STEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (49,3,49);
INSERT INTO z_attribute(zaid,name) VALUES (50,"ATEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (50,3,50);
INSERT INTO z_attribute(zaid,name) VALUES (51,"ATEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (51,3,51);
INSERT INTO z_attribute(zaid,name) VALUES (52,"ATEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (52,3,52);
INSERT INTO z_attribute(zaid,name) VALUES (53,"ATEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (53,3,53);
INSERT INTO z_attribute(zaid,name) VALUES (54,"ATEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (54,3,54);
INSERT INTO z_attribute(zaid,name) VALUES (55,"ATEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (55,3,55);


/* Reviewlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (4,"REVIEWLOGBUCH","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES (4,"Reviewlog",4);
INSERT INTO z_attribute(zaid,name) VALUES (56,"SREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (56,4,56);
INSERT INTO z_attribute(zaid,name) VALUES (57,"SREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (57,4,57);
INSERT INTO z_attribute(zaid,name) VALUES (58,"SREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (58,4,58);
INSERT INTO z_attribute(zaid,name) VALUES (59,"SREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (59,4,59);
INSERT INTO z_attribute(zaid,name) VALUES (60,"SREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (60,4,60);
INSERT INTO z_attribute(zaid,name) VALUES (61,"SREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (61,4,61);
INSERT INTO z_attribute(zaid,name) VALUES (62,"EREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (62,4,62);
INSERT INTO z_attribute(zaid,name) VALUES (63,"EREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (63,4,63);
INSERT INTO z_attribute(zaid,name) VALUES (64,"EREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (64,4,64);
INSERT INTO z_attribute(zaid,name) VALUES (65,"EREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (65,4,65);
INSERT INTO z_attribute(zaid,name) VALUES (66,"EREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (66,4,66);
INSERT INTO z_attribute(zaid,name) VALUES (67,"EREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (67,4,67);
INSERT INTO z_attribute(zaid,name) VALUES (68,"MREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (68,4,68);
INSERT INTO z_attribute(zaid,name) VALUES (69,"MREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (69,4,69);
INSERT INTO z_attribute(zaid,name) VALUES (70,"MREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (70,4,70);
INSERT INTO z_attribute(zaid,name) VALUES (71,"MREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (71,4,71);
INSERT INTO z_attribute(zaid,name) VALUES (72,"MREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (72,4,72);
INSERT INTO z_attribute(zaid,name) VALUES (73,"MREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (73,4,73);
INSERT INTO z_attribute(zaid,name) VALUES (74,"CREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (74,4,74);
INSERT INTO z_attribute(zaid,name) VALUES (75,"CREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (75,4,75);
INSERT INTO z_attribute(zaid,name) VALUES (76,"CREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (76,4,76);
INSERT INTO z_attribute(zaid,name) VALUES (77,"CREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (77,4,77);
INSERT INTO z_attribute(zaid,name) VALUES (78,"CREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (78,4,78);
INSERT INTO z_attribute(zaid,name) VALUES (79,"CREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (79,4,79);
INSERT INTO z_attribute(zaid,name) VALUES (80,"HREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (80,4,80);
INSERT INTO z_attribute(zaid,name) VALUES (81,"HREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (81,4,81);
INSERT INTO z_attribute(zaid,name) VALUES (82,"HREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (82,4,82);
INSERT INTO z_attribute(zaid,name) VALUES (83,"HREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (83,4,83);
INSERT INTO z_attribute(zaid,name) VALUES (84,"HREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (84,4,84);
INSERT INTO z_attribute(zaid,name) VALUES (85,"HREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (85,4,85);


/* Entwickler */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (5,"ENTWICKLER","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES (5,"Axel",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (6,"Bernd",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (7,"Christine",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (8,"Diana",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (9,"Richard",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (10,"Stefanie",5);
INSERT INTO z_entity(zeid,description,zid) VALUES (11,"Thomas",5);

/* jeder Entwickler kann eingestellt sein oder nicht */
INSERT INTO z_attribute(zaid,name) VALUES (86,"IST_EINGESTELLT");
INSERT INTO comprises(compid,zeid,zaid) VALUES (351,5,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (352,6,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (353,7,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (354,8,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (355,9,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (356,10,86);
INSERT INTO comprises(compid,zeid,zaid) VALUES (357,11,86);

/* Kosten für Entwickler */
INSERT INTO comprises(compid,zeid,zaid) VALUES (358,5,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (359,6,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (360,7,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (361,8,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (362,9,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (363,10,1);
INSERT INTO comprises(compid,zeid,zaid) VALUES (364,11,1);



/* Phasen */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (6,"SPEZIFIKATION","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(12,"Specification",6);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (7,"SYSTEMENTWURF","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(13,"Systemdesign",7);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (8,"MODULSPEZIFIKATION","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(14,"Moduledesign",8);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (9,"CODE","E", 1);
INSERT INTO z_entity(zeid,description,zid) VALUES (15,"Code",9);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10,"HANDBUCH","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES (16,"Manuals",10);

INSERT INTO z_attribute(zaid,name) VALUES (87,"ANZ_AFP");
INSERT INTO comprises(compid,zeid,zaid) VALUES (87,12,87);
INSERT INTO comprises(compid,zeid,zaid) VALUES (88,13,87);
INSERT INTO comprises(compid,zeid,zaid) VALUES (89,14,87);
INSERT INTO comprises(compid,zeid,zaid) VALUES (90,15,87);
INSERT INTO comprises(compid,zeid,zaid) VALUES (91,16,87);



INSERT INTO z_attribute(zaid,name) VALUES (88,"ANZ_FEHLER_GES");
INSERT INTO comprises(compid,zeid,zaid) VALUES (92,12,88);
INSERT INTO comprises(compid,zeid,zaid) VALUES (93,13,88);
INSERT INTO comprises(compid,zeid,zaid) VALUES (94,14,88);
INSERT INTO comprises(compid,zeid,zaid) VALUES (95,15,88);
INSERT INTO comprises(compid,zeid,zaid) VALUES (96,16,88);

INSERT INTO z_attribute(zaid,name) VALUES (89,"PROZENT_AFP_100");
INSERT INTO comprises(compid,zeid,zaid) VALUES (97,12,89);
INSERT INTO comprises(compid,zeid,zaid) VALUES (98,13,89);
INSERT INTO comprises(compid,zeid,zaid) VALUES (99,14,89);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100,15,89);
INSERT INTO comprises(compid,zeid,zaid) VALUES (101,16,89);

INSERT INTO z_attribute(zaid,name) VALUES (90,"ANZ_AF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (102,12,90);
INSERT INTO comprises(compid,zeid,zaid) VALUES (103,13,90);
INSERT INTO comprises(compid,zeid,zaid) VALUES (104,14,90);
INSERT INTO comprises(compid,zeid,zaid) VALUES (105,15,90);
INSERT INTO comprises(compid,zeid,zaid) VALUES (106,16,90);

INSERT INTO z_attribute(zaid,name) VALUES (91,"ANZ_GF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (107,13,91);
INSERT INTO comprises(compid,zeid,zaid) VALUES (108,14,91);
INSERT INTO comprises(compid,zeid,zaid) VALUES (109,15,91);

INSERT INTO z_attribute(zaid,name) VALUES (92,"ANZ_FF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (110,14,92);
INSERT INTO comprises(compid,zeid,zaid) VALUES (111,15,92);

INSERT INTO z_attribute(zaid,name) VALUES (93,"ANZ_IF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (112,15,93);

INSERT INTO z_attribute(zaid,name) VALUES (94,"FEHLER_PRO_KLOC");
INSERT INTO comprises(compid,zeid,zaid) VALUES (113,15,94);

/* gibt es auch in den Reviewberichten */
/* Vorsicht hier gilt der Wert nur für den Code */
INSERT INTO z_attribute(zaid,name) VALUES (200,"FEHLER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (350,15,200);

INSERT INTO z_attribute(zaid,name) VALUES (95,"ANZ_HF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (114,16,95);

INSERT INTO z_attribute(zaid,name) VALUES (96,"FEHLER_PRO_SEITE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1114,12,96);
INSERT INTO comprises(compid,zeid,zaid) VALUES (1115,13,96);
INSERT INTO comprises(compid,zeid,zaid) VALUES (1116,14,96);
INSERT INTO comprises(compid,zeid,zaid) VALUES (115,16,96);



/* Reviewberichte */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES
(11,"SPEZIFIKATIONSREVIEWBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(17,"Specificationreviewreport",11);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES
(12,"SYSTEMENTWURFSREVIEWBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(18,"Systemdesignreviewreport",12);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (13,"MODULSPEZREVIEWBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(19,"Moduledesignreviewreport",13);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (14,"CODEREVIEWBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(20,"Codereviewreport",14);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (15,"HANDBUCHREVIEWBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(21,"Manualsreviewreport",15);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (16,"MODULTESTBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(22,"Moduletestreport",16);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (17,"INTEGRATIONSTESTBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(23,"Integrationtestreport",17);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (18,"SYSTEMTESTBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(24,"Systemtestreport",18);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (19,"ABNAHMETESTBERICHT","E",1);
INSERT INTO z_entity(zeid,description,zid) VALUES
(25,"Acceptancetestreport",19);

INSERT INTO z_attribute(zaid,name) VALUES (97,"FEHLER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (116,17,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (117,18,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (118,19,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (119,20,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (120,21,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (121,22,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (122,23,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (123,24,97);
INSERT INTO comprises(compid,zeid,zaid) VALUES (124,25,97);

INSERT INTO z_attribute(zaid,name) VALUES (98,"VERLUSTE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (125,17,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (126,18,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (127,19,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (128,20,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (129,21,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (130,22,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (131,23,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (132,24,98);
INSERT INTO comprises(compid,zeid,zaid) VALUES (133,25,98);

INSERT INTO z_attribute(zaid,name) VALUES (99,"NUMMER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (134,17,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (135,18,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (136,19,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (137,20,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (138,21,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (139,22,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (140,23,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (141,24,99);
INSERT INTO comprises(compid,zeid,zaid) VALUES (142,25,99);


INSERT INTO z_attribute(zaid,name) VALUES (100,"ANZ_FEHLER_1_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (143,17,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (144,18,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (145,19,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (146,20,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (147,21,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (148,22,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (149,23,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (150,24,100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (151,25,100);

INSERT INTO z_attribute(zaid,name) VALUES (101,"ANZ_FEHLER_2_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (152,17,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (153,18,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (154,19,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (155,20,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (156,21,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (157,22,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (158,23,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (159,24,101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (160,25,101);

INSERT INTO z_attribute(zaid,name) VALUES (102,"ANZ_FEHLER_3_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (161,17,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (162,18,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (163,19,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (164,20,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (165,21,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (166,22,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (167,23,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (168,24,102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (169,25,102);

INSERT INTO z_attribute(zaid,name) VALUES (103,"ANZ_FEHLER_4_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (170,17,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (171,18,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (172,19,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (173,20,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (174,21,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (175,22,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (176,23,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (177,24,103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (178,25,103);

INSERT INTO z_attribute(zaid,name) VALUES (104,"ANZ_FEHLER_5_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (179,17,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (180,18,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (181,19,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (182,20,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (183,21,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (184,22,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (185,23,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (186,24,104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (187,25,104);

INSERT INTO z_attribute(zaid,name) VALUES (105,"ANZ_FEHLER_6_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (188,17,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (189,18,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (190,19,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (191,20,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (192,21,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (193,22,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (194,23,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (195,24,105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (196,25,105);


INSERT INTO z_attribute(zaid,name) VALUES (106,"ANZ_FEHLER_7_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (197,17,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (198,18,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (199,19,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (200,20,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (201,21,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (202,22,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (203,23,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (204,24,106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (205,25,106);

INSERT INTO z_attribute(zaid,name) VALUES (107,"ANZ_FEHLER_8_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (206,17,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (207,18,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (208,19,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (209,20,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (210,21,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (211,22,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (212,23,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (213,24,107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (214,25,107);

INSERT INTO z_attribute(zaid,name) VALUES (108,"ANZ_FEHLER_9_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (215,17,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (216,18,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (217,19,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (218,20,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (219,21,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (220,22,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (221,23,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (222,24,108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (223,25,108);

INSERT INTO z_attribute(zaid,name) VALUES (109,"ANZ_FEHLER_10_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (224,17,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (225,18,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (226,19,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (227,20,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (228,21,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (229,22,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (230,23,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (231,24,109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (232,25,109);

INSERT INTO z_attribute(zaid,name) VALUES (110,"ANZ_KORR_FEHLER_1_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (233,17,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (234,18,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (235,19,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (236,20,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (237,21,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (238,22,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (239,23,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (240,24,110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (241,25,110);

INSERT INTO z_attribute(zaid,name) VALUES (111,"ANZ_KORR_FEHLER_2_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (242,17,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (243,18,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (244,19,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (245,20,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (246,21,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (247,22,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (248,23,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (249,24,111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (250,25,111);

INSERT INTO z_attribute(zaid,name) VALUES (112,"ANZ_KORR_FEHLER_3_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (251,17,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (252,18,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (253,19,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (254,20,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (255,21,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (256,22,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (257,23,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (258,24,112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (259,25,112);

INSERT INTO z_attribute(zaid,name) VALUES (113,"ANZ_KORR_FEHLER_4_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (260,17,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (261,18,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (262,19,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (263,20,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (264,21,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (265,22,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (266,23,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (267,24,113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (268,25,113);

INSERT INTO z_attribute(zaid,name) VALUES (114,"ANZ_KORR_FEHLER_5_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (269,17,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (270,18,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (271,19,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (272,20,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (273,21,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (274,22,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (275,23,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (276,24,114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (277,25,114);

INSERT INTO z_attribute(zaid,name) VALUES (115,"ANZ_KORR_FEHLER_6_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (278,17,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (279,18,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (280,19,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (281,20,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (282,21,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (283,22,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (284,23,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (285,24,115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (286,25,115);

INSERT INTO z_attribute(zaid,name) VALUES (116,"ANZ_KORR_FEHLER_7_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (287,17,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (288,18,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (289,19,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (290,20,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (291,21,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (292,22,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (293,23,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (294,24,116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (295,25,116);

INSERT INTO z_attribute(zaid,name) VALUES (117,"ANZ_KORR_FEHLER_8_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (296,17,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (297,18,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (298,19,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (299,20,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (300,21,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (301,22,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (302,23,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (303,24,117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (304,25,117);

INSERT INTO z_attribute(zaid,name) VALUES (118,"ANZ_KORR_FEHLER_9_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (305,17,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (306,18,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (307,19,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (308,20,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (309,21,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (310,22,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (311,23,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (312,24,118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (313,25,118);

INSERT INTO z_attribute(zaid,name) VALUES (119,"ANZ_KORR_FEHLER_10_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (314,17,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (315,18,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (316,19,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (317,20,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (318,21,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (319,22,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (320,23,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (321,24,119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (322,25,119);

INSERT INTO z_attribute(zaid,name) VALUES (120,"FEHLER_PRO_AFP");
INSERT INTO comprises(compid,zeid,zaid) VALUES (323,12,120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (324,13,120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (325,14,120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (326,15,120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (327,16,120);


/* RELATIONEN */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (20,"PRODUZIERT","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (21,"INTEGRIERT","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (22,"KORRIGIERT","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (23,"TESTET_MODULE","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (24,"TESTET_SYSTEM","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (25,"BEGUTACHTET","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (26,"NIMMT_AB","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (27,"REVIEW_MIT_KUNDE_FINDET_STATT","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (28,"KORRIGIERT_ALLES","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (29,"SPRICHT_MIT_KUNDE","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (30,"TESTET_INTEGRATION","R",1);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (31,"IST_EINGESTELLT","R",1);

/* Modell ID = 1 */
UPDATE zarmstype SET mid=1;














