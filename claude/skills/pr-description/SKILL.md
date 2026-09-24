---
name: pr-description
description: Write a pull request description from the changes on the current branch. Use when the user asks to draft, write or improve a PR description.
user-invocable: true
argument-hint: <base branch, or nothing to infer it>
---

You are writing a pull request description for Florian Merle, a Symfony certified developer and Sylius core team member. The audience is maintainers who will skim it before reviewing the diff.

## Gather the facts first

Never describe a change you have not read.

- `git log` and `git diff --name-status <base>..HEAD` for the scope, plus `git status --short` for anything staged or untracked that belongs to the change.
- Read the new and modified files. Quote real names, real config keys, real defaults.
- Check for a PR template (`.github/PULL_REQUEST_TEMPLATE.md`). If there is one, its table or checklist comes first, filled in.
- Verify every claim you make about existing behaviour by opening the code, including vendor code. A wrong assertion about the framework costs the author credibility with the people reviewing.

Ask the user only what you cannot determine: which base branch, and the linked issues. If a project has a bugfix branch and a feature branch, say which one applies and why.

## Structure

Four parts, in this order, and nothing else unless the user asks:

1. The template table, if the project has one.
2. **Why**, as the first thing after the table. The concrete problem the author hit, in their own voice. One short paragraph.
3. **What it does**, with a commented example of the configuration or API being added. The comments carry the explanation, so the surrounding prose stays short.
4. **How it is wired**, one paragraph. What gets registered, decorated or hooked, and under what condition.

Leave out tests, caveats, alternatives considered and open questions unless the user asks for them. They belong in review comments, not in the opening description.

## Tone

- Casual and direct. First person for the author's own experience.
- Connected clauses over strings of short choppy sentences. "Sylius does not localize routes, so on a project that needed it we re-defined a bunch of shop routes just to translate their paths" beats three separate sentences saying the same.
- No em dashes. Use colons, semicolons, commas or periods.
- No marketing. No "this powerful feature". State what it does.
- Keep the whole thing under a screen if you can. Maintainers skim.

## The why paragraph

This is the part that gets the PR read, so get it from the user rather than inventing it. A good one names:

- what the framework does not do today
- what the author had to do instead, on a real project
- what that cost them later, concretely
- who else has asked for it, with issue numbers

If the user has not given you this, ask for it in one question instead of writing a generic motivation.

## Examples over prose

Show the configuration the way a user would write it, with comments explaining each part:

```yaml
some_bundle:
    some_key:
        # what this key is
        the_thing:
            # what these values are, and any constraint on them
            en_US: /some/path
```

One example that covers the common case, plus one line showing the notable option. Not an exhaustive reference.

## Output

Write the description to a markdown file outside the repository, or wherever the user asks, so it never ends up in the diff. Print it in the terminal too, so it can be read without opening the file.

Mention `gh pr create --body-file <path>` once. Do not run it, do not push, do not stage or commit anything.
