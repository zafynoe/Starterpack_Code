# Superpowers

You have **Superpowers** and a wider skill library installed as Cline skills in
`~/.agents/skills/` (global scope) or `.agents/skills/` (project scope). It is a
development methodology, not a library: these skills are mandatory workflows, not
suggestions.

## Bootstrap

At the start of every conversation, before ANY response — including clarifying
questions, exploring the codebase, or reading files — invoke the `using-superpowers`
skill with the `skills` tool and follow it. Then announce "Using [skill] to [purpose]"
and follow the skill exactly. If a skill has a checklist, create a todo per item.

If you think there is even a 1% chance a skill applies to what you are doing, load it.

## Which skill to load first

- Building, adding, changing, or planning anything → `brainstorming` (before plan mode)
- Stress-testing a plan, design, or decision the human brings (or any "grill" trigger) →
  `grilling` (alias: `grill-me`)
- Starting a new product, project, or positioning work → `product-marketing` (writes
  `.agents/product-marketing.md`: positioning, ICP, brand voice — the foundation doc the
  other marketing skills read); `to-spec` publishes the spec once a conversation settles
- Any bug, failing test, or unexpected behavior → `systematic-debugging`
- Writing implementation code → `test-driven-development` (RED-GREEN-REFACTOR)
- Spec or requirements for a multi-step task → `writing-plans`, then
  `executing-plans` (inline) or `subagent-driven-development` (fresh agent per task)
- 2+ independent tasks with no shared state → `dispatching-parallel-agents`
- Before claiming work is complete, fixed, or passing → `verification-before-completion`
- Before merging / when asking for review → `requesting-code-review`
- When receiving review feedback → `receiving-code-review`
- Isolated workspace for feature work → `using-git-worktrees`
- When implementation is done and tests pass → `finishing-a-development-branch`
- Creating or editing skills → `writing-skills`
- Designing, redesigning, critiquing, auditing, or polishing ANY frontend interface →
  `impeccable` (design language; UX review, hierarchy, layout, typography, color,
  motion, UX copy, accessibility, responsive, edge cases, DESIGN.md/tokens)
- A Superpowers session went wrong → `diagnosing-superpowers`

## Website build phases (1-10)

Superpowers itself covers phases 1, 2, 5, 6, 7, 8, 9. Phases 3, 4, and 10 are NOT
covered by Superpowers — they come from the other installed skills listed below.

| Phase | Stage | Load |
|---|---|---|
| 1-2 | Intent + brainstorming | `product-marketing` first on any new product (writes `.agents/product-marketing.md`: positioning, ICP, brand voice — every marketing skill reads it), `brainstorming` (Superpowers) — mandatory before any build, `grilling` stress-tests the design tree in rounds of numbered questions before it locks, then `to-spec` to publish the spec |
| 3 | Visualize (mockup, wireframe, variants) | `site-architecture` (IA: page hierarchy, navigation, URL structure, internal linking) and `customer-research` (research inputs) before drawing anything, then `brainstorming` visual companion, `impeccable shape` (plan UX/UI before writing code), `impeccable live` / `impeccable generate` (browser variant picker), `prototype` (several live variants behind a picker), `break-ui` (worst-case data), `animation-vocabulary` (naming a motion effect) |
| 4 | Visual design | `impeccable` (design language; commands: `critique` = heuristic UX review, `audit` = a11y/perf/responsive, `polish`, `layout`, `typeset`, `colorize`, `animate`, `clarify` = UX copy, `harden`, `adapt`, `onboard`, `distill`, `bolder`, `quieter`, `delight`, `overdrive`, `optimize`, `document` = DESIGN.md, `extract` = tokens), `web-design-guidelines` (audit against Vercel's Web Interface Guidelines: design, accessibility, UX), `onboarding` (first-run flows, empty states, activation), `signup` (signup/registration/trial flow UX), `emil-design-eng`, `apple-design`, `antislop` + its companions (always load the core `antislop` together with the ones that apply), `pick-ui-library`, `mobile-native`, `ask-sonner`, `animate` / `animate-expo`, `animation-performance`, `improve-animations`, `review-animations`, `find-animation-opportunities`, `copywriting`, `cro` |
| 5 | Technical planning | `writing-plans` (Superpowers) |
| 6 | Environment setup | `using-git-worktrees` (Superpowers) |
| 7 | Implementation / build | `test-driven-development` + `executing-plans` (or `subagent-driven-development`) |
| 8 | Testing / QA | `test-driven-development`, `systematic-debugging` on any failure, `verification-before-completion` before claiming success, plus `impeccable detect --json <changed targets>` for the 59 mechanical design/a11y/slop checks, and `webapp-testing` (Playwright runs of the real flows) |
| 9 | Review + merge/PR | `requesting-code-review`, `receiving-code-review`, `finishing-a-development-branch` |
| 10 | Deploy + monitoring | No deploy skill is installed — use the project's own tooling (CI/CD, Vercel/Netlify/hosting) and ask before deploying. `ab-testing` covers planning experiments once the site is live. |

Note on phases 1-2: `brainstorming` and `grilling` are different tools, not substitutes.
`brainstorming` draws intent out of an open conversation, one question per message.
`grilling` interrogates a plan or design that already exists: it maps a design tree, asks
the whole frontier in one round (numbered questions, each with a recommended answer), and
is finished only when the frontier is empty. Use `grilling` for design reviews,
architecture validation, and pre-implementation vetting — after `brainstorming`, before
`writing-plans`. Do not run both at once. Finding facts is the agent's job (dispatch a
subagent; in the VS Code extension, look them up inline); the decisions are the human's.

