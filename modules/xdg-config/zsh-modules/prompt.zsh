autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b'

precmd() {
	vcs_info

	if [[ ! -z $vcs_info_msg_0_ ]] 
	then
		PS1_GIT=" (%F{red}${vcs_info_msg_0_}%f)"
	else
		PS1_GIT=""
	fi
}

setopt prompt_subst

PS1_NL=$'\n'
PS1_ID="%B%F{red}%n%F{blue}@%m%f%b"
PS1_PATH="%F{green}%~%f"
PS1_SYMBOL="->"

PS1='${PS1_ID}: ${PS1_PATH}${PS1_GIT}${PS1_NL}${PS1_SYMBOL} '
