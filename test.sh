#!/usr/bin/env bash
set -e

FLAKE_DIR="$(cd "$(dirname "$0")" && pwd)"
HOST="${1:-$(hostname)}"

sudo nixos-rebuild test --flake "${FLAKE_DIR}#${HOST}"
