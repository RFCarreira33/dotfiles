if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias nvimf='nvim $(fzf)'
alias cdf='cd $(fzf | xargs -I{} dirname {} | head -n 1)'
alias ls='eza -l --git --icons=always --group-directories-first'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
