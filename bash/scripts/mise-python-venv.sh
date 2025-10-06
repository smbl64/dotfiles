#!/bin/bash

set -euo pipefail

cat << EOF > .mise.toml
[env]
_.python.venv = { path = ".venv", create = true, uv_create_args = ['--seed']}

EOF

mise trust
