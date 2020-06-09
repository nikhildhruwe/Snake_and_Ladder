#!/bin/bash -x

echo -e "        Welcome To Snake and Ladder Game.\n"
echo "Two Players"

pos1=0
pos2=0
dicePlayed2=0
dicePlayed1=0
echo -e "player at start position: $pos \n"

function ladder(){
   pos=$(($pos+$diceRoll))
   if (($pos>100))
   then
      echo "player got above 100,remain in same place"
      pos=$(($pos-$diceRoll))
   fi
   echo "   Postion:$pos"
}

function snake(){
   pos=$(($pos-$diceRoll))
   if (( $pos<0 ))
   then
      echo "   restarting from postion: 0"
      pos=0
   fi
   echo "   Postion:$pos"
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
               0) echo "   No play: remain in same place"
                  echo "   Position: $pos"
               ;;
               1) if (( $(($pos+$diceRoll))<=100))
                  then
                     echo "   Ladder : move ahead by $diceRoll and play again"
                  fi
                  ladder $pos $diceRoll
                  game $diceRoll $pos
               ;;
               2) echo "   Snake  : move behind by $diceRoll"
                  snake $pos $diceRoll
               ;;
   esac
 return $pos
}

###***** Main Method*****
while ((1))
do
   diceRoll1=$( diceRoll )
   #((dicePlayed1++))
   echo "Player 1 , dice rolled:$diceRoll1"
   game $diceRoll1 $pos1
   pos1=$?

   diceRoll2=$( diceRoll )
   #((dicePlayed2++))
   echo "Player 2 , dice rolled:$diceRoll2"
   game $diceRoll2 $pos2
   pos2=$?

if (( $pos1==100 || $pos2==100 ))
then
        break
fi
done
#echo -e "\nNumber of times Player 1 played: $dicePlayed1"
#echo -e "Number of times Player 2 played: $dicePlayed2\n"

if (($pos1==100))
then
   echo "Player 1 has Won the game"
else
   echo "Player 2 has Won the game"
fi



