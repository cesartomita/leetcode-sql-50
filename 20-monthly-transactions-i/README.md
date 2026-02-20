## 1193. Monthly Transactions I

**Difficulty:** Medium

### Table: Transactions

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| country     | varchar |
| state       | enum    |
| amount      | int     |
| trans_date  | date    |

- `id` is the primary key of this table.
- The table contains information about incoming transactions.
- The `state` column is an enum of type **["approved", "declined"]**.

### Problem

Write an SQL query to find, for each **month** and **country**:

- the number of transactions (`trans_count`)
- the number of approved transactions (`approved_count`)
- the total amount of all transactions (`trans_total_amount`)
- the total amount of approved transactions (`approved_total_amount`)

Return the result table in any order.

### Example 1

**Input**

Transactions table:

| id  | country | state    | amount | trans_date |
|-----|---------|----------|--------|------------|
| 121 | US      | approved | 1000   | 2018-12-18 |
| 122 | US      | declined | 2000   | 2018-12-19 |
| 123 | US      | approved | 2000   | 2019-01-01 |
| 124 | DE      | approved | 2000   | 2019-01-07 |

**Output**

| month   | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
|---------|---------|-------------|----------------|--------------------|-----------------------|
| 2018-12 | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01 | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01 | DE      | 1           | 1              | 2000               | 2000                  |