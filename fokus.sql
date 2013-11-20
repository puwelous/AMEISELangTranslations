
use AMEISE;


/*
/* allgemeine Rules	*/
/**/

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point,expression)
VALUES (605,null,'EXISTS',null,null,'NOT');

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (606,null,'EXISTS',null,null);

/*
/* AEffekt Kunde nicht eingebunden
/ */
INSERT INTO query(qid,attribute,statement,z_path)
VALUES (604,"Sepzifikationspez-Review findet statt",
'select Simdat
from SimData
where
	(rule = "SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT") AND 
	SimData.gid=  %game AND
	NOT EXISTS (SELECT simdat FROM SimData b
	WHERE rule = "SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT"
	AND b.gid= %game);',

null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 3,"Kunde nicht eingebunden","a",600,604);

INSERT INTO effects_lang
VALUES (3,"de","Sie haben den Kunden nicht zum Review eingeladen.",3);

INSERT INTO effects_lang
VALUES (114,"en","You did not invite the customer to the review.",3);


INSERT INTO Apriority 
VALUES (3, 28,3,600);



/*
/* AEffekt Abbruch Spez
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (605,"simdat",
'select simdat
from SimData a
where 	a.rule="SPEZIFIZIEREN_ABBRECHEN"
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_SPEZIFIZIEREN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',

null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 4,"nicht fertig erstellt","a",606,605);

INSERT INTO effects_lang
VALUES (4,"de","Sie haben die Spezifikation nicht fertig erstellt.",4);

INSERT INTO effects_lang
VALUES (115,"en","You have not finished the specification yet.",4);


INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (4, 90,4,600);

/*
/* E7. Abbruch Entwurf  AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (652,"simdat",
'select simdat
from SimData a
where 	a.rule="ENTWERFEN_ABBRECHEN"
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_ENTWERFEN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',

null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 49,"nicht fertig erstellt","a",606,652);

INSERT INTO effects_lang
VALUES (49,"de","Sie haben den Entwurf nicht fertig erstellt.",49);

INSERT INTO effects_lang
VALUES (116,"en","You did not finish the design.",49);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (49, 60,49,602);

/*
/* M7. Abbruch Moduledesign AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (657,"simdat",
'select simdat
from SimData a
where 	a.rule="SPEZIFIZIEREN_DER_MODULE_ABBRECHEN"
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',

null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 55,"nicht fertig erstellt","a",606,657);

INSERT INTO effects_lang
VALUES (55,"de","Sie haben das Moduledesign nicht fertig erstellt.",55);

INSERT INTO effects_lang
VALUES (117,"en","You did not finish the moduledesign.",55);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (20, 90,55,615);

/*
/* C7. Abbruch Codierung AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (663,"simdat",
'select simdat
from SimData a
where 	a.rule="CODIEREN_ABBRECHEN"
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_CODIEREN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',

null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 63,"nicht fertig erstellt","a",606,663);

INSERT INTO effects_lang
VALUES (63,"de","Sie haben den Code nicht fertig erstellt.",63);

INSERT INTO effects_lang
VALUES (118,"en","You did not finish the code.",63);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (22, 140,63,616);

/*
/* T6. Abbruch Modultest REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (666,"simdat",
'select simdat
from SimData a
where 	a.rule="MODULTEST_ABBRECHEN"
      AND a.simdat >= "%aktdat" 
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_MODULTEST_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',

null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 68,"nicht fertig erstellt","r",606,666);

INSERT INTO effects_lang
VALUES (68,"de","Sie haben den Modultest nicht vollständig durchgeführt.",68);

INSERT INTO effects_lang
VALUES (119,"en","You did not finish the module test.",68);

INSERT INTO Rpriority (rpid, value,evalid, eid, aiddid)
VALUES (125, 111,17,68, 617);

/*
/* T13. Abbruch Integrationstest REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (669,"simdat",
'select simdat
from SimData a
where 	a.rule="INTEGRATIONSTEST_ABBRECHEN"
      AND a.simdat >= "%aktdat" 
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_INTEGRATIONSTEST_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 73,"Integrationstest  nicht fertig","r",606,669);

INSERT INTO effects_lang
VALUES (73,"de","Sie haben den Integrationstest nicht vollständig durchgeführt.",73);

INSERT INTO effects_lang
VALUES (120,"en","You did not finish the integration test.",73);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (113, 107,38,73,618);

/*
/* T13. Abbruch Systemtest REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (671,"simdat",
'select simdat
from SimData a
where 	a.rule="SYSTEMTEST_ABBRECHEN"
      AND a.simdat >= "%aktdat" 
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_SYSTEMTEST_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 78,"Systemtest nicht fertig","r",606,671);

INSERT INTO effects_lang
VALUES (78,"de","Sie haben den Systemtest nicht vollständig durchgeführt.",78);

INSERT INTO effects_lang
VALUES (121,"en","You did not finish the system test.",78);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (124, 115,41,78,619);

/*
/* AEffect Dokument nicht reviewt Spez
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (603,"spez-Review findet statt",
'select simdat
from SimData
where
    (rule = "SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
	rule="SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT") AND
	SimData.gid=  %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 2,"Dokument nicht reviewt spez","r",605,603);

INSERT INTO effects_lang
VALUES (2,"de","Sie haben das Dokument nicht reviewt.",2);

INSERT INTO effects_lang
VALUES (122,"en","You did not review the specification.",2);

INSERT INTO Rpriority (rpid, value, evalid, eid, aiddid)
VALUES (170, 49,47,2,600);


/*
/* AEffekt Kunde nicht eingebunden HB
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (627,"HANDBUCHREVIEW-Review mit Kunde findet statt",
'select Simdat
from SimData
where
	(rule = "HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT") AND 
	SimData.gid=  %game AND
	NOT EXISTS (SELECT simdat FROM SimData b
	WHERE rule = "HANDBUCHREVIEW_MIT_KUNDE_BEGINNT"
	AND b.gid= %game);',

null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 17,"Kunde nicht eingebunden HB","r",600,627);

INSERT INTO effects_lang
VALUES (17,"de","Sie haben den Kunden nicht zum Review des Handbuchs eingeladen.",17);

INSERT INTO effects_lang
VALUES (123,"en","You did not invite the customer to the review of the manual.",17);


INSERT INTO Apriority  (apid, value, eid, aiddid)
VALUES (17, 48,17,622);

/*
/* AEffekt Abbruch HB
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (623,"simdat",
'select simdat
from SimData a
where 	a.rule="HANDBUCHERSTELLUNG_ABBRECHEN"
	AND not EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_HANDBUCH_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 13,"nicht fertig erstellt HB","r",600,623);

INSERT INTO effects_lang
VALUES (13,"de","Sie haben das Handbuch nicht fertig erstellt.",13);

INSERT INTO effects_lang
VALUES (124,"en","You did not finish the manual.",13);


INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (13, 90,13,622);


/*
/* D7. Erstellung Spez abgebrochen spaeter Wiederaufnahme
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (679,"simdat",
'select simdat
from SimData a
where 	a.rule="SPEZIFIZIEREN_ABBRECHEN"
	AND EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_SPEZIFIZIEREN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 86,"abbruch mit wiederaufnahme Spez","a",600,679);

INSERT INTO effects_lang
VALUES (86,"de","Sie haben Teile der  Erstellung der Spezifiaktion abgebrochen, die Zeit die für nicht fertiggetellte AFPs aufgewendet wurde, ist somit verloren, obwohl sie die Spezifikation fertig erstellt haben.",86);

INSERT INTO effects_lang
VALUES (125,"en","You canceled parts of the compilation of the specification. The time spent on AFPs that were not finished, ist lost. Nevertheless the specification is finshed.",86);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (63, 2,86,611);

/*
/* K7. Erstellung Spez abgebrochen spaeter Wiederaufnahme
/ */
INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (90, 2,86,612);

/*
/* D7. Erstellung Entwurf abgebrochen spaeter Wiederaufnahme
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (680,"simdat",
'select simdat
from SimData a
where 	a.rule="ENTWERFEN_ABBRECHEN"
	AND EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_ENTWERFEN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 87,"abbruch mit wiederaufnahme Entwurf","a",600,680);

INSERT INTO effects_lang
VALUES (87,"de","Sie haben Teile der  Erstellung des Entwurfs abgebrochen, die Zeit die für nicht fertiggetellte AFPs aufgewendet wurde, ist somit verloren, obwohl sie den Entwurf fertig erstellt haben.",87);

INSERT INTO effects_lang
VALUES (126,"en","You canceled parts of the compilation of the design. The time spent on AFPs that were not finished, ist lost. Nevertheless the design is finshed.",87);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (60, 2,87,611);

/*
/* K7. Erstellung Entwurfs abgebrochen spaeter Wiederaufnahme
/ */
INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (91, 2,87,612);
/*
/* D7. Erstellung Modulentwurf abgebrochen spaeter Wiederaufnahme
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (681,"simdat",
'select simdat
from SimData a
where 	a.rule="SPEZIFIZIEREN_DER_MODULE_ABBRECHEN"
	AND EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 88,"abbruch mit wiederaufnahme Modulentwurf","a",600,681);

INSERT INTO effects_lang
VALUES (88,"de","Sie haben Teile der Erstellung des Modulentwurfs abgebrochen, die Zeit die für nicht fertiggetellte AFPs aufgewendet wurde, ist somit verloren, obwohl sie den Modulentwurf fertig erstellt haben.",88);

INSERT INTO effects_lang
VALUES (127,"en","You canceled parts of compilation of the module design. The time spent on AFPs that were not finished, ist lost. Nevertheless the module design is finshed.",88);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (61, 2,88,611);

/*
/* K7. Erstellung Modulentwurf abgebrochen spaeter Wiederaufnahme
/ */
INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (92, 2,88,612);

/*
/* D7. Erstellung Code abgebrochen spaeter Wiederaufnahme
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (682,"simdat",
'select simdat
from SimData a
where 	a.rule="CODIEREN_ABBRECHEN"
	AND EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_CODIEREN_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 89,"abbruch mit wiederaufnahme Code","a",600,682);

INSERT INTO effects_lang
VALUES (89,"de","Sie haben die Teile der Erstellung des Codes abgebrochen, die Zeit die für nicht fertiggetellte AFPs aufgewendet wurde, ist somit verloren, obwohl sie den Code fertig erstellt haben.",89);

INSERT INTO effects_lang
VALUES (128,"en","You canceled parts of compilation of the code. The time spent on AFPs that were not finished, ist lost. Nevertheless the code is finshed.",89);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (62, 2,89,611);

/*
/* K7. Erstellung Code abgebrochen spaeter Wiederaufnahme
/ */
INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (116, 2,89,612);

/*
/* D7. Erstellung HB abgebrochen spaeter Wiederaufnahme
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (624,"simdat",
'select simdat
from SimData a
where 	a.rule="HANDBUCHERSTELLUNG_ABBRECHEN"
	AND EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "MIT_HANDBUCH_FERTIG_SEIN"
	AND b.gid= %game
	AND b.simdat > a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 14,"abbruch mit wiederaufnahme HB","a",600,624);

INSERT INTO effects_lang
VALUES (14,"de","Sie haben die Erstellung des Handbuchs abgebrochen, die Zeit die für nicht fertiggetellte AFPs aufgewendet wurde, ist somit verloren, obwohl sie das Handbuch fertig erstellt haben.",14);

INSERT INTO effects_lang
VALUES (129,"en","You canceled parts of compilation of the manual. The time spent on AFPs that were not finished, ist lost. Nevertheless the manual is finshed.",14);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (59, 2,14,611);

/*
/* K7. Erstellung HB abgebrochen spaeter Wiederaufnahme
/ */
INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (93, 2,14,612);

/*
/* AEffekt Basisdokument schlecht HB/Entwurf
/ */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point,expression)
VALUES (610,'Z','<',190,null,null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 7,"Basisdokument schelcht HB","r",610,7);

INSERT INTO effects_lang
VALUES (7,"de","Sie sollten auf bessere Qualität des Basisdokuments (Spezifikation) achten.",7);

INSERT INTO effects_lang
VALUES (130,"en","You should take care for better quality of the basic document (specification).",7);

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (60, 40,7,7,622);

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (70, 40,7,7,602);



/*
/* M3. Basisdokument schlecht Moduledesign AEffekt 
/ */


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 54,"Basisdokument schelcht Entwurf ","r",610,8);

