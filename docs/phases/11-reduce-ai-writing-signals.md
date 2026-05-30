# Phase 11: Reduce AI-Writing Signals in Prose

## Objective

Remove stylistic patterns that cause the guide to register as AI-generated text against the well-known Wikipedia "Signs of AI Writing" field guide. The primary target is em dash overuse (163 instances in ~1,700 lines). Secondary targets are negative parallelism constructions and rhetorical rule-of-three filler.

## Why This Matters

The Wikipedia field guide (WP:AISIGNS) catalogues writing patterns typical of LLM output. Our guide avoids the most damning signals — puffery, vagueness, regression to the mean, superficial analyses — because it is specific. But it scores poorly on three quantifiable signals:

1. **Em dash frequency (163)** — Wikipedia notes LLMs "use em dashes more often than nonprofessional human-written text" and "in places where humans are more likely to use commas, parentheses, colons." Our rate of ~1 per 10 lines puts it in AI-typical territory.

2. **Negative parallelism constructions ("Not X, but Y")** — A recognised LLM pattern. The guide has at least two prominent instances ("not a prompting error but a thinking error", "not about writing better prompts but about building better constraints").

3. **Rule of three (rhetorical filler)** — While most three-item lists in the guide are substantive, some are rhythmic padding that matches the AI pattern.

A guide about working with AI agents that itself reads like AI output undermines its own authority. This phase is a targeted editing pass: em dash reduction (not elimination — they are a legitimate tool), parallelism replacement, and rule-of-three tightening.

## What To Do

### Part One: Em Dash Reduction

Reduce the em dash count from 163 to approximately 80-90. Replace each instance with one of:

| Replacement | When | Example |
| --- | --- | --- |
| **Colon** | When the dash introduces a definition or explanation | "publicly disclosed security flaws known as CVEs (Common Vulnerabilities and Exposures) — each assigned a unique identifier" → "publicly disclosed security flaws known as CVEs (Common Vulnerabilities and Exposures): each assigned a unique identifier" |
| **Comma** | When the dash sets off a mild parenthetical | "will review it — and verify the justification" → "will review it, and verify the justification" |
| **Period + new sentence** | When the dash introduces a standalone thought | "The machine was a fast typist with good instincts — nothing more." → "The machine was a fast typist with good instincts. Nothing more." |
| **Restructure** | When the dashes bracket a long appositive | "The tools available to you now — Claude, GPT, Gemini, DeepSeek, and the open-source models running on local hardware — are not autocompletes." → "The tools available to you now are not autocompletes. Claude, GPT, Gemini, DeepSeek, and the open-source models running on local hardware are autonomous agents." |

#### Categories of em dashes to keep (do not touch these)

- Dashes used for conversational interruption or contrast in short, punchy sentences: "Constraints are not limitations — they are specifications."
- Dashes used to set off a list within a sentence where commas would cause ambiguity: "Three things — formatters, linters, scanners — catch what the others miss."
- Dashes in code blocks or quoted examples (these are not prose choices).
- Dashes in the TOC or appendix entries.

#### Categories of em dashes to replace (target these first)

- Dashes where a colon would serve: "a set of checks that code must pass — a full worked example — a task taken from prompt to merge"
- Dashes where a comma or no punctuation would suffice: "a colleague you don't entirely trust — will review it — possibly introducing bugs"
- Dashes before trailing conjunctions: "and the open-source models running on local hardware —" (appositive list fits better without dashes)
- Dash pairs that bracket a long interruption: anything longer than 8 words between dashes should be restructured.
- Dashes used to introduce definitions inline: prefer a colon or restructure as a separate sentence.

### Part Two: Negative Parallelism Replacement

Replace the two "Not X, but Y" constructions with alternative forms that do not match the AI pattern.

**Instance 1 (Section II, line 142):**
> The most common mistake engineers make with AI agents is not a prompting error but a thinking error.

Replace with:
> The most common mistake engineers make with AI agents is a thinking error, not a prompting error.

(Reverses the order — puts the positive claim first, then corrects.)

**Instance 2 (Section I, line 126):**
> production-quality code is not about writing better prompts. It is about building better constraints.

This is actually two sentences, not a single "not X but Y" construction. It would only match the AI pattern if someone reads it as one rhetorical unit. Leave it. But consider tightening to eliminate any perceived pattern.

### Part Three: Rule-of-Three Tightening

Search the document for lists of three that serve as rhythmic padding rather than substantive enumeration. Replace with two items (which reads more decisive) or four (which reads more comprehensive).

Candidates to review:

- "It wastes context, wastes tokens ... wastes time, and produces worse results" — three-item list of wastes. Consider condensing.
- "Readable code uses clear names, small functions, and obvious control flow." — substantive, keep.
- "every module has a designated human owner, and every pre-merge checklist includes the question" — this is two items, not three. Let the pattern be context-dependent.

## Acceptance Criteria

- [ ] Em dash count reduced from 163 to ~85 (±10)
- [ ] No em dash is replaced where it creates ambiguity
- [ ] No em dash is replaced in code blocks or quoted examples
- [ ] The two negative parallelism constructions are restructured
- [ ] Rule-of-three padding is reduced but substantive three-item lists are preserved
- [ ] `make lint` passes with exit code 0
- [ ] A reader familiar with WP:AISIGNS would not flag the guide as AI-generated on first reading
- [ ] The "Economist register" established in Phase 9 is preserved (em dashes are part of that register, just used more sparingly)

## Line-Edit Approach

1. Identify all 163 em dashes (grep `rg ' — '`)
2. Classify each into KEEP or REPLACE
3. Apply replacements in a single pass
4. Read the first 20 lines of each section aloud — the dash rhythm should be less noticeable
5. Run `make lint`

## Dependencies

- Phase 9 (Tone and Gap Closure) — the register must be established before this thinning pass

## Estimated Time

2-3 hours.
