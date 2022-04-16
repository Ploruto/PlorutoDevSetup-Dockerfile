#!/bin/bash
 apt-get update

# Install sudo command...
 apt-get install -y sudo

 sudo apt-get install -y build-essential

# The Ubuntu image does not include curl. I prefer it, but it isn't necessary.
# Note that if you decide to not install this you will need to use wget instead
# for some of the installation commands in this tutorial.
 sudo apt-get install -y curl

# We will need git so we can clone repositories
 sudo apt-get install -y git

# SSH is not bundled by default. I always use ssh to push to Github.
 sudo apt-get install -y openssh-client

# The manuals are always handy for development.
 sudo apt-get install -y man-db

# Get basic tab completion
 sudo apt-get install -y bash-completion

sudo apt install fontconfig
########## ASTRO VIM SETUP

mkdir -p ~/.config/nvim

#Install Nerd font

curl https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o JetBrainsMonoNerdFont.ttf

 mv JetBrainsMonoNerdFont.ttf /usr/local/share/fonts

 fc-cache -f -v


# Install Neovim 0.6
 sudo add-apt-repository ppa:neovim-ppa/unstable

 sudo apt-get update

 sudo apt-get install neovim


# Install Ploruto nvim config
 git clone https://github.com/Ploruto/ploruto-astrovim-config ~/.config/nvim

 nvim +PackerSync


# run all optional req.

 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

 ~/.fzf/install

# install htop

 apt install htop

# install nodejs

 apt install htop


# refresh nvim
 nvim +PackerSync







