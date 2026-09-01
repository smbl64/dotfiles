#!/usr/bin/env bash
# Run on a new laptop after cloning dotfiles.
set -euo pipefail
DEST="$HOME/.pi/agent"
SRC="$(cd "$(dirname "$0")" && pwd)"

# required env vars (read at runtime by the config files)
for var in TAVILY_API_KEY; do
  if [ -n "${!var:-}" ]; then
    echo "✓ $var is set"
  else
    echo "! $var is not set — define it in your shell for web search to work"
  fi
done

# skills (public repos)
mkdir -p "$DEST/skills"
git clone --depth 1 https://github.com/samber/cc-skills-golang.git "$DEST/skills/cc-skills-golang"
git clone --depth 1 https://github.com/hardikpandya/stop-slop.git "$DEST/skills/stop-slop"

# symlinks
for f in settings.json models.json mcp.json web-search.json pi-starship.toml extensions; do
  rm -rf "$DEST/$f"
  ln -s "$SRC/$f" "$DEST/$f"
done

echo "done. pi packages from settings.json install on first run."
