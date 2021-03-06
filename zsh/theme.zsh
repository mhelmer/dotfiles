# From oh-my-zsh 
# github.com/robbyrussell/oh-my-zsh
#
ZSH_THEME="powerlevel9k/powerlevel9k"

zsh_prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%B%{%F{red}%}:(%b"
  [[ $RETVAL -eq 0 ]] && symbols+="%B%{%F{green}%}:)%b"
  [[ -n "$symbols" ]] && echo -n "$symbols"
}

POWERLEVEL9K_CUSTOM_STATUS="zsh_prompt_status"
POWERLEVEL9K_CUSTOM_STATUS_BACKGROUND="black"

zsh_prompt_npm_package() {
  local symbols
  symbols=()
  [[ -n $(find-first-up . -name package.json) ]] && symbols+=$(npm run --silent env -- echo -n '$npm_package_name')
  [[ -n "$symbols" ]] && echo -n "$symbols"
}

POWERLEVEL9K_CUSTOM_NPM_PACKAGE="zsh_prompt_npm_package"
POWERLEVEL9K_CUSTOM_NPM_PACKAGE_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_NPM_PACKAGE_FOREGROUND="green"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context battery dir virtualenv nvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_status root_indicator background_jobs history load time)

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{249}%}\$%{%F{default}%} "

POWERLEVEL9K_DIR_HOME_BACKGROUND='109'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='241'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='66'
POWERLEVEL9K_DIR_HOME_FOREGROUND='235'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='235'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='235'

# `git hub colors`
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='142'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='245'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='236'

# Load the theme
if [ "$ZSH_THEME" = "random" ]
then
  themes=($ZSH/zsh/themes/*zsh-theme)
  N=${#themes[@]}
  ((N=(RANDOM%N)+1))
  RANDOM_THEME=${themes[$N]}
  source "$RANDOM_THEME"
  echo "[oh-my-zsh] Random theme '$RANDOM_THEME' loaded..."
else
  if [ ! "$ZSH_THEME" = ""  ]
  then
    source "$ZSH/zsh/themes/$ZSH_THEME.zsh-theme"
  fi
fi
