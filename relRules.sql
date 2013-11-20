
/*
/* insert Rules to be extractecd into DB
*/

insert into relRules(relid, name, param1,param2, param3, param4, mid )
VALUES(1,"EINARBEITUNG_BEENDEN","EIN_ENTWICKLER",null,null,null,1); 

insert into relRules(relid, name, param1,param2, param3, param4, mid )
VALUES(2,"ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN","EIN_ENTWICKLER",null,null,null,1); 


insert into relRules values(3,"SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT",
"GUTACHTER_1","GUTACHTER_2","GUTACHTER_3",null,1);

insert into relRules(relid, name, param1,param2, param3, param4, mid )
VALUES(4,"ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN","EIN_ENTWICKLER",null,null,null,1); 


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(5,"SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT","GUTACHTER_1","GUTACHTER_2",null,null,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(6,"SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT","GUTACHTER_1","GUTACHTER_2",null,null,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(8,"MIT_SPEZIFIZIEREN_FERTIG_SEIN","EIN_ENTWICKLER",null,null,null,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(9,"MIT_HANDBUCH_FERTIG_SEIN","EIN_ENTWICKLER",null,null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(10,"ANALYSIEREN_ABBRECHEN","EIN_ENTWICKLER",null,null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(11,"BEGUTACHTUNG_BEENDEN","EIN_ENTWICKLER","EIN_DOKUMENT",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )

values(12,"CODEREVIEW_MIT_2_GUTACHTERN_BEGINNT","GUTACHTER_1","GUTACHTER_2",null,null,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(13,"CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT","GUTACHTER_1","GUTACHTER_2","GUTACHTER_3",null,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(14,"CODIEREN_ABBRECHEN","EIN_ENTWICKLER",null,null,null,1);

insert into relRules 
values(15, "ENTWERFEN_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(16, "ENTWICKLER_BEGINNT_CODE_NACH_ABNAHMETEST_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(17, "ENTWICKLER_BEGINNT_CODE_NACH_INTEGRATIONSTEST_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
	
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(18, "ENTWICKLER_BEGINNT_CODE_NACH_MODULTEST_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(19, "ENTWICKLER_BEGINNT_CODE_NACH_REVIEW_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(20, "ENTWICKLER_BEGINNT_CODE_NACH_SYSTEMTEST_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(21, "ENTWICKLER_BEGINNT_HANDBUCH_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(23, "ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(24, "ENTWICKLER_BEGINNT_MIT_MODULTEST" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(25, "ENTWICKLER_BEGINNT_MIT_SYSTEMTEST" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(26, "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(27, "ENTWICKLER_BEGINNT_MODULSPEZ_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules 
values(28, "ENTWICKLER_BEGINNT_NACH_ABNAHMETEST_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(29, "ENTWICKLER_BEGINNT_NACH_CODEREVIEW_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )

values(30, "ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(31, "ENTWICKLER_BEGINNT_NACH_HANDBUCHREVIEW_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(32, "ENTWICKLER_BEGINNT_NACH_INTEGRATIONSTEST_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(33, "ENTWICKLER_BEGINNT_NACH_MODULSPEZREVIEW_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(34, "ENTWICKLER_BEGINNT_NACH_MODULTEST_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(35, "ENTWICKLER_BEGINNT_NACH_SPEZREVIEW_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(36, "ENTWICKLER_BEGINNT_NACH_SYSTEMTEST_ALLES_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(37, "ENTWICKLER_BEGINNT_SPEZIFIKATION_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(38, "ENTWICKLER_BEGINNT_SYSTEMENTWURF_ZU_KORRIGIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(39, "ENTWICKLER_BEGINNT_ZU_ANALYSIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(40, "ENTWICKLER_BEGINNT_ZU_CODIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(41, "ENTWICKLER_BEGINNT_ZU_ENTWERFEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(42, "ENTWICKLER_BEGINNT_ZU_INTEGRIEREN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(44, "ENTWURFSREVIEW_MIT_2_GUTACHTERN_BEGINNT" , "GUTACHTER_1","GUTACHTER_2",null,null,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(45, "ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT" , "GUTACHTER_1","GUTACHTER_2","GUTACHTER_3",null,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(46, "HANDBUCHERSTELLUNG_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(47, "HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT" ,  "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(48, "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" , "GUTACHTER_1","GUTACHTER_2","GUTACHTER_3",null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(49, "HANDBUCHREVIEW_MIT_KUNDE_BEGINNT" ,  "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(50, "INTEGRATIONSTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(51, "INTEGRIEREN_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(52, "KORREKTUR_ALLER_DOKUMENTE_NACH_ABNAHMETEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(53, "KORREKTUR_ALLER_DOKUMENTE_NACH_CODEREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(54, "KORREKTUR_ALLER_DOKUMENTE_NACH_ENTWURFSREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(55, "KORREKTUR_ALLER_DOKUMENTE_NACH_HANDBUCHREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(92, "KORREKTUR_ALLER_DOKUMENTE_NACH_INTEGRATIONSTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(56, "KORREKTUR_ALLER_DOKUMENTE_NACH_MODULSPEZREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(57, "KORREKTUR_ALLER_DOKUMENTE_NACH_MODULTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(58, "KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(59, "KORREKTUR_ALLER_DOKUMENTE_NACH_SYSTEMTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(60, "KORREKTUR_NACH_CODEREVIEW_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(61, "KORREKTUR_VON_CODE_NACH_ABNAHMETEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(62, "KORREKTUR_VON_CODE_NACH_INTEGRATIONSTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(63, "KORREKTUR_VON_CODE_NACH_MODULTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(64, "KORREKTUR_VON_CODE_NACH_SYSTEMTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(65, "KORREKTUR_VON_ENTWURF_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(66, "KORREKTUR_VON_HANDBUCH_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(67, "KORREKTUR_VON_MODULSPEZIFIKATION_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(68, "KORREKTUR_VON_SPEZIFIKATION_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(69, "KUNDE_BEENDET_ABNAHMETEST" , null , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(70, "KUNDE_BEGINNT_MIT_ABNAHMETEST" , null  , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(71, "MIT_ANALYSIEREN_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(72, "MIT_CODEREVIEWS_FERTIG_SEIN" , "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(73, "MIT_CODIEREN_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(74, "MIT_ENTWERFEN_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(75, "MIT_ENTWURFSREVIEWS_FERTIG_SEIN" , "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(77, "MIT_HANDBUCHREVIEWS_FERTIG_SEIN" , "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(78, "MIT_INTEGRATIONSTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(79, "MIT_INTEGRIEREN_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);


insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(80, "MIT_MODULSPEZIFIKATIONSREVIEWS_FERTIG_SEIN" , "GUTACHTER_1" , "GUTACHTER_2" , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(81, "MIT_MODULTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(82, "MIT_SPEZIFIKATIONSREVIEWS_FERTIG_SEIN" , "GUTACHTER_1" , "GUTACHTER_2" , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(83, "MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(91, "MIT_SYSTEMTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(84, "MODSPEZREVIEW_MIT_2_GUTACHTERN_BEGINNT" ,  "GUTACHTER_1","GUTACHTER_2",null,null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(85, "MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT" ,  "GUTACHTER_1","GUTACHTER_2","GUTACHTER_3",null,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(86, "MODULTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(87, "SPEZIFIZIEREN_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(88, "SPEZIFIZIEREN_DER_MODULE_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);
insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(89, "SYSTEMTEST_ABBRECHEN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(94, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_ABNAHMETEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(95, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_CODEREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(96, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_ENTWURFSREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(97, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_HANDBUCHREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(98, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_INTEGRATIONSTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(99, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_MODULSPEZREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(101, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_MODULTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(102, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(103, "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_SYSTEMTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(104, "MIT_KORREKTUR_AUF_BASIS_VON_ABNAHMETESTBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(105, "MIT_KORREKTUR_AUF_BASIS_VON_CODEREVIEWBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(106, "MIT_KORREKTUR_AUF_BASIS_VON_HANDBUCHREVIEWBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(107, "MIT_KORREKTUR_AUF_BASIS_VON_MODULSPEZREVIEWBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(108, "MIT_KORREKTUR_AUF_BASIS_VON_MODULTESTBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(109, "MIT_KORREKTUR_AUF_BASIS_VON_SPEZIFIKATIONSREVIEWBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(111, "MIT_KORREKTUR_AUF_BASIS_VON_SYSTEMTESTBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(112, "MIT_KORREKTUR_DER_MODULSPEZ_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(113, "MIT_KORREKTUR_DER_SPEZIFIKATION_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(114, "MIT_KORREKTUR_DES_ENTWURFS_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(115, "MIT_KORREKTUR_DES_HANDBUCHS_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(116, "KORREKTUR_NACH_ABNAHMETEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(117, "MIT_KORREKTUR_NACH_CODEREVIEW_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(118, "MIT_KORREKTUR_NACH_INTEGRATIONSTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(119, "MIT_KORREKTUR_NACH_MODULTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(120, "MIT_KORREKTUR_NACH_SYSTEMTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(127, "MIT_KORREKTUR_AUF_BASIS_VON_SYSTEMENTWURFSREVIEWBERICHT_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(128, "MIT_KORREKTUR_AUF_BASIS_VON_INTEGRATIONSTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(129, "MIT_KORREKTUR_AUF_BASIS_VON_SYSTEMTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);

insert into relRules (relid, name, param1,param2, param3, param4, mid )
values(130, "MIT_KORREKTUR_AUF_BASIS_VON_MODULTEST_FERTIG_SEIN" , "EIN_ENTWICKLER" , null , null , null ,1);
