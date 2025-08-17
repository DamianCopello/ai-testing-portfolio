# AI Testing Portfolio

A single repository tracking my journey into AI/ML testing, organized by **levels**.

## Progress
- [x] **Level 1 — API Smoke Tests (Robot Framework)**
- [ ] Level 2 — Project structure, variables & reusable keywords
- [ ] Level 3 — Auth & environments (tokens, .env, secrets)
- [ ] Level 4 — Basic model/LLM checks (latency, availability, guardrails)
- [ ] Level 5 — Quality evals for AI output (baselines, heuristics)

## How this repo is organized
- `level-01/` — API smoke tests (finished)
- `level-02/` — (coming soon)
- `level-03/` — (coming soon)

## How to run a level locally (general)
1. `cd level-XX`
2. `pip install -r requirements.txt`
3. `robot -d results *.robot`
4. Open `results/report.html`

Each level folder has its own README with exact steps.
