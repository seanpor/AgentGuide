# Phase 13: Targeted Guardrail Improvements from Industry Research

**Status:** Completed  
**Date:** 2026-05-30  

## Goal

Review recent industry research on guardrails for LLM-generated code and apply the most impactful findings to the guide.

## Sources Reviewed

1. **Bright Security** — "5 Best Practices for Reviewing and Approving AI-Generated Code" (Jan 2026). Covers mental model of treating AI output as untrusted, reviewing behaviour over syntax, demanding evidence over explanations, human ownership, and early security integration.

2. **Beagle Security** — "Using AI-Generated Code Safely" (Dec 2025). Covers secure prompt templates, SBOM requirements, dependency typosquatting, over-privileged IaC defaults, supply-chain risks, and agent governance.

3. **Corridor** — "Secure Coding Practices for AI-Assisted Development" (2026). Covers security-focused prompting, automated guardrails, trust-but-verify mindset.

4. **DevOpsie** — "Practical Guardrails for AI-Generated Kubernetes Manifests" (Jan 2026). Covers layered pipeline: prompt constraints, static validation, policy-as-code, signing, sandbox testing, GitOps controls.

5. **Veracode** — "Secure AI Code Generation: From Policy to Practice" (Feb 2026). Covers injection flaws, context blindness, and dependency risks in AI-generated code.

6. **MyEngineeringPath** — "AI Guardrails — Production LLM Safety Guide" (2026). Compares NeMo Guardrails, Guardrails AI, LLM Guard with latency benchmarks.

## Gap Analysis

| Topic | In Document? | Action |
| --- | --- | --- |
| Behavioural vulnerabilities (auth on one path, client-trusted state) | No | Added to Section XII agent failure modes |
| Typosquatting and SBOM governance | No | Added to Section III dependency discipline |
| Demand evidence over explanations | Partial (confidence illusion in V) | Sharpened in Section XII |
| Secure prompt patterns for security | Partial (generic templates in App C) | Added security-specific subsection to Appendix C |
| Code ownership principle | Partial (ownership paradox in XII) | Added explicit rule |
| SBOM glossary term | No | Added to glossary |

## Changes Made

### 1. Section III — Dependency Discipline (lines 249–259)

Added a fourth question to the dependency checklist: verified against typosquatting, SBOM maintenance, and regular CVE scanning.

### 2. Section XII — Code Review (lines 1071–1078)

Added a new agent failure mode: behavioural vulnerabilities (auth checks on one code path, client-trusted state, replay without revalidation). Includes the review heuristic: "mentally execute the code as an attacker would."

### 3. Section XII — Ownership Paradox (line 1085)

Added a concise rule: "Every piece of agent-generated code must have a clear human owner."

### 4. Appendix C — Prompt Templates

Added "Template 5: Secure Code Generation" with security-specific prompt patterns (bcrypt, parameterised queries, input validation, least-privilege IaC, rate limiting, etc.).

### 5. Glossary

Added **SBOM (Software Bill of Materials)** definition.

### 6. Custom Dictionary

Added `typosquatting` and `SBOM` to `.hunspell_en_GB`.

## Verification

- `make lint`: all checks pass
- All changes are UK English
- No immutable files modified
- Working tree committed

## Key Decisions

- Only four targeted document edits: the guide is in its final prose pass (Phase 12). New content should fill specific gaps rather than expand scope.
- Behavioural vulnerabilities as a new failure mode in Section XII — this is the single most actionable insight from the research and addresses a gap no existing section covered.
- SBOM and typosquatting in Section III — dependency discipline was already strong; adding supply-chain governance completes the picture.
- Secure prompt templates in Appendix C — keeps the main document clean while providing reference material.
