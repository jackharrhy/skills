---
name: prune-comments
description: Remove redundant, stale, and verbose code comments and docstrings, preferring clear names and simple functions. Use when asked to clean up comments, remove comment slop, or review comment quality.
---

# Prune Comments

Prefer removing a comment over keeping or rewriting it.

Keep only context a reader cannot reasonably infer from the code.

Stay within the requested scope.

## Let the code speak

- Delete narration of obvious operations, redundant function summaries, decorative banners, and parameter descriptions that merely repeat names or types.
- Express intent with clear, concise variable and function names and simple function definitions. Make small, behavior-preserving naming improvements when permitted; update all references.
- Do not replace comments with sentence-length identifiers, unnecessary helper functions, or a broad refactor.
- Remove commented-out dead code and resolved TODOs after verifying they are obsolete.

## Keep only missing context

Retain concise explanations of non-obvious constraints, domain rules, units, invariants, external quirks, safety requirements, or tradeoffs that still govern this code.

For each comment, ask: **What would a competent reader misunderstand if this disappeared?** If nothing, delete it. Otherwise keep the shortest accurate explanation, close to the relevant code. Do not invent intent or rationale to justify keeping a comment.

Describe the code as it exists, not the editing journey. Remove accounts of prior implementations, change announcements, and phrases such as "previously" or "now we.".

Example: replace "Previously we retried all requests, but now we only retry reads" with "Writes are not retried because the provider cannot deduplicate them" only if that constraint is verified. If the code already explains everything, remove the comment entirely.

## Verify

Run relevant syntax, lint, or test checks in proportion to the edits, especially after renaming symbols.

Do not add tests that merely pin comment wording. Briefly summarize removals, any naming improvements, and what was actually checked.
