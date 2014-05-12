/* queries.sql */
/* Beschreibung: Bewertungskriterien f�r die Auswertung (Sprachkonzept) */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* ANALYSIS - specific_aids, aid_instances, queries, rules */
/* aid_inst_lang wird nur bei Diagrammen gef�llt */

/* alle Queries m�ssen um die aktuelle gid und den aktuellen Pfad erweitert werden.*/

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne J�ger*/
/* Datum: 15.3.2004 */

/* Changelog: 8.8.2005 (nz), Mitarbeitereinsatz eingefuegt */
/* Changelog: 7.2.2006 (nz), Kosten pro Personenmonat eingefuegt */
/* Changelog: 9.2.2006 (nz), Zusaetzliche Phasendiagramme hinzugefuegt */
/* Changelog: 15.11.2006 (nz), X-Diagramme entfernt */
/* Changelog: 10.05.2007 (dp), Check auf Release Version V34sr2 */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
SELECT * 
FROM kind_of_aid 
WHERE description = "analysis";
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */


/* Dauer */
/*Zielvorgabe: Dauer*/

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (1,'O',"Duration of the project",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (1,"Duration of the project","en",1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (2,"Zielvorgabe: Dauer","de",1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (500,"La dur�e du project","fr",1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5000,"Trvanie projektu","sk",1);

/* xxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (1,"project duration - positive",'T',0,1);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (1,"duration - positive","duration - positive","Very good! You didn't exceed the limit of 270 days.",
"en",1);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (2,"ZV Dauer - positiv","ZV Dauer - positiv","Sehr gut! Sie haben die vorgegebene Zeit von 270 Tagen nicht �berschritten.",
"de",1);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (700,"Dur�e - positif","Dur�e - positif","Excellent! Vous n'avez pas d�pass� la limite de 270 jours.",
"fr",1);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7000,"Trvanie - pozit�vne","Trvanie - pozit�vne","Excelentne! Limit 270 dn� ste neprekro�ili.",
"sk",1);
/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (1,"*",null,1,1,1);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20000,"*","*","en",1);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20001,"*","*","de",1);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (200,"*","*","fr",1);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50000,"*","*","sk",1);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (1,'Z','AFTER',270,'');

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (2,"project duration - negative",'F',0,1);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (3,"duration - negative","duration - negative","Attention! You already exceeded the limit of 270 days.",
"en",2);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (4,"ZV Dauer negativ","ZV Dauer negativ","Achtung! Sie haben die vorgegebene Zeit von 270 Tagen bereits �berschritten.",
"de",2);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (701,"Dur�e - n�gatif","Dur�e - n�gatif","Attention! Vous avez d�j� d�pass� la limite des 270 jours.","fr",2);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7001,"Trvanie - negat�vne","Trvanie - negat�vne","Pozor! Prekro�ili ste limit 270 dn�.","sk",2);
/* xxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (2,"*",null,2,1,2);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20002,"*","*","en",2);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20003,"*","*","de",2);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (201,"*","*","fr",2);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50001,"*","*","sk",2);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (2,'Z','BEFORE',270,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (1,"Beginndatum",        
'select distinct model_instance.start_date
from model,model_instance
where
        model_instance.mid = model.mid AND model.mid = %mid;',
"***");




/* Kosten */
/*Zielvorgabe: Kosten*/

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (2,'O',"Project costs",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (3,"Project costs","en",2);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (4,"Zielvorgabe: Kosten","de",2);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (501,"Co�ts du projet","fr",2);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5001,"N�klady na projekt","sk",2);
/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (3,"project cost - positive",'T',0,2);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (5,"project cost - positive","costs - positive","Very good! You spent * EUR of the given budget (225000 EUR).",
"en",3);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (6,"ZV Kosten - positiv","ZV Kosten positiv","Sehr gut! Sie haben * EUR des vorgegebenen Budgets (225000 EUR) verbraucht.",
"de",3);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (702,"Co�ts du projet - positif","Co�ts - positif","Excellent! Vous avez d�pens� * EUR du budget allou� (225000 EUR).",
"fr",3);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7002,"N�klady na projekt - pozit�vne","N�klady - pozit�vne"," V�borne! Minuli ste * EUR z cel�ho rozpo�tu (225000 EUR).",
"sk",3);
/* xxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (3,"*",null,3,2,3);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20004,"*","*","en",3);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20005,"*","*","de",3);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (202,"*","*","fr",3);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50002,"*","*","sk",3);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (3,'Z','<=',225000,'');

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (4, "project cost - negative",'F',0,2);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7,"project cost - negative","costs - negative","Attention! You spent * EUR and exceeded the budget limit of 225000 EUR.",
"en",4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (8,"ZV Kosten - negativ","ZV Kosten negativ","Achtung, Sie haben die Budgetgrenze �berschritten! Sie haben * EUR verbraucht. Verf�gbar waren nur 225000 EUR.",
"de",4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (703,"Co�ts du projet - n�gatif","Co�ts - n�gatif","Attention! Vous avez d�pens� * EUR d�passant ainsi le budget allou� (225000 EUR).",
"fr",4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7003,"N�klady na projekt - negat�vne","N�klady - negat�vne","Pozor! Minuli ste * EUR a prekro�ili stanoven� rozpo�et (225000 EUR).",
"sk",4);
/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (4,"*",null,4,2,4);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20006,"*","*","en",4);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20007,"*","*","de",4);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (203,"*","*","fr",4);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50003,"*","*","sk",4);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (4,'Z','>',225000,'');

/* maier */
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (2,"KOSTEN",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTZUSTAND*Projectstatus*KOSTEN");




/* AFPs Code */
/*Zielvorgabe: AFPs Code*/

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (3,'O',"Realised AFPs in Code",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5,"Realised AFPs in Code","en",3);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (6,"Zielvorgabe: AFPs Code","de",3);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (502,"PFAs r�alis�s dans le code","fr",3);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5002,"Zrealizovan� AFPs v k�de","sk",3);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (5,"AFP Code - negative",'F',0,3);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (9,"AFP Code - negative","AFP Code negative","Attention! You implemented only * % of the AFPs in the code. The required limit is 95 %!",
"en",5);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (10,"ZV AFP Code - negativ","ZV AFP Code negativ","Achtung! Sie haben * % der gew�nschten AFPs (95 %) f�r den Code erreicht.",
"de",5);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (704,"PFAs r�alis�s - n�gatif","PFAs r�alis�s - n�gatif","Attention! Vous n'avez impl�ment� que *% de PFAs alors qu'au moins 95% de PFAs doivent �tre impl�ment�s!",
"fr",5);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7004,"AFPs v k�de - negat�vne","AFPs v k�de - negat�vne","Pozor! Zimplementovali ste len * % AFPs v zdrojovom k�de. Po�adovan� limit je 95 %!",
"sk",5);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (5,"*",null,5,3,5);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20008,"*","*","en",5);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20009,"*","*","de",5);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (204,"*","*","fr",5);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50004,"*","*","sk",5);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (5,'Z','<',95,'');

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (6,"AFP code - positive",'T',0,3);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (11,"AFP code - positive","AFP code positive","Very good! You already implemented * % of the AFPs in the code, so you managed to achieve the requirements of 95 %.",
"en",6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (12,"ZV AFP Code - positiv","ZV AFP Code positiv","Sehr gut! Sie haben bereits * % der geforderten AFPs (95 %) f�r den Code erreicht.", 
"de",6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (705,"PFAs r�alis�s - positif","PFAs r�alis�s - positif","Tr�s bien! Vous avez impl�ment� *% de PFAs atteignant ainsi la limite exig�e qui est 95%.","fr",6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7005,"Zrealizovan� AFP - pozit�vne","Zrealizovan� AFP - pozit�vne","Ve�mi dobre! Zimplementovali ste * % AFPs v zdrojovom k�de, tak�e sa V�m podarilo splni� po�adovan�ch 95 %.","sk",6);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (6,"*",null,6,3,6);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20010,"*","*","en",6);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20011,"*","*","de",6);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (205,"*","*","fr",6);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50005,"*","*","sk",6);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (6,'Z','>=',95,'');

/* maier */
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (3,"PROZENT AFPs Code",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*PROZENT_AFP_100");




/* Fehler pro KLOC */
/*Zielvorgabe: Fehler pro KLOC*/

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (4,'O',"Number of errors in code (per KLOC)",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (7,"Number of errors in code (per KLOC)","en",4);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (8,"Zielvorgabe: Fehler pro KLOC","de",4);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (503,"Nombre des erreurs dans le code (par KLOC)","fr",4);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5003,"Po�et ch�b v k�de (na KLOC)","sk",4);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (7,"errors per KLOC - positive",'T',0,4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (13,"errors per KLOC - positive","errors per KLOC positive","Very good! The code contains only * errors per KLOC. You managed to achieve the requirements of 12 errors per KLOC.",
"en",7);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (14,"ZV Fehler pro KLOC - positiv","ZV Fehler pro KLOC positiv","Sehr gut! Ihr Code enth�lt nur * Fehler pro KLOC. Sie haben die gew�nschte Grenze von 12 Fehlern pro KLOC eingehalten.",
"de",7);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (706,"Erreurs par KLOC - positif","Erreurs par KLOC positif","Tr�s bien! Le code ne contient que * erreurs par KLOC. Vous n'avez pas d�pass� la limite exig�e qui est de 12 erreurs par KLOC au maximum.",
"fr",7);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7006,"Chyby na KLOC - pozit�vne","Chyby na KLOC pozit�vne","Super! Zdrojov� k�d obsahuje len * ch�b na KLOC. Podarilo sa V�m osta� pod hranicou 12 ch�b na KLOC.",
"sk",7);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (7,"*",null,7,4,7);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20012,"*","*","en",7);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20013,"*","*","de",7);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (206,"*","*","fr",7);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50006,"*","*","sk",7);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (7,'Z','<=',12,'');

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (110,"*",7,7,4,20);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20014,"*","*","en",110);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20015,"*","*","de",110);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (207,"*","*","fr",110);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50007,"*","*","sk",110);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point,expression)
VALUES (20,'Z','>',0,'','AND');

/* neg Fall */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (8,"errors per KLOC - negative",'F',0,4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (15,"errors per KLOC - negative","errors per KLOC negative","Attention! The code contains * errors per KLOC. You didn't manage to achieve the requirements of 12 errors per KLOC.",
"en",8);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (16,"ZV Fehler pro KLOC - negativ","ZV Fehler pro KLOC negativ","Achtung! Ihr Code enth�lt noch * Fehler pro KLOC. Sie haben die gew�nschte Grenze von 12 Fehlern pro KLOC nicht eingehalten.",
"de",8);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (707,"Erreurs par KLOC - n�gatif","Erreurs par KLOC n�gatif","Attention! Le code contient * erreurs par KLOC.  Vous avez d�pass� la limite exig�e qui est de 12 erreurs par KLOC au maximum. ",
"fr",8);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7007,"Chyby na KLOC - negat�vne","Chyby na KLOC negat�vne","Pozor! Zdrojov� k�d obsahuje * ch�b prisl�chaj�cich na KLOC. Nepodarilo sa V�m splni� po�iadavku maxim�lneho po�tu 12 ch�b na KLOC.",
"sk",8);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (8,"*",null,8,4,8);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20016,"*","*","en",8);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20017,"*","*","de",8);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (208,"*","*","fr",8);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50008,"*","*","sk",8);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (8,'Z','>',12,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (4,"FEHLER PRO KLOC",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_KLOC" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc; ',
"**CODE*Code*FEHLER_PRO_KLOC");

/* weiterer Fall */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (60,"errors per KLOC - negative",'F',0,4);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (17,"errors per KLOC - negative","errors per KLOC negative","Attention! You didn't start with the implementation.
The code should contain less than 12 errors per KLOC.",
"en",60);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (18,"ZV Fehler pro KLOC - negativ","ZV Fehler pro KLOC negativ","Achtung! Sie haben noch nicht mit der Codierung begonnen. 
Sie sollten die gew�nschte Grenze von 12 Fehlern pro KLOC erreichen.",
"de",60);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (708,"Erreurs par KLOC - n�gatif","Erreurs par KLOC n�gatif","Attention! Vous n'avez pas encore commenc� l'impl�mentation. Le code ne doit pas contenir plus de 12 erreurs par KLOC.",
"fr",60);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7008,"Chyby na KLOC - negat�vne","Chyby na KLOC negat�vne","Pozor! E�te ste neza�ali s implement�ciou.",
"sk",60);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (111,"*",null,60,4,21);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20018,"*","*","en",111);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20019,"*","*","de",111);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (209,"*","*","fr",111);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50009,"*","*","sk",111);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (21,'Z','<',0,'');




/* AFPs HB */
/*Zielvorgabe: AFPs Handbuch*/

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (5,'O',"Realised AFPs in the manual",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (9,"Realised AFPs in the manual","en",5);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (10,"Zielvorgabe: AFPs Handbuch","de",5);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (504,"PFAs r�alis�s dans le manuel","fr",5);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5004,"Zrealizovan� AFPs v pr�ru�ke","sk",5);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (9,"AFP manual - positive",'T',0,5);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (19,"AFP manual - positive","AFP manual positive","Very good! The manual covers * % of the required AFPs. The required limit was 95 % of the AFPs.",
"en",9);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (20,"ZV AFP HB - positiv","ZV AFP HB positiv","Sehr gut! Sie haben * % der AFPs f�r das Handbuch erreicht. Damit haben Sie die Anforderung des Kundne (95 %) bereits erreicht.",
"de",9);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (709,"PFAs r�alis�s dans le manuel - positif","PFAs r�alis�s dans le manuel: positif","Tr�s bien! Le manuel couvre *% des PFAs alors que la limite est de 95% des FPAs.",
"fr",9);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7009,"AFPs v pr�ru�ke - pozit�vne","AFPs v pr�ru�ke: pozit�vne","Brav�rne! Pr�ru�ka pokr�va * % po�adovan�ch AFPs. Stanoven� limit bol 95 % AFPs.",
"sk",9);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (9,"*",null,9,5,6);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20020,"*","*","en",9);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20021,"*","*","de",9);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (210,"*","*","fr",9);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50010,"*","*","sk",9);
/* ENDE RIETA TOOL */

