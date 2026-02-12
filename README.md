# moon-devkit

OMC(oh-my-claudecode) 기반 풀스택 개발 환경 플러그인.
커스텀 스킬 + Terraform MCP + 생태계 가이드를 하나로 묶어 제공합니다.

## What's Included

| Category | Item | Description |
|----------|------|-------------|
| Skill | `commit-with-review` | CodeRabbit 리뷰 후 구조화된 커밋 |
| Skill | `feature-planner` | TDD 품질 게이트 + conductor 패턴 기반 피처 계획 |
| Skill | `skill-creator` | Claude Code 스킬 생성 가이드 (스캐폴딩 + 패키징) |
| MCP | Terraform | HashiCorp Terraform IaC 지원 |
| Hook | SessionStart | 환경 검증 + 플러그인 소개 메시지 |

## Quick Setup

### 1. OMC 코어 (Core)
```bash
/plugin install oh-my-claudecode@omc
```

### 2. moon-devkit (이 플러그인)
```bash
/plugin marketplace add moon/moon-devkit
/plugin install moon-devkit@moon-devkit
```

### 3. 개발 도구 플러그인 (Development Tools)
```bash
# Python / Cloud / Backend / Security / Code Review
/plugin install python-development@claude-code-workflows
/plugin install cloud-infrastructure@claude-code-workflows
/plugin install backend-development@claude-code-workflows
/plugin install security-scanning@claude-code-workflows
/plugin install code-review-ai@claude-code-workflows

# LLM/RAG / Spec-driven / CI-CD
/plugin install llm-application-dev@claude-code-workflows
/plugin install conductor@claude-code-workflows
/plugin install cicd-automation@claude-code-workflows
```

### 4. 공식 플러그인 (Official Plugins)
```bash
/plugin install Notion@claude-plugins-official
/plugin install coderabbit@claude-plugins-official
/plugin install github@claude-plugins-official
/plugin install playwright@claude-plugins-official
```

### 5. 커뮤니티 & 외부 마켓플레이스 (Community)
```bash
# Context7 — 자동 라이브러리 문서 조회
/plugin install context7@context7

# Session wrap-up
/plugin install session-wrap@team-attention-plugins

# 외부 마켓플레이스 추가
/plugin marketplace add davila7/claude-code-templates
/plugin marketplace add f/prompts.chat
/plugin marketplace add upstash/context7
# obra/superpowers-marketplace — 이미 등록된 경우 생략
```

## Skills Usage

### commit-with-review
코드 리뷰 + 커밋을 한 번에 처리합니다.

**트리거**: `review and commit`, `리뷰하고 커밋`, `crc`, `코드리뷰 커밋`

```
User: 리뷰하고 커밋해줘
→ git diff 분석 → CodeRabbit 리뷰 → 커밋 메시지 작성 → git commit
```

### feature-planner
TDD 기반 단계별 피처 구현 계획을 생성합니다.

**트리거**: `plan feature`, `기능 계획`, `plan this`, `breakdown`, `구현 계획 세워줘`

```
User: plan feature user authentication
→ 요구사항 분석 → Spec 정의 → 단계별 분해 → 승인 후 문서 생성
```

특징:
- Conductor 패턴: Spec 리비전 추적, 수용 기준 관리
- TDD 품질 게이트: Red-Green-Refactor 사이클 강제
- 단계별 롤백 전략 포함

### skill-creator
Claude Code 스킬을 생성하고 패키징하는 가이드 스킬입니다.

```
User: create a new skill for database migrations
→ 요구사항 분석 → init_skill.py 스캐폴딩 → SKILL.md 작성 → package_skill.py 배포
```

포함 스크립트:
- `init_skill.py` — 스킬 디렉토리 초기화
- `package_skill.py` — 검증 + zip 패키징
- `quick_validate.py` — 빠른 유효성 검사

## MCP Servers

### Terraform
HashiCorp Terraform MCP 서버가 자동으로 활성화됩니다.
IaC 리소스 관리, plan/apply 워크플로우, 모듈 작성을 지원합니다.

```bash
# 자동 활성화 — 별도 설정 불필요
# npx -y @hashicorp/terraform-mcp-server
```

## Architecture

```
moon-devkit/
├── .claude-plugin/
│   └── plugin.json          # 플러그인 메타데이터
├── .mcp.json                # Terraform MCP
├── skills/
│   ├── commit-with-review/
│   │   └── SKILL.md         # 리뷰+커밋 스킬
│   ├── feature-planner/
│   │   ├── SKILL.md          # 피처 계획 스킬
│   │   └── plan-template.md  # 계획 문서 템플릿
│   └── skill-creator/
│       ├── SKILL.md          # 스킬 생성 가이드
│       └── scripts/          # init, package, validate 스크립트
├── hooks/
│   └── hooks.json            # SessionStart 훅
├── README.md
├── LICENSE
└── CHANGELOG.md
```

## Design Principles

- **OMC 동반자**: OMC 코어 위에 보완 역할만 수행 (중복 제로)
- **MCP 최소화**: Terraform만 번들 (Context7은 별도 플러그인으로 설치)
- **비밀키 외부화**: 환경변수만 사용, 하드코딩 없음
- **한영 이중 언어**: 스킬 트리거에 한국어/영어 병기

### 제거된 항목 (OMC/플러그인으로 대체)
| 제거 대상 | 대체 수단 |
|-----------|-----------|
| Notion MCP | Notion 플러그인 (`@claude-plugins-official`) |
| GitHub MCP | GitHub 플러그인 (`@claude-plugins-official`) |
| Sequential Thinking MCP | OMC architect/analyst/critic 에이전트 |
| claude-mem | OMC 네이티브 메모리 (notepad/project-memory) |

## License

MIT
