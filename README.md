# Academic writing

Skills that help an author turn original research into a journal article with Claude. The author owns the claims and the prose; Claude brings checks, evidence and proposals, and changes the text only when the author agrees.

**Status: 0.1.0, an early release.** The skills grew out of drafting real articles and are still changing. Expect rules and workflows to shift between 0.x versions (see [CHANGELOG.md](CHANGELOG.md)).

## What's inside

| Skill | What it does | Where it works |
| --- | --- | --- |
| `academic-style` | A style guide for academic prose: 64 rules in five groups (clarity and story, APA 7 / EASE conventions, claim strength, AI tells, grammar), each with its reason and an example. Use it to check or edit a passage, a cover letter or a reviewer reply. | Claude Code, claude.ai, desktop, other agents |
| `refine` *(preview)* | Works through a Markdown manuscript with you **one beat** (a paragraph-sized unit) at a time: story, grammar and polish, every reference checked against the source PDF, every number checked against the script that produced it, and your own edits checked too. It uses `academic-style` for the language. | Claude Code |

## Install

### Claude Code

```bash
claude plugin marketplace add josefheidler/academic-writing
claude plugin install academic-writing@academic-writing
```

You can also run the same commands inside a session as `/plugin marketplace add …` and `/plugin install …`. Start a new session afterwards, or run `/reload-plugins`.

The skills are then available as `/academic-writing:refine` and `/academic-writing:academic-style`. You can also just ask, for example "refine the Methods" or "check this paragraph against academic-style".

**Updating.** Run `/plugin`, open **Marketplaces → academic-writing → Update marketplace**, then run `/reload-plugins`. From the shell, run:

```bash
claude plugin marketplace update academic-writing
claude plugin update academic-writing@academic-writing
```

**Staying on one version.** Add the marketplace pinned to a release tag:

```bash
claude plugin marketplace add josefheidler/academic-writing#academic-writing--v0.1.0
```

**Sharing within an article repo.** To give every co-author who uses Claude Code the toolkit, commit this to the article repo's `.claude/settings.json`. Each of them then gets it once they trust the folder:

```json
{
  "extraKnownMarketplaces": {
    "academic-writing": {
      "source": { "source": "github", "repo": "josefheidler/academic-writing" }
    }
  },
  "enabledPlugins": { "academic-writing@academic-writing": true }
}
```

### claude.ai and the Claude desktop app

- **Whole plugin:** go to **Customize → Plugins → Add → Add marketplace** and enter `josefheidler/academic-writing`. Alternatively, download `academic-writing-<version>.zip` from [Releases](https://github.com/josefheidler/academic-writing/releases) and use **Upload plugin**.
- **One skill:** download `academic-style-<version>.zip` from Releases, then go to **Customize → Skills → + → Upload a skill**. Turn on "Code execution and file creation" in settings.

In chat, `academic-style` is the useful one: paste a passage and ask Claude to check it. `refine` expects a manuscript in a git repository, so use it in Claude Code.

### Other agents (Codex, Copilot, Cursor, Gemini CLI, …)

Every skill folder follows the open [Agent Skills](https://agentskills.io/) format. Copy `plugins/academic-writing/skills/academic-style/` into your tool's skills folder, for example `.agents/skills/`. `refine` relies on Claude Code features (subagents and `${CLAUDE_SKILL_DIR}`), so it may not work elsewhere.

## Setting up an article for `refine`

`refine` works on what is on disk and asks before it changes anything. It works best when the article repo has:

- **The manuscript in Markdown, under git.** `refine` reads `git diff` to see your own edits.
- **Beat markers**, one HTML comment per beat, such as `<!-- methods beat 2: who took part -->`. If a section has none, `refine` proposes where they go and waits for your OK.
- **A `.bib` file** with the citation keys used in the text (`[@smith2020]`), and **the source PDFs on disk**, so quotes can be checked word for word.
- **Numbers that come from scripts in the repo**, so each one can be traced to its source.
- **An `AGENTS.md` or `CLAUDE.md`** that says where the article's story and settled decisions are kept. `academic-style` also writes a short "Paper choices" list there the first time it runs: for example, whether the Results may interpret. It asks you once and does not ask again.

`refine` creates the rest itself: a reference ledger (`references/ledger.csv`) that records, for each citation, the quote from the source that supports the sentence; and `beat-notes.md` beside the manuscript, which holds the working notes of each finished beat.

## AI-use disclosure

Most journals allow AI-assisted language editing, but they ask you to disclose it, and some restrict AI drafting. Check your journal's policy and keep your own note of how you used these skills. The claims, interpretations and conclusions must stay yours.

## Feedback

Open an [issue](https://github.com/josefheidler/academic-writing/issues). Describe what you asked for, what the skill did, and what you expected. Please do not paste unpublished manuscript text into a public issue.

## Licence

[MIT](LICENSE). The style rules paraphrase and cite their sources (APA 7, EASE guidelines, Purdue OWL, and others). Each rule file lists them under "Sources".
