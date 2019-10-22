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

create_link(){
    idea_config_dir=$1
    is_idea=$(echo $idea_config_dir | grep -ie $2".*/config")
    if [ "$is_idea" = "" ];then
        log_error "please use idea config dir"
        exit 1
    fi

    for dir in $(ls); do
        if [ -d $dir ]; then
            printf "\n$cyan  %s $end \n" $dir
            cd $dir
            mkdir -p $idea_config_dir/$dir
            path=$(pwd)
            printf "$green   ln -s %s $yellow %s $end\n" $path $idea_config_dir/$dir
            echo $path

            count=$(ls -l $path | wc -l)
            echo $count
            if test $count = 1; then
                cd ..
                continue
            fi
            
            ln -s $(pwd)/* $idea_config_dir/$dir
            cd ..
        fi
    done
}

case $1 in 
    -h)
        help 
    ;;
    -idea|i)
        cd IDEA
        create_link $2 'idea'
    ;;
    -go|g)
        cd GoLand
        create_link $2 'goland'
    ;;
    *)
        help 
    ;;
esac
