#!/usr/bin/env bash
set -euo pipefail

# DannLearn Installer
# Usage:
#   curl -sSL https://raw.githubusercontent.com/Danncode10/DannLearn/main/install.sh | bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'
BOLD='\033[1m'

STARTER_REPO="${DANNLEARN_REPO:-https://github.com/Danncode10/DannLearn.git}"
DEFAULT_NAME="my-dannlearn"

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed 's/[[:space:]_]/-/g' \
    | sed 's/[^a-z0-9-]//g' \
    | sed 's/-\{2,\}/-/g' \
    | sed 's/^-//' \
    | sed 's/-$//'
}

ask() {
  local prompt="$1"
  local default="$2"
  local value=""

  if [ -t 0 ] && [ -r /dev/tty ]; then
    read -r -p "$(printf "%b" "${BOLD}${prompt}${NC} [${default}]: ")" value < /dev/tty
  fi

  printf '%s' "${value:-$default}"
}

echo -e "${BLUE}${BOLD}"
cat <<'ART'
  ____                  _                          _
 |  _ \  __ _ _ __  __ | |    ___  __ _ _ __ _ __
 | | | |/ _` | '_ \/ _` |   / _ \/ _` | '__| '_ \
 | |_| | (_| | | | | (_| |  |  __/ (_| | |  | | | |
 |____/ \__,_|_| |_|\__,_|   \___|\__,_|_|  |_| |_|
ART
echo -e "${NC}"
echo -e "${CYAN}AI-assisted study workspace starter${NC}\n"

for cmd in git sed tr; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo -e "${RED}Missing required command: ${cmd}${NC}"
    exit 1
  fi
done

PROJECT_NAME=$(ask "Enter your learning repo name" "$DEFAULT_NAME")
PROJECT_SLUG=$(slugify "$PROJECT_NAME")

if [ -z "$PROJECT_SLUG" ]; then
  echo -e "${RED}Could not create a safe folder name from '${PROJECT_NAME}'.${NC}"
  exit 1
fi

TARGET_DIR="$PWD/$PROJECT_SLUG"

if [ -e "$TARGET_DIR" ]; then
  echo -e "${RED}Directory already exists: ${TARGET_DIR}${NC}"
  echo -e "${YELLOW}Choose another name or move the existing folder first.${NC}"
  exit 1
fi

echo -e "${CYAN}Cloning DannLearn into ./${PROJECT_SLUG}...${NC}"
git clone --depth=1 "$STARTER_REPO" "$TARGET_DIR"
cd "$TARGET_DIR"

UPSTREAM_SHA=$(git rev-parse HEAD)

if git remote get-url origin >/dev/null 2>&1; then
  git remote rename origin upstream
fi

echo -e "${GREEN}upstream -> ${STARTER_REPO}${NC}"

ORIGIN_URL="${DANNLEARN_ORIGIN:-}"
if [ -z "$ORIGIN_URL" ] && command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  CREATE_REPO=$(ask "Create a private GitHub repository named ${PROJECT_SLUG} now? (yes/no)" "yes")
  if [ "$CREATE_REPO" = "yes" ] || [ "$CREATE_REPO" = "y" ]; then
    gh repo create "$PROJECT_SLUG" --private --source=. --remote=origin
    ORIGIN_URL=$(git remote get-url origin)
  fi
fi

if [ -z "$ORIGIN_URL" ] && [ -t 0 ] && [ -r /dev/tty ]; then
  read -r -p "$(printf "%b" "${BOLD}Paste your private GitHub repo URL for origin${NC} [skip]: ")" ORIGIN_URL < /dev/tty
fi

if [ -n "${ORIGIN_URL:-}" ] && ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "$ORIGIN_URL"
fi

if git remote get-url origin >/dev/null 2>&1; then
  ORIGIN_URL=$(git remote get-url origin)
  if [ "$ORIGIN_URL" = "$STARTER_REPO" ]; then
    echo -e "${RED}origin must be your personal learning repo, not DannLearn upstream.${NC}"
    exit 1
  fi
  echo -e "${GREEN}origin -> ${ORIGIN_URL}${NC}"
else
  echo -e "${YELLOW}No private origin configured. Do not add Subjects/ content until you create one.${NC}"
  echo -e "  ${CYAN}gh repo create ${PROJECT_SLUG} --private --source=. --remote=origin${NC}"
fi

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > dannlearn.json <<JSON
{
  "dannlearn_commit": "$UPSTREAM_SHA",
  "synced_at": "$NOW",
  "repo": "$STARTER_REPO",
  "base_branch": "main",
  "dev_branch": "dev"
}
JSON

git add dannlearn.json
git commit -m "chore: anchor DannLearn starter version" >/dev/null 2>&1 || true

if git remote get-url origin >/dev/null 2>&1; then
  git push -u origin main
  echo -e "${GREEN}Private learning repo is ready on origin.${NC}"
fi

chmod +x guide.sh 2>/dev/null || true

echo ""
echo -e "${GREEN}${BOLD}DannLearn workspace ready.${NC}"
echo ""
echo -e "${BOLD}Project:${NC} ./${PROJECT_SLUG}"
echo -e "${BOLD}Anchored to:${NC} ${UPSTREAM_SHA}"
echo ""
echo -e "${BOLD}Next:${NC}"
echo -e "  ${CYAN}cd ${PROJECT_SLUG}${NC}"
echo -e "  ${CYAN}./guide.sh${NC}"
echo -e "  Open Claude Code or Codex and run ${CYAN}/help-dannlearn${NC}"
echo ""
echo -e "${BOLD}Upstream flow:${NC}"
echo -e "  ${CYAN}/update-dannlearn${NC}     check for new starter updates"
echo -e "  ${CYAN}/sync-upstream${NC}        pull selected starter updates"
echo -e "  ${CYAN}/sync-to-upstream${NC}     send generic improvements to DannLearn"
