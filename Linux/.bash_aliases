## 环境变量手动配置 统一配置
##SDK_DIR=/home/kcp/.sdkman/candidates
##GRADLE_HOME=$SDK_DIR/gradle/current
###GRAILS_HOME=$SDK_DIR/grails/current
##GROOVY_HOME=$SDK_DIR/groovy/current
##KOTLIN_HOME=$SDK_DIR/kotlin/current
##SCALA_HOME=$SDK_DIR/scala/current
##export PATH=$PATH:$GRADLE_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin:$SCALA_HOME/bin:$KOTLIN_HOME/bin


## Myth Define Alias
## 对于K.h #开头会输出，##开头不会输出，alias会被输出,其他的不会输出
# Shell
alias K.link='path=$(cd `dirname $0`; pwd) &&ln -s $path/.bash_aliases ~/.bash_aliases' # 将当前目录的alias配置文件映射到当前用户目录下
alias K.h='py ~/Application/Script/python/show_alias_help.py' # 获取帮助文档
alias Ka='gedit ~/.bash_aliases &' # 打开alias设置文件
alias Ka.cat='cat ~/.bash_aliases' #显示文件
alias Ka.update='source ~/.bashrc' # 重新加载bash配置文件
alias Kremove='sudo apt remove --purge' # 完全卸载软件

alias l='ls -CF' # ls -CF
alias ll='ls -lh' # ls -l 简写
alias la='ls -Ah' # ls -A
alias lla='ls -lah' # ls -a 简写
alias ..='cd ..' # cd .. 简写

alias dps='docker ps -a' # docker ps
alias dim='docker images' #docker images
alias dstas='docker stats' # docker stats

alias charles='sh /home/kcp/Application/Net/charles/bin/charles &' # charles
alias https='http —default-scheme=https' # httpie 的https方式
alias kk='py /home/kcp/Application/Script/python/mythsdk/mythsdk.py' # 个人开发的sdk管理脚本
alias ng='/home/kcp/Application/Net/Ngrok/ngrok' # ngrok
alias qs='/home/kcp/Application/Net/qiniu/qshell-linux-x64' # 七牛云命令行工具
alias gy='groovy' # groovy简写
alias py='python3.5m' # python3.5m 简写
alias py2='python' # python2 简写
alias bell='sudo rmmod pcspkr' # 临时关闭终端响铃

# GIT_CMD
alias gs='git status' # git status 
alias ga='git add *' # git add *
alias gb='git branch' # git branch
alias gm='git commit' # git commit  
alias gme='git merge --no-ff ' # git merge --no-ff 简写
alias gp='git push' # git push
alias gpo='git push origin' # git push origin 
alias gpdev='git push origin dev' # git push origin dev
alias gpl='git pull' # git pull 
alias gplo='git pull origin' # git pull origin 
alias gd='git diff' # git diff
alias gch='git checkout' # git checkout
alias glog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short' # glog format own define
alias gline='git ls-files | xargs cat | wc -l' # 查看仓库中所有文本文件行数总和


#  Git_REPOS
## Git__Java
alias Kg.redis='cd ~/IdeaProjects/BaseLearn/MythRedisClient/' # Redis客户端项目
alias Kg.javatoolkit='cd ~/IdeaProjects/BaseLearn/JavaToolKit/' # Java工具包项目
alias Kg.javabase='cd ~/IdeaProjects/BaseLearn/JavaBase' # Java基础项目
alias Kg.spring.base='cd ~/IdeaProjects/SpringBoot/SpringBase' # Spring框架
alias Kg.gradute='cd ~/IdeaProjects/SpringBoot/graduationreply' #毕业设计
alias Kg.youhui='cd ~/IdeaProjects/weixin' # 优惠购
alias Kg.oa='cd /home/kcp/IdeaProjects/oa' # OA项目

## Git__Python
alias Kg.python.learn='cd ~/PycharmProjects/PythonMythLearn/' #python学习项目
alias Kg.script='cd ~/Application/Script/' # 实用脚本

## Git__Other
alias Kg.images='cd ~/Pictures/ImageRepos' # 图片仓库
alias Kg.notes='cd ~/Documents/Notes/Notes/' # 笔记仓库
alias Kg.diary='cd ~/Documents/Notes/diary/' # 个人日记目录
alias Kg.io='cd ~/Documents/Notes/Kuangcp.github.io/' # github io 项目
alias Kg.config='cd ~/Documents/Notes/Configs' # 小工具


