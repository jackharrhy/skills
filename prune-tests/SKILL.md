---
name: prune-tests
description: Audit and simplify test suites by removing slop, tautologies, redundant tests, and low-value flaky tests. Use when asked to prune tests, reduce test bloat, or review test value.
---

# Prune Tests

Optimize for useful regression protection with fewer maintainable tests, not test count or coverage percentage. Ask: **What plausible bug does this test catch, and does a better test already catch it?** Prefer deletion when a test does not earn its keep.

## Judge protection in context

Read candidate tests with the implementation and nearby tests. Evaluate inputs, assertions, and the path actually exercised; titles and assertion styles are only clues. A no-throw check, null check, or mock-call assertion can protect a real contract. Flag uncertain value rather than inventing grounds for deletion.

Give each behavioral contract a primary owner at the cheapest production boundary that reaches its credible failure. Another layer should cover a distinct risk, such as transport or lifecycle behavior. Claimed redundancy needs a surviving test that catches the same failure, not merely executes the same code. Preserve unique regressions and distinct boundaries, especially security, persistence, protocol, and concurrency contracts.

For broad reductions, work in reviewable batches with brief reasons. Do not target a deletion percentage or change production behavior to make tests pass.

## Delete or consolidate

- Remove tautologies, expectations computed by the same logic under test, and assertions that mocks return their configured values. Fixtures and mocks must not fabricate the behavior asserted: persistence protection needs the actual writing path; ordering needs events produced by the owning code.
- Remove assertions that restate static types for locally constructed values. Keep runtime validation of untrusted inputs and external formats.
- Remove trivial forwarding, framework-default, and basic-rendering tests without a meaningful application contract. Preserve translation, policy, resource ownership, interactions, and application accessibility behavior.
- Collapse redundant cases and table rows when they cover the same rule. Retain distinct failure modes; combine variants only when doing so simplifies the tests.
- Replace or remove implementation-coupled assertions that break on behavior-preserving refactors. Source greps and copied inventories rarely prove behavior, but static checks can protect independent byte, path, package, or architecture contracts. Irrelevant identifier changes should not invalidate them.

When repairing or replacing a valuable test, ensure its name matches its exercised behavior. Negative cases must reach the intended guard, not pass through unrelated rejection. For regression replacements, verify failure before the fix for the intended reason when feasible; disclose unavailable evidence. Never weaken assertions merely to get green results.

## Timing and instability

Distinguish incidental wall-clock thresholds from deliberate timing contracts. Preserve deterministic clock tests, race regressions, and meaningful performance, compiler, or dependency-upgrade guards under suitable conditions.

Confirm flakiness from failure evidence or repeated runs; one failure or a suspicious sleep is insufficient. Order-dependent failures may expose leaked state from earlier tests: reproduce the original shard or order when relevant. A baseline failure can still be a product bug.

Delete confirmed flaky tests when protection is low-value or duplicated. For unique important protection, make a small deterministic repair within scope or retain and flag it. Retries, longer sleeps, and permanent skips are not repairs.

## Clean up and verify

Remove empty files and suites, unused fixtures, helpers, hooks, snapshots, and dependencies. Check affected test lists, scripts, documentation links, and CI configuration. Remove obsolete test-only exports, flags, wrappers, or injection seams only after checking production callers, public API obligations, and side effects; useful dependency injection is not itself a problem.

Run surviving affected tests and relevant type, lint, or unused-code checks; broaden to the remaining suite as practical. After large browser-test reductions, check whether survivors relied on removed files to trigger shared setup or dependency pre-bundling.

Before calling failures pre-existing, compare against the unchanged base under the same conditions. Measure claimed speedups with matching commands and environments, distinguishing elapsed suite time from summed file durations. A green suite after deletion does not establish equivalent protection.

Report what was removed or consolidated and why, the surviving tests supporting redundancy claims, any meaningful protection lost, and actual validation results.
