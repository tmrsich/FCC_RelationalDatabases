#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Drops the database if it exists and creates one called "worldcup"
$PSQL "DROP DATABASE IF EXISTS worldcup;"

# Drops the tables to reset the ids and creates new ones
$PSQL "DROP TABLE IF EXISTS games, teams;"
$PSQL "CREATE TABLE teams();"
$PSQL "CREATE TABLE games();"

# Creation of columns in the teams table
$PSQL "ALTER TABLE teams
	ADD COLUMN team_id SERIAL PRIMARY KEY NOT NULL,
	ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL;"

# Creation of columns in the games table
$PSQL "ALTER TABLE games
	ADD COLUMN game_id SERIAL PRIMARY KEY NOT NULL,
	ADD COLUMN year INT NOT NULL,
	ADD COLUMN round VARCHAR(30) NOT NULL,
	ADD COLUMN winner_id INT NOT NULL,
	ADD COLUMN opponent_id INT NOT NULL,
	ADD COLUMN winner_goals INT NOT NULL,
	ADD COLUMN opponent_goals INT NOT NULL;"

# Foreign key creation (winner_id and opponent_id reference the team_id in the teams table)
$PSQL "ALTER TABLE games
	ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id),
	ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id);"

# Data insertion into the teams table
$PSQL "INSERT INTO TEAMS (name) VALUES 
('Algeria'), 
('Argentina'), 
('Brazil'), 
('Belgium'),
('Chile'), 
('Colombia'), 
('Costa Rica'),
('Croatia'), 
('Denmark'), 
('England'), 
('France'), 
('Germany'), 
('Greece'), 
('Japan'), 
('Mexico'), 
('Netherlands'), 
('Nigeria'), 
('Portugal'), 
('Russia'), 
('Spain'), 
('Sweden'), 
('Switzerland'), 
('United States'), 
('Uruguay');"

# Data insertion into the games table through the importing of data through a CSV file

# CSV file path
CSV="games.csv"

# Reads the CSV file through cat, piping it into a while loop with the delimiter as a comma and to insert each row into the database on the games table
cat $CSV | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
	# Skips the header line by checking if the "year" is equal to "year" -> Identifying if the line is the header
	if [ "$year" != "year" ];
	then
		winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
		opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
		$PSQL "INSERT INTO
			games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
		       VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals');"
	fi
done

echo -e "\n~~Data import complete.~~\n"
