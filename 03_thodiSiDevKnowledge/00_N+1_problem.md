# N+1 Query Problem

## Definition

The **N+1 query problem** is a common database performance issue where the application executes:
- **1 query** to fetch a list of records, and then
- **N extra queries** to fetch related data for each record.

So total queries become **N+1** instead of a small fixed number.

---

## Why It Happens

It usually occurs when related data is fetched lazily inside a loop.

```python
users = db.query("SELECT * FROM users")  # 1 query

for user in users:
    posts = db.query(f"SELECT * FROM posts WHERE user_id = {user.id}")
    # Executes once per user -> N additional queries
```

---

## Solutions

### 1) Eager Loading (umbrella approach)

- **JOIN-based loading**
  - Fetch parent + related data in a single query.
  - Best for **1:1** or simple **N:1** relationships.

- **Prefetching / Select-in loading**
  - Fetch parent rows first, then related rows in batched queries.
  - Merge in memory.
  - Best for **1:N** and **N:M** relationships.

### 2) Batch Loading (DataLoader style)

- Useful for polymorphic or complex resolver patterns (e.g., GraphQL).
- Groups many small requests into batched queries.

### 3) Denormalization

- Store some redundant data to reduce join/read cost.
- Use carefully due to write complexity and consistency concerns.

---

## Decision Tree (Quick Reference)

| Scenario | Recommended Approach |
|---|---|
| 1:1 or simple N:1 relationship | JOIN-based eager loading (`select_related`) |
| 1:N or N:M relationship | Prefetch (`prefetch_related` / `selectinload`) |
| Deeply nested relations (3+ levels) | Prefer prefetch strategy |
| Polymorphic relationships | DataLoader / manual batch prefetch |

---

## Rule of Thumb

If query count grows with list size, you likely have an **N+1 problem**.