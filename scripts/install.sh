#!/bin/bash

# Dotfiles 설치 스크립트
# 사용법: ./install.sh [옵션]

# 현재 dotfiles 경로
DOTFILES_DIR="$HOME/Documents/dotfiles"

# 설치할 구성요소 플래그
INSTALL_ALL=true
INSTALL_ZSH=false
INSTALL_TMUX=false
INSTALL_NVIM=false
INSTALL_ALACRITTY=false
INTERACTIVE_MODE=false

# 설치 방식 플래그
USE_SYMLINK=true  # 기본값: 심볼릭 링크 사용 (GitHub 동기화 가능)

# 도움말 출력 함수
show_help() {
    echo "🚀 Dotfiles 설치 스크립트"
    echo ""
    echo "사용법: $0 [옵션]"
    echo ""
    echo "설치 구성요소:"
    echo "  -a, --all          모든 구성 설치 (기본값)"
    echo "  -z, --zsh          zsh 설정만 설치"
    echo "  -t, --tmux         tmux 설정만 설치"
    echo "  -n, --nvim         neovim 설정만 설치"
    echo "  -l, --alacritty    alacritty 설정만 설치"
    echo "  -i, --interactive  대화형 선택 모드"
    echo ""
    echo "설치 방식:"
    echo "  -L, --link         심볼릭 링크 연결 (기본값, GitHub 동기화 가능)"
    echo "  -C, --copy         설정 파일 복사 (독립적인 설정)"
    echo ""
    echo "기타:"
    echo "  -h, --help         이 도움말 출력"
    echo ""
    echo "예시:"
    echo "  $0                 # 모든 구성을 심볼릭 링크로 설치"
    echo "  $0 -z -t --link    # zsh와 tmux를 심볼릭 링크로 설치"
    echo "  $0 --copy          # 모든 구성을 복사로 설치"
    echo "  $0 --interactive   # 대화형 모드로 선택"
    echo ""
    echo "💡 심볼릭 링크 모드: dotfiles 폴더 수정 시 즉시 반영, GitHub pull로 자동 동기화"
    echo "📁 복사 모드: 독립적인 설정 파일, 수동으로 업데이트 필요"
}

# 명령행 인수 파싱
parse_args() {
    local specific_option=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -a|--all)
                INSTALL_ALL=true
                specific_option=false
                shift
                ;;
            -z|--zsh)
                INSTALL_ZSH=true
                specific_option=true
                shift
                ;;
            -t|--tmux)
                INSTALL_TMUX=true
                specific_option=true
                shift
                ;;
            -n|--nvim)
                INSTALL_NVIM=true
                specific_option=true
                shift
                ;;
            -l|--alacritty)
                INSTALL_ALACRITTY=true
                specific_option=true
                shift
                ;;
            -i|--interactive)
                INTERACTIVE_MODE=true
                specific_option=true
                shift
                ;;
            -L|--link)
                USE_SYMLINK=true
                shift
                ;;
            -C|--copy)
                USE_SYMLINK=false
                shift
                ;;
            *)
                echo "❌ 알 수 없는 옵션: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # 특정 옵션이 지정된 경우 ALL을 false로 설정
    if [ "$specific_option" = true ]; then
        INSTALL_ALL=false
    fi
}

# 기존 설정 파일 백업 및 설치 함수
backup_and_install() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "📋 백업: $target -> $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
    fi
    
    if [ "$USE_SYMLINK" = true ]; then
        echo "🔗 링크: $source -> $target"
        ln -sf "$source" "$target"
    else
        echo "📁 복사: $source -> $target"
        cp "$source" "$target"
    fi
}

# Alacritty 설정 함수
install_alacritty() {
    if [ -d "$DOTFILES_DIR/alacritty" ]; then
        echo "⚙️  Alacritty 설정 중..."
        mkdir -p ~/.config/alacritty
        backup_and_install "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
        backup_and_install "$DOTFILES_DIR/alacritty/cyberdream.toml" "$HOME/.config/alacritty/cyberdream.toml"
        echo "✅ Alacritty 설정 완료"
    else
        echo "⚠️  Alacritty 설정 디렉토리를 찾을 수 없습니다"
    fi
}

# tmux 설정 함수
install_tmux() {
    if [ -d "$DOTFILES_DIR/tmux" ]; then
        echo "⚙️  tmux 설정 중..."
        backup_and_install "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
        
        # tpm 자동 설치
        if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
            echo "📦 tpm(Tmux Plugin Manager) 설치 중..."
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
            echo "✅ tpm 설치 완료"
        else
            echo "ℹ️  tpm이 이미 설치되어 있습니다"
        fi
        
        # tmux 플러그인 자동 설치
        if [ -d "$HOME/.tmux/plugins/tpm" ]; then
            echo "🔌 tmux 플러그인 설치 중..."
            # tmux 세션이 실행 중이지 않아도 플러그인을 설치할 수 있도록 함
            ~/.tmux/plugins/tpm/bin/install_plugins
            echo "✅ tmux 플러그인 설치 완료"
        fi
        
        echo "✅ tmux 설정 완료"
    else
        echo "⚠️  tmux 설정 디렉토리를 찾을 수 없습니다"
    fi
}

# zsh 설정 함수
install_zsh() {
    if [ -d "$DOTFILES_DIR/zsh" ]; then
        echo "⚙️  zsh 설정 중..."
        backup_and_install "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
        backup_and_install "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
        echo "✅ zsh 설정 완료"
    else
        echo "⚠️  zsh 설정 디렉토리를 찾을 수 없습니다"
    fi
}

