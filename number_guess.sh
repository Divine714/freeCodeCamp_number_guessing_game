#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  # Initalize and take username
  echo "Enter your username:"
  read NAME_INPUT
  # assign username
  USERNAME=$($PSQL "SELECT name FROM usernames WHERE name = '$NAME_INPUT'")
  # Check if username is in database
  if [[ -z $USERNAME ]]
  then
  # Insert if not in database
    INSERT_USERNAME=$($PSQL "INSERT INTO usernames(name) VALUES('$NAME_INPUT')")
    echo -e "\nWelcome, $NAME_INPUT! It looks like this is your first time here.\n"
    USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE name = '$NAME_INPUT'")
  #initiate game
    echo Guess the secret number between 1 and 1000:
    GENERATE_NUMBER=$(( RANDOM % 1000 + 1))
    GUESS_NUMBER=0

    PLAY_GAME
  else
  # If already in database
    USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE name = '$NAME_INPUT'")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(username_id) FROM games WHERE username_id = $USERNAME_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guess_number) FROM games WHERE username_id = $USERNAME_ID")
    echo  Welcome back, $USERNAME\! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  #initiate game
    echo Guess the secret number between 1 and 1000:
    GENERATE_NUMBER=$(( RANDOM % 1000 + 1))
    GUESS_NUMBER=0

    PLAY_GAME
  fi
}

PLAY_GAME() {
  # guess loop
  
  read NUMBER_INPUT

  # if correct guess
  if [[ $NUMBER_INPUT == $GENERATE_NUMBER ]]
  then
    ((GUESS_NUMBER++))
    echo You guessed it in $GUESS_NUMBER tries. The secret number was $GENERATE_NUMBER. Nice job!
    INSERT_GAME_DATA=$($PSQL "INSERT INTO games(username_id, guess_number) VALUES($USERNAME_ID, $GUESS_NUMBER)")
  fi
  # check for integer
  if [[ ! $NUMBER_INPUT =~ ^[0-9]+$ ]]
    then
      # request valid guess
      echo -e "\nThat is not an integer, guess again:"
      PLAY_GAME
    else
      # if lower
      if [[ $NUMBER_INPUT < $GENERATE_NUMBER ]]
      then
        ((GUESS_NUMBER++))
        echo "It's higher than that, guess again:"
        PLAY_GAME
      fi
      # if higher
      if [[ $NUMBER_INPUT > $GENERATE_NUMBER ]]
      then
        ((GUESS_NUMBER++))
        echo "It's lower than that, guess again:"
        PLAY_GAME
      fi
  fi
}

MAIN