INSERT INTO effects_lang
VALUES (54,"de","Sie sollten auf bessere Qualität des Basisdokuments (Entwurf) achten.",54);

INSERT INTO effects_lang
VALUES (131,"en","You should take care for better quality of the basic document (design).",54);

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (80, 40,16,48,615);

/*
/* C3. Basisdokument schlecht Code AEffekt 
/ */


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 62,"Basisdokument schelcht Code ","r",610,9);

INSERT INTO effects_lang
VALUES (62,"de","Sie sollten auf bessere Qualität des Basisdokuments (Moduldesign) achten.",62);

INSERT INTO effects_lang
VALUES (132,"en","You should take care for better quality of the basic document (module design).",62);

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (92, 40,18,62,616);


/*
/* AEffekt Vorgängerphase (spez) nicht abgeschlossen
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (608,"Basisdokument nicht fertig HB",
'select simdat
from SimData a
where
	rule="MIT_SPEZIFIZIEREN_FERTIG_SEIN"
    AND  simdat <= (SELECT min(simdat) FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN"
	AND b.gid= %game
	AND b.simdat > a.simdat) AND 
	a.gid=  %game ;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 8,"Basisdokument nicht fertig HB","r",605,608);

INSERT INTO effects_lang
VALUES (8,"de","Sie haben zu früh mit der Erstellung des Handbuchs begonnen, 
das Basisdokument war noch nicht fertig erstellt.",8);

INSERT INTO effects_lang
VALUES (133,"en","You started this phase to early. The basic document was not finished.",8);



INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (61, 20,7,8,622);

/*
/* M2. Vorgängerphase (Entwurf) nicht abgeschlossen REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (656,"Basisdokument nicht fertig Moduledesign ",
'select simdat
from SimData a
where
	rule="MIT_ENTWERFEN_FERTIG_SEIN"
    AND  simdat <= (SELECT min(simdat) FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN"
	AND b.gid= %game
	AND b.simdat > a.simdat) AND 
	a.gid=  %game ;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 21,"Basisdokument nicht fertig Moduledesign ","r",605,656);
INSERT INTO effects_lang
VALUES (21,"de","Sie haben zu früh mit der Erstellung des Moduledesigns begonnen, 
das Basisdokument war noch nicht fertig erstellt.",21);

INSERT INTO effects_lang
VALUES (134,"en","You started this phase to early. The basic document was not finished.",21);

/* Entwurf beginn */

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (79, 20,7,21,615);

/*
/* C2. Vorgängerphase (Moduldesign) nicht abgeschlossen REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (662,"Basisdokument für Code nicht fertig ",
'select simdat
from SimData a
where
	rule="MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN"
    AND  simdat <= (SELECT min(simdat) FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN"
	AND b.gid= %game
	AND b.simdat > a.simdat) AND 
	a.gid=  %game ;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 61,"Basisdokument für Code nicht fertig","r",605,662);
INSERT INTO effects_lang
VALUES (61,"de","Sie haben zu früh mit der Erstellung des Codes begonnen, 
das Basisdokument war noch nicht fertig erstellt.",61);

INSERT INTO effects_lang
VALUES (135,"en","You started this phase to early. The basic document was not finished.",61);

/* Moduldesign beginn */

INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (91, 20,16,61,616);

/*
/* AEffekt Vorgängerphase von Entwurf nicht abgeschlossen
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (615,"Basisdokument nicht fertig Entwurf",
'select simdat
from SimData a
where
	rule="MIT_SPEZIFIZIEREN_FERTIG_SEIN"
    AND  simdat <= (SELECT min(simdat) FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN"
	AND b.gid= %game
	AND b.simdat > a.simdat) AND 
	a.gid=  %game ;',

null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 11,"Basisdokument nicht fertig Entwruf","r",605,615);
INSERT INTO effects_lang
VALUES (11,"de","Sie haben zu früh mit der Erstellung des Entwurfs begonnen, 
das Basisdokument war noch nicht fertig erstellt.",11);

INSERT INTO effects_lang
VALUES (136,"en","You started this phase to early. The basic document was not finished.",11);


INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (218, 20,7,11,602);

/*
/* AEffekt Vorgängerphase (spez) ausgelassen HB
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (613,"Vorgängerphase ausgelassen HB",
'select simdat
from SimData
where
	(rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" )
     AND  simdat <= "%aktdat" AND 
	SimData.gid=  %game AND
        NOT EXISTS (SELECT simdat FROM SimData b
WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN"
AND b.gid= %game
AND b.simdat < "%aktdat");',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 9,"Vorgängerphase fehlt HB","a",606,613);

INSERT INTO effects_lang
VALUES (9,"de","Sie haben keine Spezifikation erstellt, dieses Dokument 
bildet jedoch die Grundlage für die Handbucherstellung.",9);


INSERT INTO effects_lang
VALUES (137,"en","You have not written a specification document. But this is the basic document for the manual.",9);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (9, 149,9,622);


/*
/* AEffekt Vorgängerphase (spez) ausgelassen entwurf
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (614,"Vorgängerphase ausgelassen",
'select simdat
from SimData
where
	(rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN" )
     AND  simdat <= "%aktdat" AND 
	SimData.gid=  %game AND
        NOT EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN"
	AND b.gid= %game
	AND b.simdat < "%aktdat");',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 10,"Vorgängerphase fehlt Entwurf","a",606,614);

INSERT INTO effects_lang
VALUES (10,"de","Sie haben keine Spezifikation erstellt, dieses Dokument 
bildet jedoch die Grundlage für den Entwurf.",10);


INSERT INTO effects_lang
VALUES (138,"en","You have not written a specification document. But this is the basic document for the design.",10);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (10, 125,10,602);


/*
/* M1. Vorgängerphase  ausgelassen Moduledesign AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (628,"Vorgängerphase ausgelassen Moduledesign ",
'select simdat
from SimData
where
	(rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" )
     AND  simdat <= "%aktdat" AND 
	SimData.gid=  %game AND
        NOT EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN"
	AND b.gid= %game
	AND b.simdat < "%aktdat");',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 18,"Vorgängerphase fehlt Moduledesign ","a",606,628);

INSERT INTO effects_lang
VALUES (18,"de","Sie haben keinen Entwurf erstellt, dieses Dokument 
bildet jedoch die Grundlage des Moduldesgins.",18);

INSERT INTO effects_lang
VALUES (139,"en","You have not written a design document. But the manual is based on it.",18);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (18, 37,18,615);



/*
/* C1. Vorgängerphase  ausgelassen Code AEffekt 
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (629,"Vorgängerphase ausgelassen Code",
'select simdat
from SimData
where
	(rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN" )
     AND  simdat <= "%aktdat" AND 
	SimData.gid=  %game AND
        NOT EXISTS (SELECT simdat FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN"
	AND b.gid= %game
	AND b.simdat < "%aktdat");',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 19,"Vorgängerphase fehlt Code","a",606,629);

INSERT INTO effects_lang
VALUES (19,"de","Sie haben kein Moduledesign erstellt, dieses Dokument 
bildet jedoch die Grundlage des Codes.",19);

INSERT INTO effects_lang
VALUES (140,"en","You have not written a module design document. But the code is based on it.",19);


INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (19, 47,19,616);



/*
/* AEffekt Vorgängerphase (entwurf) nicht abgeschlossen
/ noch kein Analysekandidat dazu vorhanden!!

/*
/* AEffekt 3-er Review 
/ */

/*
/* AEffect Dokument nicht reviewt HB
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (626,"HB-Review findet statt",
'select simdat
from SimData
where
    (rule = "HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
	rule="HANDBUCHREVIEW_MIT_KUNDE_BEGINNT") AND
	exists (select simdat from SimData where rule="MIT_HANDBUCH_FERTIG_SEIN" and gid=%game) and
	SimData.gid=  %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 16,"Dokument nicht reviewt HB","r",605,626);

INSERT INTO effects_lang
VALUES (16,"de","Sie haben das Dokument nicht reviewt.",16);

INSERT INTO effects_lang
VALUES (141,"en","You did not review the manual.",16);



INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (214, 55,48,16,622);


/*
/* AEffect Dokument nicht reviewt Entwurf
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (630,"Entwurf-Review findet statt",
'select simdat
from SimData
where
    (rule = "ENTWURFSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT") AND
	exists (select simdat from SimData where rule="MIT_ENTWERFEN_FERTIG_SEIN" and gid=%game) and 
	SimData.gid=  %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 30,"Dokument nicht reviewt Entwurf","r",605,630);

INSERT INTO effects_lang
VALUES (30,"de","Sie haben das Dokument nicht reviewt.",30);

INSERT INTO effects_lang
VALUES (142,"en","You did not review the design.",30);


INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (215, 43,50, 30,602);

/*
/* M10. Moduldesign nicht reviewt AEffect 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (658,"Moduldesign -Review findet statt",
'select simdat
from SimData
where
    (rule = "MODSPEZREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT") AND
	exists (select simdat from SimData 
	where rule="MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN" and gid=%game) AND 
	SimData.gid=  %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 56,"Dokument nicht reviewt Moduldesign ","r",605,658);

INSERT INTO effects_lang
VALUES (56,"de","Sie haben das Dokument nicht reviewt.",56);

INSERT INTO effects_lang
VALUES (143,"en","You did not review the module design.",56);



INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (216, 51,51, 56,615);


/*
/* AEffect Dokument nicht reviewt Code
/ */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (632,"Code-Review findet statt",
'select simdat
from SimData
where
    (rule = "CODEREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT") AND
	exists (select simdat from SimData where rule="MIT_CODIEREN_FERTIG_SEIN" and gid=%game) and 
	SimData.gid=  %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 32,"Dokument nicht reviewt Code","r",605,632);

INSERT INTO effects_lang
VALUES (32,"de","Sie haben das Dokument nicht reviewt.",32);

INSERT INTO effects_lang
VALUES (144,"en","You did not review the code.",32);


INSERT INTO Rpriority (rpid, value,evalid,eid,aiddid)
VALUES (217, 109, 49,32,616);


/*
/* REffekt Team ok
/ */

