#!/bin/bash

userDir=`cd && pwd`
# VSCode 代码片段
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
    printf "Run：$red sh assitant.sh $green<verb> $yellow<args>$end\n"
    format="  $green%-5s $yellow%-8s$end%-20s\n"
    printf "$format" "-h" "" "help"
    printf "$format" "-a" "" "link all json code-snippets files" 
    printf "$format" "-f" "file" "link specific file "
}

link_snippets(){
	files=$(ls * | grep -E "\.(json|code-snippets)")
	for file in $files; do
		echo 'start link ' $file ' -> ' $vscode/$file
		if [ ! -f $vscode/$file ]; then
			ln -s `pwd`/$file $vscode/$file
		fi
	done
}

normalize(){
	file=$1

	while IFS= read -r -u3 line; do
		echo '"' "$line" '",'
	done 3< "$file"
}

case $1 in 
    -h)
        help ;;
    -a)
		link_snippets
	;;
	-s)
		normalize $2
	;;
	-f)
		ln -s `pwd`/$2 $vscode/$2
	;;
	*)
		help ;;
esac
