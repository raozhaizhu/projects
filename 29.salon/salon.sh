#!/bin/bash
PSQL="psql -X --username=postgres --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    if [[ $1 ]]; then
        echo -e "\n$1"
    fi
    echo "Welcome to My Salon, how can I help you?"
    SERVICES=$($PSQL "SELECT name FROM services")
    INDEX=1
    while read -r SERVICE_NAME; do
        echo "$INDEX) $SERVICE_NAME"
        ((INDEX++))
    done <<< "$SERVICES"
    read SERVICE_ID_SELECTED
    if [[ $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]; then
        APPOINTMENT_MENU $SERVICE_ID_SELECTED
    else
        MAIN_MENU "I could not find that service. What would you like today?"
    fi
}
APPOINTMENT_MENU() {
    SELECTED_SERVICE_ID=$1
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SELECTED_SERVICE_ID" | sed 's/ //g')

    # 1 Check the phone number
    echo "What's your phone number?"
    read CUSTOMER_PHONE
    AVAILABLE_CUSTOMER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone= '$CUSTOMER_PHONE'")
    # 1.1 If it doesn't exist, ask for the name of the new customer,then add it to the database
    if [[ -z $AVAILABLE_CUSTOMER_PHONE ]]; then
        echo "I don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        $PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
    # 1.2 If it exists, get the phone number and the name of the customer
    else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi
    # 2 Check the time,then add it to the database
    echo "What time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    $PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ((SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'), $SELECTED_SERVICE_ID, '$SERVICE_TIME')"
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}
MAIN_MENU
