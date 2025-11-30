#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias ls='eza --icons=always'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias conda_env="source /opt/anaconda/bin/activate"
alias system_agent="export ALL_PROXY=http://127.0.0.1:20168"
alias my_blog="cd /home/lengyu/linux_project_dir/blog_dir/HexoBlog/ziheng5.github.io"
alias icat="kitty +kitten icat"


PS1='[\u@\h \W]\$ '
#eval "$(oh-my-posh init bash --config /home/lengyu/Documents/clean-detailed.omp.json)"
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/catppuccin_coldrain.omp.json)"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/lengyu/.lmstudio/bin"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

