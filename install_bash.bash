set -e

# Man Pages and Suggestions for Bash
if command -v "unminimize" &>/dev/null; then
	echo "unminimizing the OS install to get man pages back..."
	sudo unminimize
else
	echo "uminimize command does not exits, skipping..."
fi

# NVIM and Direct Dependencies
#sudo apt install flatpak
#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#flatpak install flathub io.neovim.nvim
#sudo snap install nvim --classic

arch=$(uname -m)

if [[ "$arch" == arm* ]] || [[ "$arch" == aarch* ]]; then
    echo "This is an ARM architecture."

    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.appimage
    chmod u+x nvim-linux-arm64.appimage
    ./nvim-linux-arm64.appimage --version

    sudo mkdir -p /opt/nvim
    sudo mv nvim-linux-arm64.appimage /opt/nvim/nvim
else
    echo "This is not an ARM architecture (likely x86)."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
    chmod u+x nvim-linux-x86_64.appimage
    ./nvim-linux-x86_64.appimage --version

    sudo mkdir -p /opt/nvim
    sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
fi
export PATH="$PATH:/opt/nvim/"
echo 'export PATH="$PATH:/opt/nvim/"' >> ~/.bashrc

#npm install -g neovim
sudo apt install jq ripgrep fd-find -y
#ln -s $(which fdfind) ~/.local/bin/fd


sudo apt install luarocks lua5.4 liblua5.4-dev -y
sudo apt install golang -y  # this is because executing :checkhealth doesn't work with snap (but it probably should....)
#sudo snap install go --classic
sudo apt install openjdk-21-jdk-headless -y # this is because we don't always have javac... again :checkhealth

sudo apt install imagemagick texlive-latex-base texlive-fonts-recommended -y
#sudo apt-get install texlive-fonts-extra -y # This is probably overkill, here for refernce only

#sudo apt install python3-pynvim python3-pip python3-venv python-is-python3 -y
sudo apt install python3-pip python3-venv python-is-python3 -y
sudo apt install sqlite3 -y


# Fzf
sudo apt install fzf -y
#echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> $HOME/.bashrc

# Node & NPM
# -----
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.13.1".

# Verify npm version:
npm -v # Should print "11.8.0".
# ----------


# LazyGit 
# https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
  ARCHIVE="lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
  ARCHIVE="lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

URL="https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/${ARCHIVE}"

echo "Downloading $ARCHIVE from $URL"
curl -Lo lazygit.tar.gz "$URL"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit
rm lazygit.tar.gz

echo "lazygit v${LAZYGIT_VERSION} installed successfully!"

mkdir -p $HOME/.config/lazygit/
touch $HOME/.config/lazygit/config.yml
mkdir -p $HOME/test/


## TODO this is stuff for kitty install, might not be needed though....
# https://gist.github.com/VPraharsha03/dce1692afccdb2d220fffff3ad8448f0 
#
#
# sudo apt install mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev
# sudo apt install kitty 
# export KITTY_DISABLE_WAYLAND=1
#
# Cleanup
sudo apt autoremove -y
