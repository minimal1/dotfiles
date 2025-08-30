# Alacritty 설정

GPU 가속 터미널 에뮬레이터 Alacritty의 설정입니다.

## 📁 구조

```
alacritty/
├── alacritty.toml      # 메인 설정 파일
└── cyberdream.toml     # 사이버드림 컬러 테마
```

## ⚙️ 주요 설정

### 폰트 설정
- **폰트**: D2CodingLigature Nerd Font Regular
- **크기**: 20pt
- **특징**: 한글 지원, 리가처 지원, Nerd Font 아이콘

### 창 설정
- **불투명도**: 0.9 (10% 투명)
- **시작 모드**: SimpleFullscreen (전체화면)
- **패딩**: 좌우 5px, 상하 0px
- **Option 키**: 양쪽 Option 키를 Alt로 사용

### 컬러 테마 (Cyberdream)
- **배경색**: `#16181a` (다크 그레이)
- **전경색**: `#ffffff` (화이트)
- **테마**: cyberdream.toml에서 임포트

#### 컬러 팔레트
**일반 컬러:**
- Black: `#16181a`
- Red: `#ff6e5e`
- Green: `#5eff6c`
- Yellow: `#f1ff5e`
- Blue: `#5ea1ff`
- Magenta: `#bd5eff`
- Cyan: `#5ef1ff`
- White: `#ffffff`

**밝은 컬러:**
- Bright Black: `#3c4048`
- 기타: 일반 컬러와 동일

**선택 영역:**
- 배경: `#3c4048`
- 전경: `#ffffff`

## 🚀 특징

1. **GPU 가속**: 하드웨어 가속으로 빠른 렌더링
2. **한글 지원**: D2Coding 폰트로 한글 완벽 지원
3. **투명도**: 0.9 투명도로 배경 시인성
4. **전체화면**: 시작 시 자동 전체화면 모드
5. **모던 테마**: cyberdream 다크 테마
6. **macOS 최적화**: Option 키를 Alt로 매핑

## 📋 설치 방법

1. **Alacritty 설치**
```bash
brew install --cask alacritty
```

2. **설정 파일 링크**
```bash
ln -sf ~/Documents/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/Documents/dotfiles/alacritty/cyberdream.toml ~/.config/alacritty/cyberdream.toml
```

3. **폰트 설치**
```bash
brew install font-d2coding-nerd-font
```

## 🛠️ 커스터마이징

- `alacritty.toml`: 메인 설정 수정
- `cyberdream.toml`: 컬러 테마 수정
- 폰트 크기는 `font.size` 값으로 조정
- 투명도는 `window.opacity` 값으로 조정 (0.0-1.0)