Note on the foundation docs: `product-marketing` writes `.agents/product-marketing.md` in
the project, and `site-architecture`, `customer-research`, `cro`, `onboarding` and `signup`
read that file before asking questions — so create it early, not last. `impeccable init`
separately writes PRODUCT.md for design context. `to-spec` never auto-triggers (explicit
invocation only) and publishes to the project issue tracker, so it needs
`/setup-matt-pocock-skills` to have been run first.

Notes on phases 3-4:

- `prototype` and `pick-ui-library` only run when explicitly invoked — they never
  self-trigger. Call them by name when the human partner asks for design variants or
  a library choice.
- `impeccable` is one skill with 24 sub-commands (see the table above). On Windows run
  `~/.agents/skills/impeccable/scripts/impeccable.cmd context` once per session before
  using it; the launcher ships its own binary, no Node needed. Its `animate` command is
  the animation workflow — do NOT install the separate `animate` skill from the same
  repo, the name collides with the installed `animate` from `emilkowalski/skills`.
- `antislop` is an always-on filter: its own description says "Load always to stop
  generic AI slop". Load the core `antislop` for any UI, copy, or code output, plus
  the companion that matches the concern (`antislop-ui`, `antislop-human` for
  contrast/keyboard/focus, `antislop-layoutmobile`, `antislop-copywriting`,
  `antislop-code`).
- Phase 3 and 4 are advisory: they inform how the UI is built, but the HARD-GATE in
  `brainstorming` (no product code before the design is approved) still applies.
- If a phase-3 or phase-4 skill conflicts with `antislop`, `antislop` wins on generic
  AI-slop output; the specific design skill wins on its own domain.

## Design references (award-level work)

The human often supplies references: awwwards.com, godly.website, land-book.com, a live
site URL, or screenshots. A reference is the brief's visual authority, never decoration.

**How they are handed over (best first):**

1. Screenshots pasted into chat, one per section (hero, grid, footer) — not one long
   full-page capture.
2. Files in the project's `references/` folder plus `references.md` (one entry per
   reference: URL, what to steal, what to reject, the mechanism in one sentence).
3. The live site's own URL — never the award page. Awwwards/gallery pages are JS-heavy
   listings that describe a site; they are not the design. Ask for the live URL instead.

**How to consume one:**

1. Read principles, not pixels: grid and asymmetry, type scale and ratio, spacing rhythm,
   color roles, depth (shadow/blur/layering), motion (what moves, why, how it
   interrupts), and the one idea that makes the page memorable. Name that idea.
2. Never copy a reference wholesale. Extract the mechanism, then re-derive it for this
   project's content, audience, and brand. If the brief pins an aesthetic, the brief wins.
3. Persist what was learned so later pages match: `references/references.md`, `DESIGN.md`
   (via `impeccable document` — type scale, spacing, radii, motion curves, color roles),
   and `.agents/product-marketing.md` for positioning and voice.
4. Build order for reference-driven work: `impeccable shape` (plan the surface before
   code) → implement → `impeccable critique` (heuristic review) → `impeccable audit`
   (a11y/perf/responsive) → `impeccable detect --json` → `impeccable polish`.
5. Motion taken from a reference: name it with `animation-vocabulary`, build it with
   `animate`, keep it in the frame budget with `animation-performance`.
6. Load `antislop` + `antislop-ui` on every reference-driven build. A centered hero,
   three feature cards, and stock purple gradients are the failure mode here.

Sources worth naming: awwwards.com, godly.website, land-book.com, minimal.gallery,
siteinspire.com, mobbin.com (mobile), lusion.co — and the live sites behind the awards,
not the award pages. Note: static HTML/CSS can still reach this level (GSAP, Lenis and
scroll-driven motion all work from a CDN); there is no installed skill for advanced
scroll-driven animation, so treat that as manual work.

## Tool mapping

Superpowers skills are written for Claude Code. Translate tool names to this harness:

- "Invoke a skill" / "Skill tool" → Cline's `skills` tool (pass the skill name)
- "Task tool" / subagent → Cline's `spawn_agent` tool (Cline CLI and Desktop only;
  the VS Code and JetBrains extensions have no subagents — use `executing-plans` and
  do the work inline in this session instead)
- "Read / Write / Edit files" → Cline's file tools (e.g. `read_files`, `editor`)
- "Run a shell command" → Cline's command tool (`run_commands`)
- "TodoWrite" → Cline's plan/todo tracking; if none is available, keep the checklist
  in a markdown file in the project

Skill files live at `.agents/skills/<skill-name>/SKILL.md` in a project, or
`~/.agents/skills/<skill-name>/SKILL.md` when installed globally, with bundled
`references/`, `docs/`, `scripts/`, and `templates/` folders next to them.

User instructions (this file, project rules, direct requests) take precedence over
skills, which in turn override default behavior.
