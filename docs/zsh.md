# zsh + Oh My Zsh + Powerlevel10k 설정

현대적인 쉘 환경을 위한 zsh 설정입니다.

## 📁 구조

```
zsh/
├── .zshrc          # 메인 zsh 설정 파일
├── .p10k.zsh       # Powerlevel10k 테마 설정
└── aliases.zsh     # 개인 별칭 모음
```

## ⚙️ 주요 설정

### 테마
- **Powerlevel10k**: 빠르고 강력한 프롬프트 테마
- Git 상태, 실행 시간, 디렉토리 정보 표시

### 플러그인 (Oh My Zsh)
- **git**: Git 명령어 단축키와 상태 표시
- **zsh-autosuggestions**: 명령어 자동 완성 제안

### 환경 설정
- **NVM**: Node.js 버전 관리
- **pnpm**: 빠른 패키지 매니저
- **Go**: Go 언어 개발 환경
- **fzf**: 퍼지 파인더 통합

## 🔧 개인 별칭 및 함수

### 에디터 별칭
```bash
alias vim="XDG_CONFIG_HOME=~/Documents/dotfiles/ nvim"  # Neovim을 dotfiles 설정으로
alias lg='lazygit'                                      # LazyGit 단축키
```

### 개발 도구
```bash
fe()  # fzf로 파일 선택 후 vim으로 편집
```

## 📦 추가 도구

### 구문 하이라이팅
- **zsh-syntax-highlighting**: 명령어 구문 강조
- 설치 위치: `/usr/local/share/zsh-syntax-highlighting/`

### 패키지 매니저
- **NVM**: Node.js 버전 관리 (`~/.nvm/`)
- **pnpm**: 빠른 npm 대안 (`~/Library/pnpm`)

### 개발 환경
- **Go**: `/usr/local/go/bin` 및 `GOPATH/bin`
- **Local bin**: `~/.local/bin/env`

## 🚀 특징

1. **빠른 프롬프트**: Powerlevel10k로 즉시 응답
2. **Git 통합**: 브랜치, 상태, 변경사항 실시간 표시
3. **자동 완성**: 히스토리 기반 명령어 제안
4. **구문 강조**: 명령어 색상 표시
5. **개발 환경**: Node.js, Go, pnpm 지원
6. **퍼지 파인더**: fzf로 빠른 파일 검색

## 📋 설치 방법

1. **Oh My Zsh 설치**
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. **Powerlevel10k 설치**
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

3. **zsh-autosuggestions 설치**
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

4. **설정 파일 링크**
```bash
ln -sf ~/Documents/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
```

5. **구문 하이라이팅 설치**
```bash
brew install zsh-syntax-highlighting
```

## 🎨 Powerlevel10k 설정

- **설정 명령**: `p10k configure`
- 프롬프트 스타일, 색상, 표시 요소 커스터마이징 가능
- `.p10k.zsh` 파일에 모든 설정 저장

## 🔥 주요 기능

### 명령어 제안
- 타이핑 시 회색 텍스트로 제안 표시
- `→` 키로 제안 수락

### Git 상태 표시
- 브랜치 이름
- 변경된 파일 수
- 스테이지된 파일 수
- 커밋 상태

### 실행 시간
- 긴 명령어 실행 시간 표시
- 성능 모니터링 도움

## 🛠️ 커스터마이징

- `.zshrc`: 기본 zsh 설정 수정
- `.p10k.zsh`: Powerlevel10k 테마 설정
- `aliases.zsh`: 개인 별칭 추가
- `$ZSH_CUSTOM`: Oh My Zsh 커스텀 설정