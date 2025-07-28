set -e

# NVIM and Direct Dependencies
sudo snap install nvim --classic
#npm install -g neovim
sudo apt install jq ripgrep fd-find -y
#ln -s $(which fdfind) ~/.local/bin/fd


sudo apt install luarocks lua5.4 liblua5.4-dev -y
sudo apt install golang -y  # this is because executing :checkhealth doesn't work with snap (but it probably should....)
#sudo snap install go --classic
sudo apt install openjdk-21-jdk-headless -y # this is because we don't always have javac... again :checkhealth

sudo apt install imagemagick texlive-latex-base texlive-fonts-recommended -y
#sudo apt-get install texlive-fonts-extra -y # This is probably overkill, here for refernce only

sudo apt install python3-pynvim python3-pip python3-venv -y
sudo apt install sqlite3 -y


# Fzf
sudo apt install fzf -y
#echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> $HOME/.bashrc

# Node & NPM
sudo snap install node --classic




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

touch $HOME/.config/lazygit/config.yml



# Cleanup
sudo apt autoremove -y
