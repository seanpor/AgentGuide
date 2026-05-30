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
- [ ] **No unnecessary dependencies added** — each verified against typosquatting; project SBOM updated; new dependencies scanned for CVEs.
- [ ] **The diff has been reviewed for unnecessary verbosity.**
- [ ] **Reviewed for behavioural vulnerabilities** — auth checks run on every code path; no client-trusted state; retries do not replay sensitive actions.
- [ ] **Designated human owner exists** — someone who can explain the code and is accountable for it.

If any item fails, the code does not merge. No exceptions.
