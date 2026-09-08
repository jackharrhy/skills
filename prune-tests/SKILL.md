---
name: prune-tests
description: Audit and simplify test suites by removing slop, tautologies, redundant tests, and low-value flaky tests. Use when asked to prune tests, reduce test bloat, or review test value.
---

# Prune Tests

Optimize for useful regression protection with the fewest maintainable tests, not test count or coverage percentage. Prefer deletion over repairing tests that do not earn their keep.

Ask: **What plausible bug does this test catch, and is that protection already provided by a better test?** Evaluate inputs and assertions, not just executed lines.

## Delete or consolidate

- Delete tautologies: self-comparisons, expected values recomputed by the same logic, and assertions that a mock returns its configured value.
- Delete tests of trivial plumbing, framework defaults, or implementation details when they protect no meaningful contract.
- Delete obsolete tests and redundant cases. Combine input/output variants only when it makes the tests simpler; preserve distinct boundaries and failure modes.
- Delete entire files when no valuable tests remain, along with fixtures, helpers, mocks, and snapshots that are genuinely unused afterward.

## Flaky tests

Confirm intermittent outcomes from available failures or repeated runs; a single failure or suspicious sleep is not proof of flakiness. Distinguish test instability from a real product race or defect.

Prefer deleting confirmed flaky tests whose protection is low-value or already covered. Do not keep them alive with retries, longer sleeps, or permanent skips. If one uniquely protects an important contract or known regression, keep it and flag the issue, or make a small deterministic repair within scope.

## Keep useful tests

- Preserve meaningful behavior checks, important boundary cases, and relevant production regressions unless equivalent protection remains or the behavior is obsolete.
- Prefer public outputs and observable effects over internal call choreography. Use real values and mock only necessary boundaries.
- Judge assertions by their contract: a no-throw smoke test or a null check can be meaningful. Do not delete from syntax alone.
- When a test's value is genuinely unclear after inspection, flag it rather than inventing a reason to delete it. Never change production behavior or weaken assertions just to make tests pass.

## Verify

Run affected tests, then the remaining suite when practical. Report deletions and consolidations with brief reasons, any meaningful protection lost, and actual validation results.
