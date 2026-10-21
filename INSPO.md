# Inspiration

These are personal working preferences, refined through use and comparison with the sources below. This records what influenced the skills, what we took from it, and where we deliberately stopped. It is not an exhaustive history or an endorsement of every rule in a linked repository.

The shared idea: make each layer, test, and comment earn its maintenance cost. Reduce what a reader must understand while preserving useful behavior, protection, and context. Fewer lines alone do not establish a better result.

## Pragmatic code

[Skill](pragmatic-code/SKILL.md)

Code should be easy to read, run, inspect, and change. Prefer fewer concepts, clear ownership, and direct solutions. Simplicity is about the knowledge and coordination a design requires, including its callers and failure paths.

| Source | Influence |
| --- | --- |
| [OpenClaw: pr-simplify](https://github.com/openclaw/openclaw/blob/main/.agents/skills/pr-simplify/SKILL.md) | Reconsider the smallest complete fix from the original problem. Challenge new state and architecture; remove superseded paths while preserving supported contracts. |
| [Matklad: Code Smell: Concrete Abstraction](https://matklad.github.io/2020/08/15/concrete-abstraction.html) | Check whether actual callers benefit from polymorphism. Similar method names do not by themselves justify a shared interface. |
| [Sandi Metz: The Wrong Abstraction](https://sandimetz.com/blog/2016/1/20/the-wrong-abstraction) | A shared helper accumulating caller-specific flags may need to be inlined and reconsidered. Modest duplication can reveal the right boundary. |
| [Alexis King: Parse, don’t validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/) | Preserve established guarantees in data representations so downstream code need not repeatedly rediscover them. |
| [Gary Bernhardt: Functional Core, Imperative Shell](https://www.destroyallsoftware.com/screencasts/catalog/functional-core-imperative-shell) | Where useful, compute decisions with ordinary values and perform effects at a clear boundary. |
| [TigerBeetle: TigerStyle](https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md) | Centralize state changes, keep computational helpers pure, and make resource consumption understandable. Consider costs during design. |

These influences do not require a functional architecture everywhere, ban classes or generics, or justify deleting necessary compatibility. We did not adopt fixed function lengths, allocation policies, assertion quotas, or PR-size thresholds.

## Prune tests

[Skill](prune-tests/SKILL.md)

Optimize for credible regression protection per maintenance cost. Ask which plausible failure a test detects and whether a surviving test detects that same failure. Coverage overlap and similar-looking assertions are insufficient evidence of redundancy.

| Source | Influence |
| --- | --- |
| [T3 Code #22557: low-signal test purge](https://github.com/pingdotgg/t3code/pull/22557) | Concrete examples of redundant type assertions, forwarding tests, repeated cases, timing noise, and cleanup beyond test files. |
| [Auth coverage restoration in that PR](https://github.com/pingdotgg/t3code/commit/374959ebe9ec57ab4543ff1923ec68ef3065db39) | Deterministic expiry and isolation tests can protect important security contracts. Timing or mapping labels are not deletion verdicts. |
| [OpenClaw: test-audit](https://github.com/openclaw/openclaw/blob/main/.agents/skills/test-audit/SKILL.md), [audit reference](https://github.com/openclaw/openclaw/blob/main/.agents/skills/test-audit/references/audit.md), and [writing tests](https://github.com/openclaw/openclaw/blob/main/docs/help/testing/writing-tests.md) | Prefer an owning production boundary; require distinct risks for additional layers. Fixtures must not manufacture the asserted behavior, and negative cases must reach the intended guard. |

Aggressive pruning still needs judgment. Preserve meaningful static contracts, deterministic races, and unique regressions. We did not adopt deletion percentages, blanket timer or smoke-test bans, mandatory agent voting, or repository-specific execution campaigns.

## Prune comments

[Skill](prune-comments/SKILL.md)

Comment-heavy code deserves a thorough reduction pass. Remove narration and repeated context, then add only verified facts that prevent a specific misunderstanding or harmful edit. Good additions explain a constraint and its consequence; they do not narrate the cleanup.

| Source | Influence |
| --- | --- |
| [T3 Code #19559: narration and history cleanup](https://github.com/pingdotgg/t3code/pull/19559) | Remove redundant summaries, history, dividers, and empty documentation tags while preserving directives and suppression reasons. Parser comparisons can help verify large comment-only changes. |
| [T3 Code #21514: follow-up comment reduction](https://github.com/pingdotgg/t3code/pull/21514) | Even a “why” comment can repeat visible logic. Reduce useful blocks to their actual constraint instead of replacing deleted narration with longer rationale. |
| [Nitro Device Info #171: redundant comment cleanup](https://github.com/l2hyunwoo/react-native-nitro-device-info/pull/171) | Comments can feed API indexes and other tools. Preserve meaningful public documentation, functional navigation markers, and upstream template compatibility. |
| [OpenClaw #174061: production comment cleanup](https://github.com/openclaw/openclaw/pull/174061) | Review removed meaning, especially ownership, lifecycle, ordering, cleanup, and platform constraints. Its reported restoration of substantive documentation is a useful caution. |
| [Google: what to look for in a code review](https://google.github.io/eng-practices/review/reviewer/looking-for.html#comments) | Distinguish implementation commentary from caller-facing API documentation. Complex algorithms and regular expressions can merit explanation. |

Unchanged executable syntax does not prove that documentation consumers or reader understanding are unaffected. We did not adopt hard comment-length caps, mandatory issue links for TODOs, or claims that fewer comments universally improve agent performance.

## Keeping this useful

Record substantial new influences here with the decision they changed and any limits on applying them. Keep the skills themselves concise and self-contained. Repository instructions can evolve, and PR descriptions record their authors’ claims; revisit the linked code and discussion before generalizing further.
