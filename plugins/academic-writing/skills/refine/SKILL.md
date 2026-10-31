---
name: refine
description: >-
  Refine a manuscript with the user ONE BEAT AT A TIME - grammar, polish,
  story flow, every reference against the bibliography and the paper, every
  number against its source, and always the user's own edits. Use when the
  user says refine or names a section or beat of the manuscript. Not for
  writing new prose.
license: MIT
metadata:
  version: "0.1.0"
---

# Refine, one beat at a time

**The unit is one beat.** Doing the work is not the job. **Reading it together
is the job**, and the user sets the pace.

A beat is a `<!-- beat N: ... -->` block in the manuscript file. Typically
80–250 words with a few references and numbers. A figure or table with its
caption is a unit of its own. A section is the part of the paper under one
heading, e.g. Results or Methods, or a subheading inside one. It holds several
beats.

**The user reads first; you follow.** Give conclusions only on prose the user
has read. Move to the next beat when the user says so.

**The user rules; you bring evidence and proposals.** Change the manuscript only
when the user agrees to a numbered finding. The user edits by rewriting, and the
prose stays theirs.

**The main context holds the beat, the findings and the talk with the user.**
Three helpers (subagents) do the heavy reading and return only what the user
will see: the **context reader**, the **fact checker** and the **style
checker**. Their briefs are in "The helpers".

## The steps

### 1. Once per section: get the context brief

Do this before the section's first beat. Dispatch the context reader and wait
for its brief. The brief gives the section's beats and their jobs, the handover
in and out, the settled decisions that bind the section, and what is still
open. A settled decision stays settled; a finding that reopens one says so, and
says why.

If the section has no `<!-- beat N -->` comments, the brief proposes where they
go: one diff that adds only the comments. Show it, and wait for the user's OK.

### 2. Open the beat

Read the beat from disk and run `git diff -U0` on the file. A finding must not
repeat a fix the user already made.

Then give a short summary:

```
── beat 2 "who took part" ───────────────────────────
WHERE     paper.md › Methods
SIZE      110 words (720 characters)
FACTS     1 reference (6 numbers)
JOB       Describes the sample: adults from three clinics, most of them women.
          Fits: it follows the design and sets up the measures.
```

The heading holds the beat's number and name, from its comment. The JOB line has
two parts. First, what the beat does, in one sentence. Second, your judgement:
does that job fit the section, the beats around it, and the story in the brief?
If the job is wrong, everything after it is wrong, and this is the cheap place
to correct it. For a figure or table, `SIZE` gives the caption's word count.

Then paste the beat's prose, so the user can read it in the terminal.

In the same message, dispatch the fact checker and the style checker on the
beat. They run in the background while the user reads.

**Skip a check that cannot find anything new.** Run
`bash ${CLAUDE_SKILL_DIR}/scripts/beat-hash.sh <manuscript file> "<beat marker>"`
(e.g. `"introduction beat 3"`) and compare the hash with the `Checked:` line of the beat's latest
entry in the beat notes. If they match, the beat has not changed since its last
check:

- skip the fact checker: the ledger rows already hold its verdicts;
- skip the style checker too, unless the `academic-style` version on that
  line differs from the `version` in the `metadata` of academic-style's
  SKILL.md; new rules can find new points in old prose.

Put the skipped checks and the reason in the summary. Story feedback and the
user's own edits still apply.

### 3. Check the facts

Show the fact checker's lines and blocks, in the order the prose cites them.
Each failed block becomes a numbered finding (see "How a finding is
presented"). Fix the facts with the user before any work on the writing: a
sentence that must change for a fact is not worth polishing first.

When a fix changes a sentence, send the new sentence to both checkers: the fact
checker checks it again, and the style checker drops or redoes its findings on
the old sentence.

### 4. Give feedback on the writing

1. Story, from you: does the prose do the job from the summary, follow from the
   beat before, and set up the beat after? Judge it against the brief.
2. Grammar and polish, from the style checker: every error of grammar,
   spelling and punctuation, and every place the beat breaks an
   `academic-style` rule.

Give each point as a numbered finding. Before you show a proposal of your own
(a story finding, or a new wording in the talk with the user), send it to the
style checker for its claim-strength (S) and AI-tell (T) check. A proposal that
makes a cited claim stronger or weaker also goes to the fact checker. Show it
only when it passes both.

### 5. Work the beat until the user says "done"

Apply each finding the user agrees to ("1 OK"), and only that one.

The user may also edit the Markdown directly. Wait for that, and stay on the
same beat. Always check the user's edits. Read the diff (`git diff -U0` on the
file) and report:

