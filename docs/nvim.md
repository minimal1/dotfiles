# Neovim 설정

현재 사용 중인 Neovim 설정은 Lazy.nvim을 기반으로 한 모던한 개발 환경입니다.

## 📁 구조

```
nvim/
├── init.lua                    # 진입점 (minimal 모듈 로드)
└── lua/
    ├── minimal/               # 메인 설정 모듈
    │   ├── init.lua          # 모듈 초기화
    │   ├── lazy.lua          # Lazy.nvim 부트스트랩
    │   ├── settings.lua      # Vim 기본 설정
    │   ├── remap.lua         # 기본 키맵핑
    │   └── lsp.lua           # LSP 설정
    └── plugins/              # 플러그인 설정 (27개)
```

## ⚙️ 기본 설정 (settings.lua)

- **라인 번호**: 절대/상대 번호 표시
- **검색**: 하이라이트 및 증분 검색
- **인덴트**: 2칸 스페이스, 자동 인덴트
- **백업**: 스왑 파일 비활성화, undo 히스토리 유지
- **클립보드**: 시스템 클립보드 연동
- **스크롤**: 8줄 오프셋 유지

## 🔌 설치된 플러그인 (27개)

### 📝 자동완성 & LSP
- **blink.cmp** - 모던한 자동완성 엔진
  - Enter로 선택, Ctrl+I로 메뉴 토글
  - LSP, path, snippets, buffer 소스 지원
- **mason.lua** - LSP 서버 관리
- **mason-lspconfig.lua** - Mason과 lspconfig 연동
- **mason-tool-installer.lua** - 도구 자동 설치
- **nvim-lspconfig.lua** - LSP 클라이언트 설정

### 🔍 파일 탐색 & 검색
- **telescope.lua** - 퍼지 파인더
  - `<leader>ff`: 파일 찾기
  - `<leader>fg`: 텍스트 검색  
  - `<leader>fb`: 버퍼 목록
  - `<leader>fh`: 도움말 태그
- **nvim-tree.lua** - 파일 트리 (우측 배치)
  - `<leader>tt`: 토글
  - `<leader>to/tc/tf`: 열기/닫기/파일 포커스

### 🎨 UI & 테마
- **colors.lua** - 컬러스킴 설정
- **lualine.lua** - 상태바
- **bufferline.lua** - 탭/버퍼 라인
- **dashboard.lua** - 시작 화면
- **icons.lua** - 아이콘 설정
- **which-key.lua** - 키바인딩 가이드

### 🛠️ 개발 도구
- **treesitter.lua** - 구문 하이라이팅 & 파싱
- **conform.lua** - 코드 포매팅
- **nvim-lint.lua** - 코드 린팅
- **trouble.lua** - 진단 정보 표시
- **undotree.lua** - Undo 히스토리 시각화

### 🔄 Git 통합
- **git-signs.lua** - Git 변경사항 표시

### 🎯 편집 도구
- **surround.lua** - 괄호/따옴표 편집
- **smart-splits.lua** - 스마트 창 분할
- **focus.lua** - 창 포커스 관리

## 🔥 주요 키맵핑

### 기본 키맵핑 (remap.lua)
- `<leader>q`: 현재 창 닫기
- `<leader>Q`: 다른 창 모두 닫기

### 플러그인 키맵핑
- **Leader Key**: `Space`
- **Telescope**: `<leader>f` + `f/g/b/h`
- **NvimTree**: `<leader>t` + `t/o/c/f`
- **자동완성**: `Enter` 선택, `Ctrl+I` 토글

## 🚀 특징

1. **Lazy.nvim**: 지연 로딩으로 빠른 시작
2. **모듈화**: 설정을 기능별로 분리
3. **LSP 통합**: 자동 서버 설치 및 설정
4. **모던 UI**: 버퍼라인, 상태바, 파일 트리
5. **Git 통합**: 변경사항 시각화
6. **개발자 친화**: 린팅, 포매팅, 진단 도구
