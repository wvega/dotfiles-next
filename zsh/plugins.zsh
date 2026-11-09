#!/usr/bin/env zsh

# use the Up and Down arrow keys to traverse history based on what has already been entered at the prompt
# https://unix.stackexchange.com/a/97844
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# load autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" --no-use  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Activate mise
eval "$(mise activate zsh)"

# load rbenv
eval "$(rbenv init -)"

# load pyenv
eval "$(pyenv init -)"

#### Direnv hooks ####
eval "$(direnv hook zsh)"
#### END Direnv hooks ###

# pnpm
export PNPM_HOME="/Users/wvega/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## Claude Code through Bedrock
#export CLAUDE_CODE_USE_BEDROCK=1
#export ANTHROPIC_MODEL='us.anthropic.claude-opus-5'
#export CLAUDE_CODE_SUBAGENT_MODEL='us.anthropic.claude-sonnet-5'
#export ANTHROPIC_DEFAULT_HAIKU_MODEL='us.anthropic.claude-haiku-4-5-20251001-v1:0'

# Git
export GIT_AUTHOR_NAME=$(git config get user.name)
export GIT_AUTHOR_EMAIL=$(git config get user.email)
