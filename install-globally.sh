#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

exec npx --yes skills@latest add "$repo_dir" --global --skill '*' --yes "$@"
