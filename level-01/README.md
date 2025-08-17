# Level 1 — API Smoke Tests (Robot Framework)

**Goal:** Prove I can run clean, reliable API smoke tests with Robot Framework:
- Happy paths (status 200, JSON shape, filtering)
- One negative path (404) using `expected_status`

## What’s tested
- `GET /posts/1` → **200**, JSON, keys: `userId`, `id`, `title`, `body` and `id == 1`
- `GET /users` → **200**, list of **10** users, first has `id`, `name`, `email`
- `GET /posts?userId=1` → filter works; **all** items have `userId == 1`
- Negative: unknown path → **404** (with `expected_status=404`)

**Public API:** https://jsonplaceholder.typicode.com

## Files
- `api_smoke.robot` — test suite
- `requirements.txt` — install everything needed
- `images/pass.png` — screenshot of a passing run

## How to run (local)
```bash
pip install -r requirements.txt
robot -d results api_smoke.robot
