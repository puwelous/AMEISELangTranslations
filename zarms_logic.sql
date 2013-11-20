/* Tabelle der relevanten ZARMS-Daten sowie deren Logik */
/* Autor: Susanne Jäger */
/* Mai 2005 */

/* Changelog: */
/* (nz) 09.02.2006 Beginn des Integrationstests hinzugefuegt */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

/* Entitäten */
/* Projektzustand */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*KOSTEN','PROJEKTZUSTAND*Projectstatus*KOSTEN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*KOSTEN_PRO_MM','PROJEKTZUSTAND*Projectstatus*KOSTEN_PRO_MM', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*PROJEKTBEGINN','PROJEKTZUSTAND*Projectstatus*PROJEKTBEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*PROJEKTENDE','PROJEKTZUSTAND*Projectstatus*PROJEKTENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_PHASEN',1,'PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_SPEZI', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_PHASEN',2,'PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_ENTWURF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_PHASEN',3,'PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_CODE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_PHASEN',4,'PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_TEST', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_PHASEN',5,'PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_HANDBUCH', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_SPEZIFIKATIONSPHASE','PROJEKTZUSTAND*Projectstatus*AUFWAND_SPEZIFIKATIONSPHASE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_ENTWURFSPHASE','PROJEKTZUSTAND*Projectstatus*AUFWAND_ENTWURFSPHASE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_CODIERUNGSPHASE','PROJEKTZUSTAND*Projectstatus*AUFWAND_CODIERUNGSPHASE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_TESTPHASE','PROJEKTZUSTAND*Projectstatus*AUFWAND_TESTPHASE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_HANDBUCHERSTELLUNG','PROJEKTZUSTAND*Projectstatus*AUFWAND_HANDBUCHERSTELLUNG', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_REVIEWS','PROJEKTZUSTAND*Projectstatus*AUFWAND_REVIEWS', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_TESTS','PROJEKTZUSTAND*Projectstatus*AUFWAND_TESTS', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_KORREKTUR_REVIEWS','PROJEKTZUSTAND*Projectstatus*AUFWAND_KORREKTUR_REVIEWS', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*AUFWAND_KORREKTUR_TESTS','PROJEKTZUSTAND*Projectstatus*AUFWAND_KORREKTUR_TESTS', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*ANZAHL_ABNAHMETESTS','PROJEKTZUSTAND*Projectstatus*ANZAHL_ABNAHMETESTS', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*PROJEKT_IST_BEENDET','PROJEKTZUSTAND*Projectstatus*PROJEKT_IST_BEENDET', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTZUSTAND*Projectstatus*PROZENT_DAUER_ZV','PROJEKTZUSTAND*Projectstatus*PROZENT_DAUER_ZV', 'E', 'I');

/* Projektlogbuch */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_BEGINN','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*ENTWURF_BEGINN','PROJEKTLOGBUCH*Projectlog*ENTWURF_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*ENTWURF_ENDE','PROJEKTLOGBUCH*Projectlog*ENTWURF_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*MODSPEZ_BEGINN','PROJEKTLOGBUCH*Projectlog*MODSPEZ_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE','PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*CODE_BEGINN','PROJEKTLOGBUCH*Projectlog*CODE_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*CODE_ENDE','PROJEKTLOGBUCH*Projectlog*CODE_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*INTEGRATION_BEGINN','PROJEKTLOGBUCH*Projectlog*INTEGRATION_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*INTEGRATION_ENDE','PROJEKTLOGBUCH*Projectlog*INTEGRATION_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*HANDBUCH_BEGINN','PROJEKTLOGBUCH*Projectlog*HANDBUCH_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*HANDBUCH_ENDE','PROJEKTLOGBUCH*Projectlog*HANDBUCH_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_AUFWAND','PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*ENTWURF_AUFWAND','PROJEKTLOGBUCH*Projectlog*ENTWURF_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*MODSPEZ_AUFWAND','PROJEKTLOGBUCH*Projectlog*MODSPEZ_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*CODE_AUFWAND','PROJEKTLOGBUCH*Projectlog*CODE_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*INTEGRATION_AUFWAND','PROJEKTLOGBUCH*Projectlog*INTEGRATION_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','PROJEKTLOGBUCH*Projectlog*HANDBUCH_AUFWAND','PROJEKTLOGBUCH*Projectlog*HANDBUCH_AUFWAND', 'E', 'I');

