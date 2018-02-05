## 环境变量手动配置 统一配置
##SDK_DIR=/home/kcp/.sdkman/candidates
##GRADLE_HOME=$SDK_DIR/gradle/current
###GRAILS_HOME=$SDK_DIR/grails/current
##GROOVY_HOME=$SDK_DIR/groovy/current
##KOTLIN_HOME=$SDK_DIR/kotlin/current
##SCALA_HOME=$SDK_DIR/scala/current
##export PATH=$PATH:$GRADLE_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin:$SCALA_HOME/bin:$KOTLIN_HOME/bin

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

## 自动提示
source ~/.git-completion.bash
## 显示分支
source ~/.git-prompt.sh
set_bash_prompt(){
## PS1="[e[32m]u[e[m]@[e[33m]W[e[36m]$(__git_ps1 ' (%s)')[e[31m]$[e[m]"
    ## PS1="${lightcyan}\t${lightgreen}\w${lightpurple}$(__git_ps1 ' (%s)')${yellow} → \[\e[m\]"
    PS1="${lightcyan}\t${lightgreen}\w${lightpurple}$(__git_ps1 '(%s)')${yellow} → \[\e[m\]"
}
PROMPT_COMMAND="set_bash_prompt; $PROMPT_COMMAND"
## →
## PS1="${yellow}\u@\h${nocolor}:${lightpurple}\w ${nocolor}\$ "  ${lightpurple}\u


## PS1="${lightcyan}\t ${lightgreen}\w ${yellow}→ ${nocolor}"

FIREFOX_58=/home/kcp/Application/Net/firefox_beta
export PATH=${FIREFOX_58}:$PATH

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


CRASH_HOME=~/.mythsdk/sdk/crash/current
export PATH=$PATH:$CRASH_HOME/bin

VISUALVM_HOME=~/.mythsdk/sdk/visualvm/current
export PATH=$PATH:$VISUALVM_HOME/bin
