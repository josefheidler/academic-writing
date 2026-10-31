# Changelog

The plugin's version lives in `plugins/academic-writing/.claude-plugin/plugin.json`, and each skill carries the same number in its `metadata.version`. The project follows [semantic versioning](https://semver.org/): while it is 0.x, any release may change how a skill works.

## 0.1.0 — 2026-10-31

First public release, ported from the prototypes built while drafting a real article.

### Added

- `academic-style`: a style guide for academic prose. It has 64 rules in five groups (clarity and story, academic conventions, claim strength, AI tells, grammar), and each rule comes with its reason and an example. It passed three rounds of blind tests: 8/8, 13/13 and 27/27 planted problems caught, with no false findings on clean passages.
- `refine` (preview): refines a manuscript with the author one beat at a time. It covers story, grammar and polish, checks every reference against its source through a reference ledger, and checks every number against the script that made it. Three helper subagents (context reader, fact checker, style checker) keep the heavy reading out of the main conversation. An unchanged beat skips its checks.
