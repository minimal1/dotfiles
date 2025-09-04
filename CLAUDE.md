# Claude Code 작업 가이드라인

이 문서는 dotfiles 프로젝트에서 Claude Code와 효과적으로 작업하기 위한 가이드라인을 담고 있습니다.

## 🎯 프로젝트 개요

**Dotfiles Repository**: 개인 개발 환경 설정 관리
- **구성 요소**: Alacritty, tmux, zsh, Neovim
- **주요 스크립트**: 설치 및 백업 자동화
- **언어**: Shell Script (Bash)

## 🚀 작업 접근 방식

### 1. 체계적인 계획 수립
작업 시작 전 반드시 TodoWrite 도구를 사용하여 단계별 계획을 수립합니다.

**예시:**
```
- 현재 스크립트 구조 분석
- 요구사항 파악 및 설계
- 핵심 기능 구현
- 테스트 및 검증
- 문서화
```

### 2. 단계적 구현 방식
- **분석 단계**: 기존 코드 구조와 요구사항 파악
- **설계 단계**: 옵션 구조와 함수 분리 계획
- **구현 단계**: 기능별 독립 함수로 모듈화
- **테스트 단계**: 다양한 옵션과 시나리오 검증

### 3. 코드 품질 기준
- **함수 분리**: 각 구성요소별 독립적인 설치 함수
- **옵션 처리**: 명령행 인수 파싱과 대화형 메뉴 제공
- **에러 처리**: 디렉토리 존재 여부 확인 및 적절한 메시지
- **사용자 경험**: 직관적인 도움말과 진행 상태 표시

## 📋 주요 작업 패턴

### 스크립트 개선 작업
1. **기존 구조 분석**
   ```bash
   # 파일 구조 확인
   ls -la scripts/
   # 현재 스크립트 내용 파악
   cat scripts/install.sh
   ```

2. **요구사항 설계**
   - 명령행 옵션: `-z`, `-t`, `-n`, `-l`, `-i`, `-h`
   - 대화형 메뉴: 숫자 선택 방식
   - 개별 설치 함수: 모듈화된 구조

3. **점진적 구현**
   - 도움말 함수 → 옵션 파싱 → 개별 설치 함수 → 대화형 메뉴

### Git 커밋 방식
Conventional Commits 형식을 따릅니다:
```
feat: add selective installation options to install script

- Add command-line option parsing with flags
- Implement interactive menu for component selection
- Split installation logic into separate functions
- Maintain backward compatibility
```

## 🛠 개발 도구 사용법

### 주요 명령어
```bash
# 스크립트 실행 권한 부여
chmod +x scripts/install.sh

# 도움말 확인
./scripts/install.sh --help

# 대화형 모드 테스트
./scripts/install.sh -i

# 특정 구성요소만 설치
./scripts/install.sh -z -t
```

### 테스트 방법
```bash
# 단일 옵션 테스트
echo "1" | ./scripts/install.sh -i

# 도움말 출력 확인
./scripts/install.sh -h

# 잘못된 옵션 처리 확인
./scripts/install.sh --invalid
```

## 🎨 코드 스타일

### Shell Script 규칙
- **함수명**: snake_case (`install_alacritty`)
- **변수명**: UPPER_CASE (`INSTALL_ALL`)
- **조건문**: `if [ condition ]; then` 형식
- **에러 메시지**: 이모지와 명확한 설명 (`❌ 알 수 없는 옵션`)

### 사용자 인터페이스
- **진행 상태**: 이모지로 시각적 피드백 (`⚙️`, `✅`, `📦`)
- **선택 메뉴**: 숫자 기반 직관적 선택
- **도움말**: 명확한 사용법과 예시 제공

## 📚 학습된 Best Practices

### 1. 모듈화 설계
각 구성요소를 독립적인 함수로 분리하여 유지보수성 향상

### 2. 사용자 경험 중심
- 명령행 옵션과 대화형 메뉴 두 가지 방식 제공
- 명확한 도움말과 진행 상황 표시
- 에러 상황에 대한 친절한 안내

### 3. 하위 호환성 유지
기존 사용 방식(`./install.sh`)을 그대로 지원하면서 새 기능 추가

### 4. 체계적 테스트
- 각 옵션별 개별 테스트
- 대화형 모드 동작 확인
- 에러 케이스 처리 검증

## 🔄 향후 개선 방향

### 추가 기능 아이디어
- [ ] 설정 파일 병합 옵션
- [ ] 백업 복원 기능
- [ ] 의존성 패키지 자동 설치
- [ ] 설정 검증 및 건강성 체크

### 코드 품질 향상
- [ ] 함수별 단위 테스트 추가
- [ ] 설정 파일 검증 로직 강화
- [ ] 로깅 시스템 도입
- [ ] 설치 진행률 표시

## 💡 작업 팁

1. **TodoWrite 활용**: 복잡한 작업은 반드시 할 일 목록으로 관리
2. **단계적 테스트**: 각 기능 구현 후 즉시 테스트
3. **Git 활용**: 기능별 커밋으로 변경사항 추적
4. **문서화**: 사용법과 예시를 명확히 기록

이 가이드라인을 따라 일관성 있고 품질 높은 코드를 작성해주세요.