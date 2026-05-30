# Phase 8: Reference Architecture and Navigation

## Objective

Transform `writing-production-code.md` from a linear reference into a usable toolkit. Add navigation, decision-support diagrams, reusable templates, a glossary, and a learning path for junior engineers. Create a `docs/reference/` directory for standalone quick-reference materials.

## Why This Matters

From our guide, Section XIV (The Professional Habits):

> Code is read far more often than it is written.

The same applies to guides. The main document is 1,203 lines across 15 sections. A junior engineer who needs to find "how do I write a prompt?" or "what was the pre-merge checklist again?" or "what does eBPF stand for?" currently has no option but to scroll or search.

The document is strong on *concepts* but weak on *retrievability*. This phase closes that gap by adding:

- **Navigation** — a table of contents so readers find what they need in seconds, not minutes
- **Glossary** — a consolidated quick-reference so technical terms are findable after first encounter
- **Decision trees** — judgement aids for the three hardest calls a junior makes: whether to use an agent, whether to iterate or regenerate, and which verification technique to apply
- **Prompt templates** — reusable scaffolds so the reader spends time on the problem, not on prompt structure
- **Learning path** — a staged reading guide that prevents overwhelm by sequencing sections across weeks
- **Standalone references** — the pre-merge checklist and agent code review checklist extracted as files the reader can print, pin, or paste

Without these additions, the document is a book. With them, it is a toolkit.

---

## What To Do

### 1. Add a Table of Contents to `writing-production-code.md`

Insert a table of contents between the language-note block (line 9) and Section I (line 11). Use GitHub-compatible anchor links.

The TOC must link to every major section (I–XV) and every named subsection. Format as a nested bullet list:

```markdown
## Table of Contents

- [I. Introduction](#i-introduction)
  - [From Autocomplete to Autonomy](#from-autocomplete-to-autonomy)
  - [How to Read This Guide](#how-to-read-this-guide)
- [II. Thinking Before Prompting](#ii-thinking-before-prompting)
  - [The Problem Precedes the Prompt](#the-problem-precedes-the-prompt)
  ...
```

**Rules for anchor links:**

- GitHub auto-generates anchors from headings: lowercase the full heading text, replace spaces with hyphens, remove punctuation (except hyphens).
- For sections with Roman numerals, the anchor uses the full heading text exactly as written. For example `## III. The Anatomy of Production Code` becomes `#iii-the-anatomy-of-production-code`.
- Test every link by clicking it after deployment.

**Subsections to include** (all named subsections with `###` headings):

| Section | Subsections |
| --- | --- |
| I | From Autocomplete to Autonomy, How to Read This Guide |
| II | The Problem Precedes the Prompt, The Cost of Code You Don't Understand, Specification as Prompting, When Not to Use an Agent |
| III | Correctness Readability and Maintainability, Naming and Structure, Error Handling, Logging and Observability, Dependency Discipline, Agentic Debt |
| IV | Refine Don't Regenerate, The Loop in Practice, When to Abandon the Loop, The Economics of Iteration, Estimating Agent Effort |
| V | The Hazards of Working with Machines That Never Say I Don't Know, Automation Bias, Sunk Cost Fallacy, Learned Helplessness, The Confidence Illusion |
| VI | Why Polite Requests Fail, The Layered Defence Model, Hardware Isolation, Syscall Interception, Resource Budgets, Thermal and Power Circuit Breakers |
| VII | The Gate That Never Negotiates, The Five Lines of Defence, The Immutable Makefile, The AGENTS.md File, Environmental Invariants |
| VIII | Beyond the Happy Path, Mutation Testing, Property-Based Fuzzing, Formal Verification, Synthetic Network Impairment, Reproducible Environments |
| IX | The Agent Will Leak Your Secrets, Prompt Injection, Write-Once Storage, Software Data Diodes, Dynamic Taint Analysis, Secrets Management, The Dead Mans Switch, What Not to Paste |
| X | The Right Model for the Right Job, N-Version Programming, Semantic Entropy Gating, The Economics of Tokens, Context Management |
| XI | The Amnesia Problem, AST-Aware Diffing, RAG-Augmented Error Feedback |
| XII | When the Circuit Breaker Trips, Reading the Telemetry, Dropping into the Sandbox, Debugging Code You Did Not Write, Code Review, The Ownership Paradox, The Pre-Merge Checklist |
| XIII | The Task, Step One Understand Before Prompting, Step Two Write the Prompt, Step Three Review the Agents Output, Step Four Review the Tests, Step Five Mutation Testing, Step Six Enforcement, Step Seven Commit and Merge, What Just Happened |
| XIV | Version Control as Communication, Documentation, Continuous Integration, Knowing When to Stop |
| XV | The Tool Not the Crutch, The Fortress Is the Engineering, The Engineer You Are Becoming |
| Appendices | Glossary of Terms, Decision Trees, Prompt Templates, Suggested Reading Path |

