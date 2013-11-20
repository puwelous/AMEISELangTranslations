/***********************************
*
* Komponentensteuerung fuer den client
* siehe Dokument: Analyse_KomponentenSTeuerung.doc
* Einfügen der Komponentensteuerung laut Default-Beschreibung
* Fuer alle tournament (1...4)
************************************/

/* kind of aid Tabellenergänzung */
INSERT INTO kind_of_aid(kaidid,description)VALUES (6,"componentscontroller");


/********************
Hilfsmittelkomponente
fuer QA-200 Modell
*********************/


/*** Analyse ***/

/****** Eintrag in aid_description *****/
INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5500,"hc analysis ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5501,"hc analysis es",'P',6,1); 

/**** KOMPONENTEN KONTROLLE FUER TUNIER****/

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5501);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5501);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5501);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5501);


INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5500);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5500);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5500);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5500);


/*** Advisor ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5502,"hc advisor ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5503,"hc advisor es",'P',6,1); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5502);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5502);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5502);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5502);


/*
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5503);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5503);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5503);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5503);
*/


/*** Friendlypeer ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5504,"hc friendlypeer ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5505,"hc friendlypeer es",'P',6,1); 

/*INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5504);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5505);*/

/* nie aktiviert */

/********************
Motivation component 
*********************/


/*** Rollback ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5506,"mc rollback ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5507,"mc rollback es",'P',6,1); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5506);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5507);


/* nie aktiviert */


/*** Comparison ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5508,"mc comparison ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5509,"mc comparison es",'P',6,1); 

/* nie aktiviert */



/*******************
UserInterface
********************/


/*** Ameisewall ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5510,"ui ameisewall ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5511,"ui ameisewall es",'P',6,1); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5510);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5511);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5510);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5511);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5510);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5511);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5510);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5511);


/*** Phaseview ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5512,"ui phaseview ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5513,"ui phaseview es",'P',6,1); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5512);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5513);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5512);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5513);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5512);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5513);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5512);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5513);


/*** Treeview ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5514,"ui treeview ds",'P',6,1); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5515,"ui treeview es",'P',6,1); 

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5514);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5515);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5514);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5515);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5514);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5515);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5514);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5515);

/*** Guienabled***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5516,"ui guienabled",'P',6,1); /* betrifft proceed und sende-Befehl in client*/

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5516);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5516);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5516);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5516);


/********************
Hilfsmittelkomponente
fuer QA-60 Modell
*********************/

/****** Eintrag in aid_description *****/

/*** Analyse ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5517,"hc analysis ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5518,"hc analysis es",'P',6,2); 

/*
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5518);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5518);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5518);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5518);

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5517);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5517);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5517);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5517);
*/

/*** Advisor ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5519,"hc advisor ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5520,"hc advisor es",'P',6,2); 

/*
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5519);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5519);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5519);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5519);
*/



/*** Friendlypeer ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5521,"hc friendlypeer ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5522,"hc friendlypeer es",'P',6,2); 


/* nie aktiviert */


/********************
Motivation component 
*********************/


/*** Rollback ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5523,"mc rollback ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5524,"mc rollback es",'P',6,2); 

/* nie aktiviert */

/*** Comparison ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5525,"mc comparison ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5526,"mc comparison es",'P',6,2); 

/* nie aktiviert */



/*******************
UserInterface
********************/


/*** Ameisewall ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5527,"ui ameisewall ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5528,"ui ameisewall es",'P',6,2); 


INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5527);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5528);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5527);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5528);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5527);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5528);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5527);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5528);


/*** Phaseview ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5529,"ui phaseview ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5530,"ui phaseview es",'P',6,2); 


INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5529);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5530);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5529);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5530);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5529);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5530);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5529);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5530);


/*** Treeview ***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5531,"ui treeview ds",'P',6,2); 

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5532,"ui treeview es",'P',6,2); 


INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5531);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5532);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5531);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5532);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5531);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5532);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5531);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5532);

/*** Guienabled***/

INSERT INTO aid_description(aiddid,description,type,kaidid,mid)
VALUES (5533,"ui guienabled",'P',6,2); /* betrifft proceed und sende-Befehl in client*/

INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (1,5533);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (2,5533);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (3,5533);
INSERT INTO t_allows_aiddesc (tid,aiddid) VALUES (4,5533);
