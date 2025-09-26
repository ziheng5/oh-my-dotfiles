function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

alias pamcan pacman
alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'
    




# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

# 0. General Values
# set -gx PATH /opt/anaconda/bin $PATH  # commented out by conda initialize


# 1. General Alias
alias system_agent 'set -gx ALL_PROXY socks5://127.0.0.1:20168; set -gx all_proxy socks5://127.0.0.1:20168; set -gx http_proxy socks5://127.0.0.1:20168; set -gx https_proxy socks5://127.0.0.1:20168; set -gx HTTP_PROXY socks5://127.0.0.1:20168; set -gx HTTPS_PROXY socks5://127.0.0.1:20168'
alias my_blog 'cd /home/lengyu/linux_project_dir/blog_dir/HexoBlog/ziheng5.github.io/'



# 2. oh-my-posh Configuration
oh-my-posh init fish --config /home/lengyu/Theme/zsh_theme/catppuccin_mocha.omp.json | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda/bin/conda
    eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda/bin" $PATH
    end
end
# <<< conda initialize <<<

