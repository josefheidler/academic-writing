# AI tells (T)

Words and patterns that language models add to prose far more often than
authors do, and that editors and reviewers say they notice. Corpus studies
(Kobak et al., 2025; Reinhart et al., 2025) measured the words and grammar;
editors (Sage, 2025) and Wikipedia's "Signs of AI writing" describe the
patterns. The list as of October 2026.

**How they apply** (see also SKILL.md):

- **Your own text** has none of them. Write the plain form given in each
  rule.
- **The author's text** keeps them unless the author asks. Flag each tell by
  its code and offer the plain form; the author decides.

The goal is clear prose in the author's voice, not prose that passes an AI
detector. Detectors flag the plain English of non-native authors as AI-made
far more often than native English (Liang et al., 2023), so a detector score
is not a test of this guide.

**Not tells**, whatever community lists say: the passive voice (models use
fewer agentless passives than people do; Reinhart et al., 2025) and
*associated with* (the correct term for a relation that is not causal). Two
related rules sit in other groups: synonyms rotated for variety are A2, and
filler such as *it is important to note that* is C13.

### T1 Inflated vocabulary

**Rule**: Use the plain word: *shows* for *underscores* or *showcases*,
*examines* for *delves into*, *important* or *key* for *pivotal* or
*crucial*, *also* for *additionally*, *complex* for *intricate*, *improves*
for *enhances*, *full* for *comprehensive*.
**Why**: These words became several times more frequent in papers after 2023,
with no change in what papers report. Reviewers and editors read them as a
sign of unedited AI output, which costs the author trust. The words change
with each model generation (*delve* fell after 2024), so one word alone proves
little: a cluster does.
**Example**:
✗ *This study delves into the intricate interplay of sleep and mood,
underscoring its pivotal role.*
✓ *This study examines how sleep and mood relate.*
**Applies**: every section; the Abstract most of all. In the author's text,
flag a cluster or a repeated word, not one use. A technical term (*robust*
for a statistic) is not a tell.

### T2 Undue significance

**Rule**: State what a finding is, without a frame that inflates it.
**Why**: *Plays a vital role*, *stands as a testament to*, *highlights the
importance of* add weight that no number supports, and they read as
padding.
**Example**:
✗ *Breakfast plays a vital role in the school day, highlighting the importance
of meal programmes.*
✓ *Pupils who ate breakfast scored higher in the morning test than pupils who
did not (72 vs 65 points).*
**Applies**: every section.

### T3 Trailing -ing clauses

**Rule**: End the sentence when the finding ends. Give an evaluation its own
sentence, with its own evidence.
**Why**: A tail like *…, highlighting the need for…* or *…, reflecting a
shift in…* adds an unsupported interpretation in a grammatical position that
hides it. Models use these clauses about five times as often as people do.
**Example**:
✗ *Uptake doubled in 2 years, reflecting a growing awareness of the
risks.*
✓ *Uptake doubled in 2 years.*
**Applies**: every section.

### T4 Plain "is" and "has"

**Rule**: Use *is*, *are*, *has* and *have* where they fit.
**Why**: *Serves as*, *stands as*, *boasts*, *features* replace the plain
verb with no gain in meaning.
**Example**:
✗ *The clinic serves as the main referral centre and boasts three
scanners.*
✓ *The clinic is the main referral centre and has three scanners.*
**Applies**: every section.

### T5 Staged contrast

**Rule**: State the point directly.
**Why**: *Not only X but also Y*, *It is not X; it is Y*, *not just X, but
Y*, and the reversed *Y rather than X* set up a contrast that no one claimed,
to make an ordinary point sound larger. Readers now spot this pattern as an
AI sign sooner than any single word.
**Example**:
✗ *The intervention is not just a programme; it is a movement.*
✓ *The intervention ran in 40 schools.*
**Applies**: every section. A contrast with a real, cited opposite view is
not a tell. A choice between two real options, with its reason, is not a
tell either (*we used the median rather than the mean, because the data were
skewed*).

### T6 Lists of three for rhythm

**Rule**: List as many items as the evidence has.
**Why**: Models pad lists and adjective strings to three (*clear, concise and
compelling*). An item added for rhythm is a claim with no source.
**Example**:
✗ *The tool is fast, reliable and intuitive.* (Only speed was tested.)
✓ *The tool was fast (median response time 1.2 s).*
**Applies**: every section.

