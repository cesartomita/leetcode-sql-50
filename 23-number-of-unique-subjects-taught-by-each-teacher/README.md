## 2356. Number of Unique Subjects Taught by Each Teacher

**Difficulty:** Easy

### Table: Teacher

| Column Name | Type |
|-------------|------|
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |

- `(subject_id, dept_id)` is the primary key (combination of columns with unique values).  
- Each row indicates that the teacher with `teacher_id` teaches the subject `subject_id` in the department `dept_id`.

### Problem

Write a solution to calculate the **number of unique subjects** each teacher teaches in the university.  

Return the result table in any order.

### Example 1

**Input**

Teacher table:

| teacher_id | subject_id | dept_id |
|------------|------------|---------|
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |

**Output**

| teacher_id | cnt |
|------------|-----|
| 1          | 2   |
| 2          | 4   |

**Explanation**

- **Teacher 1**  
  - Teaches subject 2 in departments 3 and 4 → counts as 1 unique subject.  
  - Teaches subject 3 in department 3 → counts as 1 unique subject.  

- **Teacher 2**  
  - Teaches subject 1 in department 1 → counts as 1 unique subject.  
  - Teaches subject 2 in department 1 → counts as 1 unique subject.  
  - Teaches subject 3 in department 1 → counts as 1 unique subject.  
  - Teaches subject 4 in department 1 → counts as 1 unique subject.  