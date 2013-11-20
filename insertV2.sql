/* insert.sql - Skript */
/* Beschreibung: legt die Benutzer/Turniere/Spiele an */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */ 
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */
/* Modified: (ab) 5.5.06, Added Courses for Heidelberg and Aachen */

/* Uni Heidelberg SWE - SW Engineering II*/
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (11,'swe_01','unih_1','SEH','user1',"",'100001',"swe01","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (12,'swe_02','unih_2','SEH','user2',"",'100002',"swe02","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (13,'swe_03','unih_3','SEH','user3',"",'100003',"swe03","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (14,'swe_04','unih_4','SEH','user4',"",'100004',"swe04","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (15,'swe_05','unih_5','SEH','user5',"",'100005',"swe05","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (16,'swe_06','unih_6','SEH','user6',"",'100006',"swe06","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (17,'swe_07','unih_7','SEH','user7',"",'100007',"swe07","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (18,'swe_08','unih_8','SEH','user8',"",'100008',"swe08","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (19,'swe_09','unih_9','SEH','user9',"",'100009',"swe09","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (20,'swe_10','unih_10','SEH','user10',"",'100010',"swe10","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (21,'swe_11','unih_11','SEH','user11',"",'100011',"swe11","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (22,'swe_12','unih_12','SEH','user12',"",'100012',"swe12","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (23,'swe_13','unih_13','SEH','user13',"",'100013',"swe13","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (24,'swe_14','unih_14','SEH','user14',"",'100014',"swe14","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (25,'swe_15','unih_15','SEH','user15',"",'100015',"swe15","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (26,'swe_16','unih_16','SEH','user16',"",'100016',"swe16","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (27,'swe_17','unih_17','SEH','user17',"",'100017',"swe17","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (28,'swe_18','unih_18','SEH','user18',"",'100018',"swe18","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (29,'swe_19','unih_19','SEH','user19',"",'100019',"swe19","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (30,'swe_20','unih_20','SEH','user20',"",'100020',"swe20","de");

/* SEP 06 Uni Klagenfurt */

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (31,'msp_1','sep_1','SEP','user1',"",'200001',"msp 1","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (32,'msp_2','sep_2','SEP','user2',"",'200002',"msp 2","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (33,'msp_3','sep_3','SEP','user3',"",'200003',"msp 3","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (34,'msp_4','sep_4','SEP','user4',"",'200004',"msp 4","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (35,'msp_5','sep_5','SEP','user5',"",'200005',"msp 5","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (36,'msp_6','sep_6','SEP','user6',"",'200006',"msp 6","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (37,'msp_7','sep_7','SEP','user7',"",'200007',"msp 7","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (38,'msp_8','sep_8','SEP','user8',"",'200008',"msp 8","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (39,'msp_9','sep_9','SEP','user9',"",'200009',"msp 9","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (40,'msp_10','sep_10','SEP','user10',"",'200010',"msp 10","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (41,'msp_11','sep_11','SEP','user11',"",'200011',"msp 11","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (42,'msp_12','sep_12','SEP','user12',"",'200012',"msp 12","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (43,'msp_13','sep_13','SEP','user13',"",'200013',"msp 13","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (44,'msp_14','sep_14','SEP','user14',"",'200014',"msp 14","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (45,'msp_15','sep_15','SEP','user15',"",'200015',"msp 15","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (46,'msp_16','sep_16','SEP','user16',"",'300006',"msp 16","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (47,'msp_17','sep_17','SEP','user17',"",'300007',"msp 17","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (48,'msp_18','sep_18','SEP','user18',"",'300008',"msp 18","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (49,'msp_19','sep_19','SEP','user19',"",'300009',"msp 19","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (50,'msp_20','sep_20','SEP','user20',"",'300010',"msp 20","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (51,'msp_21','sep_21','SEP','user21',"",'300011',"msp 21","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (52,'msp_22','sep_22','SEP','user22',"",'300012',"msp 22","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (53,'msp_23','sep_23','SEP','user23',"",'300013',"msp 23","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (54,'msp_24','sep_24','SEP','user24',"",'300014',"msp 24","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (55,'msp_25','sep_25','SEP','user25',"",'300015',"msp 25","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (56,'msp_26','sep_26','SEP','user26',"",'500006',"msp 26","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (57,'msp_27','sep_27','SEP','user27',"",'500007',"msp 27","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (58,'msp_28','sep_28','SEP','user28',"",'500008',"msp 28","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (59,'msp_29','sep_29','SEP','user29',"",'500009',"msp 29","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (60,'msp_30','sep_30','SEP','user30',"",'500010',"msp 30","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (61,'msp_31','sep_31','SEP','user31',"",'500011',"msp 31","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (62,'msp_32','sep_32','SEP','user32',"",'500012',"msp 32","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (63,'msp_33','sep_33','SEP','user33',"",'500013',"msp 33","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (64,'msp_34','sep_34','SEP','user34',"",'500014',"msp 34","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (65,'msp_35','sep_35','SEP','user35',"",'500015',"msp 35","de");

/* Testuser and free accounts*/

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (66,'unih-tu1','unih_1','Heidelberg','Testuser1',"",'400016',"unih-tu1","de");

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (67,'rwth-tu1','rwth_1','Aachen','Testuser1',"",'400017',"rwth-tu1","de");

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (68,'uniklu_tu1','uniklu_1','UniKLU','Testuser1',"",'400018',"uniklu-tu1","en");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (87,'uniklu_tu2','uniklu_2','UniKLU','Testuser2',"",'910007',"uniklu-tu2","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (88,'uniklu_tu3','uniklu_3','UniKLU','Testuser3',"",'910008',"uniklu-tu3","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (89,'uniklu_tu4','uniklu_4','UniKLU','Testuser4',"",'910009',"uniklu-tu4","de");


INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (69,'andi','bandi06','Andreas','Bollin',"",null,null,"de");

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (70,'lvleiter01','bandi06','lv','leiter',"",'500020',"","de");


/* RWTH Aachen - PM 2006 16 User */

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (71,'pm_01','rwth_01','RWTH','pm01',"",'900001',"pm_01","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (72,'pm_02','rwth_02','RWTH','pm02',"",'900002',"pm_02","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (73,'pm_03','rwth_03','RWTH','pm03',"",'900003',"pm_03","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (74,'pm_04','rwth_04','RWTH','pm04',"",'900004',"pm_04","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (75,'pm_05','rwth_05','RWTH','pm05',"",'900005',"pm_05","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (76,'pm_06','rwth_06','RWTH','pm06',"",'900006',"pm_06","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (77,'pm_07','rwth_07','RWTH','pm07',"",'900007',"pm_07","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (78,'pm_08','rwth_08','RWTH','pm08',"",'900008',"pm_08","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (79,'pm_09','rwth_09','RWTH','pm09',"",'900009',"pm_09","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (80,'pm_10','rwth_10','RWTH','pm10',"",'900010',"pm_10","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (81,'pm_11','rwth_11','RWTH','pm11',"",'900011',"pm_11","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (82,'pm_12','rwth_12','RWTH','pm12',"",'900012',"pm_12","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (83,'pm_13','rwth_13','RWTH','pm13',"",'900013',"pm_13","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (84,'pm_14','rwth_14','RWTH','pm14',"",'900014',"pm_14","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (85,'pm_15','rwth_15','RWTH','pm15',"",'900015',"pm_15","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (86,'pm_16','rwth_16','RWTH','pm16',"",'910006',"pm_16","de");

/* RWTH Aachen SQL 2006 - 16 User */

INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (90,'sqs_01','aachen_01','RWTH','sqs01',"",'910010',"sqs_01","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (91,'sqs_02','aachen_02','RWTH','sqs02',"",'910011',"sqs_02","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (92,'sqs_03','aachen_03','RWTH','sqs03',"",'910012',"sqs_03","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (93,'sqs_04','aachen_04','RWTH','sqs04',"",'910013',"sqs_04","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (94,'sqs_05','aachen_05','RWTH','sqs05',"",'910014',"sqs_05","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (95,'sqs_06','aachen_06','RWTH','sqs06',"",'910015',"sqs_06","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (96,'sqs_07','aachen_07','RWTH','sqs07',"",'911006',"sqs_07","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (97,'sqs_08','aachen_08','RWTH','sqs08',"",'911007',"sqs_08","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (98,'sqs_09','aachen_09','RWTH','sqs09',"",'911008',"sqs_09","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (99,'sqs_10','aachen_10','RWTH','sqs10',"",'911009',"sqs_10","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (100,'sqs_11','aachen_11','RWTH','sqs11',"",'911010',"sqs_11","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (101,'sqs_12','aachen_12','RWTH','sqs12',"",'911011',"sqs_12","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (102,'sqs_13','aachen_13','RWTH','sqs13',"",'911012',"sqs_13","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (103,'sqs_14','aachen_14','RWTH','sqs14',"",'911013',"sqs_14","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (104,'sqs_15','aachen_15','RWTH','sqs15',"",'911014',"sqs_15","de");
INSERT INTO person(pid,username,password,forename,surname,email,matr_nr,nickname,language)
VALUES (105,'sqs_16','aachen_16','RWTH','sqs16',"",'911015',"sqs_16","de");


/* ------------------------------------------------------------------------------------------- */

INSERT INTO organization(oid,name,address,description,host,mailsrv,port)
VALUES(1,"UNI","Universitaetsstrasse","UNI KLU","mailsrv.uni-klu.ac.at","imap.isys.uni-klu.ac.at",25);

INSERT INTO course(cid,c_nr,brief_desc,current_sem,oid) VALUES (1,"160000","PM.Ext","SS07",1);
INSERT INTO course(cid,c_nr,brief_desc,current_sem,oid) VALUES (2,"160001","PM.Int","SS07",1);

/* User andi has role instructor and supervises courses 1 and 2 */
INSERT INTO instructor(pid) VALUES (69);
INSERT INTO i_leads_c(pid,cid) VALUES (69,1);
INSERT INTO i_leads_c(pid,cid) VALUES (69,2);
INSERT INTO p_acquires_r (pid, rid, applied) values (69, 2, sysdate());

/* swe - Teilnehmer Heidelberg 1-20 Extern */
INSERT INTO pl_attends_c(cid,pid) VALUES (1,11);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,12);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,13);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,14);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,15);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,16);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,17);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,18);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,19);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,20);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,21);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,22);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,23);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,24);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,25);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,26);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,27);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,28);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,29);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,30);


/* IT Management und Change 1-35 Intern */
INSERT INTO pl_attends_c(cid,pid) VALUES (2,31);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,32);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,33);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,34);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,35);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,36);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,37);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,38);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,39);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,40);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,41);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,42);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,43);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,44);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,45);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,46);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,47);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,48);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,49);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,50);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,51);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,52);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,53);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,54);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,55);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,56);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,57);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,58);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,59);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,60);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,61);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,62);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,63);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,64);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,65);

