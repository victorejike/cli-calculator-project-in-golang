#!/bin/bash

clear
PLAYER="Victor"
SCORE=0
ROUNDS=5

echo "================================="
echo "     🧠 BRAIN GAME WITH BASH"
echo "================================="
echo "Welcome $PLAYER!"
echo "Answer the questions correctly."
echo

for ((i=1; i<=ROUNDS; i++))
do
    a=$((RANDOM % 10 + 1))
    b=$((RANDOM % 10 + 1))
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

    echo "Round $i: What is $question ?"
    read answer

    if [ "$answer" -eq "$correct" ] 2>/dev/null; then
        echo "✅ Correct!"
        SCORE=$((SCORE + 1))
    else
        echo "❌ Wrong. Correct answer is $correct"
    fi

    echo
done

echo "==============================="
echo "Game Over!"
echo "Final Score: $SCORE / $ROUNDS"
echo "==============================="

if [ $SCORE -ge 4 ]; then
    echo "Excellent brain power 🧠🔥"
elif [ $SCORE -ge 2 ]; then
    echo "Good job, keep practicing!"
else
    echo "Practice more to sharpen your brain!"
fi
