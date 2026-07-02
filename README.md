# devloop-live-test

Throwaway **public** scratch repo for the FunnelLoop dev-loop **S6 live milestone run**
(real issue -> real PR -> real autonomous gated merge). Public because the dev-loop
workspace clones anonymously by design (no credential ever enters the sandbox).

- `.devloop.json` names the gate commands: `test` (suite arm) + `acceptance`
  (authored by the coding agent during the run).
- `run-suite.sh` is the base suite arm. `greeting.sh` is the pre-existing feature.
- Qualifying issues carry a `## Acceptance criteria` checklist (`- [ ]` bullets).

Not a product; safe to delete/reset at any time.