/* Testuser Extern Kurs 1 */
INSERT INTO pl_attends_c(cid,pid) VALUES (1,66);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,67);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,68);

/* LV-Leiter Account Intern Kurs 2 */
INSERT INTO pl_attends_c(cid,pid) VALUES (2,69);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,70);

/* RWTH User PM 01-16 Extern Kurs 1 */
INSERT INTO pl_attends_c(cid,pid) VALUES (1,71);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,72);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,73);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,74);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,75);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,76);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,77);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,78);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,79);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,80);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,81);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,82);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,83);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,84);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,85);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,86);

/* Testuser Lokal Kurs 2 */
INSERT INTO pl_attends_c(cid,pid) VALUES (2,87);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,88);
INSERT INTO pl_attends_c(cid,pid) VALUES (2,89);

/* RWTH User SQS 01-16 Extern Kurs 1 */
INSERT INTO pl_attends_c(cid,pid) VALUES (1,90);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,91);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,92);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,93);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,94);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,95);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,96);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,97);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,98);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,99);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,100);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,101);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,102);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,103);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,104);
INSERT INTO pl_attends_c(cid,pid) VALUES (1,105);


INSERT INTO tournament(tid,description,t_counter,cid,minstid) VALUES (1,"QA-200-Modell",1,1,1);
INSERT INTO tournament(tid,description,t_counter,cid,minstid) VALUES (2,"QA-200-Modell",1,2,1);
INSERT INTO tournament(tid,description,t_counter,cid,minstid) VALUES (3,"QA-60-Modell",1,1,2);
INSERT INTO tournament(tid,description,t_counter,cid,minstid) VALUES (4,"QA-60-Modell",1,2,2);

