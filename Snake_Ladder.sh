#!/bin/bash -x

echo "       Welcome To Snake and Ladder Game."
echo "Single Player"

pos=0
dicePlayed=0
echo -e "player at start position: $pos \n"

function ladder(){
	pos=$(($pos+$diceRoll))
	if (($pos>100))
	then
		echo "player got above 100,remain in same place"
		pos=$(($pos-$diceRoll))
	fi
}

function snake(){
	pos=$(($pos-$diceRoll))
	if (( $pos<0 ))
	then
		echo "restarting from postion: 0"
		pos=0
	fi
}

while ((1))
do
	diceRoll=$(( RANDOM%6 +1 ))
	echo "dice rolled: $diceRoll"
	((dicePlayed++))
	check=$((RANDOM%3))
	case $check in
					0) echo "	No play: remain in same place"
					;;
					1)	if (( $(($pos+$diceRoll))<=100))
						then
							echo "	Ladder : move ahead by $diceRoll"
						fi
						ladder $pos $diceRoll
					;;
					2)	echo "	Snake  : move behind by $diceRoll"
						snake $pos $diceRoll
					;;
	esac
	echo "	Players Position :$pos"
	if (($pos==100))
	then
		echo "Player has WON by reaching position $pos"
		break
	fi
done

echo -e "\n Number of times Dice Played: $dicePlayed"