/* rule gleich wie 6 */

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (10,"AFP manual - negative",'F',0,5);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (21,"AFP manual - negative","AFP manual negative","Attention! The manual covers * % of the required AFPs. The required limit was 95 %.",
"en",10);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (22,"ZV AFP HB - negativ","ZV AFP HB negativ","Achtung! Sie haben * % der AFPs f�r das Handbuch erreicht. Die Anforderungen des Kunden liegen bei 95 %!",
"de",10);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (710,"PFAs r�alis�s dans le manuel - n�gatif","PFAs r�alis�s dans le manuel: n�gatif","Attention! Le manuel ne couvre que * % des PFAs alors que la limite exig�e est de 95% des PFAs.",
"fr",10);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7010,"AFPs v pr�ru�ke - negat�vne","AFPs v pr�ru�ke: negat�vne","Pozor! Pr�ru�ka pokr�va * % po�adovan�ch AFPs. Limit bol stanoven� na 95 %.",
"sk",10);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (10,"*",null,10,5,5);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20022,"*","*","en",10);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20023,"*","*","de",10);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (211,"*","*","fr",10);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50011,"*","*","sk",10);
/* ENDE RIETA TOOL */

/* rule gleich wie 5 */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (5,"PROZENT AFPs HB",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "PROZENT_AFP_100" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*PROZENT_AFP_100");




/* Fehler pro Seite */
/* Zielvorgabe: Fehler pro Seite im Handbuch */

INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (6,'O',"Number of errors in the manual (per page)",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (11,"Number of errors in the manual (per page)","en",6);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (12,"Zielvorgabe: Fehler pro Seite im Handbuch","de",6);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (505,"Nombre des erreurs dans le manuel (par page)","fr",6);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5005,"Po�et ch�b v pr�ru�ke (pripadaj�cich na stranu)","sk",6);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (11,"errors per page - positive",'T',0,6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (23,"errors per page - positive","errors per page positive","Very good! The manual contains only * errors per page. You have achieved the required limit of 0.5 errors per page in the manual.",
"en",11);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (24,"ZV Fehler pro Seite - positiv","ZV Fehler pro Seite positiv","Sehr gut! Ihr Handbuch enth�lt nur * Fehler pro Seite. Sie haben die gew�nschte Grenze von 0,5 Fehlern pro Seite im Handbuch eingehalten.",
"de",11);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (711,"erreurs par page - positif","erreurs par page positif","Tr�s bien! Le manuel ne contient que * erreurs par page. Vous �tes en dessous de la limite maximale de 0.5 erreurs par page.",
"fr",11);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7011,"po�et ch�b na stranu - pozit�vne","po�et ch�b na str�nku pozit�vny","Ve�mi dobre! Pr�ru�ka obsahuje len * ch�b pripadaj�cich na jednu stranu. Podarilo sa V�m zmesti� pod po�adovan�ch 0.5 ch�b na 1 stranu pr�ru�ky.",
"sk",11);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (11,"*",null,11,6,9);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20024,"*","*","en",11);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20025,"*","*","de",11);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (212,"*","*","fr",11);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50012,"*","*","sk",11);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (9,'Z','<=',0.5,'');

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (112,"*",11,11,6,20);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20026,"*","*","en",112);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20027,"*","*","de",112);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (213,"*","*","fr",112);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50013,"*","*","sk",112);
/* ENDE RIETA TOOL */

/* weiterer Fall */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (12,"errors per page - negative",'F',0,6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (25,"errors per page - negative","errors per page negative","Attention! The manual contains * errors per page. You have reached the required limit of 0.5 errors per page in the manual.",
"en",12);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (26,"ZV Fehler pro Seite - negativ","ZV Fehler pro Seite negativ","Achtung! Ihr Handbuch enth�lt * Fehler pro Seite. Sie haben die gew�nschte Grenze von 0,5 Fehlern pro Seite im Handbuch nicht eingehalten.",
"de",12);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (712,"erreurs par page - n�gatif","erreurs par page: n�gatif","Attention! Le manuel contient * erreurs par page. Vous avez d�pass� la limite maximale qui est de l'ordre de 0.5 erreurs par page.",
"fr",12);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7012,"po�et ch�b na stranu - negat�vne","po�et ch�b na str�nku negat�vny","Pozor! Pr�ru�ka obsahuje * ch�b pripadaj�cich na jednu stranu. Prekra�ujete stanoven� limit 0.5 ch�b na 1 stranu pr�ru�ky.",
"sk",11);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (12,"*",null,12,6,10);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20028,"*","*","en",12);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20029,"*","*","de",12);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (214,"*","*","fr",12);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50014,"*","*","sk",12);
/* ENDE RIETA TOOL */

INSERT INTO rule (rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (10,'Z','>',0.5,'');

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (6,"FEHLER PRO SEITE",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER_PRO_SEITE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*FEHLER_PRO_SEITE");

/* weiterer Fall */
INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (61,"errors per page - negative",'F',0,6);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (27,"errors per page - negative","errors per page negative","Attention! You did not begin writing the documentation.
Please remember! You have to reach the required limit of 0.5 errors per page.",
"en",61);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (28,"ZV Fehler pro Seite - negativ","ZV Fehler pro Seite negativ","Achtung! Sie haben noch nicht mit dem Handbuch begonnen. 
Vergessen Sie nicht! Sie sollten die gew�nschte Grenze von 0,5 Fehlern pro Seite erreichen.",
"de",61);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (713,"erreurs par page - n�gatif","erreurs par page n�gatif","Attention! Vous n'avez pas encore commenc� la r�daction du manuel. Il ne faut pas d�passer la limite maximale qui est de l'ordre de 0.5 erreurs par page.",
"fr",61);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7013,"po�et ch�b na stranu - negat�vne","po�et ch�b na stranu negat�vny","Pozor! Neza�ali ste p�sa� pr�ru�ku.",
"sk",61);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (113,"*",null,61,6,21);

/* RIETA TOOL ben�tigt folgendes*/
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20030,"*","*","en",113);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20031,"*","*","de",113);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (215,"*","*","fr",113);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50015,"*","*","sk",113);
/* ENDE RIETA TOOL */


/* Vollst�ndigkeit der Dokumente */
/*Vollst�ndigkeit der Dokumente*/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (7,"Completeness of the documents",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (13,"Completeness of the documents","en",7);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (14,"Vollst�ndigkeit der Dokumente","de",7);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (506,"Compl�tude des documents","fr",7);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5006,"�plnos� dokumentov","sk",7);
/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (13,"Completeness of documents",1,'V',7);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (29,"Completeness of documents","Completeness of documents","Description: 
The diagram shows the Completeness of the project documents. (Values: *)

Explanation/Recommendations:
Quality slightly decreases from document to document. However, the better the quality (in terms of number of AFPs realized) of the specification, the easier it is to maintain the quality of the succeeding documents. By putting additional effort on the testing phase, the quality of the code can be increased, too.",
"en","AFPs","Documents",13);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (30,"Vollst�ndigkeit der Dokumente","Vollst�ndigkeit der Dokumente","Beschreibung: 
Das Diagramm zeigt die Vollst�ndigkeit der Dokumente des Projekts. (Werte: *)

Erkl�rung/Empfehlungen:
Qualit�t verringert sich von Dokument zu Dokument leicht. Aber je besser die Qualit�t der Spezifikation ist (ausgedr�ckt durch die umgesetzte Anzahl AFPs), desto leichter ist es, die Qualit�t der nachfolgenden Dokumente aufrecht zu erhalten. Durch zus�tzlichen Aufwand in der Testphase kann auch die Qualit�t des Codes erh�ht werden.",
"de","AFPs","Dokumente",13);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (714,"Compl�tude des documents","Compl�tude des documents","Le diagramme montre l'exhaustivit� de la documentation du projet. (Values: *)

Une documentation de ref�rence est acceptable si l'exhaustivit� des documents de la sp�cification et de la conception est �lev�e (~ 200 PFAs). 
Si pour la conception des modules, elle est insuffisante (inf. � 190 PFAs), alors probablement vous avez oubli� de corriger les documents pr�c�dents.","fr","PFAs","Documents",13);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7014,"�plnos� dokumentov","�plnos� dokumentov","Popis: 
Diagram zn�zor�uje �plnos� dokumentov projektu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Kvalita postupne kles� od dokumentu k dokumentu. Av�ak, ��m vy��ia kvalita (v zmysle realizovan�ch AFPs) �pecifik�cie, t�m jednoduch�ie je udr�a� kvalitu dokumentov, ktor� nasleduj�. Dodato�n�m vynalo�en�m snahy po�as testovacej f�zy m��e tie� d�js� k zv��eniu kvality zdrojov�ho k�du.",
"sk","AFPs","Documents",13);

/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (13,"specification",null,13,7,null );

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (1,"specification","S","en",13);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (2,"Spezifikation","S","de",13);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (250,"sp�cification","S","fr",13);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50050,"�pecifik�cia","S","sk",13);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(7,'specification',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*ANZ_AFP");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (14,"system design",13,13,8,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (3,"system design","SD","en",14);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (4,"Systemdesign","SD","de",14);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (251,"conception du syst�me","CS","fr",14);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50051,"n�vrh syst�mu","NS","sk",14);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(8,'system design',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_AFP");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (15,"module design",14,13,9,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (5,"module design","MD","en",15);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (6,"Moduledesign","MD","de",15);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (252,"conception des modules","CM","fr",15);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50052,"n�vrh modulov","NM","sk",15);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(9,'module design',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_AFP");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (16,"code",15,13,10,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (7,"code","C","en",16);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (8,"Code","C","de",16);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (253,"code","I","fr",16);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50053,"k�d","K","sk",16);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(10,'code',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_AFP");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (17,"manuals",16,13,11,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (9,"manuals","M","en",17);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (10,"Manuals","M","de",17);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (254,"manuel","M","fr",17);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50054,"pr�ru�ka","P","sk",17);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(11,'manual',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AFP" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_AFP");




/* Restfehler in allen Dokumenten */ 

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (8,"Errors in documents",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (15,"Errors in documents","en",8);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (16,"Restfehler der Dokumente","de",8);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (507,"Erreurs dans les documents","fr",8);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5007,"Chyby v dokumentoch","sk",8);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (14,'Errors in documents',1,'V',8);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (31,'Errors in documents','Errors in documents',"Description: 
This diagram shows the remaining errors in the documents. (Values: *)

Explanation/Recommendations:
If the specification contains more than 30 errors, then you did not review this document thoroughly. In later phases the correction of documents is more costly and timeexpensive, as the number of errors increases during the project. Already at early stages of the project you should try to produce documents that are correct and complete.",
"en","Errors","Documents",14);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (32,"Restfehler der Dokumente","Restfehler der Dokumente","Beschreibung:
Dieses Diagramm zeigt die Restfehler in dem jeweiligen Dokument. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt bereits die Spezifikation zu viele Fehler (mehr als 30), dann wurde dieses Dokument nicht gr�ndlich genug gepr�ft. Da sich die Fehler in den nachfolgenden Phasen fortpflanzen, und eine Korrektur zu einem sp�teren Zeitpunkt immer aufw�ndiger und kostenintensiver wird, sollte versucht werden die Dokumente der ersten Phasen m�glichst gr�ndlich und fehlerfrei zu erstellen.",
"de","Fehler","Dokumente",14);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (715,'Erreurs dans les documents','Erreurs dans les documents',"Ce diagramme montre le reste des erreurs dans le document. (Values: *)

Si la sp�cification contient plus de 30 erreurs, cela est peut �tre d� � la r�vision non compl�te de la documentation.
Dans les phases suivantes, la correction des documents est plus co�teuse quand le nombre d'erreurs augmente tout au long du projet.
Comme conseil, il faut produire des documents complets et de bonne qualit� dans les premi�res phases.

Attention:
Pour plus d'information sur les differentes phases du project, consulter les diagrammes suivants: 
   => Erreurs dans la specification, 
   => Erreurs dans la conception du syst�me, 
   => Erreurs dans la conception des modules, 
   => Erreurs dans le code et 
   => Erreurs dans la documentation.",
"fr","erreurs","Documents",14);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7015,'Chyby v dokumentoch','Chyby v dokumentoch',"Popis: 
Tento diagram zn�zor�uje chyby zost�vaj�ce v dokumentoch. (Hodnoty: *)