### 2. Add a Glossary Appendix

Add a new appendix section at the end of `writing-production-code.md` (after Section XV) titled `## Appendix A: Glossary of Terms`.

Include entries for every technical term defined in the document. Each entry should have:

- **Term** (bolded)
- **Definition** in plain language (1-2 sentences)
- **Section reference** in parentheses — e.g., `(Section VI)`

The glossary must include at minimum these terms, ordered alphabetically:

```text
Agent — An AI model that can autonomously write, run, debug, and refactor code without human intervention at each step. (I)

AST (Abstract Syntax Tree) — A representation of code as a tree of logical structures (functions, loops, conditionals) rather than a sequence of text lines. (XI)

Automation bias — The tendency to trust a machine's output because it comes from a machine, skipping the critical verification step. (V)

CVE (Common Vulnerabilities and Exposures) — A publicly disclosed security flaw with a unique identifier (e.g., CVE-2024-1234). (III)

cgroups (control groups) — A Linux kernel feature that imposes hard limits on resource consumption (RAM, CPU, file descriptors) for a process. (VI)

Circuit breaker — A pattern that stops retrying a failed operation once a threshold is exceeded, preventing cascading failures. (VIII)

Data diode — A one-way data flow mechanism that physically prevents data from moving in the reverse direction. (IX)

Dead man's switch — A mechanism that defaults to "do nothing" unless a human actively approves within a time window. (IX)

Dynamic taint analysis — Runtime tracking that marks sensitive data as "tainted" and intercepts it before it reaches dangerous sinks (logs, network sockets, API responses). (IX)

eBPF (extended Berkeley Packet Filter) — A Linux technology that lets you run small, safe programs inside the kernel to monitor and intercept system calls. (VI)

Executor model — A smaller, faster AI model optimised for code generation, testing, and iteration under the supervision of an orchestrator. (X)

Exponential backoff — A retry strategy that waits progressively longer between attempts (1s, 2s, 4s, 8s...) to avoid overwhelming a failing service. (VIII)

Formal verification — Mathematical proof that a system satisfies specified properties in all possible states. (VIII)

IOMMU (Input-Output Memory Management Unit) — Hardware that lets you physically detach devices (RAM, GPUs) from the host OS and assign them exclusively to a VM. (VI)

Kernel — The core of an operating system that manages memory, processes, hardware access, and system calls. (VI)

Mutation testing — The practice of intentionally introducing bugs (mutants) into code and checking whether the test suite catches them. (VIII)

N-version programming — Implementing the same specification independently in multiple versions and comparing outputs to detect disagreement. (X)

Nix — A purely functional package manager that builds environments byte-for-byte identically, down to the cryptographic hash. (VIII)

Orchestrator model — A heavyweight AI model with strong reasoning capability used for planning architecture, decomposing problems, and reviewing output. (X)

Progressive disclosure — A design pattern that reveals information only when it is needed, rather than all at once. (VII)

Prompt injection — An attack in which crafted input tricks an AI agent into treating data as instructions, potentially leaking secrets or executing unauthorised actions. (IX)

Property-based fuzzing — Testing that verifies properties (e.g., "addition is commutative") across thousands of randomly generated inputs, including edge cases no human would think to test. (VIII)

RAG (Retrieval-Augmented Generation) — A technique that retrieves relevant historical context (past errors, fixes, decisions) from a database and injects it into the agent's context window. (XI)

Semantic entropy — A mathematical measure of a model's uncertainty in its output, derived from the probability distribution of generated tokens. (X)

SOPS (Secrets OPerationS) — A tool from Mozilla that encrypts secret files so they can be safely stored in version control, decrypted only at runtime in memory. (IX)

Supply-chain attack — An attack that compromises a system through a dependency, exploiting the trust relationship between a project and its libraries. (III)

Syscall (system call) — A request from a running program to the operating system kernel to perform an operation (open a file, send a network packet, allocate memory). (VI)

TLA+ (Temporal Logic of Actions) — A formal specification language for modelling concurrent and distributed systems, verified by the TLC model checker. (VIII)

Token — A unit of text processed by language models. One token is roughly three-quarters of an English word. (IV)

Toxiproxy — A proxy tool that sits between an application and its dependencies and simulates network failures (latency, disconnection, packet loss). (VIII)

Transitive dependency — A library that your library's library depends on; dependencies can chain transitively many layers deep. (III)

VFIO (Virtual Function I/O) — A framework for direct device access from user space, used with IOMMU for hardware isolation. (VI)

WORM (Write Once, Read Many) — Storage configured so that data can be written but never deleted or modified for a defined retention period. (IX)
```