# Directory
alias Kd.redis='cd ~/Application/Database/redis-3.2.8' # redis目录
alias Kd.tomcat8-5='cd ~/Videos/apache-tomcat-8.5.14' # tomcat目录,activiti使用
alias Kd.tomcat.image='cd ~/Videos/apache-tomcat-image/apache-tomcat-8.5.14/bin' # tomcat目录 image,以及io 展示
alias Kd.hexo='cd ~/hexo' # hexo目录
alias Kd.linux='cd /media/kcp/Myth/Linux' # F盘下Linux目录


# Application
alias Kredis.client='./client_start.sh' # 开启本地redis client
alias Kredis.server='./server_start.sh' # 开启本地redis server
alias Kredis.81='./redis-cli -h 120.25.203.47 -p 6381' # 连接远程redis 6381
alias Kredis.80='./redis-cli -h 120.25.203.47 -p 6380' # 连接远程redis 6380
alias Kredis.79='./redis-cli -h 120.25.203.47 -p 6379' # 连接远程redis 6379
alias Kredis.78='./redis-cli -h 120.25.203.47 -p 6378' # 连接远程redis 6378

alias Krec='asciinema rec' # 开始录制终端
alias Kssh='ssh -p 22 kuang@120.25.203.47' # ssh登录服务器
alias Kuang='ssh kuang@120.78.154.52' #自己的服务器
alias Kserver='ssh youhuigo@118.31.14.157' # 登录公司服务器
alias Kssh.l0.alpine='ssh -p 55555 root@localhost' # ssh登录本地docker中的alpine
alias Kssh.ali.docker='ssh -p 9990 myth@120.25.203.47' # ssh登录阿里的docker里的Ubuntu
alias Kssh.alpine='ssh -p 6789 root@120.25.203.47' # ssh登录docker中的alpine
alias Kdocker.ubuntu='docker exec -it ubuntu16 bash' # 进入ubuntu16终端 11223:22 11224:8080 11225:6379
alias Kmysql='mysql -u myth -pad' #myth用户连接MySQL 
alias Krepos='py  ~/Application/Script/python/check_repos.py' #检查所有仓库状态的脚本
alias Kindex='py ~/Application/Script/python/append_contents.py' # 处理markdown文件
alias Kdesktop='py ~/Application/Script/python/create_desktop.py' # 创建一个desktop文件
alias Kclient='sh ~/IdeaProjects/BaseLearn/MythRedisClient/run.sh' # MythRedis 客户端


## 设置终端的提示符的颜色
black='\[\033[0;30m\]'     
darkgray='\[\033[1;30m\]'
blue='\[\033[0;34m\]'     
lightBlue='\[\033[1;34m\]'
green='\[\033[0;32m\]'     
lightgreen='\[\033[1;32m\]'
cyan='\[\033[0;36m\]'     
lightcyan='\[\033[1;36m\]'
red='\[\033[0;31m\]'     
lightred='\[\033[1;31m\]'
purple='\[\033[0;35m\]'     
lightpurple='\[\033[1;35m\]'
brown='\[\033[0;33m\]'     
yellow='\[\033[1;33m\]'
lightgray='\[\033[0;37m\]'     
white='\[\033[1;37m\]'
nocolor='\[\033[0m\]'

source ~/.git-prompt.sh
set_bash_prompt(){
## PS1="[e[32m]u[e[m]@[e[33m]W[e[36m]$(__git_ps1 ' (%s)')[e[31m]$[e[m]"
    PS1="${lightcyan}\t${lightgreen}\w${lightpurple}$(__git_ps1 ' (%s)')${yellow} → \[\e[m\]"
}
PROMPT_COMMAND="set_bash_prompt; $PROMPT_COMMAND"
## →
## PS1="${yellow}\u@\h${nocolor}:${lightpurple}\w ${nocolor}\$ "  ${lightpurple}\u


## PS1="${lightcyan}\t ${lightgreen}\w ${yellow}→ ${nocolor}"


## export只是当前终端有效，刷新这个文件就生效了，要删除的话，就要重新打开终端才会生效
JAVA_HOME=/home/kcp/Application/sdk/jdk1.8.0_152
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

SCALA_HOME=~/.mythsdk/sdk/scala/current
export PATH=$PATH:$SCALA_HOME/bin

GROOVY_HOME=~/.mythsdk/sdk/groovy/current
export PATH=$PATH:$GROOVY_HOME/bin

GRADLE_HOME=~/.mythsdk/sdk/gradle/current
export PATH=$PATH:$GRADLE_HOME/bin

KOTLIN_HOME=~/.mythsdk/sdk/kotlin/current
export PATH=$PATH:$KOTLIN_HOME/bin

MAVEN_HOME=~/.mythsdk/sdk/maven/current
export PATH=$PATH:$MAVEN_HOME/bin

SPRINGBOOT_HOME=~/.mythsdk/sdk/springboot/current
export PATH=$PATH:$SPRINGBOOT_HOME/bin