/* Testlogbuch */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_AUFWAND','TESTLOGBUCH*Testlog*MTEST_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_BEGINN','TESTLOGBUCH*Testlog*MTEST_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_ENDE','TESTLOGBUCH*Testlog*MTEST_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_K_AUFWAND','TESTLOGBUCH*Testlog*MTEST_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_K_BEGINN','TESTLOGBUCH*Testlog*MTEST_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*MTEST_K_ENDE','TESTLOGBUCH*Testlog*MTEST_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_AUFWAND','TESTLOGBUCH*Testlog*ITEST_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_BEGINN','TESTLOGBUCH*Testlog*ITEST_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_ENDE','TESTLOGBUCH*Testlog*ITEST_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_K_AUFWAND','TESTLOGBUCH*Testlog*ITEST_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_K_BEGINN','TESTLOGBUCH*Testlog*ITEST_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ITEST_K_ENDE','TESTLOGBUCH*Testlog*ITEST_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_AUFWAND','TESTLOGBUCH*Testlog*STEST_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_BEGINN','TESTLOGBUCH*Testlog*STEST_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_ENDE','TESTLOGBUCH*Testlog*STEST_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_K_AUFWAND','TESTLOGBUCH*Testlog*STEST_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_K_BEGINN','TESTLOGBUCH*Testlog*STEST_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*STEST_K_ENDE','TESTLOGBUCH*Testlog*STEST_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_AUFWAND','TESTLOGBUCH*Testlog*ATEST_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_BEGINN','TESTLOGBUCH*Testlog*ATEST_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_ENDE','TESTLOGBUCH*Testlog*ATEST_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_K_AUFWAND','TESTLOGBUCH*Testlog*ATEST_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_K_BEGINN','TESTLOGBUCH*Testlog*ATEST_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','TESTLOGBUCH*Testlog*ATEST_K_ENDE','TESTLOGBUCH*Testlog*ATEST_K_ENDE', 'E', 'I');

/* Reviewlogbuch */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_AUFWAND','REVIEWLOGBUCH*Reviewlog*SREVIEW_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_BEGINN','REVIEWLOGBUCH*Reviewlog*SREVIEW_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_ENDE','REVIEWLOGBUCH*Reviewlog*SREVIEW_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_AUFWAND','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_BEGINN','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_ENDE','REVIEWLOGBUCH*Reviewlog*SREVIEW_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_AUFWAND','REVIEWLOGBUCH*Reviewlog*EREVIEW_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_BEGINN','REVIEWLOGBUCH*Reviewlog*EREVIEW_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_ENDE','REVIEWLOGBUCH*Reviewlog*EREVIEW_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_AUFWAND','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_BEGINN','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_ENDE','REVIEWLOGBUCH*Reviewlog*EREVIEW_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_AUFWAND','REVIEWLOGBUCH*Reviewlog*MREVIEW_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_BEGINN','REVIEWLOGBUCH*Reviewlog*MREVIEW_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_ENDE','REVIEWLOGBUCH*Reviewlog*MREVIEW_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_AUFWAND','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_BEGINN','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_ENDE','REVIEWLOGBUCH*Reviewlog*MREVIEW_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_AUFWAND','REVIEWLOGBUCH*Reviewlog*CREVIEW_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_BEGINN','REVIEWLOGBUCH*Reviewlog*CREVIEW_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_ENDE','REVIEWLOGBUCH*Reviewlog*CREVIEW_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_AUFWAND','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_BEGINN','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_ENDE','REVIEWLOGBUCH*Reviewlog*CREVIEW_K_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_AUFWAND','REVIEWLOGBUCH*Reviewlog*HREVIEW_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_BEGINN','REVIEWLOGBUCH*Reviewlog*HREVIEW_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_ENDE','REVIEWLOGBUCH*Reviewlog*HREVIEW_ENDE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_AUFWAND','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_AUFWAND', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_BEGINN','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_BEGINN', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_ENDE','REVIEWLOGBUCH*Reviewlog*HREVIEW_K_ENDE', 'E', 'I');

