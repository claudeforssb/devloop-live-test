#!/bin/sh
# ACCEPTANCE arm of the dev-loop merge gate (.devloop.json) — pure shell, no toolchain.
# Encodes the acceptance criteria for "greeting.sh: support an optional NAME argument".
# Emits one `PASS: <name>` / `FAIL: <name>` line per criterion; exits non-zero on any failure.

fail=0

# Criterion 1: `sh greeting.sh Ada` prints exactly "Hello, Ada!" and exits 0.
named_out=$(sh greeting.sh Ada 2>&1)
named_status=$?
if [ "$named_status" -eq 0 ] && [ "$named_out" = "Hello, Ada!" ]; then
  echo "PASS: greeting_named_argument"
else
  echo "FAIL: greeting_named_argument"
  fail=1
fi

# Criterion 2: `sh greeting.sh` with no argument still prints exactly "Hello, dev-loop!" (default unchanged) and exits 0.
default_out=$(sh greeting.sh 2>&1)
default_status=$?
if [ "$default_status" -eq 0 ] && [ "$default_out" = "Hello, dev-loop!" ]; then
  echo "PASS: greeting_default_unchanged"
else
  echo "FAIL: greeting_default_unchanged"
  fail=1
fi

# Criterion 3: the existing suite (`sh run-suite.sh`) still passes — no regression.
sh run-suite.sh >/dev/null 2>&1
suite_status=$?
if [ "$suite_status" -eq 0 ]; then
  echo "PASS: suite_no_regression"
else
  echo "FAIL: suite_no_regression"
  fail=1
fi

exit "$fail"
