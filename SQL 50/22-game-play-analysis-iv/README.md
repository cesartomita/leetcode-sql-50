## 550. Game Play Analysis IV

**Difficulty:** Medium

### Table: Activity

| Column Name  | Type |
|--------------|------|
| player_id    | int  |
| device_id    | int  |
| event_date   | date |
| games_played | int  |

- `(player_id, event_date)` is the primary key (combination of columns with unique values).
- This table shows the activity of players in some games.
- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on a given day using some device.

### Problem

Write a solution to report the **fraction of players** who logged in again on the **day immediately after** the day they first logged in.

In other words:

- Find each player's **first login date**.
- Check whether the player logged in again on the **next day**.
- Divide the number of such players by the total number of players.
- Round the result to **2 decimal places**.

### Example 1

**Input**

Activity table:

| player_id | device_id | event_date | games_played |
|------------|------------|------------|--------------|
| 1          | 2          | 2016-03-01 | 5            |
| 1          | 2          | 2016-03-02 | 6            |
| 2          | 3          | 2017-06-25 | 1            |
| 3          | 1          | 2016-03-02 | 0            |
| 3          | 4          | 2018-07-03 | 5            |

**Output**

| fraction |
|-----------|
| 0.33      |

**Explanation**

- Player 1 logged in on `2016-03-01` and again on `2016-03-02` → qualifies.
- Player 2 logged in only once → does not qualify.
- Player 3 did not log in the day after their first login → does not qualify.

So, 1 out of 3 players qualifies.

**Result:** `1 / 3 = 0.33`
