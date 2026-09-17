#!/usr/bin/env bash
cd "$(dirname "$0")"
set -e

echo "=== amendoaLand: instalacao completa ==="
echo

echo ">>> Etapa 1/2: instalador do illogical-impulse"
./setup install "$@"

echo
echo ">>> Etapa 2/2: setup pessoal"
./setup-amendoa.sh

echo
echo "=== Tudo pronto ==="
