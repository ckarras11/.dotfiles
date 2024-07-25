# Install Packages
yay -S - < pkglist.txt

# Setup ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh)

# Setup user for docker
usermod -aG docker $(whoami)

# Start docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker

# Install asdf and NodeJS plugin
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
