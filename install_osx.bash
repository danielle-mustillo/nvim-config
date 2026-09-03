#! /bin/bash

brew install neovim 
brew install lazygit
brew install fzf
brew install ripgrep
brew install fd
brew install --cask ghostty

brew install python
brew install go
brew install node
brew install java

# Extra stuff
brew install mvn
brew install codex
brew install docker
brew install colima
colima start --cpu 4 --memory 8
brew install docker-compose


# Work stuff
brew install gh
brew install --cask git-credential-manager

brew install --cask codex
brew install --cask claude-code
brew install --cask cursor

brew install --cask insomnia

brew install --cask gcloud-cli
brew install awscli

brew install helm
brew install kubectl 
brew install kind
brew install docker-buildx

brew install --cask slack
brew install --cask spotify
brew install --cask google-drive
brew install yq

brew install rust

# Nice things (oh-my-zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install starship
# add the following to .zshrc (exactly)
#
# plugins=(git fzf kubectl zsh-syntax-highlighting zsh-autosuggestions )
#
# eval "$(starship init zsh)"
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
git config --global github.user danielle-mustillo
git config --global user.name Danielle Mustillo
git config --global user.email danielle.mustillo@solo.io

# Solo specific
npm install -g corepack && corepack --version
