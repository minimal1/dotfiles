#!/bin/bash

# Dotfiles 백업 스크립트
echo "💾 현재 시스템 설정을 dotfiles로 백업합니다..."

# 현재 dotfiles 경로
DOTFILES_DIR="$HOME/Documents/dotfiles"

# 백업 함수
backup_file() {
    local source="$1"
    local target="$2"
    
    if [ -e "$source" ]; then
        echo "📋 백업: $source -> $target"
        cp "$source" "$target"
    else
        echo "⚠️  파일 없음: $source"
    fi
}

echo "⚙️  설정 파일 백업 중..."

# Alacritty 설정 백업
if [ -e "$HOME/.config/alacritty/alacritty.toml" ]; then
    mkdir -p "$DOTFILES_DIR/alacritty"
    backup_file "$HOME/.config/alacritty/alacritty.toml" "$DOTFILES_DIR/alacritty/alacritty.toml"
    backup_file "$HOME/.config/alacritty/cyberdream.toml" "$DOTFILES_DIR/alacritty/cyberdream.toml"
    echo "✅ Alacritty 설정 백업 완료"
fi

# tmux 설정 백업
if [ -e "$HOME/.tmux.conf" ]; then
    mkdir -p "$DOTFILES_DIR/tmux"
    backup_file "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"
    echo "✅ tmux 설정 백업 완료"
fi

# zsh 설정 백업
if [ -e "$HOME/.zshrc" ]; then
    mkdir -p "$DOTFILES_DIR/zsh"
    backup_file "$HOME/.zshrc" "$DOTFILES_DIR/zsh/.zshrc"
    backup_file "$HOME/.p10k.zsh" "$DOTFILES_DIR/zsh/.p10k.zsh"
    echo "✅ zsh 설정 백업 완료"
fi

# Neovim 설정은 이미 dotfiles에 있으므로 스킵
echo "ℹ️  Neovim 설정은 이미 dotfiles에 있습니다."

echo ""
echo "🎉 백업이 완료되었습니다!"
echo ""
echo "📋 다음 단계:"
echo "1. git add . && git commit -m 'update: 시스템 설정 백업'"
echo "2. git push로 원격 저장소에 백업"