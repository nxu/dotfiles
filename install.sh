#!/usr/bin/env zsh

# Change working directory to the script directory
cd "${0%/*}"

# Prompt to install oh-my-zsh
echo "Make sure to install git and Oh-My-Zsh first. Press enter to continue...";
read -k1 -s

# Create global .gitignore
cp sh/global-gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# Create aliases file
cp sh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
. ~/.zshrc

# Create code directory if doesnt exist
mkdir ~/code 2> /dev/null || true

echo "Done. Run \`. ~/.zshrc\`"