INSERT INTO rnd(rndid,r_counter,tid) VALUES (1,1,1);
INSERT INTO rnd(rndid,r_counter,tid) VALUES (2,1,2);
INSERT INTO rnd(rndid,r_counter,tid) VALUES (3,2,1);
INSERT INTO rnd(rndid,r_counter,tid) VALUES (4,2,2);
INSERT INTO rnd(rndid,r_counter,tid) VALUES (5,1,3);
INSERT INTO rnd(rndid,r_counter,tid) VALUES (6,1,4);

/* --------------------------------------------------------------------------------- */
/* Assigment Heidelberg 1 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (1,'I',11,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (2,'I',12,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (3,'I',13,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (4,'I',14,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (5,'I',15,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (6,'I',16,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (7,'I',17,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (8,'I',18,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (9,'I',19,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (10,'I',20,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (11,'I',21,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (12,'I',22,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (13,'I',23,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (14,'I',24,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (15,'I',25,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (16,'I',26,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (17,'I',27,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (18,'I',28,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (19,'I',29,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (20,'I',30,0,1);
/* Assignmenr Heidelberg 1 End */
/* Assignment Heidelberg 2 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (81,'I',11,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (82,'I',12,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (83,'I',13,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (84,'I',14,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (85,'I',15,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (86,'I',16,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (87,'I',17,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (88,'I',18,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (89,'I',19,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (90,'I',20,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (91,'I',21,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (92,'I',22,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (93,'I',23,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (94,'I',24,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (95,'I',25,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (96,'I',26,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (97,'I',27,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (98,'I',28,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (99,'I',29,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (100,'I',30,0,3);
/* Assignment Heidelberg 2 End */
/* Assignment Heidelberg 3 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (270,'I',11,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (271,'I',12,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (272,'I',13,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (273,'I',14,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (274,'I',15,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (275,'I',16,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (276,'I',17,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (277,'I',18,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (278,'I',19,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (279,'I',20,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (280,'I',21,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (281,'I',22,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (282,'I',23,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (283,'I',24,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (284,'I',25,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (285,'I',26,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (286,'I',27,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (287,'I',28,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (288,'I',29,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (289,'I',30,0,5);
/* Assignment Heidelberg 3 End */

