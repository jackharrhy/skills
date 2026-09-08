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
- Before adding a wrapper, interface, factory, builder, manager, or generic helper, identify the concrete complexity it removes.
- Imagine deleting the abstraction. If the code becomes simpler, inline it. If important knowledge would spread across callers, keep a suitable boundary.
- Allow modest duplication when the cases have different reasons to change. Consolidate repeated domain knowledge; do not unify coincidentally similar syntax into a flag-driven function.
- Group code around cohesive behavior and knowledge. Avoid splitting one operation across many files or making every table require a repository and service.
- One caller does not automatically make an abstraction bad: a parser, algorithm, or resource boundary may still hide substantial complexity.

## Keep code easy to follow

- Prefer direct calls and composition over inheritance hierarchies and elaborate design patterns. Use classes when they make ownership, behavior, or integration clearer; do not introduce them merely to group stateless functions.
- Keep related logic together. A cohesive function can be moderately long. Extract a helper when it introduces a useful concept, hides distracting detail, or consolidates behavior.
- Make control flow visible. Prefer early exits over unnecessary nesting and ordinary branching.

## Choose clear data and state

- Prefer ordinary records, structs, collections, and simple types that are easy to construct, inspect, and pass around.
- Favor functions that return results without unexpectedly changing their inputs. Prefer immutable shared data where practical.

## Handle failures honestly

- Parse untrusted input into a known shape at entry points. Remove redundant internal validation only when the guarantee is established.
- Make expected failure behavior clear using the language's idioms. Use result values or exceptions according to the existing contract and which is easier to follow.
