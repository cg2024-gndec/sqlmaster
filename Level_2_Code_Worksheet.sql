-- ============================================================================
-- SQL MASTERS | LEVEL 2 WORKSHEET: NETWORK TRACES
-- Database: level2_db
-- Tables:
--   1. researchers (researcher_id, name, lab_division, clearance_code)
--   2. server_nodes (node_id, city)
--   3. access_logs (log_id, researcher_id, node_id)
-- ============================================================================

SET SQL_SAFE_UPDATES = 0;
USE level2_db;

-- Enter your Clue from Level 1 (lab_division): _______________________________

-- ----------------------------------------------------------------------------
-- Question 2.1 (Use Level 1 Clue):
-- DELETE all entries from the table `researchers` whose `lab_division` does
-- NOT match the `lab_division` clue you uncovered in Level 1.
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- ----------------------------------------------------------------------------
-- Question 2.2:
-- Write a SELECT query joining `access_logs` and `server_nodes`, grouping by
-- `researcher_id`, to find the suspects who have accessed server nodes in
-- MORE THAN ONE `city` (HAVING COUNT(DISTINCT city) > 1).
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- ----------------------------------------------------------------------------
-- Question 2.3 (Clue for Level 3):
-- DELETE all entries from the table `researchers` for suspects who accessed
-- server nodes in more than one `city`. Then run `SELECT * FROM researchers;`
-- to view the three remaining rows and note down their common `clearance_code`!
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- YOUR CLUE FOR LEVEL 3 (clearance_code): ____________________________________