- what changed, and what it fixed;
- what it broke: a handover that no longer lands, a beat comment that no longer
  matches its prose;
- anything that now contradicts a section next to it;
- any fact whose sentence changed: send it to the fact checker;
- polish: send the diff to the style checker, and give its findings as
  numbered findings, not applied.

Keep the idea under hurried grammar. The idea is the part that matters. Point
out a change of meaning; do not smooth it over in silence.

When the user rejects a word or form of yours because it sounds generated,
add it to "Claude's own tells" in `academic-style` (references/ai-tells.md).

Then give the next findings.

### 6. On "done", close the beat

1. **The facts and the ledger**: send "close the beat" to the fact checker. It
   checks every fact again (edits to the writing can change what a sentence
   claims), sets every row of the beat to its current status, and removes a
   row whose sentence is no longer in the manuscript. Skip this when no
   sentence changed since the fact checker's last check: its rows are current.
2. **The beat comments**: renumber them if the beats moved, and move the
   beat's long comment to the beat notes (see "The beat notes"). Keep only the
   one-line marker in the manuscript. End the beat's entry in the beat notes
   with `Checked: <beat-hash.sh output>, academic-style <version>, <date>`,
   so the next pass can skip
   the checks if the beat does not change.
3. **The record of decisions** (AGENTS.md or CLAUDE.md says where): what was
   settled in this beat. The context reader reads it before the next section.

Then say plainly what is closed and what is still open. A beat with a fact that
is not `correct` or `ruled` is still open; name the fact.

### 7. After the section's last beat, close the section

Read the whole section once, from disk. Look for what no single beat shows:

- repetition across beats;
- a handover between two beats that does not land;
- a term that changes from one beat to the next.

Give each problem as a numbered finding, and work it as in step 5. Then say
plainly whether the section is closed, or name what is still open.

## Reference

### The helpers

Dispatch each helper as a subagent with the brief below, filled in. Each one
reads from disk and returns text in the formats of this skill, and nothing
else. Give each one a name, and continue it with SendMessage for later checks:
its context already holds the sources or the rules, so a second check is cheap.

| Helper | Lives for | Gets later |
| --- | --- | --- |
| context reader | one section (step 1) | nothing |
| fact checker | one section | a changed sentence; a ruling; "close the beat" |
| style checker | the session | a changed sentence; the user's diff; your proposal |

**Context reader.**

> Why: /refine keeps its main context for the beat and the talk with the
> author. You read the context of one section, so the main context gets a
> short brief and not the files.
>
> Section: `<heading>` in `<manuscript file>`. Read, in this order: the
> section with its `<!-- beat N -->` comments, and its entries in the beat
> notes (`<beat notes file>`); the section before and the section after; the
> story and the settled decisions (`<where AGENTS.md says they are>`).
>
> Return, in at most 300 words: each beat as number, name and its job in one
> line; the handover into the section and out of it; every settled decision
> that binds this section, one line each with its source (issue comment,
> beat-notes heading, manuscript comment); what is still open. If the section
> has no beat comments, return a diff that adds only the comments.

**Fact checker.**

