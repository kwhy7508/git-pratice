#!/usr/bin/env bash
set -euo pipefail

# --- Configure your identity once (if not set yet) ---
git config user.name "${GIT_USER_NAME:-Your Name}"
git config user.email "${GIT_USER_EMAIL:-you@example.com}"

# --- Initialize repository ---
git init
git branch -M main

# --- Commit #1: initial ---
git add .
git commit -m "chore: initial project scaffold"

# --- Commit #2: edit notes ---
echo "- Practicing commit 2 on $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> notes.md
git add notes.md
git commit -m "docs: add practice note (#2)"

# --- Commit #3: add utils file ---
echo 'def add(a, b): return a + b' > utils.py
git add utils.py
git commit -m "feat: add utils.add (#3)"

# --- Commit #4: update app.py to use utils ---
echo '' >> app.py
echo 'from utils import add' >> app.py
echo 'print("2 + 3 =", add(2, 3))' >> app.py
git add app.py
git commit -m "feat: app prints 2+3 using utils (#4)"

# --- Commit #5: touch data ---
echo "commit 5 at $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> data/sample.txt
git add data/sample.txt
git commit -m "data: append timestamp (#5)"

# --- Add remote and push ---
# Replace <YOUR_GITHUB_ID> below. Repo **must** be named git-practice and public.
git remote add origin https://github.com/<YOUR_GITHUB_ID>/git-practice.git

# If GitHub asks for a password, use your **Personal Access Token**.
# DO NOT paste tokens into files or commit them.
git push -u origin main

echo "Done. Now submit: https://github.com/<YOUR_GITHUB_ID>/git-practice"