/* Entwickler */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Axel*IST_EINGESTELLT','ENTWICKLER*Axel*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Axel*KOSTEN','ENTWICKLER*Axel*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Bernd*IST_EINGESTELLT','ENTWICKLER*Bernd*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Bernd*KOSTEN','ENTWICKLER*Bernd*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Christine*IST_EINGESTELLT','ENTWICKLER*Christine*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Christine*KOSTEN','ENTWICKLER*Christine*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Diana*IST_EINGESTELLT','ENTWICKLER*Diana*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Diana*KOSTEN','ENTWICKLER*Diana*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Richard*IST_EINGESTELLT','ENTWICKLER*Richard*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Richard*KOSTEN','ENTWICKLER*Richard*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Stefanie*IST_EINGESTELLT','ENTWICKLER*Stefanie*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Stefanie*KOSTEN','ENTWICKLER*Stefanie*KOSTEN', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Thomas*IST_EINGESTELLT','ENTWICKLER*Thomas*IST_EINGESTELLT', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ENTWICKLER*Thomas*KOSTEN','ENTWICKLER*Thomas*KOSTEN', 'E', 'I');

/* Phasen */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*ANZ_AFP','SPEZIFIKATION*Specification*ANZ_AFP', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*ANZ_FEHLER_GES','SPEZIFIKATION*Specification*ANZ_FEHLER_GES', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*PROZENT_AFP_100','SPEZIFIKATION*Specification*PROZENT_AFP_100', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*ANZ_AF','SPEZIFIKATION*Specification*ANZ_AF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*FEHLER_PRO_SEITE','SPEZIFIKATION*Specification*FEHLER_PRO_SEITE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATION*Specification*FEHLER_PRO_AFP','SPEZIFIKATION*Specification*FEHLER_PRO_AFP', 'E', 'I');


INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*ANZ_AFP','SYSTEMENTWURF*Systemdesign*ANZ_AFP', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*ANZ_FEHLER_GES','SYSTEMENTWURF*Systemdesign*ANZ_FEHLER_GES', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*PROZENT_AFP_100','SYSTEMENTWURF*Systemdesign*PROZENT_AFP_100', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*ANZ_AF','SYSTEMENTWURF*Systemdesign*ANZ_AF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*ANZ_GF','SYSTEMENTWURF*Systemdesign*ANZ_GF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*FEHLER_PRO_SEITE','SYSTEMENTWURF*Systemdesign*FEHLER_PRO_SEITE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURF*Systemdesign*FEHLER_PRO_AFP','SYSTEMENTWURF*Systemdesign*FEHLER_PRO_AFP', 'E', 'I');


INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*ANZ_AFP','MODULSPEZIFIKATION*Moduledesign*ANZ_AFP', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*ANZ_FEHLER_GES','MODULSPEZIFIKATION*Moduledesign*ANZ_FEHLER_GES', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*PROZENT_AFP_100','MODULSPEZIFIKATION*Moduledesign*PROZENT_AFP_100', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*ANZ_AF','MODULSPEZIFIKATION*Moduledesign*ANZ_AF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*ANZ_GF','MODULSPEZIFIKATION*Moduledesign*ANZ_GF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*ANZ_FF','MODULSPEZIFIKATION*Moduledesign*ANZ_FF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*FEHLER_PRO_SEITE','MODULSPEZIFIKATION*Moduledesign*FEHLER_PRO_SEITE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZIFIKATION*Moduledesign*FEHLER_PRO_AFP','MODULSPEZIFIKATION*Moduledesign*FEHLER_PRO_AFP', 'E', 'I');


INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_AFP','CODE*Code*ANZ_AFP', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_FEHLER_GES','CODE*Code*ANZ_FEHLER_GES', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*PROZENT_AFP_100','CODE*Code*PROZENT_AFP_100', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_AF','CODE*Code*ANZ_AF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_GF','CODE*Code*ANZ_GF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_FF','CODE*Code*ANZ_FF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*ANZ_IF','CODE*Code*ANZ_IF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*FEHLER_PRO_KLOC','CODE*Code*FEHLER_PRO_KLOC', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*FEHLER','CODE*Code*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODE*Code*FEHLER_PRO_AFP','CODE*Code*FEHLER_PRO_AFP', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*ANZ_AFP','HANDBUCH*Manuals*ANZ_AFP', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*ANZ_FEHLER_GES','HANDBUCH*Manuals*ANZ_FEHLER_GES', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*PROZENT_AFP_100','HANDBUCH*Manuals*PROZENT_AFP_100', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*ANZ_AF','HANDBUCH*Manuals*ANZ_AF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*ANZ_HF','HANDBUCH*Manuals*ANZ_HF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*FEHLER_PRO_SEITE','HANDBUCH*Manuals*FEHLER_PRO_SEITE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCH*Manuals*FEHLER_PRO_AFP','HANDBUCH*Manuals*FEHLER_PRO_AFP', 'E', 'I');



