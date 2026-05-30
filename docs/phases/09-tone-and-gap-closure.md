# Phase 9: Tone and Gap Closure

## Objective

Refine the prose register of `writing-production-code.md` to match the concision and authority of The Economist, and add six substantive sections that address gaps identified through practical experience with the target audience (junior engineers using AI agents).

## Why This Matters

From our guide, Section III (The Anatomy of Production Code):

> Readable code uses clear names, small functions, and obvious control flow. It is not clever. Clever code is a debt that compounds.

The same principle applies to prose. The document currently runs to approximately 1,600 lines. It is well-argued but uneven in register. Some passages achieve the punchy authority of good long-form journalism. Others drift into blog-post direct address ("You need to...") or include sentences that could be halved without loss.

This phase addresses two things that the previous phases did not: *how* the document speaks to its reader, and *what* it omits.

The tone work is a line-editing pass. It does not change the argument, the structure, or the examples. It tightens prose towards the register of The Economist: more conclusions before evidence, fewer words per sentence, less "you" address, more weight at the end of each sentence.

The content additions close six gaps identified through practical observation of junior engineers working with agents: they struggle to estimate effort, fail to notice agent-specific technical debt, paste proprietary code into prompts without thinking, cannot debug code they did not write, do not know who "owns" agent-written code, and miss the learning opportunity embedded in every agent interaction.

---

## What To Do

### Part One: Tone Line-Edit

Apply the following style rules consistently across every section of `writing-production-code.md`. These are not optional preferences — they are the editorial standard for this document.

#### Rule 1: Lead with the conclusion

The first sentence of every section and subsection should state the thesis. The reader should know the point before they read the evidence.

*Before:*
> Here is how you tell a professional from an amateur: look at their error handling.

*After:*
> Professionals are distinguished from amateurs by their error handling.

*Before:*
> The most common mistake engineers make with AI agents is not a prompting error. It is a thinking error.

*After:*
> The most common mistake engineers make with AI agents is not a prompting error but a thinking error.

#### Rule 2: Remove throat-clearing

Cut introductory phrases that set up context without adding information. Watch for: "Here is the thing," "It is worth noting that," "The truth is that," "What this means is," "The reality is."

*Before:*
> Here is a rule that will serve you for your entire career: never ship code you cannot explain.

*After:*
> A single rule suffices: never ship code you cannot explain.

#### Rule 3: Prefer "the engineer" to "you"

Direct address ("you must", "you should", "you need to") is appropriate for imperative instructions but loses authority when overused. For general truths, use "the engineer", "one", or the passive voice.

*Before:*
> Before you type a single prompt, do three things.

*After:*
> Three things belong upstream of any prompt.

*Before:*
> If you find yourself writing "and" when describing what a function does, it is doing too much.

*After:*
> A function described with "and" is doing too much.

#### Rule 4: End sentences on the important word

The last word of a sentence should carry semantic weight. Avoid trailing prepositions, weak verbs, or filler.

*Before:*
> The difference between these two descriptions is the difference between an agent that produces a sprawling, unfocused scaffold and one that produces a tight, testable function.

*After:*
> The difference is between a sprawling scaffold and a tight, testable function.

*Before:*
> The quality of what comes out is bounded by the quality of what goes in.

*After:*
(Leave this one alone. It is good.)

#### Rule 5: Remove intensifiers

Delete "very", "really", "extremely", "incredibly", "quite", "rather". If the adjective needs intensifying, replace it with a stronger adjective.

*Search the document for:* very, really, extremely, incredibly, quite, rather. Remove every instance.

#### Rule 6: Vary sentence length, but prefer short

The Economist's characteristic rhythm alternates a long sentence with a short one. The short sentence carries the thesis.

*Before:*
> An agent will always produce *something*. Give it a vague instruction and it will produce a vague solution — confidently, fluently, and wrong. The quality of what comes out is bounded by the quality of what goes in. This is true of every engineering tool ever made, but agents obscure it because they never refuse to answer.

*After:*
> (Lines 3-4 are good. Line 2 could be tighter.)
> An agent will always produce *something*. A vague instruction produces a vague solution — confident, fluent, and wrong. The quality of output is bounded by the quality of input. This holds for every engineering tool ever made, but agents obscure it because they never refuse to answer.

#### Rule 7: Condense the "bad vs good" pattern

