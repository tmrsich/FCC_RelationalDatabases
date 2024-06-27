#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ Salon ~~~\n"

$PSQL "TRUNCATE appointments, customers"
AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id;")

MAIN_MENU() {
	if [[ $1 ]]
	then
		echo -e "\n$1"
	fi

	echo "How may I help you? Please choose an option from the following list."

	echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE
	do
		echo "$SERVICE_ID) $SERVICE"
	done
		echo "4) Exit"

	# echo -e "\n1) Standard\n2) Premium\n3) Deluxe\n4) Exit"
	read SERVICE_ID_SELECTED

	case $SERVICE_ID_SELECTED in
		1) CONFIRM_APPOINTMENT ;;
		2) CONFIRM_APPOINTMENT ;;
		3) CONFIRM_APPOINTMENT ;;
		4) EXIT ;;
		*) MAIN_MENU "I'm sorry, please enter a valid option." ;;
	esac
}

CONFIRM_APPOINTMENT() {	
	echo -e "\nWhat is your phone number?"
	read CUSTOMER_PHONE

	# check to see if the phone number exists in the customers table - If it doesn't, it asks for the customers name, reads it into a variable, and inserts it into the customers table in the salon database
	if [[ $($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'") == "" ]]
	then
		echo -e "\nIt seems as if you are a new customer. Let me get you implemented into the system!"

		echo -e "\nWhat is your name?"
		read CUSTOMER_NAME

		sleep 2

		$PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"

		echo -e "\nAlright! you are in the system now, so we will have no problem looking you up if you me in to schedule another appointment"

	fi

	echo -e "\nWhat time would you like your appointment to be?"
	read SERVICE_TIME

	# Gets the customer_id to be inserted into the appointments table
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

	# Inserts the appointment into the appointments table
	$PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES('$SERVICE_ID_SELECTED', '$CUSTOMER_ID', '$SERVICE_TIME')"

	# Output message - COMPLETE 

	# Get the name of the service from the service_id - Use PSQL command
	SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;");
	
	# Final message
	echo -e "\nI have you put down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME"

	# Send to main menu again
	MAIN_MENU
}

EXIT() {
	echo -e "\nThank you for stopping in, hope to see you again soon!\n"
}

MAIN_MENU
