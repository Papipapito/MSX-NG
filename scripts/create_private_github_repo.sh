#!/usr/bin/env bash
set -euo pipefail

OWNER="Papipapito"
REPO="MSX-NG"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required: https://cli.github.com/" >&2
  exit 1
fi

gh auth status

# Ensure there is at least one commit before gh --source/--push.
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git add .
  if ! git config user.name >/dev/null || ! git config user.email >/dev/null; then
    echo "Git identity is not configured. Set it first:" >&2
    echo "  git config user.name \"Your Name\"" >&2
    echo "  git config user.email \"you@example.com\"" >&2
    exit 1
  fi
  git commit -m "Initial MSX-NG architecture and implementation plan"
fi

if gh repo view "${OWNER}/${REPO}" >/dev/null 2>&1; then
  echo "${OWNER}/${REPO} already exists."
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "https://github.com/${OWNER}/${REPO}.git"
  fi
  git push -u origin main
else
  gh repo create "${OWNER}/${REPO}" --private --source=. --remote=origin --push
  echo "Created and pushed private repository ${OWNER}/${REPO}."
fi