The document frequently shows a bad example then a good example. This is effective teaching but can be verbose. When the contrast is obvious, show only the good example or condense the pair.

*Before:*
> A bad prompt: "Write me a function that processes user data."
> A good prompt: "Write a Python function..."

*After:*
> (Consider: do they need the bad example? The good example alone makes the point. If the bad example stays, cut the attribution line.)

#### Rule 8: Hunt for "in order to" and "not only... but also"

Replace "in order to" with "to". Replace "not only... but also" with "and" or a semicolon.

#### Specific Passages for Editing

Below are specific passages that should be rewritten as part of the line-edit. This list is representative, not exhaustive — apply the rules to the entire document.

**Passage 1 (Section I, How to Read This Guide):**

```text
This document moves from the conceptual to the concrete. It begins with how
to think before you prompt and how to work with an agent iteratively. It
then covers the cognitive traps that catch engineers new to agentic
workflows, the anatomy of production code itself, and the infrastructure of
containment, enforcement, verification, and security that makes autonomous
agents safe. It includes a full worked example — a task taken from prompt
to merge — and closes with the professional habits that tie everything
together.

Read it in order the first time. Return to specific sections as reference
thereafter.
```

Editorial notes: The first sentence is a thesis about structure — lead with it. "How to think before you prompt" → "thinking before prompting" (parallel with section title, removes "you"). Consider cutting "Read it in order the first time" as the sentence before already says this.

**Passage 2 (Section V, Cognitive Traps opening):**

```text
The Hazards of Working with Machines That Never Say "I Don't Know"

Agents are persuasive. They write fluently, they format beautifully, and
they never express doubt. This combination is dangerous for anyone who has
not yet developed the instincts to spot bad code on sight. Three traps, in
particular, catch engineers repeatedly.
```

Editorial notes: The first sentence after the subsection heading is still part of it — confusing heading vs prose. The heading contains the thesis. Lead with the risk directly: "Agents never express doubt. Their formatting and fluency disguise this." "Dangerous for anyone who has not yet developed the instincts to spot bad code on sight" is 18 words for a simple idea. → "Dangerous for anyone who trusts formatting as a signal of correctness."

**Passage 3 (Section IX, openings of subsections):**

```text
The Agent Will Leak Your Secrets

Not because it is malicious. Because it is literal.
```

These two lines are good. Leave them alone.

**Passage 4 (Section VI, opening):**

```text
Why Polite Requests Fail

The instinct, when first working with autonomous agents, is to add
instructions like "do not delete the database" or "do not access files
outside the project directory." These are prompt-based guardrails. They
do not work.
```

Editorial notes: "The instinct, when first working with autonomous agents" → "The natural instinct is" (lose 3 words). "These are prompt-based guardrails" is a definition that can be cut — the preceding sentence implies it. "They do not work" is good. → "The natural instinct is to add instructions like 'do not delete the database' or 'do not access files outside the project directory'. They do not work."

**Passage 5 (Section II, When Not to Use an Agent):**

```text
Not every task benefits from an agent. Knowing when to write code yourself
is as important as knowing when to delegate.
```

Good. Leave alone.

#### Implementation

The line-edit should be performed as follows:

1. Read each section from start to finish.
2. Apply the eight rules above.
3. Read the edited section aloud. If it does not sound like something that would appear in The Economist's technology quarterly, revise further.
4. Do not change any code examples, factual claims, or technical definitions. The tone pass is about prose register only.
5. Do not add new content during the tone pass. That is Part Two.

---

### Part Two: New Content

Add six new subsections to `writing-production-code.md`. Insert the exact text provided below.

#### Addition 1: "Estimating Agent Effort" (Section IV, after "The Economics of Iteration")

Insert a new subsection `### Estimating Agent Effort` between the existing subsection "The Economics of Iteration" (which ends with "Set a cost ceiling per task...") and the section break that follows it (`---`, line 316).

```text
### Estimating Agent Effort

How many passes will a task need? The answer is embedded in the prompt.

A one-sentence prompt produces a first draft that will be wrong in ways the prompt was too vague to prevent. Expect three or four iterations to close the gap between what you asked for and what you wanted.

A paragraph-length prompt — specifying inputs, outputs, constraints, and edge cases — typically requires one or two iterations. The agent has less ambiguity to resolve.

A page-length specification, written with the rigour of a ticket ready for a human engineer, often produces acceptable code on the first pass. The iteration happened in the writing, not in the chat.

Use this as a budgeting heuristic. If you do not know which kind of prompt you are writing, you are writing the first kind. Stop. Spend five more minutes on the specification. It will save fifteen minutes of iteration.
```

