---
name: academic-style
description: >-
  The style guide for academic prose: clarity and story, academic conventions
  (APA 7, EASE), claim strength, AI tells, and grammar, each rule with its why
  and an example. Use when checking, editing or drafting the prose of a paper, a
  cover letter or a reviewer reply, when another skill asks for it (e.g.
  /refine), or when the user says "check this against academic-style".
license: MIT
metadata:
  version: "0.1.0"
---

# Academic style

A rulebook, not a workflow. The skill that loads it (e.g. `/refine`) owns the
steps, the finding format, and the guards on numbers, citations and quotations.

## The rules

Five groups, one file each. For a full check, read all five. A check of
story and claims only (an early draft) can skip grammar.

| Group | File | Codes |
| --- | --- | --- |
| Clarity and story | [references/clarity.md](references/clarity.md) | C1–C16 |
| Academic conventions | [references/conventions.md](references/conventions.md) | A1–A14 |
| Claim strength | [references/claims.md](references/claims.md) | S1–S13 |
| AI tells | [references/ai-tells.md](references/ai-tells.md) | T1–T11 |
| Grammar | [references/grammar.md](references/grammar.md) | G1–G10 |

Each rule has a code, a one-line rule, its why, an example and where it
applies. The why is there so a rule is weighed, not re-argued: when a finding
is contested, show the why.

In the examples, the ✓ form uses facts the author gave (who *stakeholders*
are, how many people refused). In a real check, ask the author for them.

## How to apply them

**Every finding names one rule**, by code and name: `C6 pronoun target`. A
finding with no rule behind it is taste. Leave correct text as it is. When
two rules share one fix, give one finding: name the more specific rule and
add the other after it (`T8 recap ending; also C5`).

**The guide is about how a text is written, not what it explains.** The
author decides what a reader needs explained; the guide checks the language
it is said in.

**A sentence with two readings gets a question, not an edit.** Ask the author
which reading is meant; a guessed edit can change the claim (S5).

**Which text you check decides the strength of the rule:**

- **The author's text**: name the rule, propose an edit, and let the author
  decide. An AI tell (group T) in the author's text is a flag: the finding
  shows the plain form as an option, and the text keeps the author's words
  unless the author picks it.
- **Your own text** (a draft, a proposed edit, a reply): before the author
  sees it, check it against claim strength (S) and AI tells (T). It passes
  every rule in both groups. A proposal that fixes one rule and breaks
  another is not ready.

**More specific choices win**, in this order:

1. The journal's instructions for authors.
2. The article's own choices: its glossary and term lock, its spelling
   variant, and the decisions recorded for the paper (AGENTS.md or CLAUDE.md
   says where).
3. This guide.

Where a higher source decides, follow it and do not raise a finding.

**Paper choices.** Some choices belong to the paper, not to the guide. The
guide gives a default; the paper's recorded decisions can choose the other
option. Before the first finding on a paper, look for a "Paper choices" list
in its AGENTS.md or CLAUDE.md. If a choice is missing, ask the author all
missing choices in one question, with the default as the recommended answer.
Write the answers into that list, and do not ask again for that paper.

| Choice | Default | Other option |
| --- | --- | --- |
| Results | report only; interpretation and support for each hypothesis go in the Discussion (APA JARS) | Results also interpret |
| Section preview | allowed: up to 2–3 sentences on what the section does | none |
| Section recap | flagged (C5, T8): it repeats what the reader just read | allowed, for a long paper or a thesis |

**Not faults**, in any group: passive voice where the actor does not matter,
adverbs, one hedge on a claim, and an em dash used now and then. Raise none of
them as a finding on its own. The empty modifiers listed in C13 (*really*,
*basically*) are the named exception to "adverbs".
