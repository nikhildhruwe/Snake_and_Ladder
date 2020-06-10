#!/bin/bash -x

echo -e "        Welcome To Snake and Ladder Game.\n"
echo "Two Players"

pos1=0
pos2=0
dicePlayed2=0
dicePlayed1=0
echo -e "Player1 and Player2  at starting position 0\n"

function ladder(){
   pos=$(($pos+$diceRoll))
   if (($pos>100))
   then
      echo "player got above 100,remain in same place"
      pos=$(($pos-$diceRoll))
   fi
   echo "   Position:$pos"
}

function snake(){
   pos=$(($pos-$diceRoll))
   if (( $pos<0 ))
   then
      echo "   restarting from postion: 0"
      pos=0
   fi
   echo "   Position:$pos"
}

function diceRoll(){
   diceRoll=$(( RANDOM%6 +1 ))
   echo $diceRoll
}

function game(){
         diceRoll=$1
         pos=$2
  check=$((RANDOM%3))
   case $check in
               0) echo "   option, No play: remain in same place"
                  echo "   Position:$pos"
               ;;
               1) if (( $(($pos+$diceRoll))<100))
                  then
                     echo "   option, Ladder : move ahead by $diceRoll and play again"
                  fi
                  ladder $pos $diceRoll
						if (($pos!=100))
                  then
                     diceRoll=$((RANDOM%6+1))
              			((dicePlayed++))
					      echo "   Dice rolled :$diceRoll"
                     game $diceRoll $pos
                  else
                     echo "   Reached position $pos"
                  fi

               ;;
               2) echo "   option, Snake  : move behind by $diceRoll"
                  snake $pos $diceRoll
               ;;
   esac
 return $pos
}

function winCheck(){
	pos=$1
	if (( $pos==100 ))
	then
       echo 1
	else
       echo 0
	fi
}

###***** Main Method*****
while ((1))
do
	dicePlayed=0
   diceRoll1=$( diceRoll )
   ((dicePlayed1++))
   echo -e "\nPlayer 1 , dice rolled:$diceRoll1"
   game $diceRoll1 $pos1
   pos1=$?
	dicePlayed1=$(($dicePlayed1+$dicePlayed))
	check=$(winCheck $pos1)
	if (($check==1))
	then
		break;
	fi
	dicePlayed=0
   diceRoll2=$( diceRoll )
   ((dicePlayed2++))
   echo -e "\nPlayer 2 , dice rolled:$diceRoll2"
   game $diceRoll2 $pos2
   pos2=$?
	dicePlayed2=$(($dicePlayed2+$dicePlayed))
	check=$(winCheck $pos2)
   if (($check==1))
   then
      break;
   fi
done
echo -e "\nNumber of times Player 1 played: $dicePlayed1"
echo -e "Number of times Player 2 played: $dicePlayed2\n"

if (($pos1==100))
then
   echo -e "\nPlayer 1 has Won the game"
else
   echo -e "\nPlayer 2 has Won the game"
fi
