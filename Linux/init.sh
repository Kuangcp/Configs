#!/bin/sh
userDir=$(cd;pwd)

help(){
    start='\033[0;32m'
    end='\033[0m'
    echo "运行：dash init.sh $start <params> $end"
    printf "  $start%-16s$end%-20s\n" "-h|h|help" "帮助"
    printf "  $start%-16s$end%-20s\n" "sys   z|ba" "是常用命令简写 并且追加到bashrc或者zshrc文件中去"
    printf "  $start%-16s$end%-20s\n" "path  z|ba" "是环境变量存放文件"
    printf "  $start%-16s$end%-20s\n" "repo  z|ba" "git仓库别名文件"
    printf "  $start%-16s$end%-20s\n" "cus  z|ba" "自定义的脚本工具"
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
        ln -s $path'/init/repos.conf' ~/.repos
        append repos $2
    ;;
    path)
        ln -s $path'/init/path.conf' ~/.path
        append path $2
    ;;
    cus)
        ln -s $path'/init/customized.conf' ~/.customized
        append customized $2
    ;;
    *)
        help
    ;;
esac