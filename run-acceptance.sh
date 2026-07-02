#!/bin/sh
# ACCEPTANCE arm of the dev-loop merge gate (.devloop.json) — pure shell, no toolchain.
# Encodes the acceptance criteria for "Add a farewell.sh command matching greeting.sh".
# Emits one `PASS: <name>` / `FAIL: <name>` line per criterion; exits non-zero on any failure.

fail=0

# Criterion 1: farewell.sh exists at the repo root and is executable.
if [ -f farewell.sh ] && [ -x farewell.sh ]; then
  echo "PASS: farewell_exists_executable"
else
  echo "FAIL: farewell_exists_executable"
  fail=1
fi

# Criterion 2: `sh farewell.sh` prints exactly "Goodbye, dev-loop!" and exits 0.
farewell_out=$(sh farewell.sh 2>&1)
farewell_status=$?
if [ "$farewell_status" -eq 0 ] && [ "$farewell_out" = "Goodbye, dev-loop!" ]; then
  echo "PASS: farewell_output"
else
  echo "FAIL: farewell_output"
  fail=1
fi

# Criterion 3: `sh greeting.sh` still prints "Hello, dev-loop!" and exits 0 (no regression).
greeting_out=$(sh greeting.sh 2>&1)
greeting_status=$?
if [ "$greeting_status" -eq 0 ] && [ "$greeting_out" = "Hello, dev-loop!" ]; then
  echo "PASS: existing_greeting"
else
  echo "FAIL: existing_greeting"
  fail=1
fi

exit "$fail"
