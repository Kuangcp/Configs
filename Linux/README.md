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

host文件
cpu信息文件
vim配置文件

- [ ] 将配置文件使用模板文件, 忽略原有文件的处理方式, 方便迁移


