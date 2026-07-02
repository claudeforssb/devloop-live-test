#!/bin/sh
# SUITE arm of the dev-loop merge gate (ADR 0003) — pure shell, no language toolchain.
# Emits one `PASS: <name>` / `FAIL: <name>` line per test; adapter parses the green
# set (no-regression arm) and the exit code (suite arm).
echo "PASS: existing_greeting"
exit 0
