#!/bin/bash -x

echo -e "        Welcome To Snake and Ladder Game.\n"
echo "Two Players"

position1=0
position2=0
dicePlayed2=0
dicePlayed1=0
echo -e "Player1 and Player2  at starting position 0\n"

function ladder(){
   position=$(($position+$diceRoll))
   if (($position>100))
   then
      echo "player got above 100,remain in same place"
      position=$(($position-$diceRoll))
   fi
   echo "   Position:$position"
}

function snake(){
   position=$(($position-$diceRoll))
   if (( $position<0 ))
   then
      echo "   restarting from postion: 0"
      position=0
   fi
   echo "   Position:$position"
}

function diceRoll(){
   diceRoll=$(( RANDOM%6 +1 ))
   echo $diceRoll
}

function game(){
         diceRoll=$1
         position=$2
  check=$((RANDOM%3))
   case $check in
               0) echo "   option, No play: remain in same place"
                  echo "   Position:$position"
               ;;
               1) if (( $(($position+$diceRoll))<100))
                  then
                     echo "   option, Ladder : move ahead by $diceRoll and play again"
                  fi
                  ladder $position $diceRoll
						if (($position!=100))
                  then
                     diceRoll=$((RANDOM%6+1))
              			((dicePlayed++))
					      echo "   Dice rolled :$diceRoll"
                     game $diceRoll $position
                  else
                     echo "   Reached position $position"
                  fi

               ;;
               2) echo "   option, Snake  : move behind by $diceRoll"
                  snake $position $diceRoll
               ;;
   esac
 return $position
}

function winCheck(){
	position=$1
	if (( $position==100 ))
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
   game $diceRoll1 $position1
   position1=$?
	dicePlayed1=$(($dicePlayed1+$dicePlayed))
	check=$(winCheck $position1)
	if (($check==1))
	then
		break;
	fi
	dicePlayed=0
   diceRoll2=$( diceRoll )
   ((dicePlayed2++))
   echo -e "\nPlayer 2 , dice rolled:$diceRoll2"
   game $diceRoll2 $position2
   position2=$?
	dicePlayed2=$(($dicePlayed2+$dicePlayed))
	check=$(winCheck $position2)
   if (($check==1))
   then
      break;
   fi
done
echo -e "\nNumber of times Player 1 played: $dicePlayed1"
echo -e "Number of times Player 2 played: $dicePlayed2\n"

if (($position1==100))
then
   echo -e "\nPlayer 1 has Won the game"
else
   echo -e "\nPlayer 2 has Won the game"
fi
