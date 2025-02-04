#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -A"

QUERY() {
    if [[ $1 ]]; then
        # 如果$1是数字,则直接用他来设置ATOMIC_NUMBER变量
        if [[ $1 =~ ^[0-9]+$ ]]; then
            ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE atomic_number='$1'")
        # 如果是1位或者2位的英语简写,就用symbol来查询ATOMIC_NUMBER
        elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]; then
            ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE symbol='$1'")
        # 否则,就用name来查询ATOMIC_NUMBER
        else
            ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE name='$1'")
        fi
        # 如果ATOMIC_NUMBER没有设置,则说明输入的元素不存在
        if [[ -z $ATOMIC_NUMBER ]]; then
            echo "I could not find that element in the database."
            # 如果ATOMIC_NUMBER设置了,则查询元素的详细信息并输出
        else
            NAME=$($PSQL -c "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            SYMBOL=$($PSQL -c "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
            TYPE=$($PSQL -c "SELECT type FROM properties JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number=$ATOMIC_NUMBER")
            ATOMIC_MASS=$($PSQL -c "SELECT atomic_mass FROM properties JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number=$ATOMIC_NUMBER")
            MELTING_POINT_CELSIUS=$($PSQL -c "SELECT melting_point_celsius FROM properties JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number=$ATOMIC_NUMBER")
            BOILING_POINT_CELSIUS=$($PSQL -c "SELECT boiling_point_celsius FROM properties JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number=$ATOMIC_NUMBER")
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        fi
    else
        echo "Please provide an element as an argument."
    fi
}

QUERY $1

#fix:
#feat:
#refactor:
#chore:
#test:
