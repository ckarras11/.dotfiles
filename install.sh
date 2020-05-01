echo "> Updating Apt and installing wget and build-essential..."
sudo apt-get -qq update
sudo apt-get -qq install curl wget git build-essential

echo "> Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   disco \
   stable"
sudo apt remove -y docker docker-engine docker.io containerd runc
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $(whoami)

echo "> Nodejs"
sudo apt install nodejs
sudo apt install npm

echo "> Yarn" 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn policies set-version 1.19

echo "> Zsh"
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "> PGAdmin4" 
sudo apt-get install curl ca-certificates gnupg
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install postgresql-11 pgadmin4

echo "> Tmux"
sudo apt-get -qq install tmux

echo "> Exa"
curl -LO https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip
sudo mv exa-linux-x86_64 /usr/bin/exa
rm -rf exa-linux-x86_64 exa-linux-x86_64-0.9.0.zip

echo "> Discord"
curl -LO https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
sudo dpkg -i discord-0.0.10.deb
rm discord-0.0.10.deb

echo "> Changing shell to zsh"
chsh -s $(which zsh)