### 3. Add Decision Tree Diagrams

Add a new appendix section `## Appendix B: Decision Trees` after the glossary.

Create three decision trees using ASCII diagram syntax (consistent with the existing diagrams in Sections IV, VI, and VII).

#### Decision Tree 1: Should I Use an Agent for This Task?

Place this near the "When Not to Use an Agent" reference in Section II, but also include in the appendix for standalone reference.

```text
   Is the task well-defined? (Can you write the spec in 1 sentence?)
   |
   ├── No  → Define the problem first. Write a one-sentence spec.
   │          If you cannot, do not use an agent yet.
   │
   └── Yes
       |
       Is the task <10 lines of code?
       |
       ├── Yes → Write it yourself. The prompting overhead exceeds
       │          the time to just type it.
       │
       └── No
           |
           Is the task security-critical? (auth, crypto, payments)
           |
           ├── Yes → Write it yourself. You must understand every byte.
           │
           └── No
               |
               Are you learning this concept for the first time?
               |
               ├── Yes → Write it yourself. The struggle is the point.
               │
               └── No
                   |
                   Is the task deeply architectural? (affects many files,
                   requires structural trade-offs)
                   |
                   ├── Yes → Use the agent for implementation after
                   │          you write the architecture spec yourself.
                   │
                   └── No  → USE THE AGENT.
                              Include relevant files in context.
                              Specify constraints explicitly.
```

#### Decision Tree 2: Iterate or Regenerate?

Place this near the "When to Abandon the Loop" section (Section IV).

```text
   Which pass are you on?
   |
   ├── Pass 1  → Iterate. Fix specifics (error handling, edge cases).
   │              Regenerating wastes the context you already built.
   │
   ├── Pass 2  → Iterate. Fix naming, structure, logging.
   │
   ├── Pass 3  → Iterate. Add tests. Run mutation testing.
   │
   ├── Pass 4  → Iterate. Polish. Verify enforcement pipeline.
   │
   └── Pass 5+ →
       |
       Is the code materially improving each pass?
       |
       ├── Yes → Keep iterating. Each pass is cheaper than the last.
       │
       └── No  → STOP. Identify the root cause:
           |
           ├── Was the spec wrong?
           │   → Rewrite the prompt. Start fresh.
           │
           ├── Does the agent lack codebase context?
           │   → Add relevant files to context. Start fresh.
           │
           └── Is the task beyond the agent's capability?
               → Write it yourself. Some tasks need human judgement.
```

#### Decision Tree 3: Which Verification Technique?

Place this near Section VIII (Advanced Verification).

```text
   What are you trying to verify?
   |
   ├── Basic correctness → Unit tests (pytest, jest, etc.)
   │
   ├── Test quality      → Mutation testing (mutmut, pytest-mutagen)
   │
   ├── Edge cases        → Property-based fuzzing (hypothesis, fast-check)
   │
   ├── Network resilience → Synthetic impairment (Toxiproxy)
   │
   ├── Security flaws    → Scanners (semgrep, trivy, codeql)
   │
   ├── Concurrency/dist  → Formal verification (TLA+)
   │
   └── Reproducibility   → Pinned environments (Nix, Docker digests)
```

### 4. Add a Prompt Templates Appendix

Add a new appendix section `## Appendix C: Prompt Templates` after the decision trees.

