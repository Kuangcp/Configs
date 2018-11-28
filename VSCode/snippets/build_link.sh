#!/bin/sh

userDir=`cd && pwd`
vscode=$userDir/.config/Code/User/snippets

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
end='\033[0m'

help(){
    printf "Run：$red sh build_link.sh $green<verb> $yellow<args>$end\n"
    format="  $green%-5s $yellow%-8s$end%-20s\n"
    printf "$format" "-h" "" "help"
    printf "$format" "-a" "" "link all *.json"
    printf "$format" "-f" "file" "link specific file "
}
link_snippets(){
	files=`ls *.json`
	for file in $files; do
		echo 'start link '$file
		ln -s `pwd`/$file $vscode/$file
	done
}

case $1 in 
    -h)
        help ;;
    -a)
		link_snippets
	;;
	-f)
		ln -s `pwd`/$2 $vscode/$2
	;;
	*)
		help ;;
esac