#### Addition 2: "Agentic Debt" (Section III, after "Dependency Discipline")

Insert a new subsection `### Agentic Debt` after the existing subsection "Dependency Discipline" (which ends with "...verify the justification.") and before the section break (`---`).

```text
### Agentic Debt

Agents accumulate a characteristic type of technical debt. It has a recognisable signature.

**Over-abstraction** is the most common. An agent will extract a single-use class, create a factory for a function called once, or introduce an interface with exactly one implementation. The code looks well-structured. It is not. It is just more code to maintain.

**Inconsistent style between sessions** is the second. An agent working on a fresh context window does not remember the conventions it established last week. It will use snake_case in one file and camelCase in another, mix error-handling patterns, and alternate between logging frameworks. This is not malice — it is amnesia. The solution is the enforcement pipeline defined in Section VII: formatters, linters, and scanners catch inconsistency regardless of the agent's memory.

**Unused code** is the third. Agents produce imports they never reference, functions they never call, and variables they never read. They do this because generating unused code is statistically cheaper than analysing whether it will be used. The linter catches imports. Code review catches the rest.

The diagnostic question for agentic debt is simple: would a human have written this? If the answer is no, the agent has produced something that works but is not yet production code.
```

#### Addition 3: "What Not to Paste" (Section IX, after "The Dead Man's Switch")

Insert a new subsection `### What Not to Paste` after the existing subsection "The Dead Man's Switch" (which ends with "...still survivable.") and before the section break (`---`).

```text
### What Not to Paste

The security architecture in the preceding sections assumes a motivated attacker. There is a more mundane threat: the code itself.

Every prompt sent to a cloud-based agent traverses a network, is processed on a remote server, and may be stored for training or monitoring. This includes the code you paste — which may contain proprietary logic, database schemas, API keys hidden in configuration examples, or personally identifiable information in test data.

The rule is: if you would not commit it to a public repository, do not paste it into a prompt.

For codebases that contain sensitive logic, the options are limited. Run a local model that never leaves your hardware. Or sanitise prompts by replacing real values with placeholders: `SELECT * FROM users WHERE id = {user_id}` rather than `SELECT * FROM users WHERE id = 837291`. The agent does not need real data to produce correct code.

Several incidents have been reported of proprietary source code appearing in training data for subsequent model releases. The model does not know it is your code. It will happily reproduce it for another user's prompt.
```

#### Addition 4: "Debugging Code You Did Not Write" (Section XII, after "Dropping into the Sandbox")

Insert a new subsection `### Debugging Code You Did Not Write` after "Dropping into the Sandbox" (which ends with "...not to take over the task entirely.") and before "Code Review".

```text
### Debugging Code You Did Not Write

Section II established a rule: never ship code you cannot explain. But what happens when the code is broken and you do not understand it? This is the debugging scenario unique to agentic development.

**First, ask the agent to explain its own code.** Paste the failing function and the error trace into a fresh prompt: "Explain what each line of this function does and why it is failing." The agent that wrote the code can usually diagnose it faster than a human reading from scratch.

**Second, add logging.** Ask the agent to instrument every branch of the failing function with a log statement capturing the relevant variable values at that point. Run the code. Read the logs. The path the code actually took will differ from the path you assumed.

**Third, simplify.** If the function is longer than twenty lines, ask the agent to split it into smaller functions, each named for its single responsibility. Then read each one. The process of decomposition produces understanding. By the time the function is split, you will know which piece is wrong.

If all three steps fail, the agent has produced code beyond its own ability to diagnose. Delete the function and write it yourself, testing each line as you go. The time is not wasted: you now understand the problem well enough to solve it.
```

#### Addition 5: "The Ownership Paradox" (Section XII, after "Code Review")

Insert a new subsection `### The Ownership Paradox` after "Code Review" (which ends with "...Every error path must be examined.") and before "The Pre-Merge Checklist".

