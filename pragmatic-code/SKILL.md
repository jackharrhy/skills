---
name: pragmatic-code
description: Apply practical coding standards when designing, implementing, reviewing, or simplifying code. Favor readability, small interfaces, explicit behavior, restrained testing, and a functional style where it helps.
---

# Pragmatic Code

Optimize for code a developer can read, run, inspect, and change.

Prefer fewer concepts and straightforward solutions. Favor a functional style where it improves clarity: plain data, functions with clear inputs and outputs, and predictable state changes.

Choose the simplest design that fits the language, project, and problem.

## Make abstractions earn their keep

- Put substantial useful behavior behind a small interface. Judge simplicity by what callers must understand, not how short the implementation looks.
- Before adding a wrapper, interface, factory, builder, manager, or generic helper, identify the concrete complexity it removes. Check actual callers: shared method names or a hypothetical future implementation do not alone justify polymorphism.
- Imagine deleting the abstraction. If the code becomes simpler, inline it. If important knowledge would spread across callers, keep a suitable boundary.
- Allow modest duplication when the cases have different reasons to change. Consolidate repeated domain knowledge, not coincidentally similar syntax. When a helper accumulates caller-specific flags and branches, consider inlining each caller's relevant behavior before looking for a better shared concept.
- Group code around cohesive behavior and knowledge. Avoid splitting one operation across many files or making every table require a repository and service.
- One caller does not automatically make an abstraction bad: a parser, algorithm, or resource boundary may still hide substantial complexity.

## Keep code easy to follow

- Prefer direct calls and composition over inheritance hierarchies and elaborate design patterns. Use classes when they make ownership, behavior, or integration clearer; do not introduce them merely to group stateless functions.
- Keep related logic together. A cohesive function can be moderately long. Extract a helper when it introduces a useful concept, hides distracting detail, or consolidates behavior.
- Make control flow visible with ordinary branches and early exits where they reduce nesting.

## Choose clear data and state

- Prefer ordinary records, structs, collections, and simple types that are easy to construct, inspect, and pass around.
- Represent meaningful alternatives explicitly instead of combining flags and optional fields into invalid states. Use the simplest types that preserve the needed guarantees.
- Favor functions that return results without unexpectedly changing their inputs. Prefer immutable shared data where practical.
- Give authoritative state and policy a clear owner. Derive values rather than storing another synchronized copy; introduce caches only for a concrete cost, with a clear lifetime and invalidation rule.
- Where natural, compute decisions or next state with plain functions, then perform I/O and apply state changes at a clear boundary. Do not introduce mandatory layers or a command framework to make a small operation look functional.

## Handle failures honestly

- Parse untrusted input into a known shape at entry points, preserving established guarantees in the returned data so callers need not rediscover them. Remove redundant internal validation only when that guarantee holds; mutable external state may need checking again at the point of use.
- Make expected failure behavior clear using the language's idioms. Use result values or exceptions according to the existing contract and which is easier to follow.
- Keep failures observable. Retries, fallbacks, and compatibility paths need a real recovery or supported-behavior contract; do not turn unexpected failures into plausible-looking success.

## Keep costs visible

Consider work as well as code size: repeated I/O, unbounded queues, retained memory, and hidden retries can make short code expensive. Bound work where the workload requires it. Use rough cost estimates during design and measurements for disputed bottlenecks; avoid speculative optimization machinery.

## Reconsider the complete change

Before finishing, ask: **Starting from the original problem, would I still introduce this design?** Prefer the smallest complete solution using existing responsibilities and representations. Passing tests do not establish that every added layer is necessary.

Remove superseded paths and migrate affected callers within scope, preserving supported APIs, stored data, and meaningful compatibility. Verify the changed behavior and relevant consumers. Judge simplification by the concepts, state, and coordination removed, not a line-count target.
