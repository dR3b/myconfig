# Include prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Disable autocorrecting entered commands
unsetopt CORRECT


# Key timeout
export KEYTIMEOUT=1


# GitHub Hub CLI Config
export GITHUB_USER='fa7ad'
export GITHUB_PASSWORD=$(base64 -d <<< ${MYGITPASS})


# mpv +history
alias mpv='mpvh'
alias mpa='mpv --no-vid'

# look up aliases
function als {
  alias | grep "$1" | less
}

# git ignore
function gign {
  echo "$1" >>! .gitignore
}

# update myconfig
function update_config {
    current=$(pwd)
    cd "${ZDOTDIR:-$HOME}/myconfig"
    git pull -X theirs
    rsync -ar .config/ "${ZDOTDIR:-$HOME}/.config/"
    cd $current
}

export PATH="$PATH:node_modules/.bin"