```text
### The Ownership Paradox

When an agent writes most of a system, the question of who understands it becomes uncomfortable. No one wrote the code in the traditional sense. No one read every line. No one carries the mental model of the system in their head.

This is the ownership paradox: code that no human can explain is not an asset. It is deferred liability.

The mitigation is not to read every line of every agent output — that is impractical at scale. It is to ensure that every significant architectural decision is documented, every module has a designated human owner, and every pre-merge checklist includes the question: "Could I explain this module to a colleague without opening the file?" If the answer is no, the agent has not done its job. It has merely produced output.

The agent does not reduce the need for human understanding. It shifts it: from line-level recall to architectural comprehension. That is a harder skill, not an easier one.
```

#### Addition 6: "The Agent as Accelerated Apprenticeship" (Section XV, after "The Engineer You Are Becoming")

Insert a new subsection `### The Agent as Accelerated Apprenticeship` after "The Engineer You Are Becoming" (which ends with "...ship something you are proud of.").

Note: this addition must be inserted *before* the section break (`---`) and appendices that follow Section XV. If the appendices (Appendix A, B, C, D) immediately follow Section XV, insert this new subsection between "The Engineer You Are Becoming" content and the `---` before the appendices.

```text
### The Agent as Accelerated Apprenticeship

Learned helplessness is the risk of agentic development. But there is another side.

An agent that generates working code lets you read more architectures than you could build. It lets you experiment with patterns you have not mastered. It lets you see how an experienced system would approach a problem and learn from the shape of the solution rather than struggling through the syntax.

The condition is that you must read what it produces. The agent is not a replacement for learning. It is an accelerator for learning — if you treat every output as a tutorial.

The engineer who reads the agent's code, understands it, modifies it, and ships it will learn faster than the engineer who writes every line by hand. Not because the agent saves time, but because the agent provides more examples to learn from. The question is not whether you use the agent. It is whether you pay attention.
```

---

### Part Three: Verification

1. Perform the tone line-edit across the entire document.
2. Insert the six new subsections at their specified locations.
3. Run `make lint` and confirm zero errors.
4. Read the opening of each section aloud. Confirm it sounds like a publication, not a blog.
5. Verify that no code examples, factual claims, or technical definitions were altered by the tone pass.
6. Confirm that the new content does not duplicate existing passages. Check specifically that "Agentic Debt" (Addition 2) does not overlap with "Dependency Discipline" and that "Debugging Code You Did Not Write" (Addition 4) does not overlap with the existing debugging guidance in Sections II and IV.

---

## Acceptance Criteria

### Tone Line-Edit

- [ ] Every section and subsection opens with its conclusion (Rule 1)
- [ ] No introductory throat-clearing phrases remain (Rule 2)
- [ ] The ratio of "you" address to general address has been reduced — no more than 20% of sentences use direct address
- [ ] Sentences end on a content word, not a preposition or weak verb (Rule 4)
- [ ] No instances of "very", "really", "extremely", "incredibly", "quite", or "rather" remain (Rule 5)
- [ ] No instances of "in order to" or "not only... but also" remain
- [ ] The five specific passages identified above have been rewritten
- [ ] Code examples, factual claims, and technical definitions are unchanged

### New Content

- [ ] "Estimating Agent Effort" inserted in Section IV after "The Economics of Iteration"
- [ ] "Agentic Debt" inserted in Section III after "Dependency Discipline"
- [ ] "What Not to Paste" inserted in Section IX after "The Dead Man's Switch"
- [ ] "Debugging Code You Did Not Write" inserted in Section XII after "Dropping into the Sandbox"
- [ ] "The Ownership Paradox" inserted in Section XII after "Code Review"
- [ ] "The Agent as Accelerated Apprenticeship" inserted in Section XV after "The Engineer You Are Becoming"
- [ ] All six subsections use the exact text provided in Part Two (minor formatting adjustments to fit surrounding style are acceptable)
- [ ] No new content duplicates existing passages

### Quality

- [ ] `make lint` passes with zero errors
- [ ] All files use UK English exclusively
- [ ] Reading the opening of any section aloud sounds like The Economist, not a blog
- [ ] The total document length has not increased by more than 30% (six new subsections of approximately 15-25 lines each, offset by line-edit cuts)

---

## Dependencies

- Phase 8 (Reference Architecture and Navigation) — the document must have its final structural form (TOC + appendices) before tone editing begins

## Estimated Time

5-7 hours.

- 2-3 hours for the tone line-edit (applying eight rules across ~1,600 lines)
- 2-3 hours for inserting and verifying six new subsections
- 1 hour for verification and lint passes
