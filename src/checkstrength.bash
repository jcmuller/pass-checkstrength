#!/bin/bash -x

cmd_checkstrength() {
	local passfile result
	echo "Weak passwords found for:"
	while read -r -d "" passfile; do
		result="$($GPG -d "${GPG_OPTS[@]}" "$passfile" | head -1 | cracklib-check | grep -Fv ': OK')"
		[[ $? -ne 0 ]] && continue
    result="${result//[^:]*: /}"
		passfile="${passfile%.gpg}"
		passfile="${passfile#$PREFIX/}"
		local passfile_dir="${passfile%/*}/"
		[[ $passfile_dir == "${passfile}/" ]] && passfile_dir=""
		passfile="${passfile##*/}"
		printf "\e[94m%s\e[1m%s\e[0m: %s\n" "$passfile_dir" "$passfile" "$result"
	done < <(find -L "$PREFIX" -path '*/.git' -prune -o -iname '*.gpg' -print0 | sort)
}

cmd_checkstrength
