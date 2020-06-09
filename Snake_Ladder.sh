#!/bin/bash -x

echo "       Welcome To Snake and Ladder Game."
echo "Single Player"

pos=0
echo -e "player at start position: $pos \n"

function ladder(){

	pos=$(($pos+$diceRoll))

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
#	echo "dice rolled: $diceRoll"

	check=$((RANDOM%3))
	case $check in
					0) echo "No play: remain in same place"
					;;
					1)	echo "Ladder : move ahead by $diceRoll"
						ladder $pos $diceRoll
					;;
					2)	echo "Snake  : move behind by $diceRoll"
						snake $pos $diceRoll
					;;
	esac
	echo "Position :$pos"
	if (($pos==100))
	then
		echo "Player has won"
		break
	fi
done