/* Reviewberichte */ 
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*FEHLER','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*VERLUSTE','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*NUMMER','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',1,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',2,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',3,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',4,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',5,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',6,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',7,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',8,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',9,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_PRO_PRF',10,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',1,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',2,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',3,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',4,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',5,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',6,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',7,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',8,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',9,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_PRO_PRF',10,'SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*VERLUSTE','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*NUMMER','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',1,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',2,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',3,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',4,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',5,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',6,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',7,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',8,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',9,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_PRO_PRF',10,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',1,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',2,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',3,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',4,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',5,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',6,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',7,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',8,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',9,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',10,'SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*FEHLER','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*VERLUSTE','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*NUMMER','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',1,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',2,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',3,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',4,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',5,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',6,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',7,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',8,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',9,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_PRO_PRF',10,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',1,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',2,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',3,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',4,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',5,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',6,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',7,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',8,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',9,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_PRO_PRF',10,'MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODEREVIEWBERICHT*Codereviewreport*FEHLER','CODEREVIEWBERICHT*Codereviewreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODEREVIEWBERICHT*Codereviewreport*VERLUSTE','CODEREVIEWBERICHT*Codereviewreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','CODEREVIEWBERICHT*Codereviewreport*NUMMER','CODEREVIEWBERICHT*Codereviewreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',1,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',2,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',3,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',4,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',5,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',6,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',7,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',8,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',9,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_PRO_PRF',10,'CODEREVIEWBERICHT*Codereviewreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',1,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',2,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',3,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',4,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',5,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',6,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',7,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',8,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',9,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_PRO_PRF',10,'CODEREVIEWBERICHT*Codereviewreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCHREVIEWBERICHT*Manualsreviewreport*FEHLER','HANDBUCHREVIEWBERICHT*Manualsreviewreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCHREVIEWBERICHT*Manualsreviewreport*VERLUSTE','HANDBUCHREVIEWBERICHT*Manualsreviewreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','HANDBUCHREVIEWBERICHT*Manualsreviewreport*NUMMER','HANDBUCHREVIEWBERICHT*Manualsreviewreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',1,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',2,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',3,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',4,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',5,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',6,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',7,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',8,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',9,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_PRO_PRF',10,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',1,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',2,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',3,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',4,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',5,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',6,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',7,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',8,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',9,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_PRO_PRF',10,'HANDBUCHREVIEWBERICHT*Manualsreviewreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULTESTBERICHT*Moduletestreport*FEHLER','MODULTESTBERICHT*Moduletestreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULTESTBERICHT*Moduletestreport*VERLUSTE','MODULTESTBERICHT*Moduletestreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','MODULTESTBERICHT*Moduletestreport*NUMMER','MODULTESTBERICHT*Moduletestreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',1,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',2,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',3,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',4,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',5,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',6,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',7,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',8,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',9,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_PRO_PRF',10,'MODULTESTBERICHT*Moduletestreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',1,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',2,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',3,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',4,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',5,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',6,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',7,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',8,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',9,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_PRO_PRF',10,'MODULTESTBERICHT*Moduletestreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','INTEGRATIONSTESTBERICHT*Integrationtestreport*FEHLER','INTEGRATIONSTESTBERICHT*Integrationtestreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','INTEGRATIONSTESTBERICHT*Integrationtestreport*VERLUSTE','INTEGRATIONSTESTBERICHT*Integrationtestreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','INTEGRATIONSTESTBERICHT*Integrationtestreport*NUMMER','INTEGRATIONSTESTBERICHT*Integrationtestreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',1,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',2,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',3,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',4,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',5,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',6,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',7,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',8,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',9,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_PRO_PRF',10,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',1,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',2,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',3,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',4,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',5,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',6,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',7,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',8,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',9,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_PRO_PRF',10,'INTEGRATIONSTESTBERICHT*Integrationtestreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

