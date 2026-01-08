#!/usr/bin/env bash
# Program:
#     Install Coldrain's configuration on the current device
# 2025-12-03    Coldrain    Release 1.0.1
# Advanced Thoughts:
#     Need to add backup part to this script

# 1. Error process
set -euo pipefail                                                           # Exit the process when error occurs
trap 'ec=$?; echo "ERROR: exit=$ec at line $LINENO: $BASH_COMMAND" >&2' ERR # Display the information of error

# 2. Preparation work
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)" # Like: .../oh-my-dotfiles
TOTAL_CONF_FILES=$(find $SCRIPT_DIR/dotfiles -mindepth 1 -maxdepth 1 -type d | wc -l)
FILE_COUNT=0

# Select the configuration you want

echo "Choose the configuration you want to install on this device: (enter the number)"
select option in "quit" "bash" "zsh" "fish" "neovim" "kitty" "oh-my-posh" "tty-background(not stable)" "hyprland" "fastfetch" "All above!(be careful...)"; do
    case $option in
    "quit")
        echo "OK~"
        break
        ;;

    "bash")
        echo "🐱 Nya~ You choose the bash configuration"
        # 1. Bash Configuration
        BASH_SRC="${SCRIPT_DIR}/dotfiles/bash/.bashrc"
        BASH_DST_DIR="$HOME"
        BASH_DST="${BASH_DST_DIR}/.bashrc"

        cp -f -- "$BASH_SRC" "$BASH_DST"

        echo "Configuration File Copied: ${BASH_SRC} -> ${BASH_DST}"
        break
        ;;
    "zsh")
        echo "🐱 Nya~ You choose the zsh configuration"
        # 2. Zsh Configuration
        ZSH_SRC_="${SCRIPT_DIR}/dotfiles/zsh/.zshrc"
        ZSH_DST_DIR_="$HOME"
        ZSH_DST_="${ZSH_DST_DIR_}/.zshrc"

        cp -f -- "$ZSH_SRC_" "$ZSH_DST_"

        echo "Configuration File Copied: ${ZSH_SRC_} -> ${ZSH_DST_}"
        break
        ;;
    "fish")
        echo "🐱 Nya~ You choose the fish configuration"
        # 3. Fish Configuration
        FISH_SRC_="${SCRIPT_DIR}/dotfiles/fish"
        FISH_DST_DIR_="$HOME/.config/"
        FISH_DST_="$FISH_DST_DIR_"

        cp -r -- "FISH_SRC_" "FISH_DST_"

        echo "Configuration File Copied: ${FISH_SRC_} -> ${FISH_DST_}/fish"
        break
        ;;
    "neovim")
        echo "🐱 Nya~ You choose the fish configuration"
        # 4. Neovim Configuration
        NVIM_SRC_="${SCRIPT_DIR}/dotfiles/nvim"
        NVIM_DST_DIR_="$HOME/.config/"
        NVIM_DST_="$NVIM_DST_DIR_"

        cp -r -- "$NVIM_SRC_" "$NVIM_DST_"

        echo "Configuration File Copied: ${NVIM_SRC_} -> ${NVIM_DST_}/nvim"
        break
        ;;
    "kitty")
        # 5. kitty Configuration
        KITTY_SRC_="${SCRIPT_DIR}/dotfiles/kitty"
        KITTY_DST_DIR_="$HOME/.config/"
        KITTY_DST_="$KITTY_DST_DIR_"

        cp -r -- "KITTY_SRC_" "KITTY_DST_"

        echo "Configuration File Copied: ${KITTY_SRC_} -> ${KITTY_DST_}/kitty"
        break
        ;;
    "oh-my-posh")
        # 6. oh-my-posh Configuration
        OMP_SRC_="${SCRIPT_DIR}/dotfiles/oh-my-posh"
        OMP_DST_DIR_="$HOME/.config/"
        OMP_DST_="$OMP_DST_DIR_"

        cp -r -- "OMP_SRC_" "OMP_DST_"

        echo "Configuration File Copied: ${OMP_SRC_} -> ${OMP_DST_}/oh-my-posh"
        break
        ;;
    "tty-background(not stable)")
        # 7. tty background configuration
        TBC_SRC_="${SCRIPT_DIR}/dotfiles/resource/generated"
        TBC_DST_DIR_="$HOME/.local/state/quickshell/user/"
        TBC_DST_="$TBC_DST_DIR_"

        mkdir "$TBC_DST_DIR_"
        cp -r -- "TBC_SRC_" "TBC_DST_"

        echo "Configuration File Copied: ${TBC_SRC_} -> ${TBC_DST_}/generated"
        break
        ;;
    "hyprland")
        # 8. hyprland configuration
        HYPR_SRC_="${SCRIPT_DIR}/dotfiles/hypr"
        HYPR_DST_DIR_="$HOME/.config/"
        HYPR_DST_="$HYPR_DST_DIR_"

        cp -r -- "HYPR_SRC_" "HYPR_DST_"

        echo "Configuration File Copied: ${HYPR_SRC_} -> ${HYPR_DST_}/hypr"
        break
        ;;
    "fastfetch")
        # 9. fastfetch configuration
        HYPR_SRC_="${SCRIPT_DIR}/dotfiles/fastfetch"
        HYPR_DST_DIR_="$HOME/.config/"
        HYPR_DST_="$HYPR_DST_DIR_"

        cp -r -- "HYPR_SRC_" "HYPR_DST_"

        echo "Configuration File Copied: ${HYPR_SRC_} -> ${HYPR_DST_}/fastfetch"
        break
        ;;
    "All above!(be careful...)")
        # 1. Bash Configuration
        BASH_SRC="${SCRIPT_DIR}/dotfiles/bash/.bashrc"
        BASH_DST_DIR="$HOME"
        BASH_DST="${BASH_DST_DIR}/.bashrc"

        cp -f -- "$BASH_SRC" "$BASH_DST"

        echo "[1/${TOTAL_CONF_FILES}] Copied: ${BASH_SRC} -> ${BASH_DST}"

        # 2. Zsh Configuration
        ZSH_SRC_="${SCRIPT_DIR}/dotfiles/zsh/.zshrc"
        ZSH_DST_DIR_="$HOME"
        ZSH_DST_="${ZSH_DST_DIR_}/.zshrc"

        cp -f -- "$ZSH_SRC_" "$ZSH_DST_"

        echo "[2/${TOTAL_CONF_FILES}] Copied: ${ZSH_SRC_} -> ${ZSH_DST_}"

        # 3. Fish Configuration
        FISH_SRC_="${SCRIPT_DIR}/dotfiles/fish"
        FISH_DST_DIR_="$HOME/.config/"
        FISH_DST_="$FISH_DST_DIR_"

        cp -r -- "FISH_SRC_" "FISH_DST_"

        echo "[3/${TOTAL_CONF_FILES}] Copied: ${FISH_SRC_} -> ${FISH_DST_}/fish"

        # 4. Neovim Configuration
        NVIM_SRC_="${SCRIPT_DIR}/dotfiles/nvim"
        NVIM_DST_DIR_="$HOME/.config/"
        NVIM_DST_="$NVIM_DST_DIR_"

        cp -r -- "$NVIM_SRC_" "$NVIM_DST_"

        echo "[4/${TOTAL_CONF_FILES}] Copied: ${NVIM_SRC_} -> ${NVIM_DST_}/nvim"

        # 5. kitty Configuration
        KITTY_SRC_="${SCRIPT_DIR}/dotfiles/kitty"
        KITTY_DST_DIR_="$HOME/.config/"
        KITTY_DST_="$KITTY_DST_DIR_"

        cp -r -- "KITTY_SRC_" "KITTY_DST_"

        echo "[5/${TOTAL_CONF_FILES}] Copied: ${KITTY_SRC_} -> ${KITTY_DST_}/kitty"

        # 6. oh-my-posh Configuration
        OMP_SRC_="${SCRIPT_DIR}/dotfiles/oh-my-posh"
        OMP_DST_DIR_="$HOME/.config/"
        OMP_DST_="$OMP_DST_DIR_"

        cp -r -- "OMP_SRC_" "OMP_DST_"

        echo "[6/${TOTAL_CONF_FILES}] Copied: ${OMP_SRC_} -> ${OMP_DST_}/oh-my-posh"

        # 7. tty background configuration
        TBC_SRC_="${SCRIPT_DIR}/dotfiles/resource/generated"
        TBC_DST_DIR_="$HOME/.local/state/quickshell/user/"
        TBC_DST_="$TBC_DST_DIR_"

        mkdir "$TBC_DST_DIR_"
        cp -r -- "TBC_SRC_" "TBC_DST_"

        echo "[7/${TOTAL_CONF_FILES}] Copied: ${TBC_SRC_} -> ${TBC_DST_}/generated"

        # 8. hyprland configuration
        HYPR_SRC_="${SCRIPT_DIR}/dotfiles/hypr"
        HYPR_DST_DIR_="$HOME/.config/"
        HYPR_DST_="$HYPR_DST_DIR_"

        cp -r -- "HYPR_SRC_" "HYPR_DST_"

        echo "[8/${TOTAL_CONF_FILES}] Copied: ${HYPR_SRC_} -> ${HYPR_DST_}/hypr"

        # 9. fastfetch configuration
        HYPR_SRC_="${SCRIPT_DIR}/dotfiles/fastfetch"
        HYPR_DST_DIR_="$HOME/.config/"
        HYPR_DST_="$HYPR_DST_DIR_"

        cp -r -- "HYPR_SRC_" "HYPR_DST_"

        echo "[8/${TOTAL_CONF_FILES}] Copied: ${HYPR_SRC_} -> ${HYPR_DST_}/fastfetch"

        break
        ;;
    *)
        echo "Illegal Option!"
        ;;
    esac
done
