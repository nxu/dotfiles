# Laravel
alias art='php artisan'
alias t='php artisan test'
alias pt='php artisan test --parallel'
alias pu='./vendor/bin/phpunit'
alias cs='./vendor/bin/phpcs'
alias pint='./vendor/bin/pint'
alias pd='./vendor/bin/pint --dirty'
alias pstan='./vendor/bin/phpstan analyse -c phpstan.neon --memory-limit 1G'
alias gbuild='npm run build && git add . && git commit -m "📦 Build assets"'
alias pest='./vendor/bin/pest'
alias dep='./vendor/bin/dep'
alias ppp='pd && pest --parallel && pstan'
alias pppp='pd && pest --parallel && pstan && npm run prettier'
alias gdep='/Users/nxu/.composer/vendor/bin/dep'

# Git
alias nah='git reset --hard;git clean -df'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias garchive='(){ git archive -o update.zip HEAD $(git diff --name-only $1 HEAD --diff-filter=ACMRTUXB) ;}'

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
alias touchbar="sudo pkill TouchBarServer && sudo killall ControlStrip"

# aws (CloudFlare r2)
alias aws='aws --endpoint-url https://7fc55ceb847a4e089064a9e2022a2808.eu.r2.cloudflarestorage.com'

# Music
alias flac2mp3='find . -name "*.flac" -exec ffmpeg -i {} -ab 320k -map_metadata 0 -id3v2_version 3 {file:r}.mp3 \;'
alias mp3ize='(){ ffmpeg -i $1 -codec:a libmp3lame -b:a 320k $1.mp3;}'

# Misc
alias geoavg="pbpaste | grep -oE '([0-9,]+)' | sed 's/,//g' | datamash mean 1"
alias geocp="pbpaste | grep -oE '([0-9,]+)' | sed 's/,//g' | tac | pbcopy"