/*
/* REffekt Reviewer = Autor Spez
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (633,"Reviewer = Autor Spez",
'
select simdat
from SimData
where   
	(rule = "SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT"  or
	rule = "SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT"  ) AND 
	SimData.gid=  %game AND
	(  (param1 = "%mitarbeiter" AND
param1 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Spezifikation" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
	( param2 = "%mitarbeiter" AND
param2 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Spezifikation" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
 (param3 = "%mitarbeiter" AND
param3 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Spezifikation" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)));',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 33,"Reviewer = Autor Spez","m",600,633);

INSERT INTO effects_lang
VALUES (33,"de","Sie haben einen der Autoren auch als Reviewer eingesetzt. Alle von dem Mitarbeiter %mitarbeiter erstellten Arbeitspakete werden nicht geprüft.",33);

INSERT INTO effects_lang
VALUES (145,"en","You told one of the authors of the document to review it. All APFs that were written by %mitarbeiter were not reviewed.",33);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (33, 25,8,33,600);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (34, 25,9,33,600);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (35, 25,11,33,600);


/*
/* REffekt Reviewer = Autor Entwurf
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (634,"Reviewer = Autor Entwurf",
'
select simdat
from SimData
where   
	(rule = "ENTWURFSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) AND 
	SimData.gid=  %game AND
	( (param1 = "%mitarbeiter" AND 
param1 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Systemdesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
	(param2 = "%mitarbeiter" AND 
param2 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Systemdesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param3 = "%mitarbeiter" AND
param3 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Systemdesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)));',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 34,"Reviewer = Autor Entwurf","m",600,634);

INSERT INTO effects_lang
VALUES (34,"de","Sie haben einen der Autoren auch als Reviewer eingesetzt. Alle von dem Mitarbeiter %mitarbeiter erstellten Arbeitspakete werden nicht geprüft.",34);


INSERT INTO effects_lang
VALUES (146,"en","You told one of the authors of the document to review it. All APFs that were written by %mitarbeiter were not reviewed.",34);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (36, 22,2,34,602);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (37, 22,3,34,602);



/*
/* REffekt Reviewer = Autor Moduledesign 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (635,"Reviewer = Autor Moduledesign ",
'
select simdat
from SimData
where   
	(rule = "MODSPEZREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) AND 
	SimData.gid=  %game AND
	( (param1 = "%mitarbeiter" AND 
param1 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Moduldesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
	(param2 = "%mitarbeiter" AND 
param2 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Moduldesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param3 = "%mitarbeiter" AND 
param3 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Moduldesign" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)));',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 35,"Reviewer = Autor Moduledesign ","m",600,635);

INSERT INTO effects_lang
VALUES (35,"de","Sie haben einen der Autoren auch als Reviewer eingesetzt. Alle von dem Mitarbeiter %mitarbeiter erstellten Arbeitspakete werden nicht geprüft.",35);


INSERT INTO effects_lang
VALUES (147,"en","You told one of the authors of the document to review it. All APFs that were written by %mitarbeiter were not reviewed.",35);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (18, 25,14,35,615);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (19, 25,15,35,615);


/*
/* C11. Reviewer = Autor Code REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (636,"Reviewer = Autor Code",
'
select simdat
from SimData
where   
	(rule = "CODEREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) AND 
	SimData.gid=  %game AND
	( (param1 = "%mitarbeiter" AND 
param1 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Code" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param2 = "%mitarbeiter" AND 
	param2 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Code" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param3 = "%mitarbeiter" AND 
param3 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Code" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)));',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 36,"Reviewer = Autor Code","m",600,636);

INSERT INTO effects_lang
VALUES (36,"de","Sie haben einen der Autoren auch als Reviewer eingesetzt. Alle von dem Mitarbeiter %mitarbeiter erstellten Arbeitspakete werden nicht geprüft.",36);


INSERT INTO effects_lang
VALUES (148,"en","You told one of the authors of the document to review it. All APFs that were written by %mitarbeiter were not reviewed.",36);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (38, 54,12,36,616);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (39, 54,13,36,616);


/******************************************+
/* REffekt Reviewer = Autor HB
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (637,"Reviewer = Autor HB",
'select simdat
from SimData
where   
	(rule = "HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
	rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
rule = "HANDBUCHREVIEW_MIT_KUNDE_BEGINNT") AND 
	SimData.gid=  %game AND
	( (param1 = "%mitarbeiter" AND 
param1 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Manual" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param2 = "%mitarbeiter" AND 
	param2 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Manual" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)) or
(param3 = "%mitarbeiter" AND 
param3 IN (select DISTINCT s_relation.person
from zarmstype,s_relation,specific_aid,spaid_needs_zt
where
      spaid_needs_zt.spaidid = specific_aid.spaidid AND
      spaid_needs_zt.zid = zarmstype.zid AND
      zarmstype.eorr = "R" AND
      zarmstype.z_type = "PRODUZIERT" AND
      zarmstype.zid = s_relation.zid AND
      s_relation.document like "Manual" AND
      s_relation.success = 1 AND
	s_relation.gid= %game)));',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 37,"Reviewer = Autor HB","m",600,637);

INSERT INTO effects_lang
VALUES (37,"de","Sie haben einen der Autoren auch als Reviewer eingesetzt. Alle von dem Mitarbeiter %mitarbeiter erstellten Arbeitspakete werden nicht geprüft.",37);

INSERT INTO effects_lang
VALUES (149,"en","You told one of the authors of the document to review it. All APFs that were written by %mitarbeiter were not reviewed.",37);


INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (42, 25,5,37,622);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (43, 25,6,37,622);
INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (44, 25,10,37,622);


/*
/* REffekt Mitarbeiter in Einarbeitung 
/ */ 


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (602,"Mitarbeiter in Einarbeitung",
'select simdat
from SimData
where (rule = "EINARBEITUNG_BEENDEN" and
param1 = "%mitarbeiter" and
gid = %game and
"%aktdat" >= (select min(simdat)
from SimData 
where rule = "EINARBEITUNG_BEENDEN" and
param1 = "%mitarbeiter" and
gid = %game and
simdat >= (select max(date)
from turn
where command like "hire %mitarbeiter" and
gid = %game and
date <= "%aktdat")));',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 1,"Mitarbeiter in Einarbeitung","m",605,602);

INSERT INTO effects_lang (eff_lang_id, language,text,eid)
VALUES (1,"de","Das Projektmitglied %mitarbeiter, das die Tätigkeit %taet in der Phase %phase ausgeführt hat, befand sich in der Einarbeitungsphase. Es arbeitete daher nur ungefähr halb so schnell als sonst  und machte ein paar Fehler mehr.",1);

INSERT INTO effects_lang
VALUES (150,"en","The employee %mitarbeiter, that did the %taet, was in trainingsphase. He worked at half speed and made more errors than usual.",1);



INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 114,"Mitarbeiter in Einarbeitung bei Test","m",605,602);

INSERT INTO effects_lang (eff_lang_id, language,text,eid)
VALUES (220,"de","Das Projektmitglied %mitarbeiter, das den Test durchgeführt hat, befand sich in der Einarbeitungsphase. Es arbeitete daher nur ungefähr halb so schnell als sonst  und machte ein paar Fehler mehr.",114);

INSERT INTO effects_lang
VALUES (221,"en","The employee %mitarbeiter, that did the test, was in trainingsphase. He worked at half speed and made more errors than usual.",114);



INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 115,"Mitarbeiter in Einarbeitung bei Test","m",605,602);

INSERT INTO effects_lang (eff_lang_id, language,text,eid)
VALUES (222,"de","Das Projektmitglied %mitarbeiter, das die Korrektur des Tests ausgeführt hat, befand sich in der Einarbeitungsphase. Es arbeitete daher nur ungefähr halb so schnell als sonst  und machte ein paar Fehler mehr.",115);

INSERT INTO effects_lang
VALUES (223,"en","The employee %mitarbeiter, that did the correction of the test, was in trainingsphase. He worked at half speed and made more errors than usual.",115);


/* erstelle Spez */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (9, 6, 7,1,600);

/* erstelle Entwurf */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (2, 10, 1,1,602);

/* erstelle Moduledesign */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (40, 12, 16,1,615);

/* erstelle Code */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (41, 12, 18,1,616);

/* erstelle Manual */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (5, 10, 4,1,622);

/* HB Review */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (6, 4, 5,1,622);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (7, 4, 6,1,622);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (10, 4, 10,1,622);

/* HB korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (62, 1, 27,1,602);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (63, 1, 28,1,602);

/* Entwurf Review */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (3, 5, 2,1,602);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (4, 5, 3,1,602);

/* Entwurf Korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (71, 3, 28,1,602);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (72, 3, 27,1,602);

/* Moduledesign Review */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (81, 6, 14,1,615);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (82, 6, 15,1,615);

/* Moduledesign Korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (83, 3, 31,1,615);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (84, 3, 32,1,615);

/* Code Review */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (93, 8, 12,1,616);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (94, 8, 13,1,616);

/* Code Korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (95, 4, 34,1,616);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (96, 4, 35,1,616);

/* Spez Review*/

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (8, 7, 8,1,600);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (1, 7, 9,1,600);

/* Modultest */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (102, 7, 17,114,617);

/* Modultest korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (103, 4, 36,115,617);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (104, 4, 37,115,617);

/* Integrationstest*/

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (12, 6, 38,114,618);

/* Integrationstest korrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (107, 3, 39,115,618);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (108, 3, 40,115,618);

/* Systemtest*/

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (114, 5, 41,114,619);

/* Systemtestkorrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (115, 2, 42,115,619);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (116, 2, 43,115,619);

/* Abnahmetestkorrektur */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (120, 3, 44,115,620);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (121, 3, 45,115,620);

/* D8. Mitarbeiter in Einarbeitung bei erstelle Spez */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (165, 3, 7,1,611);

/* D8. Mitarbeiter in Einarbeitung bei erstelle Entwurf */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (166, 3, 1,1,611);

/* D8. Mitarbeiter in Einarbeitung bei erstelle Modulentwurf */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (167, 3, 16,1,611);

/* D8. Mitarbeiter in Einarbeitung bei erstelle Code */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (168, 3, 18,1,611);

/* D8. Mitarbeiter in Einarbeitung bei erstelle HB */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (169, 3, 4,1,611);


/* K8. Mitarbeiter in Einarbeitung bei erstelle Spez */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (208, 3, 7,1,612);

/* K8. Mitarbeiter in Einarbeitung bei erstelle Entwurf */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (209, 3, 1,1,612);

/* K8. Mitarbeiter in Einarbeitung bei erstelle Modulentwurf */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (210, 3, 16,1,612);

/* K8. Mitarbeiter in Einarbeitung bei erstelle Code */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (211, 3, 18,1,612);

/* K8. Mitarbeiter in Einarbeitung bei erstelle HB */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (212, 3, 4,1,612);


/****************************************
/* REffekt Spez Review nicht korrigiert
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (611,"keine Reviewkorr",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_NACH_SPEZREVIEW_ALLES_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_SPEZIFIKATION_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 5,"Review nicht korrigiert","r",605,611);

INSERT INTO effects_lang
VALUES (5,"de","Sie haben nach dem Review keine Korrektur angeordnet.",5);

INSERT INTO effects_lang
VALUES (151,"en","You did not correct the document after the review.",5);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (20, 42, 23,5,600);

/*
/* REffekt HB Review nicht korrigiert
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (625,"keine ReviewkorrHB",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_HANDBUCHREVIEW_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 15,"Review nicht korrigiert","r",605,625);

INSERT INTO effects_lang
VALUES (15,"de","Sie haben nach dem Review keine Korrektur angeordnet.",15);

INSERT INTO effects_lang
VALUES (152,"en","You did not correct the document after the review.",15);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (46, 39, 21,15,622);
/*
/* REffekt Entwurf  Review nicht korrigiert
/ */



INSERT INTO query(qid,attribute,statement,z_path)
VALUES (638,"keine Reviewkorr Entwurf  ",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_SYSTEMENTWURF_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 51,"Review nicht korrigiert Entwurf  ","r",605,638);

INSERT INTO effects_lang
VALUES (51,"de","Sie haben nach dem Review keine Korrektur angeordnet.",51);

INSERT INTO effects_lang
VALUES (153,"en","You did not correct the document after the review.",51);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (49, 36, 20,51,602);
/*
/* M12. Moduledesign Review nicht korrigiert REffekt 
/ */



INSERT INTO query(qid,attribute,statement,z_path)
VALUES (641,"keine Reviewkorr Moduledesign ",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MODULSPEZ_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_MODULSPEZREVIEW_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 20,"Review nicht korrigiert Moduledesign ","r",605,641);

INSERT INTO effects_lang
VALUES (154,"en","You did not correct the document after the review.",20);

INSERT INTO effects_lang
VALUES (20,"de","Sie haben nach dem Review keine Korrektur angeordnet.",20);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (51, 41, 22, 20,615);

/*
/* C12. Code  Review nicht korrigiert REffekt 
/ */



INSERT INTO query(qid,attribute,statement,z_path)
VALUES (639,"keine Reviewkorr Code  ",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_CODE_NACH_REVIEW_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_CODEREVIEW_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 22,"Review nicht korrigiert Code  ","r",605,639);

INSERT INTO effects_lang
VALUES (155,"en","You did not correct the document after the review.",22);

INSERT INTO effects_lang
VALUES (22,"de","Sie haben nach dem Review keine Korrektur angeordnet.",22);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (32, 109, 19,22,616);

