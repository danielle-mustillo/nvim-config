sudo apt install lua5.4 liblua5.4-dev -y
sudo apt install luarocks -y
sudo snap install go --classic
sudo apt install imagemagick -y
sudo apt-get install texlive-latex-base -y
sudo apt-get install texlive-fonts-recommended -y
sudo apt-get install texlive-fonts-extra -y

sudo snap install nvim --classic
#npm install -g neovim

sudo apt install python3-pynvim -y

# Fzf
sudo apt install fzf -y
echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> /home/$USER/.bashrc

# LazyGit 
# https://github.com/jesseduffield/lazygit?tab=readme-ov-file#debian-and-ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
