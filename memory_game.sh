#!/bin/bash

clear
echo "==============================="
echo "🧠 MEMORY GAME"
echo "==============================="

read -p "Enter your name: " PLAYER
read -p "How many numbers to remember (3–8): " COUNT

NUMBERS=()

for ((i=0; i<COUNT; i++))
do
    NUMBERS+=($((RANDOM % 9)))
done

echo
echo "Memorize these numbers:"
echo "${NUMBERS[@]}"

sleep 5
clear

echo "Now type the numbers in order:"
read -a USER_INPUT

CORRECT=1
for ((i=0; i<COUNT; i++))
do
    if [ "${USER_INPUT[i]}" != "${NUMBERS[i]}" ]; then
        CORRECT=0
        break
    fi
done

echo
if [ $CORRECT -eq 1 ]; then
    echo "🎉 Excellent memory, $PLAYER!"
else
    echo "❌ Wrong sequence."
    echo "Correct was: ${NUMBERS[@]}"
fi
