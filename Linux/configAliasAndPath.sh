#!/bin/sh
userDir=$(cd;pwd)
path=$(cd `dirname $0`; pwd)
path=$path/init

# *.conf copy to *.ini and set link file to ~/*.sh
help(){
    start='\033[0;32m'
    end='\033[0m'
    printf "运行：dash init.sh $start <params> $end"
    printf "  $start%-16s$end%-20s\n" "-h|h|help" "帮助"
    printf "  $start%-16s$end%-20s\n" "-zsh" "安装 oh-my-zsh"
    printf "  $start%-16s$end%-20s\n" "-base" "安装 常用工具"

    printf "  $start%-16s$end%-20s\n" "sys   z|ba" "2 常用别名, 公共"
    printf "  $start%-16s$end%-20s\n" "path  z|ba" "1 存放环境变量  "
    printf "  $start%-16s$end%-20s\n" "repo  z|ba" "4 存放git仓库别名"
    printf "  $start%-16s$end%-20s\n" "cus   z|ba" "3 存放脚本工具别名,路径别名,SSH等自定义信息"
}
append(){
    echo 'if [ -f ~/.'${1}.sh' ]; then
    . ~/.'${1}.sh'
fi'>>$userDir'/.'$2'shrc'
}

case $1 in 
    -h | h |help)
        help
    ;;
    sys)
        ln -s $path'/system.conf' ~/.system.sh
        append system $2
    ;;
    repo)
        if [ ! -f ${path}/repos.ini ];then
            cp ${path}/repos.conf ${path}/repos.ini
        fi
        ln -s $path'/repos.ini' ~/.repos.sh
        append repos $2
    ;;
    path)
        if [ ! -f ${path}/path.ini ];then
            cp ${path}/path.conf ${path}/path.ini
        fi
        
        ln -s $path'/path.ini' ~/.path.sh
        append path $2
    ;;
    cus)
        if [ ! -f ${path}/customized.ini ];then
            cp ${path}/customized.conf ${path}/customized.ini
        fi
        ln -s $path'/customized.ini' ~/.customized.sh
        append customized $2
    ;;
    -zsh)
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ;;
    -base) 
        sudo apt install -y telnet git htop wget curl tree xclip lsof nmap silversearcher-ag thunar python3-pip notepadqq-gtk com.github.jmoerman.go-for-it viewnior  
    ;;
    *)
        help
    ;;
esac
