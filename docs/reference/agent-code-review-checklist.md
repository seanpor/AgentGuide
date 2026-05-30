# Agent Code Review Checklist

When reviewing code written by an AI agent, check specifically for these common failure modes.

## 1. Hallucinated APIs

Does the code call functions or methods that do not exist? Verify every external call against actual library documentation.

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