Provide four reusable templates with bracketed placeholders. Add each as a standalone fenced code block:

```text
### Template 1: Bug Fix

Fix a bug in `{file_path}` in the `{function_name}` function.

**The problem:** {one-sentence description of the bug}
**Expected behaviour:** {what should happen instead}

**Root cause (if known):** {optional: what you found during investigation}

**Constraints:**
- Use only libraries already in `{requirements.txt/package.json}`.
- Follow the error-handling patterns in `{reference_file}`.
- Add a log statement at {info/warning/error} level for the fix.
- Add tests for: {list of test cases}.

**Acceptance criteria:**
- `{test_command}` passes.
- `{lint_command}` passes.
- The fix handles {edge case 1} and {edge case 2}.
```

```text
### Template 2: New Feature

Create a {function/class/module} at `{file_path}` that {one-sentence purpose}.

**Input:** {type and description of input}
**Output:** {type and description of expected output}

**Edge cases:**
- {edge case 1}
- {edge case 2}

**Constraints:**
- Do not add new dependencies.
- Use {framework/library} patterns consistent with `{reference_file}`.
- Maximum function length: {N} lines.
- All external calls must have timeouts and error handling.

**Testing:**
- Write tests covering the happy path and all listed edge cases.
- Run `{test_command}` and verify all pass.
```

```text
### Template 3: Test Writing

Write tests for `{file_path}` in `{test_file_path}`.

**Coverage requirements:**
- Happy path: {describe normal case}
- {N} edge cases: {list edge cases}
- Error paths: {describe failure scenarios}

**Constraints:**
- Use the existing test fixtures in `{fixture_file}`.
- Follow the test patterns in `{reference_test_file}`.
- Do not mock {external_service} — use the test container.
- Each test must be independent (no shared state between tests).

**Verification:**
- Run `{test_command}` and confirm all tests pass.
- Run mutation testing and confirm score > 80%.
```

```text
### Template 4: Code Review Request

Review the code at `{file_path}` for agent-specific failure modes.

**Check each of the following:**
1. Hallucinated APIs — does every external call exist in the docs?
2. Verbose solutions — can any block be simplified or removed?
3. Missing edge cases — what happens with empty/null/unexpected input?
4. Copy-paste patterns — is any logic duplicated where it should be abstracted?
5. Silent failures — are errors caught and logged, not swallowed?

**For each issue found, provide:**
- The exact line number
- Why it is a problem
- The minimal fix
```

### 5. Add a Suggested Reading Path

Add a new appendix section `## Appendix D: Suggested Reading Path for Junior Engineers` after the prompt templates.

This section maps the document's sections to a staged learning plan:

```text
This guide covers concepts ranging from fundamental habits to advanced
infrastructure. You do not need to read it all on day one. Here is a
staged path based on where you are in your journey.

### Week 1 — Foundations (read in order)

Start here. These sections give you the mental model.

1. **Section I (Introduction)** — Context and motivation (5 min)
2. **Section II (Thinking Before Prompting)** — The most important skill (15 min)
3. **Section III (The Anatomy of Production Code)** — What "good" looks like (15 min)
4. **Section V (Cognitive Traps)** — The mistakes that catch everyone (10 min)

**Goal by end of Week 1:** You can write a specific prompt, review the
output critically, and recognise when you are falling into automation bias
or learned helplessness.

### Week 2 — The Workflow

These sections teach you the day-to-day process of working with agents.

1. **Section IV (The Iteration Loop)** — How to refine, not regenerate (10 min)
2. **Section VII (The Enforcement Pipeline)** — The gate that never negotiates (10 min)
3. **Section XII (The Human-Agent Handoff)** — Code review and intervention (10 min)
4. **Section XIII (A Worked Example)** — Everything in practice (15 min)

**Goal by end of Week 2:** You can take a ticket from prompt to pull request,
running the full enforcement pipeline and reviewing agent output for common
failure modes.

### Week 3 — Verification and Professional Habits

These sections make your code safe to ship.

1. **Section VIII (Advanced Verification)** — Beyond happy-path tests (15 min)
2. **Section XIV (The Professional Habits)** — Commits, docs, CI (5 min)
3. **Section IX (Security and State Management, practical parts only)** —
   Prompt injection awareness and secrets management (10 min)

**Goal by end of Week 3:** You can verify agent code with mutation testing,
property-based fuzzing, and security scanners. You write clear commit
messages and maintain your AGENTS.md file.

### Reference Only — Understand, Do Not Implement Yet

These sections describe infrastructure concepts. Read them to build
vocabulary and context. Do not try to implement them until you are
responsible for the systems they protect.

- **Section VI (Containing the Blast Radius)** — eBPF, cgroups, hardware isolation
- **Section X (Cognitive Routing and Economics)** — Multi-model rosters,
  N-version programming, semantic entropy gating
- **Section XI (Telemetry and Memory)** — RAG-augmented error feedback,
  AST-aware diffing

When you encounter these terms in conversations, code reviews, or
incident reports, come back to these sections for the definition and context.
```

