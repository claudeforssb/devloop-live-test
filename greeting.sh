#!/bin/sh
# Base feature (pre-existing). Prints a greeting for an optional NAME argument,
# defaulting to "dev-loop" when none is given.
name=${1:-dev-loop}
echo "Hello, ${name}!"
