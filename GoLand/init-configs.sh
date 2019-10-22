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
    printf "$format" "i" "dir" "idea config dir"
    printf "$format" "g" "dir" "goland config dir"
}

init(){
    idea_config_dir=$1
    echo $2
    is_idea=$(echo $idea_config_dir | grep -ie $2".*/config")
    if [ "$is_idea" = "" ];then
        log_error "please use idea config dir"
        exit 1
    fi
    # TODO create all file link to config dir
    for dir in $(ls); do
        if [ -d $dir ]; then
            echo $dir
            cd $dir
            mkdir -p $idea_config_dir/$dir
            echo  $(pwd) $idea_config_dir/$dir
            ln -s $(pwd) $idea_config_dir/$dir
            cd ..
        fi
    done
}

case $1 in 
    -h)
        help 
    ;;
    -idea|i)
        init $2 'idea'
    ;;
    -go|g)
        init $2 'goland'
    ;;
    *)
        help 
    ;;
esac
