---
name: prune-comments
description: Remove redundant, stale, and verbose code comments and docstrings, preferring clear names and simple functions. Use when asked to clean up comments, remove comment slop, or review comment quality.
---

# Prune Comments

Treat comment-heavy code as a reduction task: remove noise throughout the requested scope, then add only missing context that earns its place. Do not stop after a few obvious deletions or rewrite every removed comment.

For each implementation comment, ask: **What specific misunderstanding or harmful edit does this prevent?** If the answer is already clear from nearby code, delete it. “Explains why” is insufficient when the explanation merely restates visible logic. Evaluate API documentation for callers who should not need to inspect the implementation.

## Prune

- Remove obvious narration, redundant summaries, decorative dividers, test-phase labels, and empty documentation tags unless they serve a functional purpose.
- Remove commented-out dead code and verified obsolete TODOs. Keep meaningful unresolved TODOs; an issue link is not required.
- Prefer clear names and simple functions. Make small behavior-preserving naming improvements when permitted, updating references; avoid sentence-length identifiers, unnecessary helpers, and broad refactors.
- Remove editing history and change announcements. Retain verified context that still explains the design.
- Judge whole blocks, not just sentences: delete redundant blocks outright and reduce useful blocks to the constraint they carry. Consolidate repeated explanations at their owning declaration or boundary; keep local warnings where readers need them.

## Add only earned context

Look for missing explanations as well as excess prose. Add or replace a comment when a plausible future change would violate a non-obvious contract and the code cannot reasonably communicate the constraint itself.

A new comment must state a concrete fact, be supported by code, tests, specifications, or verified dependency behavior, and help the reader act correctly. Prefer the constraint and consequence over a walkthrough: what must remain true, why an obvious alternative fails, or when a workaround can be removed. Include a useful reference when needed, but state the essential fact locally.

Do not add generic cautions, speculative rationale, restated signatures, or descriptions of the cleanup itself. One useful addition does not justify retaining surrounding noise. Removal and addition counts are not targets.

## Preserve meaning and function

Keep concise explanations of non-obvious domain rules, units, invariants, safety constraints, ownership, lifecycle, ordering, cleanup, and platform quirks. Algorithm or regular-expression explanations can help even when they describe what the code does. Keep needed explanations close to the relevant code without imposing a fixed length.

Resolve stale, conflicting, or unclear assertions using surrounding code and available evidence. Do not invent rationale. If uncertainty remains about a possible contract, preserve it and report the question.

Preserve useful API purpose, usage, and behavior documentation. Account for comments and docstrings consumed by tools, generated documentation, runtime introspection, or tests. Keep directives, tool-consumed annotations, suppression reasons, licenses, attribution, and functional navigation markers. Respect generated-file boundaries and upstream templates maintained for upgrade compatibility.

## Verify

Review the diff for lost meaning and unintended code changes. For large comment-only sweeps, AST or token equivalence can help check executable syntax; it cannot establish that comment consumers or reader understanding are unaffected.

Run existing syntax, lint, documentation, or test checks in proportion to the edits and affected consumers, including any symbol renames. Routine pruning does not require new parser automation or tests that pin comment wording.

Briefly summarize removals, the concrete value of any additions, and what was actually checked.
