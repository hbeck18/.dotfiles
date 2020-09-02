# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/heino/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/heino/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/heino/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/heino/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
PATH=$PATH:$HOME/nvim-osx64/bin/
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# alias nvim="$HOME/nvim-osx64/bin/nvim"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
