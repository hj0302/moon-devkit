---
name: feature-planner
description: Creates phase-based feature plans with TDD quality gates, conductor-pattern spec tracking, and incremental delivery. Use when planning features, organizing work, breaking down tasks, or structuring development strategy.
version: 1.0.0
---

# Feature Planner

## Purpose
Generate structured, phase-based plans where:
- Each phase delivers complete, runnable functionality
- Quality gates enforce validation before proceeding
- User approves plan before any work begins
- Progress tracked via markdown checkboxes
- Spec revisions tracked with conductor pattern (revision history + acceptance criteria)
- Each phase is 1-4 hours maximum

## Triggers
- "plan feature"
- "기능 계획"
- "plan this"
- "breakdown"
- "plan implementation"
- "구현 계획 세워줘"

## Planning Workflow

### Step 1: Requirements Analysis
1. Read relevant files to understand codebase architecture
2. Identify dependencies and integration points
3. Assess complexity and risks
4. Determine appropriate scope (small/medium/large)

### Step 2: Spec Definition (Conductor Pattern)
Before breaking into phases, create a formal spec:

**Spec Header:**
```markdown
## Spec: [Feature Name]
- **Revision**: 1.0
- **Status**: Draft | Approved | In Progress | Complete
- **Owner**: [assignee]
- **Acceptance Criteria**:
  - [ ] AC-1: [measurable criterion]
  - [ ] AC-2: [measurable criterion]
  - [ ] AC-3: [measurable criterion]
- **Revision History**:
  | Rev | Date | Changes | Author |
  |-----|------|---------|--------|
  | 1.0 | YYYY-MM-DD | Initial spec | [author] |
```

Track spec changes as revisions. Any scope change increments the revision number.

### Step 3: Phase Breakdown with TDD Integration
Break feature into 3-7 phases where each phase:
- **Test-First**: Write tests BEFORE implementation
- Delivers working, testable functionality
- Takes 1-4 hours maximum
- Follows Red-Green-Refactor cycle
- Has measurable test coverage requirements
- Can be rolled back independently
- Has clear success criteria mapped to acceptance criteria

**Phase Structure**:
- Phase Name: Clear deliverable
- Goal: What working functionality this produces
- Acceptance Criteria: Which AC items this phase addresses
- Test Strategy: What test types, coverage target, test scenarios
- Tasks (ordered by TDD workflow):
  1. **RED Tasks**: Write failing tests first
  2. **GREEN Tasks**: Implement minimal code to make tests pass
  3. **REFACTOR Tasks**: Improve code quality while tests stay green
- Quality Gate: TDD compliance + validation criteria
- Dependencies: What must exist before starting
- Coverage Target: Specific percentage or checklist for this phase

### Step 4: Plan Document Creation
Use plan-template.md to generate the plan document.

Recommended location: `docs/plans/PLAN_<feature-name>.md` (adapt to project structure)

Include:
- Spec header with acceptance criteria and revision tracking
- Overview and objectives
- Architecture decisions with rationale
- Complete phase breakdown with checkboxes
- Quality gate checklists
- Risk assessment table
- Rollback strategy per phase
- Progress tracking section
- Notes & learnings area

### Step 5: User Approval
**CRITICAL**: Use AskUserQuestion to get explicit approval before proceeding.

Ask:
- "Does this phase breakdown make sense for your project?"
- "Any concerns about the proposed approach?"
- "Should I proceed with creating the plan document?"

Only create plan document after user confirms approval.

### Step 6: Document Generation
1. Create plan directory if not exists
2. Generate plan document with all checkboxes unchecked
3. Add clear instructions in header about quality gates
4. Inform user of plan location and next steps

## Quality Gate Standards

Each phase MUST validate these items before proceeding to next phase:

**Build & Compilation**:
- [ ] Project builds/compiles without errors
- [ ] No syntax errors

**Test-Driven Development (TDD)**:
- [ ] Tests written BEFORE production code
- [ ] Red-Green-Refactor cycle followed
- [ ] Unit tests: >=80% coverage for business logic
- [ ] Integration tests: Critical user flows validated
- [ ] Test suite runs in acceptable time (<5 minutes)

**Testing**:
- [ ] All existing tests pass
- [ ] New tests added for new functionality
- [ ] Test coverage maintained or improved

**Code Quality**:
- [ ] Linting passes with no errors
- [ ] Type checking passes (if applicable)
- [ ] Code formatting consistent

**Functionality**:
- [ ] Manual testing confirms feature works
- [ ] No regressions in existing functionality
- [ ] Edge cases tested

**Security & Performance**:
- [ ] No new security vulnerabilities
- [ ] No performance degradation
- [ ] Resource usage acceptable

## Spec Revision Protocol (Conductor Pattern)

When scope changes during implementation:
1. **Pause** current phase
2. **Update spec** with new revision number
3. **Document** what changed and why in revision history
4. **Re-assess** remaining phases — add/remove/modify as needed
5. **Get approval** from user before resuming
6. **Update** acceptance criteria if needed

This ensures no scope creep goes untracked and the plan stays aligned with reality.

## Phase Sizing Guidelines

**Small Scope** (2-3 phases, 3-6 hours total):
- Single component or simple feature
- Minimal dependencies
- Clear requirements

**Medium Scope** (4-5 phases, 8-15 hours total):
- Multiple components or moderate feature
- Some integration complexity
- Database changes or API work

**Large Scope** (6-7 phases, 15-25 hours total):
- Complex feature spanning multiple areas
- Significant architectural impact
- Multiple integrations

## Risk Assessment

Identify and document:
- **Technical Risks**: API changes, performance issues, data migration
- **Dependency Risks**: External library updates, third-party service availability
- **Timeline Risks**: Complexity unknowns, blocking dependencies
- **Quality Risks**: Test coverage gaps, regression potential

For each risk, specify:
- Probability: Low/Medium/High
- Impact: Low/Medium/High
- Mitigation Strategy: Specific action steps

## Supporting Files Reference
- [plan-template.md](plan-template.md) - Complete plan document template
