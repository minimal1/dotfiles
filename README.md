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

## 주의사항

### 1. zinit

zinit 설치 후 설정을 추가할 지 말지 나오는데 그 부분은 해당 환경설정에 추가되어있기때문에 스킵하셔도 됩니다.


### 2. TPM

기존에 TPM 플러그인을 사용 중이라면, tpm plugin을 전부 지우고 재 설치하셔야합니다.  

### 3. Bat

테마 설정을 위해서 `bat cache --build` 명령어를 최초 한번 실행해주세요.  

### 4. Tmux

tmux 테마 설정을 위해서 [가이드](https://github.com/scottmckendry/cyberdream.nvim/tree/main/extras/tmux)를 따라주세요.

## 📝 참고사항

- GNU Stow를 사용하여 심볼릭 링크를 자동으로 생성합니다
- dotfiles 폴더에서 수정하면 바로 반영됩니다
- 모든 테마는 [cyberdream](https://github.com/scottmckendry/cyberdream.nvim)을 따릅니다.