### 6. Extract the Pre-Merge Checklist as a Standalone File

Create `docs/reference/pre-merge-checklist.md` containing the 11-point checklist from Section XII (lines 932–945), formatted as a standalone copyable reference:

```text
# Pre-Merge Checklist

Before any agent-generated code is merged, verify every item:

- [ ] **Every line has been read and understood.**
- [ ] **`make enforce` passes locally.**
- [ ] **Tests cover the happy path and at least three edge cases.**
- [ ] **Mutation testing shows a score above 80%.**
- [ ] **No hardcoded secrets, credentials, or environment-specific values.**
- [ ] **Error handling is present on every external call and every user input.**
- [ ] **Logging is present at key decision points.**
- [ ] **The code follows the project's naming conventions and architectural patterns.**
- [ ] **No hallucinated APIs** — every external function call has been verified against documentation.
- [ ] **No unnecessary dependencies added.**
- [ ] **The diff has been reviewed for unnecessary verbosity.**

If any item fails, the code does not merge. No exceptions.
```

### 7. Extract an Agent Code Review Checklist

Create `docs/reference/agent-code-review-checklist.md` with the common agent failure modes described in Section XII (lines 918–928), formatted as a checklist:

```text
# Agent Code Review Checklist

When reviewing code written by an AI agent, check specifically for these
common failure modes.

## 1. Hallucinated APIs

Does the code call functions or methods that do not exist? Verify every
external call against actual library documentation.

- [ ] All function signatures match the library documentation.
- [ ] No fabricated configuration options.
- [ ] All import paths resolve correctly.

## 2. Verbose Solutions

Agents tend to write more code than necessary.

- [ ] Could this be simplified to fewer lines or fewer functions?
- [ ] Are any libraries imported but not used?
- [ ] Are there abstractions that are never referenced elsewhere?

## 3. Missing Edge Cases

Agents handle the common case well but ignore the uncommon ones.

- [ ] What happens when the input is empty/null/None?
- [ ] What happens when the network times out?
- [ ] What happens when the file is larger than available memory?
- [ ] What happens when two requests arrive simultaneously?
- [ ] What happens when a dependency returns an unexpected response?

## 4. Copy-Paste Patterns

Agents duplicate logic rather than extracting it.

- [ ] Is the same logic written in more than one place?
- [ ] If so, should it be extracted into a shared function?

## 5. Silent Failures

Agents catch exceptions but do nothing useful with them.

- [ ] Every exception handler either recovers, re-raises, or logs with context.
- [ ] No bare `except:` or `except: pass` blocks.
- [ ] Default values are not returned when an error should be raised.
- [ ] Logging is at the correct level (error, not debug, for failures).
```

### 8. Create the `docs/reference/` Directory

Create the directory and add both checklist files. Add a `README.md` inside the directory explaining its purpose:

```markdown
# Reference Materials

Standalone quick-reference documents for daily use with the AgentGuide.

## Available References

- [Pre-Merge Checklist](pre-merge-checklist.md) — 11-point checklist for
  reviewing agent-generated code before merging.
- [Agent Code Review Checklist](agent-code-review-checklist.md) — Common
  agent failure modes and what to check for.

## How to Use

Print these, pin them to your monitor, or keep them open in a second
editor tab while working with agents. Run through the relevant checklist
before every merge.
```

### 9. Update the README

Add a new section to `README.md` referencing the reference materials:

