select * from teams where team = 'ARGENTINA';

drop table if exists school_teams;
drop table if exists school_matches;

create table school_teams (
team text not null constraint pk_teams primary key, 
players_used int not null, 
avg_age float not null, 
possession float not null, 
games int not null,
goals int not null, 
assists int not null, 
cards_yellow int not null, 
cards_red int not null
);

create table school_matches (
team1 text not null references school_teams(team) on update cascade on delete cascade, 
team2 text not null references school_teams(team) on update cascade on delete cascade, 
goals_team1 int not null, 
goals_team2 int not null, 
stage text not null,
constraint pk_matches primary key (team1, team2, stage)
);

COPY school_teams
FROM '/teams.csv'
DELIMITER ';'
CSV HEADER --para indicar que saltee la primera l´ınea
ENCODING 'LATIN1';

COPY school_matches
FROM '/matches.csv'
DELIMITER ';'
CSV HEADER --para indicar que saltee la primera l´ınea
ENCODING 'LATIN1';

update school_teams
set team = 'ARG'
where team = 'ARGENTINA';

select * from school_matches where team1 = 'ARG' or team2 = 'ARG';