/*
/* S14. keine Alleskorrektur Spez REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (612,"HB oder Entwurf begonnen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" or
rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN") and
simdat <= "%aktdat" and
gid = %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 6,"keine Alleskorr","r",600,612);

INSERT INTO effects_lang
VALUES (6,"de","Sie haben keine Alleskorrektur durchgeführt, obwohl Entwurf
 und/oder Handbuch bereits begonnen wurden.",6);

INSERT INTO effects_lang
VALUES (156,"en","You did not correct all documents, although the writing of design and/or manual had already started.",6);


/* ENTWICKLER_BEGINNT_SPEZIFIKATION_ZU_KORRIGIEREN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (21, 40, 25,6,600);

/*
/* E16. keine Alleskorrektur Entwurf REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (655,"Modulspez begonnen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN") and
simdat <= "%aktdat" and
gid = %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 53,"keine Alleskorr Entwurf","r",600,655);

INSERT INTO effects_lang
VALUES (53,"de","Sie haben keine Alleskorrektur durchgeführt, obwohl das Moduledesign 
 bereits begonnen wurde.",53);

INSERT INTO effects_lang
VALUES (157,"en","You did not correct all documents, although the writing of module design already started.",53);

/* ENTWICKLER_BEGINNT_SYSTEMENTWURF_ZU_KORRIGIEREN*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (78, 17, 27,53,602);

/*
/* M16. keine Alleskorrektur Moduldesign REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (661,"Codierung begonnen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN") and
simdat <= "%aktdat" and
gid = %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 60,"keine Alleskorr Moduldesign ","r",600,661);

INSERT INTO effects_lang
VALUES (60,"de","Sie haben keine Alleskorrektur durchgeführt, obwohl die Codierung
 bereits begonnen wurde.",60);

INSERT INTO effects_lang
VALUES (158,"en","You did not correct all documents, although the writing of the code had already started.",60);

/* ENTWICKLER_BEGINNT_MODULSPEZ_ZU_KORRIGIEREN*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (90, 19, 31,60,615);


/*
/* REffekt Entwurf Review nicht korrigiert
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (622,"Reviewkorr Entwuf",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_SYSTEMENTWURF_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 12,"Review nicht korrigiert Entwurf","r",605,622);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (12,"de","Sie haben nach dem Review keine Korrektur angeordnet.",12);

INSERT INTO effects_lang
VALUES (159,"en","You did not correct the document after the review.",12);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (24, 40, 2,12,602);

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (25, 40, 3,12,602);

/*
/* S11. schelchtes Reviewteam  Spez MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (648,"schelchtes Reviewteam Spez",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Richard", "Bernd" , "Stefanie");',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 42,"schelchtes Reviewteam Spez","m",605,648);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (42,"de","Sie haben den Mitarbeiter %mitarbeiter für den Review eingeteilt. Die am besten geeigneten Mitarbeiter sind jedoch Stefanie, Richard und Bernd.",42);

INSERT INTO effects_lang
VALUES (160,"en","You told  %mitarbeiter to review the document. But the employees with the best qualification for this job are Stefanie, Richard and Bernd.",42);

/* spez Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (54, 5, 8,42,600);

/* spez Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (55, 5, 9,42,600);

/* spez Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (56, 5, 11,42,600);

/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* spez Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (132, 2, 8,42,611);

/* spez Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (133, 2, 9,42,611);

/* spez Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (134, 2, 11,42,611);

/**
/* K4. Mitarbeiter nicht geeignet fuer Review
/ */

/* spez Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (176, 2, 8,42,612);

/* spez Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (177, 2, 9,42,612);

/* spez Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (178, 2, 11,42,612);
/*
/* H14. schelchtes Reviewteam  HB MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (650,"schelchtes Reviewteam HB",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Bernd" , "Stefanie");',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 45,"schelchtes Reviewteam HB","m",605,650);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (45,"de","Sie haben den Mitarbeiter %mitarbeiter für den Review eingeteilt. Die am besten geeigneten Mitarbeiter sind jedoch Stefanie und Bernd.",45);

INSERT INTO effects_lang
VALUES (161,"en","You told  %mitarbeiter to review the document. But the employees with the best qualification for this job are Stefanie and Bernd.",45);

/* HB Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (64, 7, 10,45,622);

/* HB Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (65, 7, 5,45,622);

/* HB Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (66, 7, 6,45,622);

/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* HB Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (135, 2, 10,45,611);

/* HB Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (136, 2, 5,45,611);

/* HB Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (137, 2, 6,45,611);

/**
/* K4. Mitarbeiter nicht geeignet fuer Review
/ */
/* HB Review mit Kunde */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (179, 2, 10,45,612);

/* HB Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (180, 2, 5,45,612);

/* HB Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (181, 2, 6,45,612);
/*
/* E13. schelchtes Reviewteam  Entwurf  MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (653,"schelchtes Reviewteam Entwurf  ",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Christine" ,"Richard", "Bernd", "Stefanie");',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 50,"schelchtes Reviewteam Entwurf  ","m",605,653);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (50,"de","Sie haben den Mitarbeiter %mitarbeiter für den Review eingeteilt. Die am besten geeigneten Mitarbeiter sind jedoch Christine, Richard, Stefanie und Bernd.",50);

INSERT INTO effects_lang
VALUES (162,"en","You told  %mitarbeiter to review the document. But the employees with the best qualification for this job are Christine, Richard, Stefanie and Bernd.",50);

/* Entwurf  Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (73, 1, 2,50,602);

/* Entwurf  Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (74, 1, 3,50,602);

/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Entwurf Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (138, 2, 2,50,611);

/* Entwurf Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (139, 2, 3,50,611);

/**
/* K4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Entwurf Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (182, 2, 2,50,612);

/* Entwurf Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (183, 2, 3,50,612);
/*
/* M13. schelchtes Reviewteam  Moduldesign  MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (659,"schelchtes Reviewteam Moduldesign  ",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Christine" , "Bernd", "Stefanie");',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 57,"schelchtes Reviewteam Moduldesign  ","m",605,659);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (57,"de","Sie haben den Mitarbeiter %mitarbeiter für den Review eingeteilt. Die am besten geeigneten Mitarbeiter sind jedoch Christine, Stefanie und Bernd.",57);

INSERT INTO effects_lang
VALUES (163,"en","You told  %mitarbeiter to review the document. But the employees with the best qualification for this job are Christine, Stefanie and Bernd.",57);

/* Entwurf  Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (85, 1, 14,57,615);

/* Entwurf  Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (86, 1, 15,57,615);

/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Modulentwurf Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (140, 2, 14,57,611);

/* Modulentwurf Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (141, 2, 15,57,611);

/**
/* K4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Modulentwurf Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (184, 2, 14,57,612);

/* Modulentwurf Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (185, 2, 15,57,612);
/*
/* C13. schelchtes Reviewteam  Code  MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (664,"schelchtes Reviewteam Code  ",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Diana" , "Bernd", "Stefanie");',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 64,"schelchtes Reviewteam Code  ","m",605,664);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (64,"de","Sie haben den Mitarbeiter %mitarbeiter für den Review eingeteilt. Die am besten geeigneten Mitarbeiter sind jedoch Diana, Stefanie und Bernd.",64);

INSERT INTO effects_lang
VALUES (165,"en","You told  %mitarbeiter to review the document. But the employees with the best qualification for this job are Diana,  Stefanie and Bernd.",64);

/* Entwurf  Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (97, 3, 12,64,616);

/* Entwurf  Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (98, 3, 13,64,616);

/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Code Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (142, 2, 12,64,611);

/* Code Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (143, 2, 13,64,611);


/**
/* D4. Mitarbeiter nicht geeignet fuer Review
/ */
/* Code Review 2 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (186, 2, 12,64,612);

/* Code Review 3 */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (187, 2, 13,64,612);

/*
/* S12. Spez Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (649,"Korrektur durch unqual Mitarbeiter  Spez",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Richard")
and gid= %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 43,"Korrektur durch unqual Mitarbeiter  Spez","m",605,649);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (43,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur der Spezifikation betraut. Der am besten geeignete Mitarbeiter ist jedoch  Richard.",43);

INSERT INTO effects_lang
VALUES (166,"en","You told  %mitarbeiter to correct the document. But the employee with the best qualification for this job is Richard.",43);

/* Alleskorr nach spez Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (57, 7, 24,43,600);

/* spez korretur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (58, 7, 25,43,600);

/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Spez Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (144, 1, 24,43,611);

/*  korrektur nach  Spez Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (145, 1, 25,43,611);


/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Spez Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (188, 1, 24,43,612);

/*  korrektur nach  Spez Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (189, 1, 25,43,612);
/*
/* H15. HB Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (651,"Korrektur durch unqual Mitarbeiter  HB",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Bernd")
and gid= %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 46,"Korrektur durch unqual Mitarbeiter  HB","m",605,651);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (46,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur des Handbuchs betraut. Der am besten geeignete Mitarbeiter ist jedoch  Bernd.",46);

INSERT INTO effects_lang
VALUES (167,"en","You told  %mitarbeiter to correct the document. But the employee with the best qualification for this job is Bernd.",46);

/* Alleskorr nach HB Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (67, 2, 26,46,622);

/* HB korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (68, 2, 29,46,622);

/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  HB Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (146, 1, 26,46,611);

/*  korrektur nach  HB Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (147, 1, 29,46,611);

/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  HB Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (190, 1, 26,46,612);

/*  korrektur nach  HB Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (191, 1, 29,46,612);

/*
/* E14. Entwurfs-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (654,"Korrektur durch unqual Mitarbeiter  Entwurf",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Christine", "Richard")
and gid= %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 23,"Korrektur durch unqual Mitarbeiter  Entwurf","m",605,654);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (23,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur des Entwurfs betraut. Die am besten geeigneten Mitarbeiter sind jedoch  Christine und Richard.",23);

INSERT INTO effects_lang
VALUES (168,"en","You told  %mitarbeiter to correct the document. But the employee with thes best qualification for this job are Christine and Richard.",23);

/* Alleskorr nach Entwurf Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (75, 5, 27,23,602);

/* Entwurf korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (76, 5, 28,23,602);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Entwurf  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (148, 1, 28,23,611);

/*  Entwurf korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (149, 1, 27,23,611);
/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Entwurf  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (192, 1, 28,23,612);

/*  Entwurf korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (193, 1, 27,23,612);
/*
/*  Moduldesign-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (660,"Korrektur durch unqual Mitarbeiter  Moduldesign",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Christine", "Richard")
and gid= %game;',
"*");


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 58,"Korrektur durch unqual Mitarbeiter  HB","m",605,660);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (58,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur des Moduldesigns betraut. Die am besten geeigneten Mitarbeiter sind jedoch  Christine und Richard.",58);

INSERT INTO effects_lang
VALUES (169,"en","You told  %mitarbeiter to correct the document. But the employees with the best qualification for this job are Christine and Richard.",58);

/* Alleskorr nach ModuldesignReview  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (87, 1, 32,58,615);

/* Moduldesign korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (88, 1, 31,58,615);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Moduldesign  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (150, 1, 32,58,611);

/*  Moduldesign Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (151, 1, 31,58,611);

/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Moduldesign  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (194, 1, 32,58,612);

/*  Moduldesign Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (195, 1, 31,58,612);
/*
/*  C15. Code-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (665,"Korrektur von  Code durch unqual Mitarbeiter  ",
'select simdat
from SimData
where 
"%mitarbeiter" in ("Diana")
and gid= %game;',
"*");

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 65,"Korrektur durch unqual Mitarbeiter  HB","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (65,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur des Codes betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",65);

INSERT INTO effects_lang
VALUES (170,"en","You told  %mitarbeiter to correct the code. But the employee with the best qualification for this job is Diana.",65);

/* Alleskorr nach Codes Review  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (99, 5, 34,65,616);

/* Codes korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (100, 5, 35,65,616);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Code  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (152, 1, 35,65,611);

/*  Korrektur Code */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (153, 1, 34,65,611);
/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Review Code  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (196, 1, 35,65,612);

/*  Korrektur Code */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (197, 1, 34,65,612);
/*
/*  T5. Modultest-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 67,"Korrektur durch unqual Mitarbeiter  Modultest","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (67,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur nach dem Modultest betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",67);

INSERT INTO effects_lang
VALUES (171,"en","You told  %mitarbeiter to correct the code. But the employee with the best qualification for this job is Diana.",67);

/* Alleskorr nach Modultest  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (105, 7, 36,67,617);

/* Modultest  korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (106, 7, 37,67,617);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Modultest  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (154, 1, 37,67,611);

/*  Modultest  Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (155, 1, 36,67,611);
/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Modultest  */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (198, 1, 37,67,612);

/*  Modultest  Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (199, 1, 36,67,612);
/*
/*  T15. Integrationstest-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 70,"Korrektur durch unqual Mitarb. Integrationstest","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (70,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur nach dem Integrationstest betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",70);

INSERT INTO effects_lang
VALUES (172,"en","You told  %mitarbeiter to correct the code. But the employee with the best qualification for this job is Diana.",70);

/* Alleskorr nach Integrationstest*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (126, 6, 40,70,618);

/* Integrationstest korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (11, 6, 39,70,618);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Integrationstest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (156, 1, 39,70,611);

/*  Integrationstest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (157, 1, 40,70,611);
/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Integrationstest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (200, 1, 39,70,612);

/*  Integrationstest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (201, 1, 40,70,612);
/*
/*  T21. Systemtest-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 77,"Korrektur durch unqual Mitarbeiter  Systemtest","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (77,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur nach dem Systemtest betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",77);

INSERT INTO effects_lang
VALUES (173,"en","You told  %mitarbeiter to correct the code. But the employee with the best qualification for this job is Diana.",77);

/* Alleskorr nach Systemtest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (109, 3, 42,77,619);

/* Systemtest korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (110, 3, 43,77,619);
/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Systemtest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (158, 1, 42,77,611);

/*  Systemtest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (159, 1, 43,77,611);
/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Systemtest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (202, 1, 42,77,612);

/*  Systemtest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (203, 1, 43,77,612);
/*
/*  T26. Abnahmetest-Korrektur durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 24,"Korrektur Abnahmetest durch unqual Mitarbeiter  ","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (24,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Korrektur nach dem Abnahmetests betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",24);

INSERT INTO effects_lang
VALUES (174,"en","You told  %mitarbeiter to correct the code. But the employee with the best qualification for this job is Diana.",24);

/* Alleskorr nach Integrationstest*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (122, 3, 44,24,618);

/* Integrationstest korrektur */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (123, 3, 45,24,618);

