-- ============================================================================
-- SQL MASTERS | LEVEL 3 WORKSHEET: QUANTUM ANOMALY
-- Database: level3_db
-- Tables:
--   1. researchers (researcher_id, name, clearance_code)
--   2. storage_units (unit_id, unit_name, max_capacity)
--   3. data_transfers (transfer_id, researcher_id, unit_id, transfer_size)
-- ============================================================================

SET SQL_SAFE_UPDATES = 0;
USE level3_db;

-- Enter your Clue from Level 2 (clearance_code): _____________________________

-- ----------------------------------------------------------------------------
-- Question 3.1 (Use Level 2 Clue):
-- DELETE all entries from the table `researchers` whose `clearance_code` does
-- NOT match the `clearance_code` clue you uncovered in Level 2.
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- ----------------------------------------------------------------------------
-- Question 3.2:
-- Write a SELECT query joining `data_transfers` and `storage_units` to find
-- the `researcher_id` whose `transfer_size` from a single storage unit
-- strictly exceeds that unit's `max_capacity` (WHERE transfer_size > max_capacity).
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- ----------------------------------------------------------------------------
-- Question 3.3 (Final Winner Answer):
-- DELETE all entries from the table `researchers` EXCEPT the researcher whose
-- `transfer_size` from a single storage unit exceeds that unit's `max_capacity`.
-- Run `SELECT * FROM researchers;` to reveal the final surviving name!
-- Write your SQL code below:
-- ----------------------------------------------------------------------------





-- FINAL WINNER (researcher_id & name): _______________________________________
