#!/bin/sh

echo "[Entrypoint] Running setup before main command..."
echo "[Entrypoint] Working directory: $(pwd)"
echo "[Entrypoint] Node version: $(node -v)"
echo "[Entrypoint] NPM version: $(npm -v)"
echo "[Entrypoint] Installing dependencies..."
npm install
INSTALL_STATUS=$?
echo "[Entrypoint] npm install exited with status $INSTALL_STATUS"

echo "[Entrypoint] Executing: $@"
exec "$@"