/**
/* D5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Abnahmetest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (160, 1, 45,24,611);

/*  Abnahmetest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (161, 1, 44,24,611);

/**
/* K5. Mitarbeiter nicht geeignet fuer Korrektur
/ */
/* Alleskorr nach  Abnahmetest */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (204, 1, 45,24,612);

/*  Abnahmetest Korrektur*/
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (205, 1, 44,24,612);
/*
/* S13. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 44,"Erstellung durch unqual Mitarbeiter  Spez","m",605,649);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (44,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Erstellung der Spezifikation betraut. Der am besten geeignete Mitarbeiter ist jedoch  Richard.",44);

INSERT INTO effects_lang
VALUES (175,"en","You told  %mitarbeiter to write the specification. But the employee with the best qualification for this job is Richard.",44);

/* ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (59, 18, 7,44,600);

/*
/* D3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (127, 3, 7,44,611);

/*
/* K3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (171, 3, 7,44,612);

/*
/* H16. HB Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 47,"Erstellung durch unqual Mitarbeiter  HB","m",605,651);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (47,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Erstellung des Handbuchs betraut. Der am besten geeignete Mitarbeiter ist jedoch  Bernd.",47);

INSERT INTO effects_lang
VALUES (176,"en","You told  %mitarbeiter to write the manual. But the employee with the best qualification for this job is Bernd.",47);

/* ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (69, 6, 4,47,622);

/*
/* D3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (128, 3, 4,47,611);

/*
/* K3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (172, 3, 4,47,612);

/*
/* E15. Entwurfs-Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 52,"Erstellung durch unqual Mitarbeiter  Entwurf","m",605,654);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (52,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Erstellung des Entwurfs betraut. Die am besten geeigneten Mitarbeiter sind jedoch  Christine und Richard.",52);

INSERT INTO effects_lang
VALUES (177,"en","You told  %mitarbeiter to write the design. But the employees with the best qualification for this job are Christine and Richard.",52);

/* ENTWICKLER_BEGINNT_ZU_ENTWERFEN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (77, 10, 1,52,602);

/*
/* D3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (129, 3, 1,52,611);

/*
/* K3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (173, 3, 1,52,612);
/*
/* M15. Moduldesign-Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 59,"Erstellung durch unqual Mitarbeiter  Moduldesign","m",605,660);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (59,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Erstellung des Moduldesigns betraut. Die am besten geeigneten Mitarbeiter sind jedoch  Christine und Richard.",59);

INSERT INTO effects_lang
VALUES (178,"en","You told  %mitarbeiter to write the module design. But the employee with the best qualification for this job is Christine.",59);

/* ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (89, 4, 16,59,615);

/*
/* D3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (130, 3, 16,59,611);


/*
/* K3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (174, 3, 16,59,612);

/*
/* C16. Code-Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 66,"Erstellung durch unqual Mitarbeiter  Code","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (66,"de","Sie haben den Mitarbeiter %mitarbeiter mit der Erstellung des Codes betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",66);

INSERT INTO effects_lang
VALUES (179,"en","You told  %mitarbeiter to write the code. But the employee with the best qualification for this job is Diana.",66);

/* ENTWICKLER_BEGINNT_ZU_CODIEREN */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (101, 39, 18,66,616);

/*
/* D3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (131, 3, 18,66,611);

/*
/* K3. Erstellung durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (175, 3, 18,66,612);

/*
/* T10. Integrationstest durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 71,"Integrationstest durch unqual Mitarbeiter","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (71,"de","Sie haben den Mitarbeiter %mitarbeiter mit dem Integrationstest  betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",71);

INSERT INTO effects_lang
VALUES (180,"en","You told  %mitarbeiter to do the integration test. But the employee with the best qualification for this job is Diana.",71);

/* ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (111, 21, 38,71,618);

/*
/* D6. Mitarbeiter nicht geeignet für Test
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (163, 1, 38,71,611);


/*
/* K6. Mitarbeiter nicht geeignet für Test
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (206, 1, 38,71,612);
/*
/* T18. Systemtest durch unqual Mitarbeiter MEffekt 
/ */

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 75,"Systemtest durch unqual Mitarbeiter","m",605,665);

INSERT INTO effects_lang (eff_lang_id, language, text, eid)
VALUES (75,"de","Sie haben den Mitarbeiter %mitarbeiter mit dem Systemtest betraut. Die am besten geeignete Mitarbeiterin ist jedoch  Diana.",75);

INSERT INTO effects_lang
VALUES (181,"en","You told  %mitarbeiter to do the system test. But the employee with the best qualification for this job is Diana.",75);

/* ENTWICKLER_BEGINNT_MIT_SYSTEMTEST */
INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (117, 15, 41,75,619);

/*
/* D6. Mitarbeiter nicht geeignet für Test
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (164, 1, 41,75,611);

/*
/* K6. Mitarbeiter nicht geeignet für Test
/ */

INSERT INTO  Rpriority (rpid,  value, evalid, eid,aiddid) 
VALUES (207, 1, 41,75,612);

/******************************************+
/* T3. Modultest nicht korrigiert REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (642,"Modultest nicht korr",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_CODE_NACH_MODULTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_MODULTEST_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 38,"Modultest nicht korrigiert","r",605,642);

INSERT INTO effects_lang
VALUES (38,"de","Sie haben nach dem Modultest keine Korrektur angeordnet.",38);

INSERT INTO effects_lang
VALUES (182,"en","You did not correct the code after the module test.",38);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (53, 101,17,38,617);

/******************************************+
/* T11. Integrationstest nicht korrigiert REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (668,"Integrationstest nicht korr",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_CODE_NACH_INTEGRATIONSTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_INTEGRATIONSTEST_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 72,"Integrationstest nicht korrigiert","r",605,668);

INSERT INTO effects_lang
VALUES (72,"de","Sie haben nach dem Integrationstest keine Korrektur angeordnet.",72);

INSERT INTO effects_lang
VALUES (183,"en","You did not correct the code after the integration test.",72);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (112, 48,38,72,618);

/******************************************+
/* T19. Systemtest nicht korrigiert REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (670,"Systemtest nicht korr",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_CODE_NACH_SYSTEMTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_SYSTEMTEST_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 76,"Systemtest nicht korrigiert","r",605,670);

INSERT INTO effects_lang
VALUES (76,"de","Sie haben nach dem Systemtest keine Korrektur angeordnet.",76);

INSERT INTO effects_lang
VALUES (184,"en","You did not correct the code after the system test.",76);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (118, 45,41,76,619);

/******************************************+
/* T25. Abnahmetest nicht korrigiert REffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (673,"Abnahmetest nicht korr",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_CODE_NACH_ABNAHMETEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_ABNAHMETEST_ALLES_ZU_KORRIGIEREN") and
gid = %game and
simdat  >= "%aktdat";',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 80,"Abnahmetest nicht korrigiert","r",605,673);

INSERT INTO effects_lang
VALUES (80,"de","Sie haben nach dem Abnahmetest keine Korrektur angeordnet.",80);

INSERT INTO effects_lang
VALUES (185,"en","You did not correct the code after the acceptance test.",80);

INSERT INTO Rpriority (rpid, value,evalid, eid,aiddid)
VALUES (119, 29,46,80,620);

/******************************************+
/* T1. Modultest ausgelassen AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (643,"Modultest ausgelassen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MIT_MODULTEST" ) and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 39,"Modultest ausgelassen","a",605,643);

INSERT INTO effects_lang
VALUES (39,"de","Sie haben keinen Modultest durchgeführt.",39);

INSERT INTO effects_lang
VALUES (186,"en","You forgot the module test.",39);

INSERT INTO Apriority 
VALUES (53, 111,39,618);

/******************************************+
/* T8. Integrationstest ausgelassen AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (667,"Integrationstest ausgelassen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST" ) and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 69,"Integrationstest ausgelassen","a",605,667);

INSERT INTO effects_lang
VALUES (69,"de","Sie haben keinen Integrationstest durchgeführt.",69);

INSERT INTO effects_lang
VALUES (187,"en","You forgot the integration test.",69);

INSERT INTO Apriority 
VALUES (23, 107,69,619);

/******************************************+
/* T16. Systemtest ausgelassen AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (606,"Systemtest ausgelassen",
'select simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MIT_INTEGRATIONSTEST" ) and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 74,"Systemtest ausgelassen","a",605,606);

INSERT INTO effects_lang
VALUES (74,"de","Sie haben keinen Systemtest durchgeführt.",74);

INSERT INTO effects_lang
VALUES (188,"en","You forgot the system test.",74);

INSERT INTO Apriority 
VALUES (24, 115,74,620);

/******************************************+
/* T14. Abnahmetest ausgelassen AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (672,"Abnahmetest ausgelassen",
'select simdat
from SimData
where (rule = "KUNDE_BEGINNT_MIT_ABNAHMETEST" ) and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 79,"Abnahmetest ausgelassen","a",605,672);

INSERT INTO effects_lang
VALUES (79,"de","Sie haben keinen Abnahmetest durchgeführt.",79);

INSERT INTO effects_lang
VALUES (189,"en","You forgot the acceptance test.",79);

INSERT INTO Apriority 
VALUES (25, 89,79,621);


/******************************************+
/* AEffekt Review abgebrochen
/ */



