/* vfreund.sql - Skript */
/* Beschreibung: Bewertungskriterien für den väterlichen Freund (Sprachkonzept) */
/* passendes Modell: QA-EURO-Modell/QA-Mini-Modell */

/* Version 2.4 (Datenmodell V2) */
/* Autor: Susanne Jäger */
/* Datum: 15.3.2004 */

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
SELECT * 
FROM kind_of_aid
WHERE description = "friendly peer";
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */
/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx */


/*** freendly peer hmks ****/

set FOREIGN_KEY_CHECKS=0;

source vf_addQuery.sql;
source vf_AutorReviewer.sql;
source vf_AutorMadeCorrection.sql;
source vf_ForgotPreviewPhase.sql;
source vf_finishedPrevPhase.sql;
source vf_ReviewStart.sql;
source vf_CheckCorrection.sql;
source vf_CorrectAfterTesting.sql;
source vf_QualificationEmployee.sql;
source vf_Dismissal.sql;
source vf_WatchDeployment.sql;
source vf_FinishedCorrection.sql;
source vf_Workload.sql;




/* t_allows_aiddesc */
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,100);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,101); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,102);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,103);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,104);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,105); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,106);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,107);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,108);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,109);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,110);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,111);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,112);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,113);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,114);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,115);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,116);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,117);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,118);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,119);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,120);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,121);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,122);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,123);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,124);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,125);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,126);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,127);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,128);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,129);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,130);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,131);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,132);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,133);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,134); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,135); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,136);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,137); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,100);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,101); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,102);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,103);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,104);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,105); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,106);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,107);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,108);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,109);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,110);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,111);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,112);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,113);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,114);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,115);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,116);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,117);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,118);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,119);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,120);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,121);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,122);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,123);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,124);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,125);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,126);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,127);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,128);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,129);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,130);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,131);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,132);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,133);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,134); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,135); 
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,136);  
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,137); 
/* (138 -170 gelöscht!) */
  

/* spaid_needs_zt */
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2500,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2500,25); 
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2500,20);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2501,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2501,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2501,20);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2502,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2502,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2502,20);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2503,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2503,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2503,20);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2504,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2504,25);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2504,20);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2505,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2505,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2505,22);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2506,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2506,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2506,22);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2507,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2507,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2507,22);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2508,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2508,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2508,22);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2509,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2509,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2509,22);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2510,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2511,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2512,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2513,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2514,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2515,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2516,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2516,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2517,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2518,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2519,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2520,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2520,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2521,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2521,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2522,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2522,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2523,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2523,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2524,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2524,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2525,2);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2525,4);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2526,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2527,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2528,3);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2529,3);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2530,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2530,25);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2531,4);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2531,25);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2532,2);

INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2533,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2534,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2535,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2536,20);
INSERT INTO spaid_needs_zt (spaidid,zid) VALUES (2537,20);


/* (2538 - 2570) gelöscht */

