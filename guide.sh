#!/usr/bin/env bash
set -euo pipefail

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
BOLD='\033[1m'

show_help() {
  cat <<'EOF'
DannLearn Guide

Usage:
  ./guide.sh
  ./guide.sh commands
  ./guide.sh status
  ./guide.sh upstream

Common flow:
  1. /new-subject Biology
  2. Put files in Subjects/Biology/resources/raw/
  3. /process-resource Biology <resource>
  4. /make-reviewer Biology <topic> -quote "optional learner note"
  5. /make-quiz Biology <topic>
  6. /make-flashcards Biology <topic>
  7. /practice-set Biology <topic>
EOF
}

show_commands() {
  cat <<'EOF'
DannLearn Commands

Help:
  /help-dannlearn
  /ask-command <intent>
  /make-command <description>

Subjects:
  /new-subject <name>
  /list-subjects
  /subject-status [subject]

Resources and reviewers:
  /process-resource <subject> <resource>
  /make-reviewer <subject> [topic-or-resource] [-quote "..."]
  /reviewer-update <subject> [reviewer]
  /reviewer-check <subject> [reviewer]
  /reviewer-polish <subject> [reviewer]

Practice:
  /make-quiz <subject> [topic]
  /make-flashcards <subject> [topic]
  /practice-set <subject> [topic]

Upstream:
  /adopt-dannlearn [--force]
  /update-dannlearn [--init]
  /sync-upstream [path]
  /sync-to-upstream [path|--dry-run]
EOF
}

show_status() {
  echo -e "${BOLD}Git remotes${NC}"
  git remote -v 2>/dev/null || true
  echo ""

  echo -e "${BOLD}DannLearn anchor${NC}"
  if [ -f dannlearn.json ]; then
    cat dannlearn.json
  else
    echo "No dannlearn.json found."
  fi
  echo ""

  echo -e "${BOLD}Subjects${NC}"
  if [ -d Subjects ]; then
    subjects=$(find Subjects -maxdepth 1 -mindepth 1 -type d | sort)
    if [ -n "$subjects" ]; then
      printf '%s\n' "$subjects" | sed 's#^#- #'
    else
      echo "No subject folders yet. Run /new-subject <name>."
    fi
  else
    echo "No Subjects folder found."
  fi
}

show_upstream() {
  local origin_url=""
  local upstream_url=""

  origin_url=$(git remote get-url origin 2>/dev/null || true)
  upstream_url=$(git remote get-url upstream 2>/dev/null || true)

  echo "DannLearn Remote Setup"
  echo ""
  echo "origin:   ${origin_url:-missing}"
  echo "upstream: ${upstream_url:-missing}"
  echo ""

  if [ -z "$origin_url" ]; then
    echo "Action required: create a private personal repository before adding Subjects/ content."
    echo "Example: gh repo create my-dannlearn --private --source=. --remote=origin"
  elif [ "$origin_url" = "$upstream_url" ]; then
    echo "Action required: origin and upstream point to the same repository."
    echo "origin must be your private learning repository."
  else
    echo "Ready: keep Subjects/ and private resources on origin."
    echo "Use /sync-upstream for selected starter updates."
    echo "Use /sync-to-upstream for generic starter improvements only."
  fi
}

case "${1:-help}" in
  help|--help|-h) show_help ;;
  commands) show_commands ;;
  status) show_status ;;
  upstream) show_upstream ;;
  *)
    echo -e "${YELLOW}Unknown guide command: $1${NC}"
    echo ""
    show_help
    exit 1
    ;;
esac
