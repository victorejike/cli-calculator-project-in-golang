#!/bin/bash

HIGH_SCORE_FILE="brain_highscore.txt"
touch $HIGH_SCORE_FILE

clear
echo "==============================="
echo "🧠 BRAIN GAME - LEVEL MODE"
echo "==============================="

read -p "Enter your name: " PLAYER

echo
echo "Select Difficulty:"
echo "1) Easy"
echo "2) Medium"
echo "3) Hard"
read -p "Choice: " LEVEL

case $LEVEL in
    1) MAX=10; ROUNDS=5 ;;
    2) MAX=20; ROUNDS=7 ;;
    3) MAX=50; ROUNDS=10 ;;
    *) echo "Invalid level"; exit ;;
esac

SCORE=0

for ((i=1; i<=ROUNDS; i++))
do
    a=$((RANDOM % MAX + 1))
    b=$((RANDOM % MAX + 1))
    op=$((RANDOM % 3))

    if [ $op -eq 0 ]; then
        question="$a + $b"
        correct=$((a + b))
    elif [ $op -eq 1 ]; then
        question="$a - $b"
        correct=$((a - b))
    else
        question="$a * $b"
        correct=$((a * b))
    fi

    echo
    echo "Round $i: $question = ?"
    read answer

    if [ "$answer" -eq "$correct" ] 2>/dev/null; then
        echo "✅ Correct!"
        SCORE=$((SCORE + 1))
    else
        echo "❌ Wrong (Answer: $correct)"
    fi
done

echo
echo "==============================="
echo "Game Over!"
echo "$PLAYER Score: $SCORE / $ROUNDS"
echo "==============================="

echo "$PLAYER | Level $LEVEL | Score $SCORE/$ROUNDS | $(date)" >> $HIGH_SCORE_FILE

echo
echo "🏆 High Scores:"
cat $HIGH_SCORE_FILE
