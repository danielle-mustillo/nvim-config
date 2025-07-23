sudo apt install lua5.4 liblua5.4-dev -y
sudo apt install luarocks -y
sudo apt install golang -y  # this is because executing :checkhealth doesn't work with snap (but it probably should....)
#sudo snap install go --classic
sudo apt install openjdk-21-jdk-headless # this is because we don't always have javac... again :checkhealth

sudo apt install imagemagick -y
sudo apt-get install texlive-latex-base -y
sudo apt-get install texlive-fonts-recommended -y
sudo apt-get install texlive-fonts-extra -y

sudo snap install nvim --classic
#npm install -g neovim

sudo apt install python3-pynvim python3-pip -y

# Fzf
sudo apt install fzf -y
#echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> $HOME/.bashrc

sudo apt-get install ripgrep -y 
sudo apt install fd-find -y
#ln -s $(which fdfind) ~/.local/bin/fd

# LazyGit 
# https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/


