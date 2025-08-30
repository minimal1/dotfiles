# My Dotfiles

개인 개발 환경 설정 파일들을 관리하는 레포지토리입니다.

## 📁 구조

```
dotfiles/
├── docs/                    # 각 도구별 상세 설정 문서
│   ├── index.md
│   ├── nvim.md
│   ├── alacritty.md
│   ├── tmux.md
│   └── zsh.md
├── nvim/                    # Neovim + LazyVim 설정
│   ├── init.lua
│   └── lua/
├── alacritty/               # Alacritty 터미널 설정
│   ├── alacritty.toml
│   └── cyberdream.toml
├── tmux/                    # tmux 멀티플렉서 설정
│   ├── .tmux.conf
│   └── plugins.txt
├── zsh/                     # zsh + Oh My Zsh + Powerlevel10k
│   ├── .zshrc
│   ├── .p10k.zsh
│   └── aliases.zsh
├── scripts/                 # 설치/백업 스크립트
│   ├── install.sh
│   └── backup.sh
└── README.md
```

## 🚀 설치 방법

### 자동 설치
```bash
cd ~/Documents/dotfiles
chmod +x scripts/install.sh
./scripts/install.sh
```

### 수동 설치
개별 설정 파일을 수동으로 링크하려면:

```bash
# Alacritty 설정
ln -sf ~/Documents/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

# tmux 설정
ln -sf ~/Documents/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# zsh 설정 (Oh My Zsh가 설치되어 있어야 함)
ln -sf ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# Neovim 설정 (LazyVim)
ln -sf ~/Documents/dotfiles/nvim ~/.config/nvim
```

## 🔧 주요 설정

각 도구별 상세 설정은 [`docs/`](docs/) 폴더의 문서를 참고하세요:

- **[Alacritty](docs/alacritty.md)**: GPU 가속 터미널, D2Coding 폰트, Cyberdream 테마
- **[tmux](docs/tmux.md)**: Ctrl-s prefix, Smart-splits 연동, Tokyo Night 테마  
- **[zsh](docs/zsh.md)**: Oh My Zsh + Powerlevel10k, 자동완성, 구문 하이라이팅
- **[Neovim](docs/nvim.md)**: Lazy.nvim + 27개 플러그인, LSP 통합, 모던 UI

## 📋 사용 중인 도구들

- **Terminal**: Alacritty
- **Terminal Multiplexer**: tmux  
- **Shell**: zsh + Oh My Zsh + Powerlevel10k
- **Editor**: Neovim + LazyVim

## 🔄 업데이트

새로운 머신에서 설정을 동기화하려면:

```bash
git clone [repository-url] ~/Documents/dotfiles
cd ~/Documents/dotfiles
./scripts/install.sh
```

## 📝 참고사항

- 설치 전 기존 설정 파일들은 자동으로 백업됩니다
- 심볼릭 링크를 사용하므로 dotfiles 폴더에서 수정하면 바로 반영됩니다
- 각 도구별 상세 설정은 [`docs/`](docs/) 폴더의 문서를 참고하세요

## ⚠️ 주의사항

- 설치 스크립트 실행 전 기존 설정을 백업해주세요
- Oh My Zsh와 Powerlevel10k가 미리 설치되어 있어야 합니다
- LazyVim은 첫 실행 시 자동으로 플러그인을 설치합니다

## 📦 필수 의존성

설치하기 전에 다음 도구들이 설치되어 있어야 합니다:

```bash
# Oh My Zsh 설치
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k 설치
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 추가 도구들
brew install tmux alacritty zsh-syntax-highlighting
brew install --cask font-d2coding-nerd-font

# LazyVim (Neovim 0.9.0+ 필요)
# 설정 파일 링크 후 nvim 실행하면 자동 설치됩니다
```
