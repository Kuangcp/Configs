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
    printf "  $start%-16s$end%-20s\n" "-zlua" "安装 oh-my-zsh 后 安装 zlua"
    printf "  $start%-16s$end%-20s\n" "-base.apt" "通过 apt 安装 常用工具"

    printf "  $start%-16s$end%-20s\n" "-l z|ba path " "1 存放环境变量"
    printf "  $start%-16s$end%-20s\n" "-l z|ba sys"  "2 常用别名, 公共"
    printf "  $start%-16s$end%-20s\n" "-l z|ba cus  " "3 存放脚本工具别名,路径别名,SSH等自定义信息"
    printf "  $start%-16s$end%-20s\n" "-l z|ba repo " "4 存放git仓库别名"
}

# append load file to *shrc
append(){
    echo 'if [ -f ~/.'${1}.sh' ]; then
    . ~/.'${1}.sh'
fi'>>$userDir'/.'$2'shrc'
}

check_file(){
    if [ -f $1 ]; then 
        echo "file "$1 " existed"
        exit 1
    fi
}

link_file(){
    shell_type=$1
    file_type=$2

    if [ ! $shell_type = 'z' ] && [ ! $shell_type = 'ba' ];then
        echo "error shell type, only support zsh or bash"
        exit 1
    fi

    case $file_type in 
        sys)
            check_file ~/.system.sh
            ln -s $path'/system.conf' ~/.system.sh
            append system $shell_type
        ;;
        repo)
            check_file ~/.repos.sh
            if [ ! -f ${path}/repos.ini ];then
                cp ${path}/repos.conf ${path}/repos.ini
            fi
            ln -s $path'/repos.ini' ~/.repos.sh
            append repos $shell_type
        ;;
        path)
            check_file ~/.path.sh
            if [ ! -f ${path}/path.ini ];then
                cp ${path}/path.conf ${path}/path.ini
            fi
            
            ln -s $path'/path.ini' ~/.path.sh
            append path $shell_type
        ;;
        cus)
            check_file ~/.customized.sh
            if [ ! -f ${path}/customized.ini ];then
                cp ${path}/customized.conf ${path}/customized.ini
            fi
            ln -s $path'/customized.ini' ~/.customized.sh
            append customized $shell_type
        ;;
    esac
}

install_oh_my_zsh(){
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

install_z_lua(){
    zlua_path=$userDir'/.oh-my-zsh/custom/plugins'
    if [ ! -d "$zlua_path" ]; then
        echo "Please install oh-my-zsh first"
        exit 1
    fi
    cd $zlua_path
    git clone --depth 1 https://github.com/skywind3000/z.lua.git
    
    echo 'eval "$(lua '$zlua_path'/z.lua/z.lua --init zsh)"' >> ~/.zshrc
}

case $1 in 
    -h | h |help)
        help
    ;;
    -l)
        if [ ! $# = 3 ]; then
            echo "Please input correct param"
            exit 1 
        fi

        link_file $2 $3
    ;;
    -zsh)
        install_oh_my_zsh
    ;;
    -zlua)
        install_z_lua
    ;;
    -base.apt) 
        sudo apt install -y telnet git sshpass htop wget curl tree xclip lsof nmap silversearcher-ag thunar python3-pip notepadqq-gtk com.github.jmoerman.go-for-it viewnior  
    ;;
    -base.pacman)
        sudo pacman -S xclip nmap the_silver_searcher
    ;;
    *)
        help
    ;;
esac
