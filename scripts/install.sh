#!/bin/bash

# Dotfiles 설치 스크립트
echo "🚀 Dotfiles 설치를 시작합니다..."

# 현재 dotfiles 경로
DOTFILES_DIR="$HOME/Documents/dotfiles"

# 백업 디렉토리 생성
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "📦 백업 디렉토리: $BACKUP_DIR"

# 기존 설정 파일 백업 함수
backup_and_link() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "📋 백업: $target -> $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    echo "🔗 링크: $source -> $target"
    ln -sf "$source" "$target"
}

# 설정 디렉토리 생성
mkdir -p ~/.config/alacritty

echo "⚙️  설정 파일 링크 생성 중..."

# Alacritty 설정
if [ -d "$DOTFILES_DIR/alacritty" ]; then
    backup_and_link "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    backup_and_link "$DOTFILES_DIR/alacritty/cyberdream.toml" "$HOME/.config/alacritty/cyberdream.toml"
    echo "✅ Alacritty 설정 완료"
fi

# tmux 설정
if [ -d "$DOTFILES_DIR/tmux" ]; then
    backup_and_link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
    echo "✅ tmux 설정 완료"
fi

# zsh 설정
if [ -d "$DOTFILES_DIR/zsh" ]; then
    backup_and_link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    backup_and_link "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    echo "✅ zsh 설정 완료"
fi

# Neovim 설정
if [ -d "$DOTFILES_DIR/nvim" ]; then
    mkdir -p ~/.config
    backup_and_link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
    echo "✅ Neovim 설정 완료"
fi

echo ""
echo "🎉 Dotfiles 설치가 완료되었습니다!"
echo ""
echo "📋 다음 단계:"
echo "1. 새 터미널 세션을 시작하거나 'source ~/.zshrc' 실행"
echo "2. tmux에서 'Ctrl-s + I'로 플러그인 설치"
echo "3. Neovim 실행 시 LazyVim이 자동으로 플러그인을 설치합니다"
echo ""
echo "📂 백업된 기존 설정: $BACKUP_DIR"