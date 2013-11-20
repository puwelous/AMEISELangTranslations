/* zarmsdatenMini.sql - Skript */
/* Beschreibung: Befüllt die ZARMS-Daten für das AEMISE-QA-Mini-Modell*/
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
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1001,"PROJEKTZUSTAND","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(1001,"Projectstatus",1001);
INSERT INTO z_attribute(zaid,name) VALUES (1001,"KOSTEN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1001,1001,1001);
INSERT INTO z_attribute(zaid,name) VALUES (1002,"KOSTEN_PRO_MM");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1002,1001,1002);
INSERT INTO z_attribute(zaid,name) VALUES (1003,"PROJEKTBEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1003,1001,1003);
INSERT INTO z_attribute(zaid,name) VALUES (1004,"PROJEKTENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1004,1001,1004);
INSERT INTO z_attribute(zaid,name) VALUES (1005,"AUFWANDSVERTEILUNG_SPEZI");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1005,1001,1005);
INSERT INTO z_attribute(zaid,name) VALUES (1006,"AUFWANDSVERTEILUNG_ENTWURF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1006,1001,1006);
INSERT INTO z_attribute(zaid,name) VALUES (1007,"AUFWANDSVERTEILUNG_CODE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1007,1001,1007);
INSERT INTO z_attribute(zaid,name) VALUES (1008,"AUFWANDSVERTEILUNG_TEST");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1008,1001,1008);
INSERT INTO z_attribute(zaid,name) VALUES (1009,"AUFWANDSVERTEILUNG_HANDBUCH");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1009,1001,1009);
INSERT INTO z_attribute(zaid,name) VALUES (10010,"AUFWAND_SPEZIFIKATIONSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10010,1001,10010);
INSERT INTO z_attribute(zaid,name) VALUES (10011,"AUFWAND_ENTWURFSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10011,1001,10011);
INSERT INTO z_attribute(zaid,name) VALUES (10012,"AUFWAND_CODIERUNGSPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10012,1001,10012);
INSERT INTO z_attribute(zaid,name) VALUES (10013,"AUFWAND_TESTPHASE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10013,1001,10013);
INSERT INTO z_attribute(zaid,name) VALUES (10014,"AUFWAND_HANDBUCHERSTELLUNG");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10014,1001,10014);
INSERT INTO z_attribute(zaid,name) VALUES (10015,"AUFWAND_REVIEWS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10015,1001,10015);
INSERT INTO z_attribute(zaid,name) VALUES (10016,"AUFWAND_TESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10016,1001,10016);
INSERT INTO z_attribute(zaid,name) VALUES (10017,"AUFWAND_KORREKTUR_REVIEWS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10017,1001,10017);
INSERT INTO z_attribute(zaid,name) VALUES (10018,"AUFWAND_KORREKTUR_TESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10018,1001,10018);
INSERT INTO z_attribute(zaid,name) VALUES (10019,"ANZAHL_ABNAHMETESTS");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10019,1001,10019);

/* neu dazugekommen */
INSERT INTO z_attribute(zaid,name) VALUES (100400,"PROJEKT_IST_BEENDET");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100500,1001,100400);
INSERT INTO z_attribute(zaid,name) VALUES (100401,"PROZENT_DAUER_ZV");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100501,1001,100401);



/* Projektlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1002,"PROJEKTLOGBUCH","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(1002,"Projectlog",1002);
INSERT INTO z_attribute(zaid,name) VALUES (10020,"SPEZIFIKATION_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10020,1002,10020);
INSERT INTO z_attribute(zaid,name) VALUES (10021,"SPEZIFIKATION_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10021,1002,10021);
INSERT INTO z_attribute(zaid,name) VALUES (10022,"ENTWURF_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10022,1002,10022);
INSERT INTO z_attribute(zaid,name) VALUES (10023,"ENTWURF_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10023,1002,10023);
INSERT INTO z_attribute(zaid,name) VALUES (10024,"MODSPEZ_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10024,1002,10024);
INSERT INTO z_attribute(zaid,name) VALUES (10025,"MODSPEZ_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10025,1002,10025);
INSERT INTO z_attribute(zaid,name) VALUES (10026,"CODE_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10026,1002,10026);
INSERT INTO z_attribute(zaid,name) VALUES (10027,"CODE_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10027,1002,10027);
INSERT INTO z_attribute(zaid,name) VALUES (10028,"INTEGRATION_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10028,1002,10028);
INSERT INTO z_attribute(zaid,name) VALUES (10029,"INTEGRATION_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10029,1002,10029);
INSERT INTO z_attribute(zaid,name) VALUES (10030,"HANDBUCH_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10030,1002,10030);
INSERT INTO z_attribute(zaid,name) VALUES (10031,"HANDBUCH_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10031,1002,10031);

/* neu dazu gekommen */
INSERT INTO z_attribute(zaid,name) VALUES (100402,"SPEZIFIKATION_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100502,1002,100402);
INSERT INTO z_attribute(zaid,name) VALUES (100403,"ENTWURF_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100503,1002,100403);
INSERT INTO z_attribute(zaid,name) VALUES (100404,"MODSPEZ_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100504,1002,100404);
INSERT INTO z_attribute(zaid,name) VALUES (100405,"CODE_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100505,1002,100405);
INSERT INTO z_attribute(zaid,name) VALUES (100406,"INTEGRATION_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100506,1002,100406);
INSERT INTO z_attribute(zaid,name) VALUES (100407,"HANDBUCH_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100507,1002,100407);



/* Testlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1003,"TESTLOGBUCH","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES (1003,"Testlog",1003);
INSERT INTO z_attribute(zaid,name) VALUES (10032,"MTEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10032,1003,10032);
INSERT INTO z_attribute(zaid,name) VALUES (10033,"MTEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10033,1003,10033);
INSERT INTO z_attribute(zaid,name) VALUES (10034,"MTEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10034,1003,10034);
INSERT INTO z_attribute(zaid,name) VALUES (10035,"MTEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10035,1003,10035);
INSERT INTO z_attribute(zaid,name) VALUES (10036,"MTEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10036,1003,10036);
INSERT INTO z_attribute(zaid,name) VALUES (10037,"MTEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10037,1003,10037);
INSERT INTO z_attribute(zaid,name) VALUES (10038,"ITEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10038,1003,10038);
INSERT INTO z_attribute(zaid,name) VALUES (10039,"ITEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10039,1003,10039);
INSERT INTO z_attribute(zaid,name) VALUES (10040,"ITEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10040,1003,10040);
INSERT INTO z_attribute(zaid,name) VALUES (10041,"ITEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10041,1003,10041);
INSERT INTO z_attribute(zaid,name) VALUES (10042,"ITEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10042,1003,10042);
INSERT INTO z_attribute(zaid,name) VALUES (10043,"ITEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10043,1003,10043);
INSERT INTO z_attribute(zaid,name) VALUES (10044,"STEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10044,1003,10044);
INSERT INTO z_attribute(zaid,name) VALUES (10045,"STEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10045,1003,10045);
INSERT INTO z_attribute(zaid,name) VALUES (10046,"STEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10046,1003,10046);
INSERT INTO z_attribute(zaid,name) VALUES (10047,"STEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10047,1003,10047);
INSERT INTO z_attribute(zaid,name) VALUES (10048,"STEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10048,1003,10048);
INSERT INTO z_attribute(zaid,name) VALUES (10049,"STEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10049,1003,10049);
INSERT INTO z_attribute(zaid,name) VALUES (10050,"ATEST_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10050,1003,10050);
INSERT INTO z_attribute(zaid,name) VALUES (10051,"ATEST_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10051,1003,10051);
INSERT INTO z_attribute(zaid,name) VALUES (10052,"ATEST_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10052,1003,10052);
INSERT INTO z_attribute(zaid,name) VALUES (10053,"ATEST_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10053,1003,10053);
INSERT INTO z_attribute(zaid,name) VALUES (10054,"ATEST_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10054,1003,10054);
INSERT INTO z_attribute(zaid,name) VALUES (10055,"ATEST_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10055,1003,10055);


/* Reviewlogbuch */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1004,"REVIEWLOGBUCH","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES (1004,"Reviewlog",1004);
INSERT INTO z_attribute(zaid,name) VALUES (10056,"SREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10056,1004,10056);
INSERT INTO z_attribute(zaid,name) VALUES (10057,"SREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10057,1004,10057);
INSERT INTO z_attribute(zaid,name) VALUES (10058,"SREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10058,1004,10058);
INSERT INTO z_attribute(zaid,name) VALUES (10059,"SREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10059,1004,10059);
INSERT INTO z_attribute(zaid,name) VALUES (10060,"SREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10060,1004,10060);
INSERT INTO z_attribute(zaid,name) VALUES (10061,"SREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10061,1004,10061);
INSERT INTO z_attribute(zaid,name) VALUES (10062,"EREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10062,1004,10062);
INSERT INTO z_attribute(zaid,name) VALUES (10063,"EREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10063,1004,10063);
INSERT INTO z_attribute(zaid,name) VALUES (10064,"EREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10064,1004,10064);
INSERT INTO z_attribute(zaid,name) VALUES (10065,"EREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10065,1004,10065);
INSERT INTO z_attribute(zaid,name) VALUES (10066,"EREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10066,1004,10066);
INSERT INTO z_attribute(zaid,name) VALUES (10067,"EREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10067,1004,10067);
INSERT INTO z_attribute(zaid,name) VALUES (10068,"MREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10068,1004,10068);
INSERT INTO z_attribute(zaid,name) VALUES (10069,"MREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10069,1004,10069);
INSERT INTO z_attribute(zaid,name) VALUES (10070,"MREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10070,1004,10070);
INSERT INTO z_attribute(zaid,name) VALUES (10071,"MREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10071,1004,10071);
INSERT INTO z_attribute(zaid,name) VALUES (10072,"MREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10072,1004,10072);
INSERT INTO z_attribute(zaid,name) VALUES (10073,"MREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10073,1004,10073);
INSERT INTO z_attribute(zaid,name) VALUES (10074,"CREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10074,1004,10074);
INSERT INTO z_attribute(zaid,name) VALUES (10075,"CREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10075,1004,10075);
INSERT INTO z_attribute(zaid,name) VALUES (10076,"CREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10076,1004,10076);
INSERT INTO z_attribute(zaid,name) VALUES (10077,"CREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10077,1004,10077);
INSERT INTO z_attribute(zaid,name) VALUES (10078,"CREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10078,1004,10078);
INSERT INTO z_attribute(zaid,name) VALUES (10079,"CREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10079,1004,10079);
INSERT INTO z_attribute(zaid,name) VALUES (10080,"HREVIEW_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10080,1004,10080);
INSERT INTO z_attribute(zaid,name) VALUES (10081,"HREVIEW_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10081,1004,10081);
INSERT INTO z_attribute(zaid,name) VALUES (10082,"HREVIEW_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10082,1004,10082);
INSERT INTO z_attribute(zaid,name) VALUES (10083,"HREVIEW_K_AUFWAND");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10083,1004,10083);
INSERT INTO z_attribute(zaid,name) VALUES (10084,"HREVIEW_K_BEGINN");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10084,1004,10084);
INSERT INTO z_attribute(zaid,name) VALUES (10085,"HREVIEW_K_ENDE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10085,1004,10085);

/* Entwickler */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1005,"ENTWICKLER","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES (1005,"Andreas",1005);
INSERT INTO z_entity(zeid,description,zid) VALUES (1006,"Daniel",1005);
INSERT INTO z_entity(zeid,description,zid) VALUES (1007,"Susanne",1005);

/* jeder Entwickler kann eingestellt sein oder nicht */
INSERT INTO z_attribute(zaid,name) VALUES (10086,"IST_EINGESTELLT");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100351,1005,10086);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100352,1006,10086);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100353,1007,10086);

/* Kosten für Entwickler */
INSERT INTO comprises(compid,zeid,zaid) VALUES (100358,1005,1001);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100359,1006,1001);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100360,1007,1001);



/* Phasen */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1006,"SPEZIFIKATION","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10012,"Specification",1006);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1007,"SYSTEMENTWURF","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10013,"Systemdesign",1007);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1008,"MODULSPEZIFIKATION","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10014,"Moduledesign",1008);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (1009,"CODE","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES (10015,"Code",1009);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10010,"HANDBUCH","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES (10016,"Manuals",10010);

INSERT INTO z_attribute(zaid,name) VALUES (10087,"ANZ_AFP");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10087,10012,10087);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10088,10013,10087);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10089,10014,10087);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10090,10015,10087);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10091,10016,10087);

INSERT INTO z_attribute(zaid,name) VALUES (10088,"ANZ_FEHLER_GES");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10092,10012,10088);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10093,10013,10088);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10094,10014,10088);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10095,10015,10088);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10096,10016,10088);

INSERT INTO z_attribute(zaid,name) VALUES (10089,"PROZENT_AFP_100");
INSERT INTO comprises(compid,zeid,zaid) VALUES (10097,10012,10089);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10098,10013,10089);
INSERT INTO comprises(compid,zeid,zaid) VALUES (10099,10014,10089);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100100,10015,10089);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100101,10016,10089);

INSERT INTO z_attribute(zaid,name) VALUES (10090,"ANZ_AF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100102,10012,10090);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100103,10013,10090);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100104,10014,10090);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100105,10015,10090);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100106,10016,10090);

INSERT INTO z_attribute(zaid,name) VALUES (10091,"ANZ_GF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100107,10013,10091);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100108,10014,10091);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100109,10015,10091);

INSERT INTO z_attribute(zaid,name) VALUES (10092,"ANZ_FF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100110,10014,10092);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100111,10015,10092);

INSERT INTO z_attribute(zaid,name) VALUES (10093,"ANZ_IF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100112,10015,10093);

INSERT INTO z_attribute(zaid,name) VALUES (10094,"FEHLER_PRO_KLOC");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100113,10015,10094);

/* gibt es auch in den Reviewberichten */
/* Vorsicht hier gilt der Wert nur für den Code */
INSERT INTO z_attribute(zaid,name) VALUES (100200,"FEHLER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100350,10015,100200);

INSERT INTO z_attribute(zaid,name) VALUES (10095,"ANZ_HF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100114,10016,10095);

INSERT INTO z_attribute(zaid,name) VALUES (10096,"FEHLER_PRO_SEITE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (1001114,10012,10096);
INSERT INTO comprises(compid,zeid,zaid) VALUES (1001115,10013,10096);
INSERT INTO comprises(compid,zeid,zaid) VALUES (1001116,10014,10096);
INSERT INTO comprises(compid,zeid,zaid) VALUES (1001117,10016,10096);



/* Reviewberichte */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES
(10011,"SPEZIFIKATIONSREVIEWBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10017,"Specificationreviewreport",10011);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES
(10012,"SYSTEMENTWURFSREVIEWBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10018,"Systemdesignreviewreport",10012);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10013,"MODULSPEZREVIEWBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10019,"Moduledesignreviewreport",10013);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10014,"CODEREVIEWBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10020,"Codereviewreport",10014);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10015,"HANDBUCHREVIEWBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10021,"Manualsreviewreport",10015);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10016,"MODULTESTBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10022,"Moduletestreport",10016);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10017,"INTEGRATIONSTESTBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10023,"Integrationtestreport",10017);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10018,"SYSTEMTESTBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10024,"Systemtestreport",10018);

INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10019,"ABNAHMETESTBERICHT","E",2);
INSERT INTO z_entity(zeid,description,zid) VALUES
(10025,"Acceptancetestreport",10019);

INSERT INTO z_attribute(zaid,name) VALUES (10097,"FEHLER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100116,10017,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100117,10018,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100118,10019,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100119,10020,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100120,10021,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100121,10022,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100122,10023,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100123,10024,10097);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100124,10025,10097);

INSERT INTO z_attribute(zaid,name) VALUES (10098,"VERLUSTE");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100125,10017,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100126,100181,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100127,100191,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100128,10020,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100129,10021,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100130,10022,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100131,10023,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100132,10024,10098);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100133,10025,10098);

INSERT INTO z_attribute(zaid,name) VALUES (10099,"NUMMER");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100134,10017,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100135,10018,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100136,10019,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100137,10020,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100138,10021,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100139,10022,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100140,10023,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100141,10024,10099);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100142,10025,10099);


INSERT INTO z_attribute(zaid,name) VALUES (100100,"ANZ_FEHLER_1_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100143,10017,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100144,10018,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100145,10019,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100146,10020,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100147,10021,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100148,10022,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100149,10023,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100150,10024,100100);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100151,10025,100100);

INSERT INTO z_attribute(zaid,name) VALUES (100101,"ANZ_FEHLER_2_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100152,10017,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100153,10018,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100154,10019,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100155,10020,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100156,10021,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100157,10022,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100158,10023,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100159,10024,100101);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100160,10025,100101);

INSERT INTO z_attribute(zaid,name) VALUES (100102,"ANZ_FEHLER_3_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100161,10017,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100162,10018,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100163,10019,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100164,10020,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100165,10021,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100166,10022,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100167,10023,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100168,10024,100102);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100169,10025,100102);

INSERT INTO z_attribute(zaid,name) VALUES (100103,"ANZ_FEHLER_4_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100170,10017,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100171,10018,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100172,10019,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100173,10020,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100174,10021,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100175,10022,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100176,10023,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100177,10024,100103);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100178,10025,100103);

INSERT INTO z_attribute(zaid,name) VALUES (100104,"ANZ_FEHLER_5_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100179,10017,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100180,10018,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100181,10019,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100182,10020,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100183,10021,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100184,10022,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100185,10023,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100186,10024,100104);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100187,10025,100104);

INSERT INTO z_attribute(zaid,name) VALUES (100105,"ANZ_FEHLER_6_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100188,10017,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100189,10018,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100190,10019,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100191,10020,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100192,10021,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100193,10022,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100194,10023,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100195,10024,100105);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100196,10025,100105);


INSERT INTO z_attribute(zaid,name) VALUES (100106,"ANZ_FEHLER_7_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100197,10017,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100198,10018,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100199,10019,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100200,10020,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100201,10021,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100202,10022,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100203,10023,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100204,10024,100106);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100205,10025,100106);

INSERT INTO z_attribute(zaid,name) VALUES (100107,"ANZ_FEHLER_8_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100206,10017,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100207,10018,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100208,10019,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100209,10020,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100210,10021,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100211,10022,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100212,10023,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100213,10024,100107);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100214,10025,100107);

INSERT INTO z_attribute(zaid,name) VALUES (100108,"ANZ_FEHLER_9_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100215,10017,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100216,10018,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100217,10019,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100218,10020,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100219,10021,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100220,10022,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100221,10023,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100222,10024,100108);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100223,10025,100108);

INSERT INTO z_attribute(zaid,name) VALUES (100109,"ANZ_FEHLER_10_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100224,10017,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100225,10018,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100226,10019,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100227,10020,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100228,10021,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100229,10022,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100230,10023,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100231,10024,100109);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100232,10025,100109);

INSERT INTO z_attribute(zaid,name) VALUES (100110,"ANZ_KORR_FEHLER_1_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100233,10017,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100234,10018,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100235,10019,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100236,10020,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100237,10021,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100238,10022,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100239,10023,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100240,10024,100110);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100241,10025,100110);

INSERT INTO z_attribute(zaid,name) VALUES (100111,"ANZ_KORR_FEHLER_2_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100242,10017,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100243,10018,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100244,10019,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100245,10020,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100246,10021,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100247,10022,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100248,10023,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100249,10024,100111);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100250,10025,100111);

INSERT INTO z_attribute(zaid,name) VALUES (100112,"ANZ_KORR_FEHLER_3_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100251,10017,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100252,10018,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100253,10019,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100254,10020,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100255,10021,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100256,10022,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100257,10023,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100258,10024,100112);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100259,10025,100112);

INSERT INTO z_attribute(zaid,name) VALUES (100113,"ANZ_KORR_FEHLER_4_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100260,10017,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100261,10018,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100262,10019,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100263,10020,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100264,10021,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100265,10022,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100266,10023,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100267,10024,100113);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100268,10025,100113);

INSERT INTO z_attribute(zaid,name) VALUES (100114,"ANZ_KORR_FEHLER_5_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100269,10017,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100270,10018,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100271,10019,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100272,10020,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100273,10021,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100274,10022,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100275,10023,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100276,10024,100114);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100277,10025,100114);

INSERT INTO z_attribute(zaid,name) VALUES (100115,"ANZ_KORR_FEHLER_6_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100278,10017,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100279,10018,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100280,10019,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100281,10020,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100282,10021,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100283,10022,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100284,10023,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100285,10024,100115);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100286,10025,100115);

INSERT INTO z_attribute(zaid,name) VALUES (100116,"ANZ_KORR_FEHLER_7_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100287,10017,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100288,10018,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100289,10019,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100290,10020,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100291,10021,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100292,10022,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100293,10023,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100294,10024,100116);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100295,10025,100116);

INSERT INTO z_attribute(zaid,name) VALUES (100117,"ANZ_KORR_FEHLER_8_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100296,10017,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100297,10018,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100298,10019,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100299,10020,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100300,10021,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100301,10022,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100302,10023,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100303,10024,100117);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100304,10025,100117);

INSERT INTO z_attribute(zaid,name) VALUES (100118,"ANZ_KORR_FEHLER_9_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100305,10017,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100306,10018,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100307,10019,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100308,10020,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100309,10021,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100310,10022,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100311,10023,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100312,10024,100118);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100313,10025,100118);

INSERT INTO z_attribute(zaid,name) VALUES (100119,"ANZ_KORR_FEHLER_10_PRF");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100314,10017,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100315,10018,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100316,10019,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100317,10020,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100318,10021,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100319,10022,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100320,10023,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100321,10024,100119);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100322,10025,100119);

INSERT INTO z_attribute(zaid,name) VALUES (100120,"FEHLER_PRO_AFP");
INSERT INTO comprises(compid,zeid,zaid) VALUES (100323,10012,100120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100324,10013,100120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100325,10014,100120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100326,10015,100120);
INSERT INTO comprises(compid,zeid,zaid) VALUES (100327,10016,100120);


/* RELATIONEN */
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10020,"PRODUZIERT","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10021,"INTEGRIERT","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10022,"KORRIGIERT","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10023,"TESTET_MODULE","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10024,"TESTET_SYSTEM","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10025,"BEGUTACHTET","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10026,"NIMMT_AB","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10027,"REVIEW_MIT_KUNDE_FINDET_STATT","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10028,"KORRIGIERT_ALLES","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10029,"SPRICHT_MIT_KUNDE","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10030,"TESTET_INTEGRATION","R",2);
INSERT INTO zarmstype(zid,z_type,EorR,mid) VALUES (10031,"IST_EINGESTELLT","R",2);
