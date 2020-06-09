#!/bin/bash -x

echo "       Welcome To Snake and Ladder Game."
echo "Single Player"

pos=0
echo "player at start position: $pos"


diceRoll=$(( RANDOM%6 +1 ))
echo "dice rolled: $diceRoll"

check=$((RANDOM%3))
case $check in
					0) echo "No play: remain in same place"
					;;
					1)	pos=$(($pos+$diceRoll))
					 	echo "Ladder:move ahead"
					;;
					2)	pos=$(($pos-$diceRoll))
						echo "Snake:move behind"
					;;
esac
echo "Position :$pos"
