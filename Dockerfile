RUN apt-get update

# Install sudo command...
RUN apt-get install -y sudo

# Feel free to change this to whatever your want
ENV DOCKER_USER ploruto

# Start by creating our passwordless user.
RUN adduser --disabled-password --gecos '' "$DOCKER_USER"

# Give root priviledges
RUN adduser "$DOCKER_USER" sudo

# Give passwordless sudo. This is only acceptable as it is a private
# development environment not exposed to the outside world. Do NOT do this on
# your host machine or otherwise.
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the user to be our newly created user by default.
USER "$DOCKER_USER"

# This will determine where we will start when we enter the container.
WORKDIR "/home/$DOCKER_USER"

# The sudo message is annoying, so skip it
RUN touch ~/.sudo_as_admin_successful


RUN sudo apt-get install -y build-essential

# The Ubuntu image does not include curl. I prefer it, but it isn't necessary.
# Note that if you decide to not install this you will need to use wget instead
# for some of the installation commands in this tutorial.
RUN sudo apt-get install -y curl

# We will need git so we can clone repositories
RUN sudo apt-get install -y git

# SSH is not bundled by default. I always use ssh to push to Github.
RUN sudo apt-get install -y openssh-client

# The manuals are always handy for development.
RUN sudo apt-get install -y man-db

# Get basic tab completion
RUN sudo apt-get install -y bash-completion

########## ASTRO VIM SETUP

#Install Nerd font

RUN https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf -o JetBrainsMonoNerdFont.ttf

RUN mv JetBrainsMonoNerdFont.ttf /usr/local/share/fonts

RUN fc-cache -f -v


# Install Neovim 0.6
RUN sudo add-apt-repository ppa:neovim-ppa/unstable

RUN sudo apt-get update

RUN sudo apt-get install neovim


# Install Ploruto nvim config
RUN git clone https://github.com/Ploruto/ploruto-astrovim-config ~/.config/nvim

RUN nvim +PackerSync


# run all optional req.

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

RUN ~/.fzf/install

# install htop

RUN apt install htop

# install nodejs

RUN apt install htop


# refresh nvim
RUN nvim +PackerSync







