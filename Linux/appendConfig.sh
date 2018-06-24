#!/bin/sh
userDir=$(cd;pwd)

help(){
    start='\033[0;32m'
    end='\033[0m'
    printf "运行：dash init.sh $start <params> $end"
    printf "  $start%-16s$end%-20s\n" "-h|h|help" "帮助"
    printf "  $start%-16s$end%-20s\n" "sys   z|ba" "常用别名, 公共的"
    printf "  $start%-16s$end%-20s\n" "path  z|ba" "存放环境变量"
    printf "  $start%-16s$end%-20s\n" "repo  z|ba" "存放git仓库别名"
    printf "  $start%-16s$end%-20s\n" "cus  z|ba" "存放脚本工具别名,路径别名,SSH等自定义信息"
}
append(){
    echo 'if [ -f ~/.'$1' ]; then
    . ~/.'$1'
fi'>>$userDir'/.'$2'shrc'
}

path=`pwd`
case $1 in 
    -h | h |help)
        help
    ;;
    sys)
        ln -s $path'/init/system.conf' ~/.system
        append system $2
    ;;
    repo)
        ln -s $path'/init/repos.ini' ~/.repos
        append repos $2
    ;;
    path)
        ln -s $path'/init/path.ini' ~/.path
        append path $2
    ;;
    cus)
        ln -s $path'/init/customized.ini' ~/.customized
        append customized $2
    ;;
    *)
        help
    ;;
esac