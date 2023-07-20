# Laravel
alias art='php artisan'
alias t='php artisan test'
alias pt='php artisan test --parallel'
alias cs='./vendor/bin/phpcs'
alias pint='./vendor/bin/pint'
alias pd='./vendor/bin/pint --dirty'
alias pstan='./vendor/bin/phpstan analyse -c phpstan.neon'
alias gbuild='npm run build && git add . && git commit -m "📦 Build assets"'

# Git
alias nah='git reset --hard;git clean -df'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# General
alias c='cd ~/code'
alias copykey='command cat ~/.ssh/id_rsa.pub | pbcopy'
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="curl ifconfig.me/ip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Restart touch bar
alias touchbar="killall ControlStrip"