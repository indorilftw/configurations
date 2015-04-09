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
plugins=(github git autojump extract macports osx brew gem pip rvm systemadmin hub)

export MAILPILE_HOME=$HOME/.mailpile

source $ZSH/oh-my-zsh.sh
#source /usr/local/bin/virtualenvwrapper.sh
setopt HIST_IGNORE_SPACE # Hide commands that start with space
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
unsetopt correct_all

# Customize to your needs...
export EDITOR=/usr/local/bin/vim
export PATH=~/.rvm/gems/ruby-1.9.3-p194/bin:/Users/indoril/.rvm/bin:/usr/local/bin:/usr/bin:/sw/sbin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/X11/bin:/opt/local/bin:/opt/local/lib/swipl-5.10.4/bin/i386-darwin10.7.0:/usr/X11R6/bin:/sw/bin:~/bins/pypy-2.2.1/bin:~/Scripts:~/Source/checker:/sw/bin:/Library/Apache/ant/bin:~/bins:/usr/local/sbin:~/Library/Haskell/bin:~/bins/pypy3-2.3.1/bin:/Library/Frameworks/Python.framework/Versions/3.3/bin
#/Library/Frameworks/Python.framework/Versions/2.7/bin:/Library/Frameworks/Python.framework/Versions/3.3/bin:$PATH

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
alias git='hub'
alias latex='latexmk -xelatex -8bit -shell-escape -pvc --synctex=1'
alias mailpile='/Applications/Mailpile.app/Contents/Resources/Mailpile/packages/macosx/mailpile-osx.sh ; exit;'
# Upgrade pip packages
alias pipup='sudo pip install --upgrade $(yolk -U | cut -d" " -f 2)'
# Backup dotfiles (NOT keys)
alias dotback='tar czf ~/dotfiles/`date +"%Y-%m-%d"`.tar.gz .bash_profile .bashrc .config/hub .config/mpv .electrum/wallets .electrum/config .gemrc .irbrc .irssi .kamakirc .local .macports .mutt/gpg.rc .mutt/mutt-colors-solarized .mutt/passwords .muttrc .oh-my-zsh .rvmrc .vim .vimrc .wgetrc .zlogin .zprofile .zsh-update .zsh_history .zshrc'

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
# PDF Shrink
pdfshrink() {gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dPDFSETTINGS=/ebook -sOutputFile=${1:0:(-4)}-reduced.pdf $1}
# VirtualEnv Activate
venv() { export VIRTUAL_ENV_DISABLE_PROMPT='1'; source ./$1/bin/activate }
# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Welcome message
#echo -en '\033[0;34m'; figlet Indoril; echo -en '\033[0m'

findcpu(){
    sysctl -n machdep.cpu.brand_string
}

findkernelversion(){
    uname -mrs
}

mem=$(sysctl -n hw.memsize)

echo " `tput sgr0`
              .,-:;//;:=,                             `tput smso`  Aperture Science Terminal Info             `tput rmso`
          . :H@@@MM@M#H/.,+%;,
       ,/X+ +M@@M@MM%=,-%HMMM@X/,                       $(findcpu)
     -+@MM; SM@@MH+-,;XMMMM@MMMM@+-                     `tput bold`RAM memory:`tput sgr0` $[$mem/1024/1024] MB
    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.                   `tput bold`Kernel:`tput sgr0` $(findkernelversion)
  ,%MM@@MH ,@%=            .---=-=:=,.
  =@#@@@MX .,              -%HXSS%%%+;
 =-./@M@MS                  .;@MMMM@MM:               `tput smso`  GLaDOS Monitor                             `tput rmso`
 X@/ -SMM/                    .+MM@@@MS                                             `tput setaf 2`  ____ `tput sgr0`
,@M@H: :@:                    . =X#@@@@-                `tput bold`System status:`tput sgr0`  `tput setaf 2`On           /   /`tput sgr0`
,@@@MMX, .                    /H- ;@M@M=                `tput bold`Voice status:`tput sgr0`   `tput setaf 2`On     ___  /   /`tput sgr0`
.H@@@@M@+,                    %MM+..%#S.                                       `tput setaf 2`\  \/   /`tput sgr0`
 /MMMM@MMH/.                  XM@MH; =;                 `tput bold`Damaged:       `tput sgr0` `tput setaf 2`No      `tput setaf 2`\     /`tput sgr0`
  /%+%SXHH@S=              , .H@@@@MX,                  `tput bold`Malfunctioning:`tput sgr0` `tput setaf 3`Maybe    `tput setaf 2`\___/`tput sgr0`
   .=--------.           -%H.,@@@@@MX,
    .%MM@@@HHHXXSSS%+- .:MMX =M@@MM%.
     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=                   `tput smso`  Date and Time                              `tput rmso`
       =%@M@M#@S-.=S@MM@@@M; %M%=
         ':+S+-,/H#MMMMMMM@= ='                         `tput bold`Date:`tput sgr0` $(date +"%A %d %B %Y")
               =++%%%%+/:-.                             `tput bold`Time:`tput sgr0` $(date +"%T")
"

icalBuddy -f -sd -npn -nc -ps "/  /"  -eep "notes" -ec 65879377-2FB0-49DD-8B6F-3C29BB87BB75 eventsToday+1 2>/dev/null

#Random quote on login!
echo '\nRemember:'
f=~/quotes.txt; n=$(expr $RANDOM \* `cat $f | wc -l` \/ 32768 + 1); head -n $n $f | tail -1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
