#!/bin/bash

curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

cat << 'EOF' >> ~/.bashrc
source ~/.git-prompt.sh
function prompt() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]; then
     proj_dir=$(git rev-parse --show-toplevel)
     project=$(git rev-parse --show-toplevel | rev | cut -d/ -f1 | rev)
     rel_path=${PWD#$proj_dir}
    export PS1="\[\e[38;5;142m\]//${project}${rel_path}\[\e[m\]\$(__git_ps1 '(\[\e[0;32m\]%s\[\e[m\])')\$ "
  else
    export PS1='\[\e[38;5;142m\]\w\[\033[00m\]\$ '
  fi
}
PROMPT_COMMAND=prompt
EOF
