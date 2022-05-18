#!/usr/bin/env bash

#Compile kotlin & also run kotlin without the need to remember the commands

Compile(){

		if [[ "$1" == "-c" || "$1" == "-C" || "$1" == "-compile" ]] && [ -n "$2" ]; then

				string=$2
				StringtotalN=${#string}

				StrN=$(($StringtotalN - 3))

				StringV=${string:0:$StrN}

				kotlinc $string -include-runtime -d $StringV.jar

		else
			   echo "value should contain name of the file"
		fi
}


Run(){

		if [[ "$1" == "-r" || "$1" == "-R" || "$1" == "-run" ]] && [ -n "$2" ]; then

				java -jar $2
		fi

}


case $1 in

		-r|-R|-run|-Run)
				Run $1 $2
				;;


        -h|-H|-help|-Help|HELP)
		Help
		;;

		-c|-C|-compile)
		Compile $1 $2
		;;

*)

esac
