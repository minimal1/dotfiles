# tmux 설정

터미널 멀티플렉서 tmux의 설정과 플러그인 구성입니다.

## 📁 구조

```
tmux/
├── .tmux.conf      # 메인 설정 파일
└── plugins.txt     # 플러그인 목록 및 설치 방법
```

## ⚙️ 주요 설정

### Prefix 키 변경
- **기본**: `Ctrl-b` → **변경**: `Ctrl-s`
- 더 접근하기 쉬운 키 조합으로 변경

### 창 분할 단축키
- `prefix + |`: 세로 분할
- `prefix + _`: 가로 분할
- `prefix + m`: 현재 패널 최대화/최소화

### 설정 리로드
- `prefix + r`: 설정 파일 다시 로드

### 기본 옵션
- **마우스 지원**: 활성화
- **복사 모드**: Vi 키바인딩
- **ESC 지연**: 10ms (Neovim 최적화)
- **상태바 위치**: 상단

## 🔌 설치된 플러그인

### 필수 플러그인
- **tpm** - Tmux Plugin Manager (플러그인 관리자)

### 내비게이션 플러그인
- **smart-splits.nvim** - Neovim과 tmux 간 스마트 창 이동
  - `Ctrl-h/j/k/l`: 창 간 이동
  - `Alt-h/j/k/l`: 창 크기 조절 (3단위씩)
- **tmux-pain-control** - 창 분할 및 이동 개선

### 기능 개선 플러그인
- **tmux-sensible** - 합리적인 기본 설정 모음
- **tmux-logging** - 세션 로깅 기능

### 테마 플러그인
- **tmux-tokyo-night** - Tokyo Night 테마
  - 상단 상태바 배치
  - 투명 배경 지원
  - datetime, playerctl, battery 위젯

## 🎨 테마 설정 (Tokyo Night)

```toml
theme_variation = 'night'
theme_transparent_status_bar = true
theme_plugins = 'datetime,playerctl,battery'
```

- **변형**: Night 모드
- **투명 배경**: 활성화
- **플러그인**: 날짜시간, 미디어 컨트롤, 배터리 표시

## 🔥 주요 키바인딩

### 기본 조작
- `Ctrl-s`: Prefix 키
- `Ctrl-s + |`: 세로 분할
- `Ctrl-s + _`: 가로 분할
- `Ctrl-s + r`: 설정 리로드
- `Ctrl-s + m`: 패널 최대화/최소화

### Smart Splits (Neovim 연동)
- `Ctrl-h/j/k/l`: 창/패널 간 이동
- `Alt-h/j/k/l`: 패널 크기 조절

### 플러그인 관리
- `Ctrl-s + I`: 플러그인 설치
- `Ctrl-s + U`: 플러그인 업데이트
- `Ctrl-s + Alt-u`: 플러그인 제거

## 📋 설치 방법

1. **tmux 설치**
```bash
brew install tmux
```

2. **설정 파일 링크**
```bash
ln -sf ~/Documents/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

3. **TPM 설치**
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

4. **플러그인 설치**
```bash
# tmux 실행 후
tmux
# Ctrl-s + I 눌러서 플러그인 설치
```

## 🚀 특징

1. **Neovim 통합**: smart-splits로 seamless 창 이동
2. **모던 테마**: Tokyo Night 다크 테마
3. **마우스 지원**: 클릭으로 패널 전환 및 크기 조절
4. **상단 상태바**: 시간, 배터리, 미디어 정보 표시
5. **빠른 응답**: ESC 지연 최소화
6. **플러그인 생태계**: TPM으로 쉬운 플러그인 관리

## 🛠️ 커스터마이징

- `.tmux.conf`: 메인 설정 수정
- 플러그인 추가: `set -g @plugin 'plugin-name'` 후 `prefix + I`
- 테마 변경: `@theme_variation` 값 수정
- 키바인딩 추가: `bind` 명령어 사용