# Created by newuser for 5.9

# 1. General source
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 2. General alias
alias ls='ls --color=auto'
alias conda_env="source /opt/anaconda/bin/activate"
alias system_agent="export HTTP_PROXY=http://127.0.0.1:2080 && export HTTPS_PROXY=http://127.0.0.1:2080"
## icat image.png/.jpg/... --> show the image
alias icat="kitty +kitten icat"
alias my_blog="cd /home/lengyu/linux_project_dir/blog_dir/HexoBlog/ziheng5.github.io"
alias hot_news="/home/lengyu/.conda/envs/ziheng/bin/python /home/lengyu/linux_project_dir/oh-my-hot-news/main.py"
alias ise="/usr/bin/sh -c 'unset LANG && unset QT_PLUGIN_PATH && source /opt/Xilinx/14.7/ISE_DS/settings64.sh && ise'"

# 3. oh-my-posh config
eval "$(oh-my-posh init zsh --config /home/lengyu/Theme/zsh_theme/catppuccin_mocha.omp.json)"

export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"

# 4. pnpm
export PNPM_HOME="/home/lengyu/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# 5. make tmp_folders
export CURRENT_DATE=$(date "+%Y-%m-%d")
alias mktmp="mkdir /home/lengyu/tmp_folder/$CURRENT_DATE && echo 'Nya~ Temporary folder has already been made to: /home/lengyu/tmp_folder/$CURRENT_DATE'"

# Created by `pipx` on 2025-07-20 07:07:17
export PATH="$PATH:/home/lengyu/.local/bin"

# 6. General Functions
function touch() {
    # 给 touch 函数加上猫猫主题
    command touch "$@"

    for file in "$@"; do
        # 获取绝对路径
        full_path=$(realpath "$file")

        # 使用颜色：路径为绿色(\e[32m), 其他为默认颜色
        echo -e "🐱 \e[35mNya\e[0m~~ (📄 \e[34m${full_path}\e[0m) created ✨"
    done
}


# 7. QQ_config
export XDG_CONFIG_HOME="$HOME/.config"

function mkdir() {
    # 给 mkdir 函数加上 neko 主题
    command mkdir "$@"

    for file in "$@"; do
        # 获取绝对路径
        full_path=$(realpath "$file")

        # 使用颜色
        echo -e "🐱 \e[35mNya\e[0m~~ (📁 \e[34m${full_path}\e[0m) created ✨"
    done
}
