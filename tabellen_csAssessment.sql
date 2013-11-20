
create table relRules(relid int not null auto_increment,
name varchar(150),
param1 varchar(50),
param2 varchar(50),
param3 varchar(50),
param4 varchar(50),
mid int,
primary key (relid),
foreign key (mid) references model (mid) on delete cascade);

create table SimData (simid int not null auto_increment,
simdat date,
rule varchar(150) not null,
param1 varchar(50) ,
param2 varchar(50) ,
param3 varchar(50) ,
param4 varchar(50) ,
gid int,
primary key (simid),
foreign key (gid) references game (gid) on delete cascade);

create index SimDate_gid on SimData(gid);

create table effects (eid int not null auto_increment,
name varchar(50) not null,
type char not null,
rlid int,
qid int,
primary key (eid),
foreign key (rlid) references rule (rlid) on delete cascade,
foreign key (qid) references query (qid) on delete cascade);

create table effects_lang(
	eff_lang_id int not null auto_increment,
        language varchar(2),            
	text text,
	eid int not null,
 	foreign key (eid) references effects (eid) on delete cascade,
	primary key (eff_lang_id )
); 

create table evalrules (evalid int not null auto_increment,
name varchar(150) not null,
param1 varchar(50) ,
param2 varchar(50) ,
param3 varchar(50) ,
param4 varchar(50) ,
primary key (evalid));


create table Apriority (apid int not null auto_increment,
value int not null,
eid int,
aiddid int,
primary key (apid),
foreign key (eid) references effects (eid) on delete cascade,
foreign key (aiddid) references aid_description (aiddid) on delete cascade);


create table Rpriority (rpid int not null auto_increment,
value int not null,
evalid int,
eid int,
aiddid int,
primary key (rpid),
foreign key (evalid) references evalrules (evalid) on delete cascade,
foreign key (eid) references effects (eid) on delete cascade,
foreign key (aiddid ) references aid_description(aiddid) on delete cascade);


create table redCause (redid int not null auto_increment,
name varchar(50) not null,
rlid int,
qid int,
primary key (redid),
foreign key (rlid) references rule (rlid) on delete cascade,
foreign key (qid) references query (qid) on delete cascade);

create table red_lang(
	red_lang_id int not null auto_increment,
        language varchar(2), 
	text text,           
	redid int not null,
 	foreign key (redid) references redCause (redid) on delete cascade,
	primary key (red_lang_id)
); 

create table redSize (sizeid int not null auto_increment,
redPercent int not null,
redid int,
eid int,
primary key (sizeid),
foreign key (eid) references effects (eid) on delete cascade,
foreign key (redid) references redCause (redid) on delete cascade);

