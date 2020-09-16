#!usr/bin/bash
if [[ "$OSTYPE" == "darwin"*  ]]; then
    # curl -OL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    # tar xzvf nvim-macos.tar.gz
    # rm nvim-macos.tar.gz
    # alias nvim="$HOME/nvim-osx64/bin/nvim"
    brew tap jason0x43/homebrew-neovim-nightly
    brew cask install neovim-nightly
else
    cd ~
    mkdir -p appimages
    cd appimages
    rm -rf nvim
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod +x nvim.appimage
    ./nvim.appimage --appimage-extract
    mv squashfs-root nvim
    cd ~
    mkdir -p bin
    cd bin
    # ln -s ../appimages/nvim/AppRun nvim
    cd ~
fi