/******************************************+
/* AEffekt Reviewalleskorr abgebrochen
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (607,"Reviewalleskorr abgebrochen",
'select simdat
from SimData
where rule="MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_FERTIG_SEIN" and
simdat > (select max(simdat)
from SimData
where (rule = "KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_ABBRECHEN" )  and
gid=%game) and
gid = %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 40,"Reviewkorr abgebrochen","a",600,607);

INSERT INTO effects_lang
VALUES (40,"de","Sie haben den Review nicht fertig korrigiert.",40);


INSERT INTO effects_lang
VALUES (190,"en","You did not finish the correction of the review.",40);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (40, 42,40,600);



/******************************************+
/* AEffrekt Reviewkorr abgebrochen
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (647,"Reviewkorr abgebrochen",
'select simdat
from SimData
where rule="MIT_KORREKTUR_AUF_BASIS_VON_SPEZIFIKATIONSREVIEWBERICHT_FERTIG_SEIN" and
simdat > (select max(simdat)
from SimData
where (rule = "KORREKTUR_VON_SPEZIFIKATION_ABBRECHEN" )  and
gid=%game) and
gid = %game;',
null);


INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 41,"Reviewkorr abgebrochen","a",600,647);

INSERT INTO effects_lang
VALUES (41,"de","Sie haben den Review nicht fertig korrigiert.",41);

INSERT INTO effects_lang
VALUES (191,"en","You did not finish the correction of the review.",41);


INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (41, 42,41,600);


/******************************************+
/*  D2. Spezifikation  mehr als 2 Mitarbeiter AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (674,"Anzahl Mitarbeiter bei Erstellung Spez",
'select count(distinct param1) as simdata
from SimData
where rule="ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN" and
gid = %game;',
null);

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point,expression)
VALUES (611,'Z','>',2,null,null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 81,"mehr als 2 Mitarbeiter Spezifikation","a",611,674);

INSERT INTO effects_lang
VALUES (81,"de","Sie haben mehr als 2 Mitarbeiter mit der Erstellung der Spezifikation betraut. Durch den Abstimmungsaufwand dauert die Erstellung deshalb länger.",81);

INSERT INTO effects_lang
VALUES (192,"en","You told more than 2 employees to write the specification. Due to communication effort the writing takes longer.",81);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (54, 4,81,611);

/*
/* K2. Spezifikation  mehr als 2 Mitarbeiter AEffekt
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (85, 4,81,612);


/******************************************+
/*  D2. Entwurf  mehr als 2 Mitarbeiter AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (675,"Anzahl Mitarbeiter bei Erstellung Entwurf",
'select count(distinct param1) as simdata
from SimData
where rule="ENTWICKLER_BEGINNT_ZU_ENTWERFEN" and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 82,"mehr als 2 Mitarbeiter Entwurf","a",611,675);

INSERT INTO effects_lang
VALUES (82,"de","Sie haben mehr als 2 Mitarbeiter mit der Erstellung des Entwurfs betraut. Durch den Abstimmungsaufwand dauert die Erstellung deshalb länger.",82);

INSERT INTO effects_lang
VALUES (193,"en","You told more than 2 employees to write the design. Due to communication effort the writing takes longer.",82);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (55, 4,82,611);

/*
/* K2. Entwurf  mehr als 2 Mitarbeiter AEffekt
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (86, 4,82,612);

/******************************************+
/*  D2. Modulentwurf  mehr als 2 Mitarbeiter AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (676,"Anzahl Mitarbeiter bei Erstellung Modulentwurf",
'select count(distinct param1) as simdata
from SimData
where rule="ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 83,"mehr als 2 Mitarbeiter Modulentwurf","a",611,676);

INSERT INTO effects_lang
VALUES (83,"de","Sie haben mehr als 2 Mitarbeiter mit der Erstellung des Moduldesigns betraut. Durch den Abstimmungsaufwand dauert die Erstellung deshalb länger.",83);

INSERT INTO effects_lang
VALUES (194,"en","You told more than 2 employees to write the module design. Due to communication effort the writing takes longer.",83);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (56, 4,83,611);

/*
/* K2. Modulentwurf  mehr als 2 Mitarbeiter AEffekt
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (87, 4,83,612);

/******************************************+
/*  D2. Code  mehr als 2 Mitarbeiter AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (677,"Anzahl Mitarbeiter bei Erstellung Code",
'select count(distinct param1) as simdata
from SimData
where rule="ENTWICKLER_BEGINNT_ZU_CODIEREN" and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 84,"mehr als 2 Mitarbeiter Code","a",611,677);

INSERT INTO effects_lang
VALUES (84,"de","Sie haben mehr als 2 Mitarbeiter mit der Erstellung des Codes betraut. Durch den Abstimmungsaufwand dauert die Erstellung deshalb länger.",84);

INSERT INTO effects_lang
VALUES (195,"en","You told more than 2 employees to write the code. Due to communication effort the writing takes longer.",84);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (57, 4,84,611);

/*
/* K2. Code  mehr als 2 Mitarbeiter AEffekt
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (88, 4,84,612);

/******************************************+
/*  D2. Handbuch  mehr als 2 Mitarbeiter AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (678,"Anzahl Mitarbeiter bei Erstellung Handbuch",
'select count(distinct param1) as simdata
from SimData
where rule="ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 85,"mehr als 2 Mitarbeiter Handbuch","a",611,678);

INSERT INTO effects_lang
VALUES (85,"de","Sie haben mehr als 2 Mitarbeiter mit der Erstellung des Handbuchs betraut. Durch den Abstimmungsaufwand dauert die Erstellung länger.",85);

INSERT INTO effects_lang
VALUES (196,"en","You told more than 2 employees to write the manual. Due to communication effort the writing takes longer.",85);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (58, 4,85,611);

/*
/* K2.  Handbuch  mehr als 2 Mitarbeiter AEffekt
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (89, 4,85,612);

/******************************************+
/*  D9.   mehr als 2 Reviews Spez - AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (683,"Anzahl Reviews für Spez",
'select count(*) as simdata
from SimData
where (rule="SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT"  or  
 rule = "SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or 
 rule = "SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT") and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 90,"mehr als 2 Reviews Spezifikation","a",611,683);

INSERT INTO effects_lang
VALUES (90,"de","Sie haben mehr als 2 Reviews für die Spezifikation durchgeführt.",90);

INSERT INTO effects_lang
VALUES (197,"en","You made more than 2 reviews on specification.",90);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (64, 4,90,611);

/******************************************+
/*  K9.   mehr als 2 Reviews Spez - AEffekt 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (94, 4,90,612);

/******************************************+
/*  D9.   mehr als 2 Reviews Entwurf - AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (684,"Anzahl Reviews für Entwurf",
'select count(*) as simdata
from SimData
where (rule="ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT"  or  
 rule = "ENTWURFSREVIEW_MIT_2_GUTACHTERN_BEGINNT") and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 91,"mehr als 2 Reviews Entwurf","a",611,684);

INSERT INTO effects_lang
VALUES (91,"de","Sie haben mehr als 2 Reviews für den Entwurf durchgeführt.",91);

INSERT INTO effects_lang
VALUES (198,"en","You made more than 2 reviews on design.",91);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (65, 4,91,611);

/******************************************
/*  K9.   mehr als 2 Reviews Entwurf - AEffekt 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (95, 4,91,612);

/******************************************+
/*  D9.   mehr als 2 Reviews Modulentwurf - AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (685,"Anzahl Reviews für Modulentwurf",
'select count(*) as simdata
from SimData
where (rule="MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT"  or  
 rule = "MODSPEZREVIEW_MIT_2_GUTACHTERN_BEGINNT") and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 92,"mehr als 2 Reviews Modulentwurf","a",611,685);

INSERT INTO effects_lang
VALUES (92,"de","Sie haben mehr als 2 Reviews für den Modulentwurf durchgeführt.",92);

INSERT INTO effects_lang
VALUES (199,"en","You made more than 2 reviews on module design.",92);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (66, 4,92,611);

/******************************************+
/*  K9.   mehr als 2 Reviews Modulentwurf - AEffekt 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (96, 4,92,612);

/******************************************+
/*  D9.   mehr als 2 Reviews Code - AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (686,"Anzahl Reviews für Code",
'select count(*) as simdata
from SimData
where (rule="CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT"  or  
 rule = "CODEREVIEW_MIT_2_GUTACHTERN_BEGINNT") and
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 93,"mehr als 2 Reviews Code","a",611,686);

INSERT INTO effects_lang
VALUES (93,"de","Sie haben mehr als 2 Reviews für den Code durchgeführt.",93);

INSERT INTO effects_lang
VALUES (200,"en","You made more than 2 reviews on code.",93);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (67, 4,93,611);

/******************************************+
/*  K9.   mehr als 2 Reviews Code - AEffekt 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (97, 4,93,612);

/******************************************+
/*  D9.   mehr als 2 Reviews Handbuch - AEffekt 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (687,"Anzahl Reviews für Handbuch",
'select count(*) as simdata
from SimData
where (rule="HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT"  or  
 rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" or 
 rule = "HANDBUCHREVIEW_MIT_KUNDE_BEGINNT") and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 94,"mehr als 2 Reviews Handbuch","a",611,687);

INSERT INTO effects_lang
VALUES (94,"de","Sie haben mehr als 2 Reviews für das Handbuch durchgeführt.",94);

INSERT INTO effects_lang
VALUES (201,"en","You made more than 2 reviews on manuals.",94);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (68, 4,94,611);

/******************************************+
/*  K9.   mehr als 2 Reviews Code - AEffekt 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (98, 4,94,612);

/******************************************+
/*  D10.   CodeReview - AEffekt 
/ */

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (602,"Z",'>',0,null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 95,"mehr als 2 Reviews Handbuch","a",602,686);

INSERT INTO effects_lang
VALUES (95,"de","Sie haben einen Codereview durchgeführt.",95);

INSERT INTO effects_lang
VALUES (202,"en","You made a codereview.",95);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (69, 6,95,611);

/******************************************+
/*  K10.   CodeReview - AEffekt 
/ */
INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (99, 6,95,612);

/*
/* D12. Korrektur nicht durch Autor  Spez
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (688,"Korrektor der Spezifikation nicht gleich Autor",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_SPEZIFIKATION_ZU_KORRIGIEREN"
	AND param1 not in (SELECT param1 FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN"
	AND b.gid= %game
	AND b.simdat < a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 110,"Korrektur nicht durch Autor Spez","a",600,688);

INSERT INTO effects_lang
VALUES (110,"de","Sie haben die Spezifiaktion nicht vom Autor korrigieren lassen.",110);

INSERT INTO effects_lang
VALUES (203,"en","You told someone who is not the author to correct the specification.",110);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (84, 1,110,611);

/*
/* K12. Korrektur nicht durch Autor  Spez
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (100, 1,110,612);

/*
/* D12. Korrektur nicht durch Autor  Entwurf
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (689,"Korrektor der Entwurf nicht gleich Autor",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_ENTWURF_ZU_KORRIGIEREN"
	AND param1 not in (SELECT param1 FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN"
	AND b.gid= %game
	AND b.simdat < a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 96,"Korrektur nicht durch Autor Entwurf","a",600,689);

INSERT INTO effects_lang
VALUES (96,"de","Sie haben den Entwurf nicht vom Autor korrigieren lassen.",96);

INSERT INTO effects_lang
VALUES (204,"en","You told someone who is not the author to correct the design.",96);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (70, 1,96,611);

/*
/* K12. Korrektur nicht durch Autor  Entwurf 
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (101, 1,96,612);
/*
/* D12. Korrektur nicht durch Autor  Modulentwurf
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (690,"Korrektor der Modulentwurf nicht gleich Autor",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_MODULSPEZ_ZU_KORRIGIEREN"
	AND param1 not in (SELECT param1 FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN"
	AND b.gid= %game
	AND b.simdat < a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 97,"Korrektur nicht durch Autor Modulentwurf","a",600,690);

INSERT INTO effects_lang
VALUES (97,"de","Sie haben den Modulentwurf nicht vom Autor korrigieren lassen.",97);

INSERT INTO effects_lang
VALUES (205,"en","You told someone who is not the author to correct the module design.",97);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (71, 1,97,611);

/*
/* K12. Korrektur nicht durch Autor  Modulentwurf 
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (102, 1,97,612);
/*
/* D12. Korrektur nicht durch Autor  Code
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (691,"Korrektor den Code nicht gleich Autor",
'select simdat
from SimData a
where 	(a.rule="ENTWICKLER_BEGINNT_CODE_NACH_REVIEW_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_CODE_NACH_SYSTEMTEST_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_CODE_NACH_ABNAHMETEST_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_CODE_NACH_INTEGRATIONSTEST_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_CODE_NACH_MODULTEST_ZU_KORRIGIEREN") 
	AND param1 not in (SELECT param1 FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN"
	AND b.gid= %game
	AND b.simdat < a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 98,"Korrektur nicht durch Autor  Code","a",600,691);

INSERT INTO effects_lang
VALUES (98,"de","Sie haben den Code nicht vom Autor korrigieren lassen.",98);

INSERT INTO effects_lang
VALUES (206,"en","You told someone who is not the author to correct the code.",98);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (72, 1,98,611);

/*
/* K12. Korrektur nicht durch Autor  Code 
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (103, 1,98,612);
/*
/* D12. Korrektur nicht durch Autor  HB
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (692,"Korrektor der HB nicht gleich Autor",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_HANDBUCH_ZU_KORRIGIEREN"
	AND param1 not in (SELECT param1 FROM SimData b
	WHERE b.rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN"
	AND b.gid= %game
	AND b.simdat < a.simdat)
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 99,"Korrektur nicht durch Autor HB","a",600,692);

INSERT INTO effects_lang
VALUES (99,"de","Sie haben das Handbuch nicht vom Autor korrigieren lassen.",99);

INSERT INTO effects_lang
VALUES (207,"en","You told someone who is not the author to correct the manual.",99);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (73, 1,99,611);

/*
/* K12. Korrektur nicht durch Autor  Code 
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (104, 1,99,612);
/*
/* D13. AllesKorrektur Spezifikation
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (693,"AllesKorrektur Spezifikation",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_NACH_SPEZREVIEW_ALLES_ZU_KORRIGIEREN" 
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 100,"AllesKorrektur Spezifikation","a",600,693);

INSERT INTO effects_lang
VALUES (100,"de","Sie haben nach dem Spezifikationsreview eine Alleskorrektur durchführen lassen.",100);

INSERT INTO effects_lang
VALUES (208,"en","You did a correction of  all documents after the specification review. ",100);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (74, 5,100,611);

/*
/* K13. AllesKorrektur Spezifikation
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (105, 5,100,612);
/*
/* D13. AllesKorrektur Entwurf
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (694,"AllesKorrektur Entwurf",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN" 
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 101,"AllesKorrektur Entwurf","a",600,694);

INSERT INTO effects_lang
VALUES (101,"de","Sie haben nach dem Entwurfsreview eine Alleskorrektur durchführen lassen.",101);

INSERT INTO effects_lang
VALUES (209,"en","You did a correction of  all documents after the desiogn review.",101);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (75, 5,101,611);

/*
/* K13. AllesKorrektur Entwurf
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (106, 5,101,612);

/*
/* D13. AllesKorrektur Modulentwurf
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (695,"AllesKorrektur Modulentwurf",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_NACH_MODULSPEZREVIEW_ALLES_ZU_KORRIGIEREN" 
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 102,"AllesKorrektur Modulentwurf","a",600,695);

INSERT INTO effects_lang
VALUES (102,"de","Sie haben nach dem Modulentwurfsreview eine Alleskorrektur durchführen lassen.",102);

INSERT INTO effects_lang
VALUES (210,"en","You did a correction of  all documents after the module design review.",102);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (76, 5,102,611);

/*
/* K13. AllesKorrektur Modulentwurf
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (107, 5,102,612);

/*
/* D13. AllesKorrektur Code
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (696,"AllesKorrektur Code",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_NACH_CODEREVIEW_ALLES_ZU_KORRIGIEREN" 
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 103,"AllesKorrektur Code","a",600,696);

INSERT INTO effects_lang
VALUES (103,"de","Sie haben nach dem Codereview eine Alleskorrektur durchführen lassen.",103);

INSERT INTO effects_lang
VALUES (211,"en","You did a correction of  all documents after the code review. ",103);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (77, 5,103,611);

/*
/* K13. AllesKorrektur Code
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (108, 5,103,612);

/*
/* D13. AllesKorrektur Handbuch
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (697,"AllesKorrektur Handbuch",
'select simdat
from SimData a
where 	a.rule="ENTWICKLER_BEGINNT_NACH_HANDBUCHREVIEW_ALLES_ZU_KORRIGIEREN" 
	AND a.gid=%game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 104,"AllesKorrektur Handbuch","a",600,697);

INSERT INTO effects_lang
VALUES (104,"de","Sie haben nach dem Handbuchreview eine Alleskorrektur durchführen lassen.",104);

INSERT INTO effects_lang
VALUES (212,"en","You did a correction of  all documents after the review of the manual.",104);

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (78, 5,104,611);

/*
/* K13. AllesKorrektur Handbuch
/ */

