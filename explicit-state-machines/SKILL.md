---
name: explicit-state-machines
description: Find implicit state machines and make application lifecycles explicit. Use when auditing or refactoring scattered flags, status fields, callbacks, and workflow transitions for clearer UX, DX, and agent understanding.
---

# Explicit State Machines

Find the implicit state machines in the requested scope (which might be broad, such as the entire application) and make their behavior easier for users, developers, and agents to understand. Choose the smallest representation that expresses the real lifecycle and preserves supported behavior.

## Discover the lifecycle

Trace related state reads and writes across callers, persistence, callbacks, and cleanup. Look for correlated booleans, combinations of nullable fields, repeated status checks, and lifecycle rules hidden in timestamps, retries, or resource ownership.

Identify meaningful states, events, legal transitions, guards, effects, and invariants from actual behavior and domain rules. Distinguish intentional behavior from demonstrated bugs; do not invent product policy to complete a diagram. For broad audits, give a compact inventory and prioritize consequential workflows rather than stopping at the easiest flags.

## Make the model explicit

- Remove redundant stored state where it can be derived. Independent booleans with valid combinations can stay independent.
- Use a named status for simple alternatives; use a discriminated union when each state needs different data. Keep useful prior data separate from current activity when the UX requires it.
- Give transition policy a clear owner. An enum alone does not enforce legal transitions. Use ordinary functions, reducers, or transition tables as appropriate; introduce hierarchy, parallel states, or a library only when they simplify real complexity.
- Make effect ownership and lifetime clear: starting, completing, canceling, timing out, and cleaning up. Account for stale responses and overlapping attempts where applicable.
- For durable workflows, preserve transactional boundaries, concurrency control, idempotency, and recovery after uncertain external outcomes. Renaming a status does not make replay safe.

Migrate affected readers and writers together. Preserve supported APIs, stored data, identity, and recovery behavior. Keep states and events discoverable in the owning code; add a diagram or transition table when it clarifies something the code does not already show. Avoid a second model that must be synchronized manually.

## Verify behavior

Test meaningful event sequences and invariants, including relevant invalid transitions, retry, cancellation, late completion, and restart cases. Prefer observable outcomes over tests that merely repeat the transition table. Use model-based testing when interacting sequences justify it.

Check user-visible loading, failure, recovery, and retained-data behavior as well as internal correctness. Report which lifecycles changed, what guarantees improved, actual validation, and unresolved policy questions. Judge success by clearer behavior and fewer invalid paths, not machine count.

## Further reading

- [Kent C. Dodds: loading states](https://kentcdodds.com/blog/stop-using-isloading-booleans)
- [Greg Reimer: discriminated unions](https://dev.to/greim/writing-industrial-strength-typescript-with-discriminated-unions-eo3)
- [Brandur Leach: durable recovery points](https://brandur.org/idempotency-keys)