/* --------------------------------------------------------------------------------- */
/* Assignment IT06 Klagenfurt 1 Begin */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (21,'I',31,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (22,'I',32,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (23,'I',33,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (24,'I',34,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (25,'I',35,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (26,'I',36,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (27,'I',37,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (28,'I',38,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (29,'I',39,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (30,'I',40,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (31,'I',41,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (32,'I',42,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (33,'I',43,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (34,'I',44,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (35,'I',45,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (36,'I',46,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (37,'I',47,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (38,'I',48,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (39,'I',49,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (40,'I',50,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (41,'I',51,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (42,'I',52,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (43,'I',53,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (44,'I',54,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (45,'I',55,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (46,'I',56,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (47,'I',57,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (48,'I',58,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (49,'I',59,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (50,'I',60,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (51,'I',61,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (52,'I',62,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (53,'I',63,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (54,'I',64,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (55,'I',65,0,2);
/* Assignment IT06 Klagenfurt 1 End */

/* Assignment IT06 Klagenfurt 2 Begin 
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (121,'I',31,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (122,'I',32,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (123,'I',33,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (124,'I',34,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (125,'I',35,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (126,'I',36,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (127,'I',37,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (128,'I',38,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (129,'I',39,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (130,'I',40,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (131,'I',41,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (132,'I',42,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (133,'I',43,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (134,'I',44,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (135,'I',45,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (136,'I',46,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (137,'I',47,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (138,'I',48,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (139,'I',49,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (140,'I',50,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (141,'I',51,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (142,'I',52,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (143,'I',53,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (144,'I',54,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (145,'I',55,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (146,'I',56,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (147,'I',57,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (148,'I',58,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (149,'I',59,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (150,'I',60,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (151,'I',61,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (152,'I',62,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (153,'I',63,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (154,'I',64,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (155,'I',65,0,4);
Assignment IT06 Klagenfurt 2 End */

/* --------------------------------------------------------------------------------- */
/* Assignment External Testuser 1-3 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (56,'I',66,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (57,'I',67,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (58,'I',68,0,2);

INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (156,'I',66,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (157,'I',67,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (158,'I',68,0,4);

INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (246,'I',66,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (247,'I',67,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (248,'I',68,0,6);
/* Assignment External Testuser 1-3 End */

/* --------------------------------------------------------------------------------- */

/* Assignment LV-Leiter 1, 2 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES ( 59,'I',69,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (159,'I',69,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (249,'I',69,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (561,'I',69,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (562,'I',69,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (563,'I',69,0,6);

INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (260,'I',70,0,1);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES ( 60,'I',70,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (560,'I',70,0,3);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (460,'I',70,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (251,'I',70,0,5);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (250,'I',70,0,6);
/* Assignment LV-Leiter 1, 2 End */


/* Assignment Internal Testusers 1-3 Begin*/
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (176,'I',87,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (177,'I',88,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (178,'I',89,0,2);
/* Only on QS 200 simulation run
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (211,'I',87,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (212,'I',88,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (213,'I',89,0,4);
*/ 
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (311,'I',87,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (312,'I',88,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (313,'I',89,0,6);
/* Assignment Internal Testusers 1-3 End */

/* --------------------------------------------------------------------------------- */
/* Assignment PM 1-16 Users */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (160,'I',71,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (161,'I',72,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (162,'I',73,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (163,'I',74,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (164,'I',75,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (165,'I',76,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (166,'I',77,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (167,'I',78,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (168,'I',79,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (169,'I',80,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (170,'I',81,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (171,'I',82,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (172,'I',83,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (173,'I',84,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (174,'I',85,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (175,'I',86,0,2);
/* Assignment PM Users End */
/* Assignment PM Users 2 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (195,'I',71,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (196,'I',72,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (197,'I',73,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (198,'I',74,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (199,'I',75,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (200,'I',76,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (201,'I',77,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (202,'I',78,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (203,'I',79,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (204,'I',80,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (205,'I',81,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (206,'I',82,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (207,'I',83,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (208,'I',84,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (209,'I',85,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (210,'I',86,0,4);
/* Assignment PM Users 2 End */
/* Assignment PM Users 3 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (295,'I',71,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (296,'I',72,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (297,'I',73,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (298,'I',74,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (299,'I',75,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (300,'I',76,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (301,'I',77,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (302,'I',78,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (303,'I',79,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (304,'I',80,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (305,'I',81,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (306,'I',82,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (307,'I',83,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (308,'I',84,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (309,'I',85,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (310,'I',86,0,6);
/* Assignment PM Users 3 End */

/* --------------------------------------------------------------------------------- */
/* Assignment SQS User 1 */
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (179,'I',90,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (180,'I',91,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (181,'I',92,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (182,'I',93,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (183,'I',94,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (184,'I',95,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (185,'I',96,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (186,'I',97,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (187,'I',98,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (188,'I',99,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (189,'I',100,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (190,'I',101,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (191,'I',102,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (192,'I',103,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (193,'I',104,0,2);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (194,'I',105,0,2);
/* Assignment SQS User 1 End */
/* Assignment SQS User 2*/
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (214,'I',90,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (215,'I',91,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (216,'I',92,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (217,'I',93,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (218,'I',94,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (219,'I',95,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (220,'I',96,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (221,'I',97,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (222,'I',98,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (223,'I',99,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (224,'I',100,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (225,'I',101,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (226,'I',102,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (227,'I',103,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (228,'I',104,0,4);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (229,'I',105,0,4);
/* Assignment SQS 2 End */
/* Assignment SQS 3*/
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (230,'I',90,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (231,'I',91,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (232,'I',92,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (233,'I',93,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (234,'I',94,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (235,'I',95,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (236,'I',96,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (237,'I',97,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (238,'I',98,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (239,'I',99,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (240,'I',100,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (241,'I',101,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (242,'I',102,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (243,'I',103,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (244,'I',104,0,6);
INSERT INTO game(gid,progress,pid,act_turn,rndid) VALUES (245,'I',105,0,6);
/* Assignment SQS 3 End */

/* --------------------------------------------------------------------------------- */

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (11,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (12,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (13,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (14,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (15,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (16,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (17,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (18,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (19,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (20,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (21,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (22,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (23,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (24,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (25,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (26,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (27,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (28,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (29,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (30,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (31,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (32,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (33,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (34,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (35,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (36,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (37,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (38,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (39,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (40,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (41,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (42,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (43,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (44,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (45,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (46,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (47,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (48,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (49,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (50,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (51,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (52,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (53,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (54,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (55,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (56,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (57,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (58,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (59,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (60,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (61,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (62,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (63,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (64,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (65,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (66,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (67,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (68,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (69,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (71,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (72,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (73,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (74,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (75,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (76,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (77,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (78,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (79,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (80,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (81,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (82,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (83,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (84,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (85,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (86,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (87,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (88,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (89,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (90,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (91,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (92,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (93,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (94,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (95,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (96,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (97,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (98,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (99,4,'2003/01/01 08:00','2012/12/12 08:00');

INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (100,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (101,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (102,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (103,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (104,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (105,4,'2003/01/01 08:00','2012/12/12 08:00');

/* LV-Leiter darf auch spielen */
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (70,4,'2003/01/01 08:00','2012/12/12 08:00');
INSERT INTO p_acquires_r(pid,rid,applied,until) VALUES (70,2,'2003/01/01 08:00','2012/12/12 08:00');