select count(zlid) as "Integ.test" from zarms_logic;

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMTESTBERICHT*Systemtestreport*FEHLER','SYSTEMTESTBERICHT*Systemtestreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMTESTBERICHT*Systemtestreport*VERLUSTE','SYSTEMTESTBERICHT*Systemtestreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','SYSTEMTESTBERICHT*Systemtestreport*NUMMER','SYSTEMTESTBERICHT*Systemtestreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',1,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',2,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',3,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',4,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',5,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',6,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',7,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',8,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',9,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_PRO_PRF',10,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',1,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',2,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',3,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',4,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',5,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',6,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',7,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',8,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',9,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_PRO_PRF',10,'SYSTEMTESTBERICHT*Systemtestreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ABNAHMETESTBERICHT*Acceptancetestreport*FEHLER','ABNAHMETESTBERICHT*Acceptancetestreport*FEHLER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ABNAHMETESTBERICHT*Acceptancetestreport*VERLUSTE','ABNAHMETESTBERICHT*Acceptancetestreport*VERLUSTE', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'E','V','ABNAHMETESTBERICHT*Acceptancetestreport*NUMMER','ABNAHMETESTBERICHT*Acceptancetestreport*NUMMER', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',1,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',2,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',3,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',4,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',5,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',6,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',7,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',8,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',9,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_PRO_PRF',10,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_FEHLER_10_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',1,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_1_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',2,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_2_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',3,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_3_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',4,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_4_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',5,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_5_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',6,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_6_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',7,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_7_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',8,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_8_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',9,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_9_PRF', 'E', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,position,ameise_path,EorR,action) VALUES (1,'E','A','ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_PRO_PRF',10,'ABNAHMETESTBERICHT*Acceptancetestreport*ANZ_KORR_FEHLER_10_PRF', 'E', 'I');



/* Relationen */

/* RELATIONEN */

/* speichere das Datum in folgenden Fällen ab: */
/* Entwickler eingestellt - entlassen 
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','ENTWICKLER_WURDE_EINGESTELLT (%ENTWICKLER)', 'EINGESTELLT*person=%ENTWICKLER*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','ENTWICKLER_WURDE_ENTLASSEN (%ENTWICKLER)', 'EINGESTELLT*person=%ENTWICKLER*completion_date','R','U');
*/

/* Entwickler spricht mit Kunden */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MIT_KUNDE_ZU_SPRECHEN (%ENTWICKLER)', 'SPRICHT_MIT_KUNDE*person=%ENTWICKLER*customer=1*starting_date','R', 'I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MIT_KUNDE_ZU_SPRECHEN (%ENTWICKLER)', 'SPRICHT_MIT_KUNDE*person=%ENTWICKLER*customer=1*completion_date','R','U');

/* Spezifikation erstellen */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ZU_SPEZIFIZIEREN (%ENTWICKLER)','PRODUZIERT*person=%ENTWICKLER*document=Spezifikation*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ZU_SPEZIFIZIEREN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Spezifikation*completion_date','R','U');

/* Spezifikation korrigieren */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_SPEZIFIKATION_ZU_KORRIGIEREN (%ENTWICKLER)','KORRIGIERT*person=%ENTWICKLER*document=Spezifikation*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_SPEZIFIKATION_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Spezifikation*completion_date','R','U');

/* Handbuch erstellen */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_HANDBUCH_ZU_SCHREIBEN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Manual*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_HANDBUCH_ZU_SCHREIBEN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Manual*completion_date','R','U');

/* Handbuch korrigieren */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_HANDBUCH_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Manual*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_HANDBUCH_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Manual*completion_date','R','U');

/* Systemdesign erstellen */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_SYSTEM_ZU_ENTWERFEN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Systemdesign*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_SYSTEM_ZU_ENTWERFEN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Systemdesign*completion_date','R','U');

/* Systemdesign korrigieren */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_SYSTEMENTWURF_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Systemdesign*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_SYSTEMENTWURF_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Systemdesign*completion_date','R','U');

/* Moduldesign erstellen */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MODULE_ZU_SPEZIFIZIEREN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Moduldesign*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MODULE_ZU_SPEZIFIZIEREN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Moduldesign*completion_date','R','U');

/* Moduldesign korrigieren */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MODULSPEZ_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Moduldesign*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MODULSPEZ_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Moduldesign*completion_date','R','U');

/* Code erstellen */
/* ..... BEGONNEN_CODE_ZU_KORRIGIEREN */
/* ..... AUFGEHOERT_CODE_ZU_KORRIGIEREN */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ZU_CODIEREN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Code*starting_date','R','I' );
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ZU_CODIEREN (%ENTWICKLER)', 'PRODUZIERT*person=%ENTWICKLER*document=Code*completion_date','R','U' );

/* Code korrigieren aufgrund des Referenzdokuments*/
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_CODE_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_CODE_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT*person=%ENTWICKLER*document=Code*completion_date','R','U');