```markdown
## Reference Materials

Quick-reference documents for daily use:

| File | Description |
| ---- | ----------- |
| `docs/reference/pre-merge-checklist.md` | 11-point checklist for reviewing agent code |
| `docs/reference/agent-code-review-checklist.md` | Common agent failure modes |
| `writing-production-code.md#appendix-a-glossary-of-terms` | Glossary of technical terms |
| `writing-production-code.md#appendix-b-decision-trees` | Decision aids for agent usage |
| `writing-production-code.md#appendix-c-prompt-templates` | Reusable prompt templates |
| `writing-production-code.md#appendix-d-suggested-reading-path` | Staged learning plan |

See also `docs/phases/` for the project's development plan and phase documents.
```

Also update the Project Structure section in `README.md` to include `docs/reference/`.

### 10. Verify Everything

After making all changes:

1. Run `make lint` and confirm it passes.
2. Open `writing-production-code.md` and visually verify:
   - The TOC appears before Section I and all links work.
   - The glossary contains all required terms and is alphabetically ordered.
   - The decision trees render correctly as ASCII diagrams.
   - The prompt templates have consistent bracket notation.
   - The learning path maps to existing section numbers.
3. Open each `docs/reference/*.md` file and verify formatting.
4. Give the updated repo to a colleague who has not seen it. Time how long it takes them to find:
   - The pre-merge checklist
   - The definition of "mutation testing"
   - A prompt template for a bug fix
   - Whether they should use an agent for a given task
   All four should take under 30 seconds each.

---

## Acceptance Criteria

Before renaming this file to `08-reference-architecture_COMPLETED.md`, verify:

### Table of Contents

- [ ] A table of contents exists at the top of `writing-production-code.md`, before Section I
- [ ] The TOC links to all 15 major sections (I–XV)
- [ ] The TOC links to every named subsection (all `###` headings)
- [ ] All anchor links work correctly on GitHub
- [ ] The TOC is formatted as a nested bullet list

### Glossary

- [ ] `## Appendix A: Glossary of Terms` exists after Section XV
- [ ] At least 30 technical terms are defined
- [ ] Entries are alphabetically ordered
- [ ] Each entry includes a section reference in parentheses
- [ ] Definitions are in plain UK English (1-2 sentences each)

### Decision Trees

- [ ] `## Appendix B: Decision Trees` exists after the glossary
- [ ] At least three decision trees are included:
  - [ ] "Should I Use an Agent for This Task?"
  - [ ] "Iterate or Regenerate?"
  - [ ] "Which Verification Technique?"
- [ ] Each decision tree is formatted as an ASCII diagram with clear branches
- [ ] Each decision tree includes practical, actionable outcomes

### Prompt Templates

- [ ] `## Appendix C: Prompt Templates` exists after the decision trees
- [ ] At least four templates are included:
  - [ ] Bug Fix template
  - [ ] New Feature template
  - [ ] Test Writing template
  - [ ] Code Review Request template
- [ ] Each template uses consistent `{bracket}` notation for placeholders
- [ ] Each template includes constraints and acceptance criteria

### Suggested Reading Path

- [ ] `## Appendix D: Suggested Reading Path` exists after the prompt templates
- [ ] The path is divided into at least three stages (Week 1, Week 2, Week 3)
- [ ] Each stage lists specific sections with time estimates
- [ ] A "Reference Only" section identifies sections for later reading
- [ ] Each stage has a concrete "Goal by end of" statement

### Reference Directory and Files

- [ ] `docs/reference/` directory exists
- [ ] `docs/reference/pre-merge-checklist.md` exists with the 11-point checklist
- [ ] `docs/reference/agent-code-review-checklist.md` exists with agent failure mode checks
- [ ] `docs/reference/README.md` exists explaining the directory

### README Updates

- [ ] A "Reference Materials" table was added to `README.md`
- [ ] All six reference items (3 files + 3 appendix anchors) are listed
- [ ] The Project Structure section was updated to include `docs/reference/`

### Quality

- [ ] `make lint` passes with no errors
- [ ] All files use UK English exclusively
- [ ] All code blocks have language specifiers
- [ ] The total additions are informative without bloating the document
- [ ] A new reader can find any of the four test items (checklist, glossary, template, decision tree) in under 30 seconds each

---

## Dependencies

- Phase 7 (Documentation Completion) — the README must exist with the current structure for updating

## Estimated Time

4–6 hours.
