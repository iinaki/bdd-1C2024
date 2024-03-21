create table school_teams (
team text, 
players_used int, 
avg_age int, 
possession int, 
games int,
goals int, 
assists int, 
cards_yellow int, 
cards_red int
);

create table school_matches (
team1 text, 
team2 text, 
goals_team1 int, 
goals_team2 int, 
stage text
);

docker cp ./taller_1_dataset_y_dump/teams.csv bdd_postgres_db:/
docker cp ./taller_1_dataset_y_dump/matches.csv bdd_postgres_db:/

COPY school_teams
FROM '/teams.csv'
DELIMITER ';'
CSV HEADER --para indicar que saltee la primera l´ınea
ENCODING 'LATIN1';

drop table if exists school_teams;
