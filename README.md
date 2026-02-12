# moon-devkit

OMC(oh-my-claudecode) 기반 풀스택 개발 환경 플러그인.
커스텀 스킬 + Terraform MCP + 전체 환경 자동 설치를 제공합니다.

## One-Line Setup

새 환경에서 전체 플러그인 환경을 한 번에 설치:

```bash
curl -sL https://raw.githubusercontent.com/hj0302/moon-devkit/main/scripts/setup.sh | bash
```

또는 로컬에서:
```bash
git clone https://github.com/hj0302/moon-devkit.git
bash moon-devkit/scripts/setup.sh
```

## What Gets Installed

### Marketplaces (5개)
| Marketplace | Source | Description |
|-------------|--------|-------------|
| claude-plugins-official | anthropics/claude-plugins-official | Anthropic 공식 플러그인 |
| omc | Yeachan-Heo/oh-my-claudecode | OMC 멀티에이전트 오케스트레이션 |
| claude-code-workflows | wshobson/agents | 개발 도구 플러그인 모음 |
| team-attention-plugins | team-attention/plugins-for-claude-natives | 세션 관리 플러그인 |
| moon-devkit | hj0302/moon-devkit | 커스텀 스킬 + Terraform MCP |

### Plugins (9개, 설치 순서)
| Priority | Plugin | Marketplace | Description |
|----------|--------|-------------|-------------|
| 1 | `oh-my-claudecode` | omc | 멀티에이전트 오케스트레이션 코어 |
| 2 | `moon-devkit` | moon-devkit | 커스텀 스킬 + Terraform MCP |
| 3 | `Notion` | claude-plugins-official | Notion 워크스페이스 통합 |
| 3 | `coderabbit` | claude-plugins-official | AI 코드 리뷰 |
| 4 | `backend-development` | claude-code-workflows | API 설계, 마이크로서비스, 이벤트 소싱 |
| 4 | `cloud-infrastructure` | claude-code-workflows | Terraform, Kubernetes, 멀티클라우드 |
| 4 | `code-review-ai` | claude-code-workflows | 아키텍처 리뷰 |
| 4 | `security-scanning` | claude-code-workflows | SAST, 위협 모델링 |
| 5 | `session-wrap` | team-attention-plugins | 세션 종료 시 분석 및 문서화 |

전체 매니페스트: [`plugins.json`](plugins.json)

## What's Included in moon-devkit

| Category | Item | Description |
|----------|------|-------------|
| Skill | `commit-with-review` | CodeRabbit 리뷰 후 구조화된 커밋 |
| Skill | `feature-planner` | TDD 품질 게이트 + conductor 패턴 기반 피처 계획 |
| Skill | `skill-creator` | Claude Code 스킬 생성 가이드 (스캐폴딩 + 패키징) |
| MCP | Terraform | HashiCorp Terraform IaC 지원 |
| Hook | SessionStart | 환경 검증 + 플러그인 소개 메시지 |
| Script | `setup.sh` | 전체 환경 원클릭 설치 |
| Manifest | `plugins.json` | 플러그인/마켓플레이스 매니페스트 |

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
│   ├── plugin.json           # 플러그인 메타데이터
│   └── marketplace.json      # 마켓플레이스 레지스트리
├── .mcp.json                 # Terraform MCP
├── plugins.json              # 전체 환경 매니페스트
├── scripts/
│   └── setup.sh              # 원클릭 환경 설치
├── skills/
│   ├── commit-with-review/
│   │   └── SKILL.md          # 리뷰+커밋 스킬
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
- **환경 재현성**: plugins.json + setup.sh로 새 환경 즉시 구축
- **비밀키 외부화**: 환경변수만 사용, 하드코딩 없음
- **한영 이중 언어**: 스킬 트리거에 한국어/영어 병기

### 제거된 항목 (OMC/플러그인으로 대체)
| 제거 대상 | 대체 수단 |
|-----------|-----------|
| Notion MCP | Notion 플러그인 (`@claude-plugins-official`) |
| GitHub MCP | GitHub 플러그인 (`@claude-plugins-official`) |
| Sequential Thinking MCP | OMC architect/analyst/critic 에이전트 |
| claude-mem | OMC 네이티브 메모리 (notepad/project-memory) |

## Customization

`plugins.json`을 수정하여 플러그인을 추가/제거한 후 `setup.sh`를 다시 실행하면 됩니다.

## License

MIT
