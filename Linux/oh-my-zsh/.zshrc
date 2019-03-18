# Set LS_COLORS environment by Deepin
if [[ ("$TERM" = *256color || "$TERM" = screen* || "$TERM" = xterm* ) && -f /etc/lscolor-256color ]]; then                                         
    eval $(dircolors -b /etc/lscolor-256color)
else
    eval $(dircolors)
fi

