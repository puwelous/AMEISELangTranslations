/* milestone.sql - Skript */
/* Beschreibung: legt die Milestones fest */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */
/* Hinzufügen der Milestones */
/* Achtung es werden nur die Kommandos abgefragt, die vom Client+ weitergegeben werden */
/* soll auch das normale Simulationsfenster verwendet werden, dann müssen entweder */
/* die Milestones um die anderen Befehlsmöglichekeiten erweitert werden, oder */
/* das Dictionary diesbezüglich geändert werden */ /* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger*/
/* Datum: 15.3.2004 */
/* Bugs gefixt: */
/*	1. Uebereinstimmmung zwischen Anfang- und Endmilestones hergestellt */
/*	2. End-Milestone Modulspez auf Projektlogbuch geaendert	*/
/* Norbert (23.02.2005) */
/* Bug gefixt: */
/* 	Aid_Descs auch fuer Tournament-ID=2 erlaubt (damit gibt es dann auch */
/* 	Milestones bei dieser Tournament-ID) */
/*      Norbert (11.07.2005) */
/* Norbert (10.8.2005): Tabelle ms_lang befuellt */

/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (1,300,1,'P',"Beginn Spezifikation","PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_BEGINN","lasse_spezifizieren","Ende Spezifikation");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (2,301,1,'P',"Beginn Systemdesign","PROJEKTLOGBUCH*Projectlog*ENTWURF_BEGINN","lasse_System_entwerfen","Ende Systemdesign");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (3,302,1,'P',"Beginn Modulspez","PROJEKTLOGBUCH*Projectlog*MODSPEZ_BEGINN","lasse_Module_spezifizieren","Ende Modulspez");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (4,303,1,'P',"Beginn Codierung","PROJEKTLOGBUCH*Projectlog*CODE_BEGINN","lasse_codieren","Ende Codierung");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (5,304,1,'P',"Beginn Handbuch","PROJEKTLOGBUCH*Projectlog*HANDBUCH_BEGINN","lasse_Handbuch_erstellen","Ende Handbuch");

/*Endemilestone */

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (6,305,1,'P',"Ende Spezifikation","PROJEKTLOGBUCH*Projectlog*SPEZIFIKATION_ENDE","", "");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (7,306,1,'P',"Ende Systemdesign","PROJEKTLOGBUCH*Projectlog*ENTWURF_ENDE","", "");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (8,307,1,'P',"Ende Modulspez","PROJEKTLOGBUCH*Projectlog*MODSPEZ_ENDE","", "");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (9,308,1,'P',"Ende Codierung","PROJEKTLOGBUCH*Projectlog*CODE_ENDE","", "");
INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) VALUES (10,309,1,'P',"Ende Handbuch","PROJEKTLOGBUCH*Projectlog*HANDBUCH_ENDE","", "");

/*Ressourcenmilestone */

INSERT INTO milestone (msid,aiddid,mid,p_or_r,type_of_ms,z_path,kind,value) VALUES (11,310,1,'R',"20% Ressourcen","PROJEKTZUSTAND*Projectstatus*KOSTEN","Budget",45000);
INSERT INTO milestone (msid,aiddid,mid,p_or_r,type_of_ms,z_path,kind,value) VALUES (12,311,1,'R',"40% Ressourcen","PROJEKTZUSTAND*Projectstatus*KOSTEN","Budget",90000);
INSERT INTO milestone (msid,aiddid,mid,p_or_r,type_of_ms,z_path,kind,value) VALUES (13,312,1,'R',"50% Ressourcen","PROJEKTZUSTAND*Projectstatus*KOSTEN","Budget",112500);
INSERT INTO milestone (msid,aiddid,mid,p_or_r,type_of_ms,z_path,kind,value) VALUES (14,313,1,'R',"75% Ressourcen","PROJEKTZUSTAND*Projectstatus*KOSTEN","Budget",168750);
INSERT INTO milestone (msid,aiddid,mid,p_or_r,type_of_ms,z_path,kind,value) VALUES (15,314,1,'R',"100% Ressourcen","PROJEKTZUSTAND*Projectstatus*KOSTEN","Budget",225000);

/*Rollback Beginn Milestone*/

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (16,315,1,'P',"ROLLBACK Beginn Handbuch","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_HANDBUCH","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (17,316,1,'P',"ROLLBACK Beginn Spezifikation","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_SPEZIFIKATION","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (18,317,1,'P',"ROLLBACK Beginn Modulspez","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_MODULSPEZ","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (19,318,1,'P',"ROLLBACK Beginn Codierung","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_CODIERUNG","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (20,319,1,'P',"ROLLBACK Beginn Systemdesign","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_SYSTEMDESIGN","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (25,321,1,'P',"ROLLBACK Beginn Wartung","PROJEKTLOGBUCH*Projectlog*ROLLBACK_BEGINN_WARTUNG","", "");

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms) 
VALUES (21,320,1,'P',"ROLLBACK","","", "");

INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (300,"Beginn Spezifikation",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (301,"Beginn Systemdesign",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (302,"Beginn Modulspez",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (303,"Beginn Codierung",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (304,"Beginn Handbuch",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (305,"Ende Spezifikation",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (306,"Ende Systemdesign",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (307,"Ende Modulspez",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (308,"Ende Codierung",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (309,"Ende Handbuch",1,4);

INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (310,"20% Ressourcen",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (311,"40% Ressourcen",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (312,"50% Ressourcen",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (313,"75% Ressourcen",1,4);
INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (314,"100% Ressourcen",1,4);

INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,300);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,301);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,302);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,303);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,304);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,305);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,306);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,307);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,308);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,309);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,310);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,311);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,312);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,313);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,314);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,300);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,301);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,302);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,303);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,304);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,305);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,306);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,307);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,308);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,309);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,310);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,311);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,312);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,313);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,314);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (1,"Beginn Spezifikation","de",1);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (2,"Beginn Systemdesign","de",2);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (3,"Beginn Modulspezifikation","de",3);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (4,"Beginn Codierung","de",4);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (5,"Beginn Handbuch","de",5);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (6,"Ende Spezifikation","de",6);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (7,"Ende Systemdesign","de",7);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (8,"Ende Modulspezifikation","de",8);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (9,"Ende Codierung","de",9);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (10,"Ende Handbuch","de",10);

