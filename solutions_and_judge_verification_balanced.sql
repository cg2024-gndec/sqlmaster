-- =================================================================
-- SQL MASTERS: PARTICIPANT SOLUTIONS & JUDGE VERIFICATION SCRIPT
-- (Balanced Edition — 40 Researchers, 120 Logs, 87 Transfers)
-- =================================================================
SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------------------
-- LEVEL 1 SOLUTIONS (Database: level1_db — Starts with 40 rows)
-- -----------------------------------------------------------------
USE level1_db;

-- Question 1.1: Delete commercial medical thefts (22 rows deleted)
DELETE FROM researchers WHERE sample_type IN ('vaccine', 'insulin', 'antibiotics');

-- Question 1.2: Delete Day shift researchers (10 rows deleted)
DELETE FROM researchers WHERE shift = 'Day';

-- Question 1.3: View remaining 8 suspects to get Clue #1
SELECT * FROM researchers;
-- CLUE #1 FOR LEVEL 2: lab_division = 'Neuro_Wing' (8 rows survive: IDs 3, 6, 7, 9, 11, 18, 24, 33)


-- -----------------------------------------------------------------
-- LEVEL 2 SOLUTIONS (Database: level2_db — Starts with 40 researchers & 120 scrambled logs)
-- -----------------------------------------------------------------
USE level2_db;

-- Question 2.1: Keep only suspects from 'Neuro_Wing' (30 rows deleted, 10 remain)
DELETE FROM researchers WHERE lab_division != 'Neuro_Wing';

-- Question 2.2: Find suspects who accessed nodes in more than 1 city
SELECT a.researcher_id, COUNT(DISTINCT s.city) AS cities
FROM access_logs a
JOIN server_nodes s ON a.node_id = s.node_id
GROUP BY a.researcher_id
HAVING COUNT(DISTINCT s.city) > 1;
-- Returns 7 researcher_ids: 3, 6, 13, 18, 23, 24, 33

-- Question 2.3: Delete those multi-city suspects and reveal Clue #2
DELETE FROM researchers
WHERE researcher_id IN (
    SELECT a.researcher_id
    FROM access_logs a
    JOIN server_nodes s ON a.node_id = s.node_id
    GROUP BY a.researcher_id
    HAVING COUNT(DISTINCT s.city) > 1
);

SELECT * FROM researchers;
-- CLUE #2 FOR LEVEL 3: clearance_code = 'HELIX_07' (3 rows survive: IDs 7, 9, 11)


-- -----------------------------------------------------------------
-- LEVEL 3 SOLUTIONS (Database: level3_db — Starts with 40 researchers & 87 scrambled transfers)
-- -----------------------------------------------------------------
USE level3_db;

-- Question 3.1: Keep only suspects with clearance_code = 'HELIX_07' (33 rows deleted, 7 remain)
DELETE FROM researchers WHERE clearance_code != 'HELIX_07';

-- Question 3.2: Find researcher whose transfer_size from a single unit > max_capacity
SELECT dt.researcher_id, dt.transfer_size, su.max_capacity
FROM data_transfers dt
JOIN storage_units su ON dt.unit_id = su.unit_id
WHERE dt.transfer_size > su.max_capacity;
-- Returns researcher_id: 7 (850 TB transfer on Unit 205 > 390 TB max_capacity)

-- Question 3.3: Delete everyone except that researcher and reveal final winner
DELETE FROM researchers
WHERE researcher_id NOT IN (
    SELECT dt.researcher_id
    FROM data_transfers dt
    JOIN storage_units su ON dt.unit_id = su.unit_id
    WHERE dt.transfer_size > su.max_capacity
);

SELECT * FROM researchers;
-- FINAL WINNER OUTPUT: researcher_id = 7, name = 'Dr. Kabir'


-- -----------------------------------------------------------------
-- JUDGE INSTANT VERIFICATION QUERY (Run to check all 3 levels at once)
-- -----------------------------------------------------------------
SELECT
    (SELECT IF(COUNT(*) = 8 AND COUNT(DISTINCT lab_division) = 1 AND MAX(lab_division) = 'Neuro_Wing', 'PASS (8 rows)', 'FAIL') FROM level1_db.researchers) AS Level_1_Status,
    (SELECT IF(COUNT(*) = 3 AND COUNT(DISTINCT clearance_code) = 1 AND MAX(clearance_code) = 'HELIX_07', 'PASS (3 rows)', 'FAIL') FROM level2_db.researchers) AS Level_2_Status,
    (SELECT IF(COUNT(*) = 1 AND MAX(name) = 'Dr. Kabir', 'WINNER! (Dr. Kabir)', 'INCOMPLETE') FROM level3_db.researchers) AS Level_3_Final_Verdict;
