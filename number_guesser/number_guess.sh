#!/bin/bash

# PSQL Configuration
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompts the user for information and compares it with the user database
echo -e "\n~~~ Number Guessing Game ~~~\n"
echo "Please enter your username"
read USERNAME

USER_VERIFY=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")

if [[ -z $USER_VERIFY ]]
then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	echo "Let's get you inserted into our database the next time you play the game."
	$PSQL "INSERT INTO users(name) VALUES('$USERNAME')"
else
	GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_VERIFY;")
	BEST_GAME_GUESSES=$($PSQL "SELECT number_of_guesses FROM games WHERE user_id=$USER_VERIFY ORDER BY number_of_guesses LIMIT 1;")
	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_GUESSES guesses."
fi

# Actual game
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED

NUMBER_OF_GUESSES=0
while [ $NUMBER_GUESSED -ne $RANDOM_NUMBER ]
do
	if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
	then
		echo "That is not an integer, guess again:"
		read NUMBER_GUESSED

	else
		# Checks to see if the number is lower than the random number
		if [[ $NUMBER_GUESSED -ne $RANDOM_NUMBER && $NUMBER_GUESSED -gt $RANDOM_NUMBER ]]
		then
			echo -e "\nIt's lower than that, guess again:"
			NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
			read NUMBER_GUESSED
		fi

		# Checks to see if the number is greater than the random number
		if [[ $NUMBER_GUESSED -ne $RANDOM_NUMBER && $NUMBER_GUESSED -lt $RANDOM_NUMBER ]]
		then
			echo -e "\n It's higher than that, guess again:"
			NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
			read NUMBER_GUESSED
		fi

		# When the number guessed is equal to the random number
		if [[ $NUMBER_GUESSED -eq $RANDOM_NUBMER ]]
		then
			$NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
			echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
		fi
	fi
done

# Inserts the values into the 'games' table of the database

# Gets the number of games played - Defaults to 0
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME';")

# When the game is finished, just adds 1 to that value
GAMES_PLAYED=$((GAMES_PLAYED+1))

# Inserts that value into the users table 
$PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE name='$USERNAME';"

# Inserts the number of guesses into the games table, effectively inserting it as a game entry
$PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_VERIFY, $NUMBER_OF_GUESSES)"
