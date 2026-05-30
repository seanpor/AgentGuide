# Phase 12: Economist-Style Prose Tightening

## Objective

Apply the remaining six of Orwell's six rules to `writing-production-code.md` beyond what Phase 9 (tone) and Phase 11 (AI-signal reduction) covered. The target register is The Economist: short words, active voice, no unnecessary words, no clichés, plain English.

## Why This Matters

Phase 9 established the tone (lead with conclusion, remove throat-clearing, end on the important word). Phase 11 removed AI-typical patterns (em dash overuse, negative parallelism, rule-of-three padding). What remains is prose that is correct but still wordier than the target register. The Economist's style guide is explicit: "If it is possible to cut out a word, always cut it out." This phase applies that principle pervasively.

Orwell's six rules (from "Politics and the English Language"):

1. Never use a metaphor, simile, or other figure of speech you are used to seeing in print.
2. Never use a long word where a short one will do.
3. If it is possible to cut out a word, always cut it out.
4. Never use the passive where you can use the active.
5. Never use a foreign phrase, a scientific word, or a jargon word if you can think of an everyday English equivalent.
6. Break any of these rules sooner than say anything barbarous.

This phase targets Rules 1-5 specifically. Rule 6 is the escape valve.

## What To Do

### Rule 2: Short Words

Replace long or Latinate words with short everyday alternatives:

| Long | Short |
| --- | --- |
| in the course of | during, in |
| subsequently | then, later |
| sufficient(ly) | enough |
| demonstrate(s/ed) | show(s) |
| utilise(s/d) | use(s) |
| initiate | start |
| regarding | about |
| internalise(d) | learn(ed) |
| articulate | say |
| implement (as verb) | use, build, add |
| diminish(es/ed) | fade(s), drop(s) |
| exhaustively | fully |
| approximately | about |

Search the document for each long word and replace where it reads naturally.

### Rule 3: Cut Every Unnecessary Word

Target these patterns:

- `in order to` → `to` (already eliminated in Phase 9)
- `in the same way` → `as`
- `is a concept to understand` → `understand this concept` (done — 6 instances replaced)
- `This is not about X. It is about Y` → `This is not about X. It ensures Y.` or restructure
- `the way you would` → `as you would`
- Cut filler words: `modern`, `actual`, `very`, `really`, `quite`, `rather`
- Cut redundant phrases: `in a single session` → `in one session`
- `you are responsible for` → `you own`
- `falls victim to` → `is compromised by`

### Rule 4: Active Voice

Search for `is/was/are + past participle` and rewrite in active voice where the subject is clear.

Common patterns:

- `should be configured` → `configure`
- `can be measured` → `measure`
- `is written for` → `is for`
- `should not contain` → `do not include`
- `If the agent is compromised by` → keep if agent is the subject

### Rule 5: Plain English

Remove or replace jargon where an everyday word works:

- `architectural` → `structural` (where it means structure, not design)
- `utilise` → `use` (already done above)
- `paradigm` → `model` or delete

### Rule 1: Worn Metaphors

Search and replace:

| Cliché | Replacement |
| --- | --- |
| raises the bar | helps (done) |
| speed bumps, not walls | keep (domain-specific, accurate) |
| shouting in an empty room | keep (vivid, not a cliché) |
| vending machine | keep (clear analogy) |
| the oldest joke in software engineering | the oldest joke in the trade (done) |
| cheerful confidence | usual confidence (done) |
| given sufficient rope | delete/restructure (done) |
| cosy arrangement | delete/restructure |
| theatre (tests are theatre) | keep (effective) |

## Acceptance Criteria

- [ ] No "in the course of" or "in the same way" or "the way you would" in prose (code examples exempted)
- [ ] No long-word alternatives where short-word equivalent exists
- [ ] No clichés from the worn-metaphors list remain
- [ ] Active voice preferred in all imperative instructions
- [ ] `make lint` passes with exit code 0
- [ ] No technical definitions, code examples, or factual claims altered
- [ ] Document reads in The Economist register — a reader should not be able to identify it as AI-written on style grounds

## Implementation

1. Search for each target pattern using grep
2. Apply edits with the replacement table above
3. Read the first page aloud after each batch — the rhythm should tighten
4. Run `make lint` after completion

## Dependencies

- Phase 9 (Tone and Gap Closure) — register established
- Phase 11 (Reduce AI-Writing Signals) — dashes/parallelism/threes handled
- Phase 12 is the final prose pass. After this, the text should be in its target register.

## Estimated Time

1-2 hours.
