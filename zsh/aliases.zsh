# 개인 별칭 모음

# Editor aliases
alias vim="XDG_CONFIG_HOME=~/Documents/dotfiles/  nvim"
alias lg='lazygit'

# Development tools
alias fe='fe_function'  # fzf file edit function

# fzf 파일 편집 함수
fe_function() {
  local file=$(fzf --preview 'cat {}')
  [ -n "$file" ] && vim "$file"
}