# Neovim 설정 함수
install_nvim() {
    if [ -d "$DOTFILES_DIR/nvim" ]; then
        echo "⚙️  Neovim 설정 중..."
        mkdir -p ~/.config
        if [ "$USE_SYMLINK" = true ]; then
            backup_and_install "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
        else
            echo "📁 복사: $DOTFILES_DIR/nvim -> $HOME/.config/nvim"
            if [ -e "$HOME/.config/nvim" ] || [ -L "$HOME/.config/nvim" ]; then
                echo "📋 백업: $HOME/.config/nvim -> $BACKUP_DIR/"
                mv "$HOME/.config/nvim" "$BACKUP_DIR/"
            fi
            cp -r "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
        fi
        echo "✅ Neovim 설정 완료"
    else
        echo "⚠️  Neovim 설정 디렉토리를 찾을 수 없습니다"
    fi
}

# 대화형 선택 메뉴
interactive_menu() {
    echo "🎯 설치할 구성요소를 선택하세요:"
    echo ""
    
    local choices=()
    local install_mode=""
    
    # 설치 방식 선택
    echo "📦 설치 방식:"
    echo "L) 심볼릭 링크 (GitHub 동기화 가능, 권장)"
    echo "C) 파일 복사 (독립적인 설정)"
    echo ""
    
    while true; do
        read -p "설치 방식을 선택하세요 (L/C): " install_mode
        case $install_mode in
            L|l)
                USE_SYMLINK=true
                echo "✅ 심볼릭 링크 모드 선택"
                break
                ;;
            C|c)
                USE_SYMLINK=false
                echo "✅ 파일 복사 모드 선택"
                break
                ;;
            *)
                echo "❌ L 또는 C를 입력해주세요."
                ;;
        esac
    done
    
    echo ""
    echo "🛠️ 구성요소 선택:"
    
    # 선택 가능한 항목들
    echo "1) Alacritty (터미널)"
    echo "2) tmux (멀티플렉서)"
    echo "3) zsh (쉘)"
    echo "4) Neovim (에디터)"
    echo "5) 모든 구성요소"
    echo "0) 취소"
    echo ""
    
    while true; do
        read -p "선택하세요 (1-5, 여러 선택시 공백으로 구분, 0은 취소): " -a choices
        
        if [ ${#choices[@]} -eq 0 ]; then
            echo "❌ 선택이 없습니다. 다시 선택해주세요."
            continue
        fi
        
        local valid=true
        for choice in "${choices[@]}"; do
            if [[ ! "$choice" =~ ^[0-5]$ ]]; then
                echo "❌ 잘못된 선택: $choice"
                valid=false
                break
            fi
        done
        
        if [ "$valid" = false ]; then
            continue
        fi
        
        # 선택 처리
        INSTALL_ALACRITTY=false
        INSTALL_TMUX=false
        INSTALL_ZSH=false
        INSTALL_NVIM=false
        INSTALL_ALL=false
        
        for choice in "${choices[@]}"; do
            case $choice in
                0)
                    echo "❌ 설치를 취소합니다."
                    exit 0
                    ;;
                1)
                    INSTALL_ALACRITTY=true
                    ;;
                2)
                    INSTALL_TMUX=true
                    ;;
                3)
                    INSTALL_ZSH=true
                    ;;
                4)
                    INSTALL_NVIM=true
                    ;;
                5)
                    INSTALL_ALL=true
                    ;;
            esac
        done
        
        break
    done
}

# 메인 실행 함수
main() {
    # 인수 파싱
    parse_args "$@"
    
    echo "🚀 Dotfiles 설치를 시작합니다..."
    
    # 백업 디렉토리 생성
    BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    echo "📦 백업 디렉토리: $BACKUP_DIR"
    
    # 대화형 모드
    if [ "$INTERACTIVE_MODE" = true ]; then
        interactive_menu
    fi
    
    echo ""
    if [ "$USE_SYMLINK" = true ]; then
        echo "⚙️  설정 파일 심볼릭 링크 생성 중... (GitHub 동기화 가능)"
    else
        echo "⚙️  설정 파일 복사 중... (독립적인 설정)"
    fi
    
    # 설치 실행
    if [ "$INSTALL_ALL" = true ]; then
        install_alacritty
        install_tmux
        install_zsh
        install_nvim
    else
        [ "$INSTALL_ALACRITTY" = true ] && install_alacritty
        [ "$INSTALL_TMUX" = true ] && install_tmux
        [ "$INSTALL_ZSH" = true ] && install_zsh
        [ "$INSTALL_NVIM" = true ] && install_nvim
    fi
    
    echo ""
    echo "🎉 Dotfiles 설치가 완료되었습니다!"
    echo ""
    echo "📋 다음 단계:"
    if [ "$INSTALL_ZSH" = true ] || [ "$INSTALL_ALL" = true ]; then
        echo "1. 새 터미널 세션을 시작하거나 'source ~/.zshrc' 실행"
    fi
    if [ "$INSTALL_TMUX" = true ] || [ "$INSTALL_ALL" = true ]; then
        echo "2. tmux 플러그인이 자동으로 설치되었습니다"
    fi
    if [ "$INSTALL_NVIM" = true ] || [ "$INSTALL_ALL" = true ]; then
        echo "3. Neovim 실행 시 LazyVim이 자동으로 플러그인을 설치합니다"
    fi
    echo ""
    if [ "$USE_SYMLINK" = true ]; then
        echo "🔗 심볼릭 링크로 설치됨: dotfiles 폴더 수정 시 즉시 반영"
        echo "🔄 동기화: 'git pull'로 최신 설정 자동 반영"
    else
        echo "📁 복사로 설치됨: 독립적인 설정 파일"
        echo "🔄 업데이트: 수동으로 스크립트 재실행 필요"
    fi
    echo ""
    echo "📂 백업된 기존 설정: $BACKUP_DIR"
}

# 스크립트 실행
main "$@"