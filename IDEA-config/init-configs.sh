red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
end='\033[0m'

log(){
    printf " $1\n"
}
log_error(){
    printf "$red $1 $end\n" 
}
log_info(){
    printf "$green $1 $end\n" 
}
log_warn(){
    printf "$yellow $1 $end\n" 
}

help(){
    printf "Run：$red sh init-configs.sh $green<verb> $yellow<args>$end\n"
    format="  $green%-6s $yellow%-8s$end%-20s\n"
    printf "$format" "-h" "" "帮助"
}

init(){
    idea_config_dir=$1
    is_idea=$(echo $idea_config_dir | grep -ie "idea.*/config")
    if [ "$is_idea" = "" ];then
        log_error "please use idea config dir"        
    fi
    # TODO create all file link to config dir
}

case $1 in 
    -h)
        help ;;
    *)
        init $1
    ;;
esac
