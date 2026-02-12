# Implementation Plan: [Feature Name]

**Status**: Draft | Approved | In Progress | Complete
**Started**: YYYY-MM-DD
**Last Updated**: YYYY-MM-DD

---

## Spec

- **Revision**: 1.0
- **Owner**: [assignee]
- **Acceptance Criteria**:
  - [ ] AC-1: [measurable criterion]
  - [ ] AC-2: [measurable criterion]
  - [ ] AC-3: [measurable criterion]

### Revision History
| Rev | Date | Changes | Author |
|-----|------|---------|--------|
| 1.0 | YYYY-MM-DD | Initial spec | [author] |

---

**CRITICAL INSTRUCTIONS**: After completing each phase:
1. Check off completed task checkboxes
2. Run all quality gate validation commands
3. Verify ALL quality gate items pass
4. Update "Last Updated" date above
5. Document learnings in Notes section
6. Only then proceed to next phase

DO NOT skip quality gates or proceed with failing checks.

---

## Overview

### Feature Description
[What this feature does and why it's needed]

### Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

### User Impact
[How this benefits users or improves the product]

---

## Architecture Decisions

| Decision | Rationale | Trade-offs |
|----------|-----------|------------|
| [Decision 1] | [Why this approach] | [What we're giving up] |
| [Decision 2] | [Why this approach] | [What we're giving up] |

---

## Dependencies

### Required Before Starting
- [ ] Dependency 1: [Description]
- [ ] Dependency 2: [Description]

### External Dependencies
- Package/Library 1: version X.Y.Z
- Package/Library 2: version X.Y.Z

---

## Test Strategy

### Testing Approach
**TDD Principle**: Write tests FIRST, then implement to make them pass

### Test Pyramid for This Feature
| Test Type | Coverage Target | Purpose |
|-----------|-----------------|---------|
| **Unit Tests** | >=80% | Business logic, models, core algorithms |
| **Integration Tests** | Critical paths | Component interactions, data flow |
| **E2E Tests** | Key user flows | Full system behavior validation |

---

## Implementation Phases

### Phase 1: [Foundation Phase Name]
**Goal**: [Specific working functionality this phase delivers]
**Addresses**: AC-1, AC-2 (partial)
**Status**: Pending

#### Tasks

**RED: Write Failing Tests First**
- [ ] Test 1.1: Write unit tests for [specific functionality]
  - File(s): `test/unit/[feature]/[component]_test.*`
  - Expected: Tests FAIL (red) because feature doesn't exist yet

**GREEN: Implement to Make Tests Pass**
- [ ] Task 1.2: Implement [component/module]
  - File(s): `src/[layer]/[component].*`
  - Goal: Make Test 1.1 pass with minimal code

**REFACTOR: Clean Up Code**
- [ ] Task 1.3: Refactor for code quality
  - [ ] Remove duplication
  - [ ] Improve naming clarity
  - [ ] Extract reusable components

#### Quality Gate
- [ ] Tests written FIRST and initially failed (Red)
- [ ] Production code written to make tests pass (Green)
- [ ] Code improved while tests still pass (Refactor)
- [ ] Coverage meets target
- [ ] Build passes without errors
- [ ] All tests pass
- [ ] Linting passes
- [ ] No security vulnerabilities

---

### Phase 2: [Core Feature Phase Name]
**Goal**: [Specific deliverable]
**Addresses**: AC-2 (complete), AC-3
**Status**: Pending

#### Tasks

**RED: Write Failing Tests First**
- [ ] Test 2.1: [Description]

**GREEN: Implement to Make Tests Pass**
- [ ] Task 2.2: [Description]

**REFACTOR: Clean Up Code**
- [ ] Task 2.3: [Description]

#### Quality Gate
- [ ] Red-Green-Refactor cycle followed
- [ ] Coverage meets target
- [ ] Build passes
- [ ] All tests pass

---

### Phase 3: [Enhancement Phase Name]
**Goal**: [Specific deliverable]
**Addresses**: [remaining ACs]
**Status**: Pending

#### Tasks
- [ ] [Tasks following same RED-GREEN-REFACTOR pattern]

#### Quality Gate
- [ ] [Same quality gate checklist]

---

## Risk Assessment

| Risk | Probability | Impact | Mitigation Strategy |
|------|-------------|--------|---------------------|
| [Risk 1] | Low/Med/High | Low/Med/High | [Mitigation steps] |
| [Risk 2] | Low/Med/High | Low/Med/High | [Mitigation steps] |

---

## Rollback Strategy

### If Phase 1 Fails
- Undo code changes in: [list files]
- Restore configuration: [specific settings]

### If Phase 2 Fails
- Restore to Phase 1 complete state
- Undo changes in: [list files]

---

## Progress Tracking

### Completion Status
- **Phase 1**: Pending
- **Phase 2**: Pending
- **Phase 3**: Pending

**Overall Progress**: 0% complete

---

## Notes & Learnings

### Implementation Notes
- [Add insights discovered during implementation]

### Blockers Encountered
- **Blocker 1**: [Description] -> [Resolution]

### Spec Revisions
- [Track any scope changes and their rationale here]

---

## Final Checklist

Before marking plan as COMPLETE:
- [ ] All phases completed with quality gates passed
- [ ] All acceptance criteria met
- [ ] Full integration testing performed
- [ ] Documentation updated
- [ ] Security review completed
- [ ] Spec status updated to "Complete"
