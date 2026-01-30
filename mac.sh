# !/bin/bash
echo "> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

echo "> Installing packages..."

brew install git
\ microsoft-teams
\ google-chrome
\ visual-studio-code
\ discord
\ alacritty
\ yarn
\ docker
\ docker-buildx
\ docker-compose
\ microsoft-teams
\ eza
\ cloudflared
\ cloudflare-warp
\ font-fira-code
\ companion
\ dbeaver-community
\ hugo
\ k9s
\ kubelogin
\ lm-studio
\ spotify
\ wget
\ tmux
\ zsh
\ zsh-autosuggestions
\ asdf
\ node
\ azure-cli

# Set zsh as default shell
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Start Cloudflare
brew services start cloudflared

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

# Github GPG key
mkdir ~/.ssh
ssh-keygen -t ed25519 -C "github"

touch ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github

ssh-add --apple-use-keychain ~/.ssh/github

# Git config
git config --global user.name "Your Name"
git config --global user.email "you@your-domain.com"

# Install asdf plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
