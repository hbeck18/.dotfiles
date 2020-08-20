#!usr/bin/bash
sudo mount -t drvfs Z: /mnt/z
if [[ "$OSTYPE" == "darwin"*  ]]; then
    # gamma exposure
    cd "$HOME/Google Drive/__Promotion/__gamma_exposure/02_programs/"
    tmuxp load "$HOME/Google Drive/__Promotion/__gamma_exposure/02_programs/_tmux_session.yaml" -d
    # Fed tails
    cd "$HOME/sciebo/__active/fed_call/Programs/__Python/"
    tmuxp load "$HOME/sciebo/__active/fed_call/Programs/__Python/_tmux_session.yaml" -d
    # network factors
    # --> unavailable.
else
    if grep -q Microsoft /proc/version; then
        # gamma exposure
        cd "/mnt/c/Users/h_beck18/Google Drive/__Promotion/__gamma_exposure/02_programs/"
        tmuxp load "/mnt/c/Users/h_beck18/Google Drive/__Promotion/__gamma_exposure/02_programs/_tmux_session.yaml" -d
        # Fed tails
        cd "/mnt/c/Users/h_beck18/sciebo/__active/fed_call/Programs/__Python/"
        tmuxp load "/mnt/c/Users/h_beck18/sciebo/__active/fed_call/Programs/__Python/_tmux_session.yaml" -d
        # network factors
        cd "/mnt/z/_projects/network_estimation/02_programs/"
        tmuxp load "/mnt/z/_projects/network_estimation/02_programs/_tmux_session.yaml" -d
        # inventory
        cd "/mnt/c/Users/h_beck18/Google Drive/__Promotion/__inventory_data/02_programs/"
        tmuxp load "/mnt/c/Users/h_beck18/Google Drive/__Promotion/__inventory_data/02_programs/_tmux_session.yaml" -d
        # corona fx networks
        cd "/mnt/c/Users/h_beck18/sciebo/__active/corona_network/02_programs"
        tmuxp load "/mnt/c/Users/h_beck18/sciebo/__active/corona_network/02_programs/_tmux_session.yaml" -d
    else
          echo "native Linux"
    fi
fi