INSERT INTO ms_lang (mslangid,text,language,msid) 
VALUES (11,"20 Prozent der Kosten erreicht","de",11);
INSERT INTO ms_lang (mslangid,text,language,msid) 
VALUES (12,"40 Prozent der Kosten erreicht","de",12);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (13,"50 Prozent der Kosten erreicht","de",13);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (14,"75 Prozent der Kosten erreicht","de",14);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (15,"100 Prozent der Kosten erreicht","de",15);


INSERT INTO ms_lang (mslangid,text,language,msid)
VALUES (101,"Begin of specification","en",1);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (102,"Begin of system design","en",2);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (103,"Begin of module design","en",3);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (104,"Begin of implementation","en",4);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (105,"Begin of writing manual","en",5);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (106,"End of specification","en",6);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (107,"End of system design","en",7);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (108,"End of module specification","en",8);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (109,"End of implementation","en",9);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (110,"End of writing manual","en",10);


INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (111,"20 percent of resources spent","en",11);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (112,"40 percent of resources spent","en",12);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (113,"50 percent of resources spent","en",13);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (114,"75 percent of resources spent","en",14);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (115,"100 percent of resources spent","en",15);


INSERT INTO aid_desc_lang (did,description,language,aiddid) 
VALUES (1001,"Beginn Spezifikation","de",300);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1002,"Beginn Systemdesign","de",301);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1003,"Beginn Modulspezifikation","de",302);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1004,"Beginn Codierung","de",303);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1005,"Beginn Handbuch","de",304);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1006,"Ende Spezifikation","de",305);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1007,"Ende Systemdesign","de",306);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1008,"Ende Modulspezifikation","de",307);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1009,"Ende Codierung","de",308);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1010,"Ende Handbuch","de",309);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1011,"20 Prozent der Kosten erreicht","de",310);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1012,"40 Prozent der Kosten erreicht","de",311);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1013,"50 Prozent der Kosten erreicht","de",312);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1014,"75 Prozent der Kosten erreicht","de",313);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1015,"100 Prozent der Kosten erreicht","de",314);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1101,"Begin of specification","en",300);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1102,"Begin of system design","en",301);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1103,"Begin of module design","en",302);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1104,"Begin of implementation","en",303);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1105,"Begin of writing manual","en",304);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1106,"End of specification","en",305);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1107,"End of system design","en",306);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1108,"End of module specification","en",307);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1109,"End of implementation","en",308);
INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1110,"End of writing manual","en",309);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1111,"20 percent of resources spent","en",310);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1112,"40 percent of resources spent","en",311);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1113,"50 percent of resources spent","en",312);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1114,"75 percent of resources spent","en",313);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1115,"100 percent of resources spent","en",314);


/***************uebergebe an kunden ****************/

INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (323,"Beginn Wartung",1,4);

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms,action) VALUES (23,323,1,'P',"Beginn Wartung","PROJEKTZUSTAND*Projectstatus*PROJEKTENDE","uebergib_System_an_Kunden","Ende Wartung","update game set progress='F' where game.gid=?");

INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,323);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,323);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (118,"Beginn Wartung","de",23);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (119,"Begin of maintenance","en",23);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1118,"Beginn Wartung","de",323);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1119,"Begin of maintenance","en",323);

/*********** finished Project ***************/


INSERT INTO aid_description(aiddid,description,mid,kaidid) VALUES (324,"Beginn Wartung",1,4);

INSERT INTO milestone(msid,aiddid,mid,p_or_r,type_of_ms,z_path,command,phase_end_ms,action) VALUES (24,324,1,'P',"Beginn Wartung","PROJEKTZUSTAND*Projectstatus*PROJEKTENDE","beende_Projekt","Ende Wartung","update game set progress='F' where game.gid=?");

INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (1,324);
INSERT INTO t_allows_aiddesc(tid,aiddid) VALUES (2,324);

INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (120,"Beginn Wartung","de",24);
INSERT INTO ms_lang (mslangid,text,language,msid) VALUES (121,"Begin of maintenance","en",24);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1122,"Beginn Wartung","de",324);

INSERT INTO aid_desc_lang (did,description,language,aiddid) VALUES (1121,"Begin of maintenance","en",324);