# Illustrative Defect Reports

> Hypothetical examples to demonstrate reporting format only. They are not claims about defects found in a live application. Reproduce and replace them with your own observations before presenting them as evidence.

## BUG-DEMO-001 — Cart total does not refresh after quantity change
- **Module:** Shopping cart
- **Severity / priority:** Major / High (proposed; assess against actual business impact)
- **Environment:** Fictional example; record real browser, OS, build and environment when reproducing
- **Preconditions:** Cart contains one product priced at 100.00
- **Steps:**
  1. Sign in to the demo application.
  2. Add the product to the cart.
  3. Change quantity from 1 to 2.
  4. Observe item subtotal and cart total.
- **Expected:** Subtotal and total update to reflect quantity 2.
- **Illustrative actual:** Quantity changes to 2 but displayed subtotal remains 100.00 until refresh.
- **Evidence:** Attach screenshot/video only after reproducing.
- **Investigation idea:** Review cart state updates and subtotal recalculation.

## BUG-DEMO-002 — Login error is not announced to assistive technology
- **Module:** Authentication / accessibility
- **Severity / priority:** Minor / Medium (proposed)
- **Steps:**
  1. Submit an invalid password.
  2. Inspect the error announcement with a specified screen reader and browser.
- **Expected:** Error is announced and programmatically associated with the form or relevant field.
- **Illustrative actual:** Error is visible but not announced in the hypothetical screen-reader scenario.
- **Evidence:** Record exact browser, assistive technology and reproducible steps after testing.
- **Investigation idea:** Review live-region semantics and field error associations.

## Defect report quality checklist
- Concise, searchable title
- Environment and build/version
- Deterministic reproduction steps
- Separate expected and actual results
- Severity based on impact; priority based on business urgency
- Genuine screenshots, logs or recordings
- Retest and regression evidence
