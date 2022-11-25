function gitdiff 
  set root (git rev-parse --show-toplevel)
  set preview "git diff $argv --color=always -- {-1}"

  pushd $root
  git diff $argv --name-only | fzf -m --ansi --preview $preview
  popd
end
