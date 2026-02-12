---
name: commit-with-review
description: Analyze code changes, run CodeRabbit review, and create a well-structured commit. Use when committing code with quality checks.
version: 1.0.0
---

# Commit with CodeRabbit Review

코드 변경사항을 분석하고, CodeRabbit 리뷰 후 커밋하는 스킬입니다.

## Triggers
- "review and commit"
- "리뷰하고 커밋"
- "crc" (commit-review-commit)
- "코드리뷰 커밋"

## Instructions

### 1. 변경사항 파악
```bash
# 변경된 파일 확인
git status

# 상세 변경 내용 확인
git diff
git diff --staged

# 최근 커밋 스타일 확인
git log --oneline -10
```

### 2. CodeRabbit 리뷰 실행
```bash
coderabbit review --plain -t uncommitted
```

### 3. 리뷰 결과 분석
- **Critical 이슈**: 사용자에게 알리고 수정 제안
- **Suggestions**: 선택적 반영 여부 확인
- **통과**: 커밋 진행

### 4. 커밋 메시지 작성 규칙
- 프로젝트 컨벤션에 맞는 언어 사용 (한글/영어)
- 첫 줄: 50자 이내 요약 (type: subject 형식)
- 본문: 변경 이유와 영향 설명
- CodeRabbit 리뷰 통과 여부 포함
- Conventional Commits 권장: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`, `test:`

### 5. 커밋 실행
```bash
# 파일 스테이징 (민감 파일 제외 — .env, credentials 등)
git add <specific-files>

# 커밋 (HEREDOC 사용, 모델명은 현재 사용 중인 모델로 자동 설정)
git commit -m "$(cat <<'COMMIT'
<type>: <subject>

<body>

Co-Authored-By: Claude <noreply@anthropic.com>
COMMIT
)"
```

### 6. (선택) Push
사용자가 요청한 경우에만:
```bash
git push origin <current-branch>
```

## Security Checklist
- [ ] `.env`, `credentials.json` 등 민감 파일 스테이징 안 됨
- [ ] API 키, 토큰 등이 코드에 하드코딩되어 있지 않음
- [ ] `git diff --staged`로 최종 확인 완료

## Example Flow

```
User: 리뷰하고 커밋해줘

1. git status / git diff 실행 → 변경 내용 파악
2. coderabbit review 실행 → 리뷰 결과 분석
3. Critical 이슈 없으면 → 커밋 메시지 작성
4. git add + git commit 실행
5. 결과 보고 (커밋 해시, 변경 요약)
```