### T7 Vague attribution

**Rule**: Name the source: cite it, or say who.
**Why**: *Studies have shown*, *experts agree*, *it is widely known* claim
support that the reader cannot check; editors name it as a sign. In the
author's text this is a literature-support gap to flag, not a phrase to
reword.
**Example**:
✗ *Studies have shown that naps improve recall.*
✓ *Naps improved recall in two trials [@lee2019; @ortiz2021].*
**Applies**: every section; most often in the Introduction and the
Discussion.

### T8 Formulaic openings and recap endings

**Rule**: Open a section or paragraph on its first point and end it on its
last.
**Why**: *In today's rapidly changing world*, *Despite these challenges, …*, a
closing outlook, a last sentence that sums up the paragraph again (*In short,
…*), and a one-line dramatic closer (*And that matters.*) repeat what the
text said or what every paper says. Editors name restating as a sign.
**Example**:
✗ *Despite these challenges, the future of school nutrition looks bright.*
✓ *Only 3 of the 12 schools kept the programme after the funding ended.*
(The paragraph ends on its last finding.)
**Applies**: openings and endings of sections and paragraphs, Abstract,
Conclusion. *In conclusion* and *Overall* are normal signposts; they are a
tell only when they open a pure recap. A short preview of what a section does
is a paper choice (SKILL.md), allowed by default: not a tell.

### T9 Formatting changes

**Rule**: Keep the author's punctuation and layout: prose stays prose,
headings keep their case, quotes and dashes keep their form.
**Why**: Models add bold lead-ins inside paragraphs, turn prose into bullets,
change heading case, swap quote marks and scatter dashes. Each change alters
the author's text without changing its meaning. Em dashes, Title Case
headings (APA 7 uses them) and curly quotes (word processors make them) are
not tells in the author's own text; the tell is a change to the author's
form.
**Example**: a paragraph turned into three bullets with bold lead-ins.
**Applies**: every section.

### T10 Same openings, same rhythm

**Rule**: Keep the author's variety: paragraphs that open in different ways,
sentences of different lengths.
**Why**: Paragraphs that all open the same way (*This study …*, *This study
…*) and runs of sentences of equal length read as generated; editors name
both. An edit that splits every long sentence makes the same problem.
**Example**: four paragraphs in a row that open with *Furthermore*,
*Moreover*, *Additionally*, *Furthermore*.
**Applies**: every section; check after any batch of edits.

### T11 Generic phrases

**Rule**: Say the specific thing (the number, the group, the source) or cut
the phrase.
**Why**: *More research is needed*, *a growing body of evidence*, *a rich
literature*, *a vibrant field* fit any paper and tell the reader nothing.
Editors name prose that is fluent but says nothing specific as the clearest
sign.
**Example**:
✗ *More research is needed in this area.*
✓ *A trial with measured sleep, not self-report, would test whether screen
time shortens sleep.*
**Applies**: every section; most often in the Introduction, the Discussion,
the Conclusion and the Abstract.

## Claude's own tells

No published list of Claude's own habits was found (October 2026). When the
author rejects a word or a form in Claude's text because it sounds generated,
add it here with the date, and treat it as a T rule from then on.

- (none yet)

## Sources

- Kobak, D., González-Márquez, R., Horvát, E.-Á., & Lause, J. (2025).
  Delving into LLM-assisted writing in biomedical publications through excess
  vocabulary. *Science Advances*, 11(27), eadt3813.
  https://doi.org/10.1126/sciadv.adt3813
- Reinhart, A., et al. (2025). Do LLMs write like humans? Variation in
  grammatical and rhetorical styles. *PNAS*. https://arxiv.org/abs/2410.16107
- Liang, W., Yuksekgonul, M., Mao, Y., Wu, E., & Zou, J. (2023). GPT
  detectors are biased against non-native English writers. *Patterns*, 4(7),
  100779. https://doi.org/10.1016/j.patter.2023.100779
- Sage Perspectives (2025, June 11). AI detection for peer reviewers: look out
  for red flags. https://www.sagepub.com/explore-our-content/blogs/posts/sage-perspectives/2025/06/11/ai-detection-for-peer-reviewers-look-out-for-red-flags
- Wikipedia contributors. *Wikipedia:Signs of AI writing*. CC BY-SA 4.0.
  https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing. Paraphrased.
