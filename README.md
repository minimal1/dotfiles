# My Dotfiles

개인 개발 환경 설정 파일들을 관리하는 레포지토리입니다.

## 🚀 설치 방법 (GNU Stow 사용)

### 1. 필수 요구사항
설치하기 전에 다음 도구들이 설치되어 있어야 합니다:

- [zinit](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#automatic)
- stow
- tmux
- tpm
- alacritty
- bat
- fzf
- fd
- eza
- zoxide
- delta
- lazy-git
- neovim
- d2coding nerd font

### 2.설정 적용
설정 적용하려면:

```bash
# tmux 설정
stow tmux

# zsh 설정
stow zsh

# Alacritty, Bat, Neovim 설정
stow configurations
```
## 🔄 업데이트

새로운 머신에서 설정을 동기화하려면:

```bash
git clone [repository-url] ~/dotfiles
cd ~/dotfiles
```

## 📝 참고사항

- GNU Stow를 사용하여 심볼릭 링크를 자동으로 생성합니다
- dotfiles 폴더에서 수정하면 바로 반영됩니다
- 모든 테마는 [cyberdream](https://github.com/scottmckendry/cyberdream.nvim)을 따릅니다.

