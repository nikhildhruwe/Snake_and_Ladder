#!/bin/bash -x

echo "       Welcome To Snake and Ladder Game."
echo "Single Player"
pos=0

echo "player at start position: $pos"

diceRoll=$(( RANDOM%6 +1 ))

echo "dice rolled: $diceRoll"
