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

# Create global .gitignore
cp sh/global-gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Create aliases file
cp sh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# Create path file
cp sh/paths.zsh ~/.oh-my-zsh/custom/paths.zsh

# Create code directory if doesnt exist
mkdir ~/code 2> /dev/null || true

# Add chmod+x to scripts
chmod +x ~/dotfiles/bin/nxu-backup

echo "Done. Run \`. ~/.zshrc\`"
