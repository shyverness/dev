alias rs="nvim"
alias mutt="neomutt"

alias ff="fastfetch"

alias calendar="cal -n 3"

alias ls="eza --no-quotes -s type -a"

alias tg="tmux-goway"
alias t="tmux"
alias ta="tmux a"

alias q="exit"
alias wq="exit"
alias ..="cd .."
alias rel="omz reload"

alias gnp="git --no-pager"
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gd="git diff"
alias gc="git commit"
alias gcm="git commit -m"
alias gac="git commit -a"
alias gacm="git commit -am"
alias gpush="git push"
alias gpull="git pull"
alias gl="git log --graph --stat"
alias glp="git log --graph --stat -p"
alias glw="git log --oneline --graph --decorate --all"

alias rg="rg -i --color=always"

alias maple="~/maple2022/bin/xmaple"
alias py="python"

e() {
	if (( $# != 0 )); then
		>&2 echo "Illegal number of parameters"
	else
		exit
	fi
}

# ed ()
# {
# 	command rlwrap -n -H "$HOME/.ed_history" ed "$@" -E
# }

yt-extract-audio() {
	~/Desktop/repos/yt-dlp/yt-dlp.sh "$1" -x --audio-format mp3
}

open() {
	xdg-open $1 >/dev/null 2>&1 &
	disown
}

rc() {
	local tmp="$(mktemp -t "ranger-cwd.XXXXXX")" cwd
	ranger --choosedir="$tmp" "$@"

	IFS= read -r cwd <"$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && cd -- "$cwd"
	rm -f -- "$tmp"
}

eday() {
	export LANG=fr_CA.UTF-8
	currentDay="$HOME/Desktop/notes/edit/j/$(date +%Y.%m.%d).txt"
	if [ -e "$currentDay" ]; then
		echo "File [$currentDay] exists"
	else
		touch "$currentDay"
		echo "$(date +%Y.%m.%d)" > "$currentDay"
	fi
	ed "$currentDay"
}
