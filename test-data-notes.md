# Test Data Notes

All records are synthetic and use the reserved `.test` email domain.

1. Run `schema.sql` in a local PostgreSQL database.
2. Run `validation_queries.sql`.
3. Query 1 should return order 5002: its stored total is deliberately different from its line-item sum.
4. Query 2 should return no rows for the supplied sample data.
5. Modify a local copy to practice zero-stock, missing-line-item and duplicate-value checks.

The intentional mismatch is seeded test data for validating reconciliation logic, not a claim about a real application.