> Why: /refine keeps its main context for the beat and the talk with the
> author. You check the facts, so the papers, the scripts' output and the
> ledger stay out of it. The author reads every block you return, so a wrong
> verdict costs a real decision.
>
> Read `${CLAUDE_SKILL_DIR}/references/facts.md` in full, and follow it.
> Beat: `<section> <N> "<name>"` in `<manuscript file>`. Check every reference
> and every number in it. Write the ledger rows. Return one line per fact that
> passes, and one block (with a `PROPOSE` line) per fact that fails, in the
> order the prose cites them. End with the ledger rows you added, changed or
> removed, one line each.
>
> Stay ready for later messages: a changed sentence to check again; the
> author's ruling on a row (set it to `ruled`); "close the beat" (check every
> fact again, set every row of the beat to its current status, remove rows
> whose sentence is gone); a proposal that changes a cited claim (return
> whether the source supports it).

**Style checker.**

> Why: /refine keeps its main context for the beat and the talk with the
> author. You hold the `academic-style` rules, so they never enter the main
> context. The author decides every finding, so a finding with no rule behind
> it, or one that reopens a settled decision, wastes the author's time.
>
> Load the `academic-style` skill and read all five rule files. Read "How a
> finding is presented" in `${CLAUDE_SKILL_DIR}/SKILL.md`. Read the paper
> choices in `<AGENTS.md or CLAUDE.md>`. The settled decisions for this
> section are: `<the list from the context brief>`. Before a proposal that
> applies a rule's default (an A rule above all), look for a recorded decision
> on it in that list, the manuscript's comments and the beat notes.
>
> Beat: `<section> <N> "<name>"` in `<manuscript file>`; read the beats before
> and after it too. Return every grammar and polish finding, in the order of
> the prose, each as a block with its `RULE` line and a `diff`. Check each
> proposal against the S and T rules before you return it. Leave story to the
> main context.
>
> Stay ready for later messages: a changed sentence; the author's diff (return
> polish findings on it); a proposal from the main context (return "passes",
> or the S or T rule it breaks and a form that passes).

The checkers number their findings from 1. Renumber them into your one
sequence when you show them.

If the paper's "Paper choices" list is missing or incomplete, ask the author
before the first style check, as `academic-style` describes, and record the
answers. The style checker cannot ask the author.

### How a finding is presented

A finding is one point the user must answer: a fact that failed, a problem in
the story, a grammar fix, or a polish. Present every finding the same way.

**Number every finding**, in one sequence across the message, small ones
included. The user answers by number: "1 OK, 3 no".

**Every finding is one block**, in the same design as the fact blocks. The
heading holds the finding's number and its kind (story, grammar or polish):

```
── 3 · polish ───────────────────────────────────────
WE SAY    our sentence, word for word
RULE      C6 pronoun target
ISSUE     what is wrong with it
PROPOSE   the edit, in the diff below
```

The `RULE` line names the `academic-style` rule by code and name. A grammar
finding names its G rule (`G4 commas`); an error with no G rule names the
error instead ("subject–verb agreement"). A story finding has no `RULE` line.

A failed fact keeps its own block (see `references/facts.md`). Put the number
in its heading, e.g. `── 1 · lee2012effect ──`, with its `PROPOSE` line.

Give the edit as a fenced `diff` block below the finding, with `-` on the old
lines and `+` on the new, so the user sees what moves. Quote a full paragraph
only when the user asks how the whole thing reads.

If you have no proposal, say so. "I do not know what to do with this one" is a
valid `PROPOSE` line, and it opens a conversation. It is better than a fix
invented to fill the slot.

**Two or three findings, then wait.** The user reads them one at a time. Hold
the rest of the checkers' findings for the next message. Small grammar fixes in
one beat can share one finding and one diff.

### The beat notes

A beat gathers working notes while it is drafted: sources, bases, subgroup
checks, what was left out and why. In the manuscript they bury the prose. When
the beat closes, move its comment, word for word, to the beat notes file, under
one heading per beat. The manuscript keeps only `<!-- beat N: short name -->`,
and a figure keeps one line that names its script. Comments that outline
unwritten sections stay where they are.

The file is `beat-notes.md` beside the manuscript, unless AGENTS.md or CLAUDE.md
names another place. The decisions go to the record of decisions, as before;
the notes hold the evidence behind them.

If beats are renumbered, write the old-to-new map at the top of the notes file,
because older records use the old numbers.
