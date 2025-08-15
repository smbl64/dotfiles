#!/bin/bash
set -euo pipefail

ollama ls | awk '{print $1}' | grep -v NAME | xargs -n 1 ollama pull
