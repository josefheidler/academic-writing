# Facts and the ledger

The fact checker reads this file (see "The helpers" in SKILL.md). It checks
every reference and every number in a beat, writes the ledger, and returns
the lines and blocks below to the main context.

## How to check a fact

**A reference.** First check that its key is in the `.bib` file. If it is not,
say so. Then look in the ledger. A `ruled` row whose `sentence` still matches
the manuscript needs no new check, and comes back as one line:

```
lee2012effect — ruled 2026-09-03 ✓
```

Every other reference gets one block, in the order the prose cites them:

```
── citekey ──────────────────────────────────────────
WE SAY    our sentence, word for word
LOOK AT   page, section, figure or table; is the PDF on disk?
THEY SAY  the paper's words, word for word
STATUS    correct · incorrect · unverified, and why
```

To get the quote, search the PDF (or a notebook tool that holds the paper's text) for
the passage, then confirm the words in the PDF. Return the quote only; the rest
of the paper's text stays with you.

When the paper's text and its figure or table disagree about a count, read the
figure or table before you give a verdict. A sum that falls short of the total
is a question for the user ("the bars sum to 92 of 97: what is missing?"),
not an `incorrect`.

Where two notes disagree about what a paper says, the ledger wins: it comes from
the PDF. When the main context sends a proposal that makes a cited claim
stronger or weaker, check it against that reference's ledger rows and quote.

**A number.** Run the script or open the report that makes the number, and
compare. A number that matches comes back as one line:

```
64.2% — correct (scripts/summary.py) ✓
```

Every other number gets one block:

```
── 64.2% ────────────────────────────────────────────
WE SAY    our sentence, word for word
SOURCE    the script, and the line of its output
STATUS    incorrect · no source, and why
```

A number from a script gets no ledger row. The script is the proof, and the
check is cheap to repeat. A number from a paper is a reference: check it as a
reference, with its own ledger row. A number with no script, no report and no
paper is `no source`.

**A figure or table.** Check every number it shows (bar labels, percentages, n)
and every number in its caption against the script that draws it, as numbers.

**When a fact fails.** An `incorrect`, `unverified` or `no source` fact gets a
`PROPOSE` line in its block: a changed sentence, a different reference, or the
page or PDF to get. The main context makes it a numbered finding, and the user
decides. After the fix, check the fact again and update its ledger row.

## The ledger

The ledger is the proof that each reference supports the sentence that cites it.
It lives in `references/ledger.csv`, unless AGENTS.md or CLAUDE.md names another
place. Create it with the header row if it does not exist.

There is one row per use: one reference in one sentence. A paper cited in two
places has two rows, because each sentence needs its own check.

| Column     | What it holds                                       |
| ---------- | --------------------------------------------------- |
| `key`      | the citation key, as in the `.bib` file             |
| `file`     | the manuscript file                                 |
| `beat`     | the section and beat, e.g. `Results 1`              |
| `sentence` | our sentence, word for word                         |
| `quote`    | the paper's words, word for word, from the PDF      |
| `where`    | page, section, figure or table, and the PDF's path  |
| `status`   | see below                                           |
| `date`     | the date of the last status change, `YYYY-MM-DD`    |
| `note`     | why the status is what it is, or what is still open |

Status:

- `unchecked` — nobody has looked yet.
- `correct` — you found the quote, and the sentence is fair to the paper.
- `incorrect` — the paper does not support the sentence, or supports a weaker or
  different claim. The note says what is wrong.
- `unverified` — the PDF is not on disk, so you cannot see the words. Never
  write a quote you did not see in the PDF.
- `ruled` — the user read the quote and agreed that the sentence is fair. Only
  the user rules; you set the other four, and set `ruled` only when the main
  context passes on the user's ruling.

When a sentence changes, its row goes back to `unchecked`.

**Write the ledger safely.** Write the whole new file to a temporary file, check
that its row count is the old count plus the rows you added minus the rows you
removed, then rename it over `ledger.csv`. A write that fails halfway must never
truncate the ledger.
