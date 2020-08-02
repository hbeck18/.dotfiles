#!usr/bin/bash

if [[ "$OSTYPE" == "darwin"*  ]]; then
    # gamma exposure
    tmuxp load "$HOME/Google Drive/__Promotion/__gamma_exposure/02_programs/_tmux_session.yaml" -d
    # Fed tails
    tmuxp load "$HOME/sciebo/__active/fed_call/Programs/__Python/_tmux_session.yaml" -d
    # network factors
    # --> unavailable.
else
    if grep -q Microsoft /proc/version; then
        # gamma exposure
        tmuxp load "/mnt/c/Users/h_beck18/Google Drive/__Promotion/__gamma_exposure/02_programs/_tmux_session.yaml" -d
        # Fed tails
        tmuxp load "/mnt/c/Users/h_beck18/sciebo/__active/fed_call/Programs/__Python/_tmux_session.yaml" -d
        # network factors
        tmuxp load "/mnt/z/_projects/network_estimation/02_programs/_tmux_session.yaml" -d
    else
          echo "native Linux"
    fi
fi
