use AMEISE;

insert into kind_of_aid values(7,"Analysekandidaten");

/*
/*Analysekandidat Projektphase
/ */



/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid) 
VALUES (601,"Projektphasen",7,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (603,"Projectphases","en",601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (604,"Projektphasen","de",601);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (604,"analyseable",'T',0,601);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (608,"*","*","*", "en",604); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (609,"*",
"*","S*", "de",604); 

/* query  */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (600,"game startet",
'select distinct simdat
from SimData
where
	gid= %game;' ,
"**");


/* rule */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (600,'T','EXISTS',null,null);

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (605,"*",null,604,600,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (608,"*","*","en",605);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (609,"*","*","de",605);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,601);
/*----------------------------------------------------------------------------------------------*/



/*
/*Analysekandidat Spezifikation
/ */
/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (600,
"Spezifikation",
7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (601,"Specification","en",600);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (602,"Spezifikation","de",600);


/* specific aid  analyseable*/
/*__________________________*/


INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (600,"analyseable",'T',0,600);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (600,"*","*","No negative effects happend in projectphase Specification.", "en",600); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (601,"*",
"*","Es sind keine negativen Effekte in der Projektphase Spezifikation aufgetreten.", "de",600); 

/* rule und query */
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (601,"AFPs SPezi",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN" AND 
	gid= %game;' ,
"**SPEZIFIKATION*Specification*ANZ_AFP");

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (601,"*",null,600,601,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (602,"*","*","en",601);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (603,"*","*","de",601);


/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,600);

/*-------------------------------------------------------*/


/*
/*Analysekandidat Entwurf
/ */
/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (602,"Entwurf", 7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (605,"Design","en",602);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (606,"Entwurf","de",602);
/* specific aid  analyseable*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (606,"analyseable",'T',0,602);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (622,"*","*", "No negative effects happend in projectphase Design.",  "en",606); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (623,"*", "*", "Es sind keine negativen Effekte in der Projektphase Entwurf aufgetreten.", "de",606); 

/* rule und query */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (609,"AFPs SPezi",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_ZU_ENTWERFEN" AND 
	gid = %game;' ,
"**");

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (606,"*",null,606,609,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (614,"*","*","en",606);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (615,"*","*","de",606);


/*aktivierten Hilfskomponente  */



INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,602);
/*-------------------------------------------------------*/


/*
/*Analysekandidat Handbuch
/ */
/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (622,"Handbuch",7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (607,"Manual","en",622);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (608,"Handbuch","de",622);


/* specific aid  analyseable*/
/*__________________________*/


INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (609,"analyseable",'T',0,622);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (618,"*","*",
"No negative effects happend while working on manual.",   "en",609); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (619,"*",
"*",  "Es sind keine negativen Effekte während der Arbeit am Handbuch aufgetreten.", "de",609); 

/* rule und query */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (610,"AFPs SPezi",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" AND 
	gid= %game;' ,
"**SPEZIFIKATION*Specification*ANZ_AFP");

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (609,"*",null,609,610,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (618,"*","*","en",609);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (619,"*","*","de",609);


/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,622);

/*-------------------------------------------------------*/

/*
/*Analysekandidat Moduldesign
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (615,"Moduldesign",7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (631,"Moduldesign","en",615);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (632,"Moduldesign","de",615);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (616,"analyseable",'T',0,615);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (634,"*","*", "No negative effects happend in projectphase Moduldesign.",  "en",616); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (635,"*","*", "Es sind keine negativen Effekte während während der Projektphase Moduldesign aufgetreten.", "de",616); 

/* query */ 

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (616,"ModuldesingBeginn",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" AND
        gid= %game;',
"**");

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (617,"*",null,616,616,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (634,"*","*","en",617);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (635,"*","*","de",617);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,615);
/*----------------------------------------------------------------------------------------------*/


/*
/*Analysekandidat Zielkriterien
/ */


/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid) VALUES (610,
"Zielkriterien",
7,1);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (621,"Objectives","en",610);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (622,"Zielkriterien","de",610);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (611,"analyseable",'T',0,610);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (624,"*","*","*", "en",611); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (625,"*",
"*","S*", "de",611); 

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (612,"*",null,611,600,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (624,"*","*","en",612);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (625,"*","*","de",612);


/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,610);
/*----------------------------------------------------------------------------------------------*/


/*
/*Analysekandidat Dauer
/ */



/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (611,
"Dauer",7,1,610);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (623,"Duration","en",611);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (624,"Dauer","de",611);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (612,"analyseable",'T',0,611);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (626,"*","*","You are in scedule!", "en",612); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (627,"*","*","Sie liegen im Zeitplan.", "de",612); 

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (613,"*",null,612,600,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (626,"*","*","en",613);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (627,"*","*","de",613);


/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,611);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Kosten
/ */


/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (612,
"Kosten",7,1,610);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (625,"Costs","en",612);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (626,"Kosten","de",612);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (613,"analyseable",'T',0,612);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (628,"*","*","You are in budget!", "en",613); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (629,"*","*","Sie liegen im Budgetplan.", "de",613); 

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (614,"*",null,613,600,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (628,"*","*","en",614);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (629,"*","*","de",614);


/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,612);
/*----------------------------------------------------------------------------------------------*/


/*
/*Analysekandidat Codequalität
/ */
/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (613,
"Codequalität",7,1,610);
/* deaktiviert da inhaltsgleich mit Code
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (627,"Quality of Code","en",613);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (628,"Codequalität","de",613);
*/

/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (614,"analyseable",'T',0,613);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (630,"*","*","No negative effecs occured concerning Quality of Code!", "en",614); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (631,"*","*","Es sind keine negativen Effekte bezüglich Codequalität aufgetreten.", "de",614); 

/* query */ 
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (618,"codebeginn",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_ZU_CODIEREN" AND
        gid= %game;',
"**");

/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (615,"*",null,614,618,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (630,"*","*","en",615);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (631,"*","*","de",615);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,613);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Manualqualität
/ */
/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (614,
"Manualqualität",7,1,610);
/* deaktiviert da Inhaltsgleich mit Handbuch
INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (629,"Quality of Manual","en",614);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (630,"Manualqualität","de",614);
*/

/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (615,"analyseable",'T',0,614);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (632,"*","*","No negative effecs occured concerning Quality of Manual!", "en",615); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (633,"*","*","Es sind keine negativen Effekte bezüglich Manualqualität aufgetreten.", "de",615); 


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (616,"*",null,615,610,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (632,"*","*","en",616);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (633,"*","*","de",616);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,614);
/*----------------------------------------------------------------------------------------------*/


/*
/*Analysekandidat Codierung
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (616,"Codierung",7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (633,"Coding","en",616);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (634,"Codierung","de",616);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (617,"analyseable",'T',0,616);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (636,"*","*", "No negative effects happend in projectphase Coding.",  "en",617); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (637,"*","*", "Es sind keine negativen Effekte während der Projektphase Codierung aufgetreten.", "de",617); 


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (618,"*",null,617,618,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (636,"*","*","en",618);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (637,"*","*","de",618);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,616);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Test
/ */


/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) VALUES (621,
"Test",7,1,601);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (609,"Test","en",621);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (610,"Test","de",621);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (605,"analyseable",'T',0,621);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (602,"*","*","*", "en",605); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (603,"*","*","S*", "de",605); 

/* query */ 
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (640,"testbeginn",
'select distinct simdat
from SimData
where
      (rule like "ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST" OR
      rule like "ENTWICKLER_BEGINNT_MIT_MODULTEST" OR
      rule like "ENTWICKLER_BEGINNT_MIT_SYSTEMTEST" OR
      rule like "KUNDE_BEGINNT_MIT_ABNAHMETEST") AND 
        gid= %game;',
"**");



/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (602,"*",null,605,640,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (604,"*","*","en",602);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (605,"*","*","de",602);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,621);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Modultest
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (617,"Modultest",7,1,621);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (635,"Module Test","en",617);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (636,"Modultest","de",617);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (618,"analyseable",'T',0,617);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (638,"*","*", "No negative effects happend during moduletest.",  "en",618); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (639,"*","*", "Es sind keine negativen Effekte während des Modultests aufgetreten.",
 "de",618); 

/* query */ 

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (617,"modultestbeginn",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_MIT_MODULTEST" AND
        gid= %game;',
"**");


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (619,"*",null,618,617,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (638,"*","*","en",619);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (639,"*","*","de",619);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,617);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Integrationstest
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (618,"Integrationstest",7,1,621);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (637,"Integration Test","en",618);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (638,"Integrationstest","de",618);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (619,"analyseable",'T',0,618);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (640,"*","*", "No negative effects happend during integrationtest.",  "en",619); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (641,"*","*", "Es sind keine negativen Effekte während des Integrationstests aufgetreten.",
 "de",619); 

/* query */ 

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (619,"modultestbeginn",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST" AND
        gid= %game;',
"**");


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (620,"*",null,619,619,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (640,"*","*","en",620);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (641,"*","*","de",620);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,618);
/*----------------------------------------------------------------------------------------------*/

/*
/*Analysekandidat Systemtest
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (619,"Systemtest",7,1,621);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (639,"System Test","en",619);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (640,"Systemtest","de",619);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (620,"analyseable",'T',0,619);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (642,"*","*", "No negative effects happend during systemtest.",  "en",620); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (643,"*","*", "Es sind keine negativen Effekte während des Systemtests aufgetreten.",
 "de",620); 

/* query */ 

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (620,"modultestbeginn",
'select distinct simdat
from SimData
where
      rule like "ENTWICKLER_BEGINNT_MIT_SYSTEMTEST" AND
        gid= %game;',
"**");


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (621,"*",null,620,620,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (642,"*","*","en",621);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (643,"*","*","de",621);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,619);
/*----------------------------------------------------------------------------------------------*/



/*
/*Analysekandidat Abnahmetest
/ */

/* aid_description */

INSERT INTO aid_description(aiddid,description,kaidid,mid,detail) 
VALUES (620,"Abnahmetest",7,1,621);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (641,"Acceptance Test","en",620);

INSERT INTO aid_desc_lang(did,description,language,aiddid)
VALUES (642,"Abnahmetest","de",620);


/* specific aid  analyseable*/
/*---------------------------*/

INSERT INTO specific_aid(spaidid,description,qualification,diagram,aiddid) 
VALUES (621,"analyseable",'T',0,620);  

INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid) 
VALUES (644,"*","*", "No negative effects happend during acceptance test.",  "en",621); 

 INSERT INTO spec_aid_lang(said,description,title,text,language,spaidid)
 VALUES (645,"*","*", "Es sind keine negativen Effekte während des Abnahmetests aufgetreten.",
 "de",621); 

/* query */ 

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (621,"modultestbeginn",
'select distinct simdat
from SimData
where
      rule like "KUNDE_BEGINNT_MIT_ABNAHMETEST" AND
        gid= %game;',
"**");


/* aid_instance */

INSERT INTO aid_instance(instid,description,predecessor,spaidid,qid,rlid)
VALUES (622,"*",null,621,621,600);


INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (644,"*","*","en",622);
INSERT INTO aid_inst_lang(aiid,description,abbreviation,language,instid)
VALUES (645,"*","*","de",622);

/*aktivierten Hilfskomponente  */

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,620);
/*----------------------------------------------------------------------------------------------*/