/* Alle Dokumente korrigieren aufgrund des Referenzdokuments*/
/* ..... BEGONNEN_ALLES_ZU_KORRIGIEREN(*) */
/* ..... AUFGEHOERT_ALLES_ZU_KORRIGIEREN(*) */
/* aufgrund welches reference-doks geht hier verloren */
/* INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ALLES_ZU_KORRIGIEREN (%ENTWICKLER,%Report)','KORRIGIERT_ALLES*person=%ENTWICKLER*reference_doc=%Report*starting_date','R','I'); */
/* INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ALLES_ZU_KORRIGIEREN (%ENTWICKLER,%Report)', 'KORRIGIERT_ALLES*person=%ENTWICKLER*reference_doc=%Report*completion_date','R','U'); */

INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ALLES_ZU_KORRIGIEREN (%ENTWICKLER)','KORRIGIERT_ALLES*person=%ENTWICKLER*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ALLES_ZU_KORRIGIEREN (%ENTWICKLER)', 'KORRIGIERT_ALLES*person=%ENTWICKLER*completion_date','R','U');

/* Begutachten von Dokumenten */
/* ..... LASSE_REVIEWS_STATTFINDEN(Systemdesign,*,*) */
/* INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ALLES_ZU_KORRIGIEREN (%ENTWICKLER,%DOKUMENT)', 'KORRIGIERT*person=%ENTWICKLER*documten=%DOKUMENT*starting_date','R','I'); */
/* INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ALLES_ZU_KORRIGIEREN (%ENTWICKLER,%DOKUMENT)', 'KORRIGIERT*person=%ENTWICKLER*documten=%DOKUMENT*completion_date','R','U'); */

/* integrieren des codes  */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_ZU_INTEGRIEREN (%ENTWICKLER)', 'INTEGRIERT*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_ZU_INTEGRIEREN (%ENTWICKLER)', 'INTEGRIERT*person=%ENTWICKLER*document=Code*completion_date','R','U');

/* testet module  */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MIT_MODULTEST (%ENTWICKLER)', 'TESTET_MODULE*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MIT_MODULTEST (%ENTWICKLER)', 'TESTET_MODULE*person=%ENTWICKLER*document=Code*completion_date','R','U');

/* testet system  */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MIT_SYSTEMTEST (%ENTWICKLER)', 'TESTET_SYSTEM*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MIT_SYSTEMTEST (%ENTWICKLER)', 'TESTET_SYSTEM*person=%ENTWICKLER*document=Code*completion_date','R','U');

/* teste integration */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_MIT_INTEGRATIONSTEST (%ENTWICKLER)', 'TESTET_INTEGRATION*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_MIT_INTEGRATIONSTEST (%ENTWICKLER)', 'TESTET_INTEGRATION*person=%ENTWICKLER*document=Code*completion_date','R','U');

/* nimmt system ab  */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_SYSTEM_ABZUNEHMEN (%ENTWICKLER)', 'NIMMT_AB*person=%ENTWICKLER*document=Code*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_SYSTEM_ABZUNEHMEN (%ENTWICKLER)', 'NIMMT_AB*person=%ENTWICKLER*document=Code*completion_date','R','U');


/* begutachten */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_DOKUMENT_ZU_BEGUTACHTEN (%ENTWICKLER,%DOKUMENT)', 'BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_DOKUMENT_ZU_BEGUTACHTEN (%ENTWICKLER,%DOKUMENT)', 'BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*completion_date','R','U');

/* begutachten Kunde*/
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','BEGONNEN_DOKUMENT_MIT_KUNDE_ZU_BEGUTACHTEN (%ENTWICKLER,%DOKUMENT)', 'BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*customer=1*starting_date','R','I');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','AUFGEHOERT_DOKUMENT_MIT_KUNDE_ZU_BEGUTACHTEN (%ENTWICKLER,%DOKUMENT)', 'BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*completion_date','R','U');


/* Begutachten von Dokumenten mit dem Kunden */
/* Achtung! %Entwickler kommt zwei mal vor - in der Ameise gibt es aber nur einen Eintrag in s_Relation pro Entwickler d.h. */
/* Ein ZARMS-Eintrag muss auf zwei AMEISE-Einträge gemappt werden */
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','LASSE_SPEZREVIEWS_MIT_KUNDE_STATTFINDEN(%ENTWICKLER, %ENTWICKLER)','BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*customer','R','U');
INSERT INTO zarms_logic(mid,source,datatype,l_path,ameise_path,EorR,action) VALUES (1,'F','D','LASSE_HANDBUCHREVIEWS_MIT_KUNDE_STATTFINDEN (%ENTWICKLER, %ENTWICKLER)','BEGUTACHTET*person=%ENTWICKLER*document=%DOKUMENT*customer','R','U'); 
















