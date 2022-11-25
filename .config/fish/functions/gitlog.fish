function gitlog
  gitdiff (git log --oneline | fzf | cut -d' ' -f1)
end
