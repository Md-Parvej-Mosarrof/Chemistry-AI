# Chemistry AI — Home Screen Specification

**Target users:** SSC, HSC, Honours 1st Year
**Languages:** Bangla (bn) / English (en)

---

## 1. Screen Overview

The Home Screen is the student's daily entry point. Its job is to answer three questions in under 3 seconds: *"Where am I in my syllabus?"*, *"What do I want to do right now (learn, ask, or test myself)?"*, and *"Can I get back to what I was doing?"* Everything below is ordered by how often a student actually uses it, not by visual importance.

---

## 2. Top Bar (Header)

| Element | Behavior |
|---|---|
| Greeting + Avatar | "স্বাগতম, Rafiq" / "Welcome, Rafiq" — tapping avatar opens Profile. |
| **Class/Level Selector** | A pill/dropdown showing the active level: **SSC / HSC / Honours 1st Year**. Tapping opens a bottom sheet to switch level — this re-filters Chapter List, Quiz bank, and AI Tutor's context (e.g., HSC gets organic chemistry depth Honours doesn't need yet). |
| **Language Toggle** | A small "বাংলা / EN" switch, always visible, never buried in settings — since this is a bilingual-first app, language is a top-level control, not a settings afterthought. |
| Notification bell | Streak reminders, new chapter unlocks. |

**Why the level selector lives in the header, not in Settings:** students in Bangladesh often support siblings or revisit lower classes for revision — switching level should be a 2-tap action, not a menu dive.

---

## 3. Quick Search

A persistent search bar directly below the header (not hidden behind an icon).

- Placeholder rotates contextually: *"খুঁজুন: মোলার ভর, অ্যাসিড..."* / *"Search: molar mass, acid-base..."*
- Search scope spans **all** content types at once: chapters, formulas, quiz topics, past AI Tutor conversations, bookmarked items — with results grouped by type (Chapters / Quizzes / Q&A history).
- Voice-search icon inside the field — many SSC/HSC students are more comfortable speaking a Bangla chemistry term than typing/spelling it.
- Tapping the bar (without typing) shows **recent searches** and **trending topics for their class** — reduces blank-state friction.

---

## 4. AI Tutor — Hero Entry Point

Placed directly below search as the single most prominent card on the screen (not buried among grid icons), because AI-assisted doubt-solving is the app's core differentiator.

- Large card: *"কেমিস্ট্রি নিয়ে প্রশ্ন? জিজ্ঞাসা করুন"* / *"Stuck on a concept? Ask Chemistry AI"*
- An input affordance directly on the card (mic + text + "scan a problem" camera icon) so a student can start a query **without navigating away from Home** — critical for a homework-help use case where friction kills adoption.
- Shows 2–3 rotating suggested prompts scoped to their class, e.g. *"Balance this equation for me"*, *"এই বিক্রিয়ার প্রক্রিয়া ব্যাখ্যা করো"* — this teaches new users what the AI Tutor is capable of.
- Tapping the card body (not the input) opens the full AI Tutor chat screen with history.

---

## 5. Chapter List

A horizontally-scrollable "Continue learning" row, followed by a "Browse all chapters" entry point — not a full list dumped on Home.

- **Continue learning row**: 2–4 cards for chapters already in progress, each showing a progress bar (e.g., "Mole Concept — 60% complete"), so the student's next action is one tap away.
- Each card: chapter icon (color-coded by topic type — organic/inorganic/physical), title in the active language, progress %, estimated time to finish.
- **"View all chapters"** link/button opens the full syllabus screen, organized by class → subject unit → chapter, matching the student's actual textbook structure (NCTB for SSC/HSC) so nothing feels unfamiliar.
- Locked/upcoming chapters are shown grayed out with a lock icon rather than hidden, so students see the full roadmap and stay motivated.

---

## 6. Quiz

A compact card/section, not a full list — Home teases it, the Quiz tab delivers depth.

- Headline stat: *"আজকের কুইজ"* / *"Today's quiz"* — one bite-sized daily quiz (5–10 questions) tied to their current chapter, encouraging a daily habit loop.
- Secondary row: "Practice by chapter" and "Weak topics" (auto-suggested from past wrong answers) — this is where AI personalization shows up concretely rather than abstractly.
- Shows last quiz score as a small badge for immediate feedback/motivation.

---

## 7. Bookmarks

Not a separate Home section by itself — surfaced as a **small horizontal shelf** ("Saved for later") showing the last 3–4 bookmarked lessons/questions with a "See all" link.

- Rationale: bookmarks are a *retrieval* action, used less frequently than search/chapters/quiz, so it earns a shelf, not a hero card — but it still needs Home visibility since students often bookmark mid-lesson to revisit before exams.
- Each bookmarked item shows its type icon (chapter / flashcard / AI answer) since bookmarks are heterogeneous.

---

## 8. History

Also a shelf, not a hero section — "Recently viewed / Recent AI chats," combining lesson views and AI Tutor conversations in one chronological list so students can resume anything without hunting through separate logs.

- Shows relative time ("2 hours ago", "গতকাল") to reinforce the "pick up where you left off" mental model.
- Full History is a dedicated screen reachable via "See all," typically tucked under Profile/More rather than the bottom nav, since it's a secondary utility, not a daily-use destination (see nav rationale below).

---

## 9. Bottom Navigation

| Tab | Icon idea | Destination |
|---|---|---|
| **Home** | House | This screen |
| **Chapters** | Book/layers | Full syllabus browser |
| **AI Tutor** | Chat bubble / spark (center, slightly elevated) | Full AI chat screen |
| **Quiz** | Checkmark/pencil | Quiz hub (practice, daily quiz, results) |
| **Profile** | Person | Profile, Settings, **Bookmarks**, **History**, language/level preferences |

**Why only 5 tabs, and why Bookmarks/History aren't tabs:**
Bottom nav real estate is scarce and reserved for the actions a student takes *daily* (learn, ask, test). Bookmarks and History are *secondary/retrieval* actions used a few times a week — giving them their own tabs would dilute the nav's clarity. Instead they get first-class shelves on Home (for quick access) and a permanent home under Profile (for deep access), which is the standard pattern for "utility" features in learning apps.

**AI Tutor's center placement** signals it as the app's primary differentiator (similar to how camera apps center the shutter), encouraging habitual use rather than treating it as "just another tool."

---

## 10. Offline & Bilingual Considerations on Home

- Any content available offline (downloaded chapters, cached quizzes) shows a small offline-ready icon on its card, so students studying without data know instantly what's usable.
- If offline, the Quick Search and AI Tutor cards remain visible but show a subtle "limited offline — cached answers only" state rather than disappearing, keeping Home's layout stable regardless of connectivity.
- All strings on Home (greeting, section headers, placeholders, level names) are pulled from the localization layer — level names themselves are also translated ("এসএসসি / এইচএসসি / সম্মান ১ম বর্ষ").

---

## 11. Visual Hierarchy Summary (top → bottom)

1. Top bar: greeting, level selector, language toggle
2. Quick Search
3. AI Tutor hero card
4. Continue learning (Chapter List preview)
5. Quiz teaser (daily quiz + weak topics)
6. Bookmarks shelf
7. History shelf
8. Bottom Navigation (persistent): Home · Chapters · AI Tutor · Quiz · Profile