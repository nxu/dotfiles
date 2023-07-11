#!/usr/bin/env zsh

# Check requirements
if ! type git > /dev/null; then
    >&2 echo "Git not found"
    exit 1
fi

if [ ! -d ~/.oh-my-zsh ] ; then
    >&2 echo "Oh-my-zsh not found"
    exit 2
fi

# Clone project
cd ~
git clone git@github.com:nxu/dotfiles.git
cd dotfiles

# Create global .gitignore
cp sh/global-gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Create aliases file
cp sh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
. ~/.zshrc

# Create code directory if doesnt exist
mkdir ~/code 2> /dev/null || true

echo "Done. Run \`. ~/.zshrc\`"
