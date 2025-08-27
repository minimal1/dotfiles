# My Dotfiles

개인 개발 환경 설정 파일들을 관리하는 레포지토리입니다.

## 📁 구조

```
dotfiles/
├── alacritty/               # Alacritty 터미널 설정
│   └── alacritty.toml
├── tmux/                    # tmux 설정
│   ├── .tmux.conf
│   └── plugins.txt
├── zsh/                     # zsh + Oh My Zsh + Powerlevel10k
│   ├── .zshrc
│   ├── .p10k.zsh
│   └── aliases.zsh
├── nvim/                    # Neovim
│   └── config/
│       ├── init.lua
│       └── lua/
├── git/                     # git 설정
│   ├── .gitconfig
│   └── .gitignore_global
├── scripts/                 # 설치/관리 스크립트
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
ln -sf ~/Documents/dotfiles/nvim/config ~/.config/nvim

# git 설정
ln -sf ~/Documents/dotfiles/git/.gitconfig ~/.gitconfig
```

## 🔧 주요 설정

### Alacritty
- GPU 가속 터미널
- 폰트 및 테마 설정
- 키보드 단축키 커스터마이징

### tmux
- 기본 prefix key 설정
- 마우스 지원 활성화
- 세션 관리 최적화
- 플러그인 관리

### zsh + Oh My Zsh + Powerlevel10k
- 강력한 프롬프트 테마 (Powerlevel10k)
- 유용한 플러그인들
- 개발 환경 PATH 설정
- 커스텀 aliases

### Neovim + LazyVim
- 모던한 Neovim 설정
- LSP 서버 자동 설정
- 개발용 플러그인 패키지
- 키바인딩 최적화

### git
- 글로벌 사용자 정보
- 유용한 alias들
- 커밋 템플릿

## 📋 사용 중인 도구들

- **Terminal**: Alacritty
- **Terminal Multiplexer**: tmux
- **Shell**: zsh + Oh My Zsh + Powerlevel10k
- **Editor**: Neovim + LazyVim
- **Version Control**: git

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
- 각 도구별 상세 설정은 해당 폴더의 파일을 참고하세요

## ⚠️ 주의사항

- 설치 스크립트 실행 전 기존 설정을 백업해주세요
- Oh My Zsh와 Powerlevel10k가 미리 설치되어 있어야 합니다
- LazyVim은 첫 실행 시 자동으로 플러그인을 설치합니다
- 개인 정보(이메일, 토큰 등)가 포함된 설정은 별도 관리를 권장합니다

## 📦 필수 의존성

설치하기 전에 다음 도구들이 설치되어 있어야 합니다:

```bash
# Oh My Zsh 설치
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k 설치
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# LazyVim (Neovim 0.9.0+ 필요)
# 설정 파일 링크 후 nvim 실행하면 자동 설치됩니다
```
