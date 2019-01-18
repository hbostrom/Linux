# Custom changes below

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