Vzsvetlenie/Odpor��ania:
Ak �pecifik�cia obsahuje viac ako 30 ch�b, potom ste tento dokument neprezreli poriadne. V neskor��ch f�zach je oprava dokumentov drah�ia nielen finan�ne ale aj �asovo paralelne s narastaj�cim po�tom ch�b po�as projektu. U� v skor��ch f�zach projektu by ste mali vytv�ra� dokumenty, ktor� s� spr�vne(korektn�) a �pln�.",
"sk","Chyby","Dokumenty",14);
/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (18,"specification",null,14,12,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (11,"specification","S","en",18);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (12,"Spezifikation","S","de",18);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (255,"sp�cification","S","fr",18);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50055,"�pecifik�cia","S","sk",18);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(12,'specification',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (19,"system design",18,14,13,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (13,"system design","SD","en",19);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (14,"Systemdesign","SD","de",19);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (256,"conception du syst�me","CS","fr",19);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50056,"n�vrh syst�mu","NS","sk",19);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(13,'system design',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (20,"module design",19,14,14,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (15,"module design","MD","en",20);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (16,"Moduldesign","MD","de",20);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (257,"conception des modules","CM","fr",20);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50057,"n�vrh modulov","NM","sk",20);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(14,'module design',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_FEHLER_GES");


INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (21,"code",20,14,15,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (17,"code","C","en",21);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (18,"Code","C","de",21);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (258,"code","I","fr",21);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50058,"k�d","K","sk",21);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(15,'code',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (22,"manuals",21,14,16,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (19,"manuals","M","en",22);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (20,"Manuals","M","de",22);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (259,"manuel","M","fr",22);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50059,"pr�ru�ky","P","sk",22);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(16,'manual',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_FEHLER_GES");




/* Restfehler im Dokument Spezifikation */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (9,"Errors in the specification",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (17,"Errors in the specification","en",9);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (18,"Restfehler in der Spezifikation","de",9);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (508,"Erreurs dans la sp�cification","fr",9);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5008,"Chyby v �pecifik�cii","sk",9);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (15,'Errors in the spezifikation',1,'V',9);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (33,'Errors in the specification','Errors in the specification',"Description: 
This diagram shows the errors remaining in the specification. (Values: *)

Explanation/Recommendations
When the specification contains more than 30 analysis errors, then you did not review the document thoroughly. Maybe you have forgotten to invite the customer to the review of the specification. The customer should always participate in a review of the specification, because he/she detects a lot of errors which would otherwise not have been found. At an early project stage the customer also helps to find missing functionality that can be easily integrated into the system. If the specification document was reviewed more than once and still contains a lot of errors, then you should take a closer look at the review teams. Maybe you have chosen the wrong developers. Please note the specification document contains only analysis errors (AE).",
"en","Errors","Kind of error",15);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (34,"Restfehler in der Spezifikation","Restfehler in der Spezifikation","Beschreibung:
Dieses Diagramm zeigt die Restfehler in der Spezifikation. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt die Spezifikation noch viele Analysefehler (mehr als 30), dann wurde das Dokument nicht ausreichend gepr�ft. M�glicherweise wurde der Kunde nicht zu einem Review der Spezifikation eingeladen. Der Kunde sollte allerdings immer an mindestens einem Review teilnehmen, da er viele Fehler findet, die die Gutachter nicht entdecken k�nnen. Au�erdem kann er auf fehlende Funktionalit�ten hinweisen, die zu einem fr�hen Zeitpunkt noch recht g�nstig integriert werden k�nnen. Wurde die Spezifikation mehrmals gepr�ft und enth�lt trotzdem viele Fehler, dann sollte die Zusammenstellung der Reviewteams genauer untersucht werden. M�glicherweise waren die ausgew�hlten Mitarbeiter als Gutachter nicht qualifiziert. Anmerkung: Die Spezifikation enth�lt nur Analysefehler (AE).",
"de","Fehler","Fehlerart",15);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (716,'Erreurs dans la sp�cification','Erreurs dans la sp�cification',"Ce diagramme montre le reste des erreurs dans la sp�cification. (Values: *)

Si les sp�cifications contiennent plus de 30 erreurs d'analyse, ceci est peut �tre d� � la r�vision non exhaustive de la documentation.
Probablement, vous avez oubli� d'inviter le client pour la r�vision ensemble des sp�cifications.
Le client doit toujours participer dans la r�vision des sp�cifications car sa pr�sence permet de d�tecter plus d'erreurs s'il y en a.
Au d�but du projet, le client peut aider � trouver des fonctionnalit�s manquantes et qui peuvent �tre facilement int�gr�es dans le syst�me.
Si le document des sp�cifications a �t� revu plusieurs fois et il y a toujours des erreurs, alors il faut revoir la composante du groupe de r�vision. Probablement, vous avez choisi pour la r�vision des personnes moins comp�tentes.

NB:
Le document des sp�cifications ne contient que les erreurs d'analyse (EA).",
"fr","Erreurs","Type d'erreur",15);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7016,'Chyby v �pecifik�cii','Chyby v �pecifik�cii',"Popis: 
Diagram zachyt�va ost�vaj�ce chyby v �pecifik�cii. (Hodnoty: *)

Vysvetlenie/Odpor��ania
Ke� �pecifik�cie obsahuje viac ako 30 ch�b z anal�zy, potom ste neprezreli/neprekontrolovali dokument dostato�ne. Mo�no ste zabudli po�iada� samotn�ho z�kazn�ka o prekontrolovanie �pecifik�cie. Z�kazn�k by sa mal st�le z��astni� prehodnotenia �pecifik�cie, preto�e zist� mnoho ch�b, ktor� by v opa�nom pr�pade neboli n�jden�. V prv�ch f�zach projektu taktie� z�kazn�k pom�ha pouk�za� na ch�baj�cu funkcionalitu, ktor� m��e by� jednoducho za�lenen� do syst�mu. Ak �pecifik�cie bola prehodnoten� viac ako raz, no napriek tomu je pr�tomnos� ch�b preuk�zan�, mali by ste sa bli��ie pozrie� na t�m, ktor� prehodnocoval �pecifik�ciu. Alebo ste zvolili nespr�vnych v�voj�rov. Berte na vedomie, pros�m, �e �pecifik�cie zah��a len chyby z f�zy anal�zy (AE).",
"sk","Chyby","Typ chyby",15);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (23,"errors",null,15,17,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (21,"total errors","ALL","en",23);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (22,"Gesamtfehler","GES","de",23);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (260,"Nombre total des erreurs","Total","fr",23);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50060,"Chyby dokopy","Total","sk",23);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(17,'all errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (24,"analysis errors",23,15,18,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (23,"analysis errors","AE","en",24);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (24,"Analysefehler","AF","de",24);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (261,"Erreurs d'analyse","EA","fr",24);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50061,"Chyby anal�zy","ChA","sk",24);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(18,'analysis errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*ANZ_AF");



/* Restfehler im Dokument Systemdesign */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (10,"Errors in the system design",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (19,"Errors in the system design","en",10);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (20,"Restfehler im Systemdesign","de",10);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (509,"Erreurs dans la conception du syst�me","fr",10);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5009,"Chyby v n�vrhu syst�mu","sk",10);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (16,'Errors in the system design',1,'V',10);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (35,'Errors in the system design','Errors in the system design',"Description:
The diagram shows the errors remaining in the system design. (Values: *)

Explanation/Recommendations:
When the system design contains a lot of errors, then you did not review the document thoroughly. Don't forget that the errors increase during the project. When the system design document was reviewed more than once and contains still a lot of errors, then you should take a closer look at the different review teams. Maybe you have chosen the wrong developers.",
"en","Errors","Kind of error",16);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (36,"Restfehler im Systemdesign","Restfehler im Systemdesign","Beschreibung:
Das Diagramm zeigt die Restfehler im Systemdesign. Die Fehler werden nach der Fehlerart (Analysefehler (AF), Grobentwurfsfehler (GF)) aufgeschl�sselt. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt das Systemdesigndokument viele Fehler, dann wurde das Dokument nicht ausreichend gepr�ft. Es muss immer beachtet werden, dass die Fehler aus dem Vorgabedokument �bernommen werden. Wurde das Dokument mehrmals gepr�ft und enth�lt trotzdem viele Fehler, dann sollte die Zusammenstellung der Reviewteams genauer untersucht werden. M�glicherweise waren die ausgew�hlten Mitarbeiter als Gutachter nicht qualifiziert.",
"de","Fehler","Fehlerart",16);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (717,'Erreurs dans la conception du syst�me','Erreurs dans la conception du syst�me',"Ce diagramme montre le reste des erreurs dans la conception du syst�me.

Les erreurs sont group�es par type:
=> Erreurs d'analyse (EA) et
=> Erreurs de conception du syst�me (ECS)
(Values: *)

Si la conception du syst�me renferme beaucoup d'erreurs, ceci est peut �tre d� � la r�vision non exhaustive de la documentation.
Il ne faut pas oublier que le nombre d'erreurs augmente tout au long du projet. 

Si le document relatif � la conception du syst�me a �t� revu plusieurs fois et qu'il contient toujours des erreurs, alors il faut revoir la composante du groupe de r�vision. Probablement, vous avez choisi pour la r�vision des personnes moins comp�tentes.",
"fr","erreurs","Type d'erreur",16);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7017,'Chyby v n�vrhu syst�mu','Chyby v n�vrhu syst�mu',"Popis:
Diagram popisuje chyby zotrv�vaj�ce v syst�movom n�vrhu. (Values: *)

Vysvetliene/Odpor��ania:
Ak n�vrh syst�mu obsahuje mno�stvo ch�b, potom ste neprekontrolovali dokument dostato�ne. Nezab�dajte, �e po�et ch�b sa po�as projektu zvy�uje. Ak n�vrh syst�mu bol prekontrolovan� viac ako raz a st�le obsahuje mnoho ch�b, potm by ste sa mali zamera� na odli�n� t�my, ktor� mali na starosti kontrolu(dokumentu). Mo�no ste poverili neadekv�tnych v�voj�rov.",
"sk","Chyby","Typ chyby",16);

/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (25,"errors",null,16,19,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (25,"total errors","ALL","en",25);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (26,"Gesamtfehler","GES","de",25);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (262,"Nombre total des erreurs","Total","fr",25);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50062,"chyby dokopy","total","sk",25);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(19,"all errors",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (26,"analysis errors",25,16,20,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (27,"analysis errors","AE","en",26);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (28,"Analysefehler","AF","de",26);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (263,"Erreurs d'analyse","EA","fr",26);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50063,"Chyby anal�zy","ChA","sk",26);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(20,'analysis errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_AF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (27,"system design errors",26,16,21,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (29,"system design errors","SDE","en",27);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (30,"Grobentwurfsfehler","GF","de",27);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (264,"Erreurs dans la conception du syst�me","ECS","fr",27);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50064,"Chyby n�vrhu syst�mu","ChNS","sk",27);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(21,'system design errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_GF");



/* Restfehler im Dokument Moduledesign */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (11,"Errors in the module design",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (21,"Errors in the module design","en",11);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (22,"Restfehler im Moduldesign","de",11);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (510,"Erreurs dans la conception des modules","fr",11);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5010,"Chyby v n�vrhu modulov","sk",11);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (17,'Errors in the module design',1,'V',11);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (37,'Errors in the module design','Errors in the module design',"Description: 
The diagram shows the remaining errors of the module design. The errors are grouped by the kind of error. (Values: *)

Explanation/Recommendations:
When the module design contains a lot of errors, then you did not review the document properly. Don't forget that the errors increase during the project. If the module design document was reviewed more than once and contains still a lot of errors, then you should take a closer look at the different review teams. Maybe you have chosen the wrong developers.",
"en","Errors","Kind of error",17);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (38,"Restfehler im Moduldesign","Restfehler im Moduldesign","Beschreibung:
Das Diagramm zeigt die Restfehler im Moduldesign. Die Fehler werden nach der Fehlerart (Analysefehler (AF), Grobentwurfsfehler (GF), Feinentwurfsfehler (FF)) aufgeschl�sselt. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt das Moduldesigndokument viele Fehler, dann wurde das Dokument nicht ausreichend gepr�ft. Es muss immer beachtet werden, dass die Fehler aus dem Vorgabedokument �bernommen werden. Wurde das Dokument mehrmals gepr�ft und enth�lt trotzdem viele Fehler, dann sollte die Zusammenstellung der Reviewteams genauer untersucht werden. M�glicherweise waren die ausgew�hlten Mitarbeiter als Gutachter nicht qualifiziert.",
"de","Fehler","Fehlerart",17);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (718,'Erreurs dans la conception des modules','Erreurs dans la conception des modules',"Le diagramme montre le reste des erreurs de la conception des modules.
Les erreurs sont group�es par type d�erreur:
  => Erreurs d�analyse (EA),
  => Erreurs de la conception du syst�me (ECS) and
  => Erreurs de la conception des modules (ECM). 
(Values: *)

Si la conception des modules contient beaucoup d�erreurs, ceci est peut �tre d� � la r�vision incompl�te du document.
Il ne faut pas oublier que le nombre des erreurs augmente tout au long du projet.
S�il y a toujours des erreurs apr�s plusieurs r�visions du document de conception des modules, alors il faut revoir la composante des groupes de r�vision. Probablement, vous avez choisi des personnes moins comp�tentes.",
"fr","Erreurs","Type d'erreur",17);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7018,'Chyby v n�vrhu modulov','Chyby v n�vrhu modulov',"Popis: 
Diagram zobrazuje zost�vaj�ce chyby v n�vrhu modulov. Chyby s� zoskupen� na z�klade typu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Ak n�vrh modulov obsahuje ve�a ch�b, potom ste pravdepodobne nenechali prekontrolova�/prehodnoti� dokument dostato�ne. Nezab�dajte, �e po�et ch�b postupne s neskor��mi f�zami projektu narast�. Ak n�vrh modulov bol prehodnoten� viac ako raz, no napriek tomu sa chyby v dokumente vyskytuj�, potom by ste sa mali zamera� na in� t�my, ktor� (by) mali na starosti prehodnotenie dokumentu. Mo�no ste siahli po neadekv�tnych v�voj�roch.",
"sk","Chyby","Typ chyby",17);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (28,"errors",null,17,22,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (31,"total errors","ALL","en",28);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (32,"Gesamtfehler","GES","de",28);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (365,"Nombre  total des erreurs","Total","fr",28);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50065,"Chyby dokopy","Chyby total","sk",28);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(22,'all errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (29,"analysis errors",28,17,23,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (33,"analysis errors","AE","en",29);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (34,"Analysefehler","AF","de",29);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (366,"Erreurs d�analyse","EA","fr",29);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50066,"Chyby anal�zy","ChA","sk",29);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(23,'analysis errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_AF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (30,"system design errors",29,17,24,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (35,"system design errors","SDE","en",30);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (36,"Grobentwurfsfehler","GF","de",30);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (367,"Erreurs de la conception du syst�me","ECS","fr",30);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50067,"Chyby v n�vrhu syst�mu","ChNS","sk",30);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(24,'system design errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_GF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (31,"module design errors",30,17,25,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (37,"module design errors","MDE","en",31);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (38,"Feinentwurfsfehler","FF","de",31);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (368,"Erreurs de la conception des modules","ECM","fr",31);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50068,"Chyby n�vrhu modulov","ChNM","sk",31);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(25,'module design errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduledesign*ANZ_FF");



/* Restfehler im Dokument Code */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (12,"Errors in code",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (23,"Errors in code","en",12);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (24,"Restfehler im Code","de",12);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (511,"Erreurs dans le code","fr",12);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5011,"Chyby v k�de","sk",12);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (18,'Errors in the code',1,'V',12);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (39,'Errors in the code','Errors in the code',"Description: 
The diagram shows the remaining errors in the code. The errors are grouped by the kind of error. (Values: *)

Explanation/Recommendations:
If the code contains a lot of errors, then you did not review the document thoroughly. Don't forget that the errors increase during the project. If the code was reviewed more than once and contains still a lot of errors, then you should take a closer look at the different review teams. Maybe you have chosen the wrong developers.",
"en","Errors","Kind of error",18);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (40,"Restfehler im Code","Restfehler im Code","Beschreibung: 
Das Diagramm zeigt die Restfehler im Code. Die Fehler werden nach der Fehlerart (Analysefehler (AF), Grobentwurfsfehler (GF), Feinentwurfsfehler (FF), Implementierungsfehler (IF)) aufgeschl�sselt. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt der Code viele Fehler, dann wurde das Dokument nicht ausreichend gepr�ft. Es muss immer beachtet werden, dass die Fehler aus dem Vorgabedokument �bernommen werden. Wurde das Dokument mehrmals gepr�ft und enth�lt trotzdem viele Fehler, dann sollte die Zusammenstellung der Reviewteams genauer untersucht werden. M�glicherweise waren die ausgew�hlten Mitarbeiter als Gutachter nicht qualifiziert.",
"de","Fehler","Fehlerart",18);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (719,'Erreurs dans le code','Erreurs dans le code',"Le diagramme montre le reste des erreurs dans le code.
Les erreurs sont group�es par type d�erreur:
  => Erreurs d�analyse (EA),
  => Erreurs de la conception du syst�me (ECS) and
  => Erreurs de la conception des modules (ECM). 
  => Erreurs d�impl�mentation (EI). 
(Values: *)

Si le code contient beaucoup d�erreurs, ceci est peut �tre d� � la r�vision non exhaustive.
Il ne faut pas oublier que le nombre des erreurs augmente tout au long du projet.
S�il y a toujours des erreurs apr�s plusieurs r�visions du code, alors il faut revoir la composante du groupe de r�vision. Probablement, vous avez choisi des personnes moins comp�tentes.",
"fr","Erreurs","Type d�erreur",18);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7019,'Chyby v k�de','Chyby v k�de',"Popis: 
Diagram zobrazuje zost�vaj�ce chyby v k�de. Chyby s� zoskupen� pod�a typu. (Hodnoty: *)

Vysvetlienie/Odpor��ania:
Ak k�d obsahuje mnoho ch�b, potom ste nenechali prekontrolova� dokument dostato�ne. Nezab�dajte, �e po�et ch�b s trvan�m projektu narastaj�. Ak zdrojov� k�d bol prekontrolovan� viac ne� raz a aj napriek tomu obsahje chyby, mali by ste sa zamyslie� nad in�m zlo�en�m t�mu, ktor� dokument prehodnocoval. Mo�no ste nezvolili najvhodnej��ch v�voj�rov.",
"sk","Chyby","Typ chyby",18);
/* xxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (32,"error",null,18,26,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (39,"total errors","ALL","en",32);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (40,"Gesamtfehler","GES","de",32);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (369,"Nombre total des erreurs","Total","fr",32);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50069,"Chyby dokopy","Chyby total","sk",32);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(26,'all errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (33,"analysis errors",32,18,27,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (41,"analysis errors","AE","en",33);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (42,"Analysefehler","AF","de",33);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (270,"Erreurs d�analyse","EA","fr",33);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50070,"Chyby anal�zy","ChA","sk",33);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(27,'analysis errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_AF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (34,"system design errors",33,18,28,null);
 
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (43,"system design errors","SDE","en",34);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (44,"Grobentwurfsfehler","GF","de",34);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (271,"Erreurs de la conception du syst�me","ECS","fr",34);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50071,"Chyby n�vrhu syst�mu","ChNS","sk",34);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(28,'system design errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_GF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_GF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (35,"module design errors",34,18,29,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (45,"module design errors","MDE","en",35);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (46,"Feinentwurfsfehler","FF","de",35);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (272,"Erreurs de la conception des modules","ECM","fr",35);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50072,"Chyby n�vrhu modulov","ChNM","sk",35);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(29,'module design errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_FF");
 
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (36,"implementation errors",35,18,30,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (47,"implementation errors","IE","en",36);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (48,"Implementationsfehler","IF","de",36);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (273,"Erreurs d'impl�mentation","EI","fr",36);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50073,"Chyby implement�cie","ChI","sk",36);


INSERT INTO query(qid,attribute,statement,z_path) VALUES
(30,'implementation errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_IF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_IF");




/* Restfehler im Dokument Handbuch */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (13,"Errors in the documentation",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (25,"Errors in the documentation","en",13);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (26,"Restfehler im Handbuch","de",13);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (512,"Erreurs dans la documentation","fr",13);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5012,"Chyby v dokument�cii","sk",13);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid) 
VALUES (19,'Errors in the documentation',1,'V',13);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (41,'Errors in the documentation','Errors in the documentation',"Description: 
The diagram shows the remaining errors in the documentation. The errors are grouped by the kind of error. (Values: *)

Explanation/Recommendations:
If the documentation contains a lot of errors, then you did not review the document thoroughly. Maybe you have forgotten to invite the customer to a review of the documentation. The customer should always participate in a review of the documentation, because the customer detects a lot of errors which would not be found by the internal reviewers. The customer can also find missing functionality which can be easily integrated in the system, if the development of the system is in an earlier project phase. If the documentation was reviewed more than once and contains still a lot of errors, then you should take a closer look at the different review teams. Maybe you have chosen the wrong developers.",
"en","Errors","Kind of error",19);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (42,"Restfehler im Handbuch","Restfehler im Handbuch","Beschreibung: 
Das Diagramm zeigt die Restfehler im Handbuch. Die Fehler werden nach der Fehlerart (Analysefehler (AF), Handbuchfehler (HF)) aufgeschl�sselt. (Werte: *)

Erkl�rung/Empfehlungen:
Enth�lt das Handbuch noch viele Analysefehler (mehr als 30), dann wurde das Dokument nicht ausreichend gepr�ft. M�glicherweise wurde der Kunde nicht zu einem Review des Handbuchs eingeladen. Der Kunde sollte allerdings immer an mindestens einem Review teilnehmen, da er viele Fehler findet, die die Gutachter nicht entdecken k�nnen. Au�erdem kann er auf fehlende Funktionalit�ten hinweisen, die zu einem fr�hen Zeitpunkt noch recht g�nstig integriert werden k�nnen.
Wurde die Spezifikation mehrmals gepr�ft und enth�lt trotzdem viele Fehler, dann sollte die Zusammenstellung der Reviewteams genauer untersucht werden. M�glicherweise waren die ausgew�hlten Mitarbeiter als Gutachter nicht qualifiziert.",
"de","Fehler","Fehlerart",19);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (720,'Erreurs dans la documentation','Erreurs dans la documentation',"Le diagramme montre le reste des erreurs dans la documentation.
Les erreurs sont group�es par type d�erreur:
  => Erreurs d�analyse (EA),
 => Erreurs de documentation (ED).
(Values: *)

Si la documentation contient beaucoup d�erreurs, ceci est peut �tre d� � la r�vision non exhaustive.
Peut �tre, vous avez oubli� d'inviter le client pour participer dans la r�vision de la documentation. Sa pr�sence est indispensable pour pouvoir d�tecter plus d�erreurs.
Si le d�veloppement du syst�me est dans ses premi�res phases, le client peut trouver les fonctionnalit�s manquantes qui peuvent �tre int�gr�es facilement dans le syst�me.
S�il y a toujours des erreurs apr�s plusieurs r�visions de la documentation, alors il faut revoir la composante du groupe de r�vision. Probablement, vous avez choisi des personnes moins comp�tentes.",
"fr","Erreurs","Type d�erreur",19);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7020,'Chyby v dokument�cii','Chyby v dokument�cii',"Popis: 
Diagram zobrazuje zvy�n� chyby v dokument�cii. Chyby s� zoskupen� na z�klade typu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Ak dokument�cie obsahuje ve�a ch�b, potom ste neurobili posudok dokumentu poriadne. Mo�no ste zabudli zahrn�� z�kazn�ka do posudzovania dokument�cie. Z�kazn�k by mal st�le by� s��as�ou t�mu, ktor� posudzuje dokument, preto�e vie odhali� mnoho ch�b, ktor� by in�mi intern�mi zamestnancami vykon�vaj�cimi posudok. Z�kazn�k taktie� dok�e n�js� ch�baj�cu funkcionalitu, ktor� m��e by� jednoducho integrovan� do syst�mu, ak je jeho v�voj e�te len v po�iato�n�ch f�zach. Ak dokument�cia bola pos�den� viac ne� raz a napriek tomu obsahuje chyby, mali by ste da� �ancu in�mu zlo�eniu posudzuj�ceho t�mu. Mo�no ste nezvolili spr�vnych v�voj�rov.",
"sk","Chyby","Typ chyby",19);

/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (37,"errors",null,19,31,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (49,"total errors","ALL","en",37);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50,"Gesamtfehler","GES","de",37);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (274,"Nombre total des erreurs","Total","fr",37);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50074,"Chyby dokopy","Total","sk",37);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(31,'all errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_FEHLER_GES");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (38,"analysis errors",37,19,32,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (51,"analysis errors","AE","en",38);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (52,"Analysefehler","AF","de",38);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (275,"Erreurs d�analyse","EA","fr",38);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50075,"Chyby anal�zy","ChA","sk",38);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(32,'analysis errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_AF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_AF");
 
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (39,"manual errors",38,19,33,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (53,"manual errors","ME","en",39);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (54,"Handbuchfehler","HF","de",39);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (276,"Erreurs dans le manuel","EM","fr",39);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50076,"Chyby manu�lu","ChM","sk",39);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(33,'documentation errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_HF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_HF");



/* Effizienz der Spezifikationsreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (14,"Efficiency of specification reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (27,"Efficiency of specification reviews","en",14);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (28,"Effizienz der Spezifikationsreviews","de",14);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (513,"Rendement de la r�vision des sp�cifications","fr",14);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5013,"Efektivita posudzovania �pecifik�ci�","sk",14);

/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,diagram,layout,aiddid) 
VALUES (20,"Efficiency of specification reviews",1,'V',14);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (43,"Efficiency of specification reviews","Efficiency of specification reviews","Description: 
The diagram shows the efficiency of the specification reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the specification reviews.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the document.

This diagram gives you an idea about the cost and benefit of the reviews. You can see if the review effort was justifiable, means the review team found enough errors in reference to the review effort.",
"en","x","y",20);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (44,"Effizienz der Spezifikationsreviews","Effizienz der Spezifikationsreviews","Beschreibung: 
Das Diagramm zeigt die Effizienz der Spezifikationsreviews. (Werte: *)

Erkl�rungen/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Spezifikationsreviews.
Der zweite Balken zeigt die gefundenen Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Reviews an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Review gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Review besser verzichtet h�tte.",
"de","x","y",20);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (721,"Rendement de la r�vision des sp�cifications","Rendement de la r�vision des sp�cifications","Le diagramme montre le rendement de la r�vision des sp�cifications. (Values: *)

La premi�re barre montre l�effort consenti dans la r�vision des sp�cifications.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du document.

Le diagramme donne une id�e sur le co�t et les retomb�s de la r�vision.
On peut constater l�utilit� de la r�vision dans la recherche des erreurs.",
"fr","x","y",20);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7021,"Efektivita posudzovania �pecifik�ci�","Efektivita posudzovania �pecifik�ci�","Popis: 
Diagram poukazuje na efektivitu posudzovania �pecifik�ci�. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec zobrazuje �silie vynalo�en� na posudzovanie �pecifik�ci�.
Druh� st�pec predstavuje n�jden� chyby.
Tret� st�pec zobrazuje �silie vynalo�en� na opravu dokumentu.

Tento diagram V�m d�va pribli�n� predstavu o n�kladoch a prospechoch z posudzovania. M��ete sa presved�i� o tom, �i vynalo�en� �silie bolo opr�vnen�, teda, �i posudzuj�ci t�m odhalil dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",20);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (40,"review",null,20,34,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (55,"*","RE","en",40);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (56,"*","RA","de",40);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (277,"*","RE","fr",40);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50077,"*","PO","sk",40);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(34,'review effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (41,"detected errors",40,20,35,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (57,"detected errors","DR","en",41);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (58,"gefundene Fehler","gF","de",41);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (278,"Erreurs d�tect�es","ED","fr",41);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50078,"Odhalen� chyby","OCh","sk",41);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(35,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATIONSREVIEWBERICHT*Specificationsreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (42,"corrected errors",41,20,36,null);
 
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (59,"corrected errors","CE","en",42);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (60,"korrigierte Fehler","kF","de",42);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (279,"Erreurs corrig�es","EC","fr",42);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50079,"Opraven� chyby","OCh","sk",42);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(36,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "SREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*SREVIEW_K_AUFWAND");




/* Effizienz des Systemdesignreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (15,"Efficiency of system design reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (29,"Efficiency of system design reviews","en",15);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (30,"Effizienz der Systemdesignreviews","de",15);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (514,"Rendement de r�vision de la conception du syst�me","fr",15);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5014,"Efektivita posudzovania n�vrhu syst�mu","sk",15);

/* xxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (21,'Efficiency of system design reviews',1,'V',15);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (45,'Efficiency of system design reviews','Efficiency of system design reviews',"Description: 
The diagram shows the efficiency of the system design reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the system design reviews.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the document.

This diagram gives you an idea about the cost and benefit of the reviews. You can see if the review effort was justifiable, means the review team found enough errors in reference to the review effort.",
"en","x","y",21);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (46,"Effizienz der Systemdesignreviews","Effizienz der Systemdesignreviews","Beschreibung: 
Das Diagramm zeigt die Effizienz der Systemdesignreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Systemdesignreviews.
Der zweite Balken zeigt die gefundenen Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Reviews an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Review gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Review besser verzichtet h�tte.",
"de","x","y",21);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (722,'Rendement de r�vision de la conception du syst�me','Rendement de r�vision de la conception du syst�me',"Le diagramme montre le rendement de r�vision de la conception du syst�me. (Values: *)

La premi�re barre montre l�effort consenti par les participants dans la r�vision.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du document.

Le diagramme donne une id�e sur le co�t et les retomb�s de la r�vision.
On peut constater l�utilit� de la r�vision dans la recherche des erreurs.",
"fr","x","y",21);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7022,'Efektivita posudzovania n�vrhu syst�mu','Efektivita posudzovania n�vrhu syst�mu',"Popis: 
Diagram popisuje efektivitu posudzovania n�vrhu syst�mu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec reprezentuje �silie vynalo�en� na posudzovanie n�vrhu syst�mu.
Druh� st�pec ukazuje odhalen� chyby.
Tret� st�pec predstavuje �silie vynalo�en� na opravu dokumentu.

Tento diagram V�m d�va ak�si predstavu o n�kladoch na posudzovanie a prospechu zo�. M��ete sa presved�i�, �i �silie bolo opr�vnen�, �o znamen�, �i posudzuj�ci t�m odhalil dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",21);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (43,"*",null,21,37,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (61,"*","RE","en",43);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (62,"*","RA","de",43);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (280,"*","RE","fr",43);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50080,"*","SP","sk",43);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(37,'review effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (44,"detected errors",43,21,38,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (63,"detected errors","DE","en",44);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (64,"gefundene Fehler","gF","de",44);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (281,"Erreurs d�tect�es","ED","fr",44);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50081,"Odhalen� chyby","OCh","sk",44);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(38,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (45,"corrected errors",44,21,39,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (65,"corrected errors","CE","en",45);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (66,"korrigierte Fehler","kF","de",45);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (282,"Erreurs corrig�es","EC","fr",45);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50082,"Opraven� chyby","OCh","sk",45);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(39,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "EREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*EREVIEW_K_AUFWAND");



/* Effizienz des Moduledesignreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (16,"Efficiency of module design reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (31,"Efficiency of module design reviews","en",16);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (32,"Effizienz der Moduldesignreviews","de",16);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (515,"Rendement de r�vision de la conception des modules","fr",16);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5015,"Efektivita posudzovania n�vrhu modulov","sk",16);

/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (22,'Efficiency of module design reviews',1,'V',16);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (47,'Efficiency of module design reviews','Efficiency of module design reviews',"Description: 
The diagram shows the efficiency of the module design reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the module design reviews.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the document.

This diagram gives you an idea about the cost and benefit of the reviews. You can see if the review effort was justifiable, means the review team found enough errors in reference to the review effort.",
"en","x","y",22);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (48,"Effizienz der Moduldesignreviews","Effizienz der Moduldesignreviews","Beschreibung: 
Das Diagramm zeigt die Effizienz der Moduledesignsreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Moduledesignreviews.
Der zweite Balken zeigt die gefundenen Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Reviews an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Review gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Review besser verzichtet h�tte.",
"de","x","y",22);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (723,'Rendement de r�vision de la conception des modules','Rendement de r�vision de la conception des modules',"Le diagramme montre le rendement de r�vision de la conception des modules. (Values: *)

La premi�re barre montre l�effort consenti par les participants dans la r�vision des modules.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du document.

Le diagramme donne une id�e sur le co�t et les retomb�s de la r�vision.
On peut constater l�utilit� de la r�vision dans la recherche des erreurs.",
"fr","x","y",22);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7023,'Efektivita posudzovania n�vrhu modulov','Efektivita posudzovania n�vrhu modulov',"Popis: 
Diagram popisuje efektivitu posudzovania n�vrhu modulov. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na posudzovanie n�vrhu modulov.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy dokumentu.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z posudzovania. M��ete vidie�, �i �silie na posudzovanie bolo opr�vnen�, a teda, �i posudzuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",22);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (46,"*",null,22,40,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (67,"*","RE","en",46);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (68,"*","RA","de",46);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (283,"*","RE","fr",46);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50083,"*","SP","sk",46);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(40,'review effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (47,"detected errors",46,22,41,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (69,"detected errors","DE","en",47);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (70,"gefundene Fehler","gF","de",47);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (284,"Erreurs d�tect�es","ED","fr",47);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50084,"Odhalen� chyby","OCh","sk",47);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(41,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (48,"corrected errors",47,22,42,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (71,"corrected errors","CE","en",48);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (72,"korrigierte Fehler","kF","de",48);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (285,"Erreurs corrig�es","EC","fr",48);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50085,"Opraven� chyby","Och","sk",48);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(42,'Correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*MREVIEW_K_AUFWAND");



/* Effizienz des Codereviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (17,"Efficiency of code reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (33,"Efficiency of code reviews","en",17);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (34,"Effizienz der Codereviews","de",17);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (516,"Rendement de la r�vision du code","fr",17);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5016,"Efektivita posudzovania k�du","sk",17);

/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (23,"Efficiency of code reviews",1,'V',17);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (49,"Efficiency of code reviews","Efficiency of code reviews","Description: 
The diagram shows the efficiency of the code reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the code reviews.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the document.

This diagram gives you an idea about the cost and benefit of the reviews. You can see if the review effort was justifiable, means the review team found enough errors in reference to the review effort.",
"en","x","y",23);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (50,"Effizienz der Codereviews","Effizienz der Codereviews","Beschreibung: 
Das Diagramm zeigt die Effizienz der Codereviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Codereviews.
Der zweite Balken zeigt die gefundenen Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Reviews an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Review gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Review besser verzichtet h�tte.",
"de","x","y",23);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (724,"Rendement de la r�vision du code","Rendement de la r�vision du code","Le diagramme montre le rendement de la r�vision du code. (Values: *)

La premi�re barre montre l�effort consenti par les participants dans le code.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du document.

Le diagramme donne une id�e sur le co�t et les retomb�s de la r�vision.
On peut constater l�utilit� de la r�vision dans la recherche des erreurs.",
"fr","x","y",23);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7024,"Efektivita posudzovania k�du","Efektivita posudzovania k�du","Popis: 
Diagram predstavuje efektivitu posudzovania k�du. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec zobrazuje snahu vynalo�en� na posudzovanie k�du.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zachyt�va snahu vynalo�en� na opravu dokumentu.

Tento diagram poskytuje ur�it� poh�ad na n�klady a prospech z posudzovania. M��ete vidie�, �i vynalo�en� �silie na posudzovanie bolo opr�vnen�, a teda, �i posudzuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",23);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (49,"*",null,23,43,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (73,"*","RE","en",49);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (74,"*","RA","de",49);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (286,"*","RE","fr",49);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50086,"*","SP","sk",49);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(43,'review effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*CREVIEW_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (50,"detected errors",49,23,44,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (75,"detected errors","DE","en",50);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (76,"gefundene Fehler","gF","de",50);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (287,"Erreurs d�tect�es","ED","fr",50);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50087,"Odhalen� chyby","OCh","sk",50);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(44,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODEREVIEWBERICHT*Codereviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (51,"corrected errors",50,23,45,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (77,"corrected errors","CE","en",51);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (78,"korrigierte Fehler","kF","de",51);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (288,"Erreurs corrig�es","EC","fr",51);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50088,"Opraven� chyby","OCh","sk",51);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(45,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "CREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*CREVIEW_K_AUFWAND");



/* Effizienz des Handbuchreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (18,"Efficiency of manual reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (35,"Efficiency of manual reviews","en",18);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (36,"Effizienz der Handbuchreviews","de",18);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (517,"Rendement de la r�vision du manuel","fr",18);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5017,"Efektivita posudzovania manu�lov","sk",18);

/* xxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (24,"Efficiency of documentation reviews",1,'V',18);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (51,"Efficiency of documentation reviews","Efficiency of documentation reviews","Description: 
The diagram shows the efficiency of the documentation reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the documentation reviews.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the document.

This diagram gives you an idea about the cost and benefit of the reviews. You can see if the review effort was justifiable, means the review team found enough errors in reference to the review effort.",
"en","x","y",24);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (52,"Effizienz der Handbuchreviews","Effizienz der Handbuchreviews","Beschreibung:
Das Diagramm zeigt die Effizienz der Handbuchreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Handbuchreviews.
Der zweite Balken zeigt die gefundenen Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Reviews an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Review gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Review besser verzichtet h�tte.",
"de","x","y",24);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (725,"Rendement de r�vision de la documentation","Rendement de r�vision de la documentation","Le diagramme montre le rendement de r�vision de la documentation. (Values: *)

La premi�re barre montre l�effort consenti par les participants dans la r�vision de la documentation.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du document.

Le diagramme donne une id�e sur le co�t et les retomb�s de la r�vision.
On peut constater l�utilit� de la r�vision dans la recherche des erreurs.",
"fr","x","y",24);


INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7025,"Efektivita posudzovania dokument�cie","Efektivita posudzovania dokument�cie","Popis: 
The diagram shows the efficiency of the documentation reviews. (Values: *)
Diagram poukazuje na efektivitu posudzovania dokument�cie. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na posudzovanie dokument�cie.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy dokumentu.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z posudzovania. M��ete vidie�, �i �silie na posudzovanie bolo opr�vnen�, a teda, �i posudzuj�ci team na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",24);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (52,"*",null,24,46,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (79,"*","RE","en",52);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (80,"*","REA","de",52);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (289,"*","RE","fr",52);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50089,"*","SP","sk",52);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(46,'review effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*HREVIEW_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (53,"detected errors",52,24,47,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (81,"detected errors","DE","en",53);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (82,"gefundene Fehler","gF","de",53);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (290,"Erreurs d�tect�es","ED","fr",53);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50090,"Odhalen� chyby","OCh","sk",53);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(47,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCHREVIEWBERICHT*Manualreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (54,"corrected errors",53,24,48,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (83,"corrected errors","CE","en",54);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (84,"gefundene Fehler","kF","de",54);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (291,"Erreurs corrig�es","EC","fr",54);
 
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50091,"Opraven� chyby","OCh","sk",54);
 
INSERT INTO query(qid,attribute,statement,z_path) VALUES
(48,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "REVIEWLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Reviewlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "HREVIEW_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**REVIEWLOGBUCH*Reviewlog*HREVIEW_K_AUFWAND");



/* Effizienz der Modultests */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (19,"Efficiency of module tests",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (37,"Efficiency of module tests","en",19);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (38,"Effizienz der Modultests","de",19);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (518,"Rendement du test  des modules","fr",19);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5018,"Efektivita testovania modulov","sk",19);

/* xxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (25,"Efficiency of module tests",1,'V',19);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (53,"Efficiency of module tests","Efficiency of module tests","Description: 
The diagram shows the efficiency of the module tests. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the module tests.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the code.

This diagram gives you an idea about the cost and benefit of the tests. You can see if the test effort was justifiable, means the testers found enough errors in reference to the test effort.",
"en","x","y",25);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (54,"Effizienz der Modultests","Effizienz der Modultests","Beschreibung: 
Dieses Diagramm zeigt die Effizienz der Modultests. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Modultest.
Der zweite Balken zeigt die gefundene Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Tests an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Test gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Test besser verzichtet h�tte.",
"de","x","y",25);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (726,"Rendement du test  des modules","Rendement du test  des modules","Le diagramme montre le rendement du test  des modules. (Values: *)

La premi�re barre montre l�effort consenti dans le test des modules.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du code.

Le diagramme donne une id�e sur le co�t et les r�sultats du test.
On peut constater si les tests effectu�s ont permis de trouver beaucoup d'erreurs.",
"fr","x","y",25);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7026,"Efektivita testovania modulov","Efektivita testovania modulov","Popis: 
Diagram popisuje efektivitu testovania modulov. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na testovanie modulov.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy k�du.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z testovania. M��ete vidie�, �i �silie vynalo�en� na testovanie bolo opr�vnen�, a teda, �i testuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",25);
/* xxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (55,"*",null,25,49,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (85,"*","TE","en",55);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (86,"*","TA","de",55);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (292,"*","ET","fr",55);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50092,"*","ST","sk",55);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(49,'test effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*MTEST_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (56,"detected errors",55,25,50,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (87,"detected errors","DE","en",56);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (88,"gefundene Fehler","gF","de",56);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (293,"Erreurs d�tect�es","ED","fr",56);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50093,"Odhalen� chyby","OCh","sk",56);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(50,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULTESTBERICHT*Moduletestreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (57,"corrected errors",56,25,51,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (89,"corrected errors","CE","en",57);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (90,"korrigierte Fehler","kF","de",57);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (294,"Erreurs corrig�es","EC","fr",57);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50094,"Opraven� chyby","OCh","sk",57);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(51,'Correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "MTEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*MTEST_K_AUFWAND");



/* Effizienz des Systemtests */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (20,"Efficiency of system tests",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (39,"Efficiency of system tests","en",20);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (40,"Effizienz der Systemtests","de",20);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (519,"Rendement du test  du syst�me","fr",20);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5019,"Efektivita testovania syst�mu","sk",20);

/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (26,"Efficiency of system tests",1,'V',20);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (55,"Efficiency of system tests","Efficiency of system tests","Description: 
The diagram shows the efficiency of the system tests. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the system tests.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the code.

This diagram gives you an idea about the cost and benefit of the tests. You can see if the test effort was justifiable, means the testers found enough errors in reference to the test effort.",
"en","x","y",26);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (56,"Effizienz der Systemtests","Effizienz der Systemtests","Beschreibung: 
Dieses Diagramm zeigt die Effizienz der Systemtests. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Systemtest.
Der zweite Balken zeigt die gefundene Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Tests an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Test gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Test besser verzichtet h�tte.",
"de","x","y",26);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (727,"Rendement du test  du syst�me","Rendement du test  du syst�me","Le diagramme montre le rendement du test  du syst�me. (Values: *)

La premi�re barre montre l�effort consenti dans le test du syst�me.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du code.

Le diagramme donne une id�e sur le co�t et les r�sultats du test.
On peut constater si les tests effectu�s ont permis de trouver beaucoup d'erreurs.",
"fr","x","y",26);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7027,"Efektivita testovania syst�mu","Efektivita testovania syst�mu","Popis: 
Diagram popisuje efektivitu testovania syst�mu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na testovanie syst�mu.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy k�du.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z testovania. M��ete vidie�, �i �silie vynalo�en� na testovanie bolo opr�vnen�, a teda, �i testuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",26);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (58,"*",null,26,52,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (91,"*","TE","en",58);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (92,"*","TA","de",58);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (295,"*","ET","fr",58);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50095,"*","ST","sk",58);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(52,'test effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*STEST_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (59,"detected errors",58,26,53,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (93,"detected errors","DE","en",59);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (94,"gefundene Fehler","gF","de",59);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (296,"Erreurs d�tect�es","ED","fr",59);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50096,"Odhalen� chyby","OCh","sk",59);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(53,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMTESTBERICHT*Systemtestreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (60,"corrected errors",59,26,54,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (95,"corrected errors","CE","en",60);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (96,"korrigierte Fehler","kF","de",60);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (297,"Erreurs corrig�es","EC","fr",60);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50097,"Opraven� chyby","OCh","sk",60);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(54,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "STEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*STEST_K_AUFWAND");



/* Effizienz des Integrationstests */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (21,"Efficiency of integration test",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (41,"Efficiency of integration test","en",21);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (42,"Effizienz der Integrationstests","de",21);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (520,"Rendement du test  d'int�gration","fr",21);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5020,"Efektivita integra�n�ch testov","sk",21);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (27,"Efficiency of integration test",1,'V',21);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (57,"Efficiency of integration test","Efficiency of integration test","Description: 
The diagram shows the efficiency of the integration tests. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the integration tests.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the code.

This diagram gives you an idea about the cost and benefit of the tests. You can see if the test effort was justifiable, means the testers found enough errors in reference to the test effort.",
"en","x","y",27);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (58,"Effizienz der Integrationstests","Effizienz der Integrationstests","Beschreibung: 
Dieses Diagramm zeigt die Effizienz der Integrationstests. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Integrationstest.
Der zweite Balken zeigt die gefundene Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Tests an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Test gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Test besser verzichtet h�tte.",
"de","x","y",27);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (728,"Rendement du test  d'int�gration","Rendement du test  d'int�gration","Le diagramme montre le rendement du test  d�int�gration. (Values: *)

La premi�re barre montre l�effort consenti dans le test d�int�gration.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du code.

Le diagramme donne une id�e sur le co�t et les r�sultats du test.
On peut constater si les tests effectu�s ont permis de trouver beaucoup d'erreurs.",
"fr","x","y",27);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7028,"Efektivita integra�n�ch testov","Efektivita integra�n�ch testov","Popis: 
The diagram shows the efficiency of the integration tests. (Values: *)
Diagram popisuje efektivitu integra�n�ho testovania. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na testovanie integr�cie.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy k�du.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z testovania. M��ete vidie�, �i �silie vynalo�en� na testovanie bolo opr�vnen�, a teda, �i testuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.",
"sk","x","y",27);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (61,"*",null,27,55,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (97,"*","TE","en",61);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (98,"*","TA","de",61);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (298,"*","ET","fr",61);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50098,"*","ST","sk",61);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(55,'test effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ITEST_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (62,"detected errors",61,27,56,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (99,"detected errors","DE","en",62);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (100,"gefundene Fehler","gF","de",62);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (299,"Erreurs d�tect�es","ED","fr",62);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50099,"Odhalen� chyby","OCh","sk",62);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(56,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**INTEGRATIONTESTBERICHT*Integrationtestreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (63,"corrected errors",62,27,57,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (101,"corrected errors","CE","en",63);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (102,"korrigierte Fehler","kF","de",63);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (300,"Erreurs corrig�es","EC","fr",63);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50100,"Opraven� chyby","OCh","sk",63);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(57,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ITEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ITEST_K_AUFWAND");



/* Effizienz des Abnahmetests */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (22,"Efficiency of acceptance test",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (43,"Efficiency of acceptance test","en",22);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (44,"Effizienz der Abnahmetests","de",22);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (521,"Rendement du test  d'acceptance","fr",22);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5021,"Efektivita akcepta�n�ch testov","sk",22);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid
(spaidid,description,diagram,layout,aiddid) 
VALUES (28,"Efficiency of acceptance test",1,'V',22);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (59,"Efficiency of acceptance test","Efficiency of acceptance test","Description: 
The diagram shows the efficiency of the acceptance tests. (Values: *)

Explanation/Recommendations:
The first bar shows the effort for the acceptance tests.
The second bar shows the detected errors.
The third bar shows the effort for the correction of the code.

This diagram gives you an idea about the cost and benefit of the tests. You can see if the test effort was justifiable, means the testers found enough errors in reference to the test effort. 
Attention! This shows the qualification of the customer as a tester.",
"en","x","y",28);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (60,"Effizienz der Abnahmetests","Effizienz der Abnahmetests","Beschreibung: 
Dieses Diagramm zeigt die Effizienz der Abnahmetests. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt den Aufwand f�r die Abnahmetest.
Der zweite Balken zeigt die gefundene Fehler.
Der dritte Balken zeigt den Korrekturaufwand.

Dieses Diagramm zeigt Kosten und Nutzen eines Tests an. Es kann aufgrund der Balken leicht festgestellt werden, ob der Aufwand f�r einen Test gerechtfertigt war, das hei�t ob gen�gend Fehler gefunden wurden, oder ob man auf den Test besser verzichtet h�tte. 
Achtung! Dies zeigt allerdings nur, ob der Kunde ein guter Tester war.",
"de","x","y",28);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (729,"Rendement du test  d'acceptance","Rendement du test  d'acceptance","Le diagramme montre le rendement du test  d�acceptance. (Values: *)

La premi�re barre montre l�effort consenti dans le test d�acceptance.
La seconde barre montre les erreurs d�tect�es.
La troisi�me barre montre l�effort consenti pour la correction du code.

Le diagramme donne une id�e sur le co�t et les r�sultats du test.
On peut constater si les tests effectu�s ont permis de trouver beaucoup d'erreurs.
Attention! Ceci montre les capacit�s du client en mati�re de test.",
"fr","x","y",28);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7029,"Efektivita akcepta�n�ch testov","Efektivita akcepta�n�ch testov","Popis: 
Diagram popisuje efektivitu akcepta�n�ch testov. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje snahu vynalo�en� na akcepta�n� testovanie.
Druh� st�pec reprezentuje odhalen� chyby.
Tret� st�pec zn�zor�uje snahu vynalo�en� na opravy k�du.

Tento diagram vytv�ra predstavu o n�kladoch a prospechu z testovania. M��ete vidie�, �i �silie vynalo�en� na testovanie bolo opr�vnen�, a teda, �i testuj�ci t�m na�iel dostatok ch�b s oh�adom na vynalo�en� �silie.
Pozor! Je to zn�zornenie kvalifik�cie z�kazn�ka ako testuj�ceho.",
"sk","x","y",28);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (64,"*",null,28,58,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (103,"*","TE","en",64);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (104,"*","TA","de",64);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (301,"*","ET","fr",64);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50101,"*","ST","sk",64);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(58,'test effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ATEST_AUFWAND");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (65,"detected errors",64,28,59,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (105,"detected errors","DE","en",65);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (106,"gefundene Fehler","gF","de",65);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (302,"Erreurs d�tect�es","ED","fr",65);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50102,"Odhalen� chyby","OCh","sk",65);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(59,'detected errors',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ABNAHMETESTBERICHT*Acceptancetestreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (66,"corrected errors",65,28,60,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (107,"corrected errors","CE","en",66);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (108,"korrigierte Fehler","kF","de",66);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (303,"Erreurs corrig�es","EC","fr",66);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50103,"Opraven� chyby","OCh","sk",66);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(60,'correction effort',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "TESTLOGBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Testlog" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ATEST_K_AUFWAND" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**TESTLOGBUCH*Testlog*ATEST_K_AUFWAND");



/* Effektivit�t der Spezifikationsreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (23,"Effectiveness of specification reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (45,"Effectiveness of specification reviews","en",23);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (46,"Effektivit�t der Spezifikationsreviews","de",23);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (522,"Efficacit� de la r�vision des sp�cifications","fr",23);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5022,"Efektivita posudzovania �pecifik�cie","sk",23);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid)
VALUES (29,"Effectiveness of specification reviews",1,'V',23);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (61,"Effectiveness of specification reviews","Effectiveness of specification reviews","Description: 
This diagram shows the effectiveness of the specification reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the numer of errors detected in the reviews.
The second bar shows the errors which are already in the document.

By means of this values you can see if you have chosen the right reviewers. If the reviewers have detected only a few of the contained errors, then you did not choose the best qualified employees. If the reviewers have detected a lot of errors then you have chosen qualified developers.",
"en","x","y",29);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (62,"Effektivit�t der Spezifikationsreviews","Effektivit�t der Spezifikationsreviews","Beschreibung: 
Dieses Diagram zeigt die Effektivit�t der Spezifikationsreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt die Anzahl der Fehler, die durch den Review gefunden wurden. 
Der zweite Balken zeigt die Fehler, die im Dokument enthalten sind.

Anhand dieser Werte kann festgestellt werden, ob die Gutachterwahl sorgf�ltig getroffen wurde. Wurden nur wenige der im Dokument enthaltenen Fehler gefunden, dann deutet dies auf eine schlechte Gutachterwahl hin. Wurden hingegen viele der im Dokument enthaltenen Fehler gefunden, dann wurden qualifizierte Mitarbeiter als Gutachter eingesetzt.",
"de","x","y",29);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (730,"Efficacit� de la r�vision des sp�cifications","Efficacit� de la r�vision des sp�cifications","Le diagramme montre l'efficacit� de la r�vision des sp�cifications. (Values: *)

La premi�re barre montre le nombre des erreurs d�tect�es durant la r�vision.
La seconde barre montre les erreurs non d�tect�es. Les nombres montr�s permettent de constater si vous avez choisi les bonnes personnes pour la r�vision. Un nombre faible d'erreurs d�tect�es parmi toutes les existantes signifie que les personnes engag�es sont efficaces, sinon elles ne sont pas.",
"fr","x","y",29);


INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7030,"Efektivita posudzovania �pecifik�cie","Efektivita posudzovania �pecifik�cie","Popis: 
Diagram popisuje efektivitu posudzovania �pecifik�cie. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje po�et ch�b odhalen�ch posudkami.
Druh� st�pec reprezentuje chyby, ktor� u� s� v dokumente.

T�mito hodnotami sa m��ete presved�i� o svojom (ne)vhodnom v�bere posudzuj�cich. Ak posudzuj�ci odhalili len nieko�ko zo v�etk�ch ch�b, potom ste nezvolili najkvalifikovanej��ch zamestnancov. Naopak, ak posudzuj�ci odhalili mnoho ch�b, potom ste zvolili kvalifikovan�ch v�voj�rov.",
"sk","x","y",29);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (67,"errors",null,29,61,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (109,"total errors","ALL","en",67);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (110,"Gesamtfehler","GES","de",67);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (304,"Nombre total des erreurs","Total","fr",67);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50104,"Chyby dokopy","Chyby total","sk",67);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(61,'detected errors in reviews',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATIONSREVIEWBERICHT+Specificationreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (68,"corrected errors",67,29,62,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (111,"corrected errors","CE","en",68);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (112,"korrigierte Fehler","kF","de",68);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (305,"Erreurs corrig�es","EC","fr",68);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50105,"Opraven� chyby","OCh","sk",68);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(62,'contained errors in document ',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specification" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATION*Specification*ANZ_FEHLER_GES");



/* Effektivit�t des Systemdesignreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (24,"Effectiveness of system design reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (47,"Effectiveness of system design reviews","en",24);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (48,"Effektivit�t der Systemdesignreviews","de",24);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (523,"Efficacit� de r�vision de la conception du syst�me","fr",24);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5023,"Efektivita posudzovania n�vrhu syst�mu","sk",24);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid)
VALUES (30,"Effectiveness of system design reviews",1,'V',24);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (63,"Effectiveness of system design reviews","Effectiveness of system design reviews","Description: 
This diagram shows the effectiveness of the system design reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the numer of errors detected in the reviews.
The second bar shows the errors which are already in the document.

By means of this values you can see if you have chosen the right reviewers. If the reviewers have detected only a few of the contained errors, then you did not choose the best qualified employees. If the reviewers have detected a lot of errors then you have chosen qualified developers.",
"en","x","y",30);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (64,"Effektivit�t der Systemdesignreviews","Effektivit�t der Systemdesignreviews","Beschreibung: 
Dieses Diagram zeigt die Effektivit�t der Systemdesignreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt die Anzahl der Fehler, die durch den Review gefunden wurden. 
Der zweite Balken zeigt die Fehler, die im Dokument enthalten sind.

Anhand dieser Werte kann festgestellt werden, ob die Gutachterwahl sorgf�ltig getroffen wurde. Wurden nur wenige der im Dokument enthaltenen Fehler gefunden, dann deutet dies auf eine schlechte Gutachterwahl hin. Wurden hingegen viele der im Dokument enthaltenen Fehler gefunden, dann wurden qualifizierte Mitarbeiter als Gutachter eingesetzt.",
"de","x","y",30);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (731,"Efficacit� de r�vision de la conception du syst�me","Efficacit� de r�vision de la conception du syst�me","Le diagramme montre l'efficacit� de r�vision de la conception du syst�me. (Values: *)

La premi�re barre montre le nombre des erreurs d�tect�es durant la r�vision.
La seconde barre montre les erreurs non d�tect�es. Les nombres montr�s permettent de constater si vous avez choisi les bonnes personnes pour la r�vision. Un nombre faible d'erreurs d�tect�es parmi toutes les existantes signifie que les personnes engag�es sont efficaces, sinon elles ne sont pas.",
"fr","x","y",30);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7031,"Efektivita posudzovania n�vrhu syst�mu","Efektivita posudzovania n�vrhu syst�mu","Popis: 
Diagram popisuje efektivitu posudzovania posudzovania n�vrhu syst�mu. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje po�et ch�b odhalen�ch posudkami.
Druh� st�pec reprezentuje chyby, ktor� u� s� v dokumente.

T�mito hodnotami sa m��ete presved�i� o svojom (ne)vhodnom v�bere posudzuj�cich. Ak posudzuj�ci odhalili len nieko�ko zo v�etk�ch ch�b, potom ste nezvolili najkvalifikovanej��ch zamestnancov. Naopak, ak posudzuj�ci odhalili mnoho ch�b, potom ste zvolili kvalifikovan�ch v�voj�rov.",
"sk","x","y",30);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (69,"detected errors",null,30,63,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (113,"detected errors","DE","en",69);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (114,"gefundene Fehler","gF","de",69);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (306,"Erreurs d�tect�es","ED","fr",69);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50106,"Odhalen� chyby","OCh","sk",69);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(63,'detected errors in reviews',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (70,"corrected errors",69,30,64,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (115,"corrected errors","CE","en",70);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (116,"korrigierte Fehler","kF","de",70);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (307,"Erreurs corrig�es","EC","fr",70);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50107,"Opraven� chyby","OCh","sk",70);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(64,'contained errors in document',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURF" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURF*Systemdesign*ANZ_FEHLER_GES");



/* Effektivit�t des Moduledesignreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (25,"Effectiveness of module design reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (49,"Effectiveness of module design reviews","en",25);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (50,"Effektivit�t der Moduldesignreviews","de",25);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (524,"Efficacit� de r�vision de la conception des modules","fr",25);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5024,"Efektivita posudzovania n�vrhu modulov","sk",25);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid)
VALUES (31,"Effectiveness of module design reviews",1,'V',25);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (65,"Effectiveness of module design reviews","Effectiveness of module design reviews","Description: 
This diagram shows the effectiveness of the module design reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the numer of errors detected in the reviews.
The second bar shows the errors which are already in the document.

By means of this values you can see if you have chosen the right reviewers. If the reviewers have detected only a few of the contained errors, then you did not choose the best qualified employees. If the reviewers have detected a lot of errors then you have chosen qualified developers.",
"en","x","y",31);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (66,"Effektivit�t der Moduldesignreviews","Effektivit�t der Moduldesignreviews","Beschreibung: 
Dieses Diagram zeigt die Effektivit�t der Moduldesignreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt die Anzahl der Fehler, die durch den Review gefunden wurden. 
Der zweite Balken zeigt die Fehler, die im Dokument enthalten sind.

Anhand dieser Werte kann festgestellt werden, ob die Gutachterwahl sorgf�ltig getroffen wurde. Wurden nur wenige der im Dokument enthaltenen Fehler gefunden, dann deutet dies auf eine schlechte Gutachterwahl hin. Wurden hingegen viele der im Dokument enthaltenen Fehler gefunden, dann wurden qualifizierte Mitarbeiter als Gutachter eingesetzt.",
"de","x","y",31);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (732,"Efficacit� de r�vision de la conception des modules","Efficacit� de r�vision de la conception des modules","Le diagramme montre l'efficacit� de r�vision de la conception des modules. (Values: *)

La premi�re barre montre le nombre des erreurs d�tect�es durant la r�vision.
La seconde barre montre les erreurs non d�tect�es. Les nombres montr�s permettent de constater si vous avez choisi les bonnes personnes pour la r�vision. Un nombre faible d'erreurs d�tect�es parmi toutes les existantes signifie que les personnes engag�es sont efficaces, sinon elles ne sont pas.",
"fr","x","y",31);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7032,"Efektivita posudzovania n�vrhu modulov","Efektivita posudzovania n�vrhu modulov","Popis: 
Diagram popisuje efektivitu posudzovania n�vrhu modulov. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje po�et ch�b odhalen�ch posudkami.
Druh� st�pec reprezentuje chyby, ktor� u� s� v dokumente.

T�mito hodnotami sa m��ete presved�i� o svojom (ne)vhodnom v�bere posudzuj�cich. Ak posudzuj�ci odhalili len nieko�ko zo v�etk�ch ch�b, potom ste nezvolili najkvalifikovanej��ch zamestnancov. Naopak, ak posudzuj�ci odhalili mnoho ch�b, potom ste zvolili kvalifikovan�ch v�voj�rov.",
"sk","x","y",31);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (71,"detected errors",null,31,65,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (117,"detected errors","DE","en",71);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (118,"gefundene Fehler","gF","de",71);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (308,"Erreurs d�tect�es","ED","fr",71);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50108,"Odhalen� chyby","OCh","sk",71);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(65,'detected errors in reviews',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (72,"corrected errors",71,31,66,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (119,"corrected errors","CE","en",72);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (120,"korrigierte Fehler","kF","de",72);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (309,"Erreurs corrig�es","EC","fr",72);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50109,"Opraven� chyby","OCh","sk",72);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(66,'contained errors in document',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZIFIKATION" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesign" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZIFIKATION*Moduldesign*ANZ_FEHLER_GES");



/* Effektivit�t des Codereviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (26,"Effectiveness of code reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (51,"Effectiveness of code reviews","en",26);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (52,"Effektivit�t der Codereviews","de",26);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (525,"Efficacit� de la r�vision du code","fr",26);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5025,"Efektivita posudzovania k�du","sk",26);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid)
VALUES (32,"Effectiveness of code reviews",1,'V',26);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (67,"Effectiveness of code reviews","Effectiveness of code reviews","Description: 
This diagram shows the effectiveness of the code reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the numer of errors detected in the reviews.
The second bar shows the errors which are already in the document.

By means of this values you can see if you have chosen the right reviewers. If the reviewers have detected only a few of the contained errors, then you did not choose the best qualified employees. If the reviewers have detected a lot of errors then you have chosen qualified developers.",
"en","x","y",32);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (68,"Effektivit�t der Codereviews","Effektivit�t der Codereviews","Beschreibung: 
Dieses Diagram zeigt die Effektivit�t der Codereviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt die Anzahl der Fehler, die durch den Review gefunden wurden. 
Der zweite Balken zeigt die Fehler, die im Dokument enthalten sind.

Anhand dieser Werte kann festgestellt werden, ob die Gutachterwahl sorgf�ltig getroffen wurde. Wurden nur wenige der im Dokument enthaltenen Fehler gefunden, dann deutet dies auf eine schlechte Gutachterwahl hin. Wurden hingegen viele der im Dokument enthaltenen Fehler gefunden, dann wurden qualifizierte Mitarbeiter als Gutachter eingesetzt.",
"de","x","y",32);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (733,"Efficacit� de la r�vision du code","Efficacit� de la r�vision du code","Le diagramme montre l'efficacit� de la r�vision du code. (Values: *)

La premi�re barre montre le nombre des erreurs d�tect�es durant la r�vision.
La seconde barre montre les erreurs non d�tect�es. Les nombres montr�s permettent de constater si vous avez choisi les bonnes personnes pour la r�vision. Un nombre faible d'erreurs d�tect�es parmi toutes les existantes signifie que les personnes engag�es sont efficaces, sinon elles ne sont pas.",
"fr","x","y",32);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7033,"Efektivita posudzovania k�du","Efektivita posudzovania k�du","Popis: 
Diagram popisuje efektivitu posudzovania k�du. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje po�et ch�b odhalen�ch posudkami.
Druh� st�pec reprezentuje chyby, ktor� u� s� v dokumente.

T�mito hodnotami sa m��ete presved�i� o svojom (ne)vhodnom v�bere posudzuj�cich. Ak posudzuj�ci odhalili len nieko�ko zo v�etk�ch ch�b, potom ste nezvolili najkvalifikovanej��ch zamestnancov. Naopak, ak posudzuj�ci odhalili mnoho ch�b, potom ste zvolili kvalifikovan�ch v�voj�rov.",
"sk","x","y",32);

/* xxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (73,"detected errors",null,32,67,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (121,"detected errors","DE","en",73);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (122,"gefundene Fehler","gF","de",73);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (310,"Erreurs d�tect�es","ED","fr",73);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50110,"Odhalen� chyby","OCh","sk",73);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(67,'detected errors in reviews',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODEREVIEWBERICHT*Codereviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (74,"corrected errors",73,32,68,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (123,"corrected errors","CE","en",74);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (124,"korrigierte Fehler","kF","de",74);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (311,"Erreurs corrig�es","EC","fr",74);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50111,"Opraven� chyby","OCh","sk",74);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(68,'contained errors in code',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODE" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Code" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODE*Code*ANZ_FEHLER_GES");



/* Effektivit�t des Manualreviews */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (27,"Effectiveness of documentation reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (53,"Effectiveness of documentation reviews","en",27);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (54,"Effektivit�t der Handbuchreviews","de",27);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (526,"Efficacit� de r�vision de la documentation","fr",27);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5026,"Efektivita posudzovania dokument�cie","sk",27);

/* xxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid(spaidid,description,diagram,layout,aiddid)
VALUES (33,"Effectiveness of documentation reviews",1,'V',27);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (69,"Effectiveness of documentation reviews","Effectiveness of documentation reviews","Description: 
This diagram shows the effectiveness of the documentation reviews. (Values: *)

Explanation/Recommendations:
The first bar shows the numer of errors detected in the reviews.
The second bar shows the errors which are already in the document.

By means of this values you can see if you have chosen the right reviewers. If the reviewers have detected only a few of the contained errors, then you did not choose the best qualified employees. If the reviewers have detected a lot of errors then you have chosen qualified developers.",
"en","x","y",33);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (70,"Effektivit�t der Handbuchreviews","Effektivit�t der Handbuchreviews","Beschreibung: 
Dieses Diagram zeigt die Effektivit�t der Handbuchreviews. (Werte: *)

Erkl�rung/Empfehlungen:
Der erste Balken zeigt die Anzahl der Fehler, die durch den Review gefunden wurden. 
Der zweite Balken zeigt die Fehler, die im Dokument enthalten sind.

Anhand dieser Werte kann festgestellt werden, ob die Gutachterwahl sorgf�ltig getroffen wurde. Wurden nur wenige der im Dokument enthaltenen Fehler gefunden, dann deutet dies auf eine schlechte Gutachterwahl hin. Wurden hingegen viele der im Dokument enthaltenen Fehler gefunden, dann wurden qualifizierte Mitarbeiter als Gutachter eingesetzt.",
"de","x","y",33);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (734,"Efficacit� de r�vision de la documentation","Efficacit� de r�vision de la documentation","Le diagramme montre l'efficacit� de r�vision de la documentation. (Values: *)

La premi�re barre montre le nombre des erreurs d�tect�es durant la r�vision.
La seconde barre montre les erreurs non d�tect�es. Les nombres montr�s permettent de constater si vous avez choisi les bonnes personnes pour la r�vision. Un nombre faible d'erreurs d�tect�es parmi toutes les existantes signifie que les personnes engag�es sont efficaces, sinon elles ne sont pas.",
"fr","x","y",33);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7034,"Efektivita posudzovania dokument�cie","Efektivita posudzovania dokument�cie","Popis: 
Diagram popisuje efektivitu posudzovania dokument�cie. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Prv� st�pec ukazuje po�et ch�b odhalen�ch posudkami.
Druh� st�pec reprezentuje chyby, ktor� u� s� v dokumente.

T�mito hodnotami sa m��ete presved�i� o svojom (ne)vhodnom v�bere posudzuj�cich. Ak posudzuj�ci odhalili len nieko�ko zo v�etk�ch ch�b, potom ste nezvolili najkvalifikovanej��ch zamestnancov. Naopak, ak posudzuj�ci odhalili mnoho ch�b, potom ste zvolili kvalifikovan�ch v�voj�rov.",
"sk","x","y",33);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (75,"detected errors",null,33,69,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (125,"detected errors","DE","en",75);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (126,"gefundene Fehler","gF","de",75);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (312,"Erreurs d�tect�es","ED","fr",75);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50112,"Odhalen� chyby","OCh","sk",75);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(69,'detected errors in reviews',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "FEHLER" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*FEHLER");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (76,"corrected errors",75,33,70,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (127,"corrected errors","CE","en",76);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (128,"korrigierte Fehler","kF","de",76);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (313,"Erreurs corrig�es","EC","fr",76);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50113,"Opraven� chyby","OCh","sk",76);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(70,'contained errors in document',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCH" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manuals" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "ANZ_FEHLER_GES" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCH*Manuals*ANZ_FEHLER_GES");


/* Effektivit�t von Tests ... */


/* Verluste durch Reviews*/

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (28,"AFPs lost in reviews",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (55,"AFPs lost in reviews","en",28);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (56,"Verluste durch Reviews","de",28);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (527,"PFAs manqu�s durant la r�vision","fr",28);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5027,"Nespracovan� AFPs v posudkoch","sk",28);

/* xxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,diagram,layout,aiddid) 
VALUES (38,"AFPs lost in reviews",1,'V',28);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (71,"AFPs lost in reviews","AFPs lost in reviews","Description:
This diagram shows the number of AFPs lost in reviews. The smaller the number of AFPs, the better the review process. (Values: *)

Explanation/Recommendation:
Loosing only a few AFPs is acceptable. Focus on those reviews that lead to a higher number of losses and improve the review process by taking care of the team members and consistency between the documents. Especially in the very early phases and for the review of the manuals/documentation the customer should be part of the review team.",
"en","AFPs","Reviews",38);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (72,"Verluste durch Reviews","Verluste durch Reviews","Beschreibung: 
Dieses Diagramm zeigt die Verluste von AFPs an, die durch Reviews entstanden sind. (Werte: *)

Erkl�rung/Empfehlungen:
Der Verlust nur weniger AFPs ist akzeptabel. Das Hauptaugenmerk sollte auf jene Reviews gelegt werden, die zu h�heren Verlusten f�hrten. Durch sorgf�ltige Auswahl qualifizierter Gutachter und Ber�cksichtigung der Konsistenz zwischen den Dokumenten kann der Reviewprozess verbessert werden. Speziell in den sehr fr�hen Phasen des Projekts und beim Review von Handb�chern/Dokumentationen sollte der Kunde involviert werden.",
"de","AFPs","Reviews",38);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (735,"PFAs manqu�s durant la r�vision","PFAs manqu�s durant la r�vision","Le diagramme montre le nombre des PFAs manqu�s durant la r�vision. (Values: *)

La raison de cela peut r�sider dans la non qualification du groupe charg� de la r�vision. Donc, il faut revoir la composante du groupe de r�vision.",
"fr","PFAs","R�vision",38);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7035,"Nespracovan� AFPs v posudkoch","Nespracovan� AFPs v posudkoch","Popis:
Tento diagram zobrazuje po�et AFP, ktor� ostali nespracovan� v posudkoch. ��m men�� po�et AFP, t�m lep�� proces posudzovania. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Nesplnenie nieko�k�ch AFP je prijate�n�. Zamerajte sa na tie posudky, ktor� viedli k vy���m strat�m a vylep�ite proces posudzovania dban�m na �lenov t�mu a konsitenciu medzi dokumentmi. Najm� v skor�ch f�zach a v pr�pade posudzovania manu�lov/dokument�cie by mal by� s��as�ou posudzuj�ceho t�mu aj z�kazn�k.",
"sk","AFPs","Posudky",38);
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (85,"AFPs lost",null,38,79,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (129,"specification","S","en",85);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (130,"Spezifikation","S","de",85);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (314,"sp�cification","S","fr",85);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50114,"�pecifik�cia","�","sk",85);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(79,'specification review',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SPEZIFIKATIONSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Specificationreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SPEZIFIKATIONSREVIEWBERICHT*Specificationreviewreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (86,"system design ",85,38,80,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (131,"system design","SD","en",86);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (132,"Systemdesign","SD","de",86);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (315,"Conception du syst�me","CS","fr",86);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50115,"N�vrh syst�mu","NS","sk",86);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(80,'system design review',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMENTWURFSREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemdesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMENTWURFSREVIEWBERICHT*Systemdesignreviewreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (87,"module design",86,38,81,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (133,"module design","MD","en",87);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (134,"Moduldesign","MD","de",87);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (316,"Conception des modules","CM","fr",87);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50116,"N�vrh modulov","NM","sk",87);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(81,'module design review',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULSPEZREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduledesignreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULSPEZREVIEWBERICHT*Moduledesignreviewreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (88,"code",87,38,82,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (135,"code","C","en",88);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (136,"Code","C","de",88);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (317,"code","C","fr",88);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50117,"k�d","K","sk",88);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(82,'code review',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "CODEREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Codereviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**CODEREVIEWBERICHT*Codereviewreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (89,"manuals",88,38,83,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (137,"manuals","HB","en",89);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (138,"Handbuch","HB","de",89);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (318,"manuel","M","fr",89);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50118,"manu�ly","M","sk",89);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(83,'manual review',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "HANDBUCHREVIEWBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Manualsreviewreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**HANDBUCHREVIEWBERICHT*Manualsreviewreport*VERLUSTE");



/* Verluste durch Tests */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid)
VALUES (29,"AFPs lost in tests",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (57,"AFPs lost in tests","en",29);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (58,"Verluste durch Tests","de",29);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (528,"PFAs manqu�s pendant le test","fr",29);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5028,"AFPs nespracovan� testami","sk",29);

/* xxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,diagram,layout,aiddid) 
VALUES (39,"AFPs lost in tests",1,'V',29);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (73,"AFPs lost in tests","AFPs lost in tests","Description:
This diagram visualizes the loss of AFPs during the test activities. The smaller the number of AFPs, the better the test and correction process. (Values: *)

Explanation/Recommendations:
Loosing only a few AFPs is acceptable. Focus on those tests that lead to a higher number of losses and improve the test and correction process by checking the qualification of the testing team.",
"en","AFPs","Tests",39);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (74,"Verluste durch Tests","Verluste durch Tests","Beschreibung: 
Dieses Diagramm zeigt die Verluste von AFPs an, die durch Tests entstanden sind. (Werte: *)

Erkl�rung/Empfehlungen:
Der Verlust nur weniger AFPs ist akzeptabel. Das Hauptaugenmerk sollte auf jene Tests gelegt werden, die zu h�heren Verlusten f�hrten. Durch sorgf�ltige Auswahl qualifizierter Tester kann der Test- und Korrekturprozess verbessert werden.",
"de","AFPs","Tests",39);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (736,"PFAs manqu�s pendant le test","PFAs manqu�s pendant le test","Le diagramme montre le nombre des PFAs manqu�s pendant le test. (Values: *)

La raison de cela peut r�sider dans la non qualification du testeur. Donc, il faut revoir les qualifications du testeur.",
"fr","PFAs","Test",39);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7036,"AFPs nespracovan� testami","AFPs nespracovan� testami","Popis:
Tento diagram zobrazuje po�et AFP, ktor� ostali nespracovan� testami. ��m men�� po�et AFP, t�m lep�� proces testovania a opr�v. (Hodnoty: *)

Vysvetlenie/Odpor��ania:
Nesplnenie nieko�k�ch AFP je prijate�n�. Zamerajte sa na tie testy, ktor� viedli k vy���m strat�m a vylep�ite proces testovania a opr�v kontrolou kvalifik�cie �lenov testovacieho t�mu.",
"sk","AFPs","Testy",39);
/* xxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (90,"module test",null,39,84,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (139,"module test","MT","en",90);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (140,"Modultest","MT","de",90);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (319,"Test des modules","TM","fr",90);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50119,"Testovanie modulov","TM","sk",90);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(84,'module test',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "MODULTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Moduletestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**MODULTESTBERICHT*Moduletestreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (91,"integration test",90,39,85,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (141,"integration test","IT","en",91);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (142,"Integrationtest","IT","de",91);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (320,"Test d'int�gration","TI","fr",91);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50120,"testovanie integr�cie","TI","sk",91);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(85,'integration test',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "INTEGRATIONSTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Integrationtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**INTEGRATIONSTESTBERICHT*Integrationtestreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (92,"system test",91,39,86,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (143,"system test","ST","en",92);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (144,"Systemtest","ST","de",92);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (321,"Test du syst�me","TS","fr",92);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50121,"Testovanie syst�mu","TS","sk",92);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(86,'system test',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "SYSTEMTESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Systemtestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**SYSTEMTESTBERICHT*Systemtestreport*VERLUSTE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (93,"acceptance test",92,39,87,null);
 
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (145,"acceptance test","AT","en",93);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (146,"Akzeptanztest","AT","de",93);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (322,"Test d'acceptance","TA","fr",93);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50122,"akcepta�n� testy","AT","sk",93);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(87,'acceptance test',
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "ABNAHMETESTBERICHT" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Acceptancetestreport" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "VERLUSTE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**ABNAHMETESTBERICHT*Acceptancetestreport*VERLUSTE");

/* Aufwandsverteilung */

INSERT INTO aid_description(aiddid,description,detail,kaidid,mid) 
VALUES (30,"Distribution of effort",null,1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (59,"Distribution of effort","en",30);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (60,"Aufwandsverteilung","de",30);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (529,"Distribution de l'effort","fr",30);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (5029,"Rozlo�enie �silia","sk",30);

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO specific_aid (spaidid,description,diagram,layout,aiddid) 
VALUES (40,"Distribution of effort",1,'V',30);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (75,"Distribution of effort","Distribution of effort","Description: 
This diagram shows the distribution of the resources for several project phases. (Values: *). Please note that the diagram can only be drawn after delivering the system.

Explanation/Recommendations:
If the effort for the specification is low, this would indicate that the specification was not a good reference document for the system design. Uncorrect reference documents result in uncorrect code, which could only be improved by testing. A high effort for testing indicates that the reference documents were incorrect and incomplete. A high effort in the specification and the design phase leads often to a low effort in testing.",
"en","Effort","Phases",40);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (76,"Aufwandsverteilung","Aufwandsverteilung","Beschreibung: 
Dieses Diagramm zeigt, wie die Ressourcen auf die einzelnen Phasen verteilt wurden. (Werte: *)

Erkl�rung/Empfehlungen:
Geringer Aufwand f�r die Spezifikation k�nnte auf ein schlechts Vorgabedokument f�r den Entwurf hindeuten. Schlechte Vorgabedokumente k�nnen zu einem schlechten Code f�hren, der nur durch intensives Testen verbessert werden kann. Ein erh�hter Testaufwand w�rde somit auf schlechte Vorgabedokumente hindeuten. Ein erh�hter Aufwand in der Spezifikations- und Entwurfsphase f�hrt hingegen zu einem geringeren Testaufwand.",
"de","Aufwand","Phasen",40);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (737,"Distribution de l'effort","Distribution de l'effort","Le diagramme montre comment les ressources sont distribu�es sur les diff�rentes phases du projet. (Values: *)

Si l'effort d�pens� sur les sp�cifications est petit, alors le document des sp�cifications ne peut �tre fiable pour servir � la conception du syst�me.
Se ref�rer � des documents non fiables resulte en code non fiable dont la qualit� peut �tre am�lior� que par test.
Un grand effort de test indique que les documents de r�f�rence sont incorrects et incomplets.
Un grand effort dans les phases de sp�cification et conception implique souvent un petit effort dans le test.",
"fr","Effort","Phases",40);

INSERT INTO spec_aid_lang(said,description,title,text,language,yaxis,xaxis,spaidid)
VALUES (7037,"Rozlo�enie �silia","Rozlo�enie �silia","Popis: 
Tento diagram zobrazuje rozlo�enie zdrojov s oh�adom na nieko�ko f�z projektu. (Hodnoty: *). Majte na pam�ti, pros�m, �e diagram m��e by� vykreslen� a� po doru�en� syst�mu.

Vysvetlenie/Odpor��ania:
Ak �silie vynalo�en� na �pecifik�ciu je n�zke, indikuje to, �e �pecifik�cia nebola dobr�m referen�n�m dokumentom pre n�vrh syst�mu. Chybn� referen�n� dokumenty maj� dopad na chybn� k�d, �o by mohlo by� vylep�en� testovan�m. V��ia snaha v testovan� indikuje, �e referen�n� dokumenty boli chybn� a nekompletn�. V��ia snaha vo f�ze n�vrhu a �pecifik�cie �asto vediet k ni���m snah�m vo f�ze testovania.",
"sk","Snaha","F�zy",40);
/* xxxxxxxxxxxxxxxxxxxxxxxx */
INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (94,"specification",null,40,88,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (147,"specification","S","en",94);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (148,"Spezifikation","S","de",94);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (323,"sp�cification","S","fr",94);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50123,"�pecifik�cia","�","sk",94);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(88,'specification',
'select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "AUFWANDSVERTEILUNG_SPEZI" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',
"**PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_SPEZI");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (95,"design",94,40,89,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (149,"design","D","en",95);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (150,"Entwurf","E","de",95);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (324,"Conception","C","fr",95);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50124,"N�vrh","N","sk",95);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(89,'design',
'select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "AUFWANDSVERTEILUNG_ENTWURF" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',
"**PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_ENTWURF");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (96,"code",95,40,90,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (151,"code","C","en",96);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (152,"Code","C","de",96);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (325,"code","I","fr",96);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50125,"K�d","K","sk",96);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(90,'code',
'select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "AUFWANDSVERTEILUNG_CODE" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',
"**PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_CODE");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (97,"test",96,40,91,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (153,"test","T","en",97);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (154,"Test","T","de",97);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (326,"Test","T","fr",97);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50126,"Test","T","sk",97);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(91,'test',
'select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "AUFWANDSVERTEILUNG_TEST" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',
"**PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_TEST");

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (98,"manual",97,40,92,null);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (155,"manuals","M","en",98);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (156,"Handbuch","H","de",98);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (327,"manuel","M","fr",98);

INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (50127,"Manu�ly","M","sk",98);

INSERT INTO query(qid,attribute,statement,z_path) VALUES
(92,'manuals',
'select max(s_entity.value) as value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "AUFWANDSVERTEILUNG_HANDBUCH" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1;',
"**PROJEKTZUSTAND*Projectstatus*AUFWANDSVERTEILUNG_HANDBUCH");

/* Kosten pro Personenmonat */

/* Removed, as LBMMgr stops with null pointer exception at 
   DBAccessLayerLBM, at retrieve_EvaluationText_by_AidDescription at 1744
*/



INSERT INTO aid_description(aiddid,type,description,kaidid,mid)
VALUES (36,'O',"Costs per man month",1,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (84,"Costs per man month","en",36);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (85,"Kosten pro Personenmonat","de",36);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (86,"N�klady / �lovekomesiac","sk",36);

INSERT INTO specific_aid(spaidid,description,diagram,aiddid)
VALUES (36,"Costs per man month",0,36);


INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid)
VALUES (3900,"KOSTEN",'T',0,36);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (966,"Costs per man month ","Costs per man month ","Costs per man month: * EUR ","en",3900);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (967,"Kosten pro Personenmonat ","Kosten pro Personenmonat ","Kosten pro Personenmonat: * EUR  ","de",3900);

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (968,"Costs per man month","Costs per man month ","Costs per man month: * EUR ","fr",3900); 

/* In case of FR entry ID jumped from 700 to 900 (768 - 968), so we set instead of 9068 better 7068+200 (like if it continued) */
INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
VALUES (7268,"N�klady / �lovekomesiac","N�klady / �lovekomesiac ","N�klady / �lovekomesiac: * EUR ","sk",3900); 

INSERT INTO aid_instance (instid,description,predecessor,spaidid,qid,rlid)
VALUES (109,"*",null,3900,109,602);


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (109,"KOSTEN PRO PM",
'select distinct s_entity.value
from zarmstype,z_entity,z_attribute,comprises,s_entity,game,spaid_needs_zt,specific_aid
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "E" AND
      zarmstype.z_type = "PROJEKTZUSTAND" AND
      zarmstype.zid = z_entity.zid AND
      z_entity.description = "Projectstatus" AND
      z_entity.zeid  = comprises.zeid AND
      comprises.zaid = z_attribute.zaid AND
      z_attribute.name = "KOSTEN_PRO_MM" AND
      comprises.compid = s_entity.compid AND
      s_entity.gid = game.gid AND game.gid = %game AND LOCATE(s_entity.path, \"%path\")=1 order by s_entity.tnid desc;',
"**PROJEKTZUSTAND*Projectstatus*KOSTEN_PRO_MM");

 

/* Ende Kosten pro Personenmonat */


/* t_allows_aiddesc */
/* Achtung neu!!! */
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,1);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,2);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,3);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,4);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,6);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,7);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,8);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,9);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,10);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,11);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,12);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,13);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,14);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,15);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,16);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,17);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,18);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,19);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,20);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,21);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,22);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,23);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,24);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,25);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,26);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,27);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,28);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,29);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,30);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,31);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,32);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,33);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,34);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,35);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,36);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,350);

/* Achtung neu!!! */
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,1);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,2);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,3);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,4);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,6);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,7);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,8);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,9);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,10);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,11);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,12);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,13);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,14);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,15);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,16);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,17);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,18);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,19);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,20);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,21);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,22);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,23);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,24);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,25);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,26);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,27);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,28);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,29);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,30);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,31);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,32);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,33);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,34);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,35);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,36);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,350);


/* spaid_needs_zt */

/* moved to spaid_needs_zt.sql */
