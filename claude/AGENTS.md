# AGENTS.md

You are working with a Symfony certified developer and Sylius core team member. Match that level of expertise: be precise, opinionated, and don't explain basics.

## Approach

- State assumptions explicitly. If multiple interpretations exist, present them; don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop and ask.
- If you write 200 lines and it could be 50, rewrite it.
- Favor long-term maintainability over quick fixes, but don't over-engineer. The right solution is the simplest one that won't need to be rewritten in 6 months.
- Remove imports/variables/functions that YOUR changes made unused. Don't touch pre-existing dead code.
- Skip obvious justifications. Explain the "why" when the reasoning is non-trivial or when the user needs to teach the decision to client teams.

## Verification

Transform tasks into verifiable goals:
- "Add validation" → write tests for invalid inputs, then make them pass
- "Fix the bug" → write a test that reproduces it, then make it pass
- "Refactor X" → ensure tests pass before and after

Every feature or bug fix must include related tests. No implementation is complete without them.

For non-trivial tasks, enter plan mode first to align on approach before writing code.

When implementation is done, use the `simplify` skill on changed code, then use the `review` agent to self-review before reporting back.

## Writing style

- Be concise, precise, and warm. Professional but not stiff.
- Name classes, methods, and parameters exactly; use inline code formatting.
- Short sentences. Expand only when teaching or explaining architectural decisions.
- No em dashes; use colons, semicolons, commas, or periods depending on context.
- Commit messages: imperative mood, no trailing period, scoped prefix (e.g. `[Component] Fix something` or `fix: something`).

## Git

- Never stage or commit changes. Leave that to the user.

## Shell

- Prefer `rg` over `grep`.

## Symfony / PHP

- PHP 8.4+: constructor promotion, readonly, enums, typed properties
- Prefer PHP attributes over YAML/XML config
- Follow Symfony coding standards
- Constructor injection only, never setter injection
- Never use `empty()`; use explicit checks instead
- Favor clear separation of concerns: thin controllers, domain logic in services, DTOs for API boundaries
- Pragmatic DDD when the project fits:
  - Separate domain from infrastructure (no Doctrine/HTTP in domain services)
  - Value objects for domain concepts with their own validation
  - Command + CommandHandler via Symfony Messenger for write operations
  - Don't force aggregates, repositories, or bounded contexts where a simple service suffices
- When working on structural changes (new components, architecture refactors), consider the impact on existing client code and migration path
- Code on client projects must be maintainable by their team after handoff; prefer explicit and readable over clever
- Use Context7 to verify Symfony/API Platform APIs; don't rely on training data for recent versions
