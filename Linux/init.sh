#!/bin/sh
# path=$(cd `dirname $0`; pwd)

help(){
    start='\033[0;32m'
    end='\033[0m'
    echo "运行：dash init.sh $start <params> $end"
    printf "  $start%-16s$end%-20s\n" "-h|h|help" "帮助"
    printf "  $start%-16s$end%-20s\n" "app  z|ba" "是常用命令以及脚本的短别名 并且追加到bashrc或者zshrc文件中去"
    printf "  $start%-16s$end%-20s\n" "path z|ba" "是环境变量存放文件"
    printf "  $start%-16s$end%-20s\n" "git  z|ba" "git仓库别名文件"
}
append(){
    echo 'if [ -f ~/.'$1' ]; then
    . ~/.'$1'
fi'>>'/home/kcp/.'$2'shrc'
}

path=`pwd`
case $1 in 
    -h | h |help)
        help
    ;;
    app)
        ln -s $path'/init/app_short.conf' ~/.app_short
        append app_short $2
    ;;
    git)
        ln -s $path'/init/git_repo.conf' ~/.git_repo
        append git_repo $2
    ;;
    path)
        ln -s $path'/init/path.conf' ~/.path
        append path $2
    ;;
    *)
        help
    ;;
esac