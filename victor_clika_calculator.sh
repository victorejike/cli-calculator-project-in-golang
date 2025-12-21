#!/bin/bash

HISTORY_FILE="victor_calc_history.txt"
USER_NAME="Victor"

clear

echo "====================================="
echo "        VICTOR CLI"
echo "====================================="
echo "           Welcome $USER_NAME"
echo "====================================="
echo

touch $HISTORY_FILE

while true
do
    echo "Enter first number (or type 'exit' to quit):"
    read first

    if [ "$first" = "exit" ]; then
        echo
        echo "Thank you for using Victor CLIKA Calculator."
        echo "Would you like to join your calculation with Victor again? (yes/no)"
        read answer
        if [ "$answer" = "yes" ]; then
            clear
            continue
        else
            echo "Goodbye from Victor ��"
            break
        fi
    fi

    echo
    echo "Choose operation:"
    echo "1) Addition (+)"
    echo "2) Subtraction (-)"
    echo "3) Multiplication (*)"
    echo "4) Division (/)"
    echo "5) Expression (e.g. 3+5*2)"
    echo
    read -p "Enter option: " option
    echo

    case $option in
        1)
            read -p "Enter second number: " second
            result=$((first + second))
            operation="$first + $second"
            ;;
        2)
            read -p "Enter second number: " second
            result=$((first - second))
            operation="$first - $second"
            ;;
        3)
            read -p "Enter second number: " second
            result=$((first * second))
            operation="$first * $second"
            ;;
        4)
            read -p "Enter second number: " second
            if [ "$second" -eq 0 ]; then
                echo "Error: Division by zero"
                continue
            fi
            result=$(echo "scale=2; $first / $second" | bc)
            operation="$first / $second"
            ;;
        5)
            read -p "Enter full expression: " expr
            result=$(echo "$expr" | bc)
            operation="$expr"
            ;;
        *)
            echo "Invalid option"
            continue
            ;;
    esac

    echo
    echo "Result: $result"
    echo

    echo "$(date) | $operation = $result" >> $HISTORY_FILE

    echo "Do you want to:"
    echo "1) Continue calculation"
    echo "2) View history"
    echo "3) Exit"
    echo
    read -p "Choose: " next

    if [ "$next" = "2" ]; then
        echo
        echo "====== Calculation History ======"
        cat $HISTORY_FILE
        echo "================================="
    elif [ "$next" = "3" ]; then
        echo
        echo "Thank you for calculating with Victor."
        echo "Would you like to join your calculation with Victor again? (yes/no)"
        read again
        if [ "$again" = "yes" ]; then
            clear
            continue
        else
            echo "Victor signing out 👋"
            break
        fi
    fi

    echo
    read -p "Press Enter to continue..."
    clear
    echo "====================================="
    echo "        VICTOR CLIKA CALCULATOR"
    echo "====================================="
    echo "           Welcome $USER_NAME"
    echo "====================================="
    echo
done