INSERT INTO Apriority (apid, value,eid,aiddid)
VALUES (109, 5,104,612);




/******************************************+
/* D14. Korrektur abgebrochen später Wiederaufnahme Spez 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (698,"Reviewalleskorr abgebrochen",
'select simdat  
from SimData a 
where (rule="KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_ABBRECHEN" or 
rule = "KORREKTUR_VON_SPEZIFIKATION_ABBRECHEN") and 
EXISTS (select simdat 
from SimData b 
where (rule = "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_SPEZREVIEW_FERTIG_SEIN"  or 
rule = "MIT_KORREKTUR_DER_SPEZIFIKATION_FERTIG_SEIN")  and 
gid=%game 
and a.simdat < b.simdat) and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 105,"Reviewkorr abgebrochen","a",600,698);

INSERT INTO effects_lang
VALUES (105,"de","Sie haben die Reviewkorrektur der Spezifikation abgebrochen.",105);

INSERT INTO effects_lang
VALUES (213,"en","You canceled the correction of the specification.",105);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (79, 2,105,611);

/******************************************+
/* K14. Korrektur abgebrochen später Wiederaufnahme Spez 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (110, 2,105,612);


/******************************************+
/* D14. Korrektur abgebrochen später Wiederaufnahme Entwurf 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (699,"Reviewalleskorr abgebrochen Entwurf",
'select simdat  
from SimData a 
where (rule="KORREKTUR_ALLER_DOKUMENTE_NACH_ENTWURFSREVIEW_ABBRECHEN" or 
rule = "KORREKTUR_VON_ENTWURF_ABBRECHEN") and 
EXISTS (select simdat 
from SimData b 
where (rule = "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_ENTWURFSREVIEW_FERTIG_SEIN"  or 
rule = "MIT_KORREKTUR_DES_ENTWURFS_FERTIG_SEIN")  and 
gid=%game 
and a.simdat < b.simdat) and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 106,"Reviewkorr abgebrochen Entwurf","a",600,699);

INSERT INTO effects_lang
VALUES (106,"de","Sie haben die Reviewkorrektur des Entwurfs abgebrochen.",106);

INSERT INTO effects_lang
VALUES (214,"en","You canceled the correction of the design.",106);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (80, 2,106,611);

/******************************************+
/* K14. Korrektur abgebrochen später Wiederaufnahme Entwurf 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (111, 2,106,612);

/******************************************+
/* D14. Korrektur abgebrochen später Wiederaufnahme Modulentwurf 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (700,"Reviewalleskorr abgebrochen Modulentwurf",
'select simdat  
from SimData a 
where (rule="KORREKTUR_ALLER_DOKUMENTE_NACH_MODULSPEZREVIEW_ABBRECHEN" or 
rule = "KORREKTUR_VON_MODULSPEZIFIKATION_ABBRECHEN") and 
EXISTS (select simdat 
from SimData b 
where (rule = "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_MODULSPEZREVIEW_FERTIG_SEIN"  or 
rule = "MIT_KORREKTUR_DER_MODULSPEZ_FERTIG_SEIN")  and 
gid=%game 
and a.simdat < b.simdat) and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 107,"Reviewkorr abgebrochen Modulentwurf","a",600,700);

INSERT INTO effects_lang
VALUES (107,"de","Sie haben die Reviewkorrektur des Modulentwurfs abgebrochen.",107);

INSERT INTO effects_lang
VALUES (215,"en","You canceled the correction of the module design.",107);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (81, 2,107,611);

/******************************************+
/* K14. Korrektur abgebrochen später Wiederaufnahme Modulentwurf 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (112, 2,107,612);

/******************************************+
/* D14. Korrektur abgebrochen später Wiederaufnahme Code 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (701,"Reviewalleskorr abgebrochen Code",
'select simdat  
from SimData a 
where (rule="KORREKTUR_ALLER_DOKUMENTE_NACH_CODEREVIEW_ABBRECHEN" or 
rule = "KORREKTUR_NACH_CODEREVIEW_ABBRECHEN") and 
EXISTS (select simdat 
from SimData b 
where (rule = "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_CODEREVIEW_FERTIG_SEIN"  or 
rule = "MIT_KORREKTUR_NACH_CODEREVIEW_FERTIG_SEIN")  and 
gid=%game 
and a.simdat < b.simdat) and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 108,"Reviewkorr abgebrochen Code","a",600,701);

INSERT INTO effects_lang
VALUES (108,"de","Sie haben die Reviewkorrektur des Codes abgebrochen.",108);

INSERT INTO effects_lang
VALUES (216,"en","You canceled the correction of the code after the review.",108);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (82, 2,108,611);

/******************************************+
/* K14. Korrektur abgebrochen später Wiederaufnahme Code 
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (113, 2,108,612);

/******************************************
/* D14. Korrektur abgebrochen später Wiederaufnahme Handbuch
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (704,"Reviewalleskorr abgebrochen Handbuch",
'select simdat  
from SimData a 
where (rule= "KORREKTUR_ALLER_DOKUMENTE_NACH_HANDBUCHREVIEW_ABBRECHEN" or 
rule = "KORREKTUR_VON_HANDBUCH_ABBRECHEN") and 
EXISTS (select simdat 
from SimData b 
where (rule = "MIT_KORREKTUR_ALLER_DOKUMENTE_NACH_HANDBUCHREVIEW_FERTIG_SEIN" or 
rule = "MIT_KORREKTUR_DES_HANDBUCHS_FERTIG_SEIN")  and 
gid=%game 
and a.simdat < b.simdat) and 
gid = %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 111,"Reviewkorr abgebrochen Handbuch","a",600,704);

INSERT INTO effects_lang
VALUES (111,"de","Sie haben die Reviewkorrektur des Handbuchs abgebrochen.",111);

INSERT INTO effects_lang
VALUES (217,"en","You canceled the correction of the manual.",111);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (114, 2,111,611);

/******************************************+
/* K14. Korrektur abgebrochen später Wiederaufnahme Handbuch
/ */

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (115, 2,111,612);


/******************************************+
/* K17. zu teure Mitarbeiter
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (705,"Mitarbeiter",
'select person   as simdat
FROM s_relation, zarmstype
WHERE zarmstype.zid = s_relation.zid AND 
zarmstype.z_type like"IST_EINGESTELLT" AND 
s_relation.person in ("Richard","Thomas") and
Exists  (select simdat from SimData where
rule = "MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN" and
SimData.gid= %game) and
(s_relation.completion_date = "0000-00-00" or
s_relation.completion_date >  (select min(simdat) from SimData where
rule = "MIT_SPEZIFIZIEREN_DER_MODULE_FERTIG_SEIN" and
SimData.gid= %game)) and
s_relation.gid= %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 112,"zu teure Mitarbeiter","a",600,705);

INSERT INTO effects_lang
VALUES (112,"de","Sie haben zu teure Mitarbeiter beschäftigt. Die Stärken der Mitarbeiter Thomas und Richard liegen in den Anfangsphasen.",112);

INSERT INTO effects_lang
VALUES (218,"en","You hired too expensive employees. The abilities of Richard and Thomas lies in the early pahses.",112);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (117, 9,112,612);


/******************************************+
/* K18. Review mit 3 Gutachtern 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (706,"Mitarbeiter",
'select simdat    
FROM SimData
WHERE 
(rule = "SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
rule = "CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
rule = "ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
rule = "MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT") and
SimData.gid= %game;',
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 113,"Review mit 3 Gutachtern","a",600,705);

INSERT INTO effects_lang
VALUES (113,"de","Sie haben Reviews mit 3 Gutachtern angeordnet. In diesen Reviews werden kaum mehr Fehler gefunden, als wenn sie den Review mit nur 2 Gutachtern machen.",113);

INSERT INTO effects_lang
VALUES (219,"en","You ordered a review with 3 reviewers. In this kind of reviews there were only a few more faults found.",113);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (118, 9,113,612);


/******************************************+
/* S. kein talk-to-customer 
/ */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (718,"talk to customer",
'select simdat    
FROM SimData
WHERE 
rule = "ENTWICKLER_BEGINNT_ZU_ANALYSIEREN"  and
"%aktdat" <= (select min(simdat) from SimData 
	where rule="ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN" and 
SimData.gid= %game) and
SimData.gid= %game;' ,
null);

INSERT INTO effects (eid,name,type,rlid,qid)
VALUES ( 116,"kein talk to customer","a",605,718);

INSERT INTO effects_lang
VALUES (224,"de","Sie haben nicht mit dem Kunden gesprochen.",116);

INSERT INTO effects_lang
VALUES (225,"en","You did not talk to the customer.",116);

INSERT INTO Apriority (apid, value, eid,aiddid)
VALUES (120, 40,116,600);

/*
/* Reduktionsgründe  */

/*
/* RedCause einziger freier Mitarbeiter
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (644,"einzig untätiger  Mitarbeiter",
'select count(distinct person) as simdata
from s_relation,game
where 
	s_relation.person not in ( select distinct s_relation.person
from zarmstype,s_relation
where
      (zarmstype.z_type = "PRODUZIERT" or 
      zarmstype.z_type = "INTEGRIERT" or
      zarmstype.z_type = "KORRIGIERT" or
      zarmstype.z_type = "TESTET_MODULE" or 
      zarmstype.z_type = "TESTET_SYSTEM" or 
      zarmstype.z_type = "NIMMT_AB" or
      zarmstype.z_type = "KORRIGIERT_ALLES" or
      zarmstype.z_type = "SPRICHT_MIT_KUNDE" or
      zarmstype.z_type = "TESTET_INTEGRATION") and
starting_date < "%aktdat" and
(completion_date > "%aktdat" or
completion_date = "0000-00-00" ) and
      zarmstype.zid = s_relation.zid AND
	s_relation.gid = %game)
and s_relation.gid = %game;',
null);

INSERT INTO rule(rlid,zort,basic_op,value_ref_point,text_ref_point)
VALUES (601,"Z",'<',2,null);

INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (1,"einziger untätiger Mitarbeiter",601,644);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (1,"de","Sie haben  jedoch mit %mitarbeiter den einzigen unbeschäftigten Mitarbeiter für die Tätigkeit ausgewählt.",1);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (6,"en","You chose the only idle employee.",1);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (1, 60, 1, 1);



/*
/* RedCause geeignetster Mitarbeiter Erstellung/Korrektur Spez
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (707,"geeignetster Mitarbeiter Review spez",
'select  simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_SPEZREVIEW_ALLES_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_SPEZIFIKATION_ZU_KORRIGIEREN") and
(param1= "%mitarbeiter") and
"%mitarbeiter" IN ("Richard")and
simdat = "%aktdat" and
gid = %game; ',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (5,"geeignetster Mitarbeiter Erstellung Spez",600,707);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (5,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",5);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (8,"en","You chose employee with the best qualification.",5);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (5, 60, 5, 1);

/*
/* RedCause geeignetster Mitarbeiter Erstellung/Korrektur Entwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (708,"geeignetster Mitarbeiter Review Entwurf",
'select  simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN" or
rule = "ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_SYSTEMENTWURF_ZU_KORRIGIEREN") and
(param1= "%mitarbeiter") and
"%mitarbeiter" IN ("Richard", "Christine" )and
simdat = "%aktdat" and
gid = %game; ',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (6,"geeignetster Mitarbeiter Erstellung Entwurf",600,708);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (11,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",6);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (12,"en","You chose employee with the best qualification.",6);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (6, 60, 6, 1);

/*
/* RedCause geeignetster Mitarbeiter Erstellung/Korrektur Modulentwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (709,"geeignetster Mitarbeiter Review v",
'select  simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" or
rule = "ENTWICKLER_BEGINNT_NACH_MODULSPEZREVIEW_ALLES_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_MODULSPEZ_ZU_KORRIGIEREN") and
(param1= "%mitarbeiter") and
"%mitarbeiter" IN ("Christine")and
simdat = "%aktdat" and
gid = %game; ',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (7,"geeignetster Mitarbeiter Erstellung Modulentwurf",600,709);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (13,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",7);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (14,"en","You chose employee with the best qualification.",7);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (7, 60, 7, 1);

/*
/* RedCause geeignetster Mitarbeiter Erstellung/Korrektur Code
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (710,"geeignetster Mitarbeiter Review Code",
'select  simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN" or
rule = "ENTWICKLER_BEGINNT_CODE_NACH_MODULTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_CODE_NACH_INTEGRATIONSTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_CODE_NACH_SYSTEMTEST_ZU_KORRIGIEREN" or
rule = "ENTWICKLER_BEGINNT_CODE_NACH_ABNAHMETEST_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_NACH_CODEREVIEW_ALLES_ZU_KORRIGIEREN" or
 rule = "ENTWICKLER_BEGINNT_CODE_NACH_REVIEW_ZU_KORRIGIEREN") and
(param1= "%mitarbeiter") and
"%mitarbeiter" IN ("Diana")and
simdat = "%aktdat" and
gid = %game; ',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (8,"geeignetster Mitarbeiter Erstellung Code",600,710);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (15,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",8);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (16,"en","You chose employee with the best qualification.",8);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (8, 60, 8, 1);


/*
/* RedCause geeignetster Mitarbeiter Erstellung/Korrektur Handbuch
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (711,"geeignetster Mitarbeiter Review Code",
'select  simdat
from SimData
where (rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" or
rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_KORRIGIEREN"  or
rule = "ENTWICKLER_BEGINNT_NACH_HANDBUCHREVIEW_ALLES_ZU_KORRIGIEREN") and
(param1= "%mitarbeiter") and
"%mitarbeiter" IN ("Bernd")and
simdat = "%aktdat" and
gid = %game; ',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (9,"geeignetster Mitarbeiter Erstellung Code",600,711);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (17,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",9);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (18,"en","You chose employee with the best qualification.",9);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (9, 60, 9, 1);

/*
/* RedCause geeignetster Mitarbeiter Review Spez
/* */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (703,"geeignetster Mitarbeiter Review spez",
'select  simdat
from SimData
where (rule = "SPEZIFIKATIONSREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
rule = "SPEZIFIKATIONSREVIEW_MIT_3_GUTACHTERN_BEGINNT" or
 rule = "SPEZIFIKATIONSREVIEW_MIT_KUNDE_BEGINNT") and
(param1= "%mitarbeiter" or
param2= "%mitarbeiter" or
param3= "%mitarbeiter") and
"%mitarbeiter" IN ("Richard","Bernd","Stefanie")and
simdat = "%aktdat" and
gid = %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (4,"einziger geeignetster Mitarbeiter ",600,703);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (4,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",4);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (9,"en","You chose employee with the best qualification.",4);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (4, 40, 4, 1);

/*
/* RedCause geeignetster Mitarbeiter Review Entwurf
/* */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (712,"geeignetster Mitarbeiter Review spez",
'select  simdat
from SimData
where (rule = "ENTWURFSREVIEW_MIT_2_GUTACHTERN_BEGINNT"  or
rule = "ENTWURFSREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) and
(param1= "%mitarbeiter" or
param2= "%mitarbeiter" or
param3= "%mitarbeiter") and
"%mitarbeiter" IN ("Richard","Christine", "Bernd","Stefanie")and
simdat = "%aktdat" and
gid = %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (10," geeignetster Mitarbeiter entwurf",600,712);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (19,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",10);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (20,"en","You chose employee with the best qualification.",10);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (10, 40, 10, 1);


/*
/* RedCause geeignetster Mitarbeiter Review Modulentwurf
/* */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (713,"geeignetster Mitarbeiter Review Modulentwurf",
'select  simdat
from SimData
where (rule = "MODSPEZREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
rule = "MODSPEZREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) and
(param1= "%mitarbeiter" or
param2= "%mitarbeiter" or
param3= "%mitarbeiter") and
"%mitarbeiter" IN ("Christine","Bernd", "Stefanie") and
simdat = "%aktdat" and
gid = %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (11," geeignetster Mitarbeiter Modulentwurf",600,713);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (21,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",11);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (22,"en","You chose employee with the best qualification.",11);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (11, 40, 11, 1);

/*
/* RedCause geeignetster Mitarbeiter Review Code
/* */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (714,"geeignetster Mitarbeiter Review Code",
'select  simdat
from SimData
where (rule = "CODEREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
rule = "CODEREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) and
(param1= "%mitarbeiter" or
param2= "%mitarbeiter" or
param3= "%mitarbeiter") and
"%mitarbeiter" IN ("Diana", "Bernd", "Stefanie") and
simdat = "%aktdat" and
gid = %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (12," geeignetster Mitarbeiter Code",600,714);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (23,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",12);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (24,"en","You chose employee with the best qualification.",12);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (12, 40, 12, 1);

/*
/* RedCause geeignetster Mitarbeiter Review Handbuch
/* */


INSERT INTO query(qid,attribute,statement,z_path)
VALUES (715,"geeignetster Mitarbeiter Review Handbuch",
'select  simdat
from SimData
where (rule = "HANDBUCHREVIEW_MIT_2_GUTACHTERN_BEGINNT" or
rule = "HANDBUCHREVIEW_MIT_3_GUTACHTERN_BEGINNT" ) and
(param1= "%mitarbeiter" or
param2= "%mitarbeiter" or
param3= "%mitarbeiter") and
"%mitarbeiter" IN ( "Bernd", "Stefanie") and
simdat = "%aktdat" and
gid = %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (13," geeignetster Mitarbeiter Handbuch",600,715);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (25,"de","Sie haben  jedoch mit %mitarbeiter den am besten qualifizierten Mitarbeiter für die Tätigkeit %taet ausgewählt.",13);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (26,"en","You chose employee with the best qualification.",13);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (13, 40, 13, 1);

/*
/* RedCause Aleskorrektur durchgeführt Spez
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (646,"alleskorr",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_NACH_SPEZREVIEW_ALLES_ZU_KORRIGIEREN" AND
	simdat > (select min(simdat) from SimData 
	where (rule="ENTWICKLER_BEGINNT_ZU_ENTWERFEN" or 
	rule="ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN") and
	gid=%game)and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (3,"Alleskorrektur durchgeführt",600,646);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (3,"de","Sie haben jedoch eine Alleskorrektur durchgeführt.",3);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (10,"en","You ordered a correction of all documents.",3);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (3, 80, 3, 11);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (16, 80, 3, 8);

/*
/* RedCause Aleskorrektur durchgeführt Entwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (716,"alleskorr",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_NACH_ENTWURFSREVIEW_ALLES_ZU_KORRIGIEREN" AND
	simdat > (select min(simdat) from SimData 
	where (rule="ENTWICKLER_BEGINNT_MODULE_ZU_SPEZIFIZIEREN" ) and
	gid=%game)and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (14,"Aleskorrektur durchgeführt Entwurf",600,716);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (27,"de","Sie haben jedoch eine Alleskorrektur durchgeführt.",14);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (28,"en","You ordered a correction of all documents.",14);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (14, 80, 14, 21);


/*
/* RedCause Aleskorrektur durchgeführt Modulentwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (717,"alleskorr Modulentwurf",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_NACH_MODULSPEZREVIEW_ALLES_ZU_KORRIGIEREN" AND
	simdat > (select min(simdat) from SimData 
	where (rule="ENTWICKLER_BEGINNT_ZU_CODIEREN"  ) and
	gid=%game)and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (15,"Aleskorrektur durchgeführt Modulentwurf",600,717);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (29,"de","Sie haben jedoch eine Alleskorrektur durchgeführt.",15);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (30,"en","You ordered a correction of all documents.",15);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (15, 80, 15, 61);


/*
/* RedCause bester Mitarbeiter im Team dabei Spez
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (719,"Richard im Team Spez",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_ZU_SPEZIFIZIEREN" AND
	param1="Richard" and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (17,"Richard ist Teammitglied",600,719);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (31,"de","Richard war jedoch im Team dabei.",17);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (32,"en","Richard has been a team member.",17);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (17, 90, 17, 44);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (18, 90, 17, 43);

/*
/* RedCause bester Mitarbeiter im Team dabei Entwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (720,"Christine,Richard im Team Entwurf",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_ZU_ENTWERFEN" AND
	param1 IN ("Christine","Richard") and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (19,"Christine,Richard ist Teammitglied",600,720);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (35,"de","Christine und/oder Richard war(en) jedoch im Team.",19);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (36,"en","Christine and/or Richard have/has been a team member.",19);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (25, 90, 19, 23);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (24, 90, 19, 52);


/*
/* RedCause bester Mitarbeiter im Team dabei Modulentwurf
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (721,"Christine im Team Modulentwurf",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_MODULE_ZU_ENTWERFEN" AND
	param1 IN ("Christine","Richard") and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (20,"Christine,Richard ist Teammitglied",600,721);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (37,"de","Christine und/oder Richard war(en) jedoch im Team.",20);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (38,"en","Christine and/or Richard have/has been a team member.",20);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (26, 90, 20, 59);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (27, 90, 20, 58);



/*
/* RedCause bester Mitarbeiter im Team dabei Code
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (722,"Diana im Team Code",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_ZU_CODIEREN" AND
	param1 IN ("Diana") and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (21,"Diana ist Teammitglied",600,722);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (39,"de","Diana war jedoch im Team.",21);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (40,"en","Diana has been a team member.",21);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (28, 90, 21, 65);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (29, 90, 21, 66);



/*
/* RedCause bester Mitarbeiter im Team dabei HAndbuch
/* */

INSERT INTO query(qid,attribute,statement,z_path)
VALUES (723,"Bernd im Team HB",
'select  simdat
from SimData
where  rule = "ENTWICKLER_BEGINNT_HANDBUCH_ZU_SCHREIBEN" AND
	param1 IN ("Bernd") and 
	gid= %game;',
null);


INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (22,"Bernd ist Teammitglied",600,723);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (41,"de","Bernd war jedoch im Team.",22);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (42,"en","Bernd has been a team member.",22);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (30, 90, 22, 46);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (31, 90, 22, 47);
/*
/* RedCause Alleskorrektur
/* */



INSERT INTO redCause (redid,  name, rlid, qid)
VALUES (18,"Alleskorrektur wichtig",600,7);


INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (33,"de","Die Alleskorrektur ist jedoch unerlässlich um die Konsistenz zwischen den einzelnen Dokumenten zu erhalten",18);

INSERT INTO red_lang (red_lang_id, language, text, redid)
VALUES (34,"en","The correction of all documents is neccessary to obtain the consitenz between the documents.",18);


INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (19, 90, 18, 100);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (20, 90, 18, 101);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (21, 90, 18, 102);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (22, 90, 18, 103);

INSERT INTO redSize (sizeid,redPercent, redid, eid) 
VALUES (23, 90, 18, 104);


