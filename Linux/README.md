# Linux常用配置文件

## 别名文件

- 关于alias别名文件的事情，突然意识到，其实.bashrc只是判断了一下文件是否存在，存在就执行文件 2017-12-25 20:51:25
	- 目前我是 .bash_aliases 用来存环境变量
	- .kcp_aliases.conf 存软件简写
	- .git_aliases.conf 存git仓库 
	- 使用conf后缀是为了VSCode的格式化,实际上这个文件是任意的名字的
	
```sh
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi
```

1. host文件
1. cpu信息文件
1. vim配置文件

### Qterminal
> 一个比较好用的终端

1. 字体: Source Code Pro for Powerline 11 pt
1. 终端颜色 BreezeModified
1. 控件样式 dsemidark
1. 透明0 终端透明 20% 背景图片 你的名字 [流星图 地址](http://desk.zol.com.cn/bizhi/6849_85488_2.html)

