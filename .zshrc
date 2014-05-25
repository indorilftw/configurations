# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="indoril"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(github git autojump extract macports osx brew gem pip)

export BAT_CHARGE='batcharge.py'

source $ZSH/oh-my-zsh.sh
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
setopt HIST_IGNORE_SPACE # Hide commands that start with space
unsetopt correct_all

# Customize to your needs...
export EDITOR=/usr/local/bin/subl
export PATH=~/.rvm/gems/ruby-1.9.3-p194/bin:/Users/indoril/.rvm/bin:/usr/local/bin:/usr/bin:/sw/sbin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/X11/bin:/opt/local/bin:/opt/local/lib/swipl-5.10.4/bin/i386-darwin10.7.0::/usr/X11R6/bin:/sw/bin:~/bins/pypy-2.2.1/bin:~/Scripts:~/Source/checker:/sw/bin:/Library/Apache/ant/bin:~/bins:/usr/local/sbin:~/Library/Haskell/bin:~/bins/pypy3-2.1/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Library/Frameworks/Python.framework/Versions/3.3/bin:$PATH

#Custom aliases
alias ping='ping -c 4'
#alias grep='grep --color=auto'
alias grep='/opt/local/bin/grep --color=auto'
alias fgrep='fgrep --color=auto'
alias l='ls -CF'
alias la='ls -AF'
alias lla='ls -la'
alias x='exit'
alias c='clear'
alias cd..='cd ..'
alias starwars='telnet towel.blinkenlights.nl'
alias nyan='nc -v miku.acm.uiuc.edu 23'
alias folders="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
#alias sing='osascript -e "say "Dum dum dum dum dum dum dum he he he ho ho ho fa lah lah lah lah lah lah fa lah full hoo hoo hoo" using "Cellos""'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ftpstart='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias ftpstop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
alias music='mplayer http://83.212.97.206:8000/radio.ogg'
alias s='source ~/.zshrc'
#alias git='hub'
alias latex='latexmk -xelatex -8bit -shell-escape -pvc --synctex=1'

#Flush DNS
alias flushdns='dscacheutil -flushcache'

#Parallels Desktop daemon
alias parstart='sudo launchctl start com.parallels.desktop.launchdaemon'
alias parstop='sudo launchctl stop com.parallels.desktop.launchdaemon'

# Calculator
calc () { awk "BEGIN{ print $* }" ;}
# Open in PathFinder
pf () { open -a "Path Finder.app" $1; }
# Mount from alfred
malf() {sshfs alfred: ~/alfred;}
# mkdir and cd
mkcd() {mkdir -p "$1" && cd "$1";}
# Play Music
mplay() {find ~/Music -type d -depth 1 -name "*$1*" -exec sh -c 'open -a vlc "$0"/*.mp3' {} \; 2>/dev/null }
mplayart() {find ~/Music -type d -depth 1 -name "*$1*" -exec sh -c 'open -a vlc "$0"/*/*.mp3' {} \; 2>/dev/null }
# Session restore
sessionrestore() {perl -lne '$\ = qq{\n\n}; print for /url":"\K[^"]+/g' $1}
# PDF Merge
pdfmerge() {gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=mergedPDF.pdf $@}

#Welcome message
echo -en '\033[0;34m'; figlet Indoril; echo -en '\033[0m'
#Random quote on login!
echo 'Remember:'
f=~/quotes.txt; n=$(expr $RANDOM \* `cat $f | wc -l` \/ 32768 + 1); head -n $n $f | tail -1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
