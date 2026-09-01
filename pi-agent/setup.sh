#!/usr/bin/env bash
# Run on a new laptop after cloning dotfiles.
# Requires: TAVILY_API_KEY exported in your shell (read by web-search.json at runtime)
set -euo pipefail
DEST="$HOME/.pi/agent"
SRC="$(cd "$(dirname "$0")" && pwd)"

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
