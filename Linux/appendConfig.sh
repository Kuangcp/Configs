#!/bin/sh
userDir=$(cd;pwd)
path=$(cd `dirname $0`; pwd)
path=$path/init

help(){
    start='\033[0;32m'
    end='\033[0m'
    printf "运行：dash init.sh $start <params> $end"
    printf "  $start%-16s$end%-20s\n" "-h|h|help" "帮助"
    printf "  $start%-16s$end%-20s\n" "sys   z|ba" "常用别名, 公共的"
    printf "  $start%-16s$end%-20s\n" "path  z|ba" "存放环境变量"
    printf "  $start%-16s$end%-20s\n" "repo  z|ba" "存放git仓库别名"
    printf "  $start%-16s$end%-20s\n" "cus   z|ba" "存放脚本工具别名,路径别名,SSH等自定义信息"
}
append(){
    echo 'if [ -f ~/.'${1}.ini' ]; then
    . ~/.'${1}.ini'
fi'>>$userDir'/.'$2'shrc'
}

case $1 in 
    -h | h |help)
        help
    ;;
    sys)
        ln -s $path'/system.conf' ~/.system.ini
        append system $2
    ;;
    repo)
        cp ${path}/repos.conf ${path}/repos.ini
        ln -s $path'/repos.ini' ~/.repos.ini
        append repos $2
    ;;
    path)
        cp ${path}/path.conf ${path}/path.ini
        ln -s $path'/path.ini' ~/.path.ini
        append path $2
    ;;
    cus)
        cp ${path}/customized.conf ${path}/customized.ini
        ln -s $path'/customized.ini' ~/.customized.ini
        append customized $2
    ;;
    *)
        help
    ;;